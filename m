From: mturquette@baylibre.com (Michael Turquette)
Date: Wed, 22 Jun 2016 19:01:16 -0700
Subject: [PATCH v2 2/6] clk: meson: add peripheral gate macro
In-Reply-To: <1466647280-17596-1-git-send-email-mturquette@baylibre.com>
References: <1466647280-17596-1-git-send-email-mturquette@baylibre.com>
Message-ID: <1466647280-17596-3-git-send-email-mturquette@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

There are a series of peripheral and system gate clocks that fan out
from the clk81 signal. Add a helper macro to statically initialize these
gate clocks.

Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Michael Turquette <mturquette@baylibre.com>
---
No change in v2.

 drivers/clk/meson/clkc.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/clk/meson/clkc.h b/drivers/clk/meson/clkc.h
index f3f396168ba4..9436932880c0 100644
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
