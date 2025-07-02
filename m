Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D2EC83F0A
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Jul 2025 16:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hSfypUV9dCMakxr8d7Gg7lv8IlgTlrVs2NUwk6uFmT4=; b=Rv8d2/lkieSX5/
	4VDAUNcuQvZTPsl4Dj5khJNkr96JmnRgmFb8HrmmXUau+vkHKtMUFxfiBWCTK9d2+RR3oTmm6TQuN
	RS4dbcZzRv+aaYHGj4eqY4OoOUC0pReBUZE+X/FCMbnCuo2tkfFtMdioMJZD5x1i1he3AfAr7GKl3
	PKct51RB2g2pDtpwFGMsWEWU+OCcWvEnHuXTSw2wRMiotQ8UkcguIF2BDcnQAAIuOSyvE0SBprGVA
	s7gXKpdoirrs+V1fysDGJFmQKz0qHcWHYtAKNAT9RO0ScrUa2jRcUb4ZrEUjw8ZdZca+jGcaLkE9P
	DitqMeuQPT5T+PfLBYzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0V9-00000008zG5-2UYL;
	Wed, 02 Jul 2025 16:40:03 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzMr-00000008mtv-0AyE
	for linux-amlogic@lists.infradead.org;
	Wed, 02 Jul 2025 15:27:26 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so3491790f8f.3
        for <linux-amlogic@lists.infradead.org>; Wed, 02 Jul 2025 08:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751470043; x=1752074843; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W/BTt7MExqsV7U6bp4hl9gIY5wwYixCeIpBGptvRLaY=;
        b=keoK1l2N/27OB8jMYaZHAjrs/vjrCXynqSbD3t96UmB/6if1neV9ZatWmXR+aaRAD5
         ra0vjjcXaP9beIwNvquyAH0SPRUxpNT6v1i8WM7XsVAsbjTQcT/cK2d+xJ79rzP4zbLs
         jC1rIwW6xSE/zHA3VpiXyjW1S1kRpYCHAOrGBSBV3TAPejTMC+oXV6A5pHbQicxrf+jm
         FFh5kf42hg9dE6+4Gu6X9KZ6H/bPYev4SwGVkQzYRY/tcoJ2+rMJVZKsc97UAqJ1h0Je
         duT1bc5AUYLutCw5SXbJh7NfI9pu+kcn8i5TF3n3r7qxOmSQXSGBj5G0KHYRbkygMlph
         go4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470043; x=1752074843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W/BTt7MExqsV7U6bp4hl9gIY5wwYixCeIpBGptvRLaY=;
        b=EE4t6+z6DKen4js6Y/+ZWKPEizPXJat+cbMRh1Kq+PYNbuhym+C9ozsCJWI+CnZwOz
         yyjsmrVpwwIIJrkKZ5Qaq/ugheWcUNL13J61fYJ7up2iRM1FXiVMCnf9NACaNzNW82om
         gwYhSUKd0Xn/T/KLG//+Svd42crTJv4IppVwHmFe2N7/wJY+jLRmNu52bojUG0J4hd5r
         tze2gr0B/pJYlYFtERXX8O/+ZMdAQop4rmLK8FBV6syw8dnh3EgPjR9hx6mlcuPFL+La
         UEv/ywvhOZg4xgNUuySxJkb+b3Zrd7lbzGmUXf3rx9TpnDkkaxyKD0LkO48MrxwJg5Fj
         B0kg==
X-Gm-Message-State: AOJu0YwozPA9RQDejEwm23crTpjkUtKNiZj6M6l+1EWgcLVvflPp/8lY
	uya4g85bSSsoFPZJzUWtqssEWX8gJnYTVqrCUiC6xFlcbtkvdfLkns2ZkF+GdNFhciE=
X-Gm-Gg: ASbGncsoMyGJhFiNP6vhKOAl+0hRFSAEOsq4n7u6YLzKzW8SxF6LmIUp7SO/vhVHQMz
	UMiYLd83J0NBgdmSrXYu9NLJXSOgDyDqwMCAyIZgGiza0djDnYYmpw/ATi3GrPGpmUb59OUyIa1
	RWaiQ9umUxTSnO6QZm44hjqwabrpScn86SlyOMuv/DVtGhvsiF2Xm5oWh7E63t8fKi6XXXFiU8m
	6slCqb5PKounv/4kHRla9ZfK7GE1UbxfstZg17U4ajyMqqWqUuuyKeiG+sjP+vdBPFQY03yFUZ+
	Ear6qzodrf5AesxE0eLHozba3wCwKeeAfs8F/6qQE+sDJrTzst5fCyBjxgRQJTuYZc7WZSyDZKg
	j
X-Google-Smtp-Source: AGHT+IEE0QTA1dMc71/V8cG24jzOQWJ4wBWKGLgJS2DXBBb7KGk650osbom+ipRIC4zqAcO7eOQd2w==
X-Received: by 2002:a05:6000:2f86:b0:3a4:e740:cd72 with SMTP id ffacd0b85a97d-3b1fe6b4e63mr2523089f8f.13.1751470043306;
        Wed, 02 Jul 2025 08:27:23 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:5542:4bad:e07b:9489])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454a9bcf35csm869205e9.20.2025.07.02.08.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 08:27:22 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 02 Jul 2025 17:26:08 +0200
Subject: [PATCH 10/26] clk: amlogic: gxbb: naming consistency alignment
MIME-Version: 1.0
Message-Id: <20250702-meson-clk-cleanup-24-v1-10-e163c9a1fc21@baylibre.com>
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=37192; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=9eFh1VOcPpWoNtoqLhgw/8GMdbxzVcWtJielOB/rp4c=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoZU+/OO3Map8zuFsUPug98RI3IsWo9IPrOdYM2
 iHTCPcGI9CJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaGVPvwAKCRDm/A8cN/La
 hfaKEACuZcXOeu3n1CdT+NCiSsgDzDR0sMhYhTfFrKgJQU1E+jjZcvxcraKbz7jkFQHs/PGh0R9
 BfZA2o++y39yC0FDhQCRnaLjQrZHAIWxOpCQsOePzEKzwQtMY/ocJR8b0fHUnazaQF/x6t8/W7A
 jTDV/keEHdLJFd9ulkBxf5dhUf6SsejW2SSDqFqI8DLOqs+kk9LIAPWim3txmm9OswQWWse9Q/f
 /d7zA7acIzzKZvbeAKOEQ6VZe+V/sdAqCPKpQHmfH8u/kfbdFzlXyHzWscKZQpUuTx5Tx49Nt8B
 GeyA/T2meupGN7Ul/gWx76eVTXM5QPKfeAd7OtcOSPuHn3pHBXAzLjzgcC2sWA5wBUFLL7Np6rn
 HmvD2Jj4HIIrMZlY0XvNpyXOE2/AblCcsSqXGEplIOiK0PM4CezvWAyf7zsDaPFWFXw267wAfc0
 PoQmHZtETYBc5Yi1c8g0yBft/l9HVU1PEhp1pf9fNkndwgVKzoWvIkpcIP62U3QFvQdGAcUMnhd
 brjVMcdGXFkK5iUG+Juuq996288RMt3U8gDHaKW2lelqi8JUKXBTKhec+IKfdBJ0nAojg9f74zA
 8lag2Qc1gyyZwxW4XUBxOX6sc6wRQgGROqfyNiVh50vAy0GGLHLZquOBfFnhJu+McQUzRj+tBga
 I0dcf5NSBS1UXNg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_082725_217033_03AE745F 
X-CRM114-Status: GOOD (  16.61  )
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
 drivers/clk/meson/gxbb.c | 579 +++++++++++++++++++++++------------------------
 1 file changed, 288 insertions(+), 291 deletions(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 3b8731ec20168eaee01cc55cf805e24431afaffe..f969e3cf9566de5dff615d59360729d963507b36 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -116,70 +116,6 @@
 #define HHI_BT656_CLK_CNTL		0x3d4
 #define HHI_SAR_CLK_CNTL		0x3d8
 
-static const struct pll_params_table gxbb_gp0_pll_params_table[] = {
-	PLL_PARAMS(32, 1),
-	PLL_PARAMS(33, 1),
-	PLL_PARAMS(34, 1),
-	PLL_PARAMS(35, 1),
-	PLL_PARAMS(36, 1),
-	PLL_PARAMS(37, 1),
-	PLL_PARAMS(38, 1),
-	PLL_PARAMS(39, 1),
-	PLL_PARAMS(40, 1),
-	PLL_PARAMS(41, 1),
-	PLL_PARAMS(42, 1),
-	PLL_PARAMS(43, 1),
-	PLL_PARAMS(44, 1),
-	PLL_PARAMS(45, 1),
-	PLL_PARAMS(46, 1),
-	PLL_PARAMS(47, 1),
-	PLL_PARAMS(48, 1),
-	PLL_PARAMS(49, 1),
-	PLL_PARAMS(50, 1),
-	PLL_PARAMS(51, 1),
-	PLL_PARAMS(52, 1),
-	PLL_PARAMS(53, 1),
-	PLL_PARAMS(54, 1),
-	PLL_PARAMS(55, 1),
-	PLL_PARAMS(56, 1),
-	PLL_PARAMS(57, 1),
-	PLL_PARAMS(58, 1),
-	PLL_PARAMS(59, 1),
-	PLL_PARAMS(60, 1),
-	PLL_PARAMS(61, 1),
-	PLL_PARAMS(62, 1),
-	{ /* sentinel */ },
-};
-
-static const struct pll_params_table gxl_gp0_pll_params_table[] = {
-	PLL_PARAMS(42, 1),
-	PLL_PARAMS(43, 1),
-	PLL_PARAMS(44, 1),
-	PLL_PARAMS(45, 1),
-	PLL_PARAMS(46, 1),
-	PLL_PARAMS(47, 1),
-	PLL_PARAMS(48, 1),
-	PLL_PARAMS(49, 1),
-	PLL_PARAMS(50, 1),
-	PLL_PARAMS(51, 1),
-	PLL_PARAMS(52, 1),
-	PLL_PARAMS(53, 1),
-	PLL_PARAMS(54, 1),
-	PLL_PARAMS(55, 1),
-	PLL_PARAMS(56, 1),
-	PLL_PARAMS(57, 1),
-	PLL_PARAMS(58, 1),
-	PLL_PARAMS(59, 1),
-	PLL_PARAMS(60, 1),
-	PLL_PARAMS(61, 1),
-	PLL_PARAMS(62, 1),
-	PLL_PARAMS(63, 1),
-	PLL_PARAMS(64, 1),
-	PLL_PARAMS(65, 1),
-	PLL_PARAMS(66, 1),
-	{ /* sentinel */ },
-};
-
 static struct clk_regmap gxbb_fixed_pll_dco = {
 	.data = &(struct meson_clk_pll_data){
 		.en = {
@@ -523,7 +459,42 @@ static struct clk_regmap gxbb_sys_pll = {
 	},
 };
 
-static const struct reg_sequence gxbb_gp0_init_regs[] = {
+static const struct pll_params_table gxbb_gp0_pll_params_table[] = {
+	PLL_PARAMS(32, 1),
+	PLL_PARAMS(33, 1),
+	PLL_PARAMS(34, 1),
+	PLL_PARAMS(35, 1),
+	PLL_PARAMS(36, 1),
+	PLL_PARAMS(37, 1),
+	PLL_PARAMS(38, 1),
+	PLL_PARAMS(39, 1),
+	PLL_PARAMS(40, 1),
+	PLL_PARAMS(41, 1),
+	PLL_PARAMS(42, 1),
+	PLL_PARAMS(43, 1),
+	PLL_PARAMS(44, 1),
+	PLL_PARAMS(45, 1),
+	PLL_PARAMS(46, 1),
+	PLL_PARAMS(47, 1),
+	PLL_PARAMS(48, 1),
+	PLL_PARAMS(49, 1),
+	PLL_PARAMS(50, 1),
+	PLL_PARAMS(51, 1),
+	PLL_PARAMS(52, 1),
+	PLL_PARAMS(53, 1),
+	PLL_PARAMS(54, 1),
+	PLL_PARAMS(55, 1),
+	PLL_PARAMS(56, 1),
+	PLL_PARAMS(57, 1),
+	PLL_PARAMS(58, 1),
+	PLL_PARAMS(59, 1),
+	PLL_PARAMS(60, 1),
+	PLL_PARAMS(61, 1),
+	PLL_PARAMS(62, 1),
+	{ /* sentinel */ },
+};
+
+static const struct reg_sequence gxbb_gp0_pll_init_regs[] = {
 	{ .reg = HHI_GP0_PLL_CNTL2,	.def = 0x69c80000 },
 	{ .reg = HHI_GP0_PLL_CNTL3,	.def = 0x0a5590c4 },
 	{ .reg = HHI_GP0_PLL_CNTL4,	.def = 0x0000500d },
@@ -557,8 +528,8 @@ static struct clk_regmap gxbb_gp0_pll_dco = {
 			.width   = 1,
 		},
 		.table = gxbb_gp0_pll_params_table,
-		.init_regs = gxbb_gp0_init_regs,
-		.init_count = ARRAY_SIZE(gxbb_gp0_init_regs),
+		.init_regs = gxbb_gp0_pll_init_regs,
+		.init_count = ARRAY_SIZE(gxbb_gp0_pll_init_regs),
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "gp0_pll_dco",
@@ -570,7 +541,36 @@ static struct clk_regmap gxbb_gp0_pll_dco = {
 	},
 };
 
-static const struct reg_sequence gxl_gp0_init_regs[] = {
+static const struct pll_params_table gxl_gp0_pll_params_table[] = {
+	PLL_PARAMS(42, 1),
+	PLL_PARAMS(43, 1),
+	PLL_PARAMS(44, 1),
+	PLL_PARAMS(45, 1),
+	PLL_PARAMS(46, 1),
+	PLL_PARAMS(47, 1),
+	PLL_PARAMS(48, 1),
+	PLL_PARAMS(49, 1),
+	PLL_PARAMS(50, 1),
+	PLL_PARAMS(51, 1),
+	PLL_PARAMS(52, 1),
+	PLL_PARAMS(53, 1),
+	PLL_PARAMS(54, 1),
+	PLL_PARAMS(55, 1),
+	PLL_PARAMS(56, 1),
+	PLL_PARAMS(57, 1),
+	PLL_PARAMS(58, 1),
+	PLL_PARAMS(59, 1),
+	PLL_PARAMS(60, 1),
+	PLL_PARAMS(61, 1),
+	PLL_PARAMS(62, 1),
+	PLL_PARAMS(63, 1),
+	PLL_PARAMS(64, 1),
+	PLL_PARAMS(65, 1),
+	PLL_PARAMS(66, 1),
+	{ /* sentinel */ },
+};
+
+static const struct reg_sequence gxl_gp0_pll_init_regs[] = {
 	{ .reg = HHI_GP0_PLL_CNTL1,	.def = 0xc084b000 },
 	{ .reg = HHI_GP0_PLL_CNTL2,	.def = 0xb75020be },
 	{ .reg = HHI_GP0_PLL_CNTL3,	.def = 0x0a59a288 },
@@ -611,8 +611,8 @@ static struct clk_regmap gxl_gp0_pll_dco = {
 			.width   = 1,
 		},
 		.table = gxl_gp0_pll_params_table,
-		.init_regs = gxl_gp0_init_regs,
-		.init_count = ARRAY_SIZE(gxl_gp0_init_regs),
+		.init_regs = gxl_gp0_pll_init_regs,
+		.init_count = ARRAY_SIZE(gxl_gp0_pll_init_regs),
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "gp0_pll_dco",
@@ -972,8 +972,9 @@ static struct clk_regmap gxbb_mpll2 = {
 	},
 };
 
-static u32 mux_table_clk81[]	= { 0, 2, 3, 4, 5, 6, 7 };
-static const struct clk_parent_data clk81_parent_data[] = {
+/* clk81 is often referred as "mpeg_clk" */
+static u32 clk81_parents_val_table[] = { 0, 2, 3, 4, 5, 6, 7 };
+static const struct clk_parent_data clk81_parents[] = {
 	{ .fw_name = "xtal", },
 	{ .hw = &gxbb_fclk_div7.hw },
 	{ .hw = &gxbb_mpll1.hw },
@@ -983,37 +984,37 @@ static const struct clk_parent_data clk81_parent_data[] = {
 	{ .hw = &gxbb_fclk_div5.hw },
 };
 
-static struct clk_regmap gxbb_mpeg_clk_sel = {
+static struct clk_regmap gxbb_clk81_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = HHI_MPEG_CLK_CNTL,
 		.mask = 0x7,
 		.shift = 12,
-		.table = mux_table_clk81,
+		.table = clk81_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "mpeg_clk_sel",
+		.name = "clk81_sel",
 		.ops = &clk_regmap_mux_ro_ops,
 		/*
 		 * bits 14:12 selects from 8 possible parents:
 		 * xtal, 1'b0 (wtf), fclk_div7, mpll_clkout1, mpll_clkout2,
 		 * fclk_div4, fclk_div3, fclk_div5
 		 */
-		.parent_data = clk81_parent_data,
-		.num_parents = ARRAY_SIZE(clk81_parent_data),
+		.parent_data = clk81_parents,
+		.num_parents = ARRAY_SIZE(clk81_parents),
 	},
 };
 
-static struct clk_regmap gxbb_mpeg_clk_div = {
+static struct clk_regmap gxbb_clk81_div = {
 	.data = &(struct clk_regmap_div_data){
 		.offset = HHI_MPEG_CLK_CNTL,
 		.shift = 0,
 		.width = 7,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "mpeg_clk_div",
+		.name = "clk81_div",
 		.ops = &clk_regmap_divider_ro_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&gxbb_mpeg_clk_sel.hw
+			&gxbb_clk81_sel.hw
 		},
 		.num_parents = 1,
 	},
@@ -1029,7 +1030,7 @@ static struct clk_regmap gxbb_clk81 = {
 		.name = "clk81",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&gxbb_mpeg_clk_div.hw
+			&gxbb_clk81_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_IS_CRITICAL,
@@ -1094,7 +1095,7 @@ static struct clk_regmap gxbb_sar_adc_clk = {
  * switches to the "inactive" one when CLK_SET_RATE_GATE is set.
  */
 
-static const struct clk_parent_data gxbb_mali_0_1_parent_data[] = {
+static const struct clk_parent_data gxbb_mali_parents[] = {
 	{ .fw_name = "xtal", },
 	{ .hw = &gxbb_gp0_pll.hw },
 	{ .hw = &gxbb_mpll2.hw },
@@ -1114,8 +1115,8 @@ static struct clk_regmap gxbb_mali_0_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "mali_0_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = gxbb_mali_0_1_parent_data,
-		.num_parents = 8,
+		.parent_data = gxbb_mali_parents,
+		.num_parents = ARRAY_SIZE(gxbb_mali_parents),
 		/*
 		 * Don't request the parent to change the rate because
 		 * all GPU frequencies can be derived from the fclk_*
@@ -1168,8 +1169,8 @@ static struct clk_regmap gxbb_mali_1_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "mali_1_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = gxbb_mali_0_1_parent_data,
-		.num_parents = 8,
+		.parent_data = gxbb_mali_parents,
+		.num_parents = ARRAY_SIZE(gxbb_mali_parents),
 		/*
 		 * Don't request the parent to change the rate because
 		 * all GPU frequencies can be derived from the fclk_*
@@ -1213,11 +1214,6 @@ static struct clk_regmap gxbb_mali_1 = {
 	},
 };
 
-static const struct clk_hw *gxbb_mali_parent_hws[] = {
-	&gxbb_mali_0.hw,
-	&gxbb_mali_1.hw,
-};
-
 static struct clk_regmap gxbb_mali = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = HHI_MALI_CLK_CNTL,
@@ -1227,29 +1223,35 @@ static struct clk_regmap gxbb_mali = {
 	.hw.init = &(struct clk_init_data){
 		.name = "mali",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = gxbb_mali_parent_hws,
+		.parent_hws = (const struct clk_hw *[]) {
+			&gxbb_mali_0.hw,
+			&gxbb_mali_1.hw,
+		},
 		.num_parents = 2,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
+static u32 gxbb_cts_mclk_parents_val_table[] = { 1, 2, 3 };
+static const struct clk_hw *gxbb_cts_mclk_parents[] = {
+	&gxbb_mpll0.hw,
+	&gxbb_mpll1.hw,
+	&gxbb_mpll2.hw,
+};
+
 static struct clk_regmap gxbb_cts_amclk_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = HHI_AUD_CLK_CNTL,
 		.mask = 0x3,
 		.shift = 9,
-		.table = (u32[]){ 1, 2, 3 },
+		.table = gxbb_cts_mclk_parents_val_table,
 		.flags = CLK_MUX_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_amclk_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&gxbb_mpll0.hw,
-			&gxbb_mpll1.hw,
-			&gxbb_mpll2.hw,
-		},
-		.num_parents = 3,
+		.parent_hws = gxbb_cts_mclk_parents,
+		.num_parents = ARRAY_SIZE(gxbb_cts_mclk_parents),
 	},
 };
 
@@ -1292,18 +1294,14 @@ static struct clk_regmap gxbb_cts_mclk_i958_sel = {
 		.offset = HHI_AUD_CLK_CNTL2,
 		.mask = 0x3,
 		.shift = 25,
-		.table = (u32[]){ 1, 2, 3 },
+		.table = gxbb_cts_mclk_parents_val_table,
 		.flags = CLK_MUX_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data) {
 		.name = "cts_mclk_i958_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&gxbb_mpll0.hw,
-			&gxbb_mpll1.hw,
-			&gxbb_mpll2.hw,
-		},
-		.num_parents = 3,
+		.parent_hws = gxbb_cts_mclk_parents,
+		.num_parents = ARRAY_SIZE(gxbb_cts_mclk_parents),
 	},
 };
 
@@ -1368,7 +1366,7 @@ static struct clk_regmap gxbb_cts_i958 = {
  * This clock does not exist yet in this controller or the AO one
  */
 static u32 gxbb_32k_clk_parents_val_table[] = { 0, 2, 3 };
-static const struct clk_parent_data gxbb_32k_clk_parent_data[] = {
+static const struct clk_parent_data gxbb_32k_clk_parents[] = {
 	{ .fw_name = "xtal", },
 	{ .hw = &gxbb_fclk_div3.hw },
 	{ .hw = &gxbb_fclk_div5.hw },
@@ -1380,11 +1378,11 @@ static struct clk_regmap gxbb_32k_clk_sel = {
 		.mask = 0x3,
 		.shift = 16,
 		.table = gxbb_32k_clk_parents_val_table,
-		},
+	},
 	.hw.init = &(struct clk_init_data){
 		.name = "32k_clk_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = gxbb_32k_clk_parent_data,
+		.parent_data = gxbb_32k_clk_parents,
 		.num_parents = 4,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1423,7 +1421,7 @@ static struct clk_regmap gxbb_32k_clk = {
 	},
 };
 
-static const struct clk_parent_data gxbb_sd_emmc_clk0_parent_data[] = {
+static const struct clk_parent_data gxbb_sd_emmc_clk0_parents[] = {
 	{ .fw_name = "xtal", },
 	{ .hw = &gxbb_fclk_div2.hw },
 	{ .hw = &gxbb_fclk_div3.hw },
@@ -1447,8 +1445,8 @@ static struct clk_regmap gxbb_sd_emmc_a_clk0_sel = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "sd_emmc_a_clk0_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = gxbb_sd_emmc_clk0_parent_data,
-		.num_parents = ARRAY_SIZE(gxbb_sd_emmc_clk0_parent_data),
+		.parent_data = gxbb_sd_emmc_clk0_parents,
+		.num_parents = ARRAY_SIZE(gxbb_sd_emmc_clk0_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1497,8 +1495,8 @@ static struct clk_regmap gxbb_sd_emmc_b_clk0_sel = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "sd_emmc_b_clk0_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = gxbb_sd_emmc_clk0_parent_data,
-		.num_parents = ARRAY_SIZE(gxbb_sd_emmc_clk0_parent_data),
+		.parent_data = gxbb_sd_emmc_clk0_parents,
+		.num_parents = ARRAY_SIZE(gxbb_sd_emmc_clk0_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1547,8 +1545,8 @@ static struct clk_regmap gxbb_sd_emmc_c_clk0_sel = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "sd_emmc_c_clk0_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = gxbb_sd_emmc_clk0_parent_data,
-		.num_parents = ARRAY_SIZE(gxbb_sd_emmc_clk0_parent_data),
+		.parent_data = gxbb_sd_emmc_clk0_parents,
+		.num_parents = ARRAY_SIZE(gxbb_sd_emmc_clk0_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1589,7 +1587,7 @@ static struct clk_regmap gxbb_sd_emmc_c_clk0 = {
 
 /* VPU Clock */
 
-static const struct clk_hw *gxbb_vpu_parent_hws[] = {
+static const struct clk_hw *gxbb_vpu_parents[] = {
 	&gxbb_fclk_div4.hw,
 	&gxbb_fclk_div3.hw,
 	&gxbb_fclk_div5.hw,
@@ -1609,8 +1607,8 @@ static struct clk_regmap gxbb_vpu_0_sel = {
 		 * bits 9:10 selects from 4 possible parents:
 		 * fclk_div4, fclk_div3, fclk_div5, fclk_div7,
 		 */
-		.parent_hws = gxbb_vpu_parent_hws,
-		.num_parents = ARRAY_SIZE(gxbb_vpu_parent_hws),
+		.parent_hws = gxbb_vpu_parents,
+		.num_parents = ARRAY_SIZE(gxbb_vpu_parents),
 		.flags = CLK_SET_RATE_NO_REPARENT,
 	},
 };
@@ -1657,8 +1655,8 @@ static struct clk_regmap gxbb_vpu_1_sel = {
 		 * bits 25:26 selects from 4 possible parents:
 		 * fclk_div4, fclk_div3, fclk_div5, fclk_div7,
 		 */
-		.parent_hws = gxbb_vpu_parent_hws,
-		.num_parents = ARRAY_SIZE(gxbb_vpu_parent_hws),
+		.parent_hws = gxbb_vpu_parents,
+		.num_parents = ARRAY_SIZE(gxbb_vpu_parents),
 		.flags = CLK_SET_RATE_NO_REPARENT,
 	},
 };
@@ -1716,7 +1714,7 @@ static struct clk_regmap gxbb_vpu = {
 
 /* VAPB Clock */
 
-static const struct clk_hw *gxbb_vapb_parent_hws[] = {
+static const struct clk_hw *gxbb_vapb_parents[] = {
 	&gxbb_fclk_div4.hw,
 	&gxbb_fclk_div3.hw,
 	&gxbb_fclk_div5.hw,
@@ -1736,8 +1734,8 @@ static struct clk_regmap gxbb_vapb_0_sel = {
 		 * bits 9:10 selects from 4 possible parents:
 		 * fclk_div4, fclk_div3, fclk_div5, fclk_div7,
 		 */
-		.parent_hws = gxbb_vapb_parent_hws,
-		.num_parents = ARRAY_SIZE(gxbb_vapb_parent_hws),
+		.parent_hws = gxbb_vapb_parents,
+		.num_parents = ARRAY_SIZE(gxbb_vapb_parents),
 		.flags = CLK_SET_RATE_NO_REPARENT,
 	},
 };
@@ -1788,8 +1786,8 @@ static struct clk_regmap gxbb_vapb_1_sel = {
 		 * bits 25:26 selects from 4 possible parents:
 		 * fclk_div4, fclk_div3, fclk_div5, fclk_div7,
 		 */
-		.parent_hws = gxbb_vapb_parent_hws,
-		.num_parents = ARRAY_SIZE(gxbb_vapb_parent_hws),
+		.parent_hws = gxbb_vapb_parents,
+		.num_parents = ARRAY_SIZE(gxbb_vapb_parents),
 		.flags = CLK_SET_RATE_NO_REPARENT,
 	},
 };
@@ -1897,7 +1895,7 @@ static struct clk_regmap gxbb_vid_pll_div = {
 	},
 };
 
-static const struct clk_parent_data gxbb_vid_pll_parent_data[] = {
+static const struct clk_parent_data gxbb_vid_pll_parents[] = {
 	{ .hw = &gxbb_vid_pll_div.hw },
 	/*
 	 * Note:
@@ -1922,8 +1920,8 @@ static struct clk_regmap gxbb_vid_pll_sel = {
 		 * bit 18 selects from 2 possible parents:
 		 * vid_pll_div or hdmi_pll
 		 */
-		.parent_data = gxbb_vid_pll_parent_data,
-		.num_parents = ARRAY_SIZE(gxbb_vid_pll_parent_data),
+		.parent_data = gxbb_vid_pll_parents,
+		.num_parents = ARRAY_SIZE(gxbb_vid_pll_parents),
 		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,
 	},
 };
@@ -1944,7 +1942,7 @@ static struct clk_regmap gxbb_vid_pll = {
 	},
 };
 
-static const struct clk_hw *gxbb_vclk_parent_hws[] = {
+static const struct clk_hw *gxbb_vclk_parents[] = {
 	&gxbb_vid_pll.hw,
 	&gxbb_fclk_div4.hw,
 	&gxbb_fclk_div3.hw,
@@ -1968,8 +1966,8 @@ static struct clk_regmap gxbb_vclk_sel = {
 		 * vid_pll, fclk_div4, fclk_div3, fclk_div5,
 		 * vid_pll, fclk_div7, mp1
 		 */
-		.parent_hws = gxbb_vclk_parent_hws,
-		.num_parents = ARRAY_SIZE(gxbb_vclk_parent_hws),
+		.parent_hws = gxbb_vclk_parents,
+		.num_parents = ARRAY_SIZE(gxbb_vclk_parents),
 		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,
 	},
 };
@@ -1988,8 +1986,8 @@ static struct clk_regmap gxbb_vclk2_sel = {
 		 * vid_pll, fclk_div4, fclk_div3, fclk_div5,
 		 * vid_pll, fclk_div7, mp1
 		 */
-		.parent_hws = gxbb_vclk_parent_hws,
-		.num_parents = ARRAY_SIZE(gxbb_vclk_parent_hws),
+		.parent_hws = gxbb_vclk_parents,
+		.num_parents = ARRAY_SIZE(gxbb_vclk_parents),
 		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,
 	},
 };
@@ -2328,8 +2326,8 @@ static struct clk_fixed_factor gxbb_vclk2_div12 = {
 	},
 };
 
-static u32 mux_table_cts_sel[] = { 0, 1, 2, 3, 4, 8, 9, 10, 11, 12 };
-static const struct clk_hw *gxbb_cts_parent_hws[] = {
+static u32 gxbb_cts_parents_val_table[] = { 0, 1, 2, 3, 4, 8, 9, 10, 11, 12 };
+static const struct clk_hw *gxbb_cts_parents[] = {
 	&gxbb_vclk_div1.hw,
 	&gxbb_vclk_div2.hw,
 	&gxbb_vclk_div4.hw,
@@ -2347,13 +2345,13 @@ static struct clk_regmap gxbb_cts_enci_sel = {
 		.offset = HHI_VID_CLK_DIV,
 		.mask = 0xf,
 		.shift = 28,
-		.table = mux_table_cts_sel,
+		.table = gxbb_cts_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_enci_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = gxbb_cts_parent_hws,
-		.num_parents = ARRAY_SIZE(gxbb_cts_parent_hws),
+		.parent_hws = gxbb_cts_parents,
+		.num_parents = ARRAY_SIZE(gxbb_cts_parents),
 		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,
 	},
 };
@@ -2363,13 +2361,13 @@ static struct clk_regmap gxbb_cts_encp_sel = {
 		.offset = HHI_VID_CLK_DIV,
 		.mask = 0xf,
 		.shift = 20,
-		.table = mux_table_cts_sel,
+		.table = gxbb_cts_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_encp_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = gxbb_cts_parent_hws,
-		.num_parents = ARRAY_SIZE(gxbb_cts_parent_hws),
+		.parent_hws = gxbb_cts_parents,
+		.num_parents = ARRAY_SIZE(gxbb_cts_parents),
 		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,
 	},
 };
@@ -2379,50 +2377,13 @@ static struct clk_regmap gxbb_cts_vdac_sel = {
 		.offset = HHI_VIID_CLK_DIV,
 		.mask = 0xf,
 		.shift = 28,
-		.table = mux_table_cts_sel,
+		.table = gxbb_cts_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_vdac_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = gxbb_cts_parent_hws,
-		.num_parents = ARRAY_SIZE(gxbb_cts_parent_hws),
-		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,
-	},
-};
-
-/* TOFIX: add support for cts_tcon */
-static u32 mux_table_hdmi_tx_sel[] = { 0, 1, 2, 3, 4, 8, 9, 10, 11, 12 };
-static const struct clk_hw *gxbb_cts_hdmi_tx_parent_hws[] = {
-	&gxbb_vclk_div1.hw,
-	&gxbb_vclk_div2.hw,
-	&gxbb_vclk_div4.hw,
-	&gxbb_vclk_div6.hw,
-	&gxbb_vclk_div12.hw,
-	&gxbb_vclk2_div1.hw,
-	&gxbb_vclk2_div2.hw,
-	&gxbb_vclk2_div4.hw,
-	&gxbb_vclk2_div6.hw,
-	&gxbb_vclk2_div12.hw,
-};
-
-static struct clk_regmap gxbb_hdmi_tx_sel = {
-	.data = &(struct clk_regmap_mux_data){
-		.offset = HHI_HDMI_CLK_CNTL,
-		.mask = 0xf,
-		.shift = 16,
-		.table = mux_table_hdmi_tx_sel,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "hdmi_tx_sel",
-		.ops = &clk_regmap_mux_ops,
-		/*
-		 * bits 31:28 selects from 12 possible parents:
-		 * vclk_div1, vclk_div2, vclk_div4, vclk_div6, vclk_div12
-		 * vclk2_div1, vclk2_div2, vclk2_div4, vclk2_div6, vclk2_div12,
-		 * cts_tcon
-		 */
-		.parent_hws = gxbb_cts_hdmi_tx_parent_hws,
-		.num_parents = ARRAY_SIZE(gxbb_cts_hdmi_tx_parent_hws),
+		.parent_hws = gxbb_cts_parents,
+		.num_parents = ARRAY_SIZE(gxbb_cts_parents),
 		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,
 	},
 };
@@ -2475,6 +2436,43 @@ static struct clk_regmap gxbb_cts_vdac = {
 	},
 };
 
+/* TOFIX: add support for cts_tcon */
+static u32 gxbb_hdmi_tx_parents_val_table[] = { 0, 1, 2, 3, 4, 8, 9, 10, 11, 12 };
+static const struct clk_hw *gxbb_hdmi_tx_parents[] = {
+	&gxbb_vclk_div1.hw,
+	&gxbb_vclk_div2.hw,
+	&gxbb_vclk_div4.hw,
+	&gxbb_vclk_div6.hw,
+	&gxbb_vclk_div12.hw,
+	&gxbb_vclk2_div1.hw,
+	&gxbb_vclk2_div2.hw,
+	&gxbb_vclk2_div4.hw,
+	&gxbb_vclk2_div6.hw,
+	&gxbb_vclk2_div12.hw,
+};
+
+static struct clk_regmap gxbb_hdmi_tx_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_HDMI_CLK_CNTL,
+		.mask = 0xf,
+		.shift = 16,
+		.table = gxbb_hdmi_tx_parents_val_table,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "hdmi_tx_sel",
+		.ops = &clk_regmap_mux_ops,
+		/*
+		 * bits 31:28 selects from 12 possible parents:
+		 * vclk_div1, vclk_div2, vclk_div4, vclk_div6, vclk_div12
+		 * vclk2_div1, vclk2_div2, vclk2_div4, vclk2_div6, vclk2_div12,
+		 * cts_tcon
+		 */
+		.parent_hws = gxbb_hdmi_tx_parents,
+		.num_parents = ARRAY_SIZE(gxbb_hdmi_tx_parents),
+		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,
+	},
+};
+
 static struct clk_regmap gxbb_hdmi_tx = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = HHI_VID_CLK_CNTL2,
@@ -2493,7 +2491,7 @@ static struct clk_regmap gxbb_hdmi_tx = {
 
 /* HDMI Clocks */
 
-static const struct clk_parent_data gxbb_hdmi_parent_data[] = {
+static const struct clk_parent_data gxbb_hdmi_parents[] = {
 	{ .fw_name = "xtal", },
 	{ .hw = &gxbb_fclk_div4.hw },
 	{ .hw = &gxbb_fclk_div3.hw },
@@ -2510,8 +2508,8 @@ static struct clk_regmap gxbb_hdmi_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "hdmi_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = gxbb_hdmi_parent_data,
-		.num_parents = ARRAY_SIZE(gxbb_hdmi_parent_data),
+		.parent_data = gxbb_hdmi_parents,
+		.num_parents = ARRAY_SIZE(gxbb_hdmi_parents),
 		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,
 	},
 };
@@ -2547,7 +2545,7 @@ static struct clk_regmap gxbb_hdmi = {
 
 /* VDEC clocks */
 
-static const struct clk_hw *gxbb_vdec_parent_hws[] = {
+static const struct clk_hw *gxbb_vdec_parents[] = {
 	&gxbb_fclk_div4.hw,
 	&gxbb_fclk_div3.hw,
 	&gxbb_fclk_div5.hw,
@@ -2564,8 +2562,8 @@ static struct clk_regmap gxbb_vdec_1_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vdec_1_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = gxbb_vdec_parent_hws,
-		.num_parents = ARRAY_SIZE(gxbb_vdec_parent_hws),
+		.parent_hws = gxbb_vdec_parents,
+		.num_parents = ARRAY_SIZE(gxbb_vdec_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -2614,8 +2612,8 @@ static struct clk_regmap gxbb_vdec_hevc_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vdec_hevc_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = gxbb_vdec_parent_hws,
-		.num_parents = ARRAY_SIZE(gxbb_vdec_parent_hws),
+		.parent_hws = gxbb_vdec_parents,
+		.num_parents = ARRAY_SIZE(gxbb_vdec_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -2654,9 +2652,8 @@ static struct clk_regmap gxbb_vdec_hevc = {
 	},
 };
 
-static u32 mux_table_gen_clk[]	= { 0, 4, 5, 6, 7, 8,
-				    9, 10, 11, 13, 14, };
-static const struct clk_parent_data gen_clk_parent_data[] = {
+static u32 gxbb_gen_clk_parents_val_table[] = { 0, 4, 5, 6, 7, 8, 9, 10, 11, 13, 14, };
+static const struct clk_parent_data gxbb_gen_clk_parents[] = {
 	{ .fw_name = "xtal", },
 	{ .hw = &gxbb_vdec_1.hw },
 	{ .hw = &gxbb_vdec_hevc.hw },
@@ -2675,7 +2672,7 @@ static struct clk_regmap gxbb_gen_clk_sel = {
 		.offset = HHI_GEN_CLK_CNTL,
 		.mask = 0xf,
 		.shift = 12,
-		.table = mux_table_gen_clk,
+		.table = gxbb_gen_clk_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "gen_clk_sel",
@@ -2686,8 +2683,8 @@ static struct clk_regmap gxbb_gen_clk_sel = {
 		 * vid_pll, vid2_pll (hevc), mpll0, mpll1, mpll2, fdiv4,
 		 * fdiv3, fdiv5, [cts_msr_clk], fdiv7, gp0_pll
 		 */
-		.parent_data = gen_clk_parent_data,
-		.num_parents = ARRAY_SIZE(gen_clk_parent_data),
+		.parent_data = gxbb_gen_clk_parents,
+		.num_parents = ARRAY_SIZE(gxbb_gen_clk_parents),
 	},
 };
 
@@ -2724,100 +2721,100 @@ static struct clk_regmap gxbb_gen_clk = {
 	},
 };
 
-#define MESON_GATE(_name, _reg, _bit) \
+#define GXBB_PCLK(_name, _reg, _bit) \
 	MESON_PCLK(_name, _reg, _bit, &gxbb_clk81.hw)
 
 /* Everything Else (EE) domain gates */
-static MESON_GATE(gxbb_ddr, HHI_GCLK_MPEG0, 0);
-static MESON_GATE(gxbb_dos, HHI_GCLK_MPEG0, 1);
-static MESON_GATE(gxbb_isa, HHI_GCLK_MPEG0, 5);
-static MESON_GATE(gxbb_pl301, HHI_GCLK_MPEG0, 6);
-static MESON_GATE(gxbb_periphs, HHI_GCLK_MPEG0, 7);
-static MESON_GATE(gxbb_spicc, HHI_GCLK_MPEG0, 8);
-static MESON_GATE(gxbb_i2c, HHI_GCLK_MPEG0, 9);
-static MESON_GATE(gxbb_sana, HHI_GCLK_MPEG0, 10);
-static MESON_GATE(gxbb_smart_card, HHI_GCLK_MPEG0, 11);
-static MESON_GATE(gxbb_rng0, HHI_GCLK_MPEG0, 12);
-static MESON_GATE(gxbb_uart0, HHI_GCLK_MPEG0, 13);
-static MESON_GATE(gxbb_sdhc, HHI_GCLK_MPEG0, 14);
-static MESON_GATE(gxbb_stream, HHI_GCLK_MPEG0, 15);
-static MESON_GATE(gxbb_async_fifo, HHI_GCLK_MPEG0, 16);
-static MESON_GATE(gxbb_sdio, HHI_GCLK_MPEG0, 17);
-static MESON_GATE(gxbb_abuf, HHI_GCLK_MPEG0, 18);
-static MESON_GATE(gxbb_hiu_iface, HHI_GCLK_MPEG0, 19);
-static MESON_GATE(gxbb_assist_misc, HHI_GCLK_MPEG0, 23);
-static MESON_GATE(gxbb_emmc_a, HHI_GCLK_MPEG0, 24);
-static MESON_GATE(gxbb_emmc_b, HHI_GCLK_MPEG0, 25);
-static MESON_GATE(gxbb_emmc_c, HHI_GCLK_MPEG0, 26);
-static MESON_GATE(gxl_acodec, HHI_GCLK_MPEG0, 28);
-static MESON_GATE(gxbb_spi, HHI_GCLK_MPEG0, 30);
-
-static MESON_GATE(gxbb_i2s_spdif, HHI_GCLK_MPEG1, 2);
-static MESON_GATE(gxbb_eth, HHI_GCLK_MPEG1, 3);
-static MESON_GATE(gxbb_demux, HHI_GCLK_MPEG1, 4);
-static MESON_GATE(gxbb_blkmv, HHI_GCLK_MPEG1, 14);
-static MESON_GATE(gxbb_aiu, HHI_GCLK_MPEG1, 15);
-static MESON_GATE(gxbb_uart1, HHI_GCLK_MPEG1, 16);
-static MESON_GATE(gxbb_g2d, HHI_GCLK_MPEG1, 20);
-static MESON_GATE(gxbb_usb0, HHI_GCLK_MPEG1, 21);
-static MESON_GATE(gxbb_usb1, HHI_GCLK_MPEG1, 22);
-static MESON_GATE(gxbb_reset, HHI_GCLK_MPEG1, 23);
-static MESON_GATE(gxbb_nand, HHI_GCLK_MPEG1, 24);
-static MESON_GATE(gxbb_dos_parser, HHI_GCLK_MPEG1, 25);
-static MESON_GATE(gxbb_usb, HHI_GCLK_MPEG1, 26);
-static MESON_GATE(gxbb_vdin1, HHI_GCLK_MPEG1, 28);
-static MESON_GATE(gxbb_ahb_arb0, HHI_GCLK_MPEG1, 29);
-static MESON_GATE(gxbb_efuse, HHI_GCLK_MPEG1, 30);
-static MESON_GATE(gxbb_boot_rom, HHI_GCLK_MPEG1, 31);
-
-static MESON_GATE(gxbb_ahb_data_bus, HHI_GCLK_MPEG2, 1);
-static MESON_GATE(gxbb_ahb_ctrl_bus, HHI_GCLK_MPEG2, 2);
-static MESON_GATE(gxbb_hdmi_intr_sync, HHI_GCLK_MPEG2, 3);
-static MESON_GATE(gxbb_hdmi_pclk, HHI_GCLK_MPEG2, 4);
-static MESON_GATE(gxbb_usb1_ddr_bridge, HHI_GCLK_MPEG2, 8);
-static MESON_GATE(gxbb_usb0_ddr_bridge, HHI_GCLK_MPEG2, 9);
-static MESON_GATE(gxbb_mmc_pclk, HHI_GCLK_MPEG2, 11);
-static MESON_GATE(gxbb_dvin, HHI_GCLK_MPEG2, 12);
-static MESON_GATE(gxbb_uart2, HHI_GCLK_MPEG2, 15);
-static MESON_GATE(gxbb_sar_adc, HHI_GCLK_MPEG2, 22);
-static MESON_GATE(gxbb_vpu_intr, HHI_GCLK_MPEG2, 25);
-static MESON_GATE(gxbb_sec_ahb_ahb3_bridge, HHI_GCLK_MPEG2, 26);
-static MESON_GATE(gxbb_clk81_a53, HHI_GCLK_MPEG2, 29);
-
-static MESON_GATE(gxbb_vclk2_venci0, HHI_GCLK_OTHER, 1);
-static MESON_GATE(gxbb_vclk2_venci1, HHI_GCLK_OTHER, 2);
-static MESON_GATE(gxbb_vclk2_vencp0, HHI_GCLK_OTHER, 3);
-static MESON_GATE(gxbb_vclk2_vencp1, HHI_GCLK_OTHER, 4);
-static MESON_GATE(gxbb_gclk_venci_int0, HHI_GCLK_OTHER, 8);
-static MESON_GATE(gxbb_gclk_vencp_int, HHI_GCLK_OTHER, 9);
-static MESON_GATE(gxbb_dac_clk, HHI_GCLK_OTHER, 10);
-static MESON_GATE(gxbb_aoclk_gate, HHI_GCLK_OTHER, 14);
-static MESON_GATE(gxbb_iec958_gate, HHI_GCLK_OTHER, 16);
-static MESON_GATE(gxbb_enc480p, HHI_GCLK_OTHER, 20);
-static MESON_GATE(gxbb_rng1, HHI_GCLK_OTHER, 21);
-static MESON_GATE(gxbb_gclk_venci_int1, HHI_GCLK_OTHER, 22);
-static MESON_GATE(gxbb_vclk2_venclmcc, HHI_GCLK_OTHER, 24);
-static MESON_GATE(gxbb_vclk2_vencl, HHI_GCLK_OTHER, 25);
-static MESON_GATE(gxbb_vclk_other, HHI_GCLK_OTHER, 26);
-static MESON_GATE(gxbb_edp, HHI_GCLK_OTHER, 31);
+static GXBB_PCLK(gxbb_ddr,		HHI_GCLK_MPEG0, 0);
+static GXBB_PCLK(gxbb_dos,		HHI_GCLK_MPEG0, 1);
+static GXBB_PCLK(gxbb_isa,		HHI_GCLK_MPEG0, 5);
+static GXBB_PCLK(gxbb_pl301,		HHI_GCLK_MPEG0, 6);
+static GXBB_PCLK(gxbb_periphs,		HHI_GCLK_MPEG0, 7);
+static GXBB_PCLK(gxbb_spicc,		HHI_GCLK_MPEG0, 8);
+static GXBB_PCLK(gxbb_i2c,		HHI_GCLK_MPEG0, 9);
+static GXBB_PCLK(gxbb_sana,		HHI_GCLK_MPEG0, 10);
+static GXBB_PCLK(gxbb_smart_card,	HHI_GCLK_MPEG0, 11);
+static GXBB_PCLK(gxbb_rng0,		HHI_GCLK_MPEG0, 12);
+static GXBB_PCLK(gxbb_uart0,		HHI_GCLK_MPEG0, 13);
+static GXBB_PCLK(gxbb_sdhc,		HHI_GCLK_MPEG0, 14);
+static GXBB_PCLK(gxbb_stream,		HHI_GCLK_MPEG0, 15);
+static GXBB_PCLK(gxbb_async_fifo,	HHI_GCLK_MPEG0, 16);
+static GXBB_PCLK(gxbb_sdio,		HHI_GCLK_MPEG0, 17);
+static GXBB_PCLK(gxbb_abuf,		HHI_GCLK_MPEG0, 18);
+static GXBB_PCLK(gxbb_hiu_iface,	HHI_GCLK_MPEG0, 19);
+static GXBB_PCLK(gxbb_assist_misc,	HHI_GCLK_MPEG0, 23);
+static GXBB_PCLK(gxbb_emmc_a,		HHI_GCLK_MPEG0, 24);
+static GXBB_PCLK(gxbb_emmc_b,		HHI_GCLK_MPEG0, 25);
+static GXBB_PCLK(gxbb_emmc_c,		HHI_GCLK_MPEG0, 26);
+static GXBB_PCLK(gxl_acodec,		HHI_GCLK_MPEG0, 28);
+static GXBB_PCLK(gxbb_spi,		HHI_GCLK_MPEG0, 30);
+
+static GXBB_PCLK(gxbb_i2s_spdif,	HHI_GCLK_MPEG1, 2);
+static GXBB_PCLK(gxbb_eth,		HHI_GCLK_MPEG1, 3);
+static GXBB_PCLK(gxbb_demux,		HHI_GCLK_MPEG1, 4);
+static GXBB_PCLK(gxbb_blkmv,		HHI_GCLK_MPEG1, 14);
+static GXBB_PCLK(gxbb_aiu,		HHI_GCLK_MPEG1, 15);
+static GXBB_PCLK(gxbb_uart1,		HHI_GCLK_MPEG1, 16);
+static GXBB_PCLK(gxbb_g2d,		HHI_GCLK_MPEG1, 20);
+static GXBB_PCLK(gxbb_usb0,		HHI_GCLK_MPEG1, 21);
+static GXBB_PCLK(gxbb_usb1,		HHI_GCLK_MPEG1, 22);
+static GXBB_PCLK(gxbb_reset,		HHI_GCLK_MPEG1, 23);
+static GXBB_PCLK(gxbb_nand,		HHI_GCLK_MPEG1, 24);
+static GXBB_PCLK(gxbb_dos_parser,	HHI_GCLK_MPEG1, 25);
+static GXBB_PCLK(gxbb_usb,		HHI_GCLK_MPEG1, 26);
+static GXBB_PCLK(gxbb_vdin1,		HHI_GCLK_MPEG1, 28);
+static GXBB_PCLK(gxbb_ahb_arb0,		HHI_GCLK_MPEG1, 29);
+static GXBB_PCLK(gxbb_efuse,		HHI_GCLK_MPEG1, 30);
+static GXBB_PCLK(gxbb_boot_rom,		HHI_GCLK_MPEG1, 31);
+
+static GXBB_PCLK(gxbb_ahb_data_bus,	HHI_GCLK_MPEG2, 1);
+static GXBB_PCLK(gxbb_ahb_ctrl_bus,	HHI_GCLK_MPEG2, 2);
+static GXBB_PCLK(gxbb_hdmi_intr_sync,	HHI_GCLK_MPEG2, 3);
+static GXBB_PCLK(gxbb_hdmi_pclk,	HHI_GCLK_MPEG2, 4);
+static GXBB_PCLK(gxbb_usb1_ddr_bridge,	HHI_GCLK_MPEG2, 8);
+static GXBB_PCLK(gxbb_usb0_ddr_bridge,	HHI_GCLK_MPEG2, 9);
+static GXBB_PCLK(gxbb_mmc_pclk,		HHI_GCLK_MPEG2, 11);
+static GXBB_PCLK(gxbb_dvin,		HHI_GCLK_MPEG2, 12);
+static GXBB_PCLK(gxbb_uart2,		HHI_GCLK_MPEG2, 15);
+static GXBB_PCLK(gxbb_sar_adc,		HHI_GCLK_MPEG2, 22);
+static GXBB_PCLK(gxbb_vpu_intr,		HHI_GCLK_MPEG2, 25);
+static GXBB_PCLK(gxbb_sec_ahb_ahb3_bridge, HHI_GCLK_MPEG2, 26);
+static GXBB_PCLK(gxbb_clk81_a53,	HHI_GCLK_MPEG2, 29);
+
+static GXBB_PCLK(gxbb_vclk2_venci0,	HHI_GCLK_OTHER, 1);
+static GXBB_PCLK(gxbb_vclk2_venci1,	HHI_GCLK_OTHER, 2);
+static GXBB_PCLK(gxbb_vclk2_vencp0,	HHI_GCLK_OTHER, 3);
+static GXBB_PCLK(gxbb_vclk2_vencp1,	HHI_GCLK_OTHER, 4);
+static GXBB_PCLK(gxbb_gclk_venci_int0,	HHI_GCLK_OTHER, 8);
+static GXBB_PCLK(gxbb_gclk_vencp_int,	HHI_GCLK_OTHER, 9);
+static GXBB_PCLK(gxbb_dac_clk,		HHI_GCLK_OTHER, 10);
+static GXBB_PCLK(gxbb_aoclk_gate,	HHI_GCLK_OTHER, 14);
+static GXBB_PCLK(gxbb_iec958_gate,	HHI_GCLK_OTHER, 16);
+static GXBB_PCLK(gxbb_enc480p,		HHI_GCLK_OTHER, 20);
+static GXBB_PCLK(gxbb_rng1,		HHI_GCLK_OTHER, 21);
+static GXBB_PCLK(gxbb_gclk_venci_int1,	HHI_GCLK_OTHER, 22);
+static GXBB_PCLK(gxbb_vclk2_venclmcc,	HHI_GCLK_OTHER, 24);
+static GXBB_PCLK(gxbb_vclk2_vencl,	HHI_GCLK_OTHER, 25);
+static GXBB_PCLK(gxbb_vclk_other,	HHI_GCLK_OTHER, 26);
+static GXBB_PCLK(gxbb_edp,		HHI_GCLK_OTHER, 31);
 
 /* Always On (AO) domain gates */
 
-static MESON_GATE(gxbb_ao_media_cpu, HHI_GCLK_AO, 0);
-static MESON_GATE(gxbb_ao_ahb_sram, HHI_GCLK_AO, 1);
-static MESON_GATE(gxbb_ao_ahb_bus, HHI_GCLK_AO, 2);
-static MESON_GATE(gxbb_ao_iface, HHI_GCLK_AO, 3);
-static MESON_GATE(gxbb_ao_i2c, HHI_GCLK_AO, 4);
+static GXBB_PCLK(gxbb_ao_media_cpu,	HHI_GCLK_AO, 0);
+static GXBB_PCLK(gxbb_ao_ahb_sram,	HHI_GCLK_AO, 1);
+static GXBB_PCLK(gxbb_ao_ahb_bus,	HHI_GCLK_AO, 2);
+static GXBB_PCLK(gxbb_ao_iface,		HHI_GCLK_AO, 3);
+static GXBB_PCLK(gxbb_ao_i2c,		HHI_GCLK_AO, 4);
 
 /* AIU gates */
-static MESON_PCLK(gxbb_aiu_glue, HHI_GCLK_MPEG1, 6, &gxbb_aiu.hw);
-static MESON_PCLK(gxbb_iec958, HHI_GCLK_MPEG1, 7, &gxbb_aiu_glue.hw);
-static MESON_PCLK(gxbb_i2s_out, HHI_GCLK_MPEG1, 8, &gxbb_aiu_glue.hw);
-static MESON_PCLK(gxbb_amclk, HHI_GCLK_MPEG1, 9, &gxbb_aiu_glue.hw);
-static MESON_PCLK(gxbb_aififo2, HHI_GCLK_MPEG1, 10, &gxbb_aiu_glue.hw);
-static MESON_PCLK(gxbb_mixer, HHI_GCLK_MPEG1, 11, &gxbb_aiu_glue.hw);
-static MESON_PCLK(gxbb_mixer_iface, HHI_GCLK_MPEG1, 12, &gxbb_aiu_glue.hw);
-static MESON_PCLK(gxbb_adc, HHI_GCLK_MPEG1, 13, &gxbb_aiu_glue.hw);
+static MESON_PCLK(gxbb_aiu_glue,	HHI_GCLK_MPEG1,  6, &gxbb_aiu.hw);
+static MESON_PCLK(gxbb_iec958,		HHI_GCLK_MPEG1,  7, &gxbb_aiu_glue.hw);
+static MESON_PCLK(gxbb_i2s_out,		HHI_GCLK_MPEG1,  8, &gxbb_aiu_glue.hw);
+static MESON_PCLK(gxbb_amclk,		HHI_GCLK_MPEG1,  9, &gxbb_aiu_glue.hw);
+static MESON_PCLK(gxbb_aififo2,		HHI_GCLK_MPEG1, 10, &gxbb_aiu_glue.hw);
+static MESON_PCLK(gxbb_mixer,		HHI_GCLK_MPEG1, 11, &gxbb_aiu_glue.hw);
+static MESON_PCLK(gxbb_mixer_iface,	HHI_GCLK_MPEG1, 12, &gxbb_aiu_glue.hw);
+static MESON_PCLK(gxbb_adc,		HHI_GCLK_MPEG1, 13, &gxbb_aiu_glue.hw);
 
 /* Array of all clocks provided by this provider */
 
@@ -2831,8 +2828,8 @@ static struct clk_hw *gxbb_hw_clks[] = {
 	[CLKID_FCLK_DIV5]	    = &gxbb_fclk_div5.hw,
 	[CLKID_FCLK_DIV7]	    = &gxbb_fclk_div7.hw,
 	[CLKID_GP0_PLL]		    = &gxbb_gp0_pll.hw,
-	[CLKID_MPEG_SEL]	    = &gxbb_mpeg_clk_sel.hw,
-	[CLKID_MPEG_DIV]	    = &gxbb_mpeg_clk_div.hw,
+	[CLKID_MPEG_SEL]	    = &gxbb_clk81_sel.hw,
+	[CLKID_MPEG_DIV]	    = &gxbb_clk81_div.hw,
 	[CLKID_CLK81]		    = &gxbb_clk81.hw,
 	[CLKID_MPLL0]		    = &gxbb_mpll0.hw,
 	[CLKID_MPLL1]		    = &gxbb_mpll1.hw,
@@ -3039,8 +3036,8 @@ static struct clk_hw *gxl_hw_clks[] = {
 	[CLKID_FCLK_DIV5]	    = &gxbb_fclk_div5.hw,
 	[CLKID_FCLK_DIV7]	    = &gxbb_fclk_div7.hw,
 	[CLKID_GP0_PLL]		    = &gxbb_gp0_pll.hw,
-	[CLKID_MPEG_SEL]	    = &gxbb_mpeg_clk_sel.hw,
-	[CLKID_MPEG_DIV]	    = &gxbb_mpeg_clk_div.hw,
+	[CLKID_MPEG_SEL]	    = &gxbb_clk81_sel.hw,
+	[CLKID_MPEG_DIV]	    = &gxbb_clk81_div.hw,
 	[CLKID_CLK81]		    = &gxbb_clk81.hw,
 	[CLKID_MPLL0]		    = &gxbb_mpll0.hw,
 	[CLKID_MPLL1]		    = &gxbb_mpll1.hw,
@@ -3251,21 +3248,21 @@ static const struct meson_eeclkc_data gxl_clkc_data = {
 	},
 };
 
-static const struct of_device_id clkc_match_table[] = {
+static const struct of_device_id gxbb_clkc_match_table[] = {
 	{ .compatible = "amlogic,gxbb-clkc", .data = &gxbb_clkc_data },
 	{ .compatible = "amlogic,gxl-clkc", .data = &gxl_clkc_data },
 	{},
 };
-MODULE_DEVICE_TABLE(of, clkc_match_table);
+MODULE_DEVICE_TABLE(of, gxbb_clkc_match_table);
 
-static struct platform_driver gxbb_driver = {
+static struct platform_driver gxbb_clkc_driver = {
 	.probe		= meson_eeclkc_probe,
 	.driver		= {
 		.name	= "gxbb-clkc",
-		.of_match_table = clkc_match_table,
+		.of_match_table = gxbb_clkc_match_table,
 	},
 };
-module_platform_driver(gxbb_driver);
+module_platform_driver(gxbb_clkc_driver);
 
 MODULE_DESCRIPTION("Amlogic GXBB Main Clock Controller driver");
 MODULE_LICENSE("GPL");

-- 
2.47.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
