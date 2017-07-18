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
#KERNEL_HELLO_IRQ_DEPENDENCIES = \
#	host-pkgconf protobuf-c \
#	$(if $(BR2_PACKAGE_GNUTLS),gnutls) \
#	$(if $(BR2_PACKAGE_JSON_C),json-c)

ifeq ($(BR2_bfin),y)
# ld symbol versioning not working on bfin
#KERNEL_HELLO_IRQ_CONF_ENV += ac_cv_prog_ld_version_script=no
endif

#$(LINUX_DIR)
#4.9.6
#$(shell uname -r)  $(LINUX_DIR)


#KERNEL_HELLO_IRQ_SITE:= /home/chris/MELP/helloworld/
#KERNEL_HELLO_IRQ_SITE_METHOD:=local
KERNEL_HELLO_IRQ_INSTALL_TARGET:=YES
define KERNEL_HELLO_IRQ_BUILD_CMDS
echo ___TARGET_DIR= $(TARGET_DIR), LINUX_DIR=$(LINUX_DIR)___

$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" LINUX_DIR="$(LINUX_DIR)" -C $(@D) all
endef
define KERNEL_HELLO_IRQ_INSTALL_TARGET_CMDS
#$(ECHO) TARGET_DIR= $(TARGET_DIR), KERNEL_VERSION =$(KERNEL_VERSION) , LINUX_DIR=$(LINUX_DIR)

#kernel_hello_irq.ko ./$(TARGETDIR)/lib/modules/$(KERNEL_VERSION)/
$(INSTALL) -D -m 0755 $(@D)/kernel_hello_irq.ko $(TARGET_DIR)/lib/modules/$(KERNEL_VERSION)/
$(INSTALL) -D -m 0755 $(@D)/S11load_kernel_hello_irq.sh $(TARGET_DIR)/etc/init.d/
$(INSTALL) -D -m 0755 $(@D)/test.sh $(TARGET_DIR)/root/
endef
$(eval $(generic-package))

#$(eval $(autotools-package))
