LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := mkfs.exfat
LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS = -D_FILE_OFFSET_BITS=64 -Wno-sign-compare -Wno-unused-parameter
LOCAL_SRC_FILES =  cbm.c fat.c main.c mkexfat.c rootdir.c uct.c uctc.c vbr.c
LOCAL_C_INCLUDES += $(LOCAL_PATH) \
					external/exfat/libexfat \
					external/fuse/include
LOCAL_SHARED_LIBRARIES := libfuse libexfat
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_MODULE := libexfat_mkfs_static
LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS = -D_FILE_OFFSET_BITS=64 -Dmain=mkfs_exfat_main -Wno-sign-compare -Wno-unused-parameter
LOCAL_SRC_FILES =  cbm.c fat.c main.c mkexfat.c rootdir.c uct.c uctc.c vbr.c
LOCAL_C_INCLUDES += $(LOCAL_PATH) \
					external/exfat/libexfat \
					external/fuse/include
LOCAL_STATIC_LIBRARIES := libfuse_static libexfat_static
include $(BUILD_STATIC_LIBRARY)
