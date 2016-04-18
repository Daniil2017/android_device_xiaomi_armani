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

include $(CLEAR_VARS)
LOCAL_SRC_FILES := wifi/wcnss_xiaomi_client.c
LOCAL_C_INCLUDES += hardware/qcom/wlan/wcnss_service
LOCAL_CFLAGS += -Wall
LOCAL_SHARED_LIBRARIES := libc libcutils libutils liblog libqminvapi
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := libwcnss_qmi
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libqminvapi
LOCAL_SRC_FILES := prebuilts/libqminvapi.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_PATH  := $(TARGET_OUT)/lib
include $(BUILD_PREBUILT)

$(shell mkdir -p $(TARGET_OUT_ETC)/firmware/wlan/prima; \
	ln -sf /data/misc/wifi/WCNSS_qcom_cfg.ini \
	$(TARGET_OUT_ETC)/firmware/wlan/prima/WCNSS_qcom_cfg.ini)

endif
