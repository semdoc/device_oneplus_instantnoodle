#
# Copyright (C) 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-aicp

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# Device init scripts
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.aicp-sm8250.rc

# OPFeature
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/odm_feature_list:$(TARGET_COPY_OUT_ODM)/etc/odm_feature_list

# Wifi Overlay
PRODUCT_PACKAGES += \
    OnePlus8WifiOverlay

# Sensors
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensors/row/kona_bmi26x_0.json:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/config/kona_bmi26x_row.json \
    $(LOCAL_PATH)/configs/sensors/row/kona_mmc5603x_0.json:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/config/kona_mmc5603x_0_row.json \
    $(LOCAL_PATH)/configs/sensors/vzw/kona_T0_bmi26x_0.json:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/config/kona_T0_bmi26x_0_vzw.json \
    $(LOCAL_PATH)/configs/sensors/vzw/kona_bmi26x_0.json:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/config/kona_bmi26x_0_vzw.json \
    $(LOCAL_PATH)/configs/sensors/vzw/kona_mmc5603x_0.json:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/config/kona_mmc5603x_0_vzw.json

# API Level
PRODUCT_SHIPPING_API_LEVEL := 29

# DeviceParts
PRODUCT_PACKAGES += \
    PartsBin

PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    $(LOCAL_PATH)/overlay-aicp/packages/apps/PartsBin

PRODUCT_PROPERTY_OVERRIDES += \
    vendor.product.device=instantnoodle

# Inherit from oneplus sm8250-common
$(call inherit-product, device/oneplus/sm8250-common/common.mk)

# Inherit from vendor blobs
$(call inherit-product, vendor/oneplus/instantnoodle/instantnoodle-vendor.mk)
