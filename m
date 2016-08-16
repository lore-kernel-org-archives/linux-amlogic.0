From: b.galvani@gmail.com (Beniamino Galvani)
Date: Tue, 16 Aug 2016 11:49:46 +0200
Subject: [PATCH 0/4] Amlogic Meson pinctrl driver for u-boot
Message-ID: <1471340990-16247-1-git-send-email-b.galvani@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi,

these patches add a pinctrl driver for Meson GXBB and enable
Ethernet support through the device tree.

Beniamino Galvani (4):
  pinctrl: generic: scan for "pins" and "groups" properties in sub-nodes
  arm: dts: update DTS files for meson-gxbb and odroid-c2
  pinctrl: add driver for meson-gxbb pin controller
  meson: odroid-c2: enable Ethernet support through the device tree

 arch/arm/dts/meson-gxbb-odroidc2.dts               |  19 +
 arch/arm/dts/meson-gxbb.dtsi                       | 170 +++++++-
 arch/arm/include/asm/arch-meson/gxbb.h             |   3 -
 board/amlogic/odroid-c2/odroid-c2.c                |  13 -
 configs/odroid-c2_defconfig                        |   3 +
 drivers/net/designware.c                           |   1 +
 drivers/pinctrl/Kconfig                            |   1 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/meson/Kconfig                      |  11 +
 drivers/pinctrl/meson/Makefile                     |   6 +
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c         | 432 +++++++++++++++++++++
 drivers/pinctrl/meson/pinctrl-meson.c              | 179 +++++++++
 drivers/pinctrl/meson/pinctrl-meson.h              |  74 ++++
 drivers/pinctrl/pinctrl-generic.c                  |   6 +-
 include/dt-bindings/gpio/meson-gxbb-gpio.h         | 154 ++++++++
 .../dt-bindings/reset/amlogic,meson-gxbb-reset.h   | 210 ++++++++++
 16 files changed, 1264 insertions(+), 19 deletions(-)
 create mode 100644 drivers/pinctrl/meson/Kconfig
 create mode 100644 drivers/pinctrl/meson/Makefile
 create mode 100644 drivers/pinctrl/meson/pinctrl-meson-gxbb.c
 create mode 100644 drivers/pinctrl/meson/pinctrl-meson.c
 create mode 100644 drivers/pinctrl/meson/pinctrl-meson.h
 create mode 100644 include/dt-bindings/gpio/meson-gxbb-gpio.h
 create mode 100644 include/dt-bindings/reset/amlogic,meson-gxbb-reset.h

-- 
2.7.4
