From: carlo@caione.org (Carlo Caione)
Date: Thu, 12 May 2016 14:41:40 +0200
Subject: [PATCH 0/2] Add support for Amlogic Meson MMC controller
Message-ID: <1463056902-8533-1-git-send-email-carlo@caione.org>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

From: Carlo Caione <carlo@endlessm.com>

This patchset is a port / rewrite of the Amlogic driver shipped in the SDK for
the Meson GXBB (S905) platform. It has been tested on the Hardkernel Odroid-C2
board.

The driver is enabled using U_BOOT_DEVICE in the board file because there is no
MMC driver yet in the linux kernel.

This patchset depends on the basic support for Amlogic S905 SoCs written by
Beniamino[1]

[1] https://www.mail-archive.com/u-boot at lists.denx.de/msg212188.html

Carlo Caione (2):
  mmc: Add Amlogic Meson driver
  arm: amlogic: Enable MMC driver on Odroid-C2

 arch/arm/include/asm/arch-meson/sd_emmc.h | 109 +++++++++++
 board/hardkernel/odroid-c2/odroid-c2.c    |  42 ++++
 configs/odroid-c2_defconfig               |   5 +
 drivers/mmc/Makefile                      |   1 +
 drivers/mmc/meson_mmc.c                   | 305 ++++++++++++++++++++++++++++++
 include/configs/odroid-c2.h               |   7 +
 6 files changed, 469 insertions(+)
 create mode 100644 arch/arm/include/asm/arch-meson/sd_emmc.h
 create mode 100644 drivers/mmc/meson_mmc.c

-- 
2.7.4
