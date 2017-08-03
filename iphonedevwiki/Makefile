include $(THEOS)/makefiles/common.mk

APPLICATION_NAME = iPhoneDevWiki
iPhoneDevWiki_FILES = main.m XXAppDelegate.m XXRootViewController.m
iPhoneDevWiki_FRAMEWORKS = UIKit CoreGraphics

include $(THEOS_MAKE_PATH)/application.mk

after-install::
	install.exec "killall \"iPhoneDevWiki\"" || true
