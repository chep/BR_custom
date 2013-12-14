
ifeq ($(BR2_CUSTOM_DRIVERS),y)
include custom/drivers/*/*.mk
endif

ifeq ($(BR2_CUSTOM_LIBS),y)
include custom/libs/*/*.mk
endif

ifeq ($(BR2_CUSTOM_TOOLS),y)
include custom/tools/*/*.mk
endif

include custom/projects/*/*.mk

