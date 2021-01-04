Return-Path: <SRS0=8AZD=GH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6328EC433E0
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Jan 2021 13:29:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26B87207AE
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Jan 2021 13:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26B87207AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bV9lYB1gOlo9841c76Y6NPbIX67tNdGsWW1O932nsE0=; b=wL27xy2oVCPzH433pNDbnEBrL
	aWIea8YLdpiO8+YlCkPZUCkOm95HfbNVShOgvdmCXylr7TDSceSO9qqnOeLhorhRQ3I9wLnFmVwGu
	9Ssz+4YKrFS50NNjzQyiOESx8KQpwrC1328D8PIxi9QLyDF2uoY8ASlaiyLt48qd2readuAFo0YQH
	x75fzcv0aMy9cMFd9+mdG8oyvyogHL6dSTQ4/07iggaLjSmBIO/j/jexHWRJk4IH6iu4mOLkr8XMa
	Zr30HrZfw7DS8S5qufd0nXNYsHL/+/i7Sr76IpwXZNzLxShI5cQkyBNjs9o0GEFOFWi3UnG2PfYAq
	JaZS747Ug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwPvV-0007DN-HB; Mon, 04 Jan 2021 13:29:37 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwPvC-00074S-1s; Mon, 04 Jan 2021 13:29:22 +0000
Received: by mail-wr1-x431.google.com with SMTP id c5so32158022wrp.6;
 Mon, 04 Jan 2021 05:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W3+FsMu1lbDQIio4q7FHNE16t5hT0RLiFsiQpXFdTmY=;
 b=sqHg7vBu1o3BP2QxT91WFHqL2g78BS1u6AhfTN1DAkUWS/9BRZESyjjDNMxwDMnVyf
 6h6WgnhWuLJysE321kCGfYiOs8lrr21ar0YGTec0NMno+kiNkA/+Pd3gXb6tBEmqtApu
 n/CuH3vijrjaJTYWLSdTyZrIVYyiQr9u8ev/MQJDalyMxaUhwom/w45rR8ZmXWKmyh/r
 Q7t4lJiexvj7GMPUg5mJjgwSD+E7nbahizVC/ypNXgl+F31hseHKX5vJsrCehEY+7pr+
 TS4fHpgEe5UOhq1/S38ee4GQsvTRIy+RouigMdbidLUKavr640bEEgsyeth/inzAUupV
 3zWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W3+FsMu1lbDQIio4q7FHNE16t5hT0RLiFsiQpXFdTmY=;
 b=DaawXFj83MTEUJmqV6Oy0fpBI7iQxKuKEqnMiTHN0JLEI62QhSuefNcLi5aGaanzCT
 EB//hchPMQgk4BArMyXDfrtQiGRYyQa4/SSX3vMR18UYcnq5FbceYItDShKurGubzHTK
 NsypdY1cVl9XitKO3ciEcJJJyIwpHGq2LyA3fFyqQ67JG5/FmnXk1H6Mze1CFvgHLtcT
 Uu0vy+0pw/hgLpuZMTysBi7LQ+VM5VDBSzj8uNrnj2v8SZfciiHRhUsjLmx3jBGrqWtZ
 fghEZc5jXdmE4WY0g3hvSOxeW4r+y9eJ3hc8kW+ljLT12iy4XJehMovFvlOnKDWgOgql
 EL6w==
X-Gm-Message-State: AOAM53061MgYAh0wtC19fV+l6g7JQdJInDUG3PGAh2PnpDcpNp5e77tC
 /iBF0jB9QQGplC/Y/S7VEk0=
X-Google-Smtp-Source: ABdhPJwr2OufeuaiYtWIqCrZpai6io4a/I1J3LEe+4dG378mGHo/Cv0TSdnz6GxnNT8ny39ULqVJuQ==
X-Received: by 2002:a5d:42d0:: with SMTP id t16mr80111924wrr.230.1609766956653; 
 Mon, 04 Jan 2021 05:29:16 -0800 (PST)
Received: from localhost.localdomain
 (p200300f13724fd00428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:3724:fd00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id c4sm99916521wrw.72.2021.01.04.05.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 05:29:16 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: jbrunet@baylibre.com,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 5/5] clk: meson: meson8b: add the vid_pll_lvds_en gate clock
Date: Mon,  4 Jan 2021 14:28:06 +0100
Message-Id: <20210104132806.720558-6-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210104132806.720558-1-martin.blumenstingl@googlemail.com>
References: <20210104132806.720558-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_082918_155415_D1F7F8AD 
X-CRM114-Status: GOOD (  15.87  )
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
Cc: sboyd@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

HHI_VID_DIVIDER_CNTL[11] must be enabled for the video clock tree to
work. This bit is described as "LVDS_CLK_EN". It is not 100% clear where
this bit has to be placed in the hierarchy. But since the "LVDS_OUT" of
the HDMI PLL uses it's own set of registers it's more likely that this
"LVDS_CLK_EN" bit actually enables the input of the "hdmi_pll_lvds_out"
clock to the "vid_pll_in_sel" tree.

Add a gate definition for this bit (which will not be exported) so that
the kernel can manage all required bits to enable and disable the video
clocks.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.c | 23 ++++++++++++++++++++++-
 drivers/clk/meson/meson8b.h |  3 ++-
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 8061c11389a9..450579779de0 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -1068,6 +1068,23 @@ static struct clk_regmap meson8b_l2_dram_clk_gate = {
 	},
 };
 
+/* also called LVDS_CLK_EN */
+static struct clk_regmap meson8b_vid_pll_lvds_en = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_VID_DIVIDER_CNTL,
+		.bit_idx = 11,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "vid_pll_lvds_en",
+		.ops = &clk_regmap_gate_ro_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_hdmi_pll_lvds_out.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
 static struct clk_regmap meson8b_vid_pll_in_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = HHI_VID_DIVIDER_CNTL,
@@ -1084,7 +1101,7 @@ static struct clk_regmap meson8b_vid_pll_in_sel = {
 		 * Meson8m2: vid2_pll
 		 */
 		.parent_hws = (const struct clk_hw *[]) {
-			&meson8b_hdmi_pll_lvds_out.hw
+			&meson8b_vid_pll_lvds_en.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -2954,6 +2971,7 @@ static struct clk_hw_onecell_data meson8_hw_onecell_data = {
 		[CLKID_CTS_MCLK_I958_DIV]   = &meson8b_cts_mclk_i958_div.hw,
 		[CLKID_CTS_MCLK_I958]	    = &meson8b_cts_mclk_i958.hw,
 		[CLKID_CTS_I958]	    = &meson8b_cts_i958.hw,
+		[CLKID_VID_PLL_LVDS_EN]	    = &meson8b_vid_pll_lvds_en.hw,
 		[CLK_NR_CLKS]		    = NULL,
 	},
 	.num = CLK_NR_CLKS,
@@ -3171,6 +3189,7 @@ static struct clk_hw_onecell_data meson8b_hw_onecell_data = {
 		[CLKID_CTS_MCLK_I958_DIV]   = &meson8b_cts_mclk_i958_div.hw,
 		[CLKID_CTS_MCLK_I958]	    = &meson8b_cts_mclk_i958.hw,
 		[CLKID_CTS_I958]	    = &meson8b_cts_i958.hw,
+		[CLKID_VID_PLL_LVDS_EN]	    = &meson8b_vid_pll_lvds_en.hw,
 		[CLK_NR_CLKS]		    = NULL,
 	},
 	.num = CLK_NR_CLKS,
@@ -3390,6 +3409,7 @@ static struct clk_hw_onecell_data meson8m2_hw_onecell_data = {
 		[CLKID_CTS_MCLK_I958_DIV]   = &meson8b_cts_mclk_i958_div.hw,
 		[CLKID_CTS_MCLK_I958]	    = &meson8b_cts_mclk_i958.hw,
 		[CLKID_CTS_I958]	    = &meson8b_cts_i958.hw,
+		[CLKID_VID_PLL_LVDS_EN]	    = &meson8b_vid_pll_lvds_en.hw,
 		[CLK_NR_CLKS]		    = NULL,
 	},
 	.num = CLK_NR_CLKS,
@@ -3588,6 +3608,7 @@ static struct clk_regmap *const meson8b_clk_regmaps[] = {
 	&meson8b_cts_mclk_i958_div,
 	&meson8b_cts_mclk_i958,
 	&meson8b_cts_i958,
+	&meson8b_vid_pll_lvds_en,
 };
 
 static const struct meson8b_clk_reset_line {
diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
index b1a5074cf148..954d97cf6c5a 100644
--- a/drivers/clk/meson/meson8b.h
+++ b/drivers/clk/meson/meson8b.h
@@ -182,8 +182,9 @@
 #define CLKID_CTS_MCLK_I958_DIV	211
 #define CLKID_VCLK_EN		214
 #define CLKID_VCLK2_EN		215
+#define CLKID_VID_PLL_LVDS_EN	216
 
-#define CLK_NR_CLKS		216
+#define CLK_NR_CLKS		217
 
 /*
  * include the CLKID and RESETID that have
-- 
2.30.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
