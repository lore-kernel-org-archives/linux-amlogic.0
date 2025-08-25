Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4A0CA0FF2
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Aug 2025 15:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4NfhnNcq5gLkn5zkAC64wcifg+qyHNx57r2YNTcSrEQ=; b=DUGpbVhG2JsPsm
	g94Fsogl0YG83zpnyyADiMCCRWHKqqM2j8q6999uhGMjGsSVXb39Hps1RHMdegQQgzowjYGE3X5ve
	eASIJVrrOTfuL1vEFiqMl4Vv9Cd9yCz0+nebY8mBvo0L9tbUgVT9o+CJvFIjFIu+ldnXUt1qtXayJ
	LLpXAlL/ef3XWfH4GnasRIjkoVl6yBfh8S0QFWNg7Rm3SkQM2n38n94tFsV8Ovma4xQdGldZT5QHh
	gKNI1fg25nPjjoT6VTrPLm5i4InR7W5TIfwboQS9Q0yYPz82IXOhBgO43/Q/RijbO9ajnpzmtjq4J
	Q6fX6QNl8149C8bgGhsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZ9P-00000008WE2-4BGF;
	Mon, 25 Aug 2025 15:30:28 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYAE-00000008Fje-1h08
	for linux-amlogic@lists.infradead.org;
	Mon, 25 Aug 2025 14:27:15 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3c8b0f1b699so1064419f8f.0
        for <linux-amlogic@lists.infradead.org>; Mon, 25 Aug 2025 07:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1756132033; x=1756736833; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NZFizNzZeDwxlG4/SOUoWjAfRTsGu/AR5Ui24dmicOw=;
        b=0sSwHPpDG//6KdtTdN8DQ9TqDAJ1uwE0G/zCEU5DHxXD7nQZKfvYrPMpGfR0hYeR9H
         y3wuwM0ume13JMMDPSNYoWidzacy8LMX04PYQQjFy0BnCIsy4XekcomxYD2UVNhqi82r
         UmPqS6EaeiQKCo/ZMv5aaj6qzcT8sXk73KfNSJ0vgrE4C4I1QhlbZu8rOth7hBnDQWmM
         SwLXJTX2gCoTjbyn3K6zpWeOcmLRF1u0vqN7hOWZe2VWVvmDH/dC3LNZjmBmqn3om4e/
         UJmtvInxFPo/4XhglNaYtiWq2v4tOodDlsu/0Ul20QKdDGyJWnLTBraQCcjBdBh0c0iu
         8lgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756132033; x=1756736833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NZFizNzZeDwxlG4/SOUoWjAfRTsGu/AR5Ui24dmicOw=;
        b=mxoXeCq2EvXYPAXWEy74pmdkUR8NOd4ouBRfA5drVJtO0KPZ+GjtOCfbl0BxXgqjzF
         ixYeLlkp/JxVYp4yhT1ABaat32/fV8cM11glEw5rrOnVPFo07CYN6oC6wiaV/YDfM+N4
         KdRGjZ065SH3G7VQsbjpdDvHaHB8KJ8TBdas0m5parRKsMEQVpa4REf2CqYMqGXzlzDf
         exPRq74w+MQRvrY+nArT5H2w23Fk5TIG8ztmIvbhMEPENr0mt68RDPVNhtvgVmE7G9Ya
         BwDddGL96tm7EXb7CBjWUd9KPT86E3ngASlxKez2RzEWdQfZMaOEdcNjQMjE0NQClXkG
         RSkg==
X-Gm-Message-State: AOJu0YwxacHg1oQb7xzYkZsmNxh+L84OO92lAMuOM8LgU6hcK3wOFTqN
	8OPWkATLowpPs7fgFQf18USpDAUFoDBfLQQwyxcBl6wZULkn2HQzwq35BcJbliH3cgw=
X-Gm-Gg: ASbGnctKMpeZ3lo+r9Xv0QoGBuclYXOp2xFaNRI2DWuRa1SH6kYPnaUnfpZcfPAWSFm
	SAQjs1m4lR/nyg7lxjr2cmEIbe57dQIQFTd9AyW78qJS8DMK1X/AY7kHvHpw8I6QqfO75LKndtr
	iAtg+C1I25wgSJDbIskv3ZqxmUr3oWaEXfdFZiVD1JokHjUC4kV40Iv6umVK3qGIZ6flH8EGM28
	Ywrzwnk5gL7bOxw177VXfWRDtMeZiwHhl/2CBm87ByGmQpgp8UyFNeyeKayiDGMOmiAetIV8i31
	Hff1g+a5bxAQwiSGZwCRfOCxi9iviyomt67045Hj9SaM7IOcJgqRTyHXCCEWjy7CF43tb/mQZuj
	cWaDwG+qqwFRNEHo48E3MqC7OTmcveRhG2vbw
X-Google-Smtp-Source: AGHT+IEX7kxqjPNKgzRc5FzaaGAx++7bJd2BZ0Co0JpBuqwb92/9N/1Cu7pGDaS30PlQl+fwDeeX+g==
X-Received: by 2002:adf:e912:0:b0:3c6:cb4:e05e with SMTP id ffacd0b85a97d-3c60cb4e578mr7827667f8f.56.1756132032709;
        Mon, 25 Aug 2025 07:27:12 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:b261:baab:ed3d:3cb6])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3c70e4b9e1fsm12634462f8f.14.2025.08.25.07.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:27:12 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 25 Aug 2025 16:26:34 +0200
Subject: [PATCH v2 09/12] clk: amlogic: use the common pclk definition
MIME-Version: 1.0
Message-Id: <20250825-meson-clk-cleanup-24-v2-9-0f402f01e117@baylibre.com>
References: <20250825-meson-clk-cleanup-24-v2-0-0f402f01e117@baylibre.com>
In-Reply-To: <20250825-meson-clk-cleanup-24-v2-0-0f402f01e117@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9875; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=ssDaR4wz9jG+IVUW3bzaW/s+xN9zK8sGhakg0LDPY+Q=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBorHK1XCoZgxVMFC8fEWvbXexWAF6ILhH1Z8QIs
 W7L+unfqrmJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaKxytQAKCRDm/A8cN/La
 hReZD/9IOkOqaQw7NpA3Ed83SvElIRCwDS93n8wA/pakL03R+G7MjmDwhrSnqIgeYkL9YyRRyZV
 dWWfJGtaHui0SDUokqEdnhDwxEajYUHwB1zAyxT7DVL+V0AcDL+/CmIfCZnBmQsGWDwlvHnOup8
 0quDjTTETx1wWkO6STK+2dI/T/VE+zES5ZDQGss0WzmNxmSL276QwfAp77cTOLnMr/GzJT4wn50
 kgFOjOLk3Adgs4eHzH7qD9VPUWbOKesg4xJr7wdHQwxDh0bhXmLbmvB7qiRzX4RJur5SWEGR75K
 jFQJrHx1zdVlybnWyCFWomOPxafXFMsMmA8O8G5RQywACwHbgvRhY2hahygzb4hYjNAk+G+GA1I
 Wy6YdUNksqln4vNZwDtMqwpGwPj9ABAdrMFvsiBWUg+ARapT1Pg6YVK9KXgBfuR1QWXLHrQ/oDd
 Hl9KLZ9M8YBjX+qbwgmIa4LYKKoF34GhCCClZxAH7j3RVLHKR7yjA54/tzEnghQ4Av4tkHNsa7/
 mV1aZnpSpcSWEDDd8xLKQI2Vb7Jj+g+FTZP3FVVBhdsLYMEoRztyOz2m5ipwyYMJqWCEZqbeZcO
 K9VLWEWIhf8qGpiCS0GL7YX4l3J5YfIv7znrvmoMTK8m5buRBlxszxNJEeyPuQqCPPNs5qHkz+o
 xZYAaw1yRw2Du0w==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_072714_495969_4AD7499A 
X-CRM114-Status: GOOD (  11.17  )
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
