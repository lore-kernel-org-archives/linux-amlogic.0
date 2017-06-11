From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 11 Jun 2017 12:16:36 +0200
Subject: [PATCH 05/13] clk: meson8b: export the ethernet gate clock
In-Reply-To: <20170611101644.28581-1-martin.blumenstingl@googlemail.com>
References: <20170611101644.28581-1-martin.blumenstingl@googlemail.com>
Message-ID: <20170611101644.28581-6-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Export the ethernet gate clock to the dt-bindings.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.h              | 2 +-
 include/dt-bindings/clock/meson8b-clkc.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
index 17479c60864d..a687e02547dc 100644
--- a/drivers/clk/meson/meson8b.h
+++ b/drivers/clk/meson/meson8b.h
@@ -100,7 +100,7 @@
 #define CLKID_ASSIST_MISC	33
 #define CLKID_SPI		34
 #define CLKID_I2S_SPDIF		35
-#define CLKID_ETH		36
+/* #define CLKID_ETH */
 #define CLKID_DEMUX		37
 #define CLKID_AIU_GLUE		38
 #define CLKID_IEC958		39
diff --git a/include/dt-bindings/clock/meson8b-clkc.h b/include/dt-bindings/clock/meson8b-clkc.h
index 04f0d1fcd308..e29227fb52a1 100644
--- a/include/dt-bindings/clock/meson8b-clkc.h
+++ b/include/dt-bindings/clock/meson8b-clkc.h
@@ -24,6 +24,7 @@
 #define CLKID_SAR_ADC		23
 #define CLKID_RNG0		25
 #define CLKID_SDIO		30
+#define CLKID_ETH		36
 #define CLKID_USB0		50
 #define CLKID_USB1		51
 #define CLKID_USB		55
-- 
2.13.1
