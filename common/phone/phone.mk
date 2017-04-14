CUR_PATH := vendor/rockchip/common

#########################################################
#   3G Dongle SUPPORT
#########################################################
PRODUCT_COPY_FILES += \
    $(CUR_PATH)/phone/etc/ppp/ip-down:system/etc/ppp/ip-down \
    $(CUR_PATH)/phone/etc/ppp/ip-up:system/etc/ppp/ip-up \
    $(CUR_PATH)/phone/etc/ppp/call-pppd:system/etc/ppp/call-pppd \
    $(CUR_PATH)/phone/etc/operator_table:system/etc/operator_table
ifneq ($(strip $(TARGET_BOARD_PLATFORM)), rk3188)
PRODUCT_COPY_FILES += \
    $(CUR_PATH)/phone/bin/usb_modeswitch.sh:system/bin/usb_modeswitch.sh \
    $(CUR_PATH)/phone/bin/usb_modeswitch:system/bin/usb_modeswitch \
    $(CUR_PATH)/phone/bin/chat:system/bin/chat \
    $(CUR_PATH)/phone/lib/libril-rk29-dataonly.so:system/lib/libril-rk29-dataonly.so
endif
modeswitch_files := $(shell ls $(CUR_PATH)/phone/etc/usb_modeswitch.d)
PRODUCT_COPY_FILES += \
    $(foreach file, $(modeswitch_files), \
    $(CUR_PATH)/phone/etc/usb_modeswitch.d/$(file):system/etc/usb_modeswitch.d/$(file))

ifeq ($(strip $(PRODUCT_MODEM)), lc6365)
PRODUCT_COPY_FILES += \
    $(CUR_PATH)/phone/bin/rild_lc6365:system/bin/rild \
    $(CUR_PATH)/phone/lib/libreference-ril-lc6365.so:system/lib/libreference-ril.so \
    $(CUR_PATH)/phone/lib/libril-lc6365.so:system/lib/libril.so \
    $(CUR_PATH)/phone/lib/modules/lc_ltencm.ko:system/lib/modules/lc_ltencm.ko
endif

PRODUCT_PACKAGES += \
    rild \
    chat 


PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.com.android.dataroaming=true \
	ril.function.dataonly=1
