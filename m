From: narmstrong@baylibre.com (Neil Armstrong)
Date: Fri,  9 Nov 2018 16:26:40 +0100
Subject: [PATCH u-boot 01/19] ARM: meson: clean-up platform selection
In-Reply-To: <1541777218-472-1-git-send-email-narmstrong@baylibre.com>
References: <1541777218-472-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <1541777218-472-2-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

From: Jerome Brunet <jbrunet@baylibre.com>

Even if multiple board are selected through Kconfig, u-boot will only
compile one. This makes sense since compiling these targets will export
global symbols, such as board_init()

The change rework amlogic Kconfig so only one board may be selected at
a time

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm/mach-meson/Kconfig | 51 ++++++++++++++++++---------------------------
 1 file changed, 20 insertions(+), 31 deletions(-)

diff --git a/arch/arm/mach-meson/Kconfig b/arch/arm/mach-meson/Kconfig
index cc94344..bc0f6a1 100644
--- a/arch/arm/mach-meson/Kconfig
+++ b/arch/arm/mach-meson/Kconfig
@@ -1,41 +1,32 @@
 if ARCH_MESON
 
-config MESON_GXBB
-	bool "Support Meson GXBaby"
+config MESON64_COMMON
+	bool
 	select ARM64
 	select CLK
 	select DM
 	select DM_SERIAL
 	imply CMD_DM
-	help
-	  The Amlogic Meson GXBaby (S905) is an ARM SoC with a
-	  quad-core Cortex-A53 CPU and a Mali-450 GPU.
+
+config MESON_GXBB
+	bool
+	select MESON64_COMMON
 
 config MESON_GXL
-	bool "Support Meson GXL"
-	select ARM64
-	select CLK
-	select DM
-	select DM_SERIAL
-	imply CMD_DM
-	help
-	  The Amlogic Meson GXL (S905X and S905D) is an ARM SoC with a
-	  quad-core Cortex-A53 CPU and a Mali-450 GPU.
+	bool
+	select MESON64_COMMON
 
 config MESON_GXM
-	bool "Support Meson GXM"
-	select ARM64
-	select CLK
-	select DM
-	select DM_SERIAL
-	help
-	  The Amlogic Meson GXM (S912) is an ARM SoC with an
-	  octo-core Cortex-A53 CPU and a Mali-T860 GPU.
+	bool
+	select MESON64_COMMON
 
-if MESON_GXBB
+choice
+	prompt "Platform select"
+	default TARGET_ODROID_C2
 
 config TARGET_ODROID_C2
 	bool "ODROID-C2"
+	select MESON_GXBB
 	help
 	  ODROID-C2 is a single board computer based on Meson GXBaby
 	  with 2 GiB of RAM, Gigabit Ethernet, HDMI, 4 USB, micro-SD
@@ -43,16 +34,15 @@ config TARGET_ODROID_C2
 
 config TARGET_NANOPI_K2
 	bool "NANOPI_K2"
+	select MESON_GXBB
 	help
 	  NANOPI_K2 is a single board computer based on Meson GXBaby
 	  with 2 GiB of RAM, Gigabit Ethernet,AP6212 Wifi, HDMI, 4 USB,
 	  micro-SD slot, eMMC, IR receiver and a 40-pin GPIO header.
-endif
-
-if MESON_GXL
 
 config TARGET_P212
 	bool "P212"
+	select MESON_GXL
 	help
 	  P212 is a reference dessign board based on Meson GXL S905X SoC
 	  with 2 GiB of RAM, Ethernet, HDMI, 2 USB, micro-SD slot,
@@ -60,6 +50,7 @@ config TARGET_P212
 
 config TARGET_LIBRETECH_CC
 	bool "LIBRETECH-CC"
+	select MESON_GXL
 	help
 	  LibreTech CC is a single board computer based on Meson GXL
 	  with 2 GiB of RAM, Ethernet, HDMI, 4 USB, micro-SD slot,
@@ -67,23 +58,21 @@ config TARGET_LIBRETECH_CC
 
 config TARGET_KHADAS_VIM
 	bool "KHADAS-VIM"
+	select MESON_GXL
 	help
 	  Khadas VIM is a single board computer based on Meson GXL
 	  with 2 GiB of RAM, Ethernet, HDMI, 4 USB, micro-SD slot,
 	  eMMC, IR receiver and a 40-pin GPIO header.
 
-endif
-
-if MESON_GXM
-
 config TARGET_KHADAS_VIM2
 	bool "KHADAS-VIM2"
+	select MESON_GXM
 	help
 	  Khadas VIM2 is a single board computer based on Meson GXM
 	  with 2/3 GiB of RAM, Ethernet, HDMI, 4 USB, micro-SD slot,
 	  eMMC, IR receiver and a 40-pin GPIO header.
 
-endif
+endchoice
 
 config SYS_SOC
 	default "meson"
-- 
2.7.4
