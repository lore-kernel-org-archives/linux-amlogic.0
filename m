From: mturquette@baylibre.com (Michael Turquette)
Date: Thu,  9 Jun 2016 17:32:48 -0700
Subject: [PATCH 1/7] clk: meson: add peripheral gate macro
In-Reply-To: <1465518774-26924-1-git-send-email-mturquette@baylibre.com>
References: <1465518774-26924-1-git-send-email-mturquette@baylibre.com>
Message-ID: <1465518774-26924-2-git-send-email-mturquette@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

There are a series of peripheral and system gate clocks that fan out
from the clk81 signal. Add a helper macro to statically initialize these
gate clocks.

Signed-off-by: Michael Turquette <mturquette@baylibre.com>
---
 drivers/clk/meson/clkc.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/clk/meson/clkc.h b/drivers/clk/meson/clkc.h
index f3f3961..9436932 100644
--- a/drivers/clk/meson/clkc.h
+++ b/drivers/clk/meson/clkc.h
@@ -73,6 +73,20 @@ struct meson_clk_cpu {
 int meson_clk_cpu_notifier_cb(struct notifier_block *nb, unsigned long event,
 		void *data);
 
+#define MESON_GATE(_name, _reg, _bit)					\
+struct clk_gate gxbb_##_name = { 						\
+	.reg = (void __iomem *) _reg, 					\
+	.bit_idx = (_bit), 						\
+	.lock = &clk_lock,						\
+	.hw.init = &(struct clk_init_data) { 				\
+		.name = #_name,					\
+		.ops = &clk_gate_ops,					\
+		.parent_names = (const char *[]){ "clk81" },		\
+		.num_parents = 1,					\
+		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED), 	\
+	},								\
+};
+
 /* clk_ops */
 extern const struct clk_ops meson_clk_pll_ro_ops;
 extern const struct clk_ops meson_clk_pll_ops;
-- 
2.1.4
