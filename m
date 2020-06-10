Return-Path: <SRS0=LORm=7X=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9F9AC433E0
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jun 2020 08:31:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 926FC2064C
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jun 2020 08:31:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mAvW+zfO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="WrCVnVG5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 926FC2064C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0u8CR94Mp15atIM2PuPVE1D/eIG2RLZqYcn7f35fw6E=; b=mAvW+zfOSnZBcH
	/Ihzakxvo1B/p1i+Z8IzcnMtXvUwVZzF/l2GDjM0zhgOlknbGLh0gPSt2pN4cfg0CfJugHfmxDJca
	fTYdIbM6z5T5HYvQdrT0ioD5xs97KkKH7Ez8IHJbpuBk852HB+oVULQ4k0Y5WIXP4kVXkuuceY1QM
	bCvMjP71KuGmdCSY9I+SIw3s3crHKnzHDXe8ws2RMCEMIQnA6bgSN1Kd8tZKgvwPo8UdMsqsiZYAd
	uix1R7q/sY4/uu5gnnWVuoEYPNL2WQ5B5Lz9Lh39PQDUpzBG+NLb7ZQ+0UaAw3a4RjGi8RK+2J9yb
	QVbukOSIjVmFOLTdmNLw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiw8J-00038i-Oq; Wed, 10 Jun 2020 08:30:51 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiw7o-0002eD-8f
 for linux-amlogic@lists.infradead.org; Wed, 10 Jun 2020 08:30:22 +0000
Received: by mail-wr1-x443.google.com with SMTP id j10so1222541wrw.8
 for <linux-amlogic@lists.infradead.org>; Wed, 10 Jun 2020 01:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lPp6VqQcy0iQsfloe6knT20Y8DJvmbq6mVjmcioSaQ8=;
 b=WrCVnVG5q5Fywz83luKZPdKhNAMMt74TBo3j5w35tQ6k35gB80ABhyYXmFImzBEzzX
 uEBYq3Pn1lKubN+5j9bvpRK201nqTDdgrmqjmVrkpAwGJrtcB5J8lFRAoYdfRKQ6vIhV
 ZLZ4a7ZZlVlnFNkdCJiARAP+Jrjn9EpcljWSTHTUAz8cyVdMU1ytmnrTJb4MYbwIKDim
 F2zHhJCOaojRj0gXor65QgLghbwE5ueLnEuBTGUjbeR06TbX70h0QFZ0DNx4/kX1gMlJ
 5uoel/rDosIB0hghoGbEdprLyuRVyvEfNdK5RTh3YY0aH1c8vQ2wzhSxvyD4/Uk9bYNV
 8xew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lPp6VqQcy0iQsfloe6knT20Y8DJvmbq6mVjmcioSaQ8=;
 b=T05BTX7YZ3lxH9KFDompEb2+T+cCxchCsT2ETWxE6qqoGpPYr4Tn8C+rWwZFQVwkEQ
 sCo02DmCPx5enjqk4TqtA66OnyYm7GU02B9DilRSWWb7Ui7uHH1aIOLoCg5e+22pIVH6
 7UrEL3TBNsVfCqpKdMtRgcBavldqRIjADo33SMckKZOOaOr6ZD32KiRUrnoAzdATZyfk
 EFld03tsiBSSDoNKUKUfiNxNHAXIlu5O3GKfNPZ5hZcQv4whfHoI6uwFXJqUNowxs5wu
 3s2miNDLtPKK4oqyvDvdL0Jq1SInDUDNaPAInsVBrRjiOIjybQz6YG/VlRFwLVbXEB9b
 mG2g==
X-Gm-Message-State: AOAM530cjHs5LiaM8zrzqVyEa2NOZ2HzHmQ7x6MbxNXBu6VO5121DySu
 iM2X4wizsr3/9Ty+PYLqWv2oEw==
X-Google-Smtp-Source: ABdhPJx94NKyXsKDcnV10IsqMYYY6faUswz/JNOerG8XPvisIU+VVaRhnwMUZi7QGcCrQRQ0u+fNrw==
X-Received: by 2002:a5d:4e88:: with SMTP id e8mr2432582wru.188.1591777818862; 
 Wed, 10 Jun 2020 01:30:18 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:22:5867:d2c6:75f4])
 by smtp.gmail.com with ESMTPSA id
 u13sm6958974wrp.53.2020.06.10.01.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 01:30:18 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com
Subject: [PATCH 2/2] clk: meson: g12a: Add support for NNA CLK source clocks
Date: Wed, 10 Jun 2020 10:30:12 +0200
Message-Id: <20200610083012.5024-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200610083012.5024-1-narmstrong@baylibre.com>
References: <20200610083012.5024-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200610_013020_325177_F6CDE9FE 
X-CRM114-Status: GOOD (  11.04  )
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
Cc: Dmitry Shmidt <dimitrysh@google.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Dmitry Shmidt <dimitrysh@google.com>

This adds the Neural Network Accelerator source clocks hierarchy, it's
2 simple composite clocks to feed the AXI interface and the Core of
the Neural Network Accelerator IP.

This IP is only present on the Amlogic SM1 SoCs family.

Signed-off-by: Dmitry Shmidt <dimitrysh@google.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/g12a.c | 119 +++++++++++++++++++++++++++++++++++++++
 drivers/clk/meson/g12a.h |   7 ++-
 2 files changed, 125 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 30c15766ebb1..9803d44bb157 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -3981,6 +3981,113 @@ static struct clk_regmap g12a_spicc1_sclk = {
 	},
 };
 
+/* Neural Network Accelerator source clock */
+
+static const struct clk_parent_data nna_clk_parent_data[] = {
+	{ .fw_name = "xtal", },
+	{ .hw = &g12a_gp0_pll.hw, },
+	{ .hw = &g12a_hifi_pll.hw, },
+	{ .hw = &g12a_fclk_div2p5.hw, },
+	{ .hw = &g12a_fclk_div3.hw, },
+	{ .hw = &g12a_fclk_div4.hw, },
+	{ .hw = &g12a_fclk_div5.hw, },
+	{ .hw = &g12a_fclk_div7.hw },
+};
+
+static struct clk_regmap sm1_nna_axi_clk_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_NNA_CLK_CNTL,
+		.mask = 7,
+		.shift = 9,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "nna_axi_clk_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_data = nna_clk_parent_data,
+		.num_parents = ARRAY_SIZE(nna_clk_parent_data),
+	},
+};
+
+static struct clk_regmap sm1_nna_axi_clk_div = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_NNA_CLK_CNTL,
+		.shift = 0,
+		.width = 7,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "nna_axi_clk_div",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&sm1_nna_axi_clk_sel.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap sm1_nna_axi_clk = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_NNA_CLK_CNTL,
+		.bit_idx = 8,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "nna_axi_clk",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&sm1_nna_axi_clk_div.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap sm1_nna_core_clk_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_NNA_CLK_CNTL,
+		.mask = 7,
+		.shift = 25,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "nna_core_clk_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_data = nna_clk_parent_data,
+		.num_parents = ARRAY_SIZE(nna_clk_parent_data),
+	},
+};
+
+static struct clk_regmap sm1_nna_core_clk_div = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_NNA_CLK_CNTL,
+		.shift = 16,
+		.width = 7,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "nna_core_clk_div",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&sm1_nna_core_clk_sel.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap sm1_nna_core_clk = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_NNA_CLK_CNTL,
+		.bit_idx = 24,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "nna_core_clk",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&sm1_nna_core_clk_div.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
 #define MESON_GATE(_name, _reg, _bit) \
 	MESON_PCLK(_name, _reg, _bit, &g12a_clk81.hw)
 
@@ -4779,6 +4886,12 @@ static struct clk_hw_onecell_data sm1_hw_onecell_data = {
 		[CLKID_SPICC1_SCLK_SEL]		= &g12a_spicc1_sclk_sel.hw,
 		[CLKID_SPICC1_SCLK_DIV]		= &g12a_spicc1_sclk_div.hw,
 		[CLKID_SPICC1_SCLK]		= &g12a_spicc1_sclk.hw,
+		[CLKID_NNA_AXI_CLK_SEL]		= &sm1_nna_axi_clk_sel.hw,
+		[CLKID_NNA_AXI_CLK_DIV]		= &sm1_nna_axi_clk_div.hw,
+		[CLKID_NNA_AXI_CLK]		= &sm1_nna_axi_clk.hw,
+		[CLKID_NNA_CORE_CLK_SEL]	= &sm1_nna_core_clk_sel.hw,
+		[CLKID_NNA_CORE_CLK_DIV]	= &sm1_nna_core_clk_div.hw,
+		[CLKID_NNA_CORE_CLK]		= &sm1_nna_core_clk.hw,
 		[NR_CLKS]			= NULL,
 	},
 	.num = NR_CLKS,
@@ -5020,6 +5133,12 @@ static struct clk_regmap *const g12a_clk_regmaps[] = {
 	&g12a_spicc1_sclk_sel,
 	&g12a_spicc1_sclk_div,
 	&g12a_spicc1_sclk,
+	&sm1_nna_axi_clk_sel,
+	&sm1_nna_axi_clk_div,
+	&sm1_nna_axi_clk,
+	&sm1_nna_core_clk_sel,
+	&sm1_nna_core_clk_div,
+	&sm1_nna_core_clk,
 };
 
 static const struct reg_sequence g12a_init_regs[] = {
diff --git a/drivers/clk/meson/g12a.h b/drivers/clk/meson/g12a.h
index a8852556836e..69b6a69549c7 100644
--- a/drivers/clk/meson/g12a.h
+++ b/drivers/clk/meson/g12a.h
@@ -70,6 +70,7 @@
 #define HHI_MALI_CLK_CNTL		0x1b0
 #define HHI_VPU_CLKC_CNTL		0x1b4
 #define HHI_VPU_CLK_CNTL		0x1bC
+#define HHI_NNA_CLK_CNTL		0x1C8
 #define HHI_HDMI_CLK_CNTL		0x1CC
 #define HHI_VDEC_CLK_CNTL		0x1E0
 #define HHI_VDEC2_CLK_CNTL		0x1E4
@@ -259,8 +260,12 @@
 #define CLKID_SPICC0_SCLK_DIV			257
 #define CLKID_SPICC1_SCLK_SEL			259
 #define CLKID_SPICC1_SCLK_DIV			260
+#define CLKID_NNA_AXI_CLK_SEL			262
+#define CLKID_NNA_AXI_CLK_DIV			263
+#define CLKID_NNA_CORE_CLK_SEL			265
+#define CLKID_NNA_CORE_CLK_DIV			266
 
-#define NR_CLKS					262
+#define NR_CLKS					268
 
 /* include the CLKIDs that have been made part of the DT binding */
 #include <dt-bindings/clock/g12a-clkc.h>
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
