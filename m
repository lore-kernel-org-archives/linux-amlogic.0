Return-Path: <SRS0=A3X0=MF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ECF3C07E95
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jul 2021 23:25:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E4446135A
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jul 2021 23:25:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E4446135A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sXbAh41FkOU64ddk97Ns1FyCRItqCHgxOGJC5yK/29c=; b=qJYd3nOcslHOlr
	cMTILrumr34JrXTc/x1HZWC+yfaHcrz7oAP4KaSCvkpcVgz22mWDzypDhSUdhgORuoi23B0bxOp9R
	nl+DzSckxIJ+kYkju+Yf8/MVX4MvOjcrOKJ4sbYH/HPLDMhEX25xd7LCQ3u8rCbZ00RBh9x4zhqYp
	cKEGZkjg1cK8rZbpg98urQybgsfdzN3zu7DM/tG90K+VRr0o4eYnlF291R6XBLK9kL2OlO3FUVc1j
	z8t1axxf5QFHt19rnmREI68N0yAofxybVJUWDEUYUoSMzdtpWLh25QYMwJ1PM6QxSGKNAEwDRg54/
	w1jR+tX5UslGi8y6VR3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3Rmh-00Bbls-H9; Tue, 13 Jul 2021 23:25:51 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3RmC-00BbXQ-Iu; Tue, 13 Jul 2021 23:25:22 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 u8-20020a7bcb080000b02901e44e9caa2aso228477wmj.4; 
 Tue, 13 Jul 2021 16:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wn4OGffmG6CAMF74sT7Jiq6EaKRXD5BwqoAMkg2t0q8=;
 b=hGeIswUtxXdk4lABeE/3QfZKpbiuJl6XItJJjxK5X7pUg19zVM7REeo5atNckOTe/x
 Rj+r3IZj65gtheQX/flGPczAyhnQ5x1jF8XCFHnRWM1hJ4AF/CwDpzfIUHy1N4no0BOs
 k2RuP02FkJdqwoP+NXafsZHMohytpFOgKL7F7sIZUhBmHjJ5rq4niSfbM+ockDolWD+H
 fhOZp+qE50GVZin6JLz8RT0okllh1IyI9w1m6v5dt4tKsxcr7s2uKmrSwiXmPezAhS6i
 Cv+bLMyPHzUd4zUSe62chmDjo35/OFeKfzEV3r8AwkQ+NwYVtyRQKWvzK9IZtP8uyDze
 ze+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wn4OGffmG6CAMF74sT7Jiq6EaKRXD5BwqoAMkg2t0q8=;
 b=k0Dz6jfc34eFKcBU4R7jwfHFqE9qzlMqDSSE0coWGMIBVgvyOG27EfN8VhPvB0eY0K
 MUw8kpMPLVWhCfA1M6vfX3kngO2ZsrQloMwytyMIXtK0nRNlpU1qcyKqjFTzq3nNs05e
 8vlbZjro3V7VaIt3U+mImayZpi8eEstQeonySAB+oTjR4ExPN1SR8hRGCzmbN7nWWCxU
 2Mxm97c6MnnSQU5IZCPun82aZZkLov7QPQLe2vKOyFwx60gmTxXQyBQqhX6z46GwvLEP
 KZOa1QoO14YwM7TPsXdj/3tHl6Dm2d3yicXqtY+jNct+hJnwSligg34jaVjyM/XHylEe
 cNuA==
X-Gm-Message-State: AOAM530xK9NSmZeJrIdm9HHJtxFBqRZvEo7RMyBPDUYIzvezTqIbRapO
 K3iAnBPPgIcDsx19bwZprfgxEPbMQ6E=
X-Google-Smtp-Source: ABdhPJx7MHybO2+5HQU6G9cFXw5IqIWhFj0v7z3R1gin1s+N0glBMLNzht0s4MXDqWfcwQSqZj1VKw==
X-Received: by 2002:a7b:c958:: with SMTP id i24mr620521wml.177.1626218718929; 
 Tue, 13 Jul 2021 16:25:18 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a01-0c23-c041-6f00-f22f-74ff-fe21-0725.c23.pool.telefonica.de.
 [2a01:c23:c041:6f00:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id o11sm3857390wmc.2.2021.07.13.16.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 16:25:18 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, jbrunet@baylibre.com, narmstrong@baylibre.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 2/6] clk: meson: meson8b: Add the vid_pll_lvds_en gate clock
Date: Wed, 14 Jul 2021 01:25:06 +0200
Message-Id: <20210713232510.3057750-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210713232510.3057750-1-martin.blumenstingl@googlemail.com>
References: <20210713232510.3057750-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_162520_663106_40BA0086 
X-CRM114-Status: GOOD (  15.96  )
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
index 0f8bd707217a..9ccffbfe44e5 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -1045,6 +1045,23 @@ static struct clk_regmap meson8b_l2_dram_clk_gate = {
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
@@ -1061,7 +1078,7 @@ static struct clk_regmap meson8b_vid_pll_in_sel = {
 		 * Meson8m2: vid2_pll
 		 */
 		.parent_hws = (const struct clk_hw *[]) {
-			&meson8b_hdmi_pll_lvds_out.hw
+			&meson8b_vid_pll_lvds_en.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -2905,6 +2922,7 @@ static struct clk_hw_onecell_data meson8_hw_onecell_data = {
 		[CLKID_CTS_MCLK_I958_DIV]   = &meson8b_cts_mclk_i958_div.hw,
 		[CLKID_CTS_MCLK_I958]	    = &meson8b_cts_mclk_i958.hw,
 		[CLKID_CTS_I958]	    = &meson8b_cts_i958.hw,
+		[CLKID_VID_PLL_LVDS_EN]	    = &meson8b_vid_pll_lvds_en.hw,
 		[CLK_NR_CLKS]		    = NULL,
 	},
 	.num = CLK_NR_CLKS,
@@ -3122,6 +3140,7 @@ static struct clk_hw_onecell_data meson8b_hw_onecell_data = {
 		[CLKID_CTS_MCLK_I958_DIV]   = &meson8b_cts_mclk_i958_div.hw,
 		[CLKID_CTS_MCLK_I958]	    = &meson8b_cts_mclk_i958.hw,
 		[CLKID_CTS_I958]	    = &meson8b_cts_i958.hw,
+		[CLKID_VID_PLL_LVDS_EN]	    = &meson8b_vid_pll_lvds_en.hw,
 		[CLK_NR_CLKS]		    = NULL,
 	},
 	.num = CLK_NR_CLKS,
@@ -3341,6 +3360,7 @@ static struct clk_hw_onecell_data meson8m2_hw_onecell_data = {
 		[CLKID_CTS_MCLK_I958_DIV]   = &meson8b_cts_mclk_i958_div.hw,
 		[CLKID_CTS_MCLK_I958]	    = &meson8b_cts_mclk_i958.hw,
 		[CLKID_CTS_I958]	    = &meson8b_cts_i958.hw,
+		[CLKID_VID_PLL_LVDS_EN]	    = &meson8b_vid_pll_lvds_en.hw,
 		[CLK_NR_CLKS]		    = NULL,
 	},
 	.num = CLK_NR_CLKS,
@@ -3539,6 +3559,7 @@ static struct clk_regmap *const meson8b_clk_regmaps[] = {
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
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
