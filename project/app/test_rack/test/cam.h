#ifndef __CAM_H__
#define __CAM_H__

#include <stdio.h>
#include <sys/poll.h>
#include <errno.h>
#include <unistd.h>
#include <pthread.h>
#include <signal.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <sys/types.h>
#include <sys/ioctl.h>
#include <linux/fb.h>

#include "rk_defines.h"
#include "rk_debug.h"
#include "rk_mpi_vi.h"
#include "rk_mpi_mb.h"
#include "rk_mpi_sys.h"

#include "im2d.hpp"

#include "dma_alloc.h"

typedef struct _rkMpiVICtx {
    RK_S32 maxWidth;
    RK_S32 maxHeight;
    RK_S32 width;
    RK_S32 height;
    RK_S32 devId;
    RK_S32 pipeId;
    RK_S32 channelId;
    RK_S32 selectFd;
    RK_BOOL bFreeze;
    MB_POOL attachPool;

    COMPRESS_MODE_E enCompressMode;
    VI_DEV_STATUS_S stDevStatus;
    VI_DEV_ATTR_S stDevAttr;
    VI_DEV_BIND_PIPE_S stBindPipe;
    VI_CHN_ATTR_S stChnAttr;

    VI_SAVE_FILE_INFO_S stDebugFile;
    VIDEO_FRAME_INFO_S stViFrame;
    VI_CHN_STATUS_S stChnStatus;
    const char *aEntityName;
    VI_CHN_BUF_WRAP_S stChnWrap;

} TEST_VI_CTX_S;


RK_U64 TEST_COMM_GetNowUs();
RK_S32 test_vi_init(TEST_VI_CTX_S *ctx);
static int color_cvt(int ch,void *src_data);
static RK_S32 test_vi_get_release_frame_loop(TEST_VI_CTX_S *ctx);
void *start_stream(void* arg);

int cam_init();
int cam_exit();

#endif //__CAM_H__