HOST_CC = gcc
CFLAGS = -O2 -Wall -I../include

target=make_meta.c
target_bin_host=$(patsubst %.c,%,$(target))_host
target_bin=$(patsubst %.c,%,$(target))
CROSS_COMPILE_CC ?= arm-rockchip830-linux-uclibcgnueabihf-gcc

all: 
	$(HOST_CC) $(CFLAGS) -o $(target_bin_host) $(target) -I ../zlib/out_host_pc/include/ ../zlib/out_host_pc/lib/libz.a 
ifneq ($(CROSS_COMPILE_CC),)
	$(CROSS_COMPILE_CC) $(CFLAGS) -o $(target_bin) $(target) -I ../zlib/out_board/include/ ../zlib/out_board/lib/libz.a
endif

clean:
	@rm -f *.o $(target_bin) $(target_bin_host)
