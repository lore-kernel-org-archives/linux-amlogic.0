Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32D4CA0EFA
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Aug 2025 15:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NBCNuQ/oYbS7hjXc8pFX4tyZ2is7f6IGShJAN1zKN24=; b=Oj281pR9sP801u
	MaKeSEm4qbYEuYqPYvJFaGu6msdJCxVCD7FaXSyeFagaxOc/rO2/ulNfq5uN/kGX7citMPJ671zZx
	IisQG0Sh+Kbw0ZjpacMClZehqTUd2TZKaCArRP6WbNWbCe9iE7+onWaS64xwykZlP1Lmnvbh6Md/p
	6UzN0yIHmha+3q6/ygGFBVWod2NDF9sz9bVpbs7RyiquCdQw+o8FVgIsG1FBirk9JtkkzvaUVMvkF
	xCx92T/8qmj1vJNNxDgDp7ldSEQhzAz3SYYNzCEe0tBlT/5f7TBfehgPkr7uTRb8kZwdB1+wIVSpV
	TTSjvAixL0tQ2kKVyMEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZ9S-00000008WHM-1AZo;
	Mon, 25 Aug 2025 15:30:30 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYAG-00000008Flb-38WC
	for linux-amlogic@lists.infradead.org;
	Mon, 25 Aug 2025 14:27:18 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45a1b0c52f3so27118145e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 25 Aug 2025 07:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1756132035; x=1756736835; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ztmX1UDMK5rFccXy1oFM7d/s55AHNRDE1K8M0+F4fD8=;
        b=hTN4kerLLk22K7xfplapcR2byDtcq9BxiiMARdaXGRmk+A+kywwm2qls9MPsnN7y1K
         8mvvfkRPTI9CyG1G/7MRcT740nO4Y4vM/+Q3BJZWuhGKIBHatfNYpB2kEHgTBms7A8JV
         qgnZf6mrc3KmB8onMFGcFuo8YxhhDwMm7eNIUpoWC5iL5qItjgq8bb9w4TzDWWPtXbBV
         AgWb7vXh0sSZITn7ELEruh0Imtxfais4NW1jOCrj+lcGUoNT3h0fxsLfSxYMDuMezBsQ
         2gSGsMvjJJYtG5N6YTE2/da8ag6SOiilD7qRxVxqdq7ORWliZ9cgsSYNH/rk08TBESfj
         O/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756132035; x=1756736835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ztmX1UDMK5rFccXy1oFM7d/s55AHNRDE1K8M0+F4fD8=;
        b=Zje7vjnagmoGYHI/q3L+sJVJ6a9+MgTGwc7TB4DN9BEMgX7Qhz0L5eRF+w9FVlROPz
         jPL8nnB5pWsYiXHb9yFyRnRtJHIIL7L/GJdHzHAOBj8SeZRqLC8ImLg1HfL+XZmEI31P
         5DrBEWTf6y0qnh9H4OYcqCWK4+WjEOjDe4lNV+wEk0onRQg5v8G92sHkLxfhvv5JaQRM
         DHEgzisPddS9ycxDi7sJcvJeCyk2u+aKUXIvXtfe/KN7olkK0HMuEKU6A2+5bD94oB1H
         NVMc70dTbtmqZYpLp+hnMvttP0x0+znILX4s0mePKc0waG4xv8T3ySXwP/vZajWHtXu+
         E5eg==
X-Gm-Message-State: AOJu0Yx3lt0E2KU9XHBBUKElk8lMBxBzth6adAgvDFDIP67SnMmurz4e
	Ku7p9BbfwHu4tCAdVPTMvb279xccY01JphSQebJsa9wBba69UUlaQ7M1Y+Owsl3cT/si49dsW3T
	VoXn5
X-Gm-Gg: ASbGncvoDwlOkyvjRf0DD7EjnLpY/vvxe73gAh8b1S149rZTZCu33gESfjePY+WXeJS
	ScAmHZm8jURD/ybysaOGPcnTYBIcKdV9InNiPCbJSUSx8PJrYx4KrcuUjpzGKHLNm7KIuNQzj5c
	avU0q2u2UhkoMKQvE7BtnrqwS8moEae45QjXjFjEpdBsr/whs6iRLiWiM/vX9ZJczSgbd1OUbG1
	4ahP7ovqoWiU6nXfxQDr6tt9aFMxeYtHaD8KSAEvBM6QJfVQz6D5E7iNXNOvVu3N57gxbvuEG4H
	AzOWwCF1O+81DUiMnXyEenun35L+ak8w4CNcgGpwaPaHhSh90VdUPpcoh3w670Fi/gt/NRWugRu
	GW2f9jLEqflQx6X3t7kiwJ3gP3uSRMh60WLj7
X-Google-Smtp-Source: AGHT+IFnC0MUZSq/sl9kL/TcEekI5S6Ch+nzFMuQT2QCGnMv7MVM3STVdYmSZ5zm0xBhJbPzwkXGqQ==
X-Received: by 2002:a05:6000:238a:b0:3b8:d79a:6a60 with SMTP id ffacd0b85a97d-3c5daa27b08mr9526344f8f.3.1756132034951;
        Mon, 25 Aug 2025 07:27:14 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:b261:baab:ed3d:3cb6])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3c70e4b9e1fsm12634462f8f.14.2025.08.25.07.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:27:14 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 25 Aug 2025 16:26:37 +0200
Subject: [PATCH v2 12/12] clk: amlogic: c3-peripherals: use helper for
 basic composite clocks
MIME-Version: 1.0
Message-Id: <20250825-meson-clk-cleanup-24-v2-12-0f402f01e117@baylibre.com>
References: <20250825-meson-clk-cleanup-24-v2-0-0f402f01e117@baylibre.com>
In-Reply-To: <20250825-meson-clk-cleanup-24-v2-0-0f402f01e117@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=32323; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=ps9sLzPPWk2M8ivkTmXUaslXwG8/bmatTRMHNFG1fME=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBorHK4qpXm7JmpvPobuRaQvfv+8Nfs2wLyI4+RD
 dk9RSaqFQCJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaKxyuAAKCRDm/A8cN/La
 hRGoEACDZa/T4n3cZ+Et6j5Ca+v57X1x5SyuJ2iXWhlDxHe0rIZIRSBjD5FqDgNP8mePJIPqeOy
 2YaS4wC25muwGthDedfsI6xl7XNhwxlCgKZ5h4CPT04FFyzHM3lXJtGqD4dkg07zLCTTfCz8Wdm
 WA7eRVBgKHlhd1ZBzjvkTyy1z1dwcHEegWC2tydllMeTYuLRViF+Tn+VHr8+7h8GwjuqOUNpMz6
 ePO23AlWSuH7g6YssXUqKMLjhuijjzDlY1uZSvr9pxgWRR7YVz7O5FFV6qtSFCRJlEMywEl6DER
 mxWzs/7yug9/r40V4AAOgJm+jdwWkeshUssX6XcEUkYbtLlhB7+CpTUzgY/4jHVh/lZ9dI42aOZ
 Tu1ytx2J34WeRVMO3QcL8QmkXWzJA/AyAB6bRWXYohgCKprY4byIfuQnaWTpaJm2tuiGLLrItRz
 sOj2AS73uipN0gd2VJMelZ81x30d6g2MS8cJF2p883WZ6kCTbrXcAww3rU+ZKlSEg37WtE6Bj7J
 92osANTpGYvFn49R1taeZOGT++1gKomnKByigaVhRiATOY+7AHatcRtAZb9IUzwt61UKAMEG8Bp
 z72ZPSjjHi28E4/zIJJnCIXF8XwZxn8+rbm5cT9k8XSNSk/8MPlJBhsdazQ6s33okylcFquTCHB
 NnnmDwwLOOG3xWA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_072716_875536_EEB2270D 
X-CRM114-Status: GOOD (  10.61  )
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

Use the composite clock helpers to define simple composite clocks of
the c3-peripherals clock controller.

This reduces the verbosity of the controller code on these very simple
parts, making maintenance simpler.

Reviewed-by: Chuan Liu <chuan.liu@amlogic.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/c3-peripherals.c | 1029 +++---------------------------------
 1 file changed, 63 insertions(+), 966 deletions(-)

diff --git a/drivers/clk/meson/c3-peripherals.c b/drivers/clk/meson/c3-peripherals.c
index fd35f9b7994720d069c5f72142d6064790d40b60..b158756cfee4dd4bad5c0c9576da02d2cb8ee515 100644
--- a/drivers/clk/meson/c3-peripherals.c
+++ b/drivers/clk/meson/c3-peripherals.c
@@ -467,52 +467,9 @@ static const struct clk_parent_data c3_saradc_parents[] = {
 	{ .fw_name = "sysclk" }
 };
 
-static struct clk_regmap c3_saradc_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = SAR_CLK_CTRL0,
-		.mask = 0x1,
-		.shift = 9,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "saradc_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = c3_saradc_parents,
-		.num_parents = ARRAY_SIZE(c3_saradc_parents),
-	},
-};
-
-static struct clk_regmap c3_saradc_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = SAR_CLK_CTRL0,
-		.shift = 0,
-		.width = 8,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "saradc_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_saradc_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap c3_saradc = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = SAR_CLK_CTRL0,
-		.bit_idx = 8,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "saradc",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_saradc_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static C3_COMP_SEL(saradc, SAR_CLK_CTRL0, 9, 0x1, c3_saradc_parents);
+static C3_COMP_DIV(saradc, SAR_CLK_CTRL0, 0, 8);
+static C3_COMP_GATE(saradc, SAR_CLK_CTRL0, 8);
 
 static const struct clk_parent_data c3_pwm_parents[] = {
 	{ .fw_name = "oscin" },
@@ -588,99 +545,13 @@ static const struct clk_parent_data c3_spicc_parents[] = {
 	{ .fw_name = "gp1" }
 };
 
-static struct clk_regmap c3_spicc_a_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = SPICC_CLK_CTRL,
-		.mask = 0x7,
-		.shift = 7,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "spicc_a_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = c3_spicc_parents,
-		.num_parents = ARRAY_SIZE(c3_spicc_parents),
-	},
-};
-
-static struct clk_regmap c3_spicc_a_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = SPICC_CLK_CTRL,
-		.shift = 0,
-		.width = 6,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "spicc_a_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_spicc_a_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap c3_spicc_a = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = SPICC_CLK_CTRL,
-		.bit_idx = 6,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "spicc_a",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_spicc_a_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap c3_spicc_b_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = SPICC_CLK_CTRL,
-		.mask = 0x7,
-		.shift = 23,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "spicc_b_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = c3_spicc_parents,
-		.num_parents = ARRAY_SIZE(c3_spicc_parents),
-	},
-};
-
-static struct clk_regmap c3_spicc_b_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = SPICC_CLK_CTRL,
-		.shift = 16,
-		.width = 6,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "spicc_b_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_spicc_b_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static C3_COMP_SEL(spicc_a, SPICC_CLK_CTRL, 7, 0x7, c3_spicc_parents);
+static C3_COMP_DIV(spicc_a, SPICC_CLK_CTRL, 0, 6);
+static C3_COMP_GATE(spicc_a, SPICC_CLK_CTRL,  6);
 
-static struct clk_regmap c3_spicc_b = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = SPICC_CLK_CTRL,
-		.bit_idx = 22,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "spicc_b",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_spicc_b_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static C3_COMP_SEL(spicc_b, SPICC_CLK_CTRL, 23, 0x7, c3_spicc_parents);
+static C3_COMP_DIV(spicc_b, SPICC_CLK_CTRL, 16, 6);
+static C3_COMP_GATE(spicc_b, SPICC_CLK_CTRL, 22);
 
 static const struct clk_parent_data c3_spifc_parents[] = {
 	{ .fw_name = "gp0" },
@@ -693,52 +564,9 @@ static const struct clk_parent_data c3_spifc_parents[] = {
 	{ .fw_name = "fdiv7" }
 };
 
-static struct clk_regmap c3_spifc_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = SPIFC_CLK_CTRL,
-		.mask = 0x7,
-		.shift = 9,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "spifc_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = c3_spifc_parents,
-		.num_parents = ARRAY_SIZE(c3_spifc_parents),
-	},
-};
-
-static struct clk_regmap c3_spifc_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = SPIFC_CLK_CTRL,
-		.shift = 0,
-		.width = 7,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "spifc_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_spifc_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap c3_spifc = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = SPIFC_CLK_CTRL,
-		.bit_idx = 8,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "spifc",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_spifc_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static C3_COMP_SEL(spifc, SPIFC_CLK_CTRL, 9, 0x7, c3_spifc_parents);
+static C3_COMP_DIV(spifc, SPIFC_CLK_CTRL, 0, 7);
+static C3_COMP_GATE(spifc, SPIFC_CLK_CTRL,  8);
 
 static const struct clk_parent_data c3_sd_emmc_parents[] = {
 	{ .fw_name = "oscin" },
@@ -751,146 +579,17 @@ static const struct clk_parent_data c3_sd_emmc_parents[] = {
 	{ .fw_name = "gp0" }
 };
 
-static struct clk_regmap c3_sd_emmc_a_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = SD_EMMC_CLK_CTRL,
-		.mask = 0x7,
-		.shift = 9,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "sd_emmc_a_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = c3_sd_emmc_parents,
-		.num_parents = ARRAY_SIZE(c3_sd_emmc_parents),
-	},
-};
-
-static struct clk_regmap c3_sd_emmc_a_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = SD_EMMC_CLK_CTRL,
-		.shift = 0,
-		.width = 7,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "sd_emmc_a_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_sd_emmc_a_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap c3_sd_emmc_a = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = SD_EMMC_CLK_CTRL,
-		.bit_idx = 7,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "sd_emmc_a",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_sd_emmc_a_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap c3_sd_emmc_b_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = SD_EMMC_CLK_CTRL,
-		.mask = 0x7,
-		.shift = 25,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "sd_emmc_b_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = c3_sd_emmc_parents,
-		.num_parents = ARRAY_SIZE(c3_sd_emmc_parents),
-	},
-};
-
-static struct clk_regmap c3_sd_emmc_b_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = SD_EMMC_CLK_CTRL,
-		.shift = 16,
-		.width = 7,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "sd_emmc_b_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_sd_emmc_b_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap c3_sd_emmc_b = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = SD_EMMC_CLK_CTRL,
-		.bit_idx = 23,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "sd_emmc_b",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_sd_emmc_b_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap c3_sd_emmc_c_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = NAND_CLK_CTRL,
-		.mask = 0x7,
-		.shift = 9,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "sd_emmc_c_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = c3_sd_emmc_parents,
-		.num_parents = ARRAY_SIZE(c3_sd_emmc_parents),
-	},
-};
+static C3_COMP_SEL(sd_emmc_a, SD_EMMC_CLK_CTRL, 9, 0x7, c3_sd_emmc_parents);
+static C3_COMP_DIV(sd_emmc_a, SD_EMMC_CLK_CTRL, 0, 7);
+static C3_COMP_GATE(sd_emmc_a, SD_EMMC_CLK_CTRL,  7);
 
-static struct clk_regmap c3_sd_emmc_c_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = NAND_CLK_CTRL,
-		.shift = 0,
-		.width = 7,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "sd_emmc_c_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_sd_emmc_c_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static C3_COMP_SEL(sd_emmc_b, SD_EMMC_CLK_CTRL, 25, 0x7, c3_sd_emmc_parents);
+static C3_COMP_DIV(sd_emmc_b, SD_EMMC_CLK_CTRL, 16, 7);
+static C3_COMP_GATE(sd_emmc_b, SD_EMMC_CLK_CTRL, 23);
 
-static struct clk_regmap c3_sd_emmc_c = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = NAND_CLK_CTRL,
-		.bit_idx = 7,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "sd_emmc_c",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_sd_emmc_c_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static C3_COMP_SEL(sd_emmc_c, NAND_CLK_CTRL, 9, 0x7, c3_sd_emmc_parents);
+static C3_COMP_DIV(sd_emmc_c, NAND_CLK_CTRL, 0, 7);
+static C3_COMP_GATE(sd_emmc_c, NAND_CLK_CTRL, 7);
 
 static struct clk_regmap c3_ts_div = {
 	.data = &(struct clk_regmap_div_data) {
@@ -996,52 +695,9 @@ static const struct clk_parent_data c3_mipi_dsi_meas_parents[] = {
 	{ .fw_name = "fdiv7" }
 };
 
-static struct clk_regmap c3_mipi_dsi_meas_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = VDIN_MEAS_CLK_CTRL,
-		.mask = 0x7,
-		.shift = 21,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "mipi_dsi_meas_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = c3_mipi_dsi_meas_parents,
-		.num_parents = ARRAY_SIZE(c3_mipi_dsi_meas_parents),
-	},
-};
-
-static struct clk_regmap c3_mipi_dsi_meas_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = VDIN_MEAS_CLK_CTRL,
-		.shift = 12,
-		.width = 7,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "mipi_dsi_meas_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_mipi_dsi_meas_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap c3_mipi_dsi_meas = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = VDIN_MEAS_CLK_CTRL,
-		.bit_idx = 20,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "mipi_dsi_meas",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_mipi_dsi_meas_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static C3_COMP_SEL(mipi_dsi_meas, VDIN_MEAS_CLK_CTRL, 21, 0x7, c3_mipi_dsi_meas_parents);
+static C3_COMP_DIV(mipi_dsi_meas, VDIN_MEAS_CLK_CTRL, 12, 7);
+static C3_COMP_GATE(mipi_dsi_meas, VDIN_MEAS_CLK_CTRL, 20);
 
 static const struct clk_parent_data c3_dsi_phy_parents[] = {
 	{ .fw_name = "gp1" },
@@ -1054,52 +710,9 @@ static const struct clk_parent_data c3_dsi_phy_parents[] = {
 	{ .fw_name = "fdiv7" }
 };
 
-static struct clk_regmap c3_dsi_phy_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = MIPIDSI_PHY_CLK_CTRL,
-		.mask = 0x7,
-		.shift = 12,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "dsi_phy_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = c3_dsi_phy_parents,
-		.num_parents = ARRAY_SIZE(c3_dsi_phy_parents),
-	},
-};
-
-static struct clk_regmap c3_dsi_phy_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = MIPIDSI_PHY_CLK_CTRL,
-		.shift = 0,
-		.width = 7,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "dsi_phy_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_dsi_phy_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap c3_dsi_phy = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = MIPIDSI_PHY_CLK_CTRL,
-		.bit_idx = 8,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "dsi_phy",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_dsi_phy_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static C3_COMP_SEL(dsi_phy, MIPIDSI_PHY_CLK_CTRL, 12, 0x7, c3_dsi_phy_parents);
+static C3_COMP_DIV(dsi_phy, MIPIDSI_PHY_CLK_CTRL, 0, 7);
+static C3_COMP_GATE(dsi_phy, MIPIDSI_PHY_CLK_CTRL, 8);
 
 static const struct clk_parent_data c3_vout_mclk_parents[] = {
 	{ .fw_name = "fdiv2p5" },
@@ -1112,52 +725,9 @@ static const struct clk_parent_data c3_vout_mclk_parents[] = {
 	{ .fw_name = "fdiv7" }
 };
 
-static struct clk_regmap c3_vout_mclk_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = VOUTENC_CLK_CTRL,
-		.mask = 0x7,
-		.shift = 9,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "vout_mclk_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = c3_vout_mclk_parents,
-		.num_parents = ARRAY_SIZE(c3_vout_mclk_parents),
-	},
-};
-
-static struct clk_regmap c3_vout_mclk_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = VOUTENC_CLK_CTRL,
-		.shift = 0,
-		.width = 7,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "vout_mclk_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_vout_mclk_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap c3_vout_mclk = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = VOUTENC_CLK_CTRL,
-		.bit_idx = 8,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "vout_mclk",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_vout_mclk_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static C3_COMP_SEL(vout_mclk, VOUTENC_CLK_CTRL, 9, 0x7, c3_vout_mclk_parents);
+static C3_COMP_DIV(vout_mclk, VOUTENC_CLK_CTRL, 0, 7);
+static C3_COMP_GATE(vout_mclk, VOUTENC_CLK_CTRL, 8);
 
 static const struct clk_parent_data c3_vout_enc_parents[] = {
 	{ .fw_name = "gp1" },
@@ -1170,52 +740,9 @@ static const struct clk_parent_data c3_vout_enc_parents[] = {
 	{ .fw_name = "fdiv7" }
 };
 
-static struct clk_regmap c3_vout_enc_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = VOUTENC_CLK_CTRL,
-		.mask = 0x7,
-		.shift = 25,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "vout_enc_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = c3_vout_enc_parents,
-		.num_parents = ARRAY_SIZE(c3_vout_enc_parents),
-	},
-};
-
-static struct clk_regmap c3_vout_enc_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = VOUTENC_CLK_CTRL,
-		.shift = 16,
-		.width = 7,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "vout_enc_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_vout_enc_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap c3_vout_enc = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = VOUTENC_CLK_CTRL,
-		.bit_idx = 24,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "vout_enc",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_vout_enc_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static C3_COMP_SEL(vout_enc, VOUTENC_CLK_CTRL, 25, 0x7, c3_vout_enc_parents);
+static C3_COMP_DIV(vout_enc, VOUTENC_CLK_CTRL, 16, 7);
+static C3_COMP_GATE(vout_enc, VOUTENC_CLK_CTRL, 24);
 
 static const struct clk_parent_data c3_hcodec_pre_parents[] = {
 	{ .fw_name = "fdiv2p5" },
@@ -1228,99 +755,13 @@ static const struct clk_parent_data c3_hcodec_pre_parents[] = {
 	{ .fw_name = "oscin" }
 };
 
-static struct clk_regmap c3_hcodec_0_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = VDEC_CLK_CTRL,
-		.mask = 0x7,
-		.shift = 9,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "hcodec_0_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = c3_hcodec_pre_parents,
-		.num_parents = ARRAY_SIZE(c3_hcodec_pre_parents),
-	},
-};
+static C3_COMP_SEL(hcodec_0,  VDEC_CLK_CTRL, 9, 0x7, c3_hcodec_pre_parents);
+static C3_COMP_DIV(hcodec_0,  VDEC_CLK_CTRL, 0, 7);
+static C3_COMP_GATE(hcodec_0,  VDEC_CLK_CTRL, 8);
 
-static struct clk_regmap c3_hcodec_0_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = VDEC_CLK_CTRL,
-		.shift = 0,
-		.width = 7,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "hcodec_0_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_hcodec_0_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap c3_hcodec_0 = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = VDEC_CLK_CTRL,
-		.bit_idx = 8,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "hcodec_0",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_hcodec_0_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap c3_hcodec_1_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = VDEC3_CLK_CTRL,
-		.mask = 0x7,
-		.shift = 9,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "hcodec_1_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = c3_hcodec_pre_parents,
-		.num_parents = ARRAY_SIZE(c3_hcodec_pre_parents),
-	},
-};
-
-static struct clk_regmap c3_hcodec_1_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = VDEC3_CLK_CTRL,
-		.shift = 0,
-		.width = 7,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "hcodec_1_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_hcodec_1_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap c3_hcodec_1 = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = VDEC3_CLK_CTRL,
-		.bit_idx = 8,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "hcodec_1",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_hcodec_1_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static C3_COMP_SEL(hcodec_1, VDEC3_CLK_CTRL, 9, 0x7, c3_hcodec_pre_parents);
+static C3_COMP_DIV(hcodec_1, VDEC3_CLK_CTRL, 0, 7);
+static C3_COMP_GATE(hcodec_1, VDEC3_CLK_CTRL, 8);
 
 static const struct clk_parent_data c3_hcodec_parents[] = {
 	{ .hw = &c3_hcodec_0.hw },
@@ -1353,99 +794,13 @@ static const struct clk_parent_data c3_vc9000e_parents[] = {
 	{ .fw_name = "gp0" }
 };
 
-static struct clk_regmap c3_vc9000e_aclk_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = VC9000E_CLK_CTRL,
-		.mask = 0x7,
-		.shift = 9,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "vc9000e_aclk_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = c3_vc9000e_parents,
-		.num_parents = ARRAY_SIZE(c3_vc9000e_parents),
-	},
-};
-
-static struct clk_regmap c3_vc9000e_aclk_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = VC9000E_CLK_CTRL,
-		.shift = 0,
-		.width = 7,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "vc9000e_aclk_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_vc9000e_aclk_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap c3_vc9000e_aclk = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = VC9000E_CLK_CTRL,
-		.bit_idx = 8,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "vc9000e_aclk",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_vc9000e_aclk_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap c3_vc9000e_core_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = VC9000E_CLK_CTRL,
-		.mask = 0x7,
-		.shift = 25,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "vc9000e_core_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = c3_vc9000e_parents,
-		.num_parents = ARRAY_SIZE(c3_vc9000e_parents),
-	},
-};
-
-static struct clk_regmap c3_vc9000e_core_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = VC9000E_CLK_CTRL,
-		.shift = 16,
-		.width = 7,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "vc9000e_core_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_vc9000e_core_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static C3_COMP_SEL(vc9000e_aclk, VC9000E_CLK_CTRL, 9, 0x7, c3_vc9000e_parents);
+static C3_COMP_DIV(vc9000e_aclk, VC9000E_CLK_CTRL, 0, 7);
+static C3_COMP_GATE(vc9000e_aclk, VC9000E_CLK_CTRL, 8);
 
-static struct clk_regmap c3_vc9000e_core = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = VC9000E_CLK_CTRL,
-		.bit_idx = 24,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "vc9000e_core",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_vc9000e_core_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static C3_COMP_SEL(vc9000e_core, VC9000E_CLK_CTRL, 25, 0x7, c3_vc9000e_parents);
+static C3_COMP_DIV(vc9000e_core, VC9000E_CLK_CTRL, 16, 7);
+static C3_COMP_GATE(vc9000e_core, VC9000E_CLK_CTRL, 24);
 
 static const struct clk_parent_data c3_csi_phy_parents[] = {
 	{ .fw_name = "fdiv2p5" },
@@ -1458,52 +813,9 @@ static const struct clk_parent_data c3_csi_phy_parents[] = {
 	{ .fw_name = "oscin" }
 };
 
-static struct clk_regmap c3_csi_phy0_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = ISP0_CLK_CTRL,
-		.mask = 0x7,
-		.shift = 25,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "csi_phy0_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = c3_csi_phy_parents,
-		.num_parents = ARRAY_SIZE(c3_csi_phy_parents),
-	},
-};
-
-static struct clk_regmap c3_csi_phy0_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = ISP0_CLK_CTRL,
-		.shift = 16,
-		.width = 7,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "csi_phy0_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_csi_phy0_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap c3_csi_phy0 = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = ISP0_CLK_CTRL,
-		.bit_idx = 24,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "csi_phy0",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_csi_phy0_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static C3_COMP_SEL(csi_phy0, ISP0_CLK_CTRL, 25, 0x7, c3_csi_phy_parents);
+static C3_COMP_DIV(csi_phy0, ISP0_CLK_CTRL, 16, 7);
+static C3_COMP_GATE(csi_phy0, ISP0_CLK_CTRL, 24);
 
 static const struct clk_parent_data c3_dewarpa_parents[] = {
 	{ .fw_name = "fdiv2p5" },
@@ -1516,52 +828,9 @@ static const struct clk_parent_data c3_dewarpa_parents[] = {
 	{ .fw_name = "fdiv7" }
 };
 
-static struct clk_regmap c3_dewarpa_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = DEWARPA_CLK_CTRL,
-		.mask = 0x7,
-		.shift = 9,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "dewarpa_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = c3_dewarpa_parents,
-		.num_parents = ARRAY_SIZE(c3_dewarpa_parents),
-	},
-};
-
-static struct clk_regmap c3_dewarpa_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = DEWARPA_CLK_CTRL,
-		.shift = 0,
-		.width = 7,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "dewarpa_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_dewarpa_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap c3_dewarpa = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = DEWARPA_CLK_CTRL,
-		.bit_idx = 8,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "dewarpa",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_dewarpa_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static C3_COMP_SEL(dewarpa, DEWARPA_CLK_CTRL, 9, 0x7, c3_dewarpa_parents);
+static C3_COMP_DIV(dewarpa, DEWARPA_CLK_CTRL, 0, 7);
+static C3_COMP_GATE(dewarpa, DEWARPA_CLK_CTRL, 8);
 
 static const struct clk_parent_data c3_isp_parents[] = {
 	{ .fw_name = "fdiv2p5" },
@@ -1574,52 +843,9 @@ static const struct clk_parent_data c3_isp_parents[] = {
 	{ .fw_name = "oscin" }
 };
 
-static struct clk_regmap c3_isp0_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = ISP0_CLK_CTRL,
-		.mask = 0x7,
-		.shift = 9,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "isp0_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = c3_isp_parents,
-		.num_parents = ARRAY_SIZE(c3_isp_parents),
-	},
-};
-
-static struct clk_regmap c3_isp0_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = ISP0_CLK_CTRL,
-		.shift = 0,
-		.width = 7,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "isp0_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_isp0_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap c3_isp0 = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = ISP0_CLK_CTRL,
-		.bit_idx = 8,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "isp0",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_isp0_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static C3_COMP_SEL(isp0, ISP0_CLK_CTRL, 9, 0x7, c3_isp_parents);
+static C3_COMP_DIV(isp0, ISP0_CLK_CTRL, 0, 7);
+static C3_COMP_GATE(isp0, ISP0_CLK_CTRL, 8);
 
 static const struct clk_parent_data c3_nna_core_parents[] = {
 	{ .fw_name = "oscin" },
@@ -1632,52 +858,9 @@ static const struct clk_parent_data c3_nna_core_parents[] = {
 	{ .fw_name = "hifi" }
 };
 
-static struct clk_regmap c3_nna_core_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = NNA_CLK_CTRL,
-		.mask = 0x7,
-		.shift = 9,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "nna_core_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = c3_nna_core_parents,
-		.num_parents = ARRAY_SIZE(c3_nna_core_parents),
-	},
-};
-
-static struct clk_regmap c3_nna_core_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = NNA_CLK_CTRL,
-		.shift = 0,
-		.width = 7,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "nna_core_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_nna_core_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap c3_nna_core = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = NNA_CLK_CTRL,
-		.bit_idx = 8,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "nna_core",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_nna_core_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static C3_COMP_SEL(nna_core, NNA_CLK_CTRL, 9, 0x7, c3_nna_core_parents);
+static C3_COMP_DIV(nna_core, NNA_CLK_CTRL, 0, 7);
+static C3_COMP_GATE(nna_core, NNA_CLK_CTRL, 8);
 
 static const struct clk_parent_data c3_ge2d_parents[] = {
 	{ .fw_name = "oscin" },
@@ -1690,52 +873,9 @@ static const struct clk_parent_data c3_ge2d_parents[] = {
 	{ .hw = &c3_rtc_clk.hw }
 };
 
-static struct clk_regmap c3_ge2d_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = GE2D_CLK_CTRL,
-		.mask = 0x7,
-		.shift = 9,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "ge2d_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = c3_ge2d_parents,
-		.num_parents = ARRAY_SIZE(c3_ge2d_parents),
-	},
-};
-
-static struct clk_regmap c3_ge2d_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = GE2D_CLK_CTRL,
-		.shift = 0,
-		.width = 7,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "ge2d_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_ge2d_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap c3_ge2d = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = GE2D_CLK_CTRL,
-		.bit_idx = 8,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "ge2d",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_ge2d_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static C3_COMP_SEL(ge2d, GE2D_CLK_CTRL, 9, 0x7, c3_ge2d_parents);
+static C3_COMP_DIV(ge2d, GE2D_CLK_CTRL, 0, 7);
+static C3_COMP_GATE(ge2d, GE2D_CLK_CTRL, 8);
 
 static const struct clk_parent_data c3_vapb_parents[] = {
 	{ .fw_name = "fdiv2p5" },
@@ -1748,52 +888,9 @@ static const struct clk_parent_data c3_vapb_parents[] = {
 	{ .fw_name = "oscin" },
 };
 
-static struct clk_regmap c3_vapb_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = VAPB_CLK_CTRL,
-		.mask = 0x7,
-		.shift = 9,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "vapb_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = c3_vapb_parents,
-		.num_parents = ARRAY_SIZE(c3_vapb_parents),
-	},
-};
-
-static struct clk_regmap c3_vapb_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = VAPB_CLK_CTRL,
-		.shift = 0,
-		.width = 7,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "vapb_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_vapb_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap c3_vapb = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = VAPB_CLK_CTRL,
-		.bit_idx = 8,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "vapb",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_vapb_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static C3_COMP_SEL(vapb, VAPB_CLK_CTRL, 9, 0x7, c3_vapb_parents);
+static C3_COMP_DIV(vapb, VAPB_CLK_CTRL, 0, 7);
+static C3_COMP_GATE(vapb, VAPB_CLK_CTRL, 8);
 
 static struct clk_hw *c3_peripherals_hw_clks[] = {
 	[CLKID_RTC_XTAL_CLKIN]		= &c3_rtc_xtal_clkin.hw,

-- 
2.47.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
