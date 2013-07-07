LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := mkfs.exfat
LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS = -D_FILE_OFFSET_BITS=64
LOCAL_SRC_FILES =  cbm.c fat.c main.c mkexfat.c rootdir.c uct.c uctc.c vbr.c
LOCAL_C_INCLUDES += $(LOCAL_PATH) \
					external/exfat/libexfat \
					external/fuse/include
LOCAL_SHARED_LIBRARIES += libz libc libdl
LOCAL_STATIC_LIBRARIES += libexfat libfuse

include $(BUILD_EXECUTABLE)
