Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB9E2C54E64
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2024 11:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7mex+Tk7N68/7eCqz8xemdxRCQyA1Fxx0S+RkFG9DAA=; b=ieppJBMLbJazGN
	g3DqlUuEABlKsqv3bkdbo2PWOK5Y4k/vyeHbYglwD4VwiOJ+0s2u0HdmUcAK38rczvTTwl1mlRaBP
	QL8zAIxoOjWAduEOLvj/vOr5hneAJ8FNqyC+KvD0CM2cfPti4knUwANKzq82bkpuCZho4lN9XRbLb
	3p6SfkyX2GB/9KrSQxRZ2Gnc6Zepg4QH23j9XB3lhMimaNgnpsub4FkdI7xMjx7tktSVGp2Go05+4
	dcME5V5kmXTcvHy+LrL+vP6d/QgkntMwIq8QRFH9Z2vMpM+ti2YmXj8lkjmZyKt2LQzXELKma0RRK
	0jB1P870dMBRvSjjds0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roiDh-0000000GxP3-2kMA;
	Mon, 25 Mar 2024 11:10:25 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roiDH-0000000Gx3G-3TgC
	for linux-amlogic@lists.infradead.org;
	Mon, 25 Mar 2024 11:10:02 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-56c08d1e900so1352600a12.3
        for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2024 04:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711364997; x=1711969797; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZkiDF6CyURpbjnTnlPpjl05T1hEzDiWol01BVqEjgn0=;
        b=mxagqRkAzK/D/PyzlUYyJxPGiKSUI3CfxBdnApSDDWjAPITlFjT5hxTpNjQ+u+TByE
         jDi6gNvfjjOQcs3c5OgUiGfIAmx/Q88J51HAKNdvelei2y2wg6DMmvrPJflEgA8oNbL8
         Sz3kI8rlwY8u53+N+yTqfuitGPmDpCgUV+FeF4u0+aZnrN2MNl3etuQH0doebYQ7Z892
         gFFGOSwGXzdxFpUC5UIMVopNo67HU4LMVanl0x3ESQFR7WuOe9+EBkWsxLKIOCS6U+79
         6p0hwOwnpGT+9iKSIcb/2EO0l7Nz9MgpcEd2X2+HuW4qA4TIllgqCHTdgSbtcMplDSmH
         Uz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711364997; x=1711969797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZkiDF6CyURpbjnTnlPpjl05T1hEzDiWol01BVqEjgn0=;
        b=UWfeaS1ZIoOqRz1d1MIJ9W97pdRw0sbdgQ+rNvHSlPSvJM3BvKSeKSTJBGnR+iEj3z
         5exUwX8V96B+PxCVDOkQviQjl1/Zs0NlTHTs8PF7c4uHWVErJNeylBSGjJmaB8FdV5/f
         hC3Q5OkcCXnL62czQ653GMSPXWwxhnkNRTbO4/COXkJL21g3vndMkF/Sgn8baouZcHKD
         zyBNpMgEE9YNopYIvmsqfNmhrRf9vi5dkDrvMMCp7Umf8WVsgfd10EPHbTUCH4GkmhHb
         sK/OzIahcrw+pKgUTRQYKBUPUB/fGiD/V7ScsxGDfXmEJyBCOd4HXYv7CZUyBGny+FK8
         e3cg==
X-Forwarded-Encrypted: i=1; AJvYcCVwQ6VRyFHw4REnElgd+Z63mvuIasIdQrXBTUmaCRmyeK83b9+z775rOuKVZh7FbzxJXAbKe8JrrHZCm88vqAMBBdPiQbS3fCR35WgW+PjM9XM=
X-Gm-Message-State: AOJu0YxkJBZSqLV0RwyKr1vOm/QpIvlshx2ke+7P3CX3VDGwauxq/NAk
	iWk4z6BL34jYonrfKndGCAU1dGZcrZKOy6ACDi5KC6rHUL6rOt9S9XweA76Sarg=
X-Google-Smtp-Source: AGHT+IH9TSrIC7QtJmG03uKPHI/ELP1eaER4qsSJYwbOZWNokRrIEfgYq/tcfovPtsZPYh42Ua+sNg==
X-Received: by 2002:a17:906:94e:b0:a46:b4c7:341c with SMTP id j14-20020a170906094e00b00a46b4c7341cmr4381705ejd.58.1711364996940;
        Mon, 25 Mar 2024 04:09:56 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id bw26-20020a170906c1da00b00a4650ec48d0sm2972367ejb.140.2024.03.25.04.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 04:09:56 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 25 Mar 2024 12:09:49 +0100
Subject: [PATCH v11 3/7] clk: meson: g12a: make VCLK2 and ENCL clock path
 configurable by CCF
MIME-Version: 1.0
Message-Id: <20240325-amlogic-v6-4-upstream-dsi-ccf-vim3-v11-3-04f55de44604@linaro.org>
References: <20240325-amlogic-v6-4-upstream-dsi-ccf-vim3-v11-0-04f55de44604@linaro.org>
In-Reply-To: <20240325-amlogic-v6-4-upstream-dsi-ccf-vim3-v11-0-04f55de44604@linaro.org>
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
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmAVt9/A/6HByhZ4Me2YdPSbrWA7xwKr5A8fgQaIsI
 3xfHXWKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZgFbfQAKCRB33NvayMhJ0eknEA
 DL1fA1oGxXTuOcm2I7RkRz5exbQYM/tbnx0isdM53QjxzMylI8nV5lKJoIN3/hgV/Nr9VR48YeDmw0
 VoYtLei4XZKjoqZks4k/zbr6IYyvHFlDep/eNtkqKMEQQD7efb6PWikhkcIWqghdWbhpJ0X+2LdoS4
 7pfXjiSZvDUJ1p71+ySAkSStVcvFfUI+aI1+2RMgf+OoJQgGDc6M2BhzS8N/aSgN78rDGwKAFV8gQM
 XmHLvKIcK+G+qVNvTiMiC35TqUejT6J4olAm9euh9RM6K36GkIfL3p+sisaxwpTV4H+2YPYcQRbaoT
 1j0NBXfF6GVtnuf3ovWOcAY94lKnYLGPZwp49VqmauVrEd6PCpoyd/ToQR3udo4o9kIq0v90oQq5pS
 ZX0sZ5zgeelWGWi5H+shGtj9zdMUHNJSoXxf/I2t0LySBkASh2iKMB+2CPjJsNzrXuTkOd/QTGiLq+
 J84JEyELVcwD/JYiP4Nz3Fex7hURDQ6hEjAFP4DbdZqHeoL4S5GzMrsv1kyhzn8/n+N4iy2mOl8vT2
 N+Av03kUON/yNrsYSZmDTG+FmC2iQ7CkUuQqOqDAsH0rgtBMz9hT09kMosRaB0jztO0l9pYFr3hBV0
 2Tl/RKBODngA0k6xakLKjJyIeygzVvaehfkP1tAGVg+3RbjdFDzujeUQdxbw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_041000_021934_CE96D157 
X-CRM114-Status: GOOD (  19.13  )
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
