Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C80A3C77B7C
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Jul 2025 16:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oS6OuWvUfPyD7JbotUiOzSBriCrPnRRexPHv3ehnxkc=; b=BRsk2joXMG1vkm
	DwUTipRdc/5oBJIPzQJWdAVRUhkRB1rKyxyq3LtdQxO767/PzuDavgFmgg9egj9QYy35L1EepLVPe
	F9VkZSXiwLsxTjJmXOwGyY0ALt/Q+Zz0+zSls3doVs/TogepwTARQ8U/DdMCqPmAnPXl49nMLNh8r
	ik3c0AivymR4IhxVl9toOw3Q4lgiut9m6PY+d3UiUMSMronrbjobWjHQ/gKx8OVqjp6DeBG9xVhCn
	LMP52lp3jFOLcCmzSaBcD8Bs92jHCtMaEzyatNdCji61Ps4S/AbvWKNvWdzeL1fNCg/SOn46ApERl
	ro8xelghwHsHCA+J5Xyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0VB-00000008zI5-3DHr;
	Wed, 02 Jul 2025 16:40:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzMx-00000008mwY-2AoC
	for linux-amlogic@bombadil.infradead.org;
	Wed, 02 Jul 2025 15:27:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=2gK5w/SU70bgPzrjySAkWpDaffQt0ydN/UE80qwpHaY=; b=GUEf8bJVH6cnkIexLHSsd4MUVy
	lT3L/1n1Obc4Rh8DFR+PMUnSqJhBDp4IOB+biq5i6fyPODfC5gaot/yZVmvv5B7pVbtKUI0G3T4iZ
	CXigjqXXYw4ibK78vN7vhdZS5mHmQMcuOLQBM1XA07HgXVvTL3XU1TmmSKpebItTxG+Xb9a9Hban9
	r8gNCZY9GMeZIJJW8eRLb8mpBEBCHH4Tslr1TTa0fHuoR8ftBKa9gEC6AvJXWiwKPC+6EGjIm3Iw6
	X7yeKltvVUOKbvbTaCowzh0DutpoEpfEvS+krwIXrZ4On15GvUiTxkjttG29lPtidqVcbeG/vV+xj
	rKD2mPNQ==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzMu-00000007TpD-32Da
	for linux-amlogic@lists.infradead.org;
	Wed, 02 Jul 2025 15:27:30 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-453398e90e9so38110575e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 02 Jul 2025 08:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751470047; x=1752074847; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2gK5w/SU70bgPzrjySAkWpDaffQt0ydN/UE80qwpHaY=;
        b=VfeJJMEwWCpUiSdks8AZQXXFlQ9i+fFlp0rV7uME1aw7kw8KSznS1mIICB8Ve1asRV
         o9FDBVRNYmKWcL04CxfclvS/6Q+s7s9Szm8hJNkuMNKBnylm83L/VROjLKQdiKZSmEuP
         J3Yqj0wX5CuZc7LzTa7B0Ue3g1wB3HEEpBOO6IgiCqb3oj2Ky35piuKxDRbXq61Hv07q
         wlt8iwRawZH2f9hO1F52TIAb+8DBVr2BtrTiB/WO0IOB0TmUsNDE9FU/PyEpQL2qDtfZ
         8qudfQ9TwYPBx1fDm1qAmuSCWFHkt0VPduACdOegODbEP0tKg1ZSTTrefUa3u/DdDrpD
         +MMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470047; x=1752074847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2gK5w/SU70bgPzrjySAkWpDaffQt0ydN/UE80qwpHaY=;
        b=ZeR1AFPaK4T3Cq5QAjTHOFX0KYFh+7MDlHYkpzl6KfIUM4I+E0vDPCWAPNVjHOhu7V
         dmPQC1mnQ7oYV/Lmj3Lnc8QNXaRHyWWsJg1H94aPLYxTXjiZm9qWx3HmoQO+rH35wS5D
         hsKBsK7WeQMFnfOwhB8dhg8gQHY8OTif1+q30c7zLbYzOiogt9fCrgNULDtyaiuJA8iY
         exy393XDWlprZfiFUd6LyMI+ffKeq4XwqbkP4xhP07511I6iRBwfmJnJC4sNIqeAvr/s
         KbgYC7GwNP87cYhvHln5q8wiZkKW+o4wJW+I/6Vb97D37gc6BSeKcrdaRLffSusx4Eds
         hRNg==
X-Gm-Message-State: AOJu0YwaFBe259WE+4KqdizXkgkF7I+lYYzwO2hKQYC0IF6JzK1F6Dkx
	/uOV8J72aOJNueXQ6FI3n1Ju/DQETVfaeF5nhynWnWMHTuzuEl7H4OMIfgaLkONLy48=
X-Gm-Gg: ASbGncs8dB7pE89R3QgRLosJU8Ndx6niqCBjZjNNzIl89o5hXLs0gaPPBOeejrGgCt+
	l2vuoF3hlV+9rOqbcYqaK7sS6Q9VvDk8QBELBiopr1fvGEr5Q6NiWq7xJqUFp9EBALl1XcgM/lP
	IZHSvNqn9OiV6r7I2FMgoauC33o9whsyb7mJodVtv/3YBDxAk+fjsez1/D46Sy94U93CHn22nOT
	bG3zQRuzbmfNwQtPzhHpaFSeP0swQtN8yZin75TIIc2SWhp4XxNjWHaQnNq8a/S3ICrRG97WXDd
	+KlXM1tVoBt+6jeZsSM19HYOh2yj/7b6HcaLB+Uu98JZFUg3nYswv3NTEz+R8DXNw+PbVvsgLWC
	Q
X-Google-Smtp-Source: AGHT+IFL/9/lkIgAqJj7Ak4tUb6JNbD+DaFRi6G1+U3dIDUNhCg8o+8TqiTvUJvN9NilK2wzt8ulmw==
X-Received: by 2002:a05:600c:3488:b0:43b:ce36:7574 with SMTP id 5b1f17b1804b1-454a9c70d55mr1120225e9.11.1751470047490;
        Wed, 02 Jul 2025 08:27:27 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:5542:4bad:e07b:9489])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454a9bcf35csm869205e9.20.2025.07.02.08.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 08:27:26 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 02 Jul 2025 17:26:11 +0200
Subject: [PATCH 13/26] clk: amlogic: s4-pll: naming consistency alignment
MIME-Version: 1.0
Message-Id: <20250702-meson-clk-cleanup-24-v1-13-e163c9a1fc21@baylibre.com>
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5678; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=dC9fR8dCdw4MCQUXs1TojL+gHHZbG5T/NoHzphabgSQ=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoZU/Cb4CPYZbTpqqMqeEnIIzKTx98YsF4CpOXs
 g22PqNoH+qJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaGVPwgAKCRDm/A8cN/La
 hbj3D/9AlTWRQKxJvRMqH0OwhcZmalTSE/pG2jXaJzmTrcfcgpDcCzFzXAxcZuDxcyUcN6g9ttK
 6bwS1tayEcEjBu/LXNB03lvhsWpqQoPWhDDhzTteUghXJ9yHuRF+9ZwWkHn+IM89yvK6YN7BqsY
 kGusxRPWqn2zCm46iXxQGOAfD5dX8kfjZ8DoDgubSsQNzxIy5z3yH/3W+uDJWigcyPr9qRhG167
 JzC4heYPQAKRfNKmBUIidV+ZBWtXkWPAG/+J03isGCff0MrDpl0C7ADP4gTmbcBEJsqEsN/mgrL
 qigVFg4POSi7VUbqP3x3XtKbGqu441Y7s4ZNz1QxrStvwkKlywplK2bYlj/siFgODuD8uqoaZIW
 FMo+S6wD95tNtE0Ctlvefq4iFQcLC3UM+KrEhyWuzTYJj2Gh5975BlJf2dQZqwCz9eYBldWc1XU
 3vtKQ4ZXLxK+4Kfdsn/gFDzqoysdpSElhbpiC0OPgxTnx9ZmC/MMV7i13vfVFZiJKEuv/26x0Sc
 U/rxZbo6DqStQSxWXQ23/xcAjbyt3ek7ugPVE3iYizo6X1nUK6XD5P4TGkOKifIpo5napvHp7dl
 JxZLEVlonS2j27OeI5/I1wWDVW7jDzo0EaK2sA1vSPfzQpCFHDCE+B1/F9rDozcGbBEOJxLD2gQ
 HUlXyDIhr1HhK+g==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_162728_906065_E92375DE 
X-CRM114-Status: GOOD (  15.81  )
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

Amlogic clock controller drivers are all doing the same thing, more or
less. Yet, over the years, tiny (and often pointless) differences have
emerged.

This makes reviews more difficult, allows some errors to slip through and
make it more difficult to exploit SoC commonalities, leading to code
duplication.

This change enforce, wherever possible, a consistent and predictable scheme
when it comes to code organisation and naming, The scheme chosen is what
was used the most already, to try and minimise the size of the ugly
resulting diff. Here are some of the rules applied:
- Aligning clock names, variable names and IDs.
  - ID cannot change (used in DT)
  - Variable names w/ SoC name prefixes
  - Clock names w/o SoC name prefixes, except pclks for historic reasons
- Composite clock systematic naming : mux: X_sel, div:X_div, gate:X
- Parent table systematically named with the same name as the clock and
  a '_parents' suffix
- Group various tables next to the related clock
- etc ...

Doing so removes what would otherwise show up as unrelated diff in
following changes. It will allow to introduce common definitions for
peripheral clocks, probe helpers, composite clocks, etc ... making further
review and maintenance easier.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/s4-pll.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/meson/s4-pll.c b/drivers/clk/meson/s4-pll.c
index 3d689d2f003e21658016b84918bf1b7b1954c05a..6a266bcafd6257937c1de50cbc5606dcc6f8207b 100644
--- a/drivers/clk/meson/s4-pll.c
+++ b/drivers/clk/meson/s4-pll.c
@@ -281,7 +281,7 @@ static const struct pll_mult_range s4_gp0_pll_mult_range = {
 /*
  * Internal gp0 pll emulation configuration parameters
  */
-static const struct reg_sequence s4_gp0_init_regs[] = {
+static const struct reg_sequence s4_gp0_pll_init_regs[] = {
 	{ .reg = ANACTRL_GP0PLL_CTRL1,	.def = 0x00000000 },
 	{ .reg = ANACTRL_GP0PLL_CTRL2,	.def = 0x00000000 },
 	{ .reg = ANACTRL_GP0PLL_CTRL3,	.def = 0x48681c00 },
@@ -318,8 +318,8 @@ static struct clk_regmap s4_gp0_pll_dco = {
 			.width   = 1,
 		},
 		.range = &s4_gp0_pll_mult_range,
-		.init_regs = s4_gp0_init_regs,
-		.init_count = ARRAY_SIZE(s4_gp0_init_regs),
+		.init_regs = s4_gp0_pll_init_regs,
+		.init_count = ARRAY_SIZE(s4_gp0_pll_init_regs),
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "gp0_pll_dco",
@@ -353,7 +353,7 @@ static struct clk_regmap s4_gp0_pll = {
 /*
  * Internal hifi pll emulation configuration parameters
  */
-static const struct reg_sequence s4_hifi_init_regs[] = {
+static const struct reg_sequence s4_hifi_pll_init_regs[] = {
 	{ .reg = ANACTRL_HIFIPLL_CTRL2,	.def = 0x00000000 },
 	{ .reg = ANACTRL_HIFIPLL_CTRL3,	.def = 0x6a285c00 },
 	{ .reg = ANACTRL_HIFIPLL_CTRL4,	.def = 0x65771290 },
@@ -394,8 +394,8 @@ static struct clk_regmap s4_hifi_pll_dco = {
 			.width   = 1,
 		},
 		.range = &s4_gp0_pll_mult_range,
-		.init_regs = s4_hifi_init_regs,
-		.init_count = ARRAY_SIZE(s4_hifi_init_regs),
+		.init_regs = s4_hifi_pll_init_regs,
+		.init_count = ARRAY_SIZE(s4_hifi_pll_init_regs),
 		.frac_max = 100000,
 		.flags = CLK_MESON_PLL_ROUND_CLOSEST,
 	},
@@ -794,11 +794,11 @@ static struct clk_hw *s4_pll_hw_clks[] = {
 	[CLKID_MPLL3]			= &s4_mpll3.hw,
 };
 
-static const struct reg_sequence s4_init_regs[] = {
+static const struct reg_sequence s4_pll_init_regs[] = {
 	{ .reg = ANACTRL_MPLL_CTRL0,	.def = 0x00000543 },
 };
 
-static const struct regmap_config clkc_regmap_config = {
+static const struct regmap_config s4_pll_clkc_regmap_cfg = {
 	.reg_bits       = 32,
 	.val_bits       = 32,
 	.reg_stride     = 4,
@@ -810,7 +810,7 @@ static struct meson_clk_hw_data s4_pll_clks = {
 	.num = ARRAY_SIZE(s4_pll_hw_clks),
 };
 
-static int meson_s4_pll_probe(struct platform_device *pdev)
+static int s4_pll_clkc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct regmap *regmap;
@@ -822,12 +822,12 @@ static int meson_s4_pll_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(base),
 				     "can't ioremap resource\n");
 
-	regmap = devm_regmap_init_mmio(dev, base, &clkc_regmap_config);
+	regmap = devm_regmap_init_mmio(dev, base, &s4_pll_clkc_regmap_cfg);
 	if (IS_ERR(regmap))
 		return dev_err_probe(dev, PTR_ERR(regmap),
 				     "can't init regmap mmio region\n");
 
-	ret = regmap_multi_reg_write(regmap, s4_init_regs, ARRAY_SIZE(s4_init_regs));
+	ret = regmap_multi_reg_write(regmap, s4_pll_init_regs, ARRAY_SIZE(s4_pll_init_regs));
 	if (ret)
 		return dev_err_probe(dev, ret,
 				     "Failed to init registers\n");
@@ -848,22 +848,22 @@ static int meson_s4_pll_probe(struct platform_device *pdev)
 					   &s4_pll_clks);
 }
 
-static const struct of_device_id clkc_match_table[] = {
+static const struct of_device_id s4_pll_clkc_match_table[] = {
 	{
 		.compatible = "amlogic,s4-pll-clkc",
 	},
 	{}
 };
-MODULE_DEVICE_TABLE(of, clkc_match_table);
+MODULE_DEVICE_TABLE(of, s4_pll_clkc_match_table);
 
-static struct platform_driver s4_driver = {
-	.probe		= meson_s4_pll_probe,
+static struct platform_driver s4_pll_clkc_driver = {
+	.probe		= s4_pll_clkc_probe,
 	.driver		= {
 		.name	= "s4-pll-clkc",
-		.of_match_table = clkc_match_table,
+		.of_match_table = s4_pll_clkc_match_table,
 	},
 };
-module_platform_driver(s4_driver);
+module_platform_driver(s4_pll_clkc_driver);
 
 MODULE_DESCRIPTION("Amlogic S4 PLL Clock Controller driver");
 MODULE_AUTHOR("Yu Tu <yu.tu@amlogic.com>");

-- 
2.47.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
