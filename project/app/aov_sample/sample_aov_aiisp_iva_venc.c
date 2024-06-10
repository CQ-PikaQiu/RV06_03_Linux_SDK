/*
 * Copyright 2021 Rockchip Electronics Co. LTD
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */
#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif /* End of #ifdef __cplusplus */

#include <assert.h>
#include <errno.h>
#include <fcntl.h>
#include <getopt.h>
#include <pthread.h>
#include <semaphore.h>
#include <signal.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/prctl.h>
#include <time.h>
#include <unistd.h>

#include "font_factory.h"
#include "rtsp_demo.h"
#include "sample_comm.h"
#include "sample_comm_aov.h"
#include "utils.h"

#define VENC_MAIN_CHANNEL 0
#define VI_MAIN_CHANNEL 0
#define VPSS_GROUP_ID 0
#define VPSS_CHNNAL 0
#define VPSS_IVA_CHNNAL_IDX 1
#define RGN_CHANNEL 0

rtsp_demo_handle g_rtsplive = NULL;
static rtsp_session_handle g_rtsp_session;
sem_t g_wakeup_nn_result_semaphore;
RK_S32 g_wakeup_nn_flag = 1;
RK_S32 g_wakeup_enable = 1;
RK_S32 g_multi_frame_enable = 1;
static RK_U32 g_u32BootFrame = 60;
static RK_S32 g_s32AovLoopCount = -1;
static RK_S32 g_enable_save_sd = 1;
static RK_S32 g_max_wakeup_frame_count = 3000;

#define RED_COLOR 0x0000FF
#define BLUE_COLOR 0xFF0000

enum ISP_MODE {
	SINGLE_FRAME_MODE,
	MULTI_FRAME_MODE,
};

typedef struct _rkMpiCtx {
	SAMPLE_VI_CTX_S vi;
	SAMPLE_VPSS_CTX_S vpss;
	SAMPLE_VENC_CTX_S venc;
#ifdef ROCKIVA
	SAMPLE_IVA_CTX_S iva;
#endif
	SAMPLE_RGN_CTX_S rgn[2];
} SAMPLE_MPI_CTX_S;

SAMPLE_MPI_CTX_S *g_mpi_ctx = NULL;
static bool quit = false;
static void sigterm_handler(int sig) {
	fprintf(stderr, "signal %d\n", sig);
	quit = true;
}

static RK_CHAR optstr[] = "?::a::b:w:h:l:o:e:d:D:I:i:L:M:";
static const struct option long_options[] = {
    {"aiq", optional_argument, NULL, 'a'},
    {"bitrate", required_argument, NULL, 'b'},
    {"device_name", required_argument, NULL, 'd'},
    {"width", required_argument, NULL, 'w'},
    {"height", required_argument, NULL, 'h'},
    {"input_bmp_name", required_argument, NULL, 'i'},
    {"output_path", required_argument, NULL, 'o'},
    {"encode", required_argument, NULL, 'e'},
    {"camid", required_argument, NULL, 'I'},
    {"multictx", required_argument, NULL, 'M'},
    {"fps", required_argument, NULL, 'f'},
    {"hdr_mode", required_argument, NULL, 'h' + 'm'},
    {"ae_mode", required_argument, NULL, 'a' + 'm'},
    {"aov_loop_count", required_argument, NULL, 'a' + 'm' + 'c'},
    {"suspend_time", required_argument, NULL, 's' + 't'},
    {"enable_aiisp", required_argument, NULL, 'a' + 'i'},
    {"iva_detect_speed", required_argument, RK_NULL, 'i' + 'd' + 's'},
    {"enable_aov", required_argument, RK_NULL, 'e' + 'a'},
    {"enable_multi_frame", required_argument, RK_NULL, 'e' + 'm' + 'f'},
    {"boot_frame", required_argument, NULL, 'b' + 'f'},
    {"enable_save_sdcard", required_argument, RK_NULL, 'e' + 's'},
    {"max_wakeup_frame_count", required_argument, RK_NULL, 'm' + 'w'},
    {"quick_start", required_argument, NULL, 'q' + 'k' + 's'},
    {"help", optional_argument, NULL, '?'},
    {NULL, 0, NULL, 0},
};

/******************************************************************************
 * function : show usage
 ******************************************************************************/
static void print_usage(const RK_CHAR *name) {
	printf("usage example:\n");
	printf("\t%s -w 1920 -h 1080 -a /etc/iqfiles/ --aov_loop_count 50\n", name);
	printf("\trtsp://xx.xx.xx.xx/live/0, Default OPEN\n");
#ifdef RKAIQ
	printf("\t-a | --aiq: enable aiq with dirpath provided, eg:-a "
	       "/etc/iqfiles/, "
	       "set dirpath empty to using path by default, without this option aiq "
	       "should run in other application\n");
	printf("\t-M | --multictx: switch of multictx in isp, set 0 to disable, set "
	       "1 to enable. Default: 0\n");
#endif
	printf("\t-d | --device_name: set pcDeviceName, eg: /dev/video0 Default "
	       "NULL\n");
	printf("\t-I | --camid: camera ctx id, Default 0\n");
	printf("\t-w | --width: camera with, Default 1920\n");
	printf("\t-h | --height: camera height, Default 1080\n");
	printf("\t-f | --fps: vi framerate. Default: 15\n");
	printf("\t-e | --encode: encode type, Default:h264cbr, Value:h264cbr, "
	       "h264vbr, h264avbr "
	       "h265cbr, h265vbr, h265avbr, mjpegcbr, mjpegvbr\n");
	printf("\t-b | --bitrate: encode bitrate, Default 4096\n");
	printf("\t-i | --input_bmp_name: input file path of logo.bmp, Default NULL\n");
	printf("\t-o | --output_path: encode save file path, Default /data/\n");
	printf("\t--enable_save_sdcard : enable save venc stream to sdcard, default: 1\n");
	printf("\t--ae_mode: set aov ae wakeup mode, 0: MD wakupe: 1: always wakeup, 2: no "
	       "wakeup, Default: 0\n");
	printf("\t--aov_loop_count: set aov wakeup loop count, Default: -1(unlimit)\n");
	printf("\t--suspend_time: set aov suspend time, Default: 1000ms\n");
	printf("\t--enable_aiisp : enable ai isp, 0: close, 1: enable. default: 1\n");
	printf("\t--iva_detect_speed : iva detect framerate. default: 10\n");
	printf("\t--enable_aov : enable aov, 0: close, 1: enable. default: 1\n");
	printf("\t--boot_frame: How long will it take to enter AOV mode after boot, Default: "
	       "60 frames\n");
	printf("\t--enable_multi_frame : Identify whether the humanoid enters multi frame "
	       "mode, 0: close, 1: enable. default: 1\n");
	printf("\t--max_wakeup_frame_count: max frame count running in multi "
	       "frame mode after wakeup by gpio, Default: 3000\n");
	printf("\t--quick_start: quick start stream, Default: 0\n");
}

static RK_S32 aiisp_callback(RK_VOID *pAinrParam, RK_VOID *pPrivateData) {
	if (pAinrParam == RK_NULL) {
		return RK_FAILURE;
	}
	memset(pAinrParam, 0, sizeof(rk_ainr_param));
	SAMPLE_COMM_ISP_GetAINrParams(0, pAinrParam);
	RK_LOGD("aiisp status is %s\n",
	        ((rk_ainr_param *)pAinrParam)->enable ? "enable" : "disabled");
	//((rk_ainr_param *)pAinrParam)->enable = RK_TRUE;
	return RK_SUCCESS;
}

/******************************************************************************
 * function : venc thread
 ******************************************************************************/
static void *venc_get_stream(void *pArgs) {
	SAMPLE_VENC_CTX_S *ctx = (SAMPLE_VENC_CTX_S *)(pArgs);
	RK_S32 s32Ret = RK_FAILURE;
	char name[256] = {0};
	void *pData = RK_NULL;
	RK_S32 loopCount = 0;
	RK_S32 venc_data_size = 0;
	RK_S32 force_flush_to_storage = 0;

	char *venc_data = NULL;
	if (g_enable_save_sd)
		venc_data = (char *)malloc(AOV_STREAM_SIZE_WRITE_TO_SDCARD);
	// 10M form 200 frame

	while (!quit) {
		s32Ret = SAMPLE_COMM_VENC_GetStream(ctx, &pData);
		if (s32Ret == RK_SUCCESS) {
			SAMPLE_COMM_AOV_DumpPtsToTMP(ctx->stFrame.u32Seq,
			                             ctx->stFrame.pstPack->u64PTS, g_u32BootFrame);
			if (g_enable_save_sd) {
				if ((venc_data_size + ctx->stFrame.pstPack->u32Len) <=
				    AOV_STREAM_SIZE_WRITE_TO_SDCARD) {
					if (venc_data_size == 0 &&
					    ctx->stFrame.pstPack->DataType.enH265EType == H265E_NALU_PSLICE) {
						// force idr frame
						RK_LOGI("work round force idr, skip...\n");
					} else {
						memcpy(venc_data + venc_data_size, pData,
						       ctx->stFrame.pstPack->u32Len);
						venc_data_size += ctx->stFrame.pstPack->u32Len;
					}
				} else {
					RK_MPI_VENC_RequestIDR(ctx->s32ChnId, RK_FALSE);
					SAMPLE_COMM_AOV_CopyStreamToSdcard(ctx->s32ChnId, venc_data,
					                                   venc_data_size, pData,
					                                   ctx->stFrame.pstPack->u32Len);
					venc_data_size = 0;
				}
			}

			if (!g_wakeup_enable) {
				PrintStreamDetails(ctx->s32ChnId, ctx->stFrame.pstPack->u32Len);
				rtsp_tx_video(g_rtsp_session, pData, ctx->stFrame.pstPack->u32Len,
				              ctx->stFrame.pstPack->u64PTS);
				rtsp_do_event(g_rtsplive);
			}

			RK_LOGD("chn:%d, loopCount:%d, len:%u, pts:%llu, seq:%u", ctx->s32ChnId,
			        loopCount, ctx->stFrame.pstPack->u32Len, ctx->stFrame.pstPack->u64PTS,
			        ctx->stFrame.u32Seq);

			SAMPLE_COMM_VENC_ReleaseStream(ctx);

			loopCount++;
		}
	}

	if (g_enable_save_sd && venc_data && venc_data_size > 0) {
		SAMPLE_COMM_AOV_CopyStreamToSdcard(ctx->s32ChnId, venc_data, venc_data_size, NULL,
		                                   0);
		venc_data_size = 0;
	}

	if (venc_data)
		free(venc_data);

	return RK_NULL;
}

#ifdef ROCKIVA

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wint-to-pointer-cast"
static RK_S32 draw_rect_from_iva_result() {
	RK_S32 s32Ret = RK_SUCCESS;
	int line_pixel = 2;
	int video_width = g_mpi_ctx->vi.u32Width;
	int video_height = g_mpi_ctx->vi.u32Height;
	RGN_HANDLE RgnHandle = 1;
	RGN_CANVAS_INFO_S stCanvasInfo;
	RockIvaDetectResult *iva_result = NULL;
	RockIvaObjectInfo *objectInfo = NULL;
	struct timespec now;
	iva_result = SAMPLE_COMM_IVA_Pop_Result();
	if (iva_result == NULL) {
		RK_LOGI("empty iva result list...\n");
		// return RK_FAILURE;
	}
	s32Ret = RK_MPI_RGN_GetCanvasInfo(RgnHandle, &stCanvasInfo);
	if (s32Ret != RK_SUCCESS) {
		SAMPLE_COMM_IVA_Release_Result(iva_result);
		RK_LOGE("RK_MPI_RGN_GetCanvasInfo failed with %#x!", s32Ret);
		return s32Ret;
	}

	memset((void *)stCanvasInfo.u64VirAddr, 0,
	       stCanvasInfo.u32VirWidth * stCanvasInfo.u32VirHeight >> 2);
	if (iva_result != NULL) {
		for (int i = 0; i < iva_result->objNum; i++) {
			RK_LOGD("topLeft:[%d,%d], bottomRight:[%d,%d],"
			        "objId is %d, frameId is %d, score is %d, type is %d\n",
			        iva_result->objInfo[i].rect.topLeft.x,
			        iva_result->objInfo[i].rect.topLeft.y,
			        iva_result->objInfo[i].rect.bottomRight.x,
			        iva_result->objInfo[i].rect.bottomRight.y,
			        iva_result->objInfo[i].objId, iva_result->objInfo[i].frameId,
			        iva_result->objInfo[i].score, iva_result->objInfo[i].type);
			int x, y, w, h;
			objectInfo = &iva_result->objInfo[i];
			x = video_width * objectInfo->rect.topLeft.x / 10000;
			y = video_height * objectInfo->rect.topLeft.y / 10000;
			w = video_width *
			    (objectInfo->rect.bottomRight.x - objectInfo->rect.topLeft.x) / 10000;
			h = video_height *
			    (objectInfo->rect.bottomRight.y - objectInfo->rect.topLeft.y) / 10000;
			x = x / 16 * 16;
			y = y / 16 * 16;
			w = (w + 3) / 16 * 16;
			h = (h + 3) / 16 * 16;
			while (x + w + line_pixel >= video_width)
				w -= 8;
			while (y + h + line_pixel >= video_height)
				h -= 8;
			RK_LOGD("draw rect x:%d, y:%d, w:%d, h:%d\n", x, y, w, h);
			if (x >= 0 && y >= 0 && w > 0 && h > 0) {
				if (objectInfo->type == ROCKIVA_OBJECT_TYPE_PERSON) {
					draw_rect_2bpp((RK_U8 *)stCanvasInfo.u64VirAddr,
					               stCanvasInfo.u32VirWidth, stCanvasInfo.u32VirHeight, x,
					               y, w, h, line_pixel, RGN_COLOR_LUT_INDEX_0);
				} else if (objectInfo->type == ROCKIVA_OBJECT_TYPE_FACE) {
					draw_rect_2bpp((RK_U8 *)stCanvasInfo.u64VirAddr,
					               stCanvasInfo.u32VirWidth, stCanvasInfo.u32VirHeight, x,
					               y, w, h, line_pixel, RGN_COLOR_LUT_INDEX_0);
				} else if (objectInfo->type == ROCKIVA_OBJECT_TYPE_VEHICLE) {
					draw_rect_2bpp((RK_U8 *)stCanvasInfo.u64VirAddr,
					               stCanvasInfo.u32VirWidth, stCanvasInfo.u32VirHeight, x,
					               y, w, h, line_pixel, RGN_COLOR_LUT_INDEX_1);
				} else if (objectInfo->type == ROCKIVA_OBJECT_TYPE_NON_VEHICLE) {
					draw_rect_2bpp((RK_U8 *)stCanvasInfo.u64VirAddr,
					               stCanvasInfo.u32VirWidth, stCanvasInfo.u32VirHeight, x,
					               y, w, h, line_pixel, RGN_COLOR_LUT_INDEX_1);
				}
			}
		}

		SAMPLE_COMM_IVA_Release_Result(iva_result);
	}
	s32Ret = RK_MPI_RGN_UpdateCanvas(RgnHandle);
	if (s32Ret != RK_SUCCESS)
		RK_LOGE("RK_MPI_RGN_UpdateCanvas failed with %#x!", s32Ret);
	return s32Ret;
}
#pragma GCC diagnostic pop

static void rkIvaEvent_callback(const RockIvaDetectResult *result,
                                const RockIvaExecuteStatus status, void *userData) {

	if (result->objNum == 0) {
		if (g_wakeup_nn_flag > 0)
			g_wakeup_nn_flag--;
	} else {
		g_wakeup_nn_flag = 5;
	}
	RK_LOGD("RKIVA: objNum is %d, g_wakeup_nn_flag = %d\n", result->objNum,
	        g_wakeup_nn_flag);
	sem_post(&g_wakeup_nn_result_semaphore);

	if (result->objNum == 0)
		return;
	SAMPLE_COMM_IVA_Push_Result(result);
	for (int i = 0; i < result->objNum; i++) {
		RK_LOGI("topLeft:[%d,%d], bottomRight:[%d,%d],"
		        "objId is %d, frameId is %d, score is %d, type is %d\n",
		        result->objInfo[i].rect.topLeft.x, result->objInfo[i].rect.topLeft.y,
		        result->objInfo[i].rect.bottomRight.x,
		        result->objInfo[i].rect.bottomRight.y, result->objInfo[i].objId,
		        result->objInfo[i].frameId, result->objInfo[i].score,
		        result->objInfo[i].type);
	}
}

static void rkIvaFrame_releaseCallBack(const RockIvaReleaseFrames *releaseFrames,
                                       void *userdata) {
	/* when iva handle out of the video frame，this func will be called*/
	RK_S32 s32Ret = RK_SUCCESS;
	for (RK_S32 i = 0; i < releaseFrames->count; i++) {
		if (!releaseFrames->frames[i].extData) {
			RK_LOGE("---------error release frame is null");
			// program_handle_error(__func__, __LINE__);
			continue;
		}
		s32Ret = RK_MPI_VPSS_ReleaseChnFrame(VPSS_GROUP_ID, VPSS_IVA_CHNNAL_IDX,
		                                     releaseFrames->frames[i].extData);
		if (s32Ret != RK_SUCCESS) {
			RK_LOGE("RK_MPI_VI_ReleaseChnFrame failure:%#X", s32Ret);
			// program_handle_error(__func__, __LINE__);
		}
		free(releaseFrames->frames[i].extData);
	}
}

static void *vpss_iva_thread(void *pArgs) {
	prctl(PR_SET_NAME, "vpss_iva_thread");
	SAMPLE_MPI_CTX_S *ctx = (SAMPLE_MPI_CTX_S *)pArgs;
	RK_S32 s32Ret = RK_FAILURE;
	RK_CHAR *pData = RK_NULL;
	RK_S32 s32Fd = 0;
	RockIvaImage ivaImage;
	RK_U32 u32Loopcount = 0;
	RK_U32 u32GetOneFrameTime = 1000 / ctx->iva.u32IvaDetectFrameRate;
	VIDEO_FRAME_INFO_S *stVpssFrame = NULL;
	enum ISP_MODE wakeup_current_mode = MULTI_FRAME_MODE;
	bool is_gpioirq_happened = false;
	RK_S32 wakeup_frame_count = 0;

	sem_init(&g_wakeup_nn_result_semaphore, 0, 0);
	g_wakeup_nn_flag = 1;

	// befor enter AOV
	for (int i = 0; i < g_u32BootFrame; i++) {
		s32Ret = RK_MPI_VPSS_GetChnFrame(ctx->vpss.s32GrpId, VPSS_IVA_CHNNAL_IDX,
		                                 &ctx->vpss.stChnFrameInfos, -1);
		if (s32Ret == RK_SUCCESS) {
			RK_MPI_VPSS_ReleaseChnFrame(ctx->vpss.s32GrpId, VPSS_IVA_CHNNAL_IDX,
			                            &ctx->vpss.stChnFrameInfos);
			u32Loopcount++;
		}
	}

	SAMPLE_COMM_AOV_GetGpioIrqStat(); // ignore previous input events.
	while (!quit) {
		// 1. Check input event to detect weather gpio irq is happened.
		is_gpioirq_happened = SAMPLE_COMM_AOV_GetGpioIrqStat();
		RK_LOGD("is_gpioirq_happened %d", is_gpioirq_happened);

		// 2. Get frame from VPSS and send frame to IVA
		s32Ret = RK_MPI_VPSS_GetChnFrame(ctx->vpss.s32GrpId, VPSS_IVA_CHNNAL_IDX,
		                                 &ctx->vpss.stChnFrameInfos, 2000);
		if (s32Ret != RK_SUCCESS) {
			RK_LOGE("-----RK_MPI_VPSS_GetChnFrame failed %#X", s32Ret);
			continue;
		}
		stVpssFrame = (VIDEO_FRAME_INFO_S *)malloc(sizeof(VIDEO_FRAME_INFO_S));
		if (!stVpssFrame) {
			RK_LOGE("-----error malloc fail for stVpssFrame");
			RK_MPI_VPSS_ReleaseChnFrame(ctx->vpss.s32GrpId, VPSS_IVA_CHNNAL_IDX,
			                            &ctx->vpss.stChnFrameInfos);
			continue;
		}
		memcpy(stVpssFrame, &ctx->vpss.stChnFrameInfos, sizeof(VIDEO_FRAME_INFO_S));
		s32Fd = RK_MPI_MB_Handle2Fd(stVpssFrame->stVFrame.pMbBlk);
		memset(&ivaImage, 0, sizeof(RockIvaImage));
		ivaImage.info.transformMode = ctx->iva.eImageTransform;
		ivaImage.info.width = stVpssFrame->stVFrame.u32Width;
		ivaImage.info.height = stVpssFrame->stVFrame.u32Height;
		ivaImage.info.format = ctx->iva.eImageFormat;
		ivaImage.frameId = u32Loopcount;
		ivaImage.dataAddr = NULL;
		ivaImage.dataPhyAddr = NULL;
		ivaImage.dataFd = s32Fd;
		ivaImage.extData = stVpssFrame;
		s32Ret = ROCKIVA_PushFrame(ctx->iva.ivahandle, &ivaImage, NULL);
		// 3. Wait IVA result callback
		sem_wait(&g_wakeup_nn_result_semaphore);

		if (!g_wakeup_enable) {
			draw_rect_from_iva_result();
			continue;
		}

		if (!g_multi_frame_enable) {
			g_wakeup_nn_flag = 0;
			is_gpioirq_happened = false;
		}

		switch (wakeup_current_mode) {
		case SINGLE_FRAME_MODE:
			// The condition for switching to multi frame mode is:
			//	1) Have detected a human body.
			//	2) GPIO irq is happend.
			if (g_wakeup_nn_flag > 0 || is_gpioirq_happened) {
				// to multi frame
				RK_LOGI("#Resume isp, Enter multi frame, wakeup because %s\n",
				        is_gpioirq_happened ? "gpio irq" : "detected human body");
				SAMPLE_COMM_ISP_MultiFrame(0);
				wakeup_current_mode = MULTI_FRAME_MODE;
				if (is_gpioirq_happened) {
					wakeup_frame_count = g_max_wakeup_frame_count;
					is_gpioirq_happened = false;
				}
			}
			break;
		case MULTI_FRAME_MODE:
			// The condition for switching to single frame mode is:
			//	1) Have not detected human body too much times.
			//	2) GPIO irq is happend.
			//	3) wakeup_frame_count equals to zero.
			if (wakeup_frame_count > 0 && !is_gpioirq_happened) {
				--wakeup_frame_count;
				RK_LOGD("wakeup_frame_count %d", wakeup_frame_count);
			} else if (g_wakeup_nn_flag > 0) {
				// keep multi frame mode
				RK_LOGD("detected human body, loop %d", u32Loopcount);
			} else if (g_wakeup_nn_flag == 0 || wakeup_frame_count == 0 ||
			           is_gpioirq_happened) {
				// to single frame
				RK_LOGI("#Pause isp, Enter single frame\n");
				SAMPLE_COMM_ISP_SingleFrame(0);
				wakeup_current_mode = SINGLE_FRAME_MODE;
				wakeup_frame_count = 0;
				// drop frame
				VIDEO_FRAME_INFO_S stVpssFrame_tmp;
				while (RK_MPI_VPSS_GetChnFrame(VPSS_GROUP_ID, VPSS_IVA_CHNNAL_IDX,
				                               &stVpssFrame_tmp, 1000) == RK_SUCCESS) {
					RK_MPI_VPSS_ReleaseChnFrame(VPSS_GROUP_ID, VPSS_IVA_CHNNAL_IDX,
					                            &stVpssFrame_tmp);
				}
			}
			break;
		}

		if (wakeup_current_mode == SINGLE_FRAME_MODE) {
			if (g_s32AovLoopCount != 0) {
				if (g_s32AovLoopCount > 0)
					--g_s32AovLoopCount;
				SAMPLE_COMM_AOV_GetGpioIrqStat(); // ignore previous input events
				SAMPLE_COMM_AOV_EnterSleep();
			} else if (g_s32AovLoopCount == 0) {
				quit = true;
				RK_LOGI("Exit AOV!");
				break;
			}
		}
		u32Loopcount++;
		draw_rect_from_iva_result();
	}

	if (wakeup_current_mode == SINGLE_FRAME_MODE) {
		SAMPLE_COMM_ISP_MultiFrame(0);
		wakeup_current_mode = MULTI_FRAME_MODE;
	}

	RK_LOGE("vpss_iva_thread exit !!!");
	return RK_NULL;
}

#endif

#if 1
#define UPALIGNTO(value, align) ((value + align - 1) & (~(align - 1)))
#define UPALIGNTO2(value) UPALIGNTO(value, 2)
#define UPALIGNTO4(value) UPALIGNTO(value, 4)
#define UPALIGNTO16(value) UPALIGNTO(value, 16)
#define DOWNALIGNTO16(value) (UPALIGNTO(value, 16) - 16)
#define MULTI_UPALIGNTO16(grad, value) UPALIGNTO16((int)(grad * value))

#define DRAW_TIME_OSD_ID 0
#define FONT_LIBRARY_PATH "/usr/share/simsun_en.ttf"
#define WEB_VIEW_RECT_W 704
#define WEB_VIEW_RECT_H 480
#define MAX_WCH_BYTE 128

typedef struct text_data {
	wchar_t wch[MAX_WCH_BYTE];
	unsigned int font_size;
	unsigned int font_color;
	unsigned int color_inverse;
	const char *font_path;
	char format[128];
} text_data_s;
typedef struct border_data {
	int color_index;
	int color_key;
	int thick;
	int display_style;
} border_data_s;
typedef struct osd_data {
	int type;
	union {
		const char *image;
		text_data_s text;
		border_data_s border;
	};
	int width;
	int height;
	unsigned char *buffer;
	unsigned int size;
	int origin_x;
	int origin_y;
	int enable;
} osd_data_s;

static int fill_text(osd_data_s *data) {
	if (data->text.font_path == NULL) {
		RK_LOGE("font_path is NULL\n");
		return -1;
	}
	set_font_color(data->text.font_color);
	draw_argb8888_text(data->buffer, data->width, data->height, data->text.wch);
	return 0;
}
static int generate_date_time(wchar_t *result, const int r_size) {
	char time_str[64];
	time_t curtime;
	curtime = time(0);
	strftime(time_str, sizeof(time_str), "%Y-%m-%d %A %H:%M:%S", localtime(&curtime));
	return swprintf(result, r_size, L"%s", time_str);
}

static void *osd_time_thread(void *arg) {
	printf("#Start %s thread, arg:%p\n", __func__, arg);
	prctl(PR_SET_NAME, "osd_time_thread", 0, 0, 0);
	int osd_time_id = 0;
	int last_time_sec, wchar_cnt;
	int ret;
	const char *osd_type;
	const char *date_style;
	const char *time_style;
	int video_width = g_mpi_ctx->vi.u32Width;
	int video_height = g_mpi_ctx->vi.u32Height;
	int normalized_screen_width = WEB_VIEW_RECT_W;
	int normalized_screen_height = WEB_VIEW_RECT_H;
	double x_rate = (double)video_width / (double)normalized_screen_width;
	double y_rate = (double)video_height / (double)normalized_screen_height;
	char entry[128] = {'\0'};
	osd_data_s osd_data;
	time_t rawtime;
	struct tm *cur_time_info;
	BITMAP_S stBitmap;
	memset(&osd_data, 0, sizeof(osd_data));
	// init
	osd_data.enable = 1;
	osd_data.origin_x = UPALIGNTO16((int)(16 * x_rate));
	osd_data.origin_y = UPALIGNTO16((int)(16 * y_rate));
	osd_data.text.font_size = 32;
	osd_data.text.font_color = 0xfff799;
	osd_data.text.color_inverse = 1;
	osd_data.text.font_path = "/oem/usr/share/simsun_en.ttf";
	// osd_data.text.format = rk_param_get_int("osd.common:???", -1);
	// Initialize font
	ret = create_font(osd_data.text.font_path, osd_data.text.font_size);
	if (ret != 0) {
		RK_LOGE("Failed create font!\n");
		return NULL;
	}
	time(&rawtime);
	cur_time_info = localtime(&rawtime);
	last_time_sec = cur_time_info->tm_sec;
	while (!quit) {
		// 200 millis
		usleep(200000);
		time(&rawtime);
		cur_time_info = localtime(&rawtime);
		if (cur_time_info->tm_sec == last_time_sec)
			continue;
		else
			last_time_sec = cur_time_info->tm_sec;
		// generate time string.
		wchar_cnt = generate_date_time(osd_data.text.wch, MAX_WCH_BYTE);
		if (wchar_cnt <= 0) {
			RK_LOGE("generate_date_time error\n");
			continue;
		}
		// calculate really buffer size and allocate buffer for time string.
		osd_data.width = UPALIGNTO16(wstr_get_actual_advance_x(osd_data.text.wch) /
		                             osd_data.text.font_size);
		osd_data.height = UPALIGNTO16(osd_data.text.font_size);
		osd_data.size = osd_data.width * osd_data.height * 4; // BGRA8888 4byte
		osd_data.buffer = malloc(osd_data.size);
		memset(osd_data.buffer, 0, osd_data.size);
		// draw font in buffer
		fill_text(&osd_data);
		// set bitmap
		stBitmap.enPixelFormat = RK_FMT_2BPP;
		stBitmap.u32Width = osd_data.width;
		stBitmap.u32Height = osd_data.height;
		stBitmap.pData = (RK_VOID *)osd_data.buffer;
		ret = RK_MPI_RGN_SetBitMap(DRAW_TIME_OSD_ID, &stBitmap);
		if (ret != RK_SUCCESS)
			RK_LOGE("RK_MPI_RGN_SetBitMap failed with %#x\n", ret);
		free(osd_data.buffer);
	}
	destroy_font();
	RK_LOGI("exit\n");
	return NULL;
}

static void initTimeOsd() {
	RK_S32 s32Ret = RK_FAILURE;
	RGN_ATTR_S stRgnAttr;
	MPP_CHN_S stMppChn;
	RGN_CHN_ATTR_S stRgnChnAttr;
	int rotation = 0;
	// 2. Draw time string.
	memset(&stRgnAttr, 0, sizeof(stRgnAttr));
	stRgnAttr.enType = OVERLAY_RGN;
	stRgnAttr.unAttr.stOverlay.enPixelFmt = RK_FMT_2BPP;
	stRgnAttr.unAttr.stOverlay.stSize.u32Width = 512;
	stRgnAttr.unAttr.stOverlay.stSize.u32Height = 128;
	s32Ret = RK_MPI_RGN_Create(DRAW_TIME_OSD_ID, &stRgnAttr);
	if (RK_SUCCESS != s32Ret) {
		RK_LOGE("RK_MPI_RGN_Create (%d) failed with %#x\n", DRAW_TIME_OSD_ID, s32Ret);
		RK_MPI_RGN_Destroy(DRAW_TIME_OSD_ID);
		return;
	}
	// display overlay regions to vpss 1
	stMppChn.enModId = RK_ID_VENC;
	stMppChn.s32DevId = 0;
	stMppChn.s32ChnId = 0;
	memset(&stRgnChnAttr, 0, sizeof(stRgnChnAttr));
	stRgnChnAttr.bShow = true;
	stRgnChnAttr.enType = OVERLAY_RGN;
	stRgnChnAttr.unChnAttr.stOverlayChn.stPoint.s32X = 0;
	stRgnChnAttr.unChnAttr.stOverlayChn.stPoint.s32Y = 0;
	stRgnChnAttr.unChnAttr.stOverlayChn.u32BgAlpha = 64;
	stRgnChnAttr.unChnAttr.stOverlayChn.u32FgAlpha = 64;
	stRgnChnAttr.unChnAttr.stOverlayChn.u32Layer = 3;
	s32Ret = RK_MPI_RGN_AttachToChn(DRAW_TIME_OSD_ID, &stMppChn, &stRgnChnAttr);
	if (RK_SUCCESS != s32Ret)
		RK_LOGE("RK_MPI_RGN_AttachToChn (%d) to venc0 failed with %#x\n",
		        DRAW_TIME_OSD_ID, s32Ret);
}

static void deinitTimeOsd() {
	RK_S32 s32Ret = RK_SUCCESS;

	MPP_CHN_S stMppChn;
	stMppChn.enModId = RK_ID_VENC;
	stMppChn.s32DevId = 0;
	stMppChn.s32ChnId = 0;

	s32Ret = RK_MPI_RGN_DetachFromChn(DRAW_TIME_OSD_ID, &stMppChn);
	if (RK_SUCCESS != s32Ret)
		RK_LOGE("RK_MPI_RGN_DetachFrmChn (%d) to venc0 failed with %#x\n",
		        DRAW_TIME_OSD_ID, s32Ret);
	// destory region
	s32Ret = RK_MPI_RGN_Destroy(DRAW_TIME_OSD_ID);
	if (RK_SUCCESS != s32Ret)
		RK_LOGE("RK_MPI_RGN_Destroy [%d] failed with %#x\n", DRAW_TIME_OSD_ID, s32Ret);
}
#endif

/******************************************************************************
 * function    : main()
 * Description : main
 ******************************************************************************/
int main(int argc, char *argv[]) {
	int video_width = 1920;
	int video_height = 1080;
	RK_CHAR *pDeviceName = NULL;
	CODEC_TYPE_E enCodecType = RK_CODEC_TYPE_H264;
	VENC_RC_MODE_E enRcMode = VENC_RC_MODE_H264CBR;
	RK_CHAR *pCodecName = "H264";
	RK_S32 s32CamId = 0;
	RK_S32 s32BitRate = 4 * 1024;
	MPP_CHN_S stSrcChn, stDestChn;
	RK_S32 s32AeMode = 0;
	RK_S32 s32SuspendTime = 1000;
	RK_U32 u32IvaWidth = 512;
	RK_U32 u32IvaHeight = 288;
	RK_U32 u32IvaDetectFrameRate = 10;
	RK_BOOL bEnableAIISP = RK_TRUE;
	RK_CHAR *pIvaModelPath = "/oem/usr/lib/";
	RK_U32 u32ViFps = 10;
	RK_S32 u32QuickStart = 0;
	RK_S32 s32Ret;

	pthread_t vi_iva_thread_id;
	pthread_t osd_thread_id;

	if (argc < 2) {
		print_usage(argv[0]);
		return 0;
	}

	g_mpi_ctx = (SAMPLE_MPI_CTX_S *)(malloc(sizeof(SAMPLE_MPI_CTX_S)));
	memset(g_mpi_ctx, 0, sizeof(SAMPLE_MPI_CTX_S));

	signal(SIGINT, sigterm_handler);

#ifdef RKAIQ
	RK_BOOL bMultictx = RK_FALSE;
#endif
	int c;
	char *iq_file_dir = NULL;
	while ((c = getopt_long(argc, argv, optstr, long_options, NULL)) != -1) {
		const char *tmp_optarg = optarg;
		switch (c) {
		case 'a':
			if (!optarg && NULL != argv[optind] && '-' != argv[optind][0]) {
				tmp_optarg = argv[optind++];
			}
			if (tmp_optarg) {
				iq_file_dir = (char *)tmp_optarg;
			} else {
				iq_file_dir = NULL;
			}
			break;
		case 'b':
			s32BitRate = atoi(optarg);
			break;
		case 'd':
			pDeviceName = optarg;
			break;
		case 'e':
			if (!strcmp(optarg, "h264cbr")) {
				enCodecType = RK_CODEC_TYPE_H264;
				enRcMode = VENC_RC_MODE_H264CBR;
				pCodecName = "H264";
			} else if (!strcmp(optarg, "h264vbr")) {
				enCodecType = RK_CODEC_TYPE_H264;
				enRcMode = VENC_RC_MODE_H264VBR;
				pCodecName = "H264";
			} else if (!strcmp(optarg, "h264avbr")) {
				enCodecType = RK_CODEC_TYPE_H264;
				enRcMode = VENC_RC_MODE_H264AVBR;
				pCodecName = "H264";
			} else if (!strcmp(optarg, "h265cbr")) {
				enCodecType = RK_CODEC_TYPE_H265;
				enRcMode = VENC_RC_MODE_H265CBR;
				pCodecName = "H265";
			} else if (!strcmp(optarg, "h265vbr")) {
				enCodecType = RK_CODEC_TYPE_H265;
				enRcMode = VENC_RC_MODE_H265VBR;
				pCodecName = "H265";
			} else if (!strcmp(optarg, "h265avbr")) {
				enCodecType = RK_CODEC_TYPE_H265;
				enRcMode = VENC_RC_MODE_H265AVBR;
				pCodecName = "H265";
			} else if (!strcmp(optarg, "mjpegcbr")) {
				enCodecType = RK_CODEC_TYPE_MJPEG;
				enRcMode = VENC_RC_MODE_MJPEGCBR;
				pCodecName = "MJPEG";
			} else if (!strcmp(optarg, "mjpegvbr")) {
				enCodecType = RK_CODEC_TYPE_MJPEG;
				enRcMode = VENC_RC_MODE_MJPEGVBR;
				pCodecName = "MJPEG";
			} else {
				printf("ERROR: Invalid encoder type.\n");
				return 0;
			}
			break;
		case 'w':
			video_width = atoi(optarg);
			break;
		case 'h':
			video_height = atoi(optarg);
			break;
		case 'f':
			u32ViFps = atoi(optarg);
			break;
		case 'I':
			s32CamId = atoi(optarg);
			break;
		case 'a' + 'm':
			s32AeMode = atoi(optarg);
			break;
		case 'a' + 'm' + 'c':
			g_s32AovLoopCount = atoi(optarg);
			break;
		case 's' + 't':
			s32SuspendTime = atoi(optarg);
			break;
		case 'a' + 'i':
			bEnableAIISP = atoi(optarg);
			break;
		case 'i' + 'd' + 's':
			u32IvaDetectFrameRate = atoi(optarg);
			break;
		case 'e' + 'a':
			g_wakeup_enable = atoi(optarg);
			break;
		case 'e' + 'm' + 'f':
			g_multi_frame_enable = atoi(optarg);
			break;
		case 'e' + 's':
			g_enable_save_sd = atoi(optarg);
			break;
		case 'm' + 'w':
			g_max_wakeup_frame_count = atoi(optarg);
			break;
#ifdef RKAIQ
		case 'M':
			if (atoi(optarg)) {
				bMultictx = RK_TRUE;
			}
			break;
#endif
		case 'q' + 'k' + 's':
			u32QuickStart = atoi(optarg);
			break;
		case 'b' + 'f':
			g_u32BootFrame = atoi(optarg);
			break;
		case '?':
		default:
			print_usage(argv[0]);
			return 0;
		}
	}

	printf("#CameraIdx: %d\n", s32CamId);
	printf("#pDeviceName: %s\n", pDeviceName);
	printf("#CodecName:%s\n", pCodecName);
	printf("#AOV loop count: %d\n", g_s32AovLoopCount);

	SAMPLE_COMM_AOV_Init();
#ifdef RKAIQ
	printf("#bMultictx: %d\n\n", bMultictx);
	rk_aiq_working_mode_t hdr_mode = RK_AIQ_WORKING_MODE_NORMAL;
	SAMPLE_COMM_ISP_Init(s32CamId, hdr_mode, bMultictx, iq_file_dir);
	SAMPLE_COMM_ISP_Run(s32CamId);
#endif

	// init rtsp
	g_rtsplive = create_rtsp_demo(554);
	g_rtsp_session = rtsp_new_session(g_rtsplive, "/live/0");
	if (enCodecType == RK_CODEC_TYPE_H264) {
		rtsp_set_video(g_rtsp_session, RTSP_CODEC_ID_VIDEO_H264, NULL, 0);
	} else if (enCodecType == RK_CODEC_TYPE_H265) {
		rtsp_set_video(g_rtsp_session, RTSP_CODEC_ID_VIDEO_H265, NULL, 0);
	} else {
		printf("not support other type\n");
		return -1;
	}
	rtsp_sync_video_ts(g_rtsp_session, rtsp_get_reltime(), rtsp_get_ntptime());

	if (RK_MPI_SYS_Init() != RK_SUCCESS) {
		goto __FAILED;
	}

#ifdef ROCKIVA
	/* Init iva */
	g_mpi_ctx->iva.pModelDataPath = pIvaModelPath;
	g_mpi_ctx->iva.u32ImageHeight = u32IvaWidth;
	g_mpi_ctx->iva.u32ImageWidth = u32IvaHeight;
	g_mpi_ctx->iva.u32DetectStartX = 0;
	g_mpi_ctx->iva.u32DetectStartY = 0;
	g_mpi_ctx->iva.u32DetectWidth = u32IvaWidth;
	g_mpi_ctx->iva.u32DetectHight = u32IvaHeight;
	g_mpi_ctx->iva.eImageTransform = ROCKIVA_IMAGE_TRANSFORM_NONE;
	g_mpi_ctx->iva.eImageFormat = ROCKIVA_IMAGE_FORMAT_YUV420SP_NV12;
	g_mpi_ctx->iva.eModeType = ROCKIVA_DET_MODEL_PFP;
	g_mpi_ctx->iva.u32IvaDetectFrameRate = u32IvaDetectFrameRate;
	g_mpi_ctx->iva.detectResultCallback = rkIvaEvent_callback;
	g_mpi_ctx->iva.releaseCallback = rkIvaFrame_releaseCallBack;
	g_mpi_ctx->iva.eIvaMode = ROCKIVA_MODE_DETECT;
	s32Ret = SAMPLE_COMM_IVA_Create(&g_mpi_ctx->iva);
	if (s32Ret != RK_SUCCESS) {
		RK_LOGE("SAMPLE_COMM_IVA_Create failure:%#X", s32Ret);
	}
#endif
	// Init VI[0]
	g_mpi_ctx->vi.bIfQuickStart = u32QuickStart;
	g_mpi_ctx->vi.u32Width = video_width;
	g_mpi_ctx->vi.u32Height = video_height;
	g_mpi_ctx->vi.s32DevId = s32CamId;
	g_mpi_ctx->vi.u32PipeId = g_mpi_ctx->vi.s32DevId;
	g_mpi_ctx->vi.s32ChnId = VI_MAIN_CHANNEL;
	g_mpi_ctx->vi.stChnAttr.stIspOpt.u32BufCount = 2;
	g_mpi_ctx->vi.stChnAttr.stIspOpt.enMemoryType = VI_V4L2_MEMORY_TYPE_DMABUF;
	g_mpi_ctx->vi.stChnAttr.u32Depth = 0;
	g_mpi_ctx->vi.stChnAttr.enPixelFormat = RK_FMT_YUV420SP;
	g_mpi_ctx->vi.stChnAttr.stFrameRate.s32SrcFrameRate = -1;
	g_mpi_ctx->vi.stChnAttr.stFrameRate.s32DstFrameRate = -1;
	if (pDeviceName) {
		strcpy(g_mpi_ctx->vi.stChnAttr.stIspOpt.aEntityName, pDeviceName);
	}
	SAMPLE_COMM_VI_CreateChn(&g_mpi_ctx->vi);

	// Init VPSS[0]
	g_mpi_ctx->vpss.s32GrpId = VPSS_GROUP_ID;
	g_mpi_ctx->vpss.s32ChnId = VPSS_CHNNAL;
	// RGA_device: VIDEO_PROC_DEV_RGA GPU_device: VIDEO_PROC_DEV_GPU
	g_mpi_ctx->vpss.enVProcDevType = VIDEO_PROC_DEV_RGA;
	g_mpi_ctx->vpss.stGrpVpssAttr.enPixelFormat = RK_FMT_YUV420SP;
	g_mpi_ctx->vpss.stGrpVpssAttr.enCompressMode = COMPRESS_MODE_NONE; // no compress

	g_mpi_ctx->vpss.stCropInfo.bEnable = RK_FALSE;
	g_mpi_ctx->vpss.stCropInfo.enCropCoordinate = VPSS_CROP_RATIO_COOR;
	g_mpi_ctx->vpss.stCropInfo.stCropRect.s32X = 0;
	g_mpi_ctx->vpss.stCropInfo.stCropRect.s32Y = 0;
	g_mpi_ctx->vpss.stCropInfo.stCropRect.u32Width = video_width;
	g_mpi_ctx->vpss.stCropInfo.stCropRect.u32Height = video_height;

	g_mpi_ctx->vpss.stVpssChnAttr[0].enChnMode = VPSS_CHN_MODE_AUTO;
	g_mpi_ctx->vpss.stVpssChnAttr[0].enCompressMode = COMPRESS_MODE_NONE;
	g_mpi_ctx->vpss.stVpssChnAttr[0].enDynamicRange = DYNAMIC_RANGE_SDR8;
	g_mpi_ctx->vpss.stVpssChnAttr[0].enPixelFormat = RK_FMT_YUV420SP;
	g_mpi_ctx->vpss.stVpssChnAttr[0].stFrameRate.s32SrcFrameRate = -1;
	g_mpi_ctx->vpss.stVpssChnAttr[0].stFrameRate.s32DstFrameRate = -1;
	g_mpi_ctx->vpss.stVpssChnAttr[0].u32Width = video_width;
	g_mpi_ctx->vpss.stVpssChnAttr[0].u32Height = video_height;
	g_mpi_ctx->vpss.stVpssChnAttr[0].u32Depth = 0;
	g_mpi_ctx->vpss.stVpssChnAttr[0].u32FrameBufCnt = 1;
#ifdef ROCKIVA
	g_mpi_ctx->vpss.stVpssChnAttr[1].enChnMode = VPSS_CHN_MODE_AUTO;
	g_mpi_ctx->vpss.stVpssChnAttr[1].enCompressMode = COMPRESS_MODE_NONE;
	g_mpi_ctx->vpss.stVpssChnAttr[1].enDynamicRange = DYNAMIC_RANGE_SDR8;
	g_mpi_ctx->vpss.stVpssChnAttr[1].enPixelFormat = RK_FMT_YUV420SP;
	g_mpi_ctx->vpss.stVpssChnAttr[1].stFrameRate.s32SrcFrameRate = -1;
	g_mpi_ctx->vpss.stVpssChnAttr[1].stFrameRate.s32DstFrameRate = -1;
	g_mpi_ctx->vpss.stVpssChnAttr[1].u32Width = u32IvaWidth;
	g_mpi_ctx->vpss.stVpssChnAttr[1].u32Height = u32IvaHeight;
	g_mpi_ctx->vpss.stVpssChnAttr[1].u32Depth = 1;
	g_mpi_ctx->vpss.stVpssChnAttr[1].u32FrameBufCnt = 2;
#endif
	SAMPLE_COMM_VPSS_CreateChn(&g_mpi_ctx->vpss);

	if (bEnableAIISP) {
		AIISP_ATTR_S stAIISPAttr;
		memset(&stAIISPAttr, 0, sizeof(AIISP_ATTR_S));
		stAIISPAttr.bEnable = RK_TRUE;
		stAIISPAttr.stAiIspCallback.pfUpdateCallback = aiisp_callback;
		stAIISPAttr.stAiIspCallback.pPrivateData = RK_NULL;
		stAIISPAttr.pModelFilePath = "/oem/usr/lib/";
		stAIISPAttr.u32FrameBufCnt = 1;
		s32Ret = RK_MPI_VPSS_SetGrpAIISPAttr(VPSS_GROUP_ID, &stAIISPAttr);
		if (RK_SUCCESS != s32Ret) {
			RK_LOGE("VPSS GRP 0 RK_MPI_VPSS_SetGrpAIISPAttr failed with %#x!", s32Ret);
			goto __FAILED;
		}
		RK_LOGD("VPSS GRP 0 RK_MPI_VPSS_SetGrpAIISPAttr success.");
	}

	// Init VENC[0]
	g_mpi_ctx->venc.s32ChnId = VENC_MAIN_CHANNEL;
	g_mpi_ctx->venc.u32Width = video_width;
	g_mpi_ctx->venc.u32Height = video_height;
	g_mpi_ctx->venc.u32Fps = u32ViFps;
	g_mpi_ctx->venc.u32Gop = 20;
	g_mpi_ctx->venc.u32BitRate = s32BitRate;
	g_mpi_ctx->venc.enCodecType = enCodecType;
	g_mpi_ctx->venc.enRcMode = enRcMode;
	g_mpi_ctx->venc.getStreamCbFunc = venc_get_stream;
	g_mpi_ctx->venc.enable_buf_share = 1;
	g_mpi_ctx->venc.u32BuffSize = video_width * video_height;
	// H264  66：Baseline  77：Main Profile 100：High Profile
	// H265  0：Main Profile  1：Main 10 Profile
	// MJPEG 0：Baseline
	g_mpi_ctx->venc.stChnAttr.stVencAttr.u32Profile = 100;
	g_mpi_ctx->venc.stChnAttr.stGopAttr.enGopMode =
	    VENC_GOPMODE_NORMALP; // VENC_GOPMODE_SMARTP
	SAMPLE_COMM_VENC_CreateChn(&g_mpi_ctx->venc);

	// Init RGN[1]
	g_mpi_ctx->rgn[0].rgnHandle = 1;
	g_mpi_ctx->rgn[0].stRgnAttr.enType = OVERLAY_RGN;
	g_mpi_ctx->rgn[0].bDrawBmpManual = RK_TRUE;
	g_mpi_ctx->rgn[0].stMppChn.enModId = RK_ID_VENC;
	g_mpi_ctx->rgn[0].stMppChn.s32ChnId = RGN_CHANNEL;
	g_mpi_ctx->rgn[0].stMppChn.s32DevId = 0;
	g_mpi_ctx->rgn[0].stRegion.s32X = 0;         // must be 16 aligned
	g_mpi_ctx->rgn[0].stRegion.s32Y = 0;         // must be 16 aligned
	g_mpi_ctx->rgn[0].stRegion.u32Width = 1920;  // must be 16 aligned
	g_mpi_ctx->rgn[0].stRegion.u32Height = 1080; // must be 16 aligned
	g_mpi_ctx->rgn[0].u32BmpFormat = RK_FMT_2BPP;
	g_mpi_ctx->rgn[0].u32BgAlpha = 0;
	g_mpi_ctx->rgn[0].u32FgAlpha = 255;
	g_mpi_ctx->rgn[0].u32Layer = 1;
	g_mpi_ctx->rgn[0]
	    .stRgnChnAttr.unChnAttr.stOverlayChn.u32ColorLUT[RGN_COLOR_LUT_INDEX_0] =
	    BLUE_COLOR;
	g_mpi_ctx->rgn[0]
	    .stRgnChnAttr.unChnAttr.stOverlayChn.u32ColorLUT[RGN_COLOR_LUT_INDEX_1] =
	    RED_COLOR;
	SAMPLE_COMM_RGN_CreateChn(&g_mpi_ctx->rgn[0]);

	// Bind VI[0] and VPSS[0]
	stSrcChn.enModId = RK_ID_VI;
	stSrcChn.s32DevId = g_mpi_ctx->vi.s32DevId;
	stSrcChn.s32ChnId = g_mpi_ctx->vi.s32ChnId;
	stDestChn.enModId = RK_ID_VPSS;
	stDestChn.s32DevId = g_mpi_ctx->vpss.s32GrpId;
	stDestChn.s32ChnId = g_mpi_ctx->vpss.s32ChnId;
	SAMPLE_COMM_Bind(&stSrcChn, &stDestChn);

	// Bind VPSS[0] and VENC[0]
	stSrcChn.enModId = RK_ID_VPSS;
	stSrcChn.s32DevId = g_mpi_ctx->vpss.s32GrpId;
	stSrcChn.s32ChnId = g_mpi_ctx->vpss.s32ChnId;
	stDestChn.enModId = RK_ID_VENC;
	stDestChn.s32DevId = 0;
	stDestChn.s32ChnId = g_mpi_ctx->venc.s32ChnId;
	SAMPLE_COMM_Bind(&stSrcChn, &stDestChn);

	if (!u32QuickStart)
		RK_MPI_VI_StartPipe(g_mpi_ctx->vi.u32PipeId);

	SAMPLE_COMM_AOV_SetSuspendTime(s32SuspendTime);

	initTimeOsd();

	printf("%s initial finish\n", __func__);
#ifdef ROCKIVA
	// /* VI[1] IVA thread launch */
	pthread_create(&vi_iva_thread_id, 0, vpss_iva_thread, (void *)g_mpi_ctx);
#endif

	pthread_create(&osd_thread_id, 0, osd_time_thread, (void *)g_mpi_ctx);
	while (!quit) {
		sleep(1);
	}

	printf("%s exit!\n", __func__);
#ifdef ROCKIVA
	/* Destroy IVA */
	pthread_join(vi_iva_thread_id, RK_NULL);
	SAMPLE_COMM_IVA_Destroy(&g_mpi_ctx->iva);
#endif

	pthread_join(osd_thread_id, RK_NULL);
	if (g_mpi_ctx->venc.getStreamCbFunc) {
		pthread_join(g_mpi_ctx->venc.getStreamThread, NULL);
	}

	if (g_rtsplive)
		rtsp_del_demo(g_rtsplive);

	deinitTimeOsd();
	SAMPLE_COMM_RGN_DestroyChn(&g_mpi_ctx->rgn[0]);

	// UnBind VPSS[0] and VENC[0]
	stSrcChn.enModId = RK_ID_VPSS;
	stSrcChn.s32DevId = g_mpi_ctx->vpss.s32GrpId;
	stSrcChn.s32ChnId = g_mpi_ctx->vpss.s32ChnId;
	stDestChn.enModId = RK_ID_VENC;
	stDestChn.s32DevId = 0;
	stDestChn.s32ChnId = g_mpi_ctx->venc.s32ChnId;
	SAMPLE_COMM_UnBind(&stSrcChn, &stDestChn);

	// UnBind VI[0] and VPSS[0]
	stSrcChn.enModId = RK_ID_VI;
	stSrcChn.s32DevId = g_mpi_ctx->vi.s32DevId;
	stSrcChn.s32ChnId = g_mpi_ctx->vi.s32ChnId;
	stDestChn.enModId = RK_ID_VPSS;
	stDestChn.s32DevId = g_mpi_ctx->vpss.s32GrpId;
	stDestChn.s32ChnId = g_mpi_ctx->vpss.s32ChnId;
	SAMPLE_COMM_UnBind(&stSrcChn, &stDestChn);

	// Destroy VENC[0]
	SAMPLE_COMM_VENC_DestroyChn(&g_mpi_ctx->venc);
	// Destroy VPSS[0]
	SAMPLE_COMM_VPSS_DestroyChn(&g_mpi_ctx->vpss);
	// Destroy VI[0]
	SAMPLE_COMM_VI_DestroyChn(&g_mpi_ctx->vi);
__FAILED:
	RK_MPI_SYS_Exit();
#ifdef RKAIQ
	SAMPLE_COMM_ISP_Stop(s32CamId);
#endif
	SAMPLE_COMM_AOV_Deinit();
	if (g_mpi_ctx) {
		free(g_mpi_ctx);
		g_mpi_ctx = RK_NULL;
	}

	return 0;
}

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* End of #ifdef __cplusplus */
