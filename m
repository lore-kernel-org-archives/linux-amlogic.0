Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA366C77B7C
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Jul 2025 16:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4NfhnNcq5gLkn5zkAC64wcifg+qyHNx57r2YNTcSrEQ=; b=tJ/Rzjs1T+IDpf
	3XDqgefle1I4Thegw1H8UUJZaqLvr6OCXmEd0P5ycZ4K+8roVlwPWK8CCesd4hEXW9VSn7e8otQWY
	ZxmAWa7uj27YlGpySCjipK0qqdSxJtGLuCFlgC56RbzRIsgBgxK4iZQXnKTgI3JSUlXlvGh0+mUWA
	hskHWZQR4qSrFDmCM/uBZpWYp7E5El1Bfhr8cBeSshRz0bXXPZDpeskJrs7pZbb5vOYVFSlVl9C/C
	XmXp938BeFYtS3ZmNHhj6OW1cYIRq8fgO9/eWQGcDlMYurFZzBFXFP7bpKM15R0AmactUJ3szIJHg
	XLoY7C+jXl8vZrDXVRzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0VJ-00000008zTn-1R60;
	Wed, 02 Jul 2025 16:40:13 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzN4-00000008mz4-0zNQ
	for linux-amlogic@lists.infradead.org;
	Wed, 02 Jul 2025 15:27:39 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a54690d369so4352224f8f.3
        for <linux-amlogic@lists.infradead.org>; Wed, 02 Jul 2025 08:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751470057; x=1752074857; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NZFizNzZeDwxlG4/SOUoWjAfRTsGu/AR5Ui24dmicOw=;
        b=wVZt+sQ5U7l4WMsDI0wXKRAZyWbarCRPpJ56yhe+LFMqaWXILMUC4zxGJSmspBDxQ5
         eIXvINT9S6nqiXcDnIMt92KMidpK8V6ZvYlr7huvpZ4gI0J5hpKw7XAYS7SZaGtMpYan
         so2RtlsIv6mcPwpzPgcNNS4nHpcuDFkoNlWbW83Pq0u55bKuknKbT7sbkeO0JEyyQ++5
         CmuipsSfIIx/ar0p4YQJnOr9biX6z9MCyA5pIZ+v1WIUwffcR9UgDYQ6CpJrL8N4zd1H
         N48slTugyPbFljZ6yXlyeWxmZ2d4O8GO6ZPXjTOOQ5eHJHci/c3TAIaVMc2wVLwp76xo
         aXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470057; x=1752074857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NZFizNzZeDwxlG4/SOUoWjAfRTsGu/AR5Ui24dmicOw=;
        b=rBUC1d0mxm1bqOdwe2PrMX1pUCrpCHFrlEuoy23GQ/xZiAQurowBmQ8hfqBwILXCIU
         XDjpbLkqvL4xK7B3E+QTNDWiGju6YEBGvJsm7UrpWd1vjj1llxdSlE7ESaak7Y2byGmM
         w0emtfGesiBpCz6HYMackaduPvugxTMgydQz/8VIkrkQfzBa54utQjBRmB9HbW5XzgOX
         Pk7tZrPwrHOdq/T1k7rzMRKzQ9vdd83gVzrKzgtCcMiWBffpS0S5aQBYXcRu00qWoWuw
         q9fzZWvHCfTEg18UfG3ZP5pwC0Z09z0DrB7juB+lwrygoxwsxQV2NduJ1rk3t257g4WB
         HrGA==
X-Gm-Message-State: AOJu0YzNvBOi7BtxGLf8s1+YF74Om+HLQcaMDx8U9oAqPgAFJYxXt4Vq
	k04k2Tc2oKJPNAyWjeoEP+SSwIjSv7ESDRlRi6Dt3hHUo2UfwbE05Q6MJ/TtP16JBL4=
X-Gm-Gg: ASbGncvbG9VO1OZa7wQr3P4/fE0n8h4Shd8HxMJ4dOxVJcFHmQuBlz0HtUv06zkU6nE
	cBukBhHT1cTI1Bz58Yhrb1bg4wthT8kEcpJIOUZCFxXYxvME1N3P0yY4xvETOA8AEpqeQ177XEh
	d5I3jcehD6n45d3DoUAiZwQykXqUiyxBpeakc06K+psdU0sVZt18Cc0vzW1gcraXpKm4JhYjxSL
	xghYLnz9X9jEnA5/eYG5LdIbrA3tCXA2GSYloBZoDO2K425l8beQV3bWXVhABtJlcIHV8lEUF2k
	VxHZhryf7gmEKCzynTrvmVOP16kXCqTvWVUVKcmMohOBcMXQUEGOK6xFju6/IDHCNAKSV8iaN57
	p
X-Google-Smtp-Source: AGHT+IF24IwkUpTRhOzSih3Uk3Xy9Ey1JQd9FnEQ32rPMPJHNrcWp9J2a3eLo2t/S0yOg0DJBYaVKg==
X-Received: by 2002:a5d:64c4:0:b0:3a4:e502:81e1 with SMTP id ffacd0b85a97d-3b2018c241bmr2829917f8f.52.1751470056666;
        Wed, 02 Jul 2025 08:27:36 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:5542:4bad:e07b:9489])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454a9bcf35csm869205e9.20.2025.07.02.08.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 08:27:36 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 02 Jul 2025 17:26:21 +0200
Subject: [PATCH 23/26] clk: amlogic: use the common pclk definition
MIME-Version: 1.0
Message-Id: <20250702-meson-clk-cleanup-24-v1-23-e163c9a1fc21@baylibre.com>
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9875; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=ssDaR4wz9jG+IVUW3bzaW/s+xN9zK8sGhakg0LDPY+Q=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoZU/LBSs116AIECGxYGVG9zbAYzeZGrNC4zYz8
 y9OqUR0oMSJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaGVPywAKCRDm/A8cN/La
 hapdEAC0txIhiAF5JVyixaFEUIvo6bO+P+U90UBDfyetIF0ahvgGCX9D7yRl7QeavIOaoMwag4Q
 3UVKrs+4527yuN15JKV9Bdv62cRJFTP8NMDRBgPOKCk4sPTB5IlUKLQt6+OmSdJB0FeSfP5y+00
 rnU0APno9EV0jtAJx72G9wfEJfftNp6UrWDgx0Zxoa+ATLVNGENCMP2OcCuf/yh+xGcepRvOC8V
 ikEoH59ya9+veFEAOt+EnuMx6iqecfmSGl+UmNjSgrV6EHOvuYec7GyckTw549CprnUntPlp9EW
 /5zCr9ZgH7+pdNVXhULoQ3tlRhAJuHP0y6ejhABQxCP8BFOshv0YtLMdlLa9VKgYba7evpiINxt
 sPgwLPVt4fUajoqpA9z3zlUW2osawSj51HSiZ1FOjZdh/nEIJ5WtWl9KbPPY5FShMhg9vZqn7de
 6YbSJfW5hxkOReT2LJv5QR+IJmcWOu8pjkdLbjzU2qTfyKwMOYcq0tDKhltET3RBFG2YUZmGNeD
 kJ6biBSRt7ok0/WdQvn0V7g9iA+LYy6cg7qOL3jhlxjxjCkum8qnVNm+iYdIDhLLgaFXSviDXUY
 eOVqItzszrIivJ6dDfkEYcVu1wX6oFwyXwr2UZELeJluQ6FQj3YDx92/dsKJLZZNIHE5fgI9LBt
 wf8vo+kqhrOiGOQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_082738_281446_EFCE4566 
X-CRM114-Status: GOOD (  11.00  )
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

Replace marcros defining pclks with the common one, reducing code
duplication.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/axg-aoclk.c      | 35 +++++++++-----------------
 drivers/clk/meson/c3-peripherals.c | 34 +++++++-------------------
 drivers/clk/meson/g12a-aoclk.c     | 50 +++++++++++++++-----------------------
 drivers/clk/meson/gxbb-aoclk.c     | 33 +++++++++----------------
 4 files changed, 51 insertions(+), 101 deletions(-)

diff --git a/drivers/clk/meson/axg-aoclk.c b/drivers/clk/meson/axg-aoclk.c
index 74c2f51424f11cc04a80a3a4918e4de0a5d11d08..902fbd34039cc06d512f1237a1e5d9050fd00b4b 100644
--- a/drivers/clk/meson/axg-aoclk.c
+++ b/drivers/clk/meson/axg-aoclk.c
@@ -34,30 +34,19 @@
 #define AO_RTC_ALT_CLK_CNTL0	0x94
 #define AO_RTC_ALT_CLK_CNTL1	0x98
 
-#define AXG_AO_GATE(_name, _bit, _flags)				\
-static struct clk_regmap axg_ao_##_name = {				\
-	.data = &(struct clk_regmap_gate_data) {			\
-		.offset = (AO_RTI_GEN_CNTL_REG0),			\
-		.bit_idx = (_bit),					\
-	},								\
-	.hw.init = &(struct clk_init_data) {				\
-		.name =  "axg_ao_" #_name,				\
-		.ops = &clk_regmap_gate_ops,				\
-		.parent_data = &(const struct clk_parent_data) {	\
-			.fw_name = "mpeg-clk",				\
-		},							\
-		.num_parents = 1,					\
-		.flags = (_flags),					\
-	},								\
-}
+static const struct clk_parent_data axg_ao_pclk_parents = { .fw_name = "mpeg-clk" };
 
-AXG_AO_GATE(remote,	0, CLK_IGNORE_UNUSED);
-AXG_AO_GATE(i2c_master,	1, CLK_IGNORE_UNUSED);
-AXG_AO_GATE(i2c_slave,	2, CLK_IGNORE_UNUSED);
-AXG_AO_GATE(uart1,	3, CLK_IGNORE_UNUSED);
-AXG_AO_GATE(uart2,	5, CLK_IGNORE_UNUSED);
-AXG_AO_GATE(ir_blaster,	6, CLK_IGNORE_UNUSED);
-AXG_AO_GATE(saradc,	7, CLK_IGNORE_UNUSED);
+#define AXG_AO_GATE(_name, _bit, _flags)		       \
+	MESON_PCLK(axg_ao_##_name, AO_RTI_GEN_CNTL_REG0, _bit, \
+		   &axg_ao_pclk_parents, _flags)
+
+static AXG_AO_GATE(remote,	0, CLK_IGNORE_UNUSED);
+static AXG_AO_GATE(i2c_master,	1, CLK_IGNORE_UNUSED);
+static AXG_AO_GATE(i2c_slave,	2, CLK_IGNORE_UNUSED);
+static AXG_AO_GATE(uart1,	3, CLK_IGNORE_UNUSED);
+static AXG_AO_GATE(uart2,	5, CLK_IGNORE_UNUSED);
+static AXG_AO_GATE(ir_blaster,	6, CLK_IGNORE_UNUSED);
+static AXG_AO_GATE(saradc,	7, CLK_IGNORE_UNUSED);
 
 static struct clk_regmap axg_ao_cts_oscin = {
 	.data = &(struct clk_regmap_gate_data){
diff --git a/drivers/clk/meson/c3-peripherals.c b/drivers/clk/meson/c3-peripherals.c
index e9c1ef99be13d0542b8a972ceffe69c8a9977118..02c9820cd98655e57a290859b595cf09d39e5fe3 100644
--- a/drivers/clk/meson/c3-peripherals.c
+++ b/drivers/clk/meson/c3-peripherals.c
@@ -164,30 +164,13 @@ static struct clk_regmap c3_rtc_clk = {
 	},
 };
 
-#define C3_PCLK(_name, _reg, _bit, _fw_name, _ops, _flags)		\
-struct clk_regmap c3_##_name = {					\
-	.data = &(struct clk_regmap_gate_data){				\
-		.offset = (_reg),					\
-		.bit_idx = (_bit),					\
-	},								\
-	.hw.init = &(struct clk_init_data) {				\
-		.name = "c3_" #_name,					\
-		.ops = _ops,						\
-		.parent_data = &(const struct clk_parent_data) {	\
-			.fw_name = (_fw_name),				\
-		},							\
-		.num_parents = 1,					\
-		.flags = (_flags),					\
-	},								\
-}
+static const struct clk_parent_data c3_sys_pclk_parents = { .fw_name = "sysclk" };
 
-#define C3_SYS_PCLK(_name, _reg, _bit, _flags)				\
-	C3_PCLK(_name, _reg, _bit, "sysclk",				\
-		&clk_regmap_gate_ops, _flags)
+#define C3_SYS_PCLK(_name, _reg, _bit, _flags) \
+	MESON_PCLK(c3_##_name, _reg, _bit, &c3_sys_pclk_parents, _flags)
 
-#define C3_SYS_PCLK_RO(_name, _reg, _bit)				\
-	C3_PCLK(_name, _reg, _bit, "sysclk",				\
-		&clk_regmap_gate_ro_ops, 0)
+#define C3_SYS_PCLK_RO(_name, _reg, _bit) \
+	MESON_PCLK_RO(c3_##_name, _reg, _bit, &c3_sys_pclk_parents, 0)
 
 static C3_SYS_PCLK(sys_reset_ctrl,	SYS_CLK_EN0_REG0, 1, 0);
 static C3_SYS_PCLK(sys_pwr_ctrl,	SYS_CLK_EN0_REG0, 3, 0);
@@ -290,9 +273,10 @@ static C3_SYS_PCLK(sys_vc9000e,		SYS_CLK_EN0_REG2, 2, 0);
 static C3_SYS_PCLK(sys_pwm_mn,		SYS_CLK_EN0_REG2, 3, 0);
 static C3_SYS_PCLK(sys_sd_emmc_b,	SYS_CLK_EN0_REG2, 4, 0);
 
-#define C3_AXI_PCLK(_name, _reg, _bit, _flags)				\
-	C3_PCLK(_name, _reg, _bit, "axiclk",				\
-		&clk_regmap_gate_ops, _flags)
+static const struct clk_parent_data c3_axi_pclk_parents = { .fw_name = "axiclk" };
+
+#define C3_AXI_PCLK(_name, _reg, _bit, _flags) \
+	MESON_PCLK(c3_##_name, _reg, _bit, &c3_axi_pclk_parents, _flags)
 
 /*
  * NOTE: axi_sys_nic provides the clock to the AXI bus of the system NIC. After
diff --git a/drivers/clk/meson/g12a-aoclk.c b/drivers/clk/meson/g12a-aoclk.c
index 45e4df393feb6f916b6e035ad71e379e6e30ee99..96981da271fa1453ebbe433e36cff4409661fa6a 100644
--- a/drivers/clk/meson/g12a-aoclk.c
+++ b/drivers/clk/meson/g12a-aoclk.c
@@ -37,22 +37,10 @@
 #define AO_RTC_ALT_CLK_CNTL0	0x94
 #define AO_RTC_ALT_CLK_CNTL1	0x98
 
-#define G12A_AO_PCLK(_name, _reg, _bit, _flags)				\
-static struct clk_regmap g12a_ao_##_name = {				\
-	.data = &(struct clk_regmap_gate_data) {			\
-		.offset = (_reg),					\
-		.bit_idx = (_bit),					\
-	},								\
-	.hw.init = &(struct clk_init_data) {				\
-		.name =  "g12a_ao_" #_name,				\
-		.ops = &clk_regmap_gate_ops,				\
-		.parent_data = &(const struct clk_parent_data) {	\
-			.fw_name = "mpeg-clk",				\
-		},							\
-		.num_parents = 1,					\
-		.flags = (_flags),					\
-	},								\
-}
+static const struct clk_parent_data g12a_ao_pclk_parents = { .fw_name = "mpeg-clk" };
+
+#define G12A_AO_PCLK(_name, _reg, _bit, _flags) \
+	MESON_PCLK(g12a_ao_##_name, _reg, _bit, &g12a_ao_pclk_parents, _flags)
 
 /*
  * NOTE: The gates below are marked with CLK_IGNORE_UNUSED for historic reasons
@@ -63,22 +51,22 @@ static struct clk_regmap g12a_ao_##_name = {				\
  *  - add a comment explaining why the use of CLK_IGNORE_UNUSED is desirable
  *    for a particular clock.
  */
-G12A_AO_PCLK(ahb,	AO_CLK_GATE0,    0, CLK_IGNORE_UNUSED);
-G12A_AO_PCLK(ir_in,	AO_CLK_GATE0,    1, CLK_IGNORE_UNUSED);
-G12A_AO_PCLK(i2c_m0,	AO_CLK_GATE0,    2, CLK_IGNORE_UNUSED);
-G12A_AO_PCLK(i2c_s0,	AO_CLK_GATE0,    3, CLK_IGNORE_UNUSED);
-G12A_AO_PCLK(uart,	AO_CLK_GATE0,    4, CLK_IGNORE_UNUSED);
-G12A_AO_PCLK(prod_i2c,	AO_CLK_GATE0,    5, CLK_IGNORE_UNUSED);
-G12A_AO_PCLK(uart2,	AO_CLK_GATE0,    6, CLK_IGNORE_UNUSED);
-G12A_AO_PCLK(ir_out,	AO_CLK_GATE0,    7, CLK_IGNORE_UNUSED);
-G12A_AO_PCLK(saradc,	AO_CLK_GATE0,    8, CLK_IGNORE_UNUSED);
+static G12A_AO_PCLK(ahb,	AO_CLK_GATE0,    0, CLK_IGNORE_UNUSED);
+static G12A_AO_PCLK(ir_in,	AO_CLK_GATE0,    1, CLK_IGNORE_UNUSED);
+static G12A_AO_PCLK(i2c_m0,	AO_CLK_GATE0,    2, CLK_IGNORE_UNUSED);
+static G12A_AO_PCLK(i2c_s0,	AO_CLK_GATE0,    3, CLK_IGNORE_UNUSED);
+static G12A_AO_PCLK(uart,	AO_CLK_GATE0,    4, CLK_IGNORE_UNUSED);
+static G12A_AO_PCLK(prod_i2c,	AO_CLK_GATE0,    5, CLK_IGNORE_UNUSED);
+static G12A_AO_PCLK(uart2,	AO_CLK_GATE0,    6, CLK_IGNORE_UNUSED);
+static G12A_AO_PCLK(ir_out,	AO_CLK_GATE0,    7, CLK_IGNORE_UNUSED);
+static G12A_AO_PCLK(saradc,	AO_CLK_GATE0,    8, CLK_IGNORE_UNUSED);
 
-G12A_AO_PCLK(mailbox,	AO_CLK_GATE0_SP, 0, CLK_IGNORE_UNUSED);
-G12A_AO_PCLK(m3,	AO_CLK_GATE0_SP, 1, CLK_IGNORE_UNUSED);
-G12A_AO_PCLK(ahb_sram,	AO_CLK_GATE0_SP, 2, CLK_IGNORE_UNUSED);
-G12A_AO_PCLK(rti,	AO_CLK_GATE0_SP, 3, CLK_IGNORE_UNUSED);
-G12A_AO_PCLK(m4_fclk,	AO_CLK_GATE0_SP, 4, CLK_IGNORE_UNUSED);
-G12A_AO_PCLK(m4_hclk,	AO_CLK_GATE0_SP, 5, CLK_IGNORE_UNUSED);
+static G12A_AO_PCLK(mailbox,	AO_CLK_GATE0_SP, 0, CLK_IGNORE_UNUSED);
+static G12A_AO_PCLK(m3,		AO_CLK_GATE0_SP, 1, CLK_IGNORE_UNUSED);
+static G12A_AO_PCLK(ahb_sram,	AO_CLK_GATE0_SP, 2, CLK_IGNORE_UNUSED);
+static G12A_AO_PCLK(rti,	AO_CLK_GATE0_SP, 3, CLK_IGNORE_UNUSED);
+static G12A_AO_PCLK(m4_fclk,	AO_CLK_GATE0_SP, 4, CLK_IGNORE_UNUSED);
+static G12A_AO_PCLK(m4_hclk,	AO_CLK_GATE0_SP, 5, CLK_IGNORE_UNUSED);
 
 static struct clk_regmap g12a_ao_cts_oscin = {
 	.data = &(struct clk_regmap_gate_data){
diff --git a/drivers/clk/meson/gxbb-aoclk.c b/drivers/clk/meson/gxbb-aoclk.c
index 2bf45fd7fe4ba0783e736fbbb126209870985b22..c7dfb3a06cb5f70c98f65bb91b937e1b870b34fe 100644
--- a/drivers/clk/meson/gxbb-aoclk.c
+++ b/drivers/clk/meson/gxbb-aoclk.c
@@ -23,29 +23,18 @@
 #define AO_RTC_ALT_CLK_CNTL0	0x94
 #define AO_RTC_ALT_CLK_CNTL1	0x98
 
-#define GXBB_AO_PCLK(_name, _bit, _flags)					\
-static struct clk_regmap gxbb_ao_##_name = {				\
-	.data = &(struct clk_regmap_gate_data) {			\
-		.offset = AO_RTI_GEN_CNTL_REG0,				\
-		.bit_idx = (_bit),					\
-	},								\
-	.hw.init = &(struct clk_init_data) {				\
-		.name = "gxbb_ao_" #_name,				\
-		.ops = &clk_regmap_gate_ops,				\
-		.parent_data = &(const struct clk_parent_data) {	\
-			.fw_name = "mpeg-clk",				\
-		},							\
-		.num_parents = 1,					\
-		.flags = (_flags),					\
-	},								\
-}
+static const struct clk_parent_data gxbb_ao_pclk_parents = { .fw_name = "mpeg-clk" };
 
-GXBB_AO_PCLK(remote,		0, CLK_IGNORE_UNUSED);
-GXBB_AO_PCLK(i2c_master,	1, CLK_IGNORE_UNUSED);
-GXBB_AO_PCLK(i2c_slave,		2, CLK_IGNORE_UNUSED);
-GXBB_AO_PCLK(uart1,		3, CLK_IGNORE_UNUSED);
-GXBB_AO_PCLK(uart2,		5, CLK_IGNORE_UNUSED);
-GXBB_AO_PCLK(ir_blaster,	6, CLK_IGNORE_UNUSED);
+#define GXBB_AO_PCLK(_name, _bit, _flags)			\
+	MESON_PCLK(gxbb_ao_##_name, AO_RTI_GEN_CNTL_REG0, _bit, \
+		   &gxbb_ao_pclk_parents, _flags)
+
+static GXBB_AO_PCLK(remote,	0, CLK_IGNORE_UNUSED);
+static GXBB_AO_PCLK(i2c_master,	1, CLK_IGNORE_UNUSED);
+static GXBB_AO_PCLK(i2c_slave,	2, CLK_IGNORE_UNUSED);
+static GXBB_AO_PCLK(uart1,	3, CLK_IGNORE_UNUSED);
+static GXBB_AO_PCLK(uart2,	5, CLK_IGNORE_UNUSED);
+static GXBB_AO_PCLK(ir_blaster,	6, CLK_IGNORE_UNUSED);
 
 static struct clk_regmap gxbb_ao_cts_oscin = {
 	.data = &(struct clk_regmap_gate_data){

-- 
2.47.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
