Return-Path: <SRS0=dEj7=FA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C77A8C63697
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2020 14:16:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33C1020679
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2020 14:16:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Agze2USb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="gVtPSCQa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33C1020679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vZuckSMI/61XIbNKY/uErUnA+2gAuqVlE6tcxfyfk8E=; b=Agze2USbF5j9oH6wKzNDnAIOf
	fm30e/X38rfooVXXWxkTW4cQjhNd8d5mBv92VH5Ii6mX8Rn/+IUF1xcqJvOpmH1Cnldn2l0hJ1i72
	FI0CCKV/LdSPpy75Xrbtjt0kawox+ajGiKYQtMCGQvUTk//MTdGfVXsFzamCBUgrajtxxsN7BKUfz
	Ex33cwsYFLAcSVyHYqGrrKsyhLGLOqsHht4Y4IzbTRaN/4SLSUK+ESo/B+aSWAtugO+mM0ymY17XB
	+9pFnK94vvS/fe+WI31LrX6xuIoSB54MFv9DuFHHUfJnVdn1Kuib1vc2JXx11h41FyS4N893pMNcE
	nfANJU6Vw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiI4T-0000rv-4C; Thu, 26 Nov 2020 14:16:29 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiI4A-0000lb-30
 for linux-amlogic@lists.infradead.org; Thu, 26 Nov 2020 14:16:12 +0000
Received: by mail-wm1-x343.google.com with SMTP id 1so2559498wme.3
 for <linux-amlogic@lists.infradead.org>; Thu, 26 Nov 2020 06:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tMVgTeO03AHhfaOSmS4teYNEJZSWM7hPB1HU15pX36k=;
 b=gVtPSCQalNvDgr33ts7W1WaWeEMcrGJRwq51W7OCAC9uj3VCBekCCfcLbzwb/8S0zm
 NUD1DrOfqHWkkbKBLKyftCMjuEyeP8yU8ATXGOOjFRoUyWZL6wZ/6dn/inrI834Mx9i3
 SuPNcVzNtodBIqclscIz8iPdzdIAukRemLN1OQN4J7/sW4VMRg91TBHtENsC+pRfsoa3
 4wVd9b4D7BE9eQgMaXglhfjd6YNh16MgNJ+lZXfs+qbQaGKzP1yEkX1BJvEoVE2kdORk
 Ahr45Mh5BFRvrDn0Ek6KeV+eKzEL2fL4KEF4LY/sturMGkDNCBv/zKQhBsVjJOCBiCYR
 bcYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tMVgTeO03AHhfaOSmS4teYNEJZSWM7hPB1HU15pX36k=;
 b=hRh5VEPA/9Ay7b3o6YgxxlHY2j1/Zu3NdxVu1d7Ebsb20jW3aHQKK2bUC2D5Ba0E8O
 DHgYyfVxx+xAxHjiWOzOiswaOHACPgH8zsPjoTkyr6a6UzQMA1T83T/8VjTWcpAyR6CL
 EOA1euqjegmwOdJTvBOLJpdScobqGszwcbMvBujRbTA/IVBaNMjQRfU6I0qbcu/Fsgks
 M/MyuaKha/Y1lc12+lZMC7ooaAVLNLSfBCn31Yf9oIZnZO3KgPbbpYNukXimMQRgIB5N
 Xh+gVouBFrb6fzZfRV6IIAP9tdDyNUwsrf1MeHTWPaI/el5c+g/W8NhkZy5WAdZzeJk4
 GBSA==
X-Gm-Message-State: AOAM533Y5gdAkVGCOi1tll29uM6QI+v4esZMu7SRvAclB+IlL+Df5jI9
 nMzRcPbYHjcOFYqhjlLaLC/FsA==
X-Google-Smtp-Source: ABdhPJzyw6FRZRnhPaXyj5fKgnv9UjDJ2IPRJKrRiF/jQm3EgOpM1u2p5SXBCxI6KRvHok2ByHZ0Qg==
X-Received: by 2002:a1c:61c5:: with SMTP id v188mr3597306wmb.141.1606400168632; 
 Thu, 26 Nov 2020 06:16:08 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:193b:ad82:52ad:936c])
 by smtp.gmail.com with ESMTPSA id q16sm9286079wrn.13.2020.11.26.06.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 06:16:07 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com
Subject: [PATCH v2 2/2] clk: meson: g12a: add MIPI DSI Host Pixel Clock
Date: Thu, 26 Nov 2020 15:16:00 +0100
Message-Id: <20201126141600.2084586-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126141600.2084586-1-narmstrong@baylibre.com>
References: <20201126141600.2084586-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_091610_363738_49E22860 
X-CRM114-Status: GOOD (  16.59  )
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
 drivers/clk/meson/g12a.c | 74 ++++++++++++++++++++++++++++++++++++++++
 drivers/clk/meson/g12a.h |  3 +-
 2 files changed, 76 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 3cb8196c8e29..b080359b4645 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -3658,6 +3658,68 @@ static struct clk_regmap g12a_hdmi_tx = {
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
+		.flags = CLK_SET_RATE_NO_REPARENT,
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
+			&g12a_mipi_dsi_pxclk_sel.hw
+		},
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
+			&g12a_mipi_dsi_pxclk_div.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
 /* HDMI Clocks */
 
 static const struct clk_parent_data g12a_hdmi_parent_data[] = {
@@ -4403,6 +4465,9 @@ static struct clk_hw_onecell_data g12a_hw_onecell_data = {
 		[CLKID_SPICC1_SCLK_SEL]		= &g12a_spicc1_sclk_sel.hw,
 		[CLKID_SPICC1_SCLK_DIV]		= &g12a_spicc1_sclk_div.hw,
 		[CLKID_SPICC1_SCLK]		= &g12a_spicc1_sclk.hw,
+		[CLKID_MIPI_DSI_PXCLK_SEL]	= &g12a_mipi_dsi_pxclk_sel.hw,
+		[CLKID_MIPI_DSI_PXCLK_DIV]	= &g12a_mipi_dsi_pxclk_div.hw,
+		[CLKID_MIPI_DSI_PXCLK]		= &g12a_mipi_dsi_pxclk.hw,
 		[NR_CLKS]			= NULL,
 	},
 	.num = NR_CLKS,
@@ -4658,6 +4723,9 @@ static struct clk_hw_onecell_data g12b_hw_onecell_data = {
 		[CLKID_SPICC1_SCLK_SEL]		= &g12a_spicc1_sclk_sel.hw,
 		[CLKID_SPICC1_SCLK_DIV]		= &g12a_spicc1_sclk_div.hw,
 		[CLKID_SPICC1_SCLK]		= &g12a_spicc1_sclk.hw,
+		[CLKID_MIPI_DSI_PXCLK_SEL]	= &g12a_mipi_dsi_pxclk_sel.hw,
+		[CLKID_MIPI_DSI_PXCLK_DIV]	= &g12a_mipi_dsi_pxclk_div.hw,
+		[CLKID_MIPI_DSI_PXCLK]		= &g12a_mipi_dsi_pxclk.hw,
 		[NR_CLKS]			= NULL,
 	},
 	.num = NR_CLKS,
@@ -4904,6 +4972,9 @@ static struct clk_hw_onecell_data sm1_hw_onecell_data = {
 		[CLKID_NNA_CORE_CLK_SEL]	= &sm1_nna_core_clk_sel.hw,
 		[CLKID_NNA_CORE_CLK_DIV]	= &sm1_nna_core_clk_div.hw,
 		[CLKID_NNA_CORE_CLK]		= &sm1_nna_core_clk.hw,
+		[CLKID_MIPI_DSI_PXCLK_SEL]	= &g12a_mipi_dsi_pxclk_sel.hw,
+		[CLKID_MIPI_DSI_PXCLK_DIV]	= &g12a_mipi_dsi_pxclk_div.hw,
+		[CLKID_MIPI_DSI_PXCLK]		= &g12a_mipi_dsi_pxclk.hw,
 		[NR_CLKS]			= NULL,
 	},
 	.num = NR_CLKS,
@@ -5151,6 +5222,9 @@ static struct clk_regmap *const g12a_clk_regmaps[] = {
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
