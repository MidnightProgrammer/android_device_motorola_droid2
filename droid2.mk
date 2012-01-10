#
# Copyright (C) 2009 The Android Open Source Project
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
# This is the product configuration for a generic droid2,
# not specialized for any geography.
#

# Build with bootchart compatibility
# info on utilizing @ http://bit.ly/zwWpzK
INIT_BOOTCHART := true

DEVICE_PREBUILT := device/moto/droid2/prebuilt

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

## (1) First, the most specific values, i.e. the aspects that are specific to GSM

PRODUCT_COPY_FILES += \
    device/moto/droid2/init.rc:root/init.rc \
    device/moto/droid2/init.mapphone_cdma.rc:root/init.mapphone_cdma.rc \
    device/moto/droid2/init.mapphone_cdma.rc:root/init.mapphone_umts.rc \
    device/moto/droid2/init.mapphone_cdma.usb.rc:root/init.mapphone_cdma.usb.rc \
    device/moto/droid2/ueventd.mapphone_cdma.rc:root/ueventd.mapphone_cdma.rc

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects

# Device overlay
DEVICE_PACKAGE_OVERLAYS += device/moto/droid2/overlay

# high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_PACKAGES := \
    charger \
    charger_res_images

# Permissions files
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Prebuilts
PRODUCT_COPY_FILES += \
    $(DEVICE_PREBUILT)/bin/mount_ext3.sh:system/bin/mount_ext3.sh \
    $(DEVICE_PREBUILT)/etc/apns-conf.xml:system/etc/apns-conf.xml \
    $(DEVICE_PREBUILT)/etc/gps.conf:system/etc/gps.conf \
    $(DEVICE_PREBUILT)/etc/media_profiles.xml:system/etc/media_profiles.xml \
    $(DEVICE_PREBUILT)/etc/powervr.ini:system/etc/powervr.ini \
    $(DEVICE_PREBUILT)/etc/vold.fstab:system/etc/vold.fstab \
    $(DEVICE_PREBUILT)/media/bootanimation.zip:system/media/bootanimation.zip \

# Wifi
PRODUCT_COPY_FILES += \
    $(DEVICE_PREBUILT)/etc/wifi/tiwlan_ap.ini:system/etc/wifi/tiwlan_ap.ini \
    $(DEVICE_PREBUILT)/etc/wifi/tiwlan.ini:system/etc/wifi/tiwlan.ini \
    $(DEVICE_PREBUILT)/etc/wpa_supplicant.conf:system/etc/wpa_supplicant.conf \

# Key Layouts
PRODUCT_COPY_FILES += \
    $(DEVICE_PREBUILT)/usr/idc/qtouch-touchscreen.idc:system/usr/idc/qtouch-touchscreen.idc \
    $(DEVICE_PREBUILT)/usr/keychars/omap-keypad.kcm:system/usr/keychars/omap-keypad.kcm \
    $(DEVICE_PREBUILT)/usr/keychars/qtouch-touchscreen.kcm:system/usr/keychars/qtouch-touchscreen.kcm \
    $(DEVICE_PREBUILT)/usr/keylayout/cdma_droid2-keypad.kl:system/usr/keylayout/cdma_droid2-keypad.kl \
    $(DEVICE_PREBUILT)/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    $(DEVICE_PREBUILT)/usr/keylayout/cpcap-key.kl:system/usr/keylayout/cpcap-key.kl \
    $(DEVICE_PREBUILT)/usr/keylayout/usb_keyboard_102_en_us.kl:system/usr/keylayout/usb_keyboard_102_en_us.kl \
    $(DEVICE_PREBUILT)/usr/keylayout/omap-keypad.kl:system/usr/keylayout/omap-keypad.kl \

# Graphics
PRODUCT_COPY_FILES += \
    $(DEVICE_PREBUILT)/etc/egl.cfg:system/etc/egl.cfg \
    $(DEVICE_PREBUILT)/imgtec/pvrsrvinit:system/bin/pvrsrvinit \
    $(DEVICE_PREBUILT)/imgtec/libEGL_POWERVR_SGX530_125.so:system/lib/egl/libEGL_POWERVR_SGX530_125.so \
    $(DEVICE_PREBUILT)/imgtec/libGLESv1_CM_POWERVR_SGX530_125.so:system/lib/egl/libGLESv1_CM_POWERVR_SGX530_125.so \
    $(DEVICE_PREBUILT)/imgtec/libGLESv2_POWERVR_SGX530_125.so:system/lib/egl/libGLESv2_POWERVR_SGX530_125.so \
    $(DEVICE_PREBUILT)/imgtec/libglslcompiler.so:system/lib/libglslcompiler.so \
    $(DEVICE_PREBUILT)/imgtec/libHPImgApi.so:system/lib/libHPImgApi.so \
    $(DEVICE_PREBUILT)/imgtec/libIMGegl.so:system/lib/libIMGegl.so \
    $(DEVICE_PREBUILT)/imgtec/libpvr2d.so:system/lib/libpvr2d.so \
    $(DEVICE_PREBUILT)/imgtec/libpvrANDROID_WSEGL.so:system/lib/libpvrANDROID_WSEGL.so \
    $(DEVICE_PREBUILT)/imgtec/libsrv_init.so:system/lib/libsrv_init.so \
    $(DEVICE_PREBUILT)/imgtec/libsrv_um.so:system/lib/libsrv_um.so \
    $(DEVICE_PREBUILT)/imgtec/libusc.so:system/lib/libusc.so \
    $(DEVICE_PREBUILT)/imgtec/libeglinfo.so:system/lib/egl/libeglinfo.so \
    $(DEVICE_PREBUILT)/imgtec/libgles1_texture_stream.so:system/lib/egl/libgles1_texture_stream.so \
    $(DEVICE_PREBUILT)/imgtec/libgles2_texture_stream.so:system/lib/egl/libgles2_texture_stream.so \
    $(DEVICE_PREBUILT)/imgtec/gralloc.omap3.so:system/lib/hw/gralloc.omap3.so \
    $(DEVICE_PREBUILT)/imgtec/libPVRScopeServices.so:system/lib/libPVRScopeServices.so \

# HW Libs
PRODUCT_PACKAGES += \
    hwcomposer.default \

# Lights
PRODUCT_PACKAGES += \
    lights.droid2 \

# Sensors
PRODUCT_PACKAGES += \
    sensors.droid2 \

# Audio
PRODUCT_PACKAGES += \
    audio.primary.droid2 \
    audio_policy.droid2 \

# Modem
PRODUCT_PACKAGES += \
    libaudiomodemgeneric \
    libreference-cdma-sms \
    rild \
    radiooptions \

# Wifi
PRODUCT_PACKAGES += \
    libCustomWifi \
    wlan_loader \
    wlan_cu \
    dhcpcd.conf \
    wpa_supplicant.conf \

# Misc
PRODUCT_PACKAGES += \
    Camera \
    Usb \
    Superuser \
    su \
    GlobalNwSwitch \ ##This is marked for removal and will only be included once

# Sandbox
# we should stop using hijack prebuilts soon
PRODUCT_COPY_FILES += \
    $(DEVICE_PREBUILT)/bin/hijack:system/bin/hijack \
    $(DEVICE_PREBUILT)/bin/hijack.log_dump:system/bin/hijack.log_dump \
    $(DEVICE_PREBUILT)/etc/hijack-boot.zip:system/etc/hijack-boot.zip \
    $(DEVICE_PREBUILT)/bin/load_modules.sh:system/bin/load_modules.sh \

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# High-density artwork where available
PRODUCT_LOCALES += hdpi

# these need to be here for the installer, just put them here for now
PRODUCT_COPY_FILES += \
    device/moto/droid2/releaseutils/mke2fs:system/bin/mke2fs \
    device/moto/droid2/releaseutils/tune2fs:system/bin/tune2fs \
    device/moto/droid2/releaseutils/check_kernel:system/etc/releaseutils/check_kernel \
    device/moto/droid2/releaseutils/finalize_release:system/etc/finalize_release

# copy all kernel modules under the "modules" directory to system/lib/modules
PRODUCT_COPY_FILES += $(shell \
    find device/moto/droid2/modules -name '*.ko' \
    | sed -r 's/^\/?(.*\/)([^/ ]+)$$/\1\2:system\/lib\/modules\/\2/' \
    | tr '\n' ' ')

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/moto/droid2/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, hardware/ti/omap3/Android.mk)

$(call inherit-product-if-exists, vendor/moto/droid2/droid2-vendor.mk)
$(call inherit-product-if-exists, vendor/cm/config/common_full_phone.mk)

# stuff common to all moto phones
#$(call inherit-product, device/moto/common/common_hijack.mk)

$(call inherit-product, build/target/product/full_base.mk)

PRODUCT_NAME := cm_droid2
PRODUCT_DEVICE := droid2
