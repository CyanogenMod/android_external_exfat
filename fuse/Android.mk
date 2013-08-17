LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE := libexfat_mount
LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS = -D_FILE_OFFSET_BITS=64
LOCAL_SRC_FILES = main.c 
LOCAL_C_INCLUDES += $(LOCAL_PATH) \
					external/exfat/libexfat \
					external/fuse/include \
					external/fuse/android
include $(BUILD_STATIC_LIBRARY)
