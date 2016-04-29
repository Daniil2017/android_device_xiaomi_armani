#	Android 6.0
#	 OmniRom
#	Daniil2017

#	COMMON
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
DEVICE_PACKAGE_OVERLAYS += device/xiaomi/armani/overlay

#	ART
PRODUCT_PROPERTY_OVERRIDES += dalvik.vm.dex2oat-flags=--no-watch-dog

#	GRAPHICS
PRODUCT_PACKAGES += \
    copybit.msm8226 \
    gralloc.msm8226 \
    hwcomposer.msm8226 \
    memtrack.msm8226

PRODUCT_PROPERTY_OVERRIDES += \
    ro.qualcomm.cabl=0 \
    drm.service.enabled=true

#	AUDIO
PRODUCT_PACKAGES += \
    audiod \
    audio.a2dp.default \
    audio.primary.msm8226 \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    tinymix \
    qcmediaplayer \
    libdashplayer

PRODUCT_BOOT_JARS += qcmediaplayer

#	EBTABLES
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes \
    libebtc

#	MEMORY
PRODUCT_PACKAGES += \
    make_ext4fs \
    e2fsck \
    resize2fs \
    setup_fs

#	KEYSTORE
PRODUCT_PACKAGES += \
    keystore.msm8226

#	LIGHTS
PRODUCT_PACKAGES += \
    lights.msm8226

#	POWER
PRODUCT_PACKAGES += \
    power.msm8226

PRODUCT_PACKAGES += \
    libxml2

#	TIME SERVICES
PRODUCT_PROPERTY_OVERRIDES += persist.timed.enable=true

#	CAMERA
PRODUCT_PROPERTY_OVERRIDES += \
    camera2.portability.force_api=1

#	BLUETOOTH
PRODUCT_PROPERTY_OVERRIDES += \
    bluetooth.hfp.client=1 \
    qcom.bt.dev_power_class=1

#	MEDIA
PRODUCT_PACKAGES += \
    libOmxCore \
    libOmxVdec \
    libOmxVenc \
    libstagefrighthw

PRODUCT_COPY_FILES += \
    frameworks/av-caf/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av-caf/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av-caf/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

#	PERMISSIONS
PRODUCT_COPY_FILES += \
    frameworks/native-caf/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native-caf/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native-caf/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native-caf/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native-caf/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native-caf/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native-caf/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native-caf/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native-caf/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native-caf/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native-caf/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native-caf/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native-caf/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native-caf/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native-caf/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native-caf/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native-caf/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml \
    frameworks/native-caf/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native-caf/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

#	WIFI
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    ro.disableWifiApFirmwareReload=true

PRODUCT_PACKAGES += \
    libcurl \
    libqsap_sdk \
    libQWiFiSoftApCfg \
    libwcnss_qmi \
    wcnss_service

#	ANT+
PRODUCT_PACKAGES += \
    AntHalService \
    com.dsi.ant.antradio_library \
    libantradio

#	CHARGER
PRODUCT_PACKAGES += \
    charger_res_images \
    libhealthd.armani

#	GPS
PRODUCT_PACKAGES += \
    gps.msm8226

#	OTHER
PRODUCT_PROPERTY_OVERRIDES += \
    persist.debug.wfd.enable=1 \
    persist.sys.wfd.virtual=0 \
    ro.vendor.extension_library=/vendor/lib/libqti-perfd-client.so

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    sys.usb.config=mtp,adb

$(call inherit-product, frameworks/native-caf/build/phone-xhdpi-1024-dalvik-heap.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, device/common/gps/gps_us_supl.mk)
$(call inherit-product, vendor/omni/config/common.mk)
$(call inherit-product, vendor/omni/config/gsm.mk)
$(call inherit-product, vendor/xiaomi/armani/armani.mk)
PRODUCT_DEVICE := armani
PRODUCT_NAME := armani
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := armani
PRODUCT_MANUFACTURER := Xiaomi
