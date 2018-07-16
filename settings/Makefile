include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = ConfidentialProprietarySettings
ConfidentialProprietarySettings_FILES = ConfidentialProprietaryRootListController.m
ConfidentialProprietarySettings_INSTALL_PATH = /Library/PreferenceBundles
ConfidentialProprietarySettings_FRAMEWORKS = UIKit
ConfidentialProprietarySettings_EXTRA_FRAMEWORKS = Cephei CepheiPrefs
ConfidentialProprietarySettings_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/ConfidentialProprietarySettings.plist$(ECHO_END)
