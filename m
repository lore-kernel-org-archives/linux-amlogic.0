From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 11 Jun 2017 12:16:35 +0200
Subject: [PATCH 04/13] clk: meson8b: export the USB clocks
In-Reply-To: <20170611101644.28581-1-martin.blumenstingl@googlemail.com>
References: <20170611101644.28581-1-martin.blumenstingl@googlemail.com>
Message-ID: <20170611101644.28581-5-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Export the USB related clocks (for the USB controller and the USB2 PHYs)
so they can be used in the dt-bindings.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.h              | 10 +++++-----
 include/dt-bindings/clock/meson8b-clkc.h |  5 +++++
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
index 51c3f6717180..17479c60864d 100644
--- a/drivers/clk/meson/meson8b.h
+++ b/drivers/clk/meson/meson8b.h
@@ -114,12 +114,12 @@
 #define CLKID_AIU		47
 #define CLKID_UART1		48
 #define CLKID_G2D		49
-#define CLKID_USB0		50
-#define CLKID_USB1		51
+/* #define CLKID_USB0 */
+/* #define CLKID_USB1 */
 #define CLKID_RESET		52
 #define CLKID_NAND		53
 #define CLKID_DOS_PARSER	54
-#define CLKID_USB		55
+/* #define CLKID_USB */
 #define CLKID_VDIN1		56
 #define CLKID_AHB_ARB0		57
 #define CLKID_EFUSE		58
@@ -128,8 +128,8 @@
 #define CLKID_AHB_CTRL_BUS	61
 #define CLKID_HDMI_INTR_SYNC	62
 #define CLKID_HDMI_PCLK		63
-#define CLKID_USB1_DDR_BRIDGE	64
-#define CLKID_USB0_DDR_BRIDGE	65
+/* CLKID_USB1_DDR_BRIDGE */
+/* CLKID_USB0_DDR_BRIDGE */
 #define CLKID_MMC_PCLK		66
 #define CLKID_DVIN		67
 #define CLKID_UART2		68
diff --git a/include/dt-bindings/clock/meson8b-clkc.h b/include/dt-bindings/clock/meson8b-clkc.h
index f004e6760b5d..04f0d1fcd308 100644
--- a/include/dt-bindings/clock/meson8b-clkc.h
+++ b/include/dt-bindings/clock/meson8b-clkc.h
@@ -24,6 +24,11 @@
 #define CLKID_SAR_ADC		23
 #define CLKID_RNG0		25
 #define CLKID_SDIO		30
+#define CLKID_USB0		50
+#define CLKID_USB1		51
+#define CLKID_USB		55
+#define CLKID_USB1_DDR_BRIDGE	64
+#define CLKID_USB0_DDR_BRIDGE	65
 #define CLKID_SANA		69
 
 #endif /* __MESON8B_CLKC_H */
-- 
2.13.1
