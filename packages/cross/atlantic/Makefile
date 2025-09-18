PKG_NAME = atlantic
PKG_VERS = 2.5.12
PKG_EXT = tar.gz
PKG_DIST_NAME = $(PKG_NAME)-$(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = https://github.com/Marvell-Consulting/armada-10g-driver/archive
PKG_DIST_FILE = v$(PKG_VERS).$(PKG_EXT)
PKG_DIR = armada-10g-driver-$(PKG_VERS)

DEPENDS =

HOMEPAGE = https://github.com/Marvell-Consulting/armada-10g-driver
COMMENT = Marvell AQC107 10GbE Network Driver
LICENSE = GPL-2.0

# Kernel module configuration
REQUIRE_KERNEL_MODULE = atlantic::atlantic

include ../../mk/spksrc.cross-kernel-module.mk