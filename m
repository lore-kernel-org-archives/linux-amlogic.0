From: serveralex@gmail.com (=?UTF-8?q?Alexander=20M=C3=BCller?=)
Date: Tue,  5 Jul 2016 19:56:31 +0200
Subject: [PATCH 7/7] arm: amlogic: select meson8b clk driver
In-Reply-To: <1467741391-60534-1-git-send-email-serveralex@gmail.com>
References: <1467741391-60534-1-git-send-email-serveralex@gmail.com>
Message-ID: <1467741391-60534-8-git-send-email-serveralex@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Select the Amlogic clk code for meson SoCs and the more specific meson8b clk
driver for Amlogic meson8b.

Signed-off-by: Alexander M?ller <serveralex@gmail.com>
---
 arch/arm/mach-meson/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-meson/Kconfig b/arch/arm/mach-meson/Kconfig
index 31bdd91..b3add39 100644
--- a/arch/arm/mach-meson/Kconfig
+++ b/arch/arm/mach-meson/Kconfig
@@ -7,6 +7,7 @@ menuconfig ARCH_MESON
 	select CACHE_L2X0
 	select PINCTRL
 	select PINCTRL_MESON
+	select COMMON_CLK_AMLOGIC
 
 if ARCH_MESON
 
@@ -24,5 +25,6 @@ config MACH_MESON8B
 	bool "Amlogic Meson8b SoCs support"
 	default ARCH_MESON
 	select MESON6_TIMER
+	select COMMON_CLK_MESON8B
 
 endif
-- 
2.5.0
