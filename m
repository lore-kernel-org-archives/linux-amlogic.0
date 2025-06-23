Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF9CC77B7C
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jun 2025 21:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VlA4LO94dQjLYRx+8ilWOQYgpUS766Qgy38lLTfW1mo=; b=akiOlAzczBc+w2
	QeZ3soKo5W404R4I6KjsSAVpBN+xMXKy7D373nK29IsWHoTlZftMJwZ8ZjI2oBJydBCvh68doPYxX
	KwByNocc0mtSN76CZ6d3xOYn2HZmeaCscxGnhaPAlQYFHjCtfMB1NGZDE1gVnBv+qyv3/eTj5Zwa9
	d3WaDf9Wbr1jdth9dTBRYW/giRReIq4EkJbV9T7hT1fJNdCp5p4tztjtmFn4pEO7XWORnzSEbicjS
	RDZ8RT9bogb6BS1R06+lN0wHcRVPb384rGwC9VRHdet+z5tXQg7mfbxkM5Qx1ulRfOn4xXsqKAmVD
	JMMuydHbWbYBw0RsDX6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTohJ-000000040e4-1GDn;
	Mon, 23 Jun 2025 21:27:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTkB7-00000003SD8-4AJk
	for linux-amlogic@bombadil.infradead.org;
	Mon, 23 Jun 2025 16:37:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=VsxgOlrXfF5DThbMKG1kzcbU55xtnGyMNENY81j7+2I=; b=k3nkd2FqmeeOkXJAVQ3tbK1AOH
	d9hCfDLqXoaIFoUKja2vSHMUWn+HdhtnR2porfoAIYg8Mgwoe4tSwVjhQapUNcUfuHyOxiAGbJD27
	k7txnALIMWJKpIMnbP1J+cTqJJN/yRKYZUDpBEypU9rFYSgiokrA+X9BHp4yRvQzfkRCD1fHyZmUV
	mAAZdYkuIc8ia8U97qvVRWbCSOe3upqOwbCeDz04/uwYRKOJl0Xf9N9ULIxJPqSNcY3MEk1NLpEIw
	zOjVB2ssr9YnQFYeip1BAzRpk+dKEx8OIXkNS5FZ/PWi3Fuhs7uTT80Ltk6n8EwqdO8pjB8bJBYFM
	iW4l/BXg==;
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTkB4-00000005G2V-3KCJ
	for linux-amlogic@lists.infradead.org;
	Mon, 23 Jun 2025 16:37:53 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a50fc7ac4dso2431673f8f.0
        for <linux-amlogic@lists.infradead.org>; Mon, 23 Jun 2025 09:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750696669; x=1751301469; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VsxgOlrXfF5DThbMKG1kzcbU55xtnGyMNENY81j7+2I=;
        b=nfpTAQCHodya4Jle3kZb+NO7t04grZHamywEmRawqBkEJ+dYBFQ38mIvs1SsSAw14z
         J579Ot1cuOQxetpPLmUwdDFom+qejOz2irT2D+bzX+Mj8offxr0rA3+3VpQUEMmqAVWd
         LKvRIZldrbMZKw/R4wO7hpoMY7e1OtFVy0ZiwrdBon9pHV12x/3XdDs4/am6vYw2rBx/
         5MTZ33HWe3Ru6AN/tYfmisl1D46rJwRnynHd1nlXpGTS/aH6BQRsmn2uKuqWa22wS6AE
         CHu42cfXUxUPuBCLA9ZkODUH4yuXqAxrVditZtPJc66NVvl5djV1rXKzMjKrCLrR34V5
         jbUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750696669; x=1751301469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VsxgOlrXfF5DThbMKG1kzcbU55xtnGyMNENY81j7+2I=;
        b=nXRKefKqR/0bbQ7yK81Bon4fmrFn52iFLx7096hgjOG3hOEImrz2zIqBkgSCeMLlC3
         qKgtUdKHENj7qWDxRS8whiSUV845USkYYkfsuxkTMXXBQme+o3GEh5k4ModCR3dpvu8T
         f5IIqJW9JpeZAgNxyqR08m8za59tcDhrht41OEi9LM0AX2igxictBHV6WtgT2+jMHU/3
         ZE4HUgdp9XM/RwHXVINWXCa4754qvvoDjmnXTHb6c4LWXUXilE2rHuXqCJ4f1MO5GnkI
         D8jxWNb/5I4SUM0EGpJWShTJbQs3ff/zRdayQdpzcyEkSQk+LV2orMf0MlvZUaAjcmnx
         rnug==
X-Forwarded-Encrypted: i=1; AJvYcCVokDdQifIIqa61R1qpW1rhPtlrz+dM/NC+ClqcttElgN4Xve2O2FvxYpEB1g1YjkwOz5RwztnV6YBhfh1w@lists.infradead.org
X-Gm-Message-State: AOJu0YyJhCqx4dfyCOOH1ALfkHiP8PZjdyNIdmFFaEQYj9G+gsza9EQy
	XL2acDMC9avbeWeHTuxnbh8usodRt0VzNJb685swZ6srxqafxg6dFI1bsUL7gwV9WayvHplacxt
	auvfD
X-Gm-Gg: ASbGncuTt7c7dSIZMDnOm2E9EHdhMCcEKuPcnjMorTBXSj89a6RBfoQgh1F241G4SNJ
	1ByUdPX2uM7rfGOQEb9od2XZOggJWKkLWHLn+EjUMN1rDKBFrmvZbAK+Z4KdrStd+gai8P7oJ6h
	Kl5Ysiur2F60tbS+t8B5DGrVzfg86F02y7PUUIVocdb7H77d5INduxGDlcobw7FH3dvti5Iett2
	OCR8lXJwGt9aGv6QnXH/CyHGmKddHyVb/Mtz9AqCvlvrcfGshvIQRfX8/x/07NrCC8qzxzTFboi
	YXdNi+Qvsy55suYHwcdjk5GkQrKx18KeH8pAyYLHOEBGd6EJRR3JvNNWm8G9WC+1DM9N6Lu/hZ8
	q
X-Google-Smtp-Source: AGHT+IFi/UBk2HwAnllzHqb7XPWGf9QFYR4a94bir3bwedo9/Llza5DcgNihEeICX6IArc5TRzULPA==
X-Received: by 2002:a05:6000:3103:b0:3a5:58a5:6a83 with SMTP id ffacd0b85a97d-3a6d13013eemr12059049f8f.13.1750696668742;
        Mon, 23 Jun 2025 09:37:48 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:7b0f:c522:cad6:acd1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a6d0f1011fsm9852947f8f.7.2025.06.23.09.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 09:37:48 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 23 Jun 2025 18:37:39 +0200
Subject: [PATCH v4 3/3] clk: amlogic: s4: remove unused data
MIME-Version: 1.0
Message-Id: <20250623-amlogic-clk-drop-clk-regmap-tables-v4-3-ff04918211cc@baylibre.com>
References: <20250623-amlogic-clk-drop-clk-regmap-tables-v4-0-ff04918211cc@baylibre.com>
In-Reply-To: <20250623-amlogic-clk-drop-clk-regmap-tables-v4-0-ff04918211cc@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3973; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=lY/+jeINkrBTULMr0fgrgjWAsXe5te4CfoeDV9q3UOI=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoWYLYO0zm2Ij1fDff8rSEVAszTwR1HrjavXeaU
 0Uem7bF9VeJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaFmC2AAKCRDm/A8cN/La
 hc/CD/4m/uWRim24OFAgeUrpZSDUlhz+owSrV5ms30HqiIr49Tu/MkLik1fNxtOZoP7F3o7Vd9w
 I1ljZ786kW8PqUn9WvzghDsgbY2H1rmf7myPVPgO5cMxtzP8JXFozngMvwPnlm7xoZ1+6P0Bkdc
 PN47s/Ji69FMhx2JWbZVT/+0qfmpBKAlGn5Sbh2OOKCtkMazBWQRAU3jfjqLGpVpiQbwqVd8jPV
 gNF3JSxbQwnX8ghEC1HWQI4h/sq3w0UeLo68K3qGcJTLE3MSQARLwLdmn9VYdQqkKiGzGDrPRn+
 J3xBs9BrRzWyanNumrpOXqPnZADZHYudv5rkwY4gvuFWpMyO9KlcLiOvihX7nmgDrruDdaK7hkR
 bbQ1br1vNnTrPZK4A62Jkxj/z8v7A3KjL89I7RuBdBlVTZi1UfM511q5UtYXSPQMvYW/VNJWqUK
 MiueAteGQhWVE7a2BSwOKqlhQoH55D5JXdSS/xmcdYkTAj/g5Z455Z9oY00R4VzDcCxyeoiwEEM
 uJHCFa6zgqTUKmuka6A3+RdRpVg7HHo+qG6u1n/AYvNT6eAFgqyPxWbG3RbuRV72dJcNpca+mJ1
 4iNSzWhQuYvDOhufnvDkni/Yn/JiALR2mA9mC75E8Fu6x/LCJyq3tFDOwfQsOD6kH/RQUTM2bos
 H0LyBCHLEn47Unw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_173750_927890_96E2611D 
X-CRM114-Status: GOOD (  10.77  )
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
index fd2d4d725f9e2595a865909db3c0c598309ef448..c9400cf54c84c3dc7c63d0636933951b0cac230c 100644
--- a/drivers/clk/meson/s4-peripherals.c
+++ b/drivers/clk/meson/s4-peripherals.c
@@ -3174,118 +3174,6 @@ static struct clk_regmap s4_gen_clk = {
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
2.47.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
