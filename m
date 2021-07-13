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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6451C07E95
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jul 2021 23:26:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BA5B61363
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jul 2021 23:26:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BA5B61363
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b48GJGa4Bn8MZUMOPAPCdMbTATaIw8sgpmGE6cnElnY=; b=Ea/KOF1m79De1N
	vU9wybeCvhpRlcuhvsuhu0qDAVWGI+8UPThlkBLfkzw2HnMlw5CqrNW2Fnk2qZIlgEAlPAHon307f
	HKVvDZxT5ay24B9jmPQrKAG803cMswIqkfYfvjgbIUWXK46Iucdo9kIAzFZS1H+k87IrQY7U/sp/x
	lIhW8pQKr3rsErgsa/wUH5sMDNMVMhzwxE8LyY4z7cwLFeSwvDF2v2IHStZUxTNrPpm+xyF9HtomI
	EOIifqRBABd1Jw0hQNnG+sNwAD97m9yoJOMJ2aqmBRgW4v0Is0u9Owa89fj+LPI4XB5qQQPB1W1Xq
	BtxVpUAJucyy1cftHLVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3RnC-00Bc17-Ld; Tue, 13 Jul 2021 23:26:22 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3RmD-00BbY6-L1; Tue, 13 Jul 2021 23:25:23 +0000
Received: by mail-wm1-x334.google.com with SMTP id
 g8-20020a1c9d080000b02901f13dd1672aso2510522wme.0; 
 Tue, 13 Jul 2021 16:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4JrGSncq/ZoKsZ5RmvW1qbgMWVf9mtJV8c5EGQVqKxQ=;
 b=N1M0rzyrq9j2HDdk4j6Ta817U9M8kBiztI4LEMyjqBOOz88OkfXdf9akTk/ETww5QS
 zjVmpzlo590/rdNVBENgU0G7NoFI/ivyufPRvA3PZwH18PHLdSyO8KCeSek2I4VZF+bX
 bPYX6bmuy3aMC8bwBSGfIF5oSEBySGBG+9PyCaPIpudoT0Ob08mr/RHCV8rcp7SzwdB2
 6hgHjd4yz8+hx+JPLUKr1drRF+07z7MAwBImlHhY3UuOhhGr9mIGD1pE40CnD2K68toR
 2R4n1G2UKmA25IwN+1z7UVxP1RsyhSfBN5KIHiumF8YLG+GmQzJqMOCbZw8MF0vcCHfn
 vPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4JrGSncq/ZoKsZ5RmvW1qbgMWVf9mtJV8c5EGQVqKxQ=;
 b=fKaAi4hhjBN0Z/fpaOUj2ogtJrdSPn+4wOVtBm85lTctutEnrh78mWoyKzxok5h/TZ
 uSRwMRJRB7BpG4jEiD4uTMatoaTST2q1VsYeC9Mz4Os+p4uRkgPH8HcolncLXsL+lUL0
 uIUQlVU3xAw/7RG/QcE1gWOseRBw7toxoBUFYlXNevRf0MvWxExdQyuz5t3dXfg2oF3s
 wv/n8gUkZ63atOVPYIPudYoZRVwkdNVoDM7/GgwLhdXoQcn+hpsxMrUjJ/+DxMJ+64xp
 LwWmSufEULmu8cHPeIH8bYhvsXIJgmAbBLcfwuUSa6BMteDZLo7ji6XD5zXyDK++QFPJ
 S//Q==
X-Gm-Message-State: AOAM533wGpOR4CvgFhN393KtDW12R0A1HULUGoGHYf3rv77xZT+zz75v
 KL6Tjw5fLUE7+WY1wTDdtjONP8HpU4k=
X-Google-Smtp-Source: ABdhPJzcmbwBzGHTwnqFA0fOTIAo/AwQJKkj0EQsHW9WdGL+gfDWz0tghKFRRnz5CAAV3id5qRn6jg==
X-Received: by 2002:a7b:c096:: with SMTP id r22mr669303wmh.186.1626218720276; 
 Tue, 13 Jul 2021 16:25:20 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a01-0c23-c041-6f00-f22f-74ff-fe21-0725.c23.pool.telefonica.de.
 [2a01:c23:c041:6f00:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id o11sm3857390wmc.2.2021.07.13.16.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 16:25:20 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, jbrunet@baylibre.com, narmstrong@baylibre.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 4/6] clk: meson: meson8b: Initialize the HDMI PLL registers
Date: Wed, 14 Jul 2021 01:25:08 +0200
Message-Id: <20210713232510.3057750-5-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210713232510.3057750-1-martin.blumenstingl@googlemail.com>
References: <20210713232510.3057750-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_162521_721933_B0C1719B 
X-CRM114-Status: GOOD (  20.56  )
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

Add the reg_sequence to initialize the HDMI PLL with the settings for
a video mode that doesn't require PLL internal clock doubling. These
settings are taken from the 3.10 vendor kernel's driver for the 2970MHz
PLL setting used for the 1080P video mode. This puts the PLL into a
defined state and the Linux kernel can take over.
While not all bits for this PLL are implemented using these "defaults"
and then applying M, N and FRAC seems to work fine.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.c | 40 +++++++++++++++++++++++++++++++++----
 drivers/clk/meson/meson8b.h | 13 +++++++++++-
 2 files changed, 48 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 8f29d26ed726..21bc29455f0d 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -118,6 +118,35 @@ static struct clk_regmap meson8b_fixed_pll = {
 	},
 };
 
+static struct clk_fixed_factor hdmi_pll_dco_in = {
+	.mult = 2,
+	.div = 1,
+	.hw.init = &(struct clk_init_data){
+		.name = "hdmi_pll_dco_in",
+		.ops = &clk_fixed_factor_ops,
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "xtal",
+			.index = -1,
+		},
+		.num_parents = 1,
+	},
+};
+
+/*
+ * Taken from the vendor driver for the 2970/2975MHz (both only differ in the
+ * FRAC part in HHI_VID_PLL_CNTL2) where these values are identical for Meson8,
+ * Meson8b and Meson8m2. This doubles the input (or output - it's not clear
+ * which one but the result is the same) clock. The vendor driver additionally
+ * has the following comment about: "optimise HPLL VCO 2.97GHz performance".
+ */
+static const struct reg_sequence meson8b_hdmi_pll_init_regs[] = {
+	{ .reg = HHI_VID_PLL_CNTL2,	.def = 0x69c84000 },
+	{ .reg = HHI_VID_PLL_CNTL3,	.def = 0x8a46c023 },
+	{ .reg = HHI_VID_PLL_CNTL4,	.def = 0x4123b100 },
+	{ .reg = HHI_VID_PLL_CNTL5,	.def = 0x00012385 },
+	{ .reg = HHI_VID2_PLL_CNTL2,	.def = 0x0430a800 },
+};
+
 static const struct pll_params_table hdmi_pll_params_table[] = {
 	PLL_PARAMS(40, 1),
 	PLL_PARAMS(42, 1),
@@ -172,15 +201,15 @@ static struct clk_regmap meson8b_hdmi_pll_dco = {
 			.width   = 1,
 		},
 		.table = hdmi_pll_params_table,
+		.init_regs = meson8b_hdmi_pll_init_regs,
+		.init_count = ARRAY_SIZE(meson8b_hdmi_pll_init_regs),
 	},
 	.hw.init = &(struct clk_init_data){
 		/* sometimes also called "HPLL" or "HPLL PLL" */
 		.name = "hdmi_pll_dco",
 		.ops = &meson_clk_pll_ro_ops,
-		.parent_data = &(const struct clk_parent_data) {
-			.fw_name = "xtal",
-			.name = "xtal",
-			.index = -1,
+		.parent_hws = (const struct clk_hw *[]) {
+			&hdmi_pll_dco_in.hw
 		},
 		.num_parents = 1,
 	},
@@ -2945,6 +2974,7 @@ static struct clk_hw_onecell_data meson8_hw_onecell_data = {
 		[CLKID_CTS_MCLK_I958]	    = &meson8b_cts_mclk_i958.hw,
 		[CLKID_CTS_I958]	    = &meson8b_cts_i958.hw,
 		[CLKID_VID_PLL_LVDS_EN]	    = &meson8b_vid_pll_lvds_en.hw,
+		[CLKID_HDMI_PLL_DCO_IN]	    = &hdmi_pll_dco_in.hw,
 		[CLK_NR_CLKS]		    = NULL,
 	},
 	.num = CLK_NR_CLKS,
@@ -3163,6 +3193,7 @@ static struct clk_hw_onecell_data meson8b_hw_onecell_data = {
 		[CLKID_CTS_MCLK_I958]	    = &meson8b_cts_mclk_i958.hw,
 		[CLKID_CTS_I958]	    = &meson8b_cts_i958.hw,
 		[CLKID_VID_PLL_LVDS_EN]	    = &meson8b_vid_pll_lvds_en.hw,
+		[CLKID_HDMI_PLL_DCO_IN]	    = &hdmi_pll_dco_in.hw,
 		[CLK_NR_CLKS]		    = NULL,
 	},
 	.num = CLK_NR_CLKS,
@@ -3383,6 +3414,7 @@ static struct clk_hw_onecell_data meson8m2_hw_onecell_data = {
 		[CLKID_CTS_MCLK_I958]	    = &meson8b_cts_mclk_i958.hw,
 		[CLKID_CTS_I958]	    = &meson8b_cts_i958.hw,
 		[CLKID_VID_PLL_LVDS_EN]	    = &meson8b_vid_pll_lvds_en.hw,
+		[CLKID_HDMI_PLL_DCO_IN]	    = &hdmi_pll_dco_in.hw,
 		[CLK_NR_CLKS]		    = NULL,
 	},
 	.num = CLK_NR_CLKS,
diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
index 954d97cf6c5a..b5b591943e80 100644
--- a/drivers/clk/meson/meson8b.h
+++ b/drivers/clk/meson/meson8b.h
@@ -51,6 +51,16 @@
 #define HHI_SYS_PLL_CNTL		0x300 /* 0xc0 offset in data sheet */
 #define HHI_VID_PLL_CNTL		0x320 /* 0xc8 offset in data sheet */
 #define HHI_VID_PLL_CNTL2		0x324 /* 0xc9 offset in data sheet */
+#define HHI_VID_PLL_CNTL3		0x328 /* 0xca offset in data sheet */
+#define HHI_VID_PLL_CNTL4		0x32c /* 0xcb offset in data sheet */
+#define HHI_VID_PLL_CNTL5		0x330 /* 0xcc offset in data sheet */
+#define HHI_VID_PLL_CNTL6		0x334 /* 0xcd offset in data sheet */
+#define HHI_VID2_PLL_CNTL		0x380 /* 0xe0 offset in data sheet */
+#define HHI_VID2_PLL_CNTL2		0x384 /* 0xe1 offset in data sheet */
+#define HHI_VID2_PLL_CNTL3		0x388 /* 0xe2 offset in data sheet */
+#define HHI_VID2_PLL_CNTL4		0x38c /* 0xe3 offset in data sheet */
+#define HHI_VID2_PLL_CNTL5		0x390 /* 0xe4 offset in data sheet */
+#define HHI_VID2_PLL_CNTL6		0x394 /* 0xe5 offset in data sheet */
 
 /*
  * MPLL register offeset taken from the S905 datasheet. Vendor kernel source
@@ -183,8 +193,9 @@
 #define CLKID_VCLK_EN		214
 #define CLKID_VCLK2_EN		215
 #define CLKID_VID_PLL_LVDS_EN	216
+#define CLKID_HDMI_PLL_DCO_IN   217
 
-#define CLK_NR_CLKS		217
+#define CLK_NR_CLKS		218
 
 /*
  * include the CLKID and RESETID that have
-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
