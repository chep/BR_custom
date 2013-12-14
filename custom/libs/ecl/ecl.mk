ECL_VERSION = master
ECL_SITE = https://github.com/aragua/ecl.git
ECL_SITE_METHOD=git
ECL_LICENSE=LGPLv2.1

ECL_INSTALL_STAGING = YES

define ECL_CONFIGURE_CMDS
	make -C $(@D) menuconfig
endef

define ECL_BUILD_CMDS
	make -C $(@D) ARCH=arm CC=$(TARGET_CC) LD=$(TARGET_LD)
endef

define ECL_INSTALL_STAGING_CMDS
	$(INSTALL) -d $(STAGING_DIR)/usr/include/ecl/
	$(INSTALL) -m 0755 $(@D)/output/include/* $(STAGING_DIR)/usr/include/ecl/
	$(INSTALL) -d $(TARGET_DIR)/usr/lib/
	$(INSTALL) -m 0755 $(@D)/output/lib/libecl.so $(STAGING_DIR)/usr/lib
endef

define ECL_INSTALL_TARGET_CMDS
	$(INSTALL) -d $(TARGET_DIR)/usr/lib/
	$(INSTALL) -m 0755 $(@D)/output/lib/libecl.so $(TARGET_DIR)/usr/lib
endef

define ECL_CLEAN_CMDS
	make -C $(@D) clean
	rm -rf $(@D)/.stamp_configured $(@D)/.stamp_target_installed
endef
	

$(eval $(generic-package))
