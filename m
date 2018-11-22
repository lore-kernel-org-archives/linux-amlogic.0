From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu, 22 Nov 2018 10:07:24 +0100
Subject: [PATCH u-boot v2 03/19] board: amlogic: remove p212 derivatives
In-Reply-To: <20181122090740.29739-1-narmstrong@baylibre.com>
References: <20181122090740.29739-1-narmstrong@baylibre.com>
Message-ID: <20181122090740.29739-4-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

From: Jerome Brunet <jbrunet@baylibre.com>

The Khadas vim and the libretech aml-s905x-cc (aka Potato) derive
from amlogic s905x reference design (P212).

All the code in these board is a copy/paste from the p212, which is
tedious to maintain. This change use p212 u-boot board for all these
boards, while keeping a dedicated defconfig to customize the names
and device tree.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm/mach-meson/Kconfig                   | 22 +------
 board/amlogic/khadas-vim/Kconfig              | 12 ----
 board/amlogic/khadas-vim/MAINTAINERS          |  6 --
 board/amlogic/khadas-vim/Makefile             |  6 --
 board/amlogic/khadas-vim/khadas-vim.c         | 57 -------------------
 board/amlogic/libretech-cc/Kconfig            | 12 ----
 board/amlogic/libretech-cc/MAINTAINERS        |  6 --
 board/amlogic/libretech-cc/Makefile           |  6 --
 board/amlogic/libretech-cc/libretech-cc.c     | 57 -------------------
 .../README => p212/README.khadas-vim}         |  0
 .../README => p212/README.libretech-cc}       |  0
 board/amlogic/p212/{README => README.p212}    |  0
 configs/khadas-vim_defconfig                  |  2 +-
 configs/libretech-cc_defconfig                |  2 +-
 14 files changed, 4 insertions(+), 184 deletions(-)
 delete mode 100644 board/amlogic/khadas-vim/Kconfig
 delete mode 100644 board/amlogic/khadas-vim/MAINTAINERS
 delete mode 100644 board/amlogic/khadas-vim/Makefile
 delete mode 100644 board/amlogic/khadas-vim/khadas-vim.c
 delete mode 100644 board/amlogic/libretech-cc/Kconfig
 delete mode 100644 board/amlogic/libretech-cc/MAINTAINERS
 delete mode 100644 board/amlogic/libretech-cc/Makefile
 delete mode 100644 board/amlogic/libretech-cc/libretech-cc.c
 rename board/amlogic/{khadas-vim/README => p212/README.khadas-vim} (100%)
 rename board/amlogic/{libretech-cc/README => p212/README.libretech-cc} (100%)
 rename board/amlogic/p212/{README => README.p212} (100%)

diff --git a/arch/arm/mach-meson/Kconfig b/arch/arm/mach-meson/Kconfig
index bc0f6a169b..e0b2812477 100644
--- a/arch/arm/mach-meson/Kconfig
+++ b/arch/arm/mach-meson/Kconfig
@@ -47,22 +47,8 @@ config TARGET_P212
 	  P212 is a reference dessign board based on Meson GXL S905X SoC
 	  with 2 GiB of RAM, Ethernet, HDMI, 2 USB, micro-SD slot,
 	  eMMC, IR receiver, CVBS+Audio jack and a SDIO WiFi module.
-
-config TARGET_LIBRETECH_CC
-	bool "LIBRETECH-CC"
-	select MESON_GXL
-	help
-	  LibreTech CC is a single board computer based on Meson GXL
-	  with 2 GiB of RAM, Ethernet, HDMI, 4 USB, micro-SD slot,
-	  eMMC, IR receiver and a 40-pin GPIO header.
-
-config TARGET_KHADAS_VIM
-	bool "KHADAS-VIM"
-	select MESON_GXL
-	help
-	  Khadas VIM is a single board computer based on Meson GXL
-	  with 2 GiB of RAM, Ethernet, HDMI, 4 USB, micro-SD slot,
-	  eMMC, IR receiver and a 40-pin GPIO header.
+	  You should also select this TARGET if you have Khadas Vim or
+	  a libretech aml-s905x-cc
 
 config TARGET_KHADAS_VIM2
 	bool "KHADAS-VIM2"
@@ -86,10 +72,6 @@ source "board/amlogic/nanopi-k2/Kconfig"
 
 source "board/amlogic/p212/Kconfig"
 
-source "board/amlogic/libretech-cc/Kconfig"
-
-source "board/amlogic/khadas-vim/Kconfig"
-
 source "board/amlogic/khadas-vim2/Kconfig"
 
 endif
diff --git a/board/amlogic/khadas-vim/Kconfig b/board/amlogic/khadas-vim/Kconfig
deleted file mode 100644
index 0fa8db97ea..0000000000
--- a/board/amlogic/khadas-vim/Kconfig
+++ /dev/null
@@ -1,12 +0,0 @@
-if TARGET_KHADAS_VIM
-
-config SYS_BOARD
-	default "khadas-vim"
-
-config SYS_VENDOR
-	default "amlogic"
-
-config SYS_CONFIG_NAME
-	default "khadas-vim"
-
-endif
diff --git a/board/amlogic/khadas-vim/MAINTAINERS b/board/amlogic/khadas-vim/MAINTAINERS
deleted file mode 100644
index 024220a526..0000000000
--- a/board/amlogic/khadas-vim/MAINTAINERS
+++ /dev/null
@@ -1,6 +0,0 @@
-KHADAS-VIM
-M:	Neil Armstrong <narmstrong@baylibre.com>
-S:	Maintained
-F:	board/amlogic/khadas-vim/
-F:	include/configs/khadas-vim.h
-F:	configs/khadas-vim_defconfig
diff --git a/board/amlogic/khadas-vim/Makefile b/board/amlogic/khadas-vim/Makefile
deleted file mode 100644
index 558c0769b7..0000000000
--- a/board/amlogic/khadas-vim/Makefile
+++ /dev/null
@@ -1,6 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0+
-#
-# (C) Copyright 2016 BayLibre, SAS
-# Author: Neil Armstrong <narmstrong@baylibre.com>
-
-obj-y	:= khadas-vim.o
diff --git a/board/amlogic/khadas-vim/khadas-vim.c b/board/amlogic/khadas-vim/khadas-vim.c
deleted file mode 100644
index 692bf2add3..0000000000
--- a/board/amlogic/khadas-vim/khadas-vim.c
+++ /dev/null
@@ -1,57 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/*
- * Copyright (C) 2016 BayLibre, SAS
- * Author: Neil Armstrong <narmstrong@baylibre.com>
- */
-
-#include <common.h>
-#include <dm.h>
-#include <environment.h>
-#include <asm/io.h>
-#include <asm/arch/gx.h>
-#include <asm/arch/mem.h>
-#include <asm/arch/sm.h>
-#include <asm/arch/eth.h>
-
-#define EFUSE_SN_OFFSET		20
-#define EFUSE_SN_SIZE		16
-#define EFUSE_MAC_OFFSET	52
-#define EFUSE_MAC_SIZE		6
-
-int board_init(void)
-{
-	return 0;
-}
-
-int misc_init_r(void)
-{
-	u8 mac_addr[EFUSE_MAC_SIZE];
-	char serial[EFUSE_SN_SIZE];
-	ssize_t len;
-
-	meson_gx_eth_init(PHY_INTERFACE_MODE_RMII,
-			  MESON_GXL_USE_INTERNAL_RMII_PHY);
-
-	if (!eth_env_get_enetaddr("ethaddr", mac_addr)) {
-		len = meson_sm_read_efuse(EFUSE_MAC_OFFSET,
-					  mac_addr, EFUSE_MAC_SIZE);
-		if (len == EFUSE_MAC_SIZE && is_valid_ethaddr(mac_addr))
-			eth_env_set_enetaddr("ethaddr", mac_addr);
-	}
-
-	if (!env_get("serial#")) {
-		len = meson_sm_read_efuse(EFUSE_SN_OFFSET, serial,
-					  EFUSE_SN_SIZE);
-		if (len == EFUSE_SN_SIZE)
-			env_set("serial#", serial);
-	}
-
-	return 0;
-}
-
-int ft_board_setup(void *blob, bd_t *bd)
-{
-	meson_gx_init_reserved_memory(blob);
-
-	return 0;
-}
diff --git a/board/amlogic/libretech-cc/Kconfig b/board/amlogic/libretech-cc/Kconfig
deleted file mode 100644
index 7a6f9169bd..0000000000
--- a/board/amlogic/libretech-cc/Kconfig
+++ /dev/null
@@ -1,12 +0,0 @@
-if TARGET_LIBRETECH_CC
-
-config SYS_BOARD
-	default "libretech-cc"
-
-config SYS_VENDOR
-	default "amlogic"
-
-config SYS_CONFIG_NAME
-	default "libretech-cc"
-
-endif
diff --git a/board/amlogic/libretech-cc/MAINTAINERS b/board/amlogic/libretech-cc/MAINTAINERS
deleted file mode 100644
index 398ce57db2..0000000000
--- a/board/amlogic/libretech-cc/MAINTAINERS
+++ /dev/null
@@ -1,6 +0,0 @@
-LIBRETECH-CC
-M:	Neil Armstrong <narmstrong@baylibre.com>
-S:	Maintained
-F:	board/amlogic/libretech-cc/
-F:	include/configs/libretech-cc.h
-F:	configs/libretech-cc_defconfig
diff --git a/board/amlogic/libretech-cc/Makefile b/board/amlogic/libretech-cc/Makefile
deleted file mode 100644
index 3b0adf8bf5..0000000000
--- a/board/amlogic/libretech-cc/Makefile
+++ /dev/null
@@ -1,6 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0+
-#
-# (C) Copyright 2016 BayLibre, SAS
-# Author: Neil Armstrong <narmstrong@baylibre.com>
-
-obj-y	:= libretech-cc.o
diff --git a/board/amlogic/libretech-cc/libretech-cc.c b/board/amlogic/libretech-cc/libretech-cc.c
deleted file mode 100644
index ccab1272c5..0000000000
--- a/board/amlogic/libretech-cc/libretech-cc.c
+++ /dev/null
@@ -1,57 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/*
- * Copyright (C) 2016 BayLibre, SAS
- * Author: Neil Armstrong <narmstrong@baylibre.com>
- */
-
-#include <common.h>
-#include <dm.h>
-#include <environment.h>
-#include <asm/io.h>
-#include <asm/arch/gx.h>
-#include <asm/arch/sm.h>
-#include <asm/arch/eth.h>
-#include <asm/arch/mem.h>
-
-#define EFUSE_SN_OFFSET		20
-#define EFUSE_SN_SIZE		16
-#define EFUSE_MAC_OFFSET	52
-#define EFUSE_MAC_SIZE		6
-
-int board_init(void)
-{
-	return 0;
-}
-
-int misc_init_r(void)
-{
-	u8 mac_addr[EFUSE_MAC_SIZE];
-	char serial[EFUSE_SN_SIZE];
-	ssize_t len;
-
-	meson_gx_eth_init(PHY_INTERFACE_MODE_RMII,
-			  MESON_GXL_USE_INTERNAL_RMII_PHY);
-
-	if (!eth_env_get_enetaddr("ethaddr", mac_addr)) {
-		len = meson_sm_read_efuse(EFUSE_MAC_OFFSET,
-					  mac_addr, EFUSE_MAC_SIZE);
-		if (len == EFUSE_MAC_SIZE && is_valid_ethaddr(mac_addr))
-			eth_env_set_enetaddr("ethaddr", mac_addr);
-	}
-
-	if (!env_get("serial#")) {
-		len = meson_sm_read_efuse(EFUSE_SN_OFFSET, serial,
-					  EFUSE_SN_SIZE);
-		if (len == EFUSE_SN_SIZE)
-			env_set("serial#", serial);
-	}
-
-	return 0;
-}
-
-int ft_board_setup(void *blob, bd_t *bd)
-{
-	meson_gx_init_reserved_memory(blob);
-
-	return 0;
-}
diff --git a/board/amlogic/khadas-vim/README b/board/amlogic/p212/README.khadas-vim
similarity index 100%
rename from board/amlogic/khadas-vim/README
rename to board/amlogic/p212/README.khadas-vim
diff --git a/board/amlogic/libretech-cc/README b/board/amlogic/p212/README.libretech-cc
similarity index 100%
rename from board/amlogic/libretech-cc/README
rename to board/amlogic/p212/README.libretech-cc
diff --git a/board/amlogic/p212/README b/board/amlogic/p212/README.p212
similarity index 100%
rename from board/amlogic/p212/README
rename to board/amlogic/p212/README.p212
diff --git a/configs/khadas-vim_defconfig b/configs/khadas-vim_defconfig
index 0c89d9a22c..af30113760 100644
--- a/configs/khadas-vim_defconfig
+++ b/configs/khadas-vim_defconfig
@@ -2,7 +2,7 @@ CONFIG_ARM=y
 CONFIG_ARCH_MESON=y
 CONFIG_SYS_TEXT_BASE=0x01000000
 CONFIG_MESON_GXL=y
-CONFIG_TARGET_KHADAS_VIM=y
+CONFIG_TARGET_P212=y
 CONFIG_DEBUG_UART_BASE=0xc81004c0
 CONFIG_DEBUG_UART_CLOCK=24000000
 CONFIG_IDENT_STRING=" khadas-vim"
diff --git a/configs/libretech-cc_defconfig b/configs/libretech-cc_defconfig
index 36d117c4ab..7526516060 100644
--- a/configs/libretech-cc_defconfig
+++ b/configs/libretech-cc_defconfig
@@ -2,7 +2,7 @@ CONFIG_ARM=y
 CONFIG_ARCH_MESON=y
 CONFIG_SYS_TEXT_BASE=0x01000000
 CONFIG_MESON_GXL=y
-CONFIG_TARGET_LIBRETECH_CC=y
+CONFIG_TARGET_P212=y
 CONFIG_DEBUG_UART_BASE=0xc81004c0
 CONFIG_DEBUG_UART_CLOCK=24000000
 CONFIG_IDENT_STRING=" libretech-cc"
-- 
2.19.1
