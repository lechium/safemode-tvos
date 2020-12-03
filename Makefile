TARGET := appletv:12.1:11.0
ARCHS := arm64
GO_EASY_ON_ME = 1
THEOS_DEVICE_IP = guest-room.local
PACKAGE_VERSION = 0.9.6005-2
#PACKAGE_VERSION := $(shell ./version.sh)

include $(THEOS)/makefiles/common.mk

TWEAK_NAME := MobileSafety
MobileSafety_FILES := Tweak.xm
MobileSafety_FRAMEWORKS := UIKit
MobileSafety_OPTFLAG := -O2

ADDITIONAL_CFLAGS += -Wno-error=tautological-undefined-compare -Wno-error=deprecated-declarations -Wno-unused-variable -Wno-unused-function -Wno-deprecated-declarations
#ADDITIONAL_LDFLAGS += -Xarch_armv6 -Wl,-lgcc_s.1

#ADDITIONAL_LDFLAGS += -Xarch_armv6 -Wl,-segalign,4000 -Xarch_armv6 -ffixed-r9
#ADDITIONAL_LDFLAGS += -Xarch_armv7s -Wl,-segalign,4000 -Xarch_armv7s -ffixed-r9

include $(THEOS_MAKE_PATH)/tweak.mk

after-stage::
	@cp MobileSafety.png $(THEOS_STAGING_DIR)/Library/MobileSubstrate/MobileSafety.png
