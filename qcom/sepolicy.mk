#
# This policy configuration will be used by all qcom products

# that inherit from Stag-OS
#

BOARD_SEPOLICY_DIRS += \
	device/stag/sepolicy/qcom/common \
        device/stag/sepolicy/qcom/$(TARGET_BOARD_PLATFORM)

ifeq ($(TARGET_COPY_OUT_VENDOR), vendor)
ifeq ($(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE),)
TARGET_USES_PREBUILT_VENDOR_SEPOLICY ?= true
endif
endif

BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    device/stag/sepolicy/qcom/private

ifeq ($(TARGET_USES_PREBUILT_VENDOR_SEPOLICY), true)
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    device/stag/sepolicy/qcom/dynamic
else
BOARD_SEPOLICY_DIRS += \
    device/stag/sepolicy/qcom/dynamic \
    device/stag/sepolicy/qcom/vendor 
endif
     
