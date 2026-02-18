Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C049E9A03E
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Feb 2026 10:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7VmD6qJbuII1HRHrwhlb6dVKx8IEGAbDlbssFgbPi/k=; b=LlBZVlZtNtaI2K
	sjaxhKIVjelJ/5uHmoeQcoKbraJpgfkPl0FkRFINBzJEranFBWrID6421GpFWg84yn9qpJvt1loHv
	3qKPRQyCRXnn41OOGq/9cRYiedm+yPHjS29i/yx+vVj3gTeQAIdEyzTSgmQwx4Wjh8ctUxn6qDkYl
	R19z7+ek04dr8cmY7oH9MwOfaDr4hyzEqWzuOLECBaaGRHTW1eI4sa0towXOaFs840rqNAQpBty86
	Dsgp25veF+jxY+pkfUZtJgub6Glo/FsV6x0uxO55o1h2Xv8vhE5wEUO7lYvUhh7ULjZDLvMMtW1E4
	NhU+frAC4Ylu/wGOzfaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsefW-00000009dDI-0rkO;
	Wed, 18 Feb 2026 10:20:30 +0000
Received: from [2a01:4f9:c011:1c83::1] (helo=courrier.aliel.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsefR-00000009d6o-3a4J;
	Wed, 18 Feb 2026 10:20:29 +0000
Received: from localhost.localdomain (2a02-842b-8136-0001-b865-661D-5641-e7C6.rev.sfr.net [IPv6:2a02:842b:8136:1:b865:661d:5641:e7c6])
	by courrier.aliel.fr (Postfix) with ESMTPSA id 02E8C4CB4C;
	Wed, 18 Feb 2026 10:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1771410022;
	bh=VXFQL5BZy+HqvbUJeFd3eVHhL1DG76izxX4eyjkPros=;
	h=From:To:Cc:Subject:Date;
	b=pkrwJ5YLJgOna5o8/k1tLJRj8ciyMOcPB6xAB9qH1EF5zTsbGN4+Xu7quwo+VLq7A
	 YX/xDCWVkt7zjRGdKF9vc63p6NEdoeuGFWvX7d9PDwH8BSB8CTI0hRBLleQg2kpbyH
	 tpjtrhpk6DLaX891uKeteR8HB5Fm4zABFjNJ3O9w=
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
To: linux-amlogic@lists.infradead.org
Cc: Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] drivers: clk: meson: Add Amlogic T7 sys pll support
Date: Wed, 18 Feb 2026 11:19:51 +0100
Message-ID: <20260218101954.35573-1-linux-kernel-dev@aliel.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_022027_951031_26593B1E 
X-CRM114-Status: GOOD (  10.33  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add SYS PLL for the clock controller of the Amlogic T7 SoC family.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 drivers/clk/meson/t7-peripherals.c | 134 ++++++++++++++++++++++++++++-
 1 file changed, 131 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/meson/t7-peripherals.c b/drivers/clk/meson/t7-peripherals.c
index 214db7850d86..de206473f3a7 100644
--- a/drivers/clk/meson/t7-peripherals.c
+++ b/drivers/clk/meson/t7-peripherals.c
@@ -176,6 +176,127 @@ static struct clk_regmap t7_rtc = {
 	},
 };
 
+static u32 t7_sys_parents_val_table[] = { 0, 1, 2, 3, 4, 5, 7 };
+static const struct clk_parent_data t7_sys_parents[] = {
+	{ .fw_name = "xtal", },
+	{ .fw_name = "fdiv2", },
+	{ .fw_name = "fdiv3", },
+	{ .fw_name = "fdiv4", },
+	{ .fw_name = "fdiv5", },
+	{ .fw_name = "axi_clk_frcpu", },
+	{ .hw = &t7_rtc.hw },
+};
+
+static struct clk_regmap t7_sys_a_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = SYS_CLK_CTRL0,
+		.mask = 0x7,
+		.shift = 10,
+		.table = t7_sys_parents_val_table,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "sys_a_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_data = t7_sys_parents,
+		.num_parents = ARRAY_SIZE(t7_sys_parents),
+	},
+};
+
+static struct clk_regmap t7_sys_a_div = {
+	.data = &(struct clk_regmap_div_data){
+	.offset = SYS_CLK_CTRL0,
+		.shift = 0,
+		.width = 10,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "sys_a_div",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&t7_sys_a_sel.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap t7_sys_a = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = SYS_CLK_CTRL0,
+		.bit_idx = 13,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "sys_a",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&t7_sys_a_div.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap t7_sys_b_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = SYS_CLK_CTRL0,
+		.mask = 0x7,
+		.shift = 26,
+		.table = t7_sys_parents_val_table,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "sys_b_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_data = t7_sys_parents,
+		.num_parents = ARRAY_SIZE(t7_sys_parents),
+	},
+};
+
+static struct clk_regmap t7_sys_b_div = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = SYS_CLK_CTRL0,
+		.shift = 16,
+		.width = 10,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "sys_b_div",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&t7_sys_b_sel.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap t7_sys_b = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = SYS_CLK_CTRL0,
+		.bit_idx = 29,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "sys_b",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&t7_sys_b_div.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap t7_sys = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = SYS_CLK_CTRL0,
+		.mask = 0x1,
+		.shift = 15,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "sys_clk",
+		.ops = &clk_regmap_mux_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&t7_sys_a.hw,
+			&t7_sys_b.hw,
+		},
+		.num_parents = 2,
+	},
+};
+
 static struct clk_regmap t7_ceca_dualdiv_in = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = CECA_CTRL0,
@@ -824,7 +945,7 @@ static T7_COMP_GATE(sd_emmc_c, NAND_CLK_CTRL, 7, 0);
 
 static const struct clk_parent_data t7_spicc_parents[] = {
 	{ .fw_name = "xtal", },
-	{ .fw_name = "sys", },
+	{ .hw = &t7_sys.hw },
 	{ .fw_name = "fdiv4", },
 	{ .fw_name = "fdiv3", },
 	{ .fw_name = "fdiv2", },
@@ -859,7 +980,7 @@ static T7_COMP_GATE(spicc5, SPICC_CLK_CTRL2, 22, 0);
 
 static const struct clk_parent_data t7_saradc_parents[] = {
 	{ .fw_name = "xtal" },
-	{ .fw_name = "sys" },
+	{ .hw = &t7_sys.hw },
 };
 
 static T7_COMP_SEL(saradc, SAR_CLK_CTRL0, 9, 0x1, t7_saradc_parents);
@@ -929,7 +1050,7 @@ static T7_COMP_SEL(pwm_ao_h, PWM_CLK_AO_GH_CTRL, 25, 0x3, t7_pwm_parents);
 static T7_COMP_DIV(pwm_ao_h, PWM_CLK_AO_GH_CTRL, 16, 8);
 static T7_COMP_GATE(pwm_ao_h, PWM_CLK_AO_GH_CTRL, 24, 0);
 
-static const struct clk_parent_data t7_sys_pclk_parents = { .fw_name = "sys" };
+static const struct clk_parent_data t7_sys_pclk_parents = { .hw = &t7_sys.hw };
 
 #define T7_SYS_PCLK(_name, _reg, _bit, _flags) \
 	MESON_PCLK(t7_##_name, _reg, _bit, &t7_sys_pclk_parents, _flags)
@@ -1161,6 +1282,13 @@ static struct clk_hw *t7_peripherals_hw_clks[] = {
 	[CLKID_PWM_AO_H_SEL]		= &t7_pwm_ao_h_sel.hw,
 	[CLKID_PWM_AO_H_DIV]		= &t7_pwm_ao_h_div.hw,
 	[CLKID_PWM_AO_H]		= &t7_pwm_ao_h.hw,
+	[CLKID_SYS_A_SEL]		= &t7_sys_a_sel.hw,
+	[CLKID_SYS_A_DIV]		= &t7_sys_a_div.hw,
+	[CLKID_SYS_A]			= &t7_sys_a.hw,
+	[CLKID_SYS_B_SEL]		= &t7_sys_b_sel.hw,
+	[CLKID_SYS_B_DIV]		= &t7_sys_b_div.hw,
+	[CLKID_SYS_B]			= &t7_sys_b.hw,
+	[CLKID_SYS]				= &t7_sys.hw,
 	[CLKID_SYS_DDR]			= &t7_sys_ddr.hw,
 	[CLKID_SYS_DOS]			= &t7_sys_dos.hw,
 	[CLKID_SYS_MIPI_DSI_A]		= &t7_sys_mipi_dsi_a.hw,
-- 
2.49.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
