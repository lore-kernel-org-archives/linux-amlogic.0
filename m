Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9637E77188
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Dec 2024 17:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1H77eGvG6dF36WCZfd7+eKeEriGJXumaLPfucn40TOI=; b=VXboMhUf0uWZC8
	SQev6uZiPjUK2bTtN6W7d85N1hCiltpDIwycSFad+HDCPelhmqfz286V7DIi307amQCxNnrarEePS
	NtnAHNthDiYRTTNVQn1kCybfXvZrmZiPjQVAMUiHP2JitAANooKB0Hndpn7jNFuBiaSYEW1xeai4l
	e6Pviwc2FLTH9reZMdk24K65hfR+eeKbxGqeeVERuCu3+M+qifY1MXy2HFZ3o0DORx5kCjk4uaF+H
	2g/2qN7m5mSq/HNAibzeNWWNIXH1g3bffIA/2n0nDKL0BYPP6c6Kwf75UZDxiQHwiM2wsTXyLVxE+
	NLwgEubvkm/QxMwi1oTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgxl-00000005fZs-1wT1;
	Fri, 20 Dec 2024 17:38:57 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgdP-00000005bWX-1jow
	for linux-amlogic@lists.infradead.org;
	Fri, 20 Dec 2024 17:17:56 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-385e3621518so1182885f8f.1
        for <linux-amlogic@lists.infradead.org>; Fri, 20 Dec 2024 09:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734715073; x=1735319873; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cgs5QNP7O8iugv52YTWDU3oFoGi5v9FMjpGDuCdwf+k=;
        b=zdGpSvETjTiCTobF0FiztxJUL8IRTebJbj0jPAnNSzo4YQkrl2QipT5eKOSCmgwef7
         LEPLZxhq0FbL9tPzlkyaa2hLgD25U8oQmZRrWilxQtuzkXD5Sc+Jax/SWZE2YbxNCN4j
         kGuZULIa9e8hjFdmq+opruPWkNwXp7bmY+HI6DUzbUOoaDBUihDpF3WKzyDehdKVoIbL
         zShw5jBeIQOV/hItd+9g24r2a3IsofEHatKFXzIDDab2mqLSPniGMmhaCWRVGRzwwaFh
         tMd2NTSs+glEFG8aVu3Z1ZbYOGQRAiT3lFMifUTloY+lWL9HwbAp5CdnGx+dXr5HDDX8
         nLdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734715073; x=1735319873;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cgs5QNP7O8iugv52YTWDU3oFoGi5v9FMjpGDuCdwf+k=;
        b=eWKM7nZtV8rJ0+3xaXxd+dQeswKrJyGw95Yd3U25r3yqfovsvYLkiYxrmNAukTpIPN
         8xGA5CHYKkXyiRaBpJ3cFtBCrq1FC66P3B1zQFz0WmNTTRV18sxaF5hT7z0qf5hC5pEf
         eyW6q+6PdflchXON3/HCqpaeiOff5u0EzfDJwxKP9dTlVVOT5wBQ6u1gdZjlzAes1Its
         7hPIeNxJijaVfGa7xP4fqrbZpg+bh5fKeweihFINEIPdTsg26yTTai5TmYQDVqLQMsbU
         kDf6P8t16nwA8/fw5oIDoDUdE4arqo+tr42x6qaB4vuVTvJo3qCkMDG2yViG3r67IZuw
         0IvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXs9xdYRzEC4XZh9psvGw2pE1WuJegwLuoS6W9FYYvISAMV1eT04HK3RRMec6AGaDD9HcMCEubigTjEYAcB@lists.infradead.org
X-Gm-Message-State: AOJu0YxIL0dVbT2+tsj1HQhGBIByasPUnnWirqH7G+JhI/XobddDk1Cx
	ZqI+0Iwg3ElwT6kgwBdyfRAYAn2TniBbEkSXkKcM4MsGsE8jMszGsTIQLk3Johc=
X-Gm-Gg: ASbGnct8/drr8WD5qwxwwDelXMg3MokwmZoZYMUcCfMkLThuR0Q7q6bM2RNYpl43qdH
	JczmRBrARVtkjgqAAQgHKV8Nb/dahTfWmbnvyNMtb4RGtURKhz8LPhL87Pyxz27Cu7YLsh/dI4T
	tGSFCVZeT3cCHiuOJFJ/Xrnh/8YWIcbhUTYvs6+cwjKsum5qk2hSzZ8YshedcjjQI5ilRkcovbc
	8zeqm014pGIB2kLzg4wkTgVeZXe9MjBuu6Gsk6eaDnzBDpYY/bwwWlFnG0TVC1wrTvJKak=
X-Google-Smtp-Source: AGHT+IGYlzQLR4J9adpke1hx6AAFsWeyzGPiUR+SyMcWO2IVMtoisGzuqWJuHjjRKM9zNCOgImfvIw==
X-Received: by 2002:a5d:598f:0:b0:386:424e:32d5 with SMTP id ffacd0b85a97d-38a221ea939mr4106400f8f.14.1734715073465;
        Fri, 20 Dec 2024 09:17:53 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:c000:46df:1e3e:983f])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a1c8add5asm4432847f8f.107.2024.12.20.09.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 09:17:53 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 20 Dec 2024 18:17:44 +0100
Subject: [PATCH 3/3] clk: amlogic: s4: remove unused data
MIME-Version: 1.0
Message-Id: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-3-96dd657cbfbd@baylibre.com>
References: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com>
In-Reply-To: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3977; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=tvh8JlfNuT44ThrGDFE2JBh8kT+71CwmF8GtX4Rjbzo=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnZaa8huQnimyWNluiyiI+CqSpsbYXDeVZSFdL+
 Ho18RI74oqJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ2WmvAAKCRDm/A8cN/La
 haBXD/9AGOS2JTSDO6JJiE8kB1oiX8eb7GTQH3ESwZO99Ez7orpE9CFgr4umREPh6u+yUUQIIsi
 VuJW6e5VJoBA4G6Ueh9SC9IFQF/u5FsG2KGWz18UCo+u7mCL8A+OSt6yZunQtV3uMplGPy9+O+p
 q52jusn0iNnjqVM3gtuBYcl85n4c0FkUhdqpac0rsedIl5KdIrCKe3d6ks05QGYab+exnrWQMNa
 31zoRaSJ7JL2ljimtgjMjYloq4h9XlsrTII/JK1kbHCePAuajq7RLrRNjfri3OQJglSUNekRorz
 PFAjLgfdfFTeIa7f/jshO04/RaSMl6jUcSJNLGLxvJ4M24v5jUPmNeDL7HL0UFpcmk7PA25QOi8
 c+Kqfd5GPduZ6s4SI1Dp6THKlPH+n+CuVDTvwk18mnvOvjPSCJMNFIJByEkWmx3rWcW9nJ5SKWh
 XyzvmHaUg2p5jOm77UHUnE2TqR8lAtQ1IFPnM+hcTrJc9FRHyDnSFKZetihmgnUNOoRGf8p2b3W
 VHjgPcvpUykOmIJAQOdUjYUVxDxtQdSOs038LZq5BSpTggX7zsAmXu5Bhr4Iw5MGapneO/VDUhr
 WVxqUruSDsT6SyNc/ABvI4PSj+nQmwKsZRrEbhsz2GKyOVCugml60Kf+thdSZg87fW8MVPj9B3a
 xJKiAoUM1rwzd7w==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_091755_516650_086B107A 
X-CRM114-Status: UNSURE (   9.56  )
X-CRM114-Notice: Please train this message.
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
index 91c7b10c2b68c626dd1d6164ea855370aae71485..72b990fc0de8e4e2c83d0fc3b4c6e3fc1fc96367 100644
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
