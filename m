From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Mon,  1 Jan 2018 22:35:55 +0100
Subject: [RFC HACK 2/2] clk: meson: meson8b: add the video clock trees - WiP
In-Reply-To: <20180101213555.5519-1-martin.blumenstingl@googlemail.com>
References: <20180101213555.5519-1-martin.blumenstingl@googlemail.com>
Message-ID: <20180101213555.5519-3-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

vdac0 shows 27MHz on Meson8m2
1080P HDMI mode shows weird results (not verified yet)

differences to the video clocks in the GX SoCs:
- HHI_VID_DIVIDER_CNTL is unique to Meson8/Meson8b/Meson8m2. the GX SoCs
  use some other logic and the HHI_VID_PLL_CLK_DIV register instead
- the final ENCT/ENCP/ENCI/ENCL/VDAC0/HDMI_TX_PIXEL clocks can not use
  both, vclk and vclk2 as input (ENCT, ENCP and ENCI are defined in
  HHI_VID_CLK_DIV so they use the vclk dividers, while ENCL, VDAC0 and
  HDMI_TX_PIXEL are defined in HHI_VIID_CLK_DIV and HHI_HDMI_CLK_CNTL so
  they use the vclk2 dividers)

WiP

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.c              | 637 +++++++++++++++++++++++++++++++
 drivers/clk/meson/meson8b.h              |   7 +-
 include/dt-bindings/clock/meson8b-clkc.h |  42 ++
 3 files changed, 685 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 365092a30b37..6642412808c8 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -515,6 +515,567 @@ struct clk_gate meson8b_nand_clk_gate = {
 	},
 };
 
+struct clk_divider meson8b_vid_pll_pre_div = {
+	.reg = (void *)HHI_VID_DIVIDER_CNTL,
+	.shift = 4,
+	.width = 3,
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "vid_pll_pre_div",
+		.ops = &clk_divider_ops,
+		.parent_names = (const char *[]){ "vid_pll" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+struct clk_divider meson8b_vid_pll_post_div = {
+	.reg = (void *)HHI_VID_DIVIDER_CNTL,
+	.shift = 12,
+	.width = 3,
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "vid_pll_post_div",
+		.ops = &clk_divider_ops,
+		.parent_names = (const char *[]){ "vid_pll_pre_div" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+struct clk_mux meson8b_vid_pll_post_sel = {
+	.reg = (void *)HHI_VID_DIVIDER_CNTL,
+	.mask = 0x3,
+	.shift = 8,
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "vid_pll_post_sel",
+		.ops = &clk_mux_ops,
+		.parent_names = (const char *[]){ "vid_pll_pre_div",
+			"vid_pll_post_div" },
+		.num_parents = 2,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+struct clk_gate meson8b_vid_pll_post_en = {
+	.reg = (void *)HHI_VID_DIVIDER_CNTL,
+	.bit_idx = 16,
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "vid_pll_post_en",
+		.ops = &clk_mux_ops,
+		.parent_names = (const char *[]){ "vid_pll_post_sel", },
+		.num_parents = 1,
+		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),
+	},
+};
+
+static const char * const meson8b_vclk_mux_parents[] = {
+	"vid_pll_post_en", "fclk_div4", "fclk_div3", "fclk_div5",
+	"vid_pll_post_en", "fclk_div7", "mpll1"
+};
+
+struct clk_mux meson8b_vclk_sel = {
+	.reg = (void *)HHI_VID_CLK_CNTL,
+	.mask = 0x7,
+	.shift = 16,
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "vclk_sel",
+		.ops = &clk_mux_ops,
+		.parent_names = meson8b_vclk_mux_parents,
+		.num_parents = ARRAY_SIZE(meson8b_vclk_mux_parents),
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+struct clk_gate meson8b_vclk_en0_gate = {
+	.reg = (void *)HHI_VID_CLK_CNTL,
+	.bit_idx = 19,
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "vclk_en0",
+		.ops = &clk_mux_ops,
+		.parent_names = (const char *[]){ "vclk_sel" },
+		.num_parents = 1,
+		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),
+	},
+};
+
+struct clk_divider meson8b_vclk_xd0_div = {
+	.reg = (void *)HHI_VID_CLK_DIV,
+	.shift = 0,
+	.width = 8,
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "vclk_xd0",
+		.ops = &clk_divider_ops,
+		.parent_names = (const char *[]){ "vclk_en0" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+struct clk_gate meson8b_vclk_clk_div_gate = {
+	.reg = (void *)HHI_VID_CLK_DIV,
+	.bit_idx = 16,
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "vclk_clk_div_en",
+		.ops = &clk_gate_ops,
+		.parent_names = (const char *[]){ "vclk_xd0" },
+		.num_parents = 1,
+		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),
+	},
+};
+
+struct clk_gate meson8b_vclk_div1_gate = {
+	.reg = (void *)HHI_VID_CLK_DIV,
+	.bit_idx = 0,
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "vclk_div1_en",
+		.ops = &clk_gate_ops,
+		.parent_names = (const char *[]){ "vclk_clk_div_en" },
+		.num_parents = 1,
+		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),
+	},
+};
+
+static struct clk_fixed_factor meson8b_vclk_div2 = {
+	.mult = 1,
+	.div = 2,
+	.hw.init = &(struct clk_init_data){
+		.name = "vclk_div2",
+		.ops = &clk_fixed_factor_ops,
+		.parent_names = (const char *[]){ "vclk_clk_div_en" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	}
+};
+
+struct clk_gate meson8b_vclk_div2_gate = {
+	.reg = (void *)HHI_VID_CLK_DIV,
+	.bit_idx = 1,
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "vclk_div2_en",
+		.ops = &clk_gate_ops,
+		.parent_names = (const char *[]){ "vclk_div2" },
+		.num_parents = 1,
+		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),
+	},
+};
+
+static struct clk_fixed_factor meson8b_vclk_div4 = {
+	.mult = 1,
+	.div = 4,
+	.hw.init = &(struct clk_init_data){
+		.name = "vclk_div4",
+		.ops = &clk_fixed_factor_ops,
+		.parent_names = (const char *[]){ "vclk_clk_div_en" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	}
+};
+
+struct clk_gate meson8b_vclk_div4_gate = {
+	.reg = (void *)HHI_VID_CLK_DIV,
+	.bit_idx = 2,
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "vclk_div4_en",
+		.ops = &clk_gate_ops,
+		.parent_names = (const char *[]){ "vclk_div4" },
+		.num_parents = 1,
+		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),
+	},
+};
+
+static struct clk_fixed_factor meson8b_vclk_div6 = {
+	.mult = 1,
+	.div = 6,
+	.hw.init = &(struct clk_init_data){
+		.name = "vclk_div6",
+		.ops = &clk_fixed_factor_ops,
+		.parent_names = (const char *[]){ "vclk_clk_div_en" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	}
+};
+
+struct clk_gate meson8b_vclk_div6_gate = {
+	.reg = (void *)HHI_VID_CLK_DIV,
+	.bit_idx = 3,
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "vclk_div6_en",
+		.ops = &clk_gate_ops,
+		.parent_names = (const char *[]){ "vclk_div6" },
+		.num_parents = 1,
+		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),
+	},
+};
+
+static struct clk_fixed_factor meson8b_vclk_div12 = {
+	.mult = 1,
+	.div = 12,
+	.hw.init = &(struct clk_init_data){
+		.name = "vclk_div12",
+		.ops = &clk_fixed_factor_ops,
+		.parent_names = (const char *[]){ "vclk_clk_div_en" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	}
+};
+
+struct clk_gate meson8b_vclk_div12_gate = {
+	.reg = (void *)HHI_VID_CLK_DIV,
+	.bit_idx = 4,
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "vclk_div12_en",
+		.ops = &clk_gate_ops,
+		.parent_names = (const char *[]){ "vclk_div12" },
+		.num_parents = 1,
+		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),
+	},
+};
+
+struct clk_mux meson8b_vclk2_sel = {
+	.reg = (void *)HHI_VID_CLK_CNTL,
+	.mask = 0x7,
+	.shift = 16,
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "vclk2_sel",
+		.ops = &clk_mux_ops,
+		.parent_names = meson8b_vclk_mux_parents,
+		.num_parents = ARRAY_SIZE(meson8b_vclk_mux_parents),
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+struct clk_gate meson8b_vclk2_en0_gate = {
+	.reg = (void *)HHI_VID_CLK_CNTL,
+	.bit_idx = 19,
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "vclk2_en0",
+		.ops = &clk_mux_ops,
+		.parent_names = (const char *[]){ "vclk2_sel" },
+		.num_parents = 1,
+		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),
+	},
+};
+
+struct clk_divider meson8b_vclk2_xd0_div = {
+	.reg = (void *)HHI_VIID_CLK_DIV,
+	.shift = 0,
+	.width = 8,
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "vclk2_xd0",
+		.ops = &clk_divider_ops,
+		.parent_names = (const char *[]){ "vclk2_en0" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+struct clk_gate meson8b_vclk2_clk_div_gate = {
+	.reg = (void *)HHI_VIID_CLK_DIV,
+	.bit_idx = 16,
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "vclk2_clk_div_en",
+		.ops = &clk_gate_ops,
+		.parent_names = (const char *[]){ "vclk2_xd0" },
+		.num_parents = 1,
+		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),
+	},
+};
+
+struct clk_gate meson8b_vclk2_div1_gate = {
+	.reg = (void *)HHI_VIID_CLK_DIV,
+	.bit_idx = 0,
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "vclk2_div1_en",
+		.ops = &clk_gate_ops,
+		.parent_names = (const char *[]){ "vclk2_clk_div_en" },
+		.num_parents = 1,
+		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),
+	},
+};
+
+static struct clk_fixed_factor meson8b_vclk2_div2 = {
+	.mult = 1,
+	.div = 2,
+	.hw.init = &(struct clk_init_data){
+		.name = "vclk2_div2",
+		.ops = &clk_fixed_factor_ops,
+		.parent_names = (const char *[]){ "vclk2_clk_div_en" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	}
+};
+
+struct clk_gate meson8b_vclk2_div2_gate = {
+	.reg = (void *)HHI_VIID_CLK_DIV,
+	.bit_idx = 1,
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "vclk2_div2_en",
+		.ops = &clk_gate_ops,
+		.parent_names = (const char *[]){ "vclk2_div2" },
+		.num_parents = 1,
+		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),
+	},
+};
+
+static struct clk_fixed_factor meson8b_vclk2_div4 = {
+	.mult = 1,
+	.div = 4,
+	.hw.init = &(struct clk_init_data){
+		.name = "vclk2_div4",
+		.ops = &clk_fixed_factor_ops,
+		.parent_names = (const char *[]){ "vclk2_clk_div_en" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	}
+};
+
+struct clk_gate meson8b_vclk2_div4_gate = {
+	.reg = (void *)HHI_VIID_CLK_DIV,
+	.bit_idx = 2,
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "vclk2_div4_en",
+		.ops = &clk_gate_ops,
+		.parent_names = (const char *[]){ "vclk2_div4" },
+		.num_parents = 1,
+		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),
+	},
+};
+
+static struct clk_fixed_factor meson8b_vclk2_div6 = {
+	.mult = 1,
+	.div = 6,
+	.hw.init = &(struct clk_init_data){
+		.name = "vclk2_div6",
+		.ops = &clk_fixed_factor_ops,
+		.parent_names = (const char *[]){ "vclk2_clk_div_en" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	}
+};
+
+struct clk_gate meson8b_vclk2_div6_gate = {
+	.reg = (void *)HHI_VIID_CLK_DIV,
+	.bit_idx = 3,
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "vclk2_div6_en",
+		.ops = &clk_gate_ops,
+		.parent_names = (const char *[]){ "vclk2_div6" },
+		.num_parents = 1,
+		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),
+	},
+};
+
+static struct clk_fixed_factor meson8b_vclk2_div12 = {
+	.mult = 1,
+	.div = 12,
+	.hw.init = &(struct clk_init_data){
+		.name = "vclk2_div12",
+		.ops = &clk_fixed_factor_ops,
+		.parent_names = (const char *[]){ "vclk2_clk_div_en" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	}
+};
+
+struct clk_gate meson8b_vclk2_div12_gate = {
+	.reg = (void *)HHI_VIID_CLK_DIV,
+	.bit_idx = 4,
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "vclk2_div12_en",
+		.ops = &clk_gate_ops,
+		.parent_names = (const char *[]){ "vclk2_div12" },
+		.num_parents = 1,
+		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),
+	},
+};
+
+static const char * const meson8b_vclk_enc_mux_parents[] = {
+	"vclk_div1_en", "vclk_div2_en", "vclk_div4_en", "vclk_div6_en",
+	"vclk_div12_en",
+};
+
+struct clk_mux meson8b_enct_sel = {
+	.reg = (void *)HHI_VID_CLK_DIV,
+	.mask = 0xf,
+	.shift = 20,
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "enct_sel",
+		.ops = &clk_mux_ops,
+		.parent_names = meson8b_vclk_enc_mux_parents,
+		.num_parents = ARRAY_SIZE(meson8b_vclk_enc_mux_parents),
+	},
+};
+
+struct clk_gate meson8b_enct_gate = {
+	.reg = (void *)HHI_VID_CLK_CNTL2,
+	.bit_idx = 1,
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "enct_en",
+		.ops = &clk_gate_ops,
+		.parent_names = (const char *[]){ "enct_sel" },
+		.num_parents = 1,
+		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),
+	},
+};
+
+struct clk_mux meson8b_encp_sel = {
+	.reg = (void *)HHI_VID_CLK_DIV,
+	.mask = 0xf,
+	.shift = 24,
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "encp_sel",
+		.ops = &clk_mux_ops,
+		.parent_names = meson8b_vclk_enc_mux_parents,
+		.num_parents = ARRAY_SIZE(meson8b_vclk_enc_mux_parents),
+	},
+};
+
+struct clk_gate meson8b_encp_gate = {
+	.reg = (void *)HHI_VID_CLK_CNTL2,
+	.bit_idx = 2,
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "encp_en",
+		.ops = &clk_gate_ops,
+		.parent_names = (const char *[]){ "encp_sel" },
+		.num_parents = 1,
+		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),
+	},
+};
+
+struct clk_mux meson8b_enci_sel = {
+	.reg = (void *)HHI_VID_CLK_DIV,
+	.mask = 0xf,
+	.shift = 28,
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "enci_sel",
+		.ops = &clk_mux_ops,
+		.parent_names = meson8b_vclk_enc_mux_parents,
+		.num_parents = ARRAY_SIZE(meson8b_vclk_enc_mux_parents),
+	},
+};
+
+struct clk_gate meson8b_enci_gate = {
+	.reg = (void *)HHI_VID_CLK_CNTL2,
+	.bit_idx = 0,
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "enci_en",
+		.ops = &clk_gate_ops,
+		.parent_names = (const char *[]){ "enci_sel" },
+		.num_parents = 1,
+		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),
+	},
+};
+
+static const char * const meson8b_vclk2_enc_mux_parents[] = {
+	"vclk2_div1_en", "vclk2_div2_en", "vclk2_div4_en", "vclk2_div6_en",
+	"vclk2_div12_en",
+};
+
+struct clk_mux meson8b_encl_sel = {
+	.reg = (void *)HHI_VIID_CLK_DIV,
+	.mask = 0xf,
+	.shift = 12,
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "encl_sel",
+		.ops = &clk_mux_ops,
+		.parent_names = meson8b_vclk2_enc_mux_parents,
+		.num_parents = ARRAY_SIZE(meson8b_vclk2_enc_mux_parents),
+	},
+};
+
+struct clk_gate meson8b_encl_gate = {
+	.reg = (void *)HHI_VID_CLK_CNTL2,
+	.bit_idx = 3,
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "encl_en",
+		.ops = &clk_gate_ops,
+		.parent_names = (const char *[]){ "encl_sel" },
+		.num_parents = 1,
+		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),
+	},
+};
+
+struct clk_mux meson8b_vdac0_sel = {
+	.reg = (void *)HHI_VIID_CLK_DIV,
+	.mask = 0xf,
+	.shift = 28,
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "vdac0_sel",
+		.ops = &clk_mux_ops,
+		.parent_names = meson8b_vclk2_enc_mux_parents,
+		.num_parents = ARRAY_SIZE(meson8b_vclk2_enc_mux_parents),
+	},
+};
+
+struct clk_gate meson8b_vdac0_gate = {
+	.reg = (void *)HHI_VID_CLK_CNTL2,
+	.bit_idx = 4,
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "vdac0_en",
+		.ops = &clk_gate_ops,
+		.parent_names = (const char *[]){ "vdac0_sel" },
+		.num_parents = 1,
+		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),
+	},
+};
+
+struct clk_mux meson8b_hdmi_tx_pixel_sel = {
+	.reg = (void *)HHI_HDMI_CLK_CNTL,
+	.mask = 0xf,
+	.shift = 16,
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "hdmi_tx_pixel_sel",
+		.ops = &clk_mux_ops,
+		.parent_names = meson8b_vclk2_enc_mux_parents,
+		.num_parents = ARRAY_SIZE(meson8b_vclk2_enc_mux_parents),
+	},
+};
+
+struct clk_gate meson8b_hdmi_tx_pixel_gate = {
+	.reg = (void *)HHI_VID_CLK_CNTL2,
+	.bit_idx = 5,
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "hdmi_tx_pixel_en",
+		.ops = &clk_gate_ops,
+		.parent_names = (const char *[]){ "hdmi_tx_pixel_sel" },
+		.num_parents = 1,
+		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),
+	},
+};
+
 /* Everything Else (EE) domain gates */
 
 static MESON_GATE(meson8b_ddr, HHI_GCLK_MPEG0, 0);
@@ -703,6 +1264,48 @@ static struct clk_hw_onecell_data meson8b_hw_onecell_data = {
 		[CLKID_SYS_PLL_DIV3]	    = &meson8b_sys_pll_div3.hw,
 		[CLKID_SYS_PLL_SCALE_DIV]   = &meson8b_sys_pll_scale_div.hw,
 		[CLKID_SYS_PLL_SCALE_SEL]   = &meson8b_sys_pll_scale_out_sel.hw,
+		[CLKID_VID_PLL_PRE_DIV]     = &meson8b_vid_pll_pre_div.hw,
+		[CLKID_VID_PLL_POST_DIV]    = &meson8b_vid_pll_post_div.hw,
+		[CLKID_VID_PLL_POST_SEL]    = &meson8b_vid_pll_post_sel.hw,
+		[CLKID_VID_PLL_POST_EN]     = &meson8b_vid_pll_post_en.hw,
+		[CLKID_VCLK_SEL]            = &meson8b_vclk_sel.hw,
+		[CLKID_VCLK_EN0]            = &meson8b_vclk_en0_gate.hw,
+		[CLKID_VCLK_XD0_DIV]        = &meson8b_vclk_xd0_div.hw,
+		[CLKID_VCLK_CLK_DIV_EN]     = &meson8b_vclk_clk_div_gate.hw,
+		[CLKID_VCLK_DIV1_EN]        = &meson8b_vclk_div1_gate.hw,
+		[CLKID_VCLK_DIV2_EN]        = &meson8b_vclk_div2_gate.hw,
+		[CLKID_VCLK_DIV2]           = &meson8b_vclk_div2.hw,
+		[CLKID_VCLK_DIV4_EN]        = &meson8b_vclk_div4_gate.hw,
+		[CLKID_VCLK_DIV4]           = &meson8b_vclk_div4.hw,
+		[CLKID_VCLK_DIV6_EN]        = &meson8b_vclk_div6_gate.hw,
+		[CLKID_VCLK_DIV6]           = &meson8b_vclk_div6.hw,
+		[CLKID_VCLK_DIV12_EN]       = &meson8b_vclk_div12_gate.hw,
+		[CLKID_VCLK_DIV12]          = &meson8b_vclk_div12.hw,
+		[CLKID_VCLK2_SEL]           = &meson8b_vclk2_sel.hw,
+		[CLKID_VCLK2_EN0]           = &meson8b_vclk2_en0_gate.hw,
+		[CLKID_VCLK2_XD0_DIV]       = &meson8b_vclk2_xd0_div.hw,
+		[CLKID_VCLK2_CLK_DIV_EN]    = &meson8b_vclk2_clk_div_gate.hw,
+		[CLKID_VCLK2_DIV1_EN]       = &meson8b_vclk2_div1_gate.hw,
+		[CLKID_VCLK2_DIV2_EN]       = &meson8b_vclk2_div2_gate.hw,
+		[CLKID_VCLK2_DIV2]          = &meson8b_vclk2_div2.hw,
+		[CLKID_VCLK2_DIV4_EN]       = &meson8b_vclk2_div4_gate.hw,
+		[CLKID_VCLK2_DIV4]          = &meson8b_vclk2_div4.hw,
+		[CLKID_VCLK2_DIV6_EN]       = &meson8b_vclk2_div6_gate.hw,
+		[CLKID_VCLK2_DIV6]          = &meson8b_vclk2_div6.hw,
+		[CLKID_VCLK2_DIV12_EN]      = &meson8b_vclk2_div12_gate.hw,
+		[CLKID_VCLK2_DIV12]         = &meson8b_vclk2_div12.hw,
+		[CLKID_ENCT_SEL]            = &meson8b_enct_sel.hw,
+		[CLKID_ENCT_EN]             = &meson8b_enct_gate.hw,
+		[CLKID_ENCP_SEL]            = &meson8b_encp_sel.hw,
+		[CLKID_ENCP_EN]             = &meson8b_encp_gate.hw,
+		[CLKID_ENCI_SEL]            = &meson8b_enci_sel.hw,
+		[CLKID_ENCI_EN]             = &meson8b_enci_gate.hw,
+		[CLKID_ENCL_SEL]            = &meson8b_encl_sel.hw,
+		[CLKID_ENCL_EN]             = &meson8b_encl_gate.hw,
+		[CLKID_VDAC0_SEL]            = &meson8b_vdac0_sel.hw,
+		[CLKID_VDAC0_EN]             = &meson8b_vdac0_gate.hw,
+		[CLKID_HDMI_TX_PIXEL_SEL]   = &meson8b_hdmi_tx_pixel_sel.hw,
+		[CLKID_HDMI_TX_PIXEL_EN]    = &meson8b_hdmi_tx_pixel_gate.hw,
 		[CLK_NR_CLKS]		    = NULL,
 	},
 	.num = CLK_NR_CLKS,
@@ -800,11 +1403,41 @@ static struct clk_gate *const meson8b_clk_gates[] = {
 	&meson8b_ao_ahb_bus,
 	&meson8b_ao_iface,
 	&meson8b_nand_clk_gate,
+	&meson8b_vid_pll_post_en,
+	&meson8b_vclk_en0_gate,
+	&meson8b_vclk_clk_div_gate,
+	&meson8b_vclk_div1_gate,
+	&meson8b_vclk_div2_gate,
+	&meson8b_vclk_div4_gate,
+	&meson8b_vclk_div6_gate,
+	&meson8b_vclk_div12_gate,
+	&meson8b_vclk2_en0_gate,
+	&meson8b_vclk2_clk_div_gate,
+	&meson8b_vclk2_div1_gate,
+	&meson8b_vclk2_div2_gate,
+	&meson8b_vclk2_div4_gate,
+	&meson8b_vclk2_div6_gate,
+	&meson8b_vclk2_div12_gate,
+	&meson8b_enct_gate,
+	&meson8b_encp_gate,
+	&meson8b_enci_gate,
+	&meson8b_encl_gate,
+	&meson8b_vdac0_gate,
+	&meson8b_hdmi_tx_pixel_gate,
 };
 
 static struct clk_mux *const meson8b_clk_muxes[] = {
 	&meson8b_mpeg_clk_sel,
 	&meson8b_nand_clk_sel,
+	&meson8b_vid_pll_post_sel,
+	&meson8b_vclk_sel,
+	&meson8b_vclk2_sel,
+	&meson8b_enct_sel,
+	&meson8b_encp_sel,
+	&meson8b_enci_sel,
+	&meson8b_encl_sel,
+	&meson8b_vdac0_sel,
+	&meson8b_hdmi_tx_pixel_sel,
 	&meson8b_sys_pll_scale_out_sel,
 	&meson8b_cpu_clk_sel,
 };
@@ -812,6 +1445,10 @@ static struct clk_mux *const meson8b_clk_muxes[] = {
 static struct clk_divider *const meson8b_clk_dividers[] = {
 	&meson8b_mpeg_clk_div,
 	&meson8b_nand_clk_div,
+	&meson8b_vid_pll_pre_div,
+	&meson8b_vid_pll_post_div,
+	&meson8b_vclk_xd0_div,
+	&meson8b_vclk2_xd0_div,
 	&meson8b_sys_pll_scale_div,
 };
 
diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
index 4ac593a174a7..3833890d351c 100644
--- a/drivers/clk/meson/meson8b.h
+++ b/drivers/clk/meson/meson8b.h
@@ -30,16 +30,21 @@
  *
  * [0] http://dn.odroid.com/S805/Datasheet/S805_Datasheet%20V0.8%2020150126.pdf
  */
+#define HHI_VIID_CLK_DIV		0x128 /* 0x4a offset in data sheet */
+#define HHI_VIID_CLK_CNTL		0x12c /* 0x4b offset in data sheet */
 #define HHI_GCLK_MPEG0			0x140 /* 0x50 offset in data sheet */
 #define HHI_GCLK_MPEG1			0x144 /* 0x51 offset in data sheet */
 #define HHI_GCLK_MPEG2			0x148 /* 0x52 offset in data sheet */
 #define HHI_GCLK_OTHER			0x150 /* 0x54 offset in data sheet */
 #define HHI_GCLK_AO			0x154 /* 0x55 offset in data sheet */
 #define HHI_SYS_CPU_CLK_CNTL1		0x15c /* 0x57 offset in data sheet */
+#define HHI_VID_CLK_DIV			0x164 /* 0x59 offset in data sheet */
 #define HHI_MPEG_CLK_CNTL		0x174 /* 0x5d offset in data sheet */
 #define HHI_VID_CLK_CNTL		0x17c /* 0x5f offset in data sheet */
+#define HHI_VID_CLK_CNTL2		0x194 /* 0x65 offset in data sheet */
 #define HHI_VID_DIVIDER_CNTL		0x198 /* 0x66 offset in data sheet */
 #define HHI_SYS_CPU_CLK_CNTL0		0x19c /* 0x67 offset in data sheet */
+#define HHI_HDMI_CLK_CNTL		0x1cc /* 0x73 offset in data sheet */
 #define HHI_NAND_CLK_CNTL		0x25c /* 0x97 offset in data sheet */
 #define HHI_MPLL_CNTL			0x280 /* 0xa0 offset in data sheet */
 #define HHI_SYS_PLL_CNTL		0x300 /* 0xc0 offset in data sheet */
@@ -70,7 +75,7 @@
  * will remain defined here.
  */
 
-#define CLK_NR_CLKS		103
+#define CLK_NR_CLKS		145
 
 /*
  * include the CLKID and RESETID that have
diff --git a/include/dt-bindings/clock/meson8b-clkc.h b/include/dt-bindings/clock/meson8b-clkc.h
index ffbc3dabbd84..fc48315f0822 100644
--- a/include/dt-bindings/clock/meson8b-clkc.h
+++ b/include/dt-bindings/clock/meson8b-clkc.h
@@ -109,5 +109,47 @@
 #define CLKID_SYS_PLL_DIV3	100
 #define CLKID_SYS_PLL_SCALE_DIV	101
 #define CLKID_SYS_PLL_SCALE_SEL	102
+#define CLKID_VID_PLL_PRE_DIV	103
+#define CLKID_VID_PLL_POST_DIV	104
+#define CLKID_VID_PLL_POST_SEL	105
+#define CLKID_VID_PLL_POST_EN	106
+#define CLKID_VCLK_SEL		107
+#define CLKID_VCLK_EN0		108
+#define CLKID_VCLK_XD0_DIV	109
+#define CLKID_VCLK_CLK_DIV_EN	110
+#define CLKID_VCLK_DIV1_EN	111
+#define CLKID_VCLK_DIV2_EN	112
+#define CLKID_VCLK_DIV2		113
+#define CLKID_VCLK_DIV4_EN	114
+#define CLKID_VCLK_DIV4		115
+#define CLKID_VCLK_DIV6_EN	116
+#define CLKID_VCLK_DIV6		117
+#define CLKID_VCLK_DIV12_EN	118
+#define CLKID_VCLK_DIV12	119
+#define CLKID_VCLK2_SEL		120
+#define CLKID_VCLK2_EN0		121
+#define CLKID_VCLK2_XD0_DIV	122
+#define CLKID_VCLK2_CLK_DIV_EN	123
+#define CLKID_VCLK2_DIV1_EN	124
+#define CLKID_VCLK2_DIV2_EN	125
+#define CLKID_VCLK2_DIV2	126
+#define CLKID_VCLK2_DIV4_EN	127
+#define CLKID_VCLK2_DIV4	128
+#define CLKID_VCLK2_DIV6_EN	129
+#define CLKID_VCLK2_DIV6	130
+#define CLKID_VCLK2_DIV12_EN	131
+#define CLKID_VCLK2_DIV12	132
+#define CLKID_ENCT_SEL		133
+#define CLKID_ENCT_EN		134
+#define CLKID_ENCP_SEL		135
+#define CLKID_ENCP_EN		136
+#define CLKID_ENCI_SEL		137
+#define CLKID_ENCI_EN		138
+#define CLKID_ENCL_SEL		139
+#define CLKID_ENCL_EN		140
+#define CLKID_VDAC0_SEL		141
+#define CLKID_VDAC0_EN		142
+#define CLKID_HDMI_TX_PIXEL_SEL	143
+#define CLKID_HDMI_TX_PIXEL_EN	144
 
 #endif /* __MESON8B_CLKC_H */
-- 
2.15.1
