From: narmstrong@baylibre.com (Neil Armstrong)
Date: Wed, 28 Mar 2018 11:54:35 +0200
Subject: [PATCH u-boot 0/2] Cleanup for Amlogic GX SoCs
Message-ID: <1522230877-21267-1-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The Amlogic Meson GXBB and GXL are both part of the GX SoC family,
this patchset renames the GXBB files and defines to take this fact
in account and align the namings with linux.
With this applied, we can add a SoC Info code to display the
SoC name and package marketing name along the revisions.

Example output :
[...]
U-Boot 2018.03-00004-g69704da (Mar 28 2018 - 11:39:17 +0200) libretech-cc

CPU: Amlogic Meson GXL (S905X) rev 21:b (82:2)
DRAM:  2 GiB
[...]
On the LibreTech-CC board.

This patchset depends on the "mmc: avoid division by zero in meson_mmc_config_clock"
patch to allow U-Boot to work correctly.

Neil Armstrong (2):
  ARM: meson: rename GXBB to GX
  ARM: meson: Add cpu info display for GX SoCs

 arch/arm/include/asm/arch-meson/{gxbb.h => gx.h}   |  91 +++++++++---------
 arch/arm/mach-meson/Makefile                       |   2 +-
 arch/arm/mach-meson/board.c                        |  28 +++---
 arch/arm/mach-meson/cpu_info.c                     | 105 +++++++++++++++++++++
 arch/arm/mach-meson/eth.c                          |  24 ++---
 arch/arm/mach-meson/sm.c                           |   2 +-
 board/amlogic/khadas-vim/khadas-vim.c              |   2 +-
 board/amlogic/libretech-cc/libretech-cc.c          |   6 +-
 board/amlogic/odroid-c2/odroid-c2.c                |  10 +-
 board/amlogic/p212/p212.c                          |   2 +-
 configs/khadas-vim_defconfig                       |   2 +-
 configs/libretech-cc_defconfig                     |   2 +-
 configs/odroid-c2_defconfig                        |   2 +-
 configs/odroid_defconfig                           |   1 +
 configs/p212_defconfig                             |   2 +-
 include/configs/khadas-vim.h                       |   2 +-
 include/configs/libretech-cc.h                     |   2 +-
 .../{meson-gxbb-common.h => meson-gx-common.h}     |   8 +-
 include/configs/odroid-c2.h                        |   2 +-
 include/configs/p212.h                             |   2 +-
 20 files changed, 202 insertions(+), 95 deletions(-)
 rename arch/arm/include/asm/arch-meson/{gxbb.h => gx.h} (13%)
 create mode 100644 arch/arm/mach-meson/cpu_info.c
 rename include/configs/{meson-gxbb-common.h => meson-gx-common.h} (86%)

-- 
2.7.4
