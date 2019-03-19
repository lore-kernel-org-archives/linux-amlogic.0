Return-Path: <SRS0=/WbR=RW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC818C43381
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 08:51:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B9ED2077B
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 08:51:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l7SP1T/E";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Q4aJ07IP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B9ED2077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5+cYG197E5QkxHfGeSCx3yUFaBqwkyUYJVfKj8dIfK4=; b=l7SP1T/E0OWMYJ
	HuMm73lCr9VzON+jmMuYI9ctP9pPrpR5ftA5pAYokxny8k9FR75WvgjpV0F79eCOy+wBSB9NHw+DJ
	ZCYs3M3u4IH+AvMcCQkAmKT2CojIIi1MrNa0X1RmqoU4W08ja/HlRtaiDJn7RCq1iAEEgUvbjahYD
	AG91bUa+46/L3K3Ad+LbkjfsGNg33UWcBKXJGj7EWbGVUkeWI72MUM4/tQEHg7HZb/eqaPM0JSza3
	w10iv2Pri0OTzojl452mi9+SZbvPHyY+9m5D2QwcZKLE59HUGmd+Y5JKk7Xw06lBPfS8LEk58ag74
	LAMeLR7M30k4c6eACvjA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6ASu-00088w-Ne; Tue, 19 Mar 2019 08:51:20 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6ASV-0007d2-SI
 for linux-amlogic@lists.infradead.org; Tue, 19 Mar 2019 08:50:59 +0000
Received: by mail-wr1-x444.google.com with SMTP id j9so5868735wrn.6
 for <linux-amlogic@lists.infradead.org>; Tue, 19 Mar 2019 01:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gf72ZmXlmqyXLuvApTF83s8RrJ6agdJoOCHA3jp5SbQ=;
 b=Q4aJ07IPwy8bvxdm74BHj4ulAtlWJQmIDQehcs7jnHnjhGM4FqLpEsM01meRYGwcBr
 QwF5g4Mcqu8/b/9wjf2zjZlfCpbeTjudVBgbQTmfntS0hVzdBGkMgWNMe78uw3CYzAxf
 dyBwLLBTT6n08oO8b4Wy03gcUccSvZjrKH4O4W8zXzAt1m5pdAZpqonZDHf9vUCzNFy/
 uHQ69UDhbn8vk2hoFsts6C2Rfk2ARRv+jc1bNBIfXBqXi9cqW1yt53J/UTdIBzMjwCe5
 NVI1hOGqFgHe7fOHMdthLVyQwmHoIRpyhhZIO5vCOq73KhVcQW3LeUlVjZ89xjeWWUko
 wqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gf72ZmXlmqyXLuvApTF83s8RrJ6agdJoOCHA3jp5SbQ=;
 b=RCrnqkK7eCrHdXoI+/TqSfa/tDtWrpZUMhXHLdOKmEjEoZ+7W9wjReNV+0eTT8orLQ
 x2kt707BKP42rawxXZ3QJ7IEdk8+eWvZ1HEqTmG4PbCGIsM90xcKo1IY7V7iRHrIGkoj
 z6qmKp/JFjLGSfqP1O2WPHfcc76EAnMTf04AppA8YCP6HIpx8FqvQM88RDTYzP/j+eQE
 MwznSViR/YCO/5khCiPu2eLgpvxTpBiQ1F5azOUWyex+LEL5iWasXCuECrvOUUejSKi1
 sFQPHevI9JthW9YSiHh9cLb0zxOq8dIFGlr4Fm1S7cjTGnBE8t36QrgqxMIMy+K6iYrs
 nEiw==
X-Gm-Message-State: APjAAAXMcO8hEwJVCy4HkjraVqGu1kTXS4vqbzlnVwRydeYnhGpv05I4
 rIoWdfSSwgjbrzHk+8ZkmAKumg==
X-Google-Smtp-Source: APXvYqx/7t5grdSDpDYvOILI7Edw+w3pkGcR+XzTJQOlmDcDhBJ+dZ/uOumBdpO46981UECl7uUrNA==
X-Received: by 2002:adf:a147:: with SMTP id r7mr15213268wrr.5.1552985454569;
 Tue, 19 Mar 2019 01:50:54 -0700 (PDT)
Received: from mjourdan-pc.numericable.fr (abo-99-183-68.mtp.modulonet.fr.
 [85.68.183.99])
 by smtp.gmail.com with ESMTPSA id n4sm9411047wrx.39.2019.03.19.01.50.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Mar 2019 01:50:54 -0700 (PDT)
From: Maxime Jourdan <mjourdan@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 2/2] clk: meson-g12a: add video decoder clocks
Date: Tue, 19 Mar 2019 09:50:44 +0100
Message-Id: <20190319085044.8581-3-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190319085044.8581-1-mjourdan@baylibre.com>
References: <20190319085044.8581-1-mjourdan@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_015056_089910_EF59F274 
X-CRM114-Status: GOOD (  11.90  )
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
Cc: Maxime Jourdan <mjourdan@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Mostly like meson-gx, except that the VDEC_HEVC clock is now split in two:
HEVC and HEVCF.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
---
 drivers/clk/meson/g12a.c | 160 +++++++++++++++++++++++++++++++++++++++
 drivers/clk/meson/g12a.h |   8 +-
 2 files changed, 167 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 3a3134976534..cfb91df884cb 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -1495,6 +1495,148 @@ static struct clk_regmap g12a_vpu = {
 	},
 };
 
+/* VDEC clocks */
+
+static const char * const g12a_vdec_parent_names[] = {
+	"fclk_div2p5", "fclk_div3", "fclk_div4", "fclk_div5", "fclk_div7",
+	"hifi_pll", "gp0_pll",
+};
+
+static struct clk_regmap g12a_vdec_1_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_VDEC_CLK_CNTL,
+		.mask = 0x7,
+		.shift = 9,
+		.flags = CLK_MUX_ROUND_CLOSEST,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "vdec_1_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_names = g12a_vdec_parent_names,
+		.num_parents = ARRAY_SIZE(g12a_vdec_parent_names),
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap g12a_vdec_1_div = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_VDEC_CLK_CNTL,
+		.shift = 0,
+		.width = 7,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "vdec_1_div",
+		.ops = &clk_regmap_divider_ops,
+		.parent_names = (const char *[]){ "vdec_1_sel" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap g12a_vdec_1 = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_VDEC_CLK_CNTL,
+		.bit_idx = 8,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vdec_1",
+		.ops = &clk_regmap_gate_ops,
+		.parent_names = (const char *[]){ "vdec_1_div" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap g12a_vdec_hevcf_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_VDEC2_CLK_CNTL,
+		.mask = 0x7,
+		.shift = 9,
+		.flags = CLK_MUX_ROUND_CLOSEST,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "vdec_hevcf_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_names = g12a_vdec_parent_names,
+		.num_parents = ARRAY_SIZE(g12a_vdec_parent_names),
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap g12a_vdec_hevcf_div = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_VDEC2_CLK_CNTL,
+		.shift = 0,
+		.width = 7,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "vdec_hevcf_div",
+		.ops = &clk_regmap_divider_ops,
+		.parent_names = (const char *[]){ "vdec_hevcf_sel" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap g12a_vdec_hevcf = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_VDEC2_CLK_CNTL,
+		.bit_idx = 8,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vdec_hevcf",
+		.ops = &clk_regmap_gate_ops,
+		.parent_names = (const char *[]){ "vdec_hevcf_div" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap g12a_vdec_hevc_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_VDEC2_CLK_CNTL,
+		.mask = 0x7,
+		.shift = 25,
+		.flags = CLK_MUX_ROUND_CLOSEST,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "vdec_hevc_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_names = g12a_vdec_parent_names,
+		.num_parents = ARRAY_SIZE(g12a_vdec_parent_names),
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap g12a_vdec_hevc_div = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_VDEC2_CLK_CNTL,
+		.shift = 16,
+		.width = 7,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "vdec_hevc_div",
+		.ops = &clk_regmap_divider_ops,
+		.parent_names = (const char *[]){ "vdec_hevc_sel" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap g12a_vdec_hevc = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_VDEC2_CLK_CNTL,
+		.bit_idx = 24,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vdec_hevc",
+		.ops = &clk_regmap_gate_ops,
+		.parent_names = (const char *[]){ "vdec_hevc_div" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
 /* VAPB Clock */
 
 static const char * const g12a_vapb_parent_names[] = {
@@ -2615,6 +2757,15 @@ static struct clk_hw_onecell_data g12a_hw_onecell_data = {
 		[CLKID_PCIE_PLL_DCO_DIV2]	= &g12a_pcie_pll_dco_div2.hw,
 		[CLKID_PCIE_PLL_OD]		= &g12a_pcie_pll_od.hw,
 		[CLKID_PCIE_PLL]		= &g12a_pcie_pll.hw,
+		[CLKID_VDEC_1_SEL]		= &g12a_vdec_1_sel.hw,
+		[CLKID_VDEC_1_DIV]		= &g12a_vdec_1_div.hw,
+		[CLKID_VDEC_1]			= &g12a_vdec_1.hw,
+		[CLKID_VDEC_HEVC_SEL]		= &g12a_vdec_hevc_sel.hw,
+		[CLKID_VDEC_HEVC_DIV]		= &g12a_vdec_hevc_div.hw,
+		[CLKID_VDEC_HEVC]		= &g12a_vdec_hevc.hw,
+		[CLKID_VDEC_HEVCF_SEL]		= &g12a_vdec_hevcf_sel.hw,
+		[CLKID_VDEC_HEVCF_DIV]		= &g12a_vdec_hevcf_div.hw,
+		[CLKID_VDEC_HEVCF]		= &g12a_vdec_hevcf.hw,
 		[NR_CLKS]			= NULL,
 	},
 	.num = NR_CLKS,
@@ -2803,6 +2954,15 @@ static struct clk_regmap *const g12a_clk_regmaps[] = {
 	&g12a_cpu_clk_trace,
 	&g12a_pcie_pll_od,
 	&g12a_pcie_pll_dco,
+	&g12a_vdec_1_sel,
+	&g12a_vdec_1_div,
+	&g12a_vdec_1,
+	&g12a_vdec_hevc_sel,
+	&g12a_vdec_hevc_div,
+	&g12a_vdec_hevc,
+	&g12a_vdec_hevcf_sel,
+	&g12a_vdec_hevcf_div,
+	&g12a_vdec_hevcf,
 };
 
 static const struct meson_eeclkc_data g12a_clkc_data = {
diff --git a/drivers/clk/meson/g12a.h b/drivers/clk/meson/g12a.h
index 1393a09730a6..39c41af70804 100644
--- a/drivers/clk/meson/g12a.h
+++ b/drivers/clk/meson/g12a.h
@@ -189,8 +189,14 @@
 #define CLKID_PCIE_PLL_DCO			198
 #define CLKID_PCIE_PLL_DCO_DIV2			199
 #define CLKID_PCIE_PLL_OD			200
+#define CLKID_VDEC_1_SEL			202
+#define CLKID_VDEC_1_DIV			203
+#define CLKID_VDEC_HEVC_SEL			205
+#define CLKID_VDEC_HEVC_DIV			206
+#define CLKID_VDEC_HEVCF_SEL			208
+#define CLKID_VDEC_HEVCF_DIV			209
 
-#define NR_CLKS					202
+#define NR_CLKS					211
 
 /* include the CLKIDs that have been made part of the DT binding */
 #include <dt-bindings/clock/g12a-clkc.h>
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
