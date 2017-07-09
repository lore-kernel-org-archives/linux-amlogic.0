From: b.galvani@gmail.com (Beniamino Galvani)
Date: Mon, 10 Jul 2017 00:30:02 +0200
Subject: [PATCH v2 0/4] Add support for Meson GXBB GPIOs to U-Boot
Message-ID: <20170709223006.3998-1-b.galvani@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi,

this series adds to U-Boot a GPIO driver for Meson GXBB and enables it
on Odroid-C2.

Changes since v1:
 - updated dts files from Linux 4.12
 - added missing asm/arch/gpio.h
 - added patch 4 to convert driver to livetree

Beniamino Galvani (4):
  arm: dts: meson: import dts files from Linux 4.12
  pinctrl: meson: add GPIO support
  odroid-c2: enable GPIO
  pinctrl: meson: convert to livetree

 arch/arm/dts/meson-gx.dtsi                 |  97 +++++++++++--
 arch/arm/dts/meson-gxbb-odroidc2.dts       |  82 ++++++++++-
 arch/arm/dts/meson-gxbb.dtsi               | 187 +++++++++++++++++++-----
 arch/arm/include/asm/arch-meson/gpio.h     |  11 ++
 configs/odroid-c2_defconfig                |   2 +
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c |  21 +++
 drivers/pinctrl/meson/pinctrl-meson.c      | 221 +++++++++++++++++++++++++----
 drivers/pinctrl/meson/pinctrl-meson.h      |  63 ++++++++
 include/dt-bindings/clock/gxbb-clkc.h      |  24 +++-
 9 files changed, 636 insertions(+), 72 deletions(-)
 create mode 100644 arch/arm/include/asm/arch-meson/gpio.h

-- 
2.9.3
