From: mturquette@baylibre.com (Michael Turquette)
Date: Wed, 22 Jun 2016 19:12:22 -0700
Subject: [PATCH v2 2/3] arm64: amlogic: select gxbb clk driver
In-Reply-To: <1466647943-23193-1-git-send-email-mturquette@baylibre.com>
References: <1466647943-23193-1-git-send-email-mturquette@baylibre.com>
Message-ID: <1466647943-23193-3-git-send-email-mturquette@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The AmLogic clock controller code is used by both arm and arm64
architectures. Explicitly select the core code for all Meson (arm64)
builds, and also select the GXBB driver, since that's the way arm64 does
things.

Signed-off-by: Michael Turquette <mturquette@baylibre.com>
---
No changes in v2

 arch/arm64/Kconfig.platforms | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 26c56177382c..fd7d9b51afb4 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -68,6 +68,8 @@ config ARCH_MESON
 	bool "Amlogic Platforms"
 	select PINCTRL
 	select PINCTRL_MESON
+	select COMMON_CLK_AMLOGIC
+	select COMMON_CLK_GXBB
 	help
 	  This enables support for the Amlogic S905 SoCs.
 
-- 
2.1.4
