Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFAE9C48297
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Feb 2024 17:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7mex+Tk7N68/7eCqz8xemdxRCQyA1Fxx0S+RkFG9DAA=; b=De8budzeaR43z7
	gZnDlhkD3/nekcPl6+EjSGBYF+/eJvDfJl6Z7O5GjZNkzfrkCyILIZICNNTEXZ20d1IKKBrAURxER
	IQ8wWLaVjvlDCMf3UdUrofU2yCCYzFoYfmxbwA1fOggQAsgGh9MDYzSWNwV8z1FBxiF4hdws3kJ63
	mVIXznbVuw3w+r2lOu8NbV4gXP9u9qfU/ODFQlO+29QnkmOBRWZyP/CrgEYoLnViBsdV6uR5p43ye
	T94tKr8a9Eai0r+0u/bxc2p+yv+3SBiPUMPm1WPtWXs/C/Yx7t5mzISimneUztZEHzOiki4u9w6A2
	h7xSso0Tan5UcyjnJJ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX3CG-00000004GQi-3MVK;
	Mon, 05 Feb 2024 17:55:56 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX3C2-00000004GCA-2oMl
	for linux-amlogic@lists.infradead.org;
	Mon, 05 Feb 2024 17:55:44 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40fdd65a9bdso7454955e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 05 Feb 2024 09:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707155740; x=1707760540; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZkiDF6CyURpbjnTnlPpjl05T1hEzDiWol01BVqEjgn0=;
        b=aFg028ynbitK4rBzM4C6fo5GIQ32RphTszUqa1O0JYT46Uh5Jm0ebtpQAkvbMogJ0K
         bPC2KromQR1zHeYA9uBENr6EHX0DnYdFtgIzOnOGjU86px+ukUicZn7iB0wfr4xooahL
         c82ooIojTAEQptIjADCYoUEYFajJ0DnHC3pDrrmk8m6jggXN1Mbrp2fpLUL+WKHCVrGU
         xBZTjlhJF87wSLbndf9MPdtzS1vEMYL3yMSuEc/fNkeJivyPeRJTRlySLXtANXHzjxFe
         2KLuQQRnA0YpNdQJriAQdqHdQ6buVNFiO0DiBl6klf5inAzhRYLqiil3eIwbd2CxEupC
         3mSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707155740; x=1707760540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZkiDF6CyURpbjnTnlPpjl05T1hEzDiWol01BVqEjgn0=;
        b=lHMKelhMzQcJpCggZZRpwCiuuZJJlvBCbR9qgskWKihPxCob6TmujCd4u1ds7SPMmu
         qHVASZ2VckiH6iWUvRNYG3YS5MJ1L/V7b5gUjTkqywrDDmSIMAfnM3ayPUjvenSptNK/
         XfHrAq5FEXr5KzMfBbM8YtYWAsu6zgQ1IVjxuFMHs17PaRxLC9v9jOKzOHiFPQXRTNTp
         BTRG+jTg7wnKUYPgP4qfMrlhANk3SUOZQ68MwG83IMANOPZyjhumpUcVssT+XFvzYp5W
         GDMkcqkXznkcfaiuTqeen0/mAgLpgtG+BQuQcJk0xVmvAdxBUCnTCQl9N55ZMQRPtlxJ
         mGgQ==
X-Gm-Message-State: AOJu0YzEc+Sxp1P/1JmH7ML/Ntl0GVcqHjDE7cXAYDLX6zuLYx/jiwZJ
	rLfsCCxZyD3P1iSiX3in5Vki5d4gqWuH+4n/5/TD+7no9+8gVrlqc+pwHhW9E0Uui+UKR8gKqK2
	W/QsV+A==
X-Google-Smtp-Source: AGHT+IETQBGHOnAagAgMuffwKFHFP8vTVTzJToIQcFvVHqE01f3YvEkn203TM64MOOaOv+xNt/Bd8w==
X-Received: by 2002:a05:600c:5755:b0:40f:d2ff:85b1 with SMTP id jw21-20020a05600c575500b0040fd2ff85b1mr319812wmb.25.1707155740089;
        Mon, 05 Feb 2024 09:55:40 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVZScdR35F1dmrk3FwTtHiaHAlXV3DYGNV3amdyK0nzRRy32zPD3lgfR+G/zrWFiyQi2uU8i1JBMpw82mqBUxqL4B+cIptkYNu5FE0sGlWP9Vugmaq6RjjYUbNF2MkPxuALgtJpy/AzQjsKup3xZbbavx4sAAG5ZkOYeo4EMEfUPBvY6Q8DRednB/dxtECyNJe3+eE33+tSoInBLWMR7dW8laSXHB6eH5izdleZfmCg/3ULfy1P2CmkCAcI0rad8QBfPiZQg0FaBKewCYag6VeEaS4bv+TAl/9886PI7JbK+EplM1tza6g/jjiMGSmfZfBiJM2pXvytC8PFr/1aEbujDhM5SJbP21ZLHCkw0EJ8GmLu/9wh/jx50gmcSjplloo/60MVx+Jof7x5PvAKfXWn9/FCslIOrtfMeqa0yc/W9GUt20jSUIHAK+hR95u6hwQ99uyIJUH9Vx469R/KTLCfoyFrLrl2L5+D/MnYF/Mk69GPrRi8QB9eJ7X+iWkICWStX8mZq+PSdHDMh5eptGoizSK9CRUASSgwKBsPNmzRli84UvKJgfiSPfVrQ8b91dRBeezHCCj7GbAxAuii0i9K9n5IibDI2afO0JinqEpv+keFl4pKSEYKOHUg18PgML1MrTH0xtoq1wBBPoE5luSeUsQ2tg1Az/v4gBVtI3Al+OyAeDy5DbhiMUci3G6BsT5CwTH5ZIxamyqKNJbY/wvHLg75CRVTD2MrnazxOni1YcPH+1kKLGqQXsVEVnrZUUo=
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id je16-20020a05600c1f9000b0040ee8765901sm517556wmb.43.2024.02.05.09.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 09:55:39 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 05 Feb 2024 18:55:30 +0100
Subject: [PATCH v10 3/7] clk: meson: g12a: make VCLK2 and ENCL clock path
 configurable by CCF
MIME-Version: 1.0
Message-Id: <20240205-amlogic-v6-4-upstream-dsi-ccf-vim3-v10-3-dc06073d5330@linaro.org>
References: <20240205-amlogic-v6-4-upstream-dsi-ccf-vim3-v10-0-dc06073d5330@linaro.org>
In-Reply-To: <20240205-amlogic-v6-4-upstream-dsi-ccf-vim3-v10-0-dc06073d5330@linaro.org>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Nicolas Belin <nbelin@baylibre.com>, 
 Jagan Teki <jagan@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=8195;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=hnsfiSsJKInr4JylyhW7C8X4DcUP5JxEtf5koT8x+g4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlwSEUk5CX06yo7N4kEWfDk4rTAYGmo9doFA7V9cBp
 dvDU6OiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZcEhFAAKCRB33NvayMhJ0a8ED/
 4oP/DPfQe+plv8p72/ryqS4Dq8cSiowWNzJq6W0+obvJsrY6K57XJAGL0//PhbTfAOTx7T6CBfdJlx
 YaPO4GgWqnHAaJXbl2xEbAx2USsAdbcMcNr9JCE/VF+ARySMkvGY1ht0MxM+xSQJ6Zy5qbGUaSZ0eq
 tuFI44yyzajKydbZJvTN3toYMp8Q63eDuAoEPlN0YCV2d5NleMIfODBeR8xTuPFCkRgwUJHdhP3TWq
 /r8qkvi3P/ruWqJuxKxDJfg+dPFK1PpAwJDvXybIyi5a8zf+E9DOpW/SMF+3B1mxH0jPz3Ftnwo354
 bEFFcUAG/U9GqDMidwsrLJ8Gyo1nAJUh9KuQUlrQjZIFUnFAvt1is2r3tUsiXM7lBZNTXLHnWjtxep
 1hKr3SbA3R04Z9ZaeVIYHEGcHPRInc4aR8XNsEG0Afo5hCk63RBzmo0s6hMCC/zkcviJ04J2A4S6s/
 zmE2Ok7xuoXJdA3oEHvGZg57XyuPvU2qSEp49phdlw4bjrIITC8CXsTgBeUKRTZDuwqM27zEU15Fii
 ++qHa044A7sR/zpWpb7YTBjzto+u9FNEtPfMtP1AUvwWE6KgVRPRRsvSLbkURjvVZq9CwKdzlrg616
 1MXEsomMRMfnNTTAnrtKSZELyxtUeT0NeC9xjtTNNo6SAY5BuDPiyBDJuW/g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_095542_739290_BFC27E86 
X-CRM114-Status: GOOD (  18.36  )
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

In order to setup the DSI clock, let's make the unused VCLK2 clock path
configuration via CCF.

The nocache option is removed from following clocks:
- vclk2_sel
- vclk2_input
- vclk2_div
- vclk2
- vclk_div1
- vclk2_div2_en
- vclk2_div4_en
- vclk2_div6_en
- vclk2_div12_en
- vclk2_div2
- vclk2_div4
- vclk2_div6
- vclk2_div12
- cts_encl_sel

vclk2 and vclk2_div uses the newly introduced vclk regmap driver
to handle the enable and reset bits.

In order to set a rate on cts_encl via the vclk2 clock path,
the NO_REPARENT flag is set on cts_encl_sel & vclk2_sel in order
to keep CCF from selection a parent.
The parents of cts_encl_sel & vclk2_sel are expected to be defined
in DT or manually set by the display driver at some point.

The following clock scheme is to be used for DSI:

xtal
\_ gp0_pll_dco
   \_ gp0_pll
      |- vclk2_sel
      |  \_ vclk2_input
      |     \_ vclk2_div
      |        \_ vclk2
      |           \_ vclk2_div1
      |              \_ cts_encl_sel
      |                 \_ cts_encl	-> to VPU LCD Encoder
      |- mipi_dsi_pxclk_sel
      \_ mipi_dsi_pxclk_div
         \_ mipi_dsi_pxclk		-> to DSI controller

The mipi_dsi_pxclk_div is set as bypass with a single /1 entry in div_table
in order to use the same GP0 for mipi_dsi_pxclk and vclk2_input.

The SET_RATE_PARENT is only set on the mipi_dsi_pxclk_sel clock so the
DSI bitclock is the reference base clock to calculate the vclk2_div value
when pixel clock is set on the cts_encl endpoint.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/meson/Kconfig |  1 +
 drivers/clk/meson/g12a.c  | 72 ++++++++++++++++++++++++++++++++++-------------
 2 files changed, 53 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index 8a9823789fa3..59a40a49f8e1 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -144,6 +144,7 @@ config COMMON_CLK_G12A
 	select COMMON_CLK_MESON_EE_CLKC
 	select COMMON_CLK_MESON_CPU_DYNDIV
 	select COMMON_CLK_MESON_VID_PLL_DIV
+	select COMMON_CLK_MESON_VCLK
 	select MFD_SYSCON
 	help
 	  Support for the clock controller on Amlogic S905D2, S905X2 and S905Y2
diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 90f4c6103014..083882e53b65 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -22,6 +22,7 @@
 #include "clk-regmap.h"
 #include "clk-cpu-dyndiv.h"
 #include "vid-pll-div.h"
+#include "vclk.h"
 #include "meson-eeclk.h"
 #include "g12a.h"
 
@@ -3165,7 +3166,7 @@ static struct clk_regmap g12a_vclk2_sel = {
 		.ops = &clk_regmap_mux_ops,
 		.parent_hws = g12a_vclk_parent_hws,
 		.num_parents = ARRAY_SIZE(g12a_vclk_parent_hws),
-		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,
+		.flags = CLK_SET_RATE_NO_REPARENT,
 	},
 };
 
@@ -3193,7 +3194,6 @@ static struct clk_regmap g12a_vclk2_input = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2_sel.hw },
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
 	},
 };
 
@@ -3215,19 +3215,32 @@ static struct clk_regmap g12a_vclk_div = {
 };
 
 static struct clk_regmap g12a_vclk2_div = {
-	.data = &(struct clk_regmap_div_data){
-		.offset = HHI_VIID_CLK_DIV,
-		.shift = 0,
-		.width = 8,
+	.data = &(struct meson_vclk_div_data){
+		.div = {
+			.reg_off = HHI_VIID_CLK_DIV,
+			.shift   = 0,
+			.width   = 8,
+		},
+		.enable = {
+			.reg_off = HHI_VIID_CLK_DIV,
+			.shift   = 16,
+			.width   = 1,
+		},
+		.reset = {
+			.reg_off = HHI_VIID_CLK_DIV,
+			.shift   = 17,
+			.width   = 1,
+		},
+		.flags = CLK_DIVIDER_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk2_div",
-		.ops = &clk_regmap_divider_ops,
+		.ops = &meson_vclk_div_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&g12a_vclk2_input.hw
 		},
 		.num_parents = 1,
-		.flags = CLK_GET_RATE_NOCACHE,
+		.flags = CLK_SET_RATE_GATE,
 	},
 };
 
@@ -3246,16 +3259,24 @@ static struct clk_regmap g12a_vclk = {
 };
 
 static struct clk_regmap g12a_vclk2 = {
-	.data = &(struct clk_regmap_gate_data){
-		.offset = HHI_VIID_CLK_CNTL,
-		.bit_idx = 19,
+	.data = &(struct meson_vclk_gate_data){
+		.enable = {
+			.reg_off = HHI_VIID_CLK_CNTL,
+			.shift   = 19,
+			.width   = 1,
+		},
+		.reset = {
+			.reg_off = HHI_VIID_CLK_CNTL,
+			.shift   = 15,
+			.width   = 1,
+		},
 	},
 	.hw.init = &(struct clk_init_data) {
 		.name = "vclk2",
-		.ops = &clk_regmap_gate_ops,
+		.ops = &meson_vclk_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2_div.hw },
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -3339,7 +3360,7 @@ static struct clk_regmap g12a_vclk2_div1 = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -3353,7 +3374,7 @@ static struct clk_regmap g12a_vclk2_div2_en = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -3367,7 +3388,7 @@ static struct clk_regmap g12a_vclk2_div4_en = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -3381,7 +3402,7 @@ static struct clk_regmap g12a_vclk2_div6_en = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -3395,7 +3416,7 @@ static struct clk_regmap g12a_vclk2_div12_en = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -3461,6 +3482,7 @@ static struct clk_fixed_factor g12a_vclk2_div2 = {
 			&g12a_vclk2_div2_en.hw
 		},
 		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -3474,6 +3496,7 @@ static struct clk_fixed_factor g12a_vclk2_div4 = {
 			&g12a_vclk2_div4_en.hw
 		},
 		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -3487,6 +3510,7 @@ static struct clk_fixed_factor g12a_vclk2_div6 = {
 			&g12a_vclk2_div6_en.hw
 		},
 		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -3500,6 +3524,7 @@ static struct clk_fixed_factor g12a_vclk2_div12 = {
 			&g12a_vclk2_div12_en.hw
 		},
 		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -3561,7 +3586,7 @@ static struct clk_regmap g12a_cts_encl_sel = {
 		.ops = &clk_regmap_mux_ops,
 		.parent_hws = g12a_cts_parent_hws,
 		.num_parents = ARRAY_SIZE(g12a_cts_parent_hws),
-		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,
+		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
 	},
 };
 
@@ -3717,15 +3742,22 @@ static struct clk_regmap g12a_mipi_dsi_pxclk_sel = {
 		.ops = &clk_regmap_mux_ops,
 		.parent_hws = g12a_mipi_dsi_pxclk_parent_hws,
 		.num_parents = ARRAY_SIZE(g12a_mipi_dsi_pxclk_parent_hws),
-		.flags = CLK_SET_RATE_NO_REPARENT,
+		.flags = CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_PARENT,
 	},
 };
 
+/* Force as bypass by forcing a single /1 table entry, and not rely of boot value */
+static const struct clk_div_table g12a_mipi_dsi_pxclk_div_table[] = {
+	{ .val = 0, .div = 1 },
+	{ /* sentinel */ },
+};
+
 static struct clk_regmap g12a_mipi_dsi_pxclk_div = {
 	.data = &(struct clk_regmap_div_data){
 		.offset = HHI_MIPIDSI_PHY_CLK_CNTL,
 		.shift = 0,
 		.width = 7,
+		.table = g12a_mipi_dsi_pxclk_div_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "mipi_dsi_pxclk_div",

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
