################################################################################
#
# kernel_hello_irq
#
################################################################################

KERNEL_HELLO_IRQ_VERSION = 1.0
KERNEL_HELLO_IRQ_SOURCE = riemann-c-client-$(KERNEL_HELLO_IRQ_VERSION).tar.xz
KERNEL_HELLO_IRQ_SITE = https://github.com/Ultrafeel/kernel_hello_irq/releases/tag/v$(KERNEL_HELLO_IRQ_VERSION)
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

KERNEL_HELLO_IRQ_VERSION:= 1.0.0
#KERNEL_HELLO_IRQ_SITE:= /home/chris/MELP/helloworld/
#KERNEL_HELLO_IRQ_SITE_METHOD:=local
KERNEL_HELLO_IRQ_INSTALL_TARGET:=YES
define KERNEL_HELLO_IRQ_BUILD_CMDS
$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
endef
define KERNEL_HELLO_IRQ_INSTALL_TARGET_CMDS
#kernel_hello_irq.ko ./$(TARGETDIR)/lib/modules/$(KERNEL_VERSION)/
$(INSTALL) -D -m 0755 $(@D)/kernel_hello_irq.ko $(TARGET_DIR)/lib/modules/$(KERNEL_VERSION)/
endef
$(eval $(generic-package))

#$(eval $(autotools-package))
