Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B73C02183
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Jan 2025 16:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tFGPtuGwJN/km0uETJfKmE9N7AypjM4kL5DUTHLmOx4=; b=gIQWbnYILw0YIj
	0VBV2tREfPNUvC5LibFhkTbZfTBGnA3fq1vubcfHqpRiLbegCKQsb4S/cDeMbkXwG79NZ0xxN0Cq9
	cN2gJCXpnvP1hHfSZmo0NOn0u6n/LA7DWlkiZQNtATzMXF4QlkTYKFhDOCJieYovNT8MI957Z6GJZ
	EgnKjOu0e75i/rdukvHhysWFtlnJ3KwoNI0XlQHhLTQKyzM4pBbH6nXtsfGxLJSssOtwanS7HytWK
	uvxBe1TwYMNHCVRo3f/k4SkJABnWmrx+rmQsL9AAaYc7nBn8/aTqHUbW0ODt6+dk6qAD5spLFi+r7
	+m4uR4BonAN7jLgN5ocQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYopL-00000000iJ0-0gTg;
	Fri, 17 Jan 2025 16:04:07 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYokN-00000000h2r-3yfw
	for linux-amlogic@lists.infradead.org;
	Fri, 17 Jan 2025 15:59:03 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-437a92d7b96so21761425e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 17 Jan 2025 07:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737129538; x=1737734338; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JZgWfYcl0Y7q7GLRHkSuwJI29tObEi0i8LhHvO7mET8=;
        b=bG5lDaBjpfB64zxHlnVFyX2y1pAXOYhOe7DrURJ1lb9TwszBiuWn2ONmyxwvR9ccAp
         FpKm/RntPdwfi1I4S03IS20zlHFj3MGyUXbJrAS7wAcURe5P7KqigDY8E10i6AQ3W1yZ
         ZGgQEPDpmrj2hQmG6krl2UUCJOfxNCV80oAKqiMytxFiRNzaw4d54wyl8exDX+tabod8
         Gu13On7skuhCqLby+w5ud0cYoxOAD8UNQEUdD0ZaDc5mxc0I1Hb+KXv7vAGeumf3PCuN
         tw93tA+QlJ+bsjJarHCa69xdGf+2KgjkGJ9Vw2kos23eq1DhdkNQD4hPcGd8ERrxm00P
         QY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737129538; x=1737734338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JZgWfYcl0Y7q7GLRHkSuwJI29tObEi0i8LhHvO7mET8=;
        b=huKY03OOzNqtSoD/Q7iXFwFSwxsUbJqTNa1znL0pqLIq3GT2qgUTinnJ6RNHkovKks
         x+o4K1EM4VnjLFjmpL9Thk9ywtU4r7ets9VKRv6BjNknXnGFMlcKdoJMTtDisjTtYLrJ
         Eq1t+U/ZvwBt7KYyBM4KPl6+67ZftPrUYIPE6fRO8SWzZZ1SHVQOhX4UVpU8vFiZJOJ5
         iYJ45E8J6Z9iBtcPHU9rCWbqMyQeR3/iuEjvbJfKk2YvChSg2loro8EljKc86B8r2aiH
         EHrV/Am4ZtXYAMdZnyZSVgj2IITEeh9yoQiqn2P5/qfyNBm+BE2TiOrIigVfgloQ/eSG
         70Mw==
X-Forwarded-Encrypted: i=1; AJvYcCUhtJWrTf5G8KA44OPrJ1ImBAsqQp6EeQ4B2uZAx4pgX/XHy4wf8dsJpc2K5I/CAgvQTP5NdxhQcwZeCwo2@lists.infradead.org
X-Gm-Message-State: AOJu0YyUmenM6/Od8tt+4/G7Cyl0S6hvBx7I1LAwixGcM6/8+EgH8IKr
	Hp1uDT7EDP8qmN03obG7tgjh2ncsPb+giDrQsYncJD98K/C75qqLgHaK2eZHaos=
X-Gm-Gg: ASbGncuQ1b8lv09qTl69pcujib3slQu+NAV8EIDeOX7k9DFQFP7TxqkeaD/0hV7n8+E
	EjzYzMcp1jUBHe4bY/bnY1UPsWoH2fwkscq0t+zNXkr1AiS5nO3fWDeMRd2+meGr2dcT/la4esX
	FcubQXyHZhsO7U53CHRqZ+BlfBi2LFOdtNbQcXQQ7gziMDehaJPLMOUMKKRJpJw3GBd9SPc4zNw
	g5pt8NV/MCRTegXS+FcfjpCR2/G8mmEvXq62fgmTEtgJXjRREXJgn+I5jdhfmEQze2R7no=
X-Google-Smtp-Source: AGHT+IG1q33fs+KVW9RoZpITbOTAERwi/Qrs/bMhSVo+O25h9Rzl486JZ10j74BPtv3JPq3CtoOFWw==
X-Received: by 2002:a05:600c:3b26:b0:434:a0bf:98ea with SMTP id 5b1f17b1804b1-438913cd4a1mr32341835e9.9.1737129538284;
        Fri, 17 Jan 2025 07:58:58 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:b019:599d:2d51:f3c7])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-437c7528076sm99382195e9.25.2025.01.17.07.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 07:58:57 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 17 Jan 2025 16:58:33 +0100
Subject: [PATCH v2 4/4] clk: amlogic: s4: remove unused data
MIME-Version: 1.0
Message-Id: <20250117-amlogic-clk-drop-clk-regmap-tables-v2-4-d1f77cb0773e@baylibre.com>
References: <20250117-amlogic-clk-drop-clk-regmap-tables-v2-0-d1f77cb0773e@baylibre.com>
In-Reply-To: <20250117-amlogic-clk-drop-clk-regmap-tables-v2-0-d1f77cb0773e@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3977; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=kjINnfrAI9Q/3kKsDXxY3oSmO93qEYxej4qAkFSN56g=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnin48q2Eofw3aXzoZm/XCT2+BvcA49CIxRaNuf
 GHWDOBwRaCJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ4p+PAAKCRDm/A8cN/La
 hZCID/9JeS1XobTuZ2C7R9yy9weAaMjxw3YkRyVZznE6t25Cef2eTV8J5GScomUNOZUYtYe/HkJ
 MhLkGnbCPpLAW7gTinje3L3OIO68myR6euP3NLlYRMIN+q5IcNDbS104c5Yj4H2HvsW1GoKLlet
 dK8VtSmN+FZRbEMmR1JcoctDpt6DCQzaHFCqFzjqqYNXTrgWaAoLWpKdlTDc/lmx57pF5QoVF+g
 LTfSuo73WDGJosr+4utVQvqlkoBV7/3+cmubwwfRg0Ct/n4cH6WmD9vN3jbSygUq1u4oY9NJnLd
 6iS7inGwRhDW1ZBgstaKoUXQahF0N+nduQTDhWN2InROHU71cr1Nmt7hyZA680VvDOpj/yDduZj
 5rgY9ChsJy4Gi+BdTmBCp+rh7gR6Ro4G92KY2ELpj3jI6I6lADa6uN8LOqopz9k4xKNZTfnMthN
 gdbcgFYGiP+T9ywnrUlRa3QohUN+70cEy0rvCJQ+uYt/N47LVypWPE0MFG9AQatubPQegtQkC65
 5VBxPKL3JmugZuIjUIVRJjxQFF8KKihvcBNYfsTUhvduPu3zvfj4RtBwfPXRf2GdEbcwqon0Ljt
 eIQvXfj9mrI6KNi6zuXJQtMndLDYPnGX2y896qbD5BVdZ344gjhsl+0u8O1C5yiE27+u89vdt/f
 4tV3tRvB6em95JA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_075900_019923_3225A81E 
X-CRM114-Status: GOOD (  10.38  )
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

Following the removal of the big clk_regmap clock table from the
s4-peripherals clock controller driver, it appears some clocks are unused,
which means these are not exported or even registered.

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
