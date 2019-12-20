ARCHS = arm64
TARGET = appletv:clang
FINALPACKAGE = 1
SYSROOT = $(THEOS)/sdks/AppleTVOS12.4.sdk
THEOS_DEVICE_IP = 192.168.1.211

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = NoSleepTilBrooklyn
NoSleepTilBrooklyn_FILES = $(wildcard *.mm)
NoSleepTilBrooklyn_INSTALL_PATH = /Library/PreferenceBundles
NoSleepTilBrooklyn_FRAMEWORKS = UIKit TVSettingKit
NoSleepTilBrooklyn_PRIVATE_FRAMEWORKS = TVSettingKit
NoSleepTilBrooklyn_CFLAGS+= -I. -ITVSettings -ITVSettingsKit -Wno-error
NoSleepTilBrooklyn_LDFLAGS = -undefined dynamic_lookup

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/NoSleepTilBrooklyn.plist$(ECHO_END)
