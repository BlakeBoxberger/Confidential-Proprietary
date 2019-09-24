DEBUG = 0
FINALPACKAGE = 1

ARCHS = armv7 armv7s arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = ConfidentialProprietary
ConfidentialProprietary_FILES = Tweak.xm
ConfidentialProprietary_EXTRA_FRAMEWORKS = Cephei

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"

SUBPROJECTS += settings

include $(THEOS_MAKE_PATH)/aggregate.mk
