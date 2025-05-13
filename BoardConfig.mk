LOCAL_PATH := device/samsung/a02

ALLOW_MISSING_DEPENDENCIES := true

TARGET_BOARD_PLATFORM := mt6739               # From ro.mediatek.platform, but lowercase value
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := k39tv1_bsp_titan_hamster     # From ro.product.board

# These two are for MTK Chipsets only
BOARD_USES_MTK_HARDWARE := true
BOARD_HAS_MTK_HARDWARE := true

# Recovery
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true            # To add info about F2FS Filesystem Data Block
# Put The Size of your Recovery Partition below, get it from your "MT****_Android_scatter.txt"
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 25165824
BOARD_USES_FULL_RECOVERY_IMAGE := true      # Uncomment this line if you want to remove size restriction
BOARD_FLASH_BLOCK_SIZE := 131072                   # Might be different for your chip
BOARD_HAS_NO_REAL_SDCARD := true              # Depricated
# BOARD_HAS_NO_SELECT_BUTTON := true          # Depricated
BOARD_SUPPRESS_SECURE_ERASE := true
#BOARD_HAS_NO_MISC_PARTITION := true           # Delete if your partition table has /misc
BOARD_RECOVERY_SWIPE := true
BOARD_USES_MMCUTILS := true
BOARD_SUPPRESS_EMMC_WIPE := true
BOARD_CHARGER_SHOW_PERCENTAGE := true
RECOVERY_SDCARD_ON_DATA := true               # Optional: If /sdcard partition is emulated on /data partition 

# TWRP stuff
TW_EXCLUDE_SUPERSU := true                    # true/false: Add SuperSU or not
TW_INCLUDE_CRYPTO := true                     # true/false: Add Data Encryption Support or not
TW_INPUT_BLACKLIST := "hbtp_vm"               # Optional: Disables virtual mouse
TW_SCREEN_BLANK_ON_BOOT := true
TW_THEME := portrait_hdpi                     # Set the exact theme you wanna use. If resulation doesn't match, define the height/width
DEVICE_RESOLUTION := 720x1600                 # The Resolution of your Device
TARGET_SCREEN_HEIGHT := 1600                    # The height
TARGET_SCREEN_WIDTH := 720                      # The width
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 80                   # Set custom brightness, low is better

TW_INCLUDE_NTFS_3G := false                    # Include NTFS Filesystem Support
TW_INCLUDE_FUSE_EXFAT := true                 # Include Fuse-ExFAT Filesystem Support
TWRP_INCLUDE_LOGCAT := true                   # Include LogCat Binary
TW_INCLUDE_FB2PNG := true                     # Include Screenshot Support
TW_DEFAULT_LANGUAGE := en                     # Set Default Language 
TW_EXTRA_LANGUAGES := false

# Kernel
TARGET_IS_64_BIT := false                      # true/false: Determine if the device is 64-bit or not
# Get the CMDLine, Base, Pagesize and offsets from Unpacked recovery image and put below
BOARD_KERNEL_CMDLINE := bootopt=64S3,32S1,32S1 androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --header_version 2 --ramdisk_offset 0x05000000 --tags_offset 0x04000000
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_KERNEL_SEPARATED_DTBO := true
TARGET_KERNEL_CONFIG := a02_defconfig

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_INCLUDE_DTB_IN_BOOTIMG := 
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
BOARD_KERNEL_SEPARATED_DTBO := 
endif

# Set FSTAB
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/recovery/root/etc/recovery.fstab

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a7
TARGET_CPU_ABI_LIST := $(TARGET_CPU_ABI),$(TARGET_CPU_ABI2)
