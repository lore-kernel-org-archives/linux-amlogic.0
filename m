From: narmstrong@baylibre.com (Neil Armstrong)
Date: Wed, 27 Jun 2018 17:19:02 +0200
Subject: [PATCH u-boot] boards: amlogic: Fix boards README
Message-ID: <1530112742-13618-1-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Fix typos and update the supported devices for all Amlogic boards.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm/mach-meson/Kconfig       |  2 +-
 board/amlogic/khadas-vim/README   |  8 +++++++-
 board/amlogic/libretech-cc/README | 12 +++++++++---
 board/amlogic/odroid-c2/README    |  5 +++++
 board/amlogic/p212/README         |  7 +++++++
 5 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-meson/Kconfig b/arch/arm/mach-meson/Kconfig
index 9a06ccc..5364e9d 100644
--- a/arch/arm/mach-meson/Kconfig
+++ b/arch/arm/mach-meson/Kconfig
@@ -17,7 +17,7 @@ config MESON_GXL
 	select DM
 	select DM_SERIAL
 	help
-	  The Amlogic Meson GXL (S905X and S905X) is an ARM SoC with a
+	  The Amlogic Meson GXL (S905X and S905D) is an ARM SoC with a
 	  quad-core Cortex-A53 CPU and a Mali-450 GPU.
 
 if MESON_GXBB
diff --git a/board/amlogic/khadas-vim/README b/board/amlogic/khadas-vim/README
index 7eaca72..0ccd8f5 100644
--- a/board/amlogic/khadas-vim/README
+++ b/board/amlogic/khadas-vim/README
@@ -4,7 +4,7 @@ U-Boot for Khadas VIM
 Khadas VIM is an Open Source DIY Box manufactured by Shenzhen Wesion
 Technology Co., Ltd with the following specifications:
 
- - Amlogic S905x ARM Cortex-A53 quad-core SoC @ 2GHz
+ - Amlogic S905X ARM Cortex-A53 quad-core SoC @ 1.5GHz
  - ARM Mali 450 GPU
  - 2GB DDR3 SDRAM
  - 10/100 Ethernet
@@ -20,6 +20,12 @@ Currently the u-boot port supports the following devices:
  - serial
  - eMMC, microSD
  - Ethernet
+ - I2C
+ - Regulators
+ - Reset controller
+ - Clock controller
+ - USB Host
+ - ADC
 
 U-Boot compilation
 ==================
diff --git a/board/amlogic/libretech-cc/README b/board/amlogic/libretech-cc/README
index c06a392..d007f58 100644
--- a/board/amlogic/libretech-cc/README
+++ b/board/amlogic/libretech-cc/README
@@ -4,13 +4,13 @@ U-Boot for LibreTech CC
 LibreTech CC is a single board computer manufactured by Libre Technology
 with the following specifications:
 
- - Amlogic S905X ARM Cortex-A53 quad-core SoC @ 2GHz
+ - Amlogic S905X ARM Cortex-A53 quad-core SoC @ 1.5GHz
  - ARM Mali 450 GPU
  - 2GB DDR3 SDRAM
- - Gigabit Ethernet
+ - 10/100 Ethernet
  - HDMI 2.0 4K/60Hz display
  - 40-pin GPIO header
- - 4 x USB 2.0 Host, 1 x USB OTG
+ - 4 x USB 2.0 Host
  - eMMC, microSD
  - Infrared receiver
 
@@ -20,6 +20,12 @@ Currently the U-Boot port supports the following devices:
  - serial
  - eMMC, microSD
  - Ethernet
+ - I2C
+ - Regulators
+ - Reset controller
+ - Clock controller
+ - USB Host
+ - ADC
 
 U-Boot compilation
 ==================
diff --git a/board/amlogic/odroid-c2/README b/board/amlogic/odroid-c2/README
index b407c04..bed48c5 100644
--- a/board/amlogic/odroid-c2/README
+++ b/board/amlogic/odroid-c2/README
@@ -20,6 +20,11 @@ Currently the u-boot port supports the following devices:
  - serial
  - eMMC, microSD
  - Ethernet
+ - I2C
+ - Regulators
+ - Reset controller
+ - Clock controller
+ - ADC
 
 u-boot compilation
 ==================
diff --git a/board/amlogic/p212/README b/board/amlogic/p212/README
index 979502d..ef5370c 100644
--- a/board/amlogic/p212/README
+++ b/board/amlogic/p212/README
@@ -20,6 +20,13 @@ Schematics are available from Amlogic on demand.
 Currently the u-boot port supports the following devices:
  - serial
  - eMMC, microSD
+ - Ethernet
+ - I2C
+ - Regulators
+ - Reset controller
+ - Clock controller
+ - USB Host
+ - ADC
 
 u-boot compilation
 ==================
-- 
2.7.4
