PRODUCT_BRAND ?= Bootleggers

# Versioning System
# Bootleggers version over here.
PRODUCT_VERSION_MAJOR = Tirimbino
PRODUCT_VERSION_MINOR = niceparse.Nice
BOOTLEGGERS_VERSION_NUMBER := 6.9-Alpha
BOOTLEGGERS_SONGCODEURL = https://cutt.ly/AVfICef
BOOTLEGGERS_EPOCH := $(shell date +%s)
BOOTLEGGERS_POSTFIX := -$(shell date -d @$(BOOTLEGGERS_EPOCH) +"%Y%m%d-%H%M%S")

ifndef BOOTLEGGERS_RELEASE_STATUS
    BOOTLEGGERS_RELEASE_STATUS := Testing
endif

ifeq ($(BOOTLEGGERS_BUILD_APPS_BUNDLE),true)
    ifeq ($(WITH_GAPPS),true)
        BOOTLEGGERS_BUILD_TYPE := $(BOOTLEGGERS_RELEASE_STATUS)-GApps
    else ifeq ($(WITH_MICROG),true)
        BOOTLEGGERS_BUILD_TYPE := $(BOOTLEGGERS_RELEASE_STATUS)-MicroG
    else
        BOOTLEGGERS_BUILD_TYPE := $(BOOTLEGGERS_RELEASE_STATUS)-Vanilla
    endif
else
    ifeq ($(WITH_GAPPS),true)
        BOOTLEGGERS_BUILD_TYPE := $(BOOTLEGGERS_RELEASE_STATUS)-MiniGApps
    else
        BOOTLEGGERS_BUILD_TYPE := $(BOOTLEGGERS_RELEASE_STATUS)-Minimal
    endif

endif

ifdef BOOTLEGGERS_BUILD_EXTRA
    BOOTLEGGERS_POSTFIX := -$(BOOTLEGGERS_BUILD_EXTRA)
    BOOTLEGGERS_MOD_SHORT := BootleggersROM-$(PRODUCT_VERSION_MAJOR)4$(BOOTLEGGERS_BUILD)-$(BOOTLEGGERS_BUILD_TYPE)$(BOOTLEGGERS_POSTFIX)
else
    BOOTLEGGERS_MOD_SHORT := BootleggersROM-$(PRODUCT_VERSION_MAJOR)4$(BOOTLEGGERS_BUILD)-$(BOOTLEGGERS_BUILD_TYPE)
endif

BOOTLEGGERS_VERSION := BootleggersROM-$(PRODUCT_VERSION_MAJOR)4$(BOOTLEGGERS_BUILD).$(BOOTLEGGERS_VERSION_NUMBER)-$(BOOTLEGGERS_BUILD_TYPE)$(BOOTLEGGERS_POSTFIX)

#PRODUCT_PACKAGES += \
#    bootanimation.zip

ifneq ($(TARGET_USE_SINGLE_BOOTANIMATION),true)
    PRODUCT_PACKAGES += \
        bootanimation2.zip \
        bootanimation3.zip
endif
