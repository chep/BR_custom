
ifeq ($(BR2_CUSTOM_PROJECTS_PUMPV2_OVERLAY),y)
BR2_ROOTFS_OVERLAY+=" custom/projects/pumpv2/skeleton/ "
endif

