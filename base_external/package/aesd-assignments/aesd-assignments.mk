##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

# Use the specific commit hash you want to build (from your assignment 3 repo)
AESD_ASSIGNMENTS_VERSION = e808f3a87c0cb3b8104fb084fb7880cccf0ad9a4


# SSH URL to your assignment-3-and-later repo
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-adil619.git
AESD_ASSIGNMENTS_SITE_METHOD = git

AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

###############################################################
# Build Commands
###############################################################
define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all
endef

###############################################################
# Install Commands
###############################################################
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	# Install writer binary
	$(INSTALL) -D -m 0755 $(@D)/finder-app/writer $(TARGET_DIR)/usr/bin/writer

	# Install shell scripts
	$(INSTALL) -D -m 0755 $(@D)/finder-app/finder.sh $(TARGET_DIR)/usr/bin/finder.sh
	$(INSTALL) -D -m 0755 $(@D)/finder-app/finder-test.sh $(TARGET_DIR)/usr/bin/finder-test.sh

	# Install configuration directory
	$(INSTALL) -d $(TARGET_DIR)/etc/finder-app/conf
	cp -r $(@D)/finder-app/conf/* $(TARGET_DIR)/etc/finder-app/conf/
endef

$(eval $(generic-package))
