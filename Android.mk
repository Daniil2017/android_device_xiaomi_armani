#	Android 6.0
#	 OmniRom
#	Daniil2017
LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),armani)
include $(call all-makefiles-under,$(LOCAL_PATH))

include $(CLEAR_VARS)
LOCAL_MODULE := libtime_genoff
LOCAL_SRC_FILES := prebuilts/libtime_genoff.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_PATH  := $(TARGET_OUT)/vendor/lib
include $(BUILD_PREBUILT)

endif
