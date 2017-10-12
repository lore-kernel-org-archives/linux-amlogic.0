From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu, 12 Oct 2017 15:50:29 +0200
Subject: [PATCH u-boot 0/3] Add initial support for Amlogic P212 Reference
 board
Message-ID: <1507816232-8227-1-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This patchset aimed to add minimal support for the Amlogic P212 reference board
from Amlogic based on the Meson S905X SoC from the Meson GXL SoC Family.

The initial support is composed of :
- GXL pinctrl driver
- Minimal boot support with serial, MMC and SDCard
- Updated DTS from Linux 4.13.5

Commands to generate a valid binary are provided in the board README.

The following work will be pushed later on :
- Support for dynamic reading of DDR memory size from registers
- Support for the Internal Ethernet PHY is WiP
- USB DWC3 Host Support with PHY support

This patchset can boot Linux Mainline 4.14-rc4 with the Video Pipeline disables,
since it currently depends on Power Domains initialization from Vendor u-boot.
Dedicated reset and init code for the Video Pipeline for mainline Linux is in
the work.

Neil Armstrong (3):
  ARM: dts: Synchronize Amlogic from Linux Mainline 4.13.5
  pinctrl: meson: Add GXL Support
  arm: add initial support for Amlogic P212 based on Meson GXL family

 arch/arm/dts/Makefile                     |   3 +-
 arch/arm/dts/meson-gx.dtsi                |  13 +-
 arch/arm/dts/meson-gxbb-odroidc2.dts      | 108 ++---
 arch/arm/dts/meson-gxbb.dtsi              | 220 +++++----
 arch/arm/dts/meson-gxl-mali.dtsi          |  43 ++
 arch/arm/dts/meson-gxl-s905x-p212.dts     |  95 ++++
 arch/arm/dts/meson-gxl-s905x-p212.dtsi    | 173 +++++++
 arch/arm/dts/meson-gxl-s905x.dtsi         |  55 +++
 arch/arm/dts/meson-gxl.dtsi               | 628 +++++++++++++++++++++++++
 arch/arm/mach-meson/Kconfig               |  22 +
 board/amlogic/p212/Kconfig                |  12 +
 board/amlogic/p212/MAINTAINERS            |   6 +
 board/amlogic/p212/Makefile               |   8 +
 board/amlogic/p212/README                 |  96 ++++
 board/amlogic/p212/p212.c                 |  21 +
 configs/p212_defconfig                    |  31 ++
 drivers/pinctrl/meson/Kconfig             |   4 +
 drivers/pinctrl/meson/Makefile            |   1 +
 drivers/pinctrl/meson/pinctrl-meson-gxl.c | 736 ++++++++++++++++++++++++++++++
 include/configs/p212.h                    |  22 +
 include/dt-bindings/gpio/meson-gxl-gpio.h | 131 ++++++
 21 files changed, 2285 insertions(+), 143 deletions(-)
 create mode 100644 arch/arm/dts/meson-gxl-mali.dtsi
 create mode 100644 arch/arm/dts/meson-gxl-s905x-p212.dts
 create mode 100644 arch/arm/dts/meson-gxl-s905x-p212.dtsi
 create mode 100644 arch/arm/dts/meson-gxl-s905x.dtsi
 create mode 100644 arch/arm/dts/meson-gxl.dtsi
 create mode 100644 board/amlogic/p212/Kconfig
 create mode 100644 board/amlogic/p212/MAINTAINERS
 create mode 100644 board/amlogic/p212/Makefile
 create mode 100644 board/amlogic/p212/README
 create mode 100644 board/amlogic/p212/p212.c
 create mode 100644 configs/p212_defconfig
 create mode 100644 drivers/pinctrl/meson/pinctrl-meson-gxl.c
 create mode 100644 include/configs/p212.h
 create mode 100644 include/dt-bindings/gpio/meson-gxl-gpio.h

-- 
2.7.4
