From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Mon, 23 Apr 2018 21:35:08 +0200
Subject: [PATCH v4 1/2] dt-bindings: clock: meson8b: export the NAND clock
In-Reply-To: <20180423193509.30584-1-martin.blumenstingl@googlemail.com>
References: <20180423193509.30584-1-martin.blumenstingl@googlemail.com>
Message-ID: <20180423193509.30584-2-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Export the NAND clock to the dt-bindings.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Acked-by: Jerome Brunet <jbrunet@baylibre.com>
---
 include/dt-bindings/clock/meson8b-clkc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/meson8b-clkc.h b/include/dt-bindings/clock/meson8b-clkc.h
index dea9d46d4fa7..a60f47b49231 100644
--- a/include/dt-bindings/clock/meson8b-clkc.h
+++ b/include/dt-bindings/clock/meson8b-clkc.h
@@ -102,5 +102,6 @@
 #define CLKID_MPLL0		93
 #define CLKID_MPLL1		94
 #define CLKID_MPLL2		95
+#define CLKID_NAND_CLK		112
 
 #endif /* __MESON8B_CLKC_H */
-- 
2.17.0
