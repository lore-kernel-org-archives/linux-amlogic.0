From: mturquette@baylibre.com (Michael Turquette)
Date: Wed, 22 Jun 2016 19:12:21 -0700
Subject: [PATCH v2 1/3] arm: meson: explicitly select clk drivers
In-Reply-To: <1466647943-23193-1-git-send-email-mturquette@baylibre.com>
References: <1466647943-23193-1-git-send-email-mturquette@baylibre.com>
Message-ID: <1466647943-23193-2-git-send-email-mturquette@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The AmLogic clock controller code is used by both arm and arm64
architectures. Explicitly select the core code for all Meson (32-bit
arm) builds, and also select the Meson8b driver when that machine is
built.

Signed-off-by: Michael Turquette <mturquette@baylibre.com>
---
No changes in v2

 arch/arm/mach-meson/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/mach-meson/Kconfig b/arch/arm/mach-meson/Kconfig
index 31bdd91098b6..c689219501e0 100644
--- a/arch/arm/mach-meson/Kconfig
+++ b/arch/arm/mach-meson/Kconfig
@@ -7,6 +7,8 @@ menuconfig ARCH_MESON
 	select CACHE_L2X0
 	select PINCTRL
 	select PINCTRL_MESON
+	select COMMON_CLK
+	select COMMON_CLK_AMLOGIC
 
 if ARCH_MESON
 
@@ -24,5 +26,6 @@ config MACH_MESON8B
 	bool "Amlogic Meson8b SoCs support"
 	default ARCH_MESON
 	select MESON6_TIMER
+	select COMMON_CLK_MESON8B
 
 endif
-- 
2.1.4
