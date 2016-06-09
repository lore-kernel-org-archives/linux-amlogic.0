From: carlo@caione.org (Carlo Caione)
Date: Thu,  9 Jun 2016 16:45:42 +0200
Subject: [PATCH 1/2] configs: gxbb: Introduce a common config header file
In-Reply-To: <1465483543-2240-1-git-send-email-carlo@caione.org>
References: <1465483543-2240-1-git-send-email-carlo@caione.org>
Message-ID: <1465483543-2240-2-git-send-email-carlo@caione.org>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

From: Carlo Caione <carlo@endlessm.com>

Introduce a meson-gxbb-common.h header file and derive the
configuration for Hardkernel Odroid-C2 board from that.

Signed-off-by: Carlo Caione <carlo@endlessm.com>
---
 include/configs/meson-gxbb-common.h | 45 +++++++++++++++++++++++++++++++++++++
 include/configs/odroid-c2.h         | 34 +---------------------------
 2 files changed, 46 insertions(+), 33 deletions(-)
 create mode 100644 include/configs/meson-gxbb-common.h

diff --git a/include/configs/meson-gxbb-common.h b/include/configs/meson-gxbb-common.h
new file mode 100644
index 0000000..d1c0050
--- /dev/null
+++ b/include/configs/meson-gxbb-common.h
@@ -0,0 +1,45 @@
+/*
+ * Configuration for Amlogic Meson GXBB SoCs
+ * (C) Copyright 2016 Beniamino Galvani <b.galvani@gmail.com>
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+#ifndef __MESON_GXBB_COMMON_CONFIG_H
+#define __MESON_GXBB_COMMON_CONFIG_H
+
+#define CONFIG_CPU_ARMV8
+#define CONFIG_REMAKE_ELF
+#define CONFIG_SYS_CACHELINE_SIZE	64
+#define CONFIG_SYS_NO_FLASH
+#define CONFIG_NR_DRAM_BANKS		1
+#define CONFIG_ENV_IS_NOWHERE		1
+#define CONFIG_ENV_SIZE			0x2000
+#define CONFIG_SYS_MAXARGS		32
+#define CONFIG_SYS_MALLOC_LEN		(32 << 20)
+#define CONFIG_SYS_CBSIZE		1024
+#define CONFIG_MISC_INIT_R
+
+#define CONFIG_SYS_SDRAM_BASE		0
+#define CONFIG_SYS_TEXT_BASE		0x01000000
+#define CONFIG_SYS_INIT_SP_ADDR		0x20000000
+#define CONFIG_SYS_LOAD_ADDR		CONFIG_SYS_TEXT_BASE
+
+/* Generic Interrupt Controller Definitions */
+#define GICD_BASE			0xc4301000
+#define GICC_BASE			0xc4302000
+
+#define CONFIG_CMD_ENV
+
+/* Monitor Command Prompt */
+/* Console I/O Buffer Size */
+#define CONFIG_SYS_PBSIZE		(CONFIG_SYS_CBSIZE + \
+					sizeof(CONFIG_SYS_PROMPT) + 16)
+#define CONFIG_SYS_HUSH_PARSER
+#define CONFIG_SYS_BARGSIZE		CONFIG_SYS_CBSIZE
+#define CONFIG_SYS_LONGHELP
+#define CONFIG_CMDLINE_EDITING
+
+#include <config_distro_defaults.h>
+
+#endif /* __MESON_GXBB_COMMON_CONFIG_H */
diff --git a/include/configs/odroid-c2.h b/include/configs/odroid-c2.h
index 37a5671..bf5df9c 100644
--- a/include/configs/odroid-c2.h
+++ b/include/configs/odroid-c2.h
@@ -8,44 +8,12 @@
 #ifndef __CONFIG_H
 #define __CONFIG_H
 
-#define CONFIG_CPU_ARMV8
-#define CONFIG_REMAKE_ELF
-#define CONFIG_SYS_CACHELINE_SIZE	64
-#define CONFIG_SYS_NO_FLASH
-#define CONFIG_NR_DRAM_BANKS		1
-#define CONFIG_ENV_IS_NOWHERE		1
-#define CONFIG_ENV_SIZE			0x2000
-#define CONFIG_SYS_MAXARGS		32
-#define CONFIG_SYS_MALLOC_LEN		(32 << 20)
-#define CONFIG_SYS_CBSIZE		1024
-#define CONFIG_MISC_INIT_R
-
-#define CONFIG_SYS_SDRAM_BASE		0
-#define CONFIG_SYS_TEXT_BASE		0x01000000
-#define CONFIG_SYS_INIT_SP_ADDR		0x20000000
-#define CONFIG_SYS_LOAD_ADDR		CONFIG_SYS_TEXT_BASE
-
-/* Generic Interrupt Controller Definitions */
-#define GICD_BASE			0xc4301000
-#define GICC_BASE			0xc4302000
-
 #define CONFIG_IDENT_STRING		" odroid-c2"
 
 /* Serial setup */
 #define CONFIG_CONS_INDEX		0
 #define CONFIG_BAUDRATE			115200
 
-#define CONFIG_CMD_ENV
-
-/* Monitor Command Prompt */
-/* Console I/O Buffer Size */
-#define CONFIG_SYS_PBSIZE		(CONFIG_SYS_CBSIZE + \
-					sizeof(CONFIG_SYS_PROMPT) + 16)
-#define CONFIG_SYS_HUSH_PARSER
-#define CONFIG_SYS_BARGSIZE		CONFIG_SYS_CBSIZE
-#define CONFIG_SYS_LONGHELP
-#define CONFIG_CMDLINE_EDITING
-
-#include <config_distro_defaults.h>
+#include <configs/meson-gxbb-common.h>
 
 #endif /* __CONFIG_H */
-- 
2.7.4
