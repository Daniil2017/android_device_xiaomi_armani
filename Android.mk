#	Android 6.0
#	 OmniRom
#	Daniil2017
LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),armani)
include $(call all-makefiles-under,$(LOCAL_PATH))
endif
