From: narmstrong@baylibre.com (Neil Armstrong)
Date: Mon, 27 Nov 2017 10:16:15 +0100
Subject: [PATCH u-boot v3 0/5] Add support for Amlogic GXL Based SBCs
Message-ID: <1511774180-22672-1-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This patchset aimed to add minimal support for the following Amlogic GXL SoC
based board:
- LibreTech-CC
- Khadas VIM

The initial support is composed of :
- Minimal boot support with serial, MMC, Ethernet and SDCard
- Updated DTS from Linux 4.13.8

Commands to generate a valid binary are provided in the board README.

A common Ethernet init function is introduced to avoid duplicating
the same hardware init code.

The P212 and Odroid-C2 board are also converted to this common function
by this patchset.

The following work will be pushed later on :
- Support for dynamic reading of DDR memory size from registers
- USB DWC3 Host Support with PHY support

Changes since v2:
- added comment in eth.c and eth.h
- switch to flags to use the internal PHY on GXL
- updated the board files to use the flag instead
- switched the #if to if(IS_ENABLED()) to compile all code paths
- fixed the "u-boot" README typos
- Added Simon's tags

Changes since v1:
- Add common ethernet init function
- Switch P212 and Odroid-C2 to use this ethernet init function
- Fix typos in READMEs
- Drop #define CONFIG_CONS_INDEX

Neil Armstrong (5):
  ARM: arch-meson: add ethernet common init function
  board: odroid-c2: use common ethernet init function
  board: p212: use common ethernet init function
  arm: Add LibreTech CC support based on Meson GXL family
  arm: Add Khadas VIM support based on Meson GXL family

 arch/arm/dts/Makefile                         |   4 +-
 arch/arm/dts/meson-gxl-s905x-khadas-vim.dts   | 137 +++++++++++++++++++++
 arch/arm/dts/meson-gxl-s905x-libretech-cc.dts | 171 ++++++++++++++++++++++++++
 arch/arm/include/asm/arch-meson/eth.h         |  23 ++++
 arch/arm/mach-meson/Kconfig                   |  18 +++
 arch/arm/mach-meson/Makefile                  |   2 +-
 arch/arm/mach-meson/eth.c                     |  55 +++++++++
 board/amlogic/khadas-vim/Kconfig              |  12 ++
 board/amlogic/khadas-vim/MAINTAINERS          |   6 +
 board/amlogic/khadas-vim/Makefile             |   8 ++
 board/amlogic/khadas-vim/README               |  96 +++++++++++++++
 board/amlogic/khadas-vim/khadas-vim.c         |  49 ++++++++
 board/amlogic/libretech-cc/Kconfig            |  12 ++
 board/amlogic/libretech-cc/MAINTAINERS        |   6 +
 board/amlogic/libretech-cc/Makefile           |   8 ++
 board/amlogic/libretech-cc/README             |  96 +++++++++++++++
 board/amlogic/libretech-cc/libretech-cc.c     |  53 ++++++++
 board/amlogic/odroid-c2/odroid-c2.c           |  11 +-
 board/amlogic/p212/p212.c                     |  14 +--
 configs/khadas-vim_defconfig                  |  35 ++++++
 configs/libretech-cc_defconfig                |  35 ++++++
 include/configs/khadas-vim.h                  |  21 ++++
 include/configs/libretech-cc.h                |  21 ++++
 23 files changed, 870 insertions(+), 23 deletions(-)
 create mode 100644 arch/arm/dts/meson-gxl-s905x-khadas-vim.dts
 create mode 100644 arch/arm/dts/meson-gxl-s905x-libretech-cc.dts
 create mode 100644 arch/arm/include/asm/arch-meson/eth.h
 create mode 100644 arch/arm/mach-meson/eth.c
 create mode 100644 board/amlogic/khadas-vim/Kconfig
 create mode 100644 board/amlogic/khadas-vim/MAINTAINERS
 create mode 100644 board/amlogic/khadas-vim/Makefile
 create mode 100644 board/amlogic/khadas-vim/README
 create mode 100644 board/amlogic/khadas-vim/khadas-vim.c
 create mode 100644 board/amlogic/libretech-cc/Kconfig
 create mode 100644 board/amlogic/libretech-cc/MAINTAINERS
 create mode 100644 board/amlogic/libretech-cc/Makefile
 create mode 100644 board/amlogic/libretech-cc/README
 create mode 100644 board/amlogic/libretech-cc/libretech-cc.c
 create mode 100644 configs/khadas-vim_defconfig
 create mode 100644 configs/libretech-cc_defconfig
 create mode 100644 include/configs/khadas-vim.h
 create mode 100644 include/configs/libretech-cc.h

-- 
2.7.4
