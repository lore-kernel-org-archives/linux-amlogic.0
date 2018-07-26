From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu, 26 Jul 2018 15:54:04 +0200
Subject: [PATCH u-boot 2/2] clk: clk_meson: Add mux and div support for
 reparent and rate setting
In-Reply-To: <1532613244-4585-1-git-send-email-narmstrong@baylibre.com>
References: <1532613244-4585-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <1532613244-4585-3-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This patch adds support for :
- Rate calculation through muxes and generic dividers
- Basic gate setting propagation
- Reparenting for muxes
- Clock rate setting through generic dividers without reparenting

Support is only added to the Composite VPU and VAPB clocks in order
to support the Video Processing Unit Power Domain clock setup.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/clk_meson.c | 533 +++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 528 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk_meson.c b/drivers/clk/clk_meson.c
index 3850128..be1cc66 100644
--- a/drivers/clk/clk_meson.c
+++ b/drivers/clk/clk_meson.c
@@ -14,12 +14,69 @@
 #include <dt-bindings/clock/gxbb-clkc.h>
 #include "clk_meson.h"
 
+/* This driver support only basic clock tree operations :
+ * - Can calculate clock frequency on a limited tree
+ * - Can Read muxes and basic dividers (0-based only)
+ * - Can enable/disable gates with limited propagation
+ * - Can reparent without propagation, only on muxes
+ * - Can set rates without reparenting
+ * This driver is adapted to what is actually supported by U-Boot
+ */
+
+/* Only the clocks ids we don't want to expose, such as the internal muxes
+ * and dividers of composite clocks, will remain defined here.
+ */
+#define CLKID_MPEG_SEL		  10
+#define CLKID_MPEG_DIV		  11
+#define CLKID_SAR_ADC_DIV	  99
+#define CLKID_MALI_0_DIV	  101
+#define CLKID_MALI_1_DIV	  104
+#define CLKID_CTS_AMCLK_SEL	  108
+#define CLKID_CTS_AMCLK_DIV	  109
+#define CLKID_CTS_MCLK_I958_SEL	  111
+#define CLKID_CTS_MCLK_I958_DIV	  112
+#define CLKID_32K_CLK_SEL	  115
+#define CLKID_32K_CLK_DIV	  116
+#define CLKID_SD_EMMC_A_CLK0_SEL  117
+#define CLKID_SD_EMMC_A_CLK0_DIV  118
+#define CLKID_SD_EMMC_B_CLK0_SEL  120
+#define CLKID_SD_EMMC_B_CLK0_DIV  121
+#define CLKID_SD_EMMC_C_CLK0_SEL  123
+#define CLKID_SD_EMMC_C_CLK0_DIV  124
+#define CLKID_VPU_0_DIV		  127
+#define CLKID_VPU_1_DIV		  130
+#define CLKID_VAPB_0_DIV	  134
+#define CLKID_VAPB_1_DIV	  137
+#define CLKID_HDMI_PLL_PRE_MULT	  141
+#define CLKID_MPLL0_DIV		  142
+#define CLKID_MPLL1_DIV		  143
+#define CLKID_MPLL2_DIV		  144
+#define CLKID_MPLL_PREDIV	  145
+#define CLKID_FCLK_DIV2_DIV	  146
+#define CLKID_FCLK_DIV3_DIV	  147
+#define CLKID_FCLK_DIV4_DIV	  148
+#define CLKID_FCLK_DIV5_DIV	  149
+#define CLKID_FCLK_DIV7_DIV	  150
+#define CLKID_VDEC_1_SEL	  151
+#define CLKID_VDEC_1_DIV	  152
+#define CLKID_VDEC_HEVC_SEL	  154
+#define CLKID_VDEC_HEVC_DIV	  155
+
 #define XTAL_RATE 24000000
 
 struct meson_clk {
 	void __iomem *addr;
 };
 
+static ulong meson_div_get_rate(struct clk *clk, unsigned long id);
+static ulong meson_div_set_rate(struct clk *clk, unsigned long id, ulong rate,
+				ulong current_rate);
+static ulong meson_mux_set_parent(struct clk *clk, unsigned long id,
+				  unsigned long parent_id);
+static ulong meson_mux_get_rate(struct clk *clk, unsigned long id);
+static ulong meson_clk_set_rate_by_id(struct clk *clk, unsigned long id,
+				      ulong rate, ulong current_rate);
+static ulong meson_mux_get_parent(struct clk *clk, unsigned long id);
 static ulong meson_clk_get_rate_by_id(struct clk *clk, unsigned long id);
 
 struct meson_gate gates[] = {
@@ -126,34 +183,387 @@ struct meson_gate gates[] = {
 	MESON_GATE(CLKID_SD_EMMC_A_CLK0, HHI_SD_EMMC_CLK_CNTL, 7),
 	MESON_GATE(CLKID_SD_EMMC_B_CLK0, HHI_SD_EMMC_CLK_CNTL, 23),
 	MESON_GATE(CLKID_SD_EMMC_C_CLK0, HHI_NAND_CLK_CNTL, 7),
+	MESON_GATE(CLKID_VPU_0, HHI_VPU_CLK_CNTL, 8),
+	MESON_GATE(CLKID_VPU_1, HHI_VPU_CLK_CNTL, 24),
+	MESON_GATE(CLKID_VAPB_0, HHI_VAPBCLK_CNTL, 8),
+	MESON_GATE(CLKID_VAPB_1, HHI_VAPBCLK_CNTL, 24),
+	MESON_GATE(CLKID_VAPB, HHI_VAPBCLK_CNTL, 30),
 };
 
-static int meson_set_gate(struct clk *clk, bool on)
+static int meson_set_gate_by_id(struct clk *clk, unsigned long id, bool on)
 {
 	struct meson_clk *priv = dev_get_priv(clk->dev);
 	struct meson_gate *gate;
 
-	if (clk->id >= ARRAY_SIZE(gates))
+	debug("%s: %sabling %d\n", __func__, on ? "en" : "dis", id);
+
+	/* Propagate through muxes */
+	switch (id) {
+	case CLKID_VPU:
+		return meson_set_gate_by_id(clk,
+				meson_mux_get_parent(clk, CLKID_VPU), on);
+	case CLKID_VAPB_SEL:
+		return meson_set_gate_by_id(clk,
+				meson_mux_get_parent(clk, CLKID_VAPB_SEL), on);
+	}
+
+	if (id >= ARRAY_SIZE(gates))
 		return -ENOENT;
 
-	gate = &gates[clk->id];
+	gate = &gates[id];
 
 	if (gate->reg == 0)
 		return 0;
 
+	debug("%s: really %sabling %d\n", __func__, on ? "en" : "dis", id);
+
 	clrsetbits_le32(priv->addr + gate->reg,
 			BIT(gate->bit), on ? BIT(gate->bit) : 0);
+
+	/* Propagate to next gate(s) */
+	switch (id) {
+	case CLKID_VAPB:
+		return meson_set_gate_by_id(clk, CLKID_VAPB_SEL, on);
+	}
+
 	return 0;
 }
 
 static int meson_clk_enable(struct clk *clk)
 {
-	return meson_set_gate(clk, true);
+	return meson_set_gate_by_id(clk, clk->id, true);
 }
 
 static int meson_clk_disable(struct clk *clk)
 {
-	return meson_set_gate(clk, false);
+	return meson_set_gate_by_id(clk, clk->id, false);
+}
+
+static struct parm meson_vpu_0_div_parm = {
+	HHI_VPU_CLK_CNTL, 0, 7,
+};
+
+int meson_vpu_0_div_parent = CLKID_VPU_0_SEL;
+
+static struct parm meson_vpu_1_div_parm = {
+	HHI_VPU_CLK_CNTL, 16, 7,
+};
+
+int meson_vpu_1_div_parent = CLKID_VPU_1_SEL;
+
+static struct parm meson_vapb_0_div_parm = {
+	HHI_VAPBCLK_CNTL, 0, 7,
+};
+
+int meson_vapb_0_div_parent = CLKID_VAPB_0_SEL;
+
+static struct parm meson_vapb_1_div_parm = {
+	HHI_VAPBCLK_CNTL, 16, 7,
+};
+
+int meson_vapb_1_div_parent = CLKID_VAPB_1_SEL;
+
+static ulong meson_div_get_rate(struct clk *clk, unsigned long id)
+{
+	struct meson_clk *priv = dev_get_priv(clk->dev);
+	unsigned int rate, parent_rate;
+	struct parm *parm;
+	int parent;
+	u32 reg;
+
+	switch (id) {
+	case CLKID_VPU_0_DIV:
+		parm = &meson_vpu_0_div_parm;
+		parent = meson_vpu_0_div_parent;
+		break;
+	case CLKID_VPU_1_DIV:
+		parm = &meson_vpu_1_div_parm;
+		parent = meson_vpu_1_div_parent;
+		break;
+	case CLKID_VAPB_0_DIV:
+		parm = &meson_vapb_0_div_parm;
+		parent = meson_vapb_0_div_parent;
+		break;
+	case CLKID_VAPB_1_DIV:
+		parm = &meson_vapb_1_div_parm;
+		parent = meson_vapb_1_div_parent;
+		break;
+	default:
+		return -ENOENT;
+	}
+
+	reg = readl(priv->addr + parm->reg_off);
+	reg = PARM_GET(parm->width, parm->shift, reg);
+
+	debug("%s: div of %ld is %d\n", __func__, id, reg + 1);
+
+	parent_rate = meson_clk_get_rate_by_id(clk, parent);
+	if (IS_ERR_VALUE(parent_rate))
+		return parent_rate;
+
+	debug("%s: parent rate of %ld is %d\n", __func__, id, parent_rate);
+
+	rate = parent_rate / (reg + 1);
+
+	debug("%s: rate of %ld is %d\n", __func__, id, rate);
+
+	return rate;
+}
+
+static ulong meson_div_set_rate(struct clk *clk, unsigned long id, ulong rate,
+				ulong current_rate)
+{
+	struct meson_clk *priv = dev_get_priv(clk->dev);
+	unsigned int new_div = -EINVAL;
+	unsigned long parent_rate;
+	struct parm *parm;
+	int parent;
+	u32 reg;
+	int ret;
+
+	if (current_rate == rate)
+		return 0;
+
+	debug("%s: setting rate of %ld from %ld to %ld\n",
+	      __func__, id, current_rate, rate);
+
+	switch (id) {
+	case CLKID_VPU_0_DIV:
+		parm = &meson_vpu_0_div_parm;
+		parent = meson_vpu_0_div_parent;
+		break;
+	case CLKID_VPU_1_DIV:
+		parm = &meson_vpu_1_div_parm;
+		parent = meson_vpu_1_div_parent;
+		break;
+	case CLKID_VAPB_0_DIV:
+		parm = &meson_vapb_0_div_parm;
+		parent = meson_vapb_0_div_parent;
+		break;
+	case CLKID_VAPB_1_DIV:
+		parm = &meson_vapb_1_div_parm;
+		parent = meson_vapb_1_div_parent;
+		break;
+	default:
+		return -ENOENT;
+	}
+
+	parent_rate = meson_clk_get_rate_by_id(clk, parent);
+	if (IS_ERR_VALUE(parent_rate))
+		return parent_rate;
+
+	debug("%s: parent rate of %ld is %ld\n", __func__, id, parent_rate);
+
+	/* If can't divide, set parent instead */
+	if (!parent_rate || rate > parent_rate)
+		return meson_clk_set_rate_by_id(clk, parent, rate,
+						current_rate);
+
+	new_div = DIV_ROUND_CLOSEST(parent_rate, rate);
+
+	debug("%s: new div of %ld is %d\n", __func__, id, new_div);
+
+	/* If overflow, try to set parent rate and retry */
+	if (!new_div || new_div > (1 << parm->width)) {
+		ret = meson_clk_set_rate_by_id(clk, parent, rate, current_rate);
+		if (IS_ERR_VALUE(ret))
+			return ret;
+
+		parent_rate = meson_clk_get_rate_by_id(clk, parent);
+		if (IS_ERR_VALUE(parent_rate))
+			return parent_rate;
+
+		new_div = DIV_ROUND_CLOSEST(parent_rate, rate);
+
+		debug("%s: new new div of %ld is %d\n", __func__, id, new_div);
+
+		if (!new_div || new_div > (1 << parm->width))
+			return -EINVAL;
+	}
+
+	debug("%s: setting div of %ld to %d\n", __func__, id, new_div);
+
+	reg = readl(priv->addr + parm->reg_off);
+	writel(PARM_SET(parm->width, parm->shift, reg, new_div - 1),
+	       priv->addr + parm->reg_off);
+
+	debug("%s: new rate of %ld is %ld\n",
+	      __func__, id, meson_div_get_rate(clk, id));
+
+	return 0;
+}
+
+static struct parm meson_vpu_mux_parm = {
+	HHI_VPU_CLK_CNTL, 31, 1,
+};
+
+int meson_vpu_mux_parents[] = {
+	CLKID_VPU_0,
+	CLKID_VPU_1,
+};
+
+static struct parm meson_vpu_0_mux_parm = {
+	HHI_VPU_CLK_CNTL, 9, 2,
+};
+
+static struct parm meson_vpu_1_mux_parm = {
+	HHI_VPU_CLK_CNTL, 25, 2,
+};
+
+static int meson_vpu_0_1_mux_parents[] = {
+	CLKID_FCLK_DIV4,
+	CLKID_FCLK_DIV3,
+	CLKID_FCLK_DIV5,
+	CLKID_FCLK_DIV7,
+};
+
+static struct parm meson_vapb_sel_mux_parm = {
+	HHI_VAPBCLK_CNTL, 31, 1,
+};
+
+int meson_vapb_sel_mux_parents[] = {
+	CLKID_VAPB_0,
+	CLKID_VAPB_1,
+};
+
+static struct parm meson_vapb_0_mux_parm = {
+	HHI_VAPBCLK_CNTL, 9, 2,
+};
+
+static struct parm meson_vapb_1_mux_parm = {
+	HHI_VAPBCLK_CNTL, 25, 2,
+};
+
+static int meson_vapb_0_1_mux_parents[] = {
+	CLKID_FCLK_DIV4,
+	CLKID_FCLK_DIV3,
+	CLKID_FCLK_DIV5,
+	CLKID_FCLK_DIV7,
+};
+
+static ulong meson_mux_get_parent(struct clk *clk, unsigned long id)
+{
+	struct meson_clk *priv = dev_get_priv(clk->dev);
+	struct parm *parm;
+	int *parents;
+	u32 reg;
+
+	switch (id) {
+	case CLKID_VPU:
+		parm = &meson_vpu_mux_parm;
+		parents = meson_vpu_mux_parents;
+		break;
+	case CLKID_VPU_0_SEL:
+		parm = &meson_vpu_0_mux_parm;
+		parents = meson_vpu_0_1_mux_parents;
+		break;
+	case CLKID_VPU_1_SEL:
+		parm = &meson_vpu_1_mux_parm;
+		parents = meson_vpu_0_1_mux_parents;
+		break;
+	case CLKID_VAPB_SEL:
+		parm = &meson_vapb_sel_mux_parm;
+		parents = meson_vapb_sel_mux_parents;
+		break;
+	case CLKID_VAPB_0_SEL:
+		parm = &meson_vapb_0_mux_parm;
+		parents = meson_vapb_0_1_mux_parents;
+		break;
+	case CLKID_VAPB_1_SEL:
+		parm = &meson_vapb_1_mux_parm;
+		parents = meson_vapb_0_1_mux_parents;
+		break;
+	default:
+		return -ENOENT;
+	}
+
+	reg = readl(priv->addr + parm->reg_off);
+	reg = PARM_GET(parm->width, parm->shift, reg);
+
+	debug("%s: parent of %ld is %d (%d)\n",
+	      __func__, id, parents[reg], reg);
+
+	return parents[reg];
+}
+
+static ulong meson_mux_set_parent(struct clk *clk, unsigned long id,
+				  unsigned long parent_id)
+{
+	unsigned long cur_parent = meson_mux_get_parent(clk, id);
+	struct meson_clk *priv = dev_get_priv(clk->dev);
+	unsigned int new_index = -EINVAL;
+	struct parm *parm;
+	int *parents;
+	u32 reg;
+	int i;
+
+	if (IS_ERR_VALUE(cur_parent))
+		return cur_parent;
+
+	debug("%s: setting parent of %ld from %ld to %ld\n",
+	      __func__, id, cur_parent, parent_id);
+
+	if (cur_parent == parent_id)
+		return 0;
+
+	switch (id) {
+	case CLKID_VPU:
+		parm = &meson_vpu_mux_parm;
+		parents = meson_vpu_mux_parents;
+		break;
+	case CLKID_VPU_0_SEL:
+		parm = &meson_vpu_0_mux_parm;
+		parents = meson_vpu_0_1_mux_parents;
+		break;
+	case CLKID_VPU_1_SEL:
+		parm = &meson_vpu_1_mux_parm;
+		parents = meson_vpu_0_1_mux_parents;
+		break;
+	case CLKID_VAPB_SEL:
+		parm = &meson_vapb_sel_mux_parm;
+		parents = meson_vapb_sel_mux_parents;
+		break;
+	case CLKID_VAPB_0_SEL:
+		parm = &meson_vapb_0_mux_parm;
+		parents = meson_vapb_0_1_mux_parents;
+		break;
+	case CLKID_VAPB_1_SEL:
+		parm = &meson_vapb_1_mux_parm;
+		parents = meson_vapb_0_1_mux_parents;
+		break;
+	default:
+		/* Not a mux */
+		return -ENOENT;
+	}
+
+	for (i = 0 ; i < (1 << parm->width) ; ++i) {
+		if (parents[i] == parent_id)
+			new_index = i;
+	}
+
+	if (IS_ERR_VALUE(new_index))
+		return new_index;
+
+	debug("%s: new index of %ld is %d\n", __func__, id, new_index);
+
+	reg = readl(priv->addr + parm->reg_off);
+	writel(PARM_SET(parm->width, parm->shift, reg, new_index),
+	       priv->addr + parm->reg_off);
+
+	debug("%s: new parent of %ld is %ld\n",
+	      __func__, id, meson_mux_get_parent(clk, id));
+
+	return 0;
+}
+
+static ulong meson_mux_get_rate(struct clk *clk, unsigned long id)
+{
+	int parent = meson_mux_get_parent(clk, id);
+
+	if (IS_ERR_VALUE(parent))
+		return parent;
+
+	return meson_clk_get_rate_by_id(clk, parent);
 }
 
 static unsigned long meson_clk81_get_rate(struct clk *clk)
@@ -342,6 +752,35 @@ static ulong meson_clk_get_rate_by_id(struct clk *clk, unsigned long id)
 	case CLKID_CLK81:
 		rate = meson_clk81_get_rate(clk);
 		break;
+	case CLKID_VPU_0:
+		rate = meson_div_get_rate(clk, CLKID_VPU_0_DIV);
+		break;
+	case CLKID_VPU_1:
+		rate = meson_div_get_rate(clk, CLKID_VPU_1_DIV);
+		break;
+	case CLKID_VAPB:
+		rate = meson_mux_get_rate(clk, CLKID_VAPB_SEL);
+		break;
+	case CLKID_VAPB_0:
+		rate = meson_div_get_rate(clk, CLKID_VAPB_0_DIV);
+		break;
+	case CLKID_VAPB_1:
+		rate = meson_div_get_rate(clk, CLKID_VAPB_1_DIV);
+		break;
+	case CLKID_VPU_0_DIV:
+	case CLKID_VPU_1_DIV:
+	case CLKID_VAPB_0_DIV:
+	case CLKID_VAPB_1_DIV:
+		rate = meson_div_get_rate(clk, id);
+		break;
+	case CLKID_VPU:
+	case CLKID_VPU_0_SEL:
+	case CLKID_VPU_1_SEL:
+	case CLKID_VAPB_SEL:
+	case CLKID_VAPB_0_SEL:
+	case CLKID_VAPB_1_SEL:
+		rate = meson_mux_get_rate(clk, id);
+		break;
 	default:
 		if (gates[id].reg != 0) {
 			/* a clock gate */
@@ -360,6 +799,88 @@ static ulong meson_clk_get_rate(struct clk *clk)
 	return meson_clk_get_rate_by_id(clk, clk->id);
 }
 
+static int meson_clk_set_parent(struct clk *clk, struct clk *parent)
+{
+	return meson_mux_set_parent(clk, clk->id, parent->id);
+}
+
+static ulong meson_clk_set_rate_by_id(struct clk *clk, unsigned long id,
+				      ulong rate, ulong current_rate)
+{
+	if (current_rate == rate)
+		return 0;
+
+	switch (id) {
+	/* Fixed clocks */
+	case CLKID_FIXED_PLL:
+	case CLKID_SYS_PLL:
+	case CLKID_FCLK_DIV2:
+	case CLKID_FCLK_DIV3:
+	case CLKID_FCLK_DIV4:
+	case CLKID_FCLK_DIV5:
+	case CLKID_FCLK_DIV7:
+	case CLKID_MPLL0:
+	case CLKID_MPLL1:
+	case CLKID_MPLL2:
+	case CLKID_CLK81:
+		if (current_rate != rate)
+			return -EINVAL;
+
+		return 0;
+	case CLKID_VPU:
+		return meson_clk_set_rate_by_id(clk,
+				meson_mux_get_parent(clk, CLKID_VPU), rate,
+						     current_rate);
+	case CLKID_VAPB:
+	case CLKID_VAPB_SEL:
+		return meson_clk_set_rate_by_id(clk,
+				meson_mux_get_parent(clk, CLKID_VAPB_SEL),
+				rate, current_rate);
+	case CLKID_VPU_0:
+		return meson_div_set_rate(clk, CLKID_VPU_0_DIV, rate,
+					  current_rate);
+	case CLKID_VPU_1:
+		return meson_div_set_rate(clk, CLKID_VPU_1_DIV, rate,
+					  current_rate);
+	case CLKID_VAPB_0:
+		return meson_div_set_rate(clk, CLKID_VAPB_0_DIV, rate,
+					  current_rate);
+	case CLKID_VAPB_1:
+		return meson_div_set_rate(clk, CLKID_VAPB_1_DIV, rate,
+					  current_rate);
+	case CLKID_VPU_0_DIV:
+	case CLKID_VPU_1_DIV:
+	case CLKID_VAPB_0_DIV:
+	case CLKID_VAPB_1_DIV:
+		return meson_div_set_rate(clk, id, rate, current_rate);
+	default:
+		return -ENOENT;
+	}
+
+	return -EINVAL;
+}
+
+static ulong meson_clk_set_rate(struct clk *clk, ulong rate)
+{
+	ulong current_rate = meson_clk_get_rate_by_id(clk, clk->id);
+	int ret;
+
+	if (IS_ERR_VALUE(current_rate))
+		return current_rate;
+
+	debug("%s: setting rate of %ld from %ld to %ld\n",
+	      __func__, clk->id, current_rate, rate);
+
+	ret = meson_clk_set_rate_by_id(clk, clk->id, rate, current_rate);
+	if (IS_ERR_VALUE(ret))
+		return ret;
+
+	printf("clock %lu has new rate %lu\n", clk->id,
+	       meson_clk_get_rate_by_id(clk, clk->id));
+
+	return 0;
+}
+
 static int meson_clk_probe(struct udevice *dev)
 {
 	struct meson_clk *priv = dev_get_priv(dev);
@@ -375,6 +896,8 @@ static struct clk_ops meson_clk_ops = {
 	.disable	= meson_clk_disable,
 	.enable		= meson_clk_enable,
 	.get_rate	= meson_clk_get_rate,
+	.set_parent	= meson_clk_set_parent,
+	.set_rate	= meson_clk_set_rate,
 };
 
 static const struct udevice_id meson_clk_ids[] = {
-- 
2.7.4
