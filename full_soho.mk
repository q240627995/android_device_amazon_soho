$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/amazon/soho/soho-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/amazon/soho/overlay

LOCAL_PATH := device/amazon/soho
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/recovery/root/init.recovery.bowser.rc:recovery/root/init.recovery.bowser.rc \
	$(LOCAL_PATH)/recovery/root/etc/twrp.fstab:recovery/root/etc/twrp.fstab

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0 PRODUCT_NAME=soho
PRODUCT_NAME := full_soho
PRODUCT_DEVICE := soho
PRODUCT_MODEL := KFSOWI