Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5184AC02182
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jan 2025 17:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VPCCNIdyEEVYW7Byx7Yf0jq2GxYreOlR2NTXL9s/SqU=; b=0aZn5eFEH7dMzC
	Nyp/gkV305QMQ5D/hq2O5ByBrrk6fWAlLFUzt70AYW4lFkQl2w7Z1FGK5gJy/twW1e6VAkuNH+V0F
	hNZayl8whZ2rrM8u2WpXm6N/JHnJSkmHij4iZ4MZkOhQn28Uv33J/WbBVW4MSGqrRr3Y78XOfAojs
	t5oyjRApNX1AwWBCZSE+0GPrmJR2e02nYDZJ1Oc5YmUc1NprEGwGz3tnIhZaKuS3Y+GvJWjrVHqMf
	UlErqDNzcBzkBAiuqJ+78kTQvsmacU8lqRVdkf4xPs/uCuu5aQrlsL2pdJiPKcJZuqvNx2NLHlR6H
	5QMeaHWuBiE3McSKA11w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZvS8-000000066oW-1aKc;
	Mon, 20 Jan 2025 17:20:44 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZvOL-000000066CL-2rKA
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Jan 2025 17:16:50 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-437a92d7b96so46937265e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Jan 2025 09:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737393408; x=1737998208; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zy0IE3lDkOJmEZbfzxIyV3pw1iHxHTRFthowgi2frig=;
        b=xp4GOicbG/C+GKmZnJxFewuibnFo0Q8uUYnde1Z+QWrzhX3wp8IsVUkGxl39is0IUA
         LrwC6sKUMpP9y1wJrB/k4tOoiLzjDr+aMukNpoJj4BB6aaPDOMng+sycgYEucx5z+807
         tqm14IZFPnof5OeNz0HuJKYCubbhvimD9rSVdC0+xnmFD/jvd/MjF0fjH06lYzMrPRnT
         2QJdyqdZ4NIY465iUbgnjqv2n3PTy07HyUJD2QczwVYxmQXGTHx73J6F6i+jN9NXbIPA
         U6zIu1OJdGH14N7eZKHOL2aVYhW/54ECuAVnPrZukuI5T5sLa/eYaPvMOsNX4bJFoGB2
         Lf4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737393408; x=1737998208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zy0IE3lDkOJmEZbfzxIyV3pw1iHxHTRFthowgi2frig=;
        b=ihH7dYKkCAPM5D5yiLJAPQKfJCJWk/foLvYy+XQYPe+3pobzNTCjh+yWSLfG5MwCQ7
         81tcQiM0adZzhZIu04wek1f95iUrjrNajHJ7r2kF86F+moI/i8fcCl81QIbbB9zxx4+H
         YFNZE2c6pwXX7zeXSyxSviyXzwsaUKr6mGOatIstAdJb7njmBr2dbwCCmNzQITbMjGJM
         xC0eoSbwTbptYJqr9sC5+7vQjT8AWd9EziM2HiGk1khZrK1Xik13L/k6f/z1MIiCE+Rj
         vM5FthdAn8RHkwdKddT9MqDzITCkCh1221kd8GtjMAKAnysZe9qKu4F6v66QiNo3xYlk
         vdLg==
X-Forwarded-Encrypted: i=1; AJvYcCW3JyBswqsbRg4EV4Mauv2wowR8TQZEqO7mjUaJ5ny6RDdww3kw1KYnmWr1DbDdV02PRsu5ERds4Drjq2YE@lists.infradead.org
X-Gm-Message-State: AOJu0YxesXmCAK33GzLGSFZ2vCYu/8g5so9qYkRyj8SRiYtc3Ze/zCn1
	f86Y05Lt8JtwM42JXMa1F2O3QsdhrQSVpGGqIrTx6/eTWZQcI3W5OFLIcPiwNxU=
X-Gm-Gg: ASbGnctf2RMZysHkPWtbWADDEVp8YLnIF4/rjEptrIFNBmldWRqNJR++LWWaIhkeIil
	nReIPOahcL2F0DCx7eN7NOn6ITqN4y/2nmU1rTXCuilzcDekvE4ABOSo+NPj1t7DEHWPvwl82CU
	30/3JJmwYW1S36PElO0Js32THomA5/9g7rrKlWLW66C1Q5Zjs0JpdzLfyMBX1fNbQtZ8yWxfGvY
	VZPxDJD9QyeqSRFE7S356ViOdKez1z0Q7+xyBrUzCO9eHIAPk08kVcTJGyfQuINcoYEVxNzT23U
	Yo7go0yw
X-Google-Smtp-Source: AGHT+IFY5DPWP40kn2YE2hfzn5IShoB+jBqP5C8IE7mj9UvjFLQNXC7FFM6GCKi20FV/1FQ4AsYs8w==
X-Received: by 2002:a05:600c:1f8c:b0:436:fb02:e90 with SMTP id 5b1f17b1804b1-438913cdaa8mr152617415e9.10.1737393408342;
        Mon, 20 Jan 2025 09:16:48 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:66cc:1b13:f78a:5738])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-437c75298adsm208629865e9.30.2025.01.20.09.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 09:16:47 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 20 Jan 2025 18:15:33 +0100
Subject: [PATCH v3 4/4] clk: amlogic: s4: remove unused data
MIME-Version: 1.0
Message-Id: <20250120-amlogic-clk-drop-clk-regmap-tables-v3-4-126244146947@baylibre.com>
References: <20250120-amlogic-clk-drop-clk-regmap-tables-v3-0-126244146947@baylibre.com>
In-Reply-To: <20250120-amlogic-clk-drop-clk-regmap-tables-v3-0-126244146947@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3973; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=J7Y6Fp4+iqMqIfQq3Hnn537f1r3kZcJaD4ddKCmmXtk=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnjoT64OhzMylXK7S80fv+A6bFKs/lGqharlcVS
 tH/hOFeOB6JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ46E+gAKCRDm/A8cN/La
 hW37EACoX2ZfZnDa/X38DZwOqeh8ZuhGamXjGCNbVY/Z/WfrR249u2iiH9j/R/Psui7oR1mA9Ld
 X42+U3Hn6T+JnjBI+EDHXbrWvJ4Rfhlty4X//QmgkRRJcrLXtMC0q39qIScOV2Y3aL7U8HRVKrk
 p1YJFwoZv3CLgTzbjOPhdBu3a7v3K/4bXx8mMOaqjHo23AkxHeWbQ18OwC+XNCGv5p2u/ZbsmHn
 rKiOgy2fkpxpp6D6nptKau7C0ip4FycM2q/vEle0ECO5MMNiHUcmS4kH1Q9WlkGoG8wo+Oo0pLJ
 fjhKa/qo51vCTBIgoVALhsxCCul22x95Uk+vRcUX833T4XXhr7FID+3Jwi89OnGbawYPfStl0wO
 so6HWxgoco3l/gmUCGEvRx9DBOcQ0Ykb4CZPsSYoGUcKLsmrsrrqFxbaGP8s8WEUotr1/W5dott
 HVdMsSX5QVdjw8Z0Ap1ubUm3sRwq85Fx8clqUHQ+eZgs/LVXk2GgX29SI7yAHVjViy+pqcIL6B8
 fEs2fnOU19zKnW+kq+yA8hjuTYTodoURRq6SIBoYeYD+9fd8M5toULw85BQGNy+flXIPgG9u6XZ
 XO+emPEYYzXC2BZceW7kchSb2kV8W8gZ2X0SoFtAD7VMMSov6Hr1Hjrmqz6aE+oFgHan8FTg6Hz
 4UAkYQMvR7xlk9A==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_091649_782377_81061E5F 
X-CRM114-Status: GOOD (  10.63  )
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

Following the removal of the clk_regmap clock table from the s4-peripherals
clock controller driver, it appears some clocks are unused, which means
these are not exported or even registered.

In all likelihood, these clocks have not been tested. Remove the unused
clocks for now. These can added back later when they have been properly
tested.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/s4-peripherals.c | 112 -------------------------------------
 1 file changed, 112 deletions(-)

diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
index 6a736e32e0ed8e2e8a37fbea94f9c5a90ea95fa6..853053b5f0689399a0224d263c30a985df6e1652 100644
--- a/drivers/clk/meson/s4-peripherals.c
+++ b/drivers/clk/meson/s4-peripherals.c
@@ -3129,118 +3129,6 @@ static struct clk_regmap s4_gen_clk = {
 	},
 };
 
-static const struct clk_parent_data s4_adc_extclk_in_parent_data[]  = {
-	{ .fw_name = "xtal", },
-	{ .fw_name = "fclk_div4", },
-	{ .fw_name = "fclk_div3", },
-	{ .fw_name = "fclk_div5", },
-	{ .fw_name = "fclk_div7", },
-	{ .fw_name = "mpll2", },
-	{ .fw_name = "gp0_pll", },
-	{ .fw_name = "hifi_pll", },
-};
-
-static struct clk_regmap s4_adc_extclk_in_mux = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = CLKCTRL_DEMOD_CLK_CTRL,
-		.mask = 0x7,
-		.shift = 25,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "adc_extclk_in_mux",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_adc_extclk_in_parent_data,
-		.num_parents = ARRAY_SIZE(s4_adc_extclk_in_parent_data),
-		.flags = 0,
-	},
-};
-
-static struct clk_regmap s4_adc_extclk_in_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = CLKCTRL_DEMOD_CLK_CTRL,
-		.shift = 16,
-		.width = 7,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "adc_extclk_in_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_adc_extclk_in_mux.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap s4_adc_extclk_in_gate = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = CLKCTRL_DEMOD_CLK_CTRL,
-		.bit_idx = 24,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "adc_extclk_in",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_adc_extclk_in_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap s4_demod_core_clk_mux = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = CLKCTRL_DEMOD_CLK_CTRL,
-		.mask = 0x3,
-		.shift = 9,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "demod_core_clk_mux",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = (const struct clk_parent_data []) {
-			{ .fw_name = "xtal", },
-			{ .fw_name = "fclk_div7", },
-			{ .fw_name = "fclk_div4", },
-			{ .hw = &s4_adc_extclk_in_gate.hw }
-		},
-		.num_parents = 4,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap s4_demod_core_clk_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = CLKCTRL_DEMOD_CLK_CTRL,
-		.shift = 0,
-		.width = 7,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "demod_core_clk_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_demod_core_clk_mux.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap s4_demod_core_clk_gate = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = CLKCTRL_DEMOD_CLK_CTRL,
-		.bit_idx = 8,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "demod_core_clk",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_demod_core_clk_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
 #define MESON_GATE(_name, _reg, _bit) \
 	MESON_PCLK(_name, _reg, _bit, &s4_sys_clk.hw)
 

-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
