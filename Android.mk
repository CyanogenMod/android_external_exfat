FUSE_ROOT := $(call my-dir)

include $(FUSE_ROOT)/libexfat/Android.mk
include $(FUSE_ROOT)/fuse/Android.mk
include $(FUSE_ROOT)/mkfs/Android.mk
include $(FUSE_ROOT)/fsck/Android.mk
