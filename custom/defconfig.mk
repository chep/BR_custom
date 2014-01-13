
custom_%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(TOPDIR)/../custom/configs/%_defconfig outputmakefile
	@mkdir -p $(BUILD_DIR)/buildroot-config
	@$(COMMON_CONFIG_ENV) $< --defconfig=$(TOPDIR)/../custom/configs/$(subst custom_,,$@) $(CONFIG_CONFIG_IN)

project_%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(TOPDIR)/../custom/projects/%/ outputmakefile
	@mkdir -p $(BUILD_DIR)/buildroot-config
	@$(COMMON_CONFIG_ENV) $< --defconfig=$(TOPDIR)/../custom/projects/$(subst _defconfig,,$(subst project_,,$@))/$(subst project_,,$@) $(CONFIG_CONFIG_IN)

.PHONY: custom_%_defconfig project_%_defconfig

