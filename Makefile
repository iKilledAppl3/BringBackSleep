ARCHS = arm64
TARGET = appletv:clang
FINALPACKAGE = 1
SYSROOT = $(THEOS)/sdks/AppleTVOS12.4.sdk
THEOS_DEVICE_IP = 192.168.1.211
INSTALL_TARGET_PROCESSES = TVSystemMenuService 

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = BringBackSleep
BringBackSleep_FILES = Tweak.xm
BringBackSleep_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 TVSystemMenuService"
SUBPROJECTS += nosleeptilbrooklyn
include $(THEOS_MAKE_PATH)/aggregate.mk
