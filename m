Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A338DC83F05
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Jul 2025 16:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X/N4EQ0AGynVuYgyi/3NzghGCH61NhBRynEgDzcsln4=; b=H3nV5AWnxSk4As
	gM58pJoTrhyi89/hxKJDyiSdy9puGKbMOI0Pbdq9Hydp1mQqHbQKrb32HJgNqfihe6IWjC6MIAO/T
	Yj04/bVU++69SNh0iNFKQXotLj4DOtCgGOex0zCymxoie9PRlU6FMeniK13INKsOWhVinZlKH5iy7
	oSCfujzfEwlKgcCu3n6MoMwumEleVX4MAd8k4UHXKXJX2D4m6HIz6EhvfQVRc1RnFW6Yhlw3RYNwC
	3SvqyqMeRxQ2SdOCUDycZhTAsHs8jLVB/l710c7464Hne/cYGTzxYxD6F9wOL/OLARZm2e88qm9pm
	e7jl7vju8ryhlgiViFhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0So-00000008yUg-3Gfc;
	Wed, 02 Jul 2025 16:37:38 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzMi-00000008mqT-1Zku
	for linux-amlogic@lists.infradead.org;
	Wed, 02 Jul 2025 15:27:17 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4537deebb01so24558935e9.0
        for <linux-amlogic@lists.infradead.org>; Wed, 02 Jul 2025 08:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751470035; x=1752074835; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BXRvwlWjT/EyQOfphmccZKzVxuD7M62GOWYIY7jzqaI=;
        b=w+ipSZkTcaO0iSES0t4YTeblqXbOdV1ciblB69tPNyrr2Vjixs1O0qfysMNac0+Xzm
         CXTyUmZnbkgUutce0+NdaXS6+6yJfk/TOK5FlgJ79v3Y2SqeTmJ3qT+ZkQ9NQnUBm3vM
         vWuajluhTaCg0FnQeFYmTdnM3noaZ/DXmGBnUR8xYuqPAhTC5bAeaZf/mgUJVLpGgawV
         zr4rnsR+OMlXCDA5qYNPNejLfGHDwjMz3qMAUJTi+28bnotPVqUqyL5e3MNpuVDkNLLE
         ifK9LgQEz4+4ZV3jRjkuwI9iD1UwmBre6v1sVUm/u+LUMVJi2K1X4IWnwXdt2afYTYc7
         baww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470035; x=1752074835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BXRvwlWjT/EyQOfphmccZKzVxuD7M62GOWYIY7jzqaI=;
        b=RSjDaZOGo3dHEUU4b6yTCyMY3oJbT7BD02VCbQiUKfCAM66+xMse5eBSUhNjWhNSHi
         UgbJVdCKCeqmPS1zQn1pluDvyrEilhBCPseRbwmpBJ6n7/xQpkVIPZhLhlntkJU3CqQD
         bCl/rKX6DyuHuWICPdJhXmC4Gb2rKDg4NB/LpYOuyS4co+VokwIjYrD+Xh2STJtXc5eZ
         KvIQVY5Be95rwW9FOA0/Zs5r+ZNRLqPcdz1SBntsLgjwkTgS6RVgKqE1JUQ7cwkLxNsK
         VCcKG3V34RdwIFZl//0xKId7so+e5AwfHNhXnbHremr6Q/TSSPRIXOyFSg/V3CwGHcbh
         QHPw==
X-Gm-Message-State: AOJu0Yw5mzeEPq9L8C4PYRr3neWdtMr9nfLl7Uoa4zdk47cE1rz5Pq5f
	po4XVxF+2+loxsdmnjC3CMdBc1yZm4sSVeZx7QbJ6Qs0gD1jtUP4RDN/NXegoF+jXZiDwChhA+/
	vVqZ3
X-Gm-Gg: ASbGncsBP0fLECIU+4W2hhPTW6VacS0mWCMogLH1ko9PnycZXcqvXGSj+IJDp45XlrF
	eZ2ZUPaYVUDGGW74964yzEclB0MQFkP6WFVb4Q5sZiMmia4NleUbHrKbm0EcSNpL29rtZ3xPI58
	vkqUIJ7tBKXV3dDWqAmPhjX4w7Uw0ZFatTV8o0UGyKgnSbh53igF7CXfreyzNMSbVp9q8vPk6rT
	j+bLcKVhgZMOxb1RErc4xCM+FqDFkV6ZFGnKJ0qPcDn0UAu9OtlpGz+qjZjr0P0e6FEKS+5JfzJ
	UwdAQ+gXehKYj1Ro5anXiw/v8izHq1M35JwGMxd+aSBAi+b7JVjBfu4kUkZdtDpdSi1ZnfdyjUg
	682t6wnmX8u4=
X-Google-Smtp-Source: AGHT+IG13relPt+fMaFDnlo9fAhiV1HPr4nnHmg8XsHo+YKVo10+/irbdtgHzgJWZrReIhNPCk7xUQ==
X-Received: by 2002:a05:600c:37c7:b0:453:1058:f8aa with SMTP id 5b1f17b1804b1-454a36ec3fdmr40711705e9.15.1751470034729;
        Wed, 02 Jul 2025 08:27:14 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:5542:4bad:e07b:9489])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454a9bcf35csm869205e9.20.2025.07.02.08.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 08:27:14 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 02 Jul 2025 17:26:00 +0200
Subject: [PATCH 02/26] clk: amlogic: a1-pll: naming consistency alignment
MIME-Version: 1.0
Message-Id: <20250702-meson-clk-cleanup-24-v1-2-e163c9a1fc21@baylibre.com>
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8963; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=V/ioS7Ec7Cg3YTVk3xhhI9osc4/59GAF44moXsR7xyM=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoZU+4k+xXNM/NC4iV1vrZpHpGmopZVtnCb0tqt
 pisbMy7xBCJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaGVPuAAKCRDm/A8cN/La
 hReOD/9CXpTsL9ZauAqvRLJMuDtAb+fuwpo2MD5qs8MkAxpcg2Ds9oT4vwOAf/FAldy6pb2zCLa
 96K60+tTKuf1IHl/uxgWN8LvCyZhGNy3ugUdBieO4XedTpZaPdkrOBPYDK/yC4OtsRRgEGqAW35
 QaYhhbnrKijVjawLt//EQhf88wiqhIa8aKNzMWLj0lB4QvqhTmk5ChCIpAPberW7JEsbcuQO+9p
 3wP+BYdevSl7ktgH0MfVsI6xLC4bdKOM+Eca6jVNHDyM6JBEBtYbqgmQ8wgq9ayDn5ox3ccIoeW
 0C436LxcG30mHCkZhH8d5w+0rffTk29vEIKVCt+f6FcnerM0O8RHk4eZRIANi0wy/yumPZ3m+z1
 qPxNMW2y0KnFqGlmEO3sV4HsdpfywEtgyIZIwsWfSfXSxy9iRb223HjB6raqYxkq9hz2JxMCfZv
 E4yFS9oVGEb1MmzHxDy7BBEKzjRBnqfT8eQPqgqFOM5kZS0CGmU+R3j6mnSqvj7VBZk1kMuOpXS
 7pNvkEAM4e10YhJxdmi4JYILyEHsiTErdX0miMuhE0JapF9vMZBM3wl+GP6Mghb6BdMy+IiDvvr
 reQ9Djqg7/dMSRD9Th6Bc8w8NFG/BDEupYXzGdlH6pFPqksom4Zuzyb7hEA5UL68raZuQMV33rL
 tbXMo/Co4+z1QVA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_082716_425222_DA8551C2 
X-CRM114-Status: GOOD (  16.93  )
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
 drivers/clk/meson/a1-pll.c | 76 +++++++++++++++++++++++-----------------------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
index dabd4fad1f57bdfa1d755298cd07a48d345e56a9..79ef4cbe955326ecedceb68cda7f59bb8882b165 100644
--- a/drivers/clk/meson/a1-pll.c
+++ b/drivers/clk/meson/a1-pll.c
@@ -26,7 +26,7 @@
 
 #include <dt-bindings/clock/amlogic,a1-pll-clkc.h>
 
-static struct clk_regmap fixed_pll_dco = {
+static struct clk_regmap a1_fixed_pll_dco = {
 	.data = &(struct meson_clk_pll_data){
 		.en = {
 			.reg_off = ANACTRL_FIXPLL_CTRL0,
@@ -69,7 +69,7 @@ static struct clk_regmap fixed_pll_dco = {
 	},
 };
 
-static struct clk_regmap fixed_pll = {
+static struct clk_regmap a1_fixed_pll = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = ANACTRL_FIXPLL_CTRL0,
 		.bit_idx = 20,
@@ -78,18 +78,18 @@ static struct clk_regmap fixed_pll = {
 		.name = "fixed_pll",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&fixed_pll_dco.hw
+			&a1_fixed_pll_dco.hw
 		},
 		.num_parents = 1,
 	},
 };
 
-static const struct pll_mult_range hifi_pll_mult_range = {
+static const struct pll_mult_range a1_hifi_pll_range = {
 	.min = 32,
 	.max = 64,
 };
 
-static const struct reg_sequence hifi_init_regs[] = {
+static const struct reg_sequence a1_hifi_pll_init_regs[] = {
 	{ .reg = ANACTRL_HIFIPLL_CTRL1, .def = 0x01800000 },
 	{ .reg = ANACTRL_HIFIPLL_CTRL2, .def = 0x00001100 },
 	{ .reg = ANACTRL_HIFIPLL_CTRL3, .def = 0x100a1100 },
@@ -97,7 +97,7 @@ static const struct reg_sequence hifi_init_regs[] = {
 	{ .reg = ANACTRL_HIFIPLL_CTRL0, .def = 0x01f18000 },
 };
 
-static struct clk_regmap hifi_pll = {
+static struct clk_regmap a1_hifi_pll = {
 	.data = &(struct meson_clk_pll_data){
 		.en = {
 			.reg_off = ANACTRL_HIFIPLL_CTRL0,
@@ -134,9 +134,9 @@ static struct clk_regmap hifi_pll = {
 			.shift   = 6,
 			.width   = 1,
 		},
-		.range = &hifi_pll_mult_range,
-		.init_regs = hifi_init_regs,
-		.init_count = ARRAY_SIZE(hifi_init_regs),
+		.range = &a1_hifi_pll_range,
+		.init_regs = a1_hifi_pll_init_regs,
+		.init_count = ARRAY_SIZE(a1_hifi_pll_init_regs),
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "hifi_pll",
@@ -148,20 +148,20 @@ static struct clk_regmap hifi_pll = {
 	},
 };
 
-static struct clk_fixed_factor fclk_div2_div = {
+static struct clk_fixed_factor a1_fclk_div2_div = {
 	.mult = 1,
 	.div = 2,
 	.hw.init = &(struct clk_init_data){
 		.name = "fclk_div2_div",
 		.ops = &clk_fixed_factor_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&fixed_pll.hw
+			&a1_fixed_pll.hw
 		},
 		.num_parents = 1,
 	},
 };
 
-static struct clk_regmap fclk_div2 = {
+static struct clk_regmap a1_fclk_div2 = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = ANACTRL_FIXPLL_CTRL0,
 		.bit_idx = 21,
@@ -170,7 +170,7 @@ static struct clk_regmap fclk_div2 = {
 		.name = "fclk_div2",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&fclk_div2_div.hw
+			&a1_fclk_div2_div.hw
 		},
 		.num_parents = 1,
 		/*
@@ -186,20 +186,20 @@ static struct clk_regmap fclk_div2 = {
 	},
 };
 
-static struct clk_fixed_factor fclk_div3_div = {
+static struct clk_fixed_factor a1_fclk_div3_div = {
 	.mult = 1,
 	.div = 3,
 	.hw.init = &(struct clk_init_data){
 		.name = "fclk_div3_div",
 		.ops = &clk_fixed_factor_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&fixed_pll.hw
+			&a1_fixed_pll.hw
 		},
 		.num_parents = 1,
 	},
 };
 
-static struct clk_regmap fclk_div3 = {
+static struct clk_regmap a1_fclk_div3 = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = ANACTRL_FIXPLL_CTRL0,
 		.bit_idx = 22,
@@ -208,7 +208,7 @@ static struct clk_regmap fclk_div3 = {
 		.name = "fclk_div3",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&fclk_div3_div.hw
+			&a1_fclk_div3_div.hw
 		},
 		.num_parents = 1,
 		/*
@@ -219,20 +219,20 @@ static struct clk_regmap fclk_div3 = {
 	},
 };
 
-static struct clk_fixed_factor fclk_div5_div = {
+static struct clk_fixed_factor a1_fclk_div5_div = {
 	.mult = 1,
 	.div = 5,
 	.hw.init = &(struct clk_init_data){
 		.name = "fclk_div5_div",
 		.ops = &clk_fixed_factor_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&fixed_pll.hw
+			&a1_fixed_pll.hw
 		},
 		.num_parents = 1,
 	},
 };
 
-static struct clk_regmap fclk_div5 = {
+static struct clk_regmap a1_fclk_div5 = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = ANACTRL_FIXPLL_CTRL0,
 		.bit_idx = 23,
@@ -241,7 +241,7 @@ static struct clk_regmap fclk_div5 = {
 		.name = "fclk_div5",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&fclk_div5_div.hw
+			&a1_fclk_div5_div.hw
 		},
 		.num_parents = 1,
 		/*
@@ -252,20 +252,20 @@ static struct clk_regmap fclk_div5 = {
 	},
 };
 
-static struct clk_fixed_factor fclk_div7_div = {
+static struct clk_fixed_factor a1_fclk_div7_div = {
 	.mult = 1,
 	.div = 7,
 	.hw.init = &(struct clk_init_data){
 		.name = "fclk_div7_div",
 		.ops = &clk_fixed_factor_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&fixed_pll.hw
+			&a1_fixed_pll.hw
 		},
 		.num_parents = 1,
 	},
 };
 
-static struct clk_regmap fclk_div7 = {
+static struct clk_regmap a1_fclk_div7 = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = ANACTRL_FIXPLL_CTRL0,
 		.bit_idx = 24,
@@ -274,7 +274,7 @@ static struct clk_regmap fclk_div7 = {
 		.name = "fclk_div7",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&fclk_div7_div.hw
+			&a1_fclk_div7_div.hw
 		},
 		.num_parents = 1,
 	},
@@ -282,17 +282,17 @@ static struct clk_regmap fclk_div7 = {
 
 /* Array of all clocks registered by this provider */
 static struct clk_hw *a1_pll_hw_clks[] = {
-	[CLKID_FIXED_PLL_DCO]	= &fixed_pll_dco.hw,
-	[CLKID_FIXED_PLL]	= &fixed_pll.hw,
-	[CLKID_FCLK_DIV2_DIV]	= &fclk_div2_div.hw,
-	[CLKID_FCLK_DIV3_DIV]	= &fclk_div3_div.hw,
-	[CLKID_FCLK_DIV5_DIV]	= &fclk_div5_div.hw,
-	[CLKID_FCLK_DIV7_DIV]	= &fclk_div7_div.hw,
-	[CLKID_FCLK_DIV2]	= &fclk_div2.hw,
-	[CLKID_FCLK_DIV3]	= &fclk_div3.hw,
-	[CLKID_FCLK_DIV5]	= &fclk_div5.hw,
-	[CLKID_FCLK_DIV7]	= &fclk_div7.hw,
-	[CLKID_HIFI_PLL]	= &hifi_pll.hw,
+	[CLKID_FIXED_PLL_DCO]	= &a1_fixed_pll_dco.hw,
+	[CLKID_FIXED_PLL]	= &a1_fixed_pll.hw,
+	[CLKID_FCLK_DIV2_DIV]	= &a1_fclk_div2_div.hw,
+	[CLKID_FCLK_DIV3_DIV]	= &a1_fclk_div3_div.hw,
+	[CLKID_FCLK_DIV5_DIV]	= &a1_fclk_div5_div.hw,
+	[CLKID_FCLK_DIV7_DIV]	= &a1_fclk_div7_div.hw,
+	[CLKID_FCLK_DIV2]	= &a1_fclk_div2.hw,
+	[CLKID_FCLK_DIV3]	= &a1_fclk_div3.hw,
+	[CLKID_FCLK_DIV5]	= &a1_fclk_div5.hw,
+	[CLKID_FCLK_DIV7]	= &a1_fclk_div7.hw,
+	[CLKID_HIFI_PLL]	= &a1_hifi_pll.hw,
 };
 
 static const struct regmap_config a1_pll_regmap_cfg = {
@@ -307,7 +307,7 @@ static struct meson_clk_hw_data a1_pll_clks = {
 	.num = ARRAY_SIZE(a1_pll_hw_clks),
 };
 
-static int meson_a1_pll_probe(struct platform_device *pdev)
+static int a1_pll_clkc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	void __iomem *base;
@@ -344,7 +344,7 @@ static const struct of_device_id a1_pll_clkc_match_table[] = {
 MODULE_DEVICE_TABLE(of, a1_pll_clkc_match_table);
 
 static struct platform_driver a1_pll_clkc_driver = {
-	.probe = meson_a1_pll_probe,
+	.probe = a1_pll_clkc_probe,
 	.driver = {
 		.name = "a1-pll-clkc",
 		.of_match_table = a1_pll_clkc_match_table,

-- 
2.47.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
