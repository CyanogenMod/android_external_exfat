FUSE_ROOT := $(call my-dir)

LINKS := fsck.exfat mkfs.exfat

LOCAL_PATH := $(call my-dir)

# multi-call binary
include $(CLEAR_VARS)
LOCAL_MODULE := mount.exfat
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := main.c
LOCAL_SHARED_LIBRARIES += libz libc
LOCAL_STATIC_LIBRARIES += libexfat_mount libexfat_fsck libexfat_mkfs
LOCAL_STATIC_LIBRARIES += libexfat libfuse
include $(BUILD_EXECUTABLE)

SYMLINKS := $(addprefix $(TARGET_OUT)/bin/,$(LINKS))
$(SYMLINKS): EXFAT_BINARY := $(LOCAL_MODULE)
$(SYMLINKS): $(LOCAL_INSTALLED_MODULE) $(LOCAL_PATH)/Android.mk
	@echo "Symlink: $@ -> $(EXFAT_BINARY)"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf $(EXFAT_BINARY) $@

ALL_DEFAULT_INSTALLED_MODULES += $(SYMLINKS)


# static multi-call binary for recovery
include $(CLEAR_VARS)
LOCAL_MODULE := mount.exfat_static
LOCAL_MODULE_CLASS := RECOVERY_EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/sbin
LOCAL_MODULE_STEM := mount.exfat
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := main.c
LOCAL_STATIC_LIBRARIES += libz libc
LOCAL_STATIC_LIBRARIES += libexfat_mount libexfat_fsck libexfat_mkfs
LOCAL_STATIC_LIBRARIES += libexfat libfuse
LOCAL_FORCE_STATIC_EXECUTABLE := true
include $(BUILD_EXECUTABLE)

RECOVERY_SYMLINKS := $(addprefix $(TARGET_RECOVERY_ROOT_OUT)/sbin/,$(LINKS))
$(RECOVERY_SYMLINKS): EXFAT_BINARY := mount.exfat
$(RECOVERY_SYMLINKS): $(LOCAL_INSTALLED_MODULE) $(LOCAL_PATH)/Android.mk
	@echo "Symlink: $@ -> $(EXFAT_BINARY)"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf $(EXFAT_BINARY) $@

ALL_DEFAULT_INSTALLED_MODULES += $(RECOVERY_SYMLINKS)


include $(FUSE_ROOT)/libexfat/Android.mk
include $(FUSE_ROOT)/fuse/Android.mk
include $(FUSE_ROOT)/mkfs/Android.mk
include $(FUSE_ROOT)/fsck/Android.mk
