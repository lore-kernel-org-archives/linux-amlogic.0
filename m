From: jbrunet@baylibre.com (Jerome Brunet)
Date: Mon, 19 Feb 2018 12:21:42 +0100
Subject: [PATCH 07/11] clk: meson: axg: add hifi clock bindings
In-Reply-To: <20180219112146.21746-1-jbrunet@baylibre.com>
References: <20180219112146.21746-1-jbrunet@baylibre.com>
Message-ID: <20180219112146.21746-8-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Add the new HIFI pll to axg clock bindings

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 include/dt-bindings/clock/axg-clkc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/axg-clkc.h b/include/dt-bindings/clock/axg-clkc.h
index 941ac70e7f30..555937a25504 100644
--- a/include/dt-bindings/clock/axg-clkc.h
+++ b/include/dt-bindings/clock/axg-clkc.h
@@ -67,5 +67,6 @@
 #define CLKID_AO_I2C				58
 #define CLKID_SD_EMMC_B_CLK0			59
 #define CLKID_SD_EMMC_C_CLK0			60
+#define CLKID_HIFI_PLL				69
 
 #endif /* __AXG_CLKC_H */
-- 
2.14.3
