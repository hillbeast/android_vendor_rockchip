
PRODUCT_PACKAGES += \
    RkApkinstaller  \
    RKUpdateService

ifneq ($(strip $(TARGET_BOARD_PLATFORM)), sofia3gr)
ifneq ($(strip $(BOARD_USE_LOW_MEM256)), true)
PRODUCT_PACKAGES += \
    MediaFloat      \
    GoogleEmail
endif
endif

ifeq ($(strip $(TARGET_BOARD_PLATFORM)), rk3288)
PRODUCT_PACKAGES += \
    WinStartService
endif

ifeq ($(strip $(TARGET_BOARD_PLATFORM)), rk3366)
PRODUCT_PACKAGES += \
    WinStartService \
    projectX
endif

ifeq ($(strip $(TARGET_BOARD_PLATFORM)), rk3368)
PRODUCT_PACKAGES += \
    WinStartService \
    projectX
endif

ifeq ($(strip $(TARGET_BOARD_PLATFORM)), rk312x)
PRODUCT_PACKAGES += \
    RkVideoPlayer
else
ifeq ($(strip $(TARGET_BOARD_PLATFORM_PRODUCT)), box)
PRODUCT_PACKAGES += \
    RkBoxVideoPlayer
else
ifeq ($(strip $(TARGET_BOARD_PLATFORM)), sofia3gr)
PRODUCT_PACKAGES += \
    Rk3grVideoPlayer
else
PRODUCT_PACKAGES += \
    Rk4kVideoPlayer
endif
endif
endif

ifeq ($(strip $(TARGET_BOARD_PLATFORM)), sofia3gr)
PRODUCT_PACKAGES += \
    Rk3grExplorer
else
PRODUCT_PACKAGES += \
    RkExplorer
endif

ifeq ($(strip $(TARGET_BOARD_PLATFORM)), sofia3gr)
PRODUCT_PACKAGES += \
    ituxd\
    com.rockchip.alarmhelper \
    RFTest

#PRODUCT_COPY_FILES += \
#        $(LOCAL_PATH)/ituxd/lib/x86/libthermalJNI.so:system/lib/libthermalJNI.so
endif

PRODUCT_COPY_FILES += \
       $(LOCAL_PATH)/DeviceTest/lib/systemconfig:system/bin/systemconfig


###########for box app ################
ifeq ($(strip $(TARGET_BOARD_PLATFORM_PRODUCT)), box)
PRODUCT_PACKAGES += \
    eHomeMediaCenter_box	\
    Launcher3	\
    RKGameControlSettingV1.0.1	\
    DualScreenApk \
    RkMusic	
endif
