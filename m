From: narmstrong@baylibre.com (Neil Armstrong)
Date: Mon, 20 Nov 2017 16:04:43 +0100
Subject: [PATCH u-boot 0/2] Add support for Amlogic GXL Based SBCs
Message-ID: <1511190285-4281-1-git-send-email-narmstrong@baylibre.com>
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

The following work will be pushed later on :
- Support for dynamic reading of DDR memory size from registers
- USB DWC3 Host Support with PHY support

Neil Armstrong (2):
  arm: Add LibreTech CC support based on Meson GXL family
  arm: Add Khadas VIM support based on Meson GXL family

 arch/arm/dts/Makefile                         |   4 +-
 arch/arm/dts/meson-gxl-s905x-khadas-vim.dts   | 137 +++++++++++++++++++++
 arch/arm/dts/meson-gxl-s905x-libretech-cc.dts | 171 ++++++++++++++++++++++++++
 arch/arm/mach-meson/Kconfig                   |  18 +++
 board/amlogic/khadas-vim/Kconfig              |  12 ++
 board/amlogic/khadas-vim/MAINTAINERS          |   6 +
 board/amlogic/khadas-vim/Makefile             |   8 ++
 board/amlogic/khadas-vim/README               |  96 +++++++++++++++
 board/amlogic/khadas-vim/khadas-vim.c         |  58 +++++++++
 board/amlogic/libretech-cc/Kconfig            |  12 ++
 board/amlogic/libretech-cc/MAINTAINERS        |   6 +
 board/amlogic/libretech-cc/Makefile           |   8 ++
 board/amlogic/libretech-cc/README             |  96 +++++++++++++++
 board/amlogic/libretech-cc/libretech-cc.c     |  58 +++++++++
 configs/khadas-vim_defconfig                  |  35 ++++++
 configs/libretech-cc_defconfig                |  35 ++++++
 include/configs/khadas-vim.h                  |  24 ++++
 include/configs/libretech-cc.h                |  24 ++++
 18 files changed, 807 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/dts/meson-gxl-s905x-khadas-vim.dts
 create mode 100644 arch/arm/dts/meson-gxl-s905x-libretech-cc.dts
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
