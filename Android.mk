#	Android 6.0
#	 OmniRom
#	Daniil2017
LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),armani)

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

include $(CLEAR_VARS)
LOCAL_SRC_FILES := liblight/lights.c
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_SHARED_LIBRARIES := liblog libcutils
LOCAL_MODULE := lights.$(TARGET_BOARD_PLATFORM)
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := healthd/healthd_board_armani.cpp
LOCAL_MODULE := libhealthd.armani
LOCAL_CFLAGS := -Werror
LOCAL_C_INCLUDES := system/core/healthd bootable/recovery
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libloc_core
LOCAL_MODULE_OWNER := qcom
LOCAL_MODULE_TAGS := optional

LOCAL_SHARED_LIBRARIES := \
    libutils \
    libcutils \
    libgps.utils \
    libdl

LOCAL_SRC_FILES += \
    gps/core/MsgTask.cpp \
    gps/core/LocApiBase.cpp \
    gps/core/LocAdapterBase.cpp \
    gps/core/ContextBase.cpp \
    gps/core/LocDualContext.cpp \
    gps/core/loc_core_log.cpp

LOCAL_CFLAGS += \
     -fno-short-enums \
     -D_ANDROID_

LOCAL_C_INCLUDES:= \
    $(TARGET_OUT_HEADERS)/gps.utils \
    $(TARGET_OUT_HEADERS)/libloc_core

LOCAL_COPY_HEADERS_TO:= libloc_core
LOCAL_COPY_HEADERS:= \
    gps/core/MsgTask.h \
    gps/core/LocApiBase.h \
    gps/core/LocAdapterBase.h \
    gps/core/ContextBase.h \
    gps/core/LocDualContext.h \
    gps/core/LBSProxyBase.h \
    gps/core/UlpProxyBase.h \
    gps/core/gps_extended_c.h \
    gps/core/gps_extended.h \
    gps/core/loc_core_log.h

LOCAL_PRELINK_MODULE := false
include $(BUILD_SHARED_LIBRARY)
#Compile this library only for builds with the latest modem image
include $(CLEAR_VARS)

LOCAL_MODULE := libloc_eng
LOCAL_MODULE_OWNER := qcom

LOCAL_MODULE_TAGS := optional

LOCAL_SHARED_LIBRARIES := \
    libutils \
    libcutils \
    libdl \
    liblog \
    libloc_core \
    libgps.utils

LOCAL_SRC_FILES += \
    gps/loc_api/libloc_api_50001/loc_eng.cpp \
    gps/loc_api/libloc_api_50001/loc_eng_agps.cpp \
    gps/loc_api/libloc_api_50001/loc_eng_xtra.cpp \
    gps/loc_api/libloc_api_50001/loc_eng_ni.cpp \
    gps/loc_api/libloc_api_50001/loc_eng_log.cpp \
    gps/loc_api/libloc_api_50001/loc_eng_nmea.cpp \
    gps/loc_api/libloc_api_50001/LocEngAdapter.cpp

LOCAL_SRC_FILES += \
    gps/loc_api/libloc_api_50001/loc_eng_dmn_conn.cpp \
    gps/loc_api/libloc_api_50001/loc_eng_dmn_conn_handler.cpp \
    gps/loc_api/libloc_api_50001/loc_eng_dmn_conn_thread_helper.c \
    gps/loc_api/libloc_api_50001/loc_eng_dmn_conn_glue_msg.c \
    gps/loc_api/libloc_api_50001/loc_eng_dmn_conn_glue_pipe.c

LOCAL_CFLAGS += \
     -fno-short-enums \
     -D_ANDROID_

LOCAL_C_INCLUDES:= \
    $(TARGET_OUT_HEADERS)/gps.utils \
    $(TARGET_OUT_HEADERS)/libloc_core \
    $(LOCAL_PATH)/gps/loc_api/libloc_api_50001

LOCAL_COPY_HEADERS_TO:= libloc_eng
LOCAL_COPY_HEADERS:= \
   gps/loc_api/libloc_api_50001/LocEngAdapter.h \
   gps/loc_api/libloc_api_50001/loc.h \
   gps/loc_api/libloc_api_50001/loc_eng.h \
   gps/loc_api/libloc_api_50001/loc_eng_xtra.h \
   gps/loc_api/libloc_api_50001/loc_eng_ni.h \
   gps/loc_api/libloc_api_50001/loc_eng_agps.h \
   gps/loc_api/libloc_api_50001/loc_eng_msg.h \
   gps/loc_api/libloc_api_50001/loc_eng_log.h

LOCAL_PRELINK_MODULE := false
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := gps.$(TARGET_BOARD_PLATFORM)
LOCAL_MODULE_OWNER := qcom
LOCAL_MODULE_TAGS := optional

## Libs
LOCAL_SHARED_LIBRARIES := \
    libutils \
    libcutils \
    liblog \
    libloc_eng \
    libloc_core \
    libgps.utils \
    libdl

LOCAL_SRC_FILES += \
    gps/loc_api/libloc_api_50001/loc.cpp \
    gps/loc_api/libloc_api_50001/gps.c

LOCAL_CFLAGS += \
    -fno-short-enums \
    -D_ANDROID_ \

ifeq ($(TARGET_USES_QCOM_BSP), true)
LOCAL_CFLAGS += -DTARGET_USES_QCOM_BSP
endif
## Includes
LOCAL_C_INCLUDES:= \
    $(TARGET_OUT_HEADERS)/gps.utils \
    $(TARGET_OUT_HEADERS)/libloc_core \
    $(TARGET_OUT_HEADERS)/libloc_eng

LOCAL_PRELINK_MODULE := false
LOCAL_MODULE_RELATIVE_PATH := hw
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)

## Libs
LOCAL_SHARED_LIBRARIES := \
    libutils \
    libcutils \
    liblog

LOCAL_SRC_FILES += \
    gps/utils/loc_log.cpp \
    gps/utils/loc_cfg.cpp \
    gps/utils/msg_q.c \
    gps/utils/linked_list.c \
    gps/utils/loc_target.cpp \
    gps/utils/loc_timer.c \
    gps/platform_lib_abstractions/elapsed_millis_since_boot.cpp


LOCAL_CFLAGS += \
     -fno-short-enums \
     -D_ANDROID_

LOCAL_LDFLAGS += -Wl,--export-dynamic

## Includes
LOCAL_C_INCLUDES:= \
    $(TARGET_OUT_HEADERS)/gps.utils \
    $(LOCAL_PATH)/gps/platform_lib_abstractions

LOCAL_COPY_HEADERS_TO:= gps.utils
LOCAL_COPY_HEADERS:= \
   gps/utils/loc_log.h \
   gps/utils/loc_cfg.h \
   gps/utils/log_util.h \
   gps/utils/linked_list.h \
   gps/utils/msg_q.h \
   gps/utils/loc_target.h \
   gps/utils/loc_timer.h \
   gps/platform_lib_abstractions/platform_lib_includes.h \
   gps/platform_lib_abstractions/platform_lib_time.h \
   gps/platform_lib_abstractions/platform_lib_macros.h

LOCAL_MODULE := libgps.utils
LOCAL_MODULE_TAGS := optional
LOCAL_PRELINK_MODULE := false
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := com.qualcomm.location
LOCAL_SRC_FILES := prebuilts/com.qualcomm.location.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := com.qualcomm.services.location
LOCAL_SRC_FILES := prebuilts/com.qualcomm.services.location.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := TimeService
LOCAL_SRC_FILES := prebuilts/TimeService.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    camera/CameraWrapper.cpp camera/QCameraParameters.cpp
LOCAL_SHARED_LIBRARIES := \
    libhardware liblog libcamera_client libutils
LOCAL_C_INCLUDES += \
    system/media/camera/include

LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE := camera.$(TARGET_BOARD_PLATFORM)
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)

include $(call all-makefiles-under,$(LOCAL_PATH))

endif
