################################################################################
#
# kernel_hello_irq
#
################################################################################

KERNEL_HELLO_IRQ_VERSION = 1.8	
#KERNEL_HELLO_IRQ_SOURCE = v$(KERNEL_HELLO_IRQ_VERSION).tar.gz
#KERNEL_HELLO_IRQ_SITE = https://github.com/Ultrafeel/kernel_hello_irq/archive
KERNEL_HELLO_IRQ_SITE:= /home/unencr/Prog_projects/kernel_hello_irq
KERNEL_HELLO_IRQ_SITE_METHOD:=local
KERNEL_HELLO_IRQ_LICENSE = GPLv2
KERNEL_HELLO_IRQ_LICENSE_FILES = LICENSE
KERNEL_HELLO_IRQ_INSTALL_STAGING = YES
KERNEL_HELLO_IRQ_MAKE = $(MAKE1)
#FOO_LICENSE_FILES = COPYING


#KERNEL_HELLO_IRQ_DEPENDENCIES = \
#	host-pkgconf protobuf-c \
#	$(if $(BR2_PACKAGE_GNUTLS),gnutls) \
#	$(if $(BR2_PACKAGE_JSON_C),json-c)


KERNEL_HELLO_IRQ_INSTALL_TARGET:=YES

#define KERNEL_HELLO_IRQ_BUILD_CMDS
#echo ___TARGET_DIR= $(TARGET_DIR), LINUX_DIR=$(LINUX_DIR)___
##CC="$(TARGET_CC)" LD="$(TARGET_LD)" 
#$(MAKE) TARGET_CONFIGURE_OPTS=$(TARGET_CONFIGURE_OPTS) LINUX_DIR="$(LINUX_DIR)" ARCH=$(KERNEL_ARCH) -C $(@D) all
#endef

define KERNEL_HELLO_IRQ_INSTALL_TARGET_CMDS
@echo ooo LINUX_VERSION_PROBED =$(LINUX_VERSION_PROBED) oo TARGET_DIR= $(TARGET_DIR), KERNEL_VERSION =$(KERNEL_VERSION) , LINUX_DIR=$(LINUX_DIR) ooo
@echo ooo LINUX_VERSION = $(LINUX_VERSION ) BINARIES_DIR=$(BINARIES_DIR) BASE_DIR=$(BASE_DIR) ooo
#kernel_hello_irq.ko ./$(TARGETDIR)/lib/modules/$(KERNEL_VERSION)/
$(INSTALL) -D -m 0755 $(@D)/kernel_hello_irq.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/
$(INSTALL) -D -m 0755 $(@D)/S11load_kernel_hello_irq.sh $(TARGET_DIR)/etc/init.d/
$(INSTALL) -D -m 0755 $(@D)/test.sh $(TARGET_DIR)/bin/test_hello_irq.sh
endef

$(eval $(kernel-module))
$(eval $(generic-package))

