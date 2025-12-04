##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

AESD_ASSIGNMENTS_VERSION = 1eff5e13ac4921d280913ef98e8a302f06d3c48a
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-adil619.git
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

###############################################################
# Build Commands
###############################################################

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server all
endef

###############################################################
# Install Commands
###############################################################

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS

	# Install writer binary
	$(INSTALL) -D -m 0755 $(@D)/finder-app/writer \
		$(TARGET_DIR)/usr/bin/writer

	# Install shell scripts
	$(INSTALL) -D -m 0755 $(@D)/finder-app/finder.sh \
		$(TARGET_DIR)/usr/bin/finder.sh
	$(INSTALL) -D -m 0755 $(@D)/finder-app/finder-test.sh \
		$(TARGET_DIR)/usr/bin/finder-test.sh

	# Install configuration directory
	$(INSTALL) -d $(TARGET_DIR)/etc/finder-app/conf
	cp -r $(@D)/finder-app/conf/* $(TARGET_DIR)/etc/finder-app/conf/

	# Install aesdsocket binary
	$(INSTALL) -D -m 0755 $(@D)/server/aesdsocket \
		$(TARGET_DIR)/usr/bin/aesdsocket

	# Install aesdsocket-start-stop script
	$(INSTALL) -D -m 0755 $(@D)/server/aesdsocket-start-stop \
		$(TARGET_DIR)/etc/init.d/S99aesdsocket

endef

$(eval $(generic-package))
