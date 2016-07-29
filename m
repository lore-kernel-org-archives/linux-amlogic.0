From: serveralex@gmail.com (=?UTF-8?q?Alexander=20M=C3=BCller?=)
Date: Fri, 29 Jul 2016 16:00:59 +0200
Subject: [PATCH v4 1/6] clk: meson: Rename meson8b-clkc.c to reflect gxbb
 naming convention
In-Reply-To: <1469800864-43440-1-git-send-email-serveralex@gmail.com>
References: <1469800864-43440-1-git-send-email-serveralex@gmail.com>
Message-ID: <1469800864-43440-2-git-send-email-serveralex@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Signed-off-by: Alexander M?ller <serveralex@gmail.com>
---
 drivers/clk/meson/Makefile                      | 2 +-
 drivers/clk/meson/{meson8b-clkc.c => meson8b.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename drivers/clk/meson/{meson8b-clkc.c => meson8b.c} (100%)

diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
index 197e401..1a66799 100644
--- a/drivers/clk/meson/Makefile
+++ b/drivers/clk/meson/Makefile
@@ -3,5 +3,5 @@
 #
 
 obj-$(CONFIG_COMMON_CLK_AMLOGIC) += clk-pll.o clk-cpu.o clk-mpll.o
-obj-$(CONFIG_COMMON_CLK_MESON8B) += meson8b-clkc.o
+obj-$(CONFIG_COMMON_CLK_MESON8B) += meson8b.o
 obj-$(CONFIG_COMMON_CLK_GXBB)	 += gxbb.o
diff --git a/drivers/clk/meson/meson8b-clkc.c b/drivers/clk/meson/meson8b.c
similarity index 100%
rename from drivers/clk/meson/meson8b-clkc.c
rename to drivers/clk/meson/meson8b.c
-- 
2.5.0
