################################################################################
#
# led_switch
#
################################################################################

LED_SWITCH_VERSION = 1.1.8	
#LED_SWITCH_SOURCE = static_bv$(LED_SWITCH_VERSION).tar.gz
#LED_SWITCH_SITE = https://github.com/Ultrafeel/led_switch/archive
LED_SWITCH_SITE:= /home/unencr/Prog_projects/led_switch
LED_SWITCH_SITE_METHOD:=local
LED_SWITCH_LICENSE = GPLv2
LED_SWITCH_LICENSE_FILES = LICENSE
LED_SWITCH_INSTALL_STAGING = YES
LED_SWITCH_MAKE = $(MAKE1)
#FOO_LICENSE_FILES = COPYING


#LED_SWITCH_DEPENDENCIES = \
#	host-pkgconf protobuf-c \
#	$(if $(BR2_PACKAGE_GNUTLS),gnutls) \
#	$(if $(BR2_PACKAGE_JSON_C),json-c)


LED_SWITCH_INSTALL_TARGET:=YES

define LED_SWITCH_BUILD_CMDS
#echo ___TARGET_DIR= $(TARGET_DIR), LINUX_DIR=$(LINUX_DIR)___
##CC="$(TARGET_CC)" LD="$(TARGET_LD)" --trace
#LINUX_DIR="$(LINUX_DIR)" ARCH=$(KERNEL_ARCH) 
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef


define LED_SWITCH_INSTALL_TARGET_CMDS
#echo ooo LINUX_VERSION_PROBED =$(LINUX_VERSION_PROBED) oo TARGET_DIR= $(TARGET_DIR), KERNEL_VERSION =$(KERNEL_VERSION) , LINUX_DIR=$(LINUX_DIR) ooo
#@echo ooo LINUX_VERSION = $(LINUX_VERSION ) BINARIES_DIR=$(BINARIES_DIR) BASE_DIR=$(BASE_DIR) ooo
#led_switch.ko ./$(TARGETDIR)/lib/modules/$(KERNEL_VERSION)/
$(INSTALL) -D -m 0755 $(@D)/target_bin/bin/led_switch $(TARGET_DIR)/bin/
#$(INSTALL) -D -m 0755 $(@D)/S11load_led_switch.sh $(TARGET_DIR)/etc/init.d/
#$(INSTALL) -D -m 0755 $(@D)/test.sh $(TARGET_DIR)/bin/test_hello_irq.sh
endef

#$(eval $(kernel-module))
$(eval $(generic-package))

