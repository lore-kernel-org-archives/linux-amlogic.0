Return-Path: <SRS0=kAN4=4H=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFC38C34050
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Feb 2020 08:50:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DC34222D9
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Feb 2020 08:50:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TfZPsoO9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="eluEgFKO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DC34222D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NcpN+UxgrpqtpbF8JUkVDFHbmn+1gYIiRJRU6d5PtfA=; b=TfZPsoO9hXR+3W
	5XnxAa7TAgSgIp7qjvhl6XgUCdB1SE+Ra9MfE0sZd2rFGN/rU+32vzDROZHfSJZoeNfqBVCGYMdE2
	fy2oXXI0Pao03w4gEJI97eFyYH/6HAHHMHCYk3M4G1KrvIVSvVSeGx/e+5+Fp84OmjHQW5cCbHEF8
	GZHeSacl2Z5H4BDeKge+SR+ylmvTjUwhVeI1f1POgjh1sqnWnYMg2B7CYOnaZRwS5Qk5/f0iwFcUT
	UXdY/7D4nE7SVfUWn7sJTgMDdQoy4JKENEKVqAy6PstFwwqrD6OgHFE0j0LK9JGeL69e0Y1tf4kqO
	pw3Ov5szyrxoZ8Qv8PVQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4L3f-0005aj-3b; Wed, 19 Feb 2020 08:50:15 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4L35-0003oy-D0
 for linux-amlogic@lists.infradead.org; Wed, 19 Feb 2020 08:49:41 +0000
Received: by mail-wr1-x444.google.com with SMTP id k11so27134998wrd.9
 for <linux-amlogic@lists.infradead.org>; Wed, 19 Feb 2020 00:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5GSg/xDxPp49oDbA6vFdut+q4shLY3Pk8HEGAuRFez0=;
 b=eluEgFKOncyKAGdAwn5OlTiyk2CNzP5MLYoMHFNmglRELyDY5Bk6FrEAlgWD7RuyYp
 cIRQuyIF/z2xm2TY2HA0ExnS0Px90I2YnFFe2YaEp8nRZe8AWjSJ+yXWyGKS+FtSe+i3
 SM4nfyn/zK9JP5yPnX1DcQrdxrAVI3xGW2dO320+301upQ6idUmjL64+5RLLV+F7l+R2
 EHQNCCqP7FZ8UpTmLCXdGOj9Ec6wfsrNuyRGOwNJQOc2+ezeoKKUbgZ5NW+eB1kiJz4X
 Xy/0uw/WlS0qq3ibJmSnCialEob3fLbK8sgqebp6PoO2HlZbIlAWjvIkZr4G71U1auup
 hNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5GSg/xDxPp49oDbA6vFdut+q4shLY3Pk8HEGAuRFez0=;
 b=lOcK+2VgZ0cR9TzoAUQ5sc2XBUha2mQcw4ZZx4CrOCI9sTvkJZ0rHNtPhPJu8zTNIy
 DkKsvS2Eq/BeC0vveUgjk4wY9IJqkq1xhzOm4QQzv4VvgBBbQVGpIgovqegHHGBwTMlW
 LWvaJEyeuA/uc+J89eaUs1VJtSVjVwZDCEVH5Kmozvr3qibP/Lc5DLnXg19CJpsXv3XL
 LuSgWpg07VKui0yp7khVdhELIof4HGSwMAWRNqYxzol1tcpSILpIkOnvniTtShs+hrHn
 V0FSgKTK6WZxOJGn05TQwuyhZsGUeN9zVUeSGx09x9KJ0vJ5zuWtDyw22t0bXsLkdUGC
 TwBQ==
X-Gm-Message-State: APjAAAV0A7gekY9a5ZvvgVX+guo7O5wrEYGL/x5De77/b+hujWkWxjs9
 9svdXNnXMSEH62mBPx0RvEUWYA==
X-Google-Smtp-Source: APXvYqzIWUthaSqh0c9Ww016Eg2GCgQn8e5Ju2qinfSCQh/Y6SpPyxGTiNTOn47XES0XFKoKalCppg==
X-Received: by 2002:a05:6000:1187:: with SMTP id
 g7mr34747098wrx.109.1582102178017; 
 Wed, 19 Feb 2020 00:49:38 -0800 (PST)
Received: from bender.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t13sm2021673wrw.19.2020.02.19.00.49.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 00:49:37 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com
Subject: [PATCH 2/2] clk: meson: g12a: add support for the SPICC SCLK Source
 clocks
Date: Wed, 19 Feb 2020 09:49:28 +0100
Message-Id: <20200219084928.28707-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200219084928.28707-1-narmstrong@baylibre.com>
References: <20200219084928.28707-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_004939_450936_AF45976B 
X-CRM114-Status: GOOD (  11.89  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
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

This adds the clocks used for the Amlogic G12A and compatible SoCs SPICC
controller to provide a more complete range of frequencies instead of the
SPICC internal divider over Xtal.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/g12a.c | 129 +++++++++++++++++++++++++++++++++++++++
 drivers/clk/meson/g12a.h |   6 +-
 2 files changed, 134 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index d2760a021301..fad616cac01e 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -3862,6 +3862,111 @@ static struct clk_regmap g12a_ts = {
 	},
 };
 
+/* SPICC SCLK source clock */
+
+static const struct clk_parent_data spicc_sclk_parent_data[] = {
+	{ .fw_name = "xtal", },
+	{ .hw = &g12a_clk81.hw },
+	{ .hw = &g12a_fclk_div4.hw },
+	{ .hw = &g12a_fclk_div3.hw },
+	{ .hw = &g12a_fclk_div5.hw },
+	{ .hw = &g12a_fclk_div7.hw },
+};
+
+static struct clk_regmap g12a_spicc0_sclk_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_SPICC_CLK_CNTL,
+		.mask = 7,
+		.shift = 7,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "spicc0_sclk_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_data = spicc_sclk_parent_data,
+		.num_parents = ARRAY_SIZE(spicc_sclk_parent_data),
+	},
+};
+
+static struct clk_regmap g12a_spicc0_sclk_div = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_SPICC_CLK_CNTL,
+		.shift = 0,
+		.width = 6,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "spicc0_sclk_div",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&g12a_spicc0_sclk_sel.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap g12a_spicc0_sclk = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_SPICC_CLK_CNTL,
+		.bit_idx = 6,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "spicc0_sclk",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&g12a_spicc0_sclk_div.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap g12a_spicc1_sclk_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_SPICC_CLK_CNTL,
+		.mask = 7,
+		.shift = 23,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "spicc1_sclk_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_data = spicc_sclk_parent_data,
+		.num_parents = ARRAY_SIZE(spicc_sclk_parent_data),
+	},
+};
+
+static struct clk_regmap g12a_spicc1_sclk_div = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_SPICC_CLK_CNTL,
+		.shift = 16,
+		.width = 6,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "spicc1_sclk_div",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&g12a_spicc1_sclk_sel.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap g12a_spicc1_sclk = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_SPICC_CLK_CNTL,
+		.bit_idx = 22,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "spicc1_sclk",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&g12a_spicc1_sclk_div.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
 #define MESON_GATE(_name, _reg, _bit) \
 	MESON_PCLK(_name, _reg, _bit, &g12a_clk81.hw)
 
@@ -4159,6 +4264,12 @@ static struct clk_hw_onecell_data g12a_hw_onecell_data = {
 		[CLKID_VDEC_HEVCF]		= &g12a_vdec_hevcf.hw,
 		[CLKID_TS_DIV]			= &g12a_ts_div.hw,
 		[CLKID_TS]			= &g12a_ts.hw,
+		[CLKID_SPICC0_SCLK_SEL]		= &g12a_spicc0_sclk_sel.hw,
+		[CLKID_SPICC0_SCLK_DIV]		= &g12a_spicc0_sclk_div.hw,
+		[CLKID_SPICC0_SCLK]		= &g12a_spicc0_sclk.hw,
+		[CLKID_SPICC1_SCLK_SEL]		= &g12a_spicc1_sclk_sel.hw,
+		[CLKID_SPICC1_SCLK_DIV]		= &g12a_spicc1_sclk_div.hw,
+		[CLKID_SPICC1_SCLK]		= &g12a_spicc1_sclk.hw,
 		[NR_CLKS]			= NULL,
 	},
 	.num = NR_CLKS,
@@ -4408,6 +4519,12 @@ static struct clk_hw_onecell_data g12b_hw_onecell_data = {
 		[CLKID_CPUB_CLK_AXI]		= &g12b_cpub_clk_axi.hw,
 		[CLKID_CPUB_CLK_TRACE_SEL]	= &g12b_cpub_clk_trace_sel.hw,
 		[CLKID_CPUB_CLK_TRACE]		= &g12b_cpub_clk_trace.hw,
+		[CLKID_SPICC0_SCLK_SEL]		= &g12a_spicc0_sclk_sel.hw,
+		[CLKID_SPICC0_SCLK_DIV]		= &g12a_spicc0_sclk_div.hw,
+		[CLKID_SPICC0_SCLK]		= &g12a_spicc0_sclk.hw,
+		[CLKID_SPICC1_SCLK_SEL]		= &g12a_spicc1_sclk_sel.hw,
+		[CLKID_SPICC1_SCLK_DIV]		= &g12a_spicc1_sclk_div.hw,
+		[CLKID_SPICC1_SCLK]		= &g12a_spicc1_sclk.hw,
 		[NR_CLKS]			= NULL,
 	},
 	.num = NR_CLKS,
@@ -4642,6 +4759,12 @@ static struct clk_hw_onecell_data sm1_hw_onecell_data = {
 		[CLKID_CPU1_CLK]		= &sm1_cpu1_clk.hw,
 		[CLKID_CPU2_CLK]		= &sm1_cpu2_clk.hw,
 		[CLKID_CPU3_CLK]		= &sm1_cpu3_clk.hw,
+		[CLKID_SPICC0_SCLK_SEL]		= &g12a_spicc0_sclk_sel.hw,
+		[CLKID_SPICC0_SCLK_DIV]		= &g12a_spicc0_sclk_div.hw,
+		[CLKID_SPICC0_SCLK]		= &g12a_spicc0_sclk.hw,
+		[CLKID_SPICC1_SCLK_SEL]		= &g12a_spicc1_sclk_sel.hw,
+		[CLKID_SPICC1_SCLK_DIV]		= &g12a_spicc1_sclk_div.hw,
+		[CLKID_SPICC1_SCLK]		= &g12a_spicc1_sclk.hw,
 		[NR_CLKS]			= NULL,
 	},
 	.num = NR_CLKS,
@@ -4877,6 +5000,12 @@ static struct clk_regmap *const g12a_clk_regmaps[] = {
 	&sm1_cpu1_clk,
 	&sm1_cpu2_clk,
 	&sm1_cpu3_clk,
+	&g12a_spicc0_sclk_sel,
+	&g12a_spicc0_sclk_div,
+	&g12a_spicc0_sclk,
+	&g12a_spicc1_sclk_sel,
+	&g12a_spicc1_sclk_div,
+	&g12a_spicc1_sclk,
 };
 
 static const struct reg_sequence g12a_init_regs[] = {
diff --git a/drivers/clk/meson/g12a.h b/drivers/clk/meson/g12a.h
index 9df4068aced1..a8852556836e 100644
--- a/drivers/clk/meson/g12a.h
+++ b/drivers/clk/meson/g12a.h
@@ -255,8 +255,12 @@
 #define CLKID_DSU_CLK_DYN1			249
 #define CLKID_DSU_CLK_DYN			250
 #define CLKID_DSU_CLK_FINAL			251
+#define CLKID_SPICC0_SCLK_SEL			256
+#define CLKID_SPICC0_SCLK_DIV			257
+#define CLKID_SPICC1_SCLK_SEL			259
+#define CLKID_SPICC1_SCLK_DIV			260
 
-#define NR_CLKS					256
+#define NR_CLKS					262
 
 /* include the CLKIDs that have been made part of the DT binding */
 #include <dt-bindings/clock/g12a-clkc.h>
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
