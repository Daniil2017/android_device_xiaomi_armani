#	Android 6.0
#	 OmniRom
#	Daniil2017

#	CPU
TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a7
TARGET_CPU_SMP := true
TARGET_BOARD_PLATFORM := msm8226
ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_NEON := true
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

#	GRAPHICS
TARGET_BOARD_PLATFORM_GPU := qcom-adreno305
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
USE_OPENGL_RENDERER := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
TARGET_QCOM_DISPLAY_VARIANT := caf-msm8974
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
BOARD_EGL_CFG := vendor/xiaomi/armani/system/lib/egl/egl.cfg

#	BOOTLOADER
TARGET_BOOTLOADER_BOARD_NAME := MSM8226
TARGET_OTA_ASSERT_DEVICE := armani
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
BLOCK_BASED_OTA := false

#	HARDWARE
BOARD_USES_QCOM_HARDWARE := true
TARGET_USES_QCOM_BSP := true
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP

#	MEDIA
TARGET_QCOM_MEDIA_VARIANT := caf-msm8974

#	AUDIO
TARGET_QCOM_AUDIO_VARIANT := caf-msm8974
BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_NEW_SAMPLE_RATE := true

#	KERNEL
BOARD_KERNEL_SEPARATED_DT := true
BOARD_CUSTOM_BOOTIMG_MK := device/xiaomi/armani/mkbootimg.mk
TARGET_KERNEL_SOURCE := kernel/xiaomi/armani
TARGET_KERNEL_CONFIG := armani_omni_defconfig
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=armani user_debug=31 msm_rtb.filter=0x37 androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 --tags_offset 0x00000100
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/linux-x86/arm/arm-eabi-4.7/bin
KERNEL_TOOLCHAIN_PREFIX := arm-eabi-

#	MEMORY
TARGET_HW_DISK_ENCRYPTION := true
BOARD_BOOTIMAGE_PARTITION_SIZE     := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 838860800
BOARD_USERDATAIMAGE_PARTITION_SIZE := 6241112064
BOARD_CACHEIMAGE_PARTITION_SIZE    := 402653184
BOARD_PERSISTIMAGE_PARTITION_SIZE  := 33554432
BOARD_FLASH_BLOCK_SIZE             := 131072
MALLOC_IMPL := dlmalloc
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun0/file
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true

#	RECOVERY
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
TW_INCLUDE_CRYPTO := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
RECOVERY_GRAPHICS_USE_LINELENGTH := true
BOARD_SUPPRESS_SECURE_ERASE := true
TARGET_RECOVERY_FSTAB := vendor/xiaomi/armani/boot/recovery_ramdisk/recovery.fstab
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
TWHAVE_SELINUX := true

#	SELINUX
include device/qcom/sepolicy/sepolicy.mk
BOARD_SEPOLICY_DIRS += device/xiaomi/armani/sepolicy

#	TIME SERVICES
BOARD_USES_QC_TIME_SERVICES := true

#	RIL
TARGET_RIL_VARIANT := caf
COMMON_GLOBAL_CFLAGS += -DUSE_RIL_VERSION_10
COMMON_GLOBAL_CPPFLAGS += -DUSE_RIL_VERSION_10
SIM_COUNT := 2

#	ANT+
BOARD_ANT_WIRELESS_DEVICE := "qualcomm-smd"

#	WIFI
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
WIFI_DRIVER_FW_PATH_AP := "ap"
WIFI_DRIVER_FW_PATH_STA := "sta"
WPA_SUPPLICANT_VERSION := VER_0_8_X
TARGET_PROVIDES_WCNSS_QMI := true
TARGET_USES_QCOM_WCNSS_QMI := true


#	LIGHTS
TARGET_PROVIDES_LIBLIGHT := true

#	CHARGER
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_DISABLE_INIT_BLANK := true
BOARD_HAL_STATIC_LIBRARIES := libhealthd.armani
HEALTHD_ENABLE_TRICOLOR_LED := true

#	INIT
TARGET_UNIFIED_DEVICE := true
TARGET_INIT_VENDOR_LIB := libinit_msm

#	OTHER
WITH_DEXPREOPT := true
