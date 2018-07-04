From: jbrunet@baylibre.com (Jerome Brunet)
Date: Wed,  4 Jul 2018 18:54:57 +0200
Subject: [PATCH 2/3] clk: meson: expose GEN_CLK clkid
In-Reply-To: <20180704165458.24149-1-jbrunet@baylibre.com>
References: <20180704165458.24149-1-jbrunet@baylibre.com>
Message-ID: <20180704165458.24149-3-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Expose GEN_CLK clock id

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 include/dt-bindings/clock/axg-clkc.h  | 1 +
 include/dt-bindings/clock/gxbb-clkc.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/axg-clkc.h b/include/dt-bindings/clock/axg-clkc.h
index 70371228b7e0..fd1f938c38d1 100644
--- a/include/dt-bindings/clock/axg-clkc.h
+++ b/include/dt-bindings/clock/axg-clkc.h
@@ -71,5 +71,6 @@
 #define CLKID_PCIE_CML_EN0			79
 #define CLKID_PCIE_CML_EN1			80
 #define CLKID_MIPI_ENABLE			81
+#define CLKID_GEN_CLK				84
 
 #endif /* __AXG_CLKC_H */
diff --git a/include/dt-bindings/clock/gxbb-clkc.h b/include/dt-bindings/clock/gxbb-clkc.h
index 7a892be90549..3979d48c025f 100644
--- a/include/dt-bindings/clock/gxbb-clkc.h
+++ b/include/dt-bindings/clock/gxbb-clkc.h
@@ -127,5 +127,6 @@
 #define CLKID_VAPB		140
 #define CLKID_VDEC_1		153
 #define CLKID_VDEC_HEVC		156
+#define CLKID_GEN_CLK		159
 
 #endif /* __GXBB_CLKC_H */
-- 
2.14.4
