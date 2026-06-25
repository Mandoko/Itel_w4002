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

# Inherit from itel-W4002 device
$(call inherit-product, device/itel/W4002/device.mk)

# Force ADB debugging on and disable secure shell authorization
PRODUCT_PROPERTY_OVERRIDES += \
    ro.secure=0 \
    ro.adb.secure=0 \
    ro.debuggable=1 \
    persist.sys.usb.config=mtp,adb
    
# Set the target API profile to match Android 11 launch specifications
PRODUCT_SHIPPING_API_LEVEL := 29

# Explicitly force inclusion of user auth HAL services
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.0-service \
    android.hardware.gatekeeper@1.0-service
    

PRODUCT_DEVICE := W4002
PRODUCT_NAME := twrp_W4002
PRODUCT_BRAND := Itel
PRODUCT_MODEL := itel W4002
PRODUCT_MANUFACTURER := itel

PRODUCT_GMS_CLIENTID_BASE := android-transsion

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="W4002-F3113-10-OP-V030-20221114"

BUILD_FINGERPRINT := Itel/F3113/itel-W4002:10/QP1A.190711.020/OP-V030-20221114:user/release-keys
