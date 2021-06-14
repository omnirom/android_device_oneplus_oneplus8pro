# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017 The LineageOS Project
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
# This file is the build configuration for a full Android
# build for grouper hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

PRODUCT_PACKAGES += \
    libhidltransport \
    libhwbinder \
    android.hidl.manager@1.0 \
    android.hidl.manager@1.1 \
    android.hidl.manager@1.2 \
    libcutils \
    libtflite \
    libtextclassifier_hash \
    libavservices_minijail \
    libmediaplayerservice \
    libbluetooth_qti \
    libbtconfigstore

PRODUCT_PACKAGES += \
    libinit_oneplus8pro \
    omnipreopt_script

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.build.version.all_codenames=$(PLATFORM_VERSION_ALL_CODENAMES) \
    ro.build.version.codename=$(PLATFORM_VERSION_CODENAME) \
    ro.build.version.release=$(PLATFORM_VERSION) \
    ro.build.version.sdk=$(PLATFORM_SDK_VERSION)

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    system \
    system_ext \
    vbmeta \
    product \
    vbmeta_system \
    vendor \
    odm

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/omnipreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_HOST_PACKAGES += \
    brillo_update_payload

# Boot control
PRODUCT_PACKAGES_DEBUG += \
    bootctl

# Boot control
PRODUCT_PACKAGES += \
    fastbootd

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

PRODUCT_PACKAGES += \
    omni_charger_res_images \
    animation.txt \
    font_charger.png

PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    librs_jni

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.verified_boot.xml

PRODUCT_PACKAGES += fstab.qcom

PRODUCT_PACKAGES += \
    omni.biometrics.fingerprint.inscreen@1.0-service.oneplus8pro \
    vendor.qti.hardware.bluetooth_audio@2.0 \
    libbtconfigstore \
    libgralloc.qti \
    vendor.qti.hardware.systemhelper@1.0 \
    android.hardware.thermal@2.0

PRODUCT_PACKAGES += com.qualcomm.qti.bluetooth_audio@1.0
PRODUCT_PACKAGES += vendor.qti.hardware.btconfigstore@1.0
PRODUCT_PACKAGES += vendor.qti.hardware.capabilityconfigstore@1.0 \
    vendor.qti.hardware.capabilityconfigstore-V1.0-java

PRODUCT_AAPT_CONFIG := xxxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi
PRODUCT_CHARACTERISTICS := nosdcard

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_codecs_google_video.xml

# Camera
PRODUCT_PACKAGES += \
    SnapdragonCamera2

# ANT+
PRODUCT_PACKAGES += \
    AntHalService

# QMI
PRODUCT_PACKAGES += \
    libjson

PRODUCT_PACKAGES += \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml \
    tcmiface

# Netutils
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0 \
    libandroid_net

PRODUCT_PACKAGES += \
    DeviceParts \
    FrameRateTile

PRODUCT_PACKAGES += \
    vndk_package

PRODUCT_PACKAGES += \
    android.hidl.base@1.0

PRODUCT_PACKAGES += \
    vendor.display.config@2.0 \
    libdisplayconfig.qti \
    libqdMetaData \
    vendor.nxp.nxpese@1.0 \
    vendor.nxp.nxpnfc@1.0 \
    vendor.oneplus.camera.CameraHIDL@1.0 \
    vendor.oneplus.fingerprint.extension@1.0 \
    vendor.qti.hardware.camera.device@1.0 \
    vendor.qti.hardware.camera.postproc@1.0 \
    vendor.qti.hardware.systemhelper@1.1 \
    vendor.qti.hardware.bluetooth_dun@1.0 \
    android.hardware.bluetooth@1.0

#Nfc
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.0 \
    android.hardware.nfc@1.1 \
    android.hardware.nfc@1.2


# Display
PRODUCT_PACKAGES += \
    libion \
    libtinyxml2

PRODUCT_PACKAGES += \
    libtinyalsa


PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_codecs_google_video.xml

PRODUCT_PACKAGES += \
    vendor.qti.hardware.wifi@1.0 \

# Remove unwanted packages
PRODUCT_PACKAGES += \
    RemovePackages

PRODUCT_BOOT_JARS += \
    tcmiface \
    WfdCommon

PRODUCT_BOOT_JARS += UxPerformance
PRODUCT_BOOT_JARS += QPerformance
#PRODUCT_BOOT_JARS += android.hidl.manager-V1.0-java

PRODUCT_PACKAGES += oneplus8-mock
PRODUCT_BOOT_JARS += oneplus8-mock

TARGET_FS_CONFIG_GEN := device/oneplus/oneplus8pro/config.fs

PRODUCT_MANIFEST_FILES += \
    device/oneplus/oneplus8pro/vintf/com.qualcomm.qti.uceservice-2.2.xml \
    device/oneplus/oneplus8pro/vintf/android.hardware.sensors-2.0.xml \
    device/oneplus/oneplus8pro/vintf/vendor.omni.biometrics.fingerprint.inscreen-1.0-service.xml


PRODUCT_PACKAGES += DeskClock
PRODUCT_PACKAGES += qtiImsInCallUi
PRODUCT_PACKAGES += ConfURIDialer
PRODUCT_PACKAGES += android.hardware.vibrator-service.oneplus8
PRODUCT_PACKAGES += libqtivibratoreffect

ifneq ($(filter $(ROM_BUILD_RADIO), true),)
AB_OTA_PARTITIONS += abl
AB_OTA_PARTITIONS += aop
AB_OTA_PARTITIONS += bluetooth
AB_OTA_PARTITIONS += cmnlib64
AB_OTA_PARTITIONS += cmnlib
AB_OTA_PARTITIONS += devcfg
AB_OTA_PARTITIONS += dsp
AB_OTA_PARTITIONS += featenabler
AB_OTA_PARTITIONS += hyp
AB_OTA_PARTITIONS += imagefv
AB_OTA_PARTITIONS += keymaster
AB_OTA_PARTITIONS += logo
#AB_OTA_PARTITIONS += mdm_oem_stanvbk
AB_OTA_PARTITIONS += modem
AB_OTA_PARTITIONS += multiimgoem
AB_OTA_PARTITIONS += qupfw
AB_OTA_PARTITIONS += storsec
#AB_OTA_PARTITIONS += spunvm
#AB_OTA_PARTITIONS += reserve
AB_OTA_PARTITIONS += tz
AB_OTA_PARTITIONS += uefisecapp
AB_OTA_PARTITIONS += xbl_config
AB_OTA_PARTITIONS += xbl
endif

$(call inherit-product, build/make/target/product/gsi_keys.mk)

PRODUCT_COPY_FILES += \
    device/qcom/qssi/public.libraries.product-qti.txt:$(TARGET_COPY_OUT_PRODUCT)/etc/public.libraries-qti.txt
PRODUCT_COPY_FILES += \
    device/qcom/qssi/public.libraries.system_ext-qti.txt:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/public.libraries-qti.txt
# whitelisted app
PRODUCT_COPY_FILES += \
    device/qcom/qssi/qti_whitelist.xml:system/etc/sysconfig/qti_whitelist.xml \
    device/qcom/qssi/qti_whitelist_system_ext.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/qti_whitelist_system_ext.xml

