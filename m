From: jbrunet@baylibre.com (Jerome Brunet)
Date: Thu,  9 Mar 2017 11:41:46 +0100
Subject: [PATCH v2 1/9] clk: meson: fix SET_PARM macro
In-Reply-To: <20170309104154.28295-1-jbrunet@baylibre.com>
References: <20170309104154.28295-1-jbrunet@baylibre.com>
Message-ID: <20170309104154.28295-2-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

parameter val is not enclosed in parenthesis which is buggy when given an
expression instead of a simple value

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Kevin Hilman <khilman@baylibre.com>
---
 drivers/clk/meson/clkc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/clkc.h b/drivers/clk/meson/clkc.h
index 9bb70e7a7d6a..c6be77dd8694 100644
--- a/drivers/clk/meson/clkc.h
+++ b/drivers/clk/meson/clkc.h
@@ -25,7 +25,7 @@
 #define PARM_GET(width, shift, reg)					\
 	(((reg) & SETPMASK(width, shift)) >> (shift))
 #define PARM_SET(width, shift, reg, val)				\
-	(((reg) & CLRPMASK(width, shift)) | (val << (shift)))
+	(((reg) & CLRPMASK(width, shift)) | ((val) << (shift)))
 
 #define MESON_PARM_APPLICABLE(p)		(!!((p)->width))
 
-- 
2.9.3
