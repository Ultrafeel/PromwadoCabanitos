################################################################################
#
# hello_make
#
################################################################################

HELLO_MAKE_VERSION = 1.0.3	
HELLO_MAKE_SOURCE = static_bv$(HELLO_MAKE_VERSION).tar.gz
HELLO_MAKE_SITE = https://github.com/Ultrafeel/hello_make/archive
#HELLO_MAKE_SITE:= /home/unencr/Prog_projects/hello_make
#HELLO_MAKE_SITE_METHOD:=local
HELLO_MAKE_LICENSE = GPLv2
HELLO_MAKE_LICENSE_FILES = LICENSE
HELLO_MAKE_INSTALL_STAGING = YES
HELLO_MAKE_MAKE = $(MAKE1)
#FOO_LICENSE_FILES = COPYING


#HELLO_MAKE_DEPENDENCIES = \
#	host-pkgconf protobuf-c \
#	$(if $(BR2_PACKAGE_GNUTLS),gnutls) \
#	$(if $(BR2_PACKAGE_JSON_C),json-c)


HELLO_MAKE_INSTALL_TARGET:=YES

define HELLO_MAKE_BUILD_CMDS
#echo ___TARGET_DIR= $(TARGET_DIR), LINUX_DIR=$(LINUX_DIR)___
##CC="$(TARGET_CC)" LD="$(TARGET_LD)" --trace
#LINUX_DIR="$(LINUX_DIR)" ARCH=$(KERNEL_ARCH) 
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef


define HELLO_MAKE_INSTALL_TARGET_CMDS
#echo ooo LINUX_VERSION_PROBED =$(LINUX_VERSION_PROBED) oo TARGET_DIR= $(TARGET_DIR), KERNEL_VERSION =$(KERNEL_VERSION) , LINUX_DIR=$(LINUX_DIR) ooo
#@echo ooo LINUX_VERSION = $(LINUX_VERSION ) BINARIES_DIR=$(BINARIES_DIR) BASE_DIR=$(BASE_DIR) ooo
#hello_make.ko ./$(TARGETDIR)/lib/modules/$(KERNEL_VERSION)/
$(INSTALL) -D -m 0755 $(@D)/target_bin/bin/hello $(TARGET_DIR)/bin/
#$(INSTALL) -D -m 0755 $(@D)/S11load_hello_make.sh $(TARGET_DIR)/etc/init.d/
#$(INSTALL) -D -m 0755 $(@D)/test.sh $(TARGET_DIR)/bin/test_hello_irq.sh
endef

#$(eval $(kernel-module))
$(eval $(generic-package))

