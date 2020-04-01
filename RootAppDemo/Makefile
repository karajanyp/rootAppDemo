THEOS_DEVICE_IP := 127.0.0.1
THEOS_DEVICE_PORT := 2226

WORK_DIR =  ./

include $(THEOS)/makefiles/common.mk

PROJECT_NAME			:= RootAppDemo
PROJECT_APP 			:= RootAppDemo
#PROJECT_NAME是，PROJECT_APP是product name；两者可以不一样

# APPLICATION_NAME = MyRootApp
# crackMe2_FILES = main.m ViewController.m
# crackMe2_FRAMEWORKS = UIKit CoreGraphics

# include $(THEOS_MAKE_PATH)/application.mk

before-package::
	@mkdir -p $(THEOS_STAGING_DIR)/Applications

	# 处理  APP
	@for name in `echo $(PROJECT_APP)`; do \
		cp -r $(WORK_DIR)/build/Release-iphoneos/$$name.app $(THEOS_STAGING_DIR)/Applications; \
	done;

	@sh sudoapp.sh

all::
	xcodebuild -project $(WORK_DIR)/$(PROJECT_NAME).xcodeproj -alltargets

include $(THEOS_MAKE_PATH)/tweak.mk