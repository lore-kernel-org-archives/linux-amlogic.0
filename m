Return-Path: <SRS0=Nbbq=RK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35004C43381
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Mar 2019 14:15:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 056CF20835
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Mar 2019 14:15:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AUtB+kG9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ZUspskAc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 056CF20835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3QwVE/YKyqfG1edG+TfgHCAepwjMlFhGaqfw+WwOhAM=; b=AUtB+kG9aKiT7C
	/psM8VpVgblBzPubO+xbjEn+uSZiGIR0XDPXMksGL46Dd+V0f1PvxQBeu5+6jRYrOohEgSwJ6XlWF
	eyhtrVHiKmyXx4VDI2FYPAMV0XzqRP86BsS1RkwTJv2r9h6hlFYrQBpE9NUeFO0Lp5Gjm2qH8OwcO
	znMh7aV4Fc3Ke0SfLUFnHSiDGZAl1Eu1GpQ0BUkvHPHOdShgOcqT5die2CIAHTwEJx8BAzjcmr+zT
	GLwonk0lhTPyFIieUL2BFWTcnSRa4qiKyqQ4Mi1ArBvp5S6FOC47Na7b4gzV7LOq1oGhb2cZ8sHmR
	HuQdBVz7qQDPNWhin5Gw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1toF-000320-8u; Thu, 07 Mar 2019 14:15:43 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1tna-000117-4e
 for linux-amlogic@lists.infradead.org; Thu, 07 Mar 2019 14:15:10 +0000
Received: by mail-wm1-x343.google.com with SMTP id x7so9436849wmj.0
 for <linux-amlogic@lists.infradead.org>; Thu, 07 Mar 2019 06:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h5CtO0ucQaulmciUoQ1fe7VqyscuYbd4ACXEONNNHhk=;
 b=ZUspskAcoOBQ9Zw+aOrkAlKFkDg3Ol2NeiZeR/1Ts9nXbRT1nanWnblrfX3dxDtcnJ
 ZU94YcCc3LFQaOjiUgBBJ6s9rOiir13pQGpTeFp/hjFmDBZ4lFUOjx99Zd6p65JbMqSH
 sEo5p6uryHipH3S1c/T7lxhlEjsyKJ5zGjuDNyOz7pjP8xivbVdcx2HFe4aE9uorYL8Z
 enA7HuqLYRqn5DHivGj8IuY2SNB1cY6teTtjbANhRB0WbEy4keJqOXVpg2jiHw/Y1rUg
 5LAnRBl3UU6iEnKNPu85lgyxDjDaT1rlys0+HFVtsFz2h/cVrvb2nZ00Zirea94YKcez
 TmMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h5CtO0ucQaulmciUoQ1fe7VqyscuYbd4ACXEONNNHhk=;
 b=eCN3a6LuOt5U3Q4O90SjoJEJwIfZ7qvRGhze2XTLRL9Wenyunhi45AuXS7eSAjk/ss
 4+plOPWhrPHq6gTcp2P9FB/tk45hUcw/TBmDjNgrmpqjcGtw4Rl4YHNLzqwzoRXxV7SL
 9FZPqze01caXQT2oWN6alJdf8xP3p9zWS+4lICPuVctEwkcrKF1RgkMpFDETPZvpNk0f
 g7MX4UWPNuPj9YQl5KGqjvleLgft1Xpzh1DEovbk/PuMH6keTGeIsXjbdZOTev9F1rnN
 B9vldV9U7W+bw3Xw2eIRkOnTPYGzqwNJvJ2PWnhxRFmXkH6+AmtKX4qo5sXOC8eb9DbS
 gccw==
X-Gm-Message-State: APjAAAUEiMhwoIaZVhshCu1QcINMnnTW6s0xdgSjqyZjhCc2Wl6Eo+O5
 8LgPfwUwvqgh4r7q7zWzb2NAzw==
X-Google-Smtp-Source: APXvYqx47eIbcTjMk6Nn35k9CidruU+6YKtfm6BsPjVMrD06M9mHbte9SBUh+BRyTVETzrfS4KZpPg==
X-Received: by 2002:a1c:39d5:: with SMTP id g204mr6128818wma.17.1551968100586; 
 Thu, 07 Mar 2019 06:15:00 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id h9sm9679304wrv.11.2019.03.07.06.14.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 07 Mar 2019 06:15:00 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com
Subject: [PATCH 3/3] clk: meson-g12a: add PCIE PLL clocks
Date: Thu,  7 Mar 2019 15:14:55 +0100
Message-Id: <20190307141455.23879-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190307141455.23879-1-narmstrong@baylibre.com>
References: <20190307141455.23879-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190307_061502_422991_866AAB98 
X-CRM114-Status: GOOD (  13.76  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the PCIe reference clock feeding the USB3 + PCIE combo PHY.

This PLL needs a very precise register sequence to permit to be locked,
thus using the specific clk-pll pcie ops.

The PLL is then followed by :
- a fixed /2 divider
- a 5-bit 1-based divider
- a final /2 divider

This reference clock is fixed to 100MHz, thus only a single PLL setup
is added.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/g12a.c | 118 +++++++++++++++++++++++++++++++++++++++
 drivers/clk/meson/g12a.h |   5 +-
 2 files changed, 122 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 80a7172df2a6..d382c21a29e5 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -614,6 +614,118 @@ static struct clk_regmap g12a_hifi_pll = {
 	},
 };
 
+/*
+ * The Meson G12A PCIE PLL is fined tuned to deliver a very precise
+ * 100MHz reference clock for the PCIe Analog PHY, and thus requires
+ * a strict register sequence to enable the PLL.
+ */
+static const struct reg_sequence g12a_pcie_pll_init_regs[] = {
+	{ .reg = HHI_PCIE_PLL_CNTL0,	.def = 0x20090496 },
+	{ .reg = HHI_PCIE_PLL_CNTL0,	.def = 0x30090496 },
+	{ .reg = HHI_PCIE_PLL_CNTL1,	.def = 0x00000000 },
+	{ .reg = HHI_PCIE_PLL_CNTL2,	.def = 0x00001100 },
+	{ .reg = HHI_PCIE_PLL_CNTL3,	.def = 0x10058e00 },
+	{ .reg = HHI_PCIE_PLL_CNTL4,	.def = 0x000100c0 },
+	{ .reg = HHI_PCIE_PLL_CNTL5,	.def = 0x68000048 },
+	{ .reg = HHI_PCIE_PLL_CNTL5,	.def = 0x68000068, .delay_us = 20 },
+	{ .reg = HHI_PCIE_PLL_CNTL4,	.def = 0x008100c0, .delay_us = 10 },
+	{ .reg = HHI_PCIE_PLL_CNTL0,	.def = 0x34090496 },
+	{ .reg = HHI_PCIE_PLL_CNTL0,	.def = 0x14090496, .delay_us = 10 },
+	{ .reg = HHI_PCIE_PLL_CNTL2,	.def = 0x00001000 },
+};
+
+/* Keep a single entry table for recalc/round_rate() ops */
+static const struct pll_params_table g12a_pcie_pll_table[] = {
+	PLL_PARAMS(150, 1),
+	{0, 0},
+};
+
+static struct clk_regmap g12a_pcie_pll_dco = {
+	.data = &(struct meson_clk_pll_data){
+		.en = {
+			.reg_off = HHI_PCIE_PLL_CNTL0,
+			.shift   = 28,
+			.width   = 1,
+		},
+		.m = {
+			.reg_off = HHI_PCIE_PLL_CNTL0,
+			.shift   = 0,
+			.width   = 8,
+		},
+		.n = {
+			.reg_off = HHI_PCIE_PLL_CNTL0,
+			.shift   = 10,
+			.width   = 5,
+		},
+		.frac = {
+			.reg_off = HHI_PCIE_PLL_CNTL1,
+			.shift   = 0,
+			.width   = 12,
+		},
+		.l = {
+			.reg_off = HHI_PCIE_PLL_CNTL0,
+			.shift   = 31,
+			.width   = 1,
+		},
+		.rst = {
+			.reg_off = HHI_PCIE_PLL_CNTL0,
+			.shift   = 29,
+			.width   = 1,
+		},
+		.table = g12a_pcie_pll_table,
+		.init_regs = g12a_pcie_pll_init_regs,
+		.init_count = ARRAY_SIZE(g12a_pcie_pll_init_regs),
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "pcie_pll_dco",
+		.ops = &meson_clk_pcie_pll_ops,
+		.parent_names = (const char *[]){ IN_PREFIX "xtal" },
+		.num_parents = 1,
+	},
+};
+
+static struct clk_fixed_factor g12a_pcie_pll_dco_div2 = {
+	.mult = 1,
+	.div = 2,
+	.hw.init = &(struct clk_init_data){
+		.name = "pcie_pll_dco_div2",
+		.ops = &clk_fixed_factor_ops,
+		.parent_names = (const char *[]){ "pcie_pll_dco" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap g12a_pcie_pll_od = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_PCIE_PLL_CNTL0,
+		.shift = 16,
+		.width = 5,
+		.flags = CLK_DIVIDER_ROUND_CLOSEST |
+			 CLK_DIVIDER_ONE_BASED |
+			 CLK_DIVIDER_ALLOW_ZERO,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "pcie_pll_od",
+		.ops = &clk_regmap_divider_ops,
+		.parent_names = (const char *[]){ "pcie_pll_dco_div2" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_fixed_factor g12a_pcie_pll = {
+	.mult = 1,
+	.div = 2,
+	.hw.init = &(struct clk_init_data){
+		.name = "pcie_pll_pll",
+		.ops = &clk_fixed_factor_ops,
+		.parent_names = (const char *[]){ "pcie_pll_od" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
 static struct clk_regmap g12a_hdmi_pll_dco = {
 	.data = &(struct meson_clk_pll_data){
 		.en = {
@@ -2499,6 +2611,10 @@ static struct clk_hw_onecell_data g12a_hw_onecell_data = {
 		[CLKID_CPU_CLK_AXI]		= &g12a_cpu_clk_axi.hw,
 		[CLKID_CPU_CLK_TRACE_DIV]	= &g12a_cpu_clk_trace_div.hw,
 		[CLKID_CPU_CLK_TRACE]		= &g12a_cpu_clk_trace.hw,
+		[CLKID_PCIE_PLL_DCO]		= &g12a_pcie_pll_dco.hw,
+		[CLKID_PCIE_PLL_DCO_DIV2]	= &g12a_pcie_pll_dco_div2.hw,
+		[CLKID_PCIE_PLL_OD]		= &g12a_pcie_pll_od.hw,
+		[CLKID_PCIE_PLL]		= &g12a_pcie_pll.hw,
 		[NR_CLKS]			= NULL,
 	},
 	.num = NR_CLKS,
@@ -2685,6 +2801,8 @@ static struct clk_regmap *const g12a_clk_regmaps[] = {
 	&g12a_cpu_clk_axi,
 	&g12a_cpu_clk_trace_div,
 	&g12a_cpu_clk_trace,
+	&g12a_pcie_pll_od,
+	&g12a_pcie_pll_dco,
 };
 
 static const struct meson_eeclkc_data g12a_clkc_data = {
diff --git a/drivers/clk/meson/g12a.h b/drivers/clk/meson/g12a.h
index 70aa469ca1cf..1393a09730a6 100644
--- a/drivers/clk/meson/g12a.h
+++ b/drivers/clk/meson/g12a.h
@@ -186,8 +186,11 @@
 #define CLKID_CPU_CLK_AXI			195
 #define CLKID_CPU_CLK_TRACE_DIV			196
 #define CLKID_CPU_CLK_TRACE			197
+#define CLKID_PCIE_PLL_DCO			198
+#define CLKID_PCIE_PLL_DCO_DIV2			199
+#define CLKID_PCIE_PLL_OD			200
 
-#define NR_CLKS					198
+#define NR_CLKS					202
 
 /* include the CLKIDs that have been made part of the DT binding */
 #include <dt-bindings/clock/g12a-clkc.h>
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
