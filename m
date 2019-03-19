Return-Path: <SRS0=/WbR=RW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3F96C43381
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 10:12:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8413220828
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 10:12:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FN057TBs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="QHv/C1Zh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8413220828
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8lGZCozQ0ufijKviiZ2uoQiHmoYGLHP68Ja98pEMeRw=; b=FN057TBs2XwuGR
	Nh0oE27YrgVkAF1OSv8x/dqd/+cePaiFCaa/W1PoGiYEBQDCEPSrtn5yX/1D5J4Tri+3Gkm40ZL73
	qUrKtB+NACAB6QMPqfGmJ7fRw1RQlSHRxooYwyTtlBA3L+LpZ161h1LMiRDmh6BWmgs6yPGhcrfxk
	QtxDSqbjylpI4HIuLnoUYueiWPrvfme0NBEi4/3f7F6KfCk92Dv6JZ47EWqwkNYz2lO6ByuXlK8M5
	ySbqKz4G3Y70jv53gF1Hd0UAq/o3HD+o10AqatWDXmr4wOp9ifAo/81On/4D9ZyP8iHGXdZG5QL75
	FMSbWLfdOaq2wsLfS1YQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6Bj8-0008Fd-Op; Tue, 19 Mar 2019 10:12:10 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6Bir-0007vS-CW
 for linux-amlogic@lists.infradead.org; Tue, 19 Mar 2019 10:11:58 +0000
Received: by mail-wm1-x344.google.com with SMTP id z6so4120970wmi.0
 for <linux-amlogic@lists.infradead.org>; Tue, 19 Mar 2019 03:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=My8ASarnpw2B62d9qiE1akdMtnJMYlnHeiI3/dBbjIo=;
 b=QHv/C1ZhzO0Qd7Xf5ev2t286jsI9+TByfKUHUcFOrC+T39Cz0+FWhfY2+hZcUBeUsL
 yG0R/BU+87PNQJkE3LrhMV1B9/pez4t0LH6Luf+v0biuMWtbPrJhQzziJznf9AndFLOU
 XXGolcV2kmCZcG4xCm2kg3OJINnK6V5dhr8jYIidQFSdpD/6sbGQu8MR0gbw6okmNjG0
 FEnzaAaJ10vxORd2OPRvCuyn7sm5ORsUvLku57W8Y9vAxxCEaJRy5aYbZlXHYSe680LA
 tv//cjKlJESNK7GRqI4yH8KXlJfCY1bszMK8lTcuaAH3GH2/RrmWdOnBw5k8Q5nbHjdl
 LEDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=My8ASarnpw2B62d9qiE1akdMtnJMYlnHeiI3/dBbjIo=;
 b=G9SXAM1Z886OXiKv2yS7y31/7gW+DuRUr3HGi/p2BJ0Q5dNmwurQ6eVcyukO4KdssM
 DKXwBXDgKVfp0lpwE3uI34y+80gnCepoS+kEwqp89DzmUUk3ASHbTUxjzpTsQmdepKDO
 YQYPk/FPW+13qE9v8iUJgakusH88SJ3MtWJ+nIAWgh3OWAcUS5TGOEgBCK/hW9bE2qvh
 CL9lin0NhCPZovCbkCxzpwSMgM/QNe91gfd+NWcAO1cr4A6oox2WOSxD82uidhszSNNg
 hMyLd+fRUC891ZgiHUfXKJQfXzNrAya2Hq7Qo7LmB0a9bqnFM9JRpnSrXeLEIRgq3LEy
 SLYg==
X-Gm-Message-State: APjAAAVefjQmAyefivJj5Z/d+AohCRbzB/zGicn7Xk7qmDuK96sMw3vC
 VBKMIzBLRHXz556PR08mTg5OfQ==
X-Google-Smtp-Source: APXvYqx2hGwUdqmMih+I2PLfVexMx5FpNZim3pJM0gM9QmW3oQG5DtDIQqQ/zbIiuxZDqmmUY/O4TQ==
X-Received: by 2002:a7b:c34e:: with SMTP id l14mr3024778wmj.68.1552990312067; 
 Tue, 19 Mar 2019 03:11:52 -0700 (PDT)
Received: from mjourdan-pc.numericable.fr (abo-99-183-68.mtp.modulonet.fr.
 [85.68.183.99])
 by smtp.gmail.com with ESMTPSA id h10sm3911245wmf.2.2019.03.19.03.11.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Mar 2019 03:11:51 -0700 (PDT)
From: Maxime Jourdan <mjourdan@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 2/2] clk: meson-g12a: add video decoder clocks
Date: Tue, 19 Mar 2019 11:11:38 +0100
Message-Id: <20190319101138.27520-3-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190319101138.27520-1-mjourdan@baylibre.com>
References: <20190319101138.27520-1-mjourdan@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_031154_691309_B62C1F9C 
X-CRM114-Status: GOOD (  11.54  )
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

Add the necessary clock parts for:

 - VDEC_1: used to feed VDEC_1
 - VDEC_HEVC: the "back" part of the VDEC_HEVC block
 - VDEC_HEVCF: the "front" part of the VDEC_HEVC block

In previous SoC generations (GXL, GXBB), there was only one VDEC_HEVC
clock, which got split in two parts for G12A.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
---
 drivers/clk/meson/g12a.c | 163 +++++++++++++++++++++++++++++++++++++++
 drivers/clk/meson/g12a.h |   8 +-
 2 files changed, 170 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 3a3134976534..6c762a8b32b9 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -1495,6 +1495,151 @@ static struct clk_regmap g12a_vpu = {
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
+		.flags = CLK_DIVIDER_ROUND_CLOSEST,
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
+		.flags = CLK_DIVIDER_ROUND_CLOSEST,
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
+		.flags = CLK_DIVIDER_ROUND_CLOSEST,
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
@@ -2615,6 +2760,15 @@ static struct clk_hw_onecell_data g12a_hw_onecell_data = {
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
@@ -2803,6 +2957,15 @@ static struct clk_regmap *const g12a_clk_regmaps[] = {
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
