Return-Path: <SRS0=nSpp=E5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7C10C56202
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Nov 2020 16:38:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 729122073C
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Nov 2020 16:38:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RJPbMjFO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="bsiVR9Mm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 729122073C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XBov2qqSwOgkqI1NFTp0qS74icP233YlvkNW9td5IIY=; b=RJPbMjFOGspojPDJzUHTCnnS1
	DJTG4rUIjDAmR7zXde0au/7jMWdWq92XTbqT5Nr/54PmqKLP6DB0VyblOwicdA86a9tXHmwDMQtOs
	Mec1AB3QF7ujd83rCsEqupNpwNKFoLSyBMHFuPcj+YoJcLgIKk3KV1rGPyyU0nI+CP630IU3SoPce
	o1wS2T7834ievkDAUMIbqaJrUmjDM3cjuWIHW6aAt2P5UfvgTMrpwZlJealH/mlbpLCSj4HYzZ+hJ
	NrL5I2pNePXFW1+Y620xcX5+UTHQUuGpUJl7yKDT/De9IUisaQ4rhLKrxCmkrl6vBB4RAVf2QveaD
	3rjNaV9Rg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khErM-0000A0-Kr; Mon, 23 Nov 2020 16:38:36 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khEr6-0008Vt-53
 for linux-amlogic@lists.infradead.org; Mon, 23 Nov 2020 16:38:22 +0000
Received: by mail-wr1-x441.google.com with SMTP id r3so928956wrt.2
 for <linux-amlogic@lists.infradead.org>; Mon, 23 Nov 2020 08:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q5avTsDM6MbYbagqqzSLf9X5FFe4EbwFCqAUyBew2Gc=;
 b=bsiVR9MmCxdO/RJoXzPuNvTXPzqEQFYpuHUMbVD9MgKdaYyyTn/aPe67lcdCK8iI3k
 nvAWR8FhlV9qQohIRFS1h5Jv6FflHtusqkR/UemyvZrq0+H97d8J0QnJoxkvezT+GX4O
 1tYnL7PFm4q2jCob+k5rWmq/u3ZPeh8bEwSrlu9mU56NlIihZF820CE0x72MAamiTPAa
 Nplcl2RRe99ds0zofPuReZuonza8ex3LwkY0rlSN8DZLBw9gVx48cy7tR41t0jURrBy/
 stzihb0S3D9uGqKGJp65KkT+IEvz3G/hGzO6oHsyT6Pn43kA2Fp/XLfx/zyJaAQRcmFh
 0uSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q5avTsDM6MbYbagqqzSLf9X5FFe4EbwFCqAUyBew2Gc=;
 b=T1gMSTKzk349KAaznk8+lKVm8C1eJYbaDBV019d9wjHdAzdYbqaIddOgO3cdFePrm8
 7l7iGf+V9Q5oJ2FCJQRcIUZSNVYrouafoitF4INQdURl4Qp0i9p/WiP6GtKaJGtAIUSi
 dfF8TND3HKJ3x1ipAg7edwN1U2wTQkP2EfaTOR+6UtPKDi3KK/NPbeJcKvwV54IbTk5S
 p3G9GLQJAzyoIMxZE3PvGFNRi84RKiDOvXL39XGtDALl32NOfoOyfXaHakKnnUXgfRxf
 BUnwAFQGrrqHmPaDbQ71gnr5/hvVZlgDkgIpeTkCjrIK6iMXWNUXtVhJThCLxHHZ9du7
 rhBQ==
X-Gm-Message-State: AOAM531OGuP1cO5yXHfd1kw4ENk7i7sZVpfE32hNrd4u4BdtClmLku5A
 sjVCwIIJdQt+rqVyIWsURD2sTg==
X-Google-Smtp-Source: ABdhPJx6pAjMpdAe+9714Rlp3PkaN3t2kdqPdj4MSGVV16wLMsTmu04aZ4SPTNOhvLbSm6jE7O4Mcw==
X-Received: by 2002:a5d:6050:: with SMTP id j16mr589970wrt.158.1606149499088; 
 Mon, 23 Nov 2020 08:38:19 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:9541:d2fd:3a68:67ae])
 by smtp.gmail.com with ESMTPSA id l3sm19566386wmf.0.2020.11.23.08.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 08:38:18 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com
Subject: [PATCH 2/2] clk: meson: g12a: add MIPI DSI Host Pixel Clock
Date: Mon, 23 Nov 2020 17:38:11 +0100
Message-Id: <20201123163811.353444-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123163811.353444-1-narmstrong@baylibre.com>
References: <20201123163811.353444-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_113820_437684_4673BBCB 
X-CRM114-Status: GOOD (  15.31  )
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds the MIPI DSI Host Pixel Clock, unlike AXG, the pixel clock can be different
from the VPU ENCL output clock to feed the DSI Host controller with a different clock rate.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/g12a.c | 72 ++++++++++++++++++++++++++++++++++++++++
 drivers/clk/meson/g12a.h |  3 +-
 2 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 3cb8196c8e29..3dedf8408405 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -3658,6 +3658,66 @@ static struct clk_regmap g12a_hdmi_tx = {
 	},
 };
 
+/* MIPI DSI Host Clocks */
+
+static const struct clk_hw *g12a_mipi_dsi_pxclk_parent_hws[] = {
+	&g12a_vid_pll.hw,
+	&g12a_gp0_pll.hw,
+	&g12a_hifi_pll.hw,
+	&g12a_mpll1.hw,
+	&g12a_fclk_div2.hw,
+	&g12a_fclk_div2p5.hw,
+	&g12a_fclk_div3.hw,
+	&g12a_fclk_div7.hw,
+};
+
+static struct clk_regmap g12a_mipi_dsi_pxclk_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_MIPIDSI_PHY_CLK_CNTL,
+		.mask = 0x7,
+		.shift = 12,
+		.flags = CLK_MUX_ROUND_CLOSEST,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "mipi_dsi_pxclk_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_hws = g12a_mipi_dsi_pxclk_parent_hws,
+		.num_parents = ARRAY_SIZE(g12a_mipi_dsi_pxclk_parent_hws),
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap g12a_mipi_dsi_pxclk_div = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_MIPIDSI_PHY_CLK_CNTL,
+		.shift = 0,
+		.width = 7,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "mipi_dsi_pxclk_div",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+					&g12a_mipi_dsi_pxclk_sel.hw },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap g12a_mipi_dsi_pxclk = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_MIPIDSI_PHY_CLK_CNTL,
+		.bit_idx = 8,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "mipi_dsi_pxclk",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+					&g12a_mipi_dsi_pxclk_div.hw },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
 /* HDMI Clocks */
 
 static const struct clk_parent_data g12a_hdmi_parent_data[] = {
@@ -4403,6 +4463,9 @@ static struct clk_hw_onecell_data g12a_hw_onecell_data = {
 		[CLKID_SPICC1_SCLK_SEL]		= &g12a_spicc1_sclk_sel.hw,
 		[CLKID_SPICC1_SCLK_DIV]		= &g12a_spicc1_sclk_div.hw,
 		[CLKID_SPICC1_SCLK]		= &g12a_spicc1_sclk.hw,
+		[CLKID_MIPI_DSI_PXCLK_SEL]	= &g12a_mipi_dsi_pxclk_sel.hw,
+		[CLKID_MIPI_DSI_PXCLK_DIV]	= &g12a_mipi_dsi_pxclk_div.hw,
+		[CLKID_MIPI_DSI_PXCLK]		= &g12a_mipi_dsi_pxclk.hw,
 		[NR_CLKS]			= NULL,
 	},
 	.num = NR_CLKS,
@@ -4658,6 +4721,9 @@ static struct clk_hw_onecell_data g12b_hw_onecell_data = {
 		[CLKID_SPICC1_SCLK_SEL]		= &g12a_spicc1_sclk_sel.hw,
 		[CLKID_SPICC1_SCLK_DIV]		= &g12a_spicc1_sclk_div.hw,
 		[CLKID_SPICC1_SCLK]		= &g12a_spicc1_sclk.hw,
+		[CLKID_MIPI_DSI_PXCLK_SEL]	= &g12a_mipi_dsi_pxclk_sel.hw,
+		[CLKID_MIPI_DSI_PXCLK_DIV]	= &g12a_mipi_dsi_pxclk_div.hw,
+		[CLKID_MIPI_DSI_PXCLK]		= &g12a_mipi_dsi_pxclk.hw,
 		[NR_CLKS]			= NULL,
 	},
 	.num = NR_CLKS,
@@ -4904,6 +4970,9 @@ static struct clk_hw_onecell_data sm1_hw_onecell_data = {
 		[CLKID_NNA_CORE_CLK_SEL]	= &sm1_nna_core_clk_sel.hw,
 		[CLKID_NNA_CORE_CLK_DIV]	= &sm1_nna_core_clk_div.hw,
 		[CLKID_NNA_CORE_CLK]		= &sm1_nna_core_clk.hw,
+		[CLKID_MIPI_DSI_PXCLK_SEL]	= &g12a_mipi_dsi_pxclk_sel.hw,
+		[CLKID_MIPI_DSI_PXCLK_DIV]	= &g12a_mipi_dsi_pxclk_div.hw,
+		[CLKID_MIPI_DSI_PXCLK]		= &g12a_mipi_dsi_pxclk.hw,
 		[NR_CLKS]			= NULL,
 	},
 	.num = NR_CLKS,
@@ -5151,6 +5220,9 @@ static struct clk_regmap *const g12a_clk_regmaps[] = {
 	&sm1_nna_core_clk_sel,
 	&sm1_nna_core_clk_div,
 	&sm1_nna_core_clk,
+	&g12a_mipi_dsi_pxclk_sel,
+	&g12a_mipi_dsi_pxclk_div,
+	&g12a_mipi_dsi_pxclk,
 };
 
 static const struct reg_sequence g12a_init_regs[] = {
diff --git a/drivers/clk/meson/g12a.h b/drivers/clk/meson/g12a.h
index 69b6a69549c7..a97613df38b3 100644
--- a/drivers/clk/meson/g12a.h
+++ b/drivers/clk/meson/g12a.h
@@ -264,8 +264,9 @@
 #define CLKID_NNA_AXI_CLK_DIV			263
 #define CLKID_NNA_CORE_CLK_SEL			265
 #define CLKID_NNA_CORE_CLK_DIV			266
+#define CLKID_MIPI_DSI_PXCLK_DIV		268
 
-#define NR_CLKS					268
+#define NR_CLKS					271
 
 /* include the CLKIDs that have been made part of the DT binding */
 #include <dt-bindings/clock/g12a-clkc.h>
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
