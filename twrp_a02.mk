#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from a02 device
$(call inherit-product, device/samsung/a02/device.mk)


# Fles under $(LOCAL_PATH)/recovery/root/ gets automatically copied into recovery
# PRODUCT_COPY_FILES += $(LOCAL_PATH)/recovery/root/*:root/*

PRODUCT_DEVICE := a02
PRODUCT_NAME := twrp_a02
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-A022F
PRODUCT_MANUFACTURER := samsung

# Forcefully add mtp support (adb is already there)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# Add fingerprint from Stock ROM build.prop
PRODUCT_BUILD_PROP_OVERRIDES += \
    # These lines are from my device. You MUST Replace yours.
    BUILD_FINGERPRINT="samsung/a02xx/a02:11/RP1A.200720.012/A022FXXS3BWH1:user/release-keys" \
    PRIVATE_BUILD_DESC="a02xx-user 11 RP1A.200720.012 A022FXXS3BWH1 release-keys"