From: mturquette@baylibre.com (Michael Turquette)
Date: Thu,  9 Jun 2016 17:32:53 -0700
Subject: [PATCH 6/7] arm64: amlogic: select gxbb clk driver
In-Reply-To: <1465518774-26924-1-git-send-email-mturquette@baylibre.com>
References: <1465518774-26924-1-git-send-email-mturquette@baylibre.com>
Message-ID: <1465518774-26924-7-git-send-email-mturquette@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The AmLogic clock controller code is used by both arm and arm64
architectures. Explicitly select the core code for all Meson (arm64)
builds, and also select the GXBB driver, since that's the way arm64 does
things.

Signed-off-by: Michael Turquette <mturquette@baylibre.com>
---
 arch/arm64/Kconfig.platforms | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 7ef1d05..e6d63ee 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -66,6 +66,8 @@ config ARCH_MEDIATEK
 
 config ARCH_MESON
 	bool "Amlogic Platforms"
+	select COMMON_CLK_AMLOGIC
+	select COMMON_CLK_GXBB
 	help
 	  This enables support for the Amlogic S905 SoCs.
 
-- 
2.1.4
