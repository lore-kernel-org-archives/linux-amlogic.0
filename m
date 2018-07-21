From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat, 21 Jul 2018 19:25:36 +0200
Subject: [PATCH 1/2] dt-bindings: clock: meson8b: export the CPU_DIV16 clock
In-Reply-To: <20180721172537.15639-1-martin.blumenstingl@googlemail.com>
References: <20180721172537.15639-1-martin.blumenstingl@googlemail.com>
Message-ID: <20180721172537.15639-2-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The CPU_DIV16 clock is used for the TWD timer on Meson8, Meson8b and
Meson8m2.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 include/dt-bindings/clock/meson8b-clkc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/meson8b-clkc.h b/include/dt-bindings/clock/meson8b-clkc.h
index a60f47b49231..041560d9a67b 100644
--- a/include/dt-bindings/clock/meson8b-clkc.h
+++ b/include/dt-bindings/clock/meson8b-clkc.h
@@ -103,5 +103,6 @@
 #define CLKID_MPLL1		94
 #define CLKID_MPLL2		95
 #define CLKID_NAND_CLK		112
+#define CLKID_CPU_DIV16		113
 
 #endif /* __MESON8B_CLKC_H */
-- 
2.18.0
