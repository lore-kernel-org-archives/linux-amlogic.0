Return-Path: <SRS0=GwLp=O6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 973C5C43387
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Dec 2018 16:03:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B75621920
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Dec 2018 16:03:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M91AeBwh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="jNZ6w6hk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B75621920
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ecnv0YNpBTT0eQ3o1z9ZQEz+R6IAykfmu2x2pzUs0t0=; b=M91AeBwh3Jkm0F
	mSoiMShhTh92msl8nOpukpvqJm1mzcRGPtm7fz2aWKH1/aBv2CuLOo3OUtfobp4BebZ0ycb7wPqt+
	CmVGlyeBCgngPpdl15fIMuG0muLtC8Kbt0HPFrxBJuLNT64zGqFZxY9w9WXNcmlwUFUjYWC3cR+mM
	a74cMK3afAPHXdrsS4cl82zR6V02ql1dCRSBznKeau0w5pKDXbpiTNJCKoGb8tGwDl28/sX6mtBPg
	xTkldZ+iVOBAHDgp3I6j5fmb0GT1AHWRr865R2aS4VgfXSc23aO2ZGsQIxPZY8MV7uu617+SfZ5oG
	OxtTg+cnGBBhNaCoMWRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gaNGd-0000Ug-9x; Fri, 21 Dec 2018 16:03:15 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gaNGX-0000H8-PI
 for linux-amlogic@lists.infradead.org; Fri, 21 Dec 2018 16:03:13 +0000
Received: by mail-wm1-x343.google.com with SMTP id m1so5776956wml.2
 for <linux-amlogic@lists.infradead.org>; Fri, 21 Dec 2018 08:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zzbm13PIonVfBVmeY6obszSgV2a/9581FnWBBbtOFLc=;
 b=jNZ6w6hkm+oei4av6eSl2KsaPY58pjfpG87YY97wtzz3HnJFGzJX7OOZwQ4m1SDUDa
 ypHBmcKa8JRvr/gPKNlPSxmTyIhHsl3eS3g0Xm9bSyQhT4nVf8wEMptfRXCUFO88MO1Z
 nnJUWtIiobDI2NcdC7IKyZBT3NAMtmq3eZcqm+ch7zZKR7BFy94eEMghWkPgi0RXnqkE
 lnAskn9/an8bXQ52lfKAe+MamurRinnRcNMSrKkPM6UduNb/9edWQlZ2BmQvNAftmmN/
 PcwaUdLuJ0fXZpsCHWHR+QSkiNBGTMRhTL7ylvxZ0BgU762cOr1/fyeev3yrB/ucCNCQ
 +ZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zzbm13PIonVfBVmeY6obszSgV2a/9581FnWBBbtOFLc=;
 b=doy/JkahNHnlcRxoVCKG5FchjzaQjCYklhSBW7Fk/F7omfN0DCB1mxEyVSSGWi9tdD
 o3PePH0+Bl1FbYelSod/Vh96M8jRF6nyQG8Uk60BUqtOj01UhhGeeMj/l9TbgPv1ZsXI
 AjIGqVjvh3MA2VM14KWPAT9wv4PKMSVE6m3VESuVP6RivEMrU8YSWobQz0+OVy2r3T/a
 +tuVsgawKqLIdeQmkkoWeVYGWz3wjeWtdW6GW9wjXKtf4Wn/k66f+irWOFs9Lthlsbgd
 5KGjQ+GqByNfzYOx/R+89nunK4xQTvcFmRg4WW7yiZQJGw5JCB8L3QHTSpftsyR1bVwG
 OM9w==
X-Gm-Message-State: AA+aEWZaqJkin3G7A0nl2Ts42/z48/tgQCC9KkKsyCDGlRsWMSMvVLrq
 8vuwBpngYqdlb8vpjlqEbCNJ1A==
X-Google-Smtp-Source: ALg8bN4E/Vq7nOco/p48AJJN8JMt6H1cx9gHRbWrdR7U9isg1NHapaQ1o6y1Kp13BGehVWg7j86gXw==
X-Received: by 2002:a1c:5dd1:: with SMTP id r200mr3487899wmb.93.1545408178072; 
 Fri, 21 Dec 2018 08:02:58 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id
 y138sm13044021wmc.16.2018.12.21.08.02.55
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 21 Dec 2018 08:02:57 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Subject: [PATCH v2 5/5] clk: meson: axg-ao: add 32k generation subtree
Date: Fri, 21 Dec 2018 17:02:39 +0100
Message-Id: <20181221160239.26265-6-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181221160239.26265-1-jbrunet@baylibre.com>
References: <20181221160239.26265-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181221_080310_002969_A2760FF2 
X-CRM114-Status: GOOD (  12.20  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the clock subtree generating the 32k clock in amlogic axg ao block.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/axg-aoclk.c | 175 +++++++++++++++++++++++++++++++---
 drivers/clk/meson/axg-aoclk.h |  13 +--
 2 files changed, 163 insertions(+), 25 deletions(-)

diff --git a/drivers/clk/meson/axg-aoclk.c b/drivers/clk/meson/axg-aoclk.c
index 29e088542387..5f518be144ce 100644
--- a/drivers/clk/meson/axg-aoclk.c
+++ b/drivers/clk/meson/axg-aoclk.c
@@ -12,10 +12,23 @@
 #include <linux/platform_device.h>
 #include <linux/reset-controller.h>
 #include <linux/mfd/syscon.h>
-#include "clk-regmap.h"
+#include "clkc.h"
 #include "meson-aoclk.h"
 #include "axg-aoclk.h"
 
+/*
+ * AO Configuration Clock registers offsets
+ * Register offsets from the data sheet must be multiplied by 4.
+ */
+#define AO_RTI_PWR_CNTL_REG1	0x0C
+#define AO_RTI_PWR_CNTL_REG0	0x10
+#define AO_RTI_GEN_CNTL_REG0	0x40
+#define AO_OSCIN_CNTL		0x58
+#define AO_CRT_CLK_CNTL1	0x68
+#define AO_SAR_CLK		0x90
+#define AO_RTC_ALT_CLK_CNTL0	0x94
+#define AO_RTC_ALT_CLK_CNTL1	0x98
+
 #define AXG_AO_GATE(_name, _bit)					\
 static struct clk_regmap axg_aoclk_##_name = {				\
 	.data = &(struct clk_regmap_gate_data) {			\
@@ -39,17 +52,141 @@ AXG_AO_GATE(uart2, 5);
 AXG_AO_GATE(ir_blaster, 6);
 AXG_AO_GATE(saradc, 7);
 
+static struct clk_regmap axg_aoclk_cts_oscin = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = AO_RTI_PWR_CNTL_REG0,
+		.bit_idx = 14,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "cts_oscin",
+		.ops = &clk_regmap_gate_ro_ops,
+		.parent_names = (const char *[]){ "xtal" },
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap axg_aoclk_32k_pre = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = AO_RTC_ALT_CLK_CNTL0,
+		.bit_idx = 31,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "axg_ao_32k_pre",
+		.ops = &clk_regmap_gate_ops,
+		.parent_names = (const char *[]){ "cts_oscin" },
+		.num_parents = 1,
+	},
+};
+
+static const struct meson_clk_dualdiv_param axg_32k_div_table[] = {
+	{
+		.dual	= 1,
+		.n1	= 733,
+		.m1	= 8,
+		.n2	= 732,
+		.m2	= 11,
+	}, {}
+};
+
+static struct clk_regmap axg_aoclk_32k_div = {
+	.data = &(struct meson_clk_dualdiv_data){
+		.n1 = {
+			.reg_off = AO_RTC_ALT_CLK_CNTL0,
+			.shift   = 0,
+			.width   = 12,
+		},
+		.n2 = {
+			.reg_off = AO_RTC_ALT_CLK_CNTL0,
+			.shift   = 12,
+			.width   = 12,
+		},
+		.m1 = {
+			.reg_off = AO_RTC_ALT_CLK_CNTL1,
+			.shift   = 0,
+			.width   = 12,
+		},
+		.m2 = {
+			.reg_off = AO_RTC_ALT_CLK_CNTL1,
+			.shift   = 12,
+			.width   = 12,
+		},
+		.dual = {
+			.reg_off = AO_RTC_ALT_CLK_CNTL0,
+			.shift   = 28,
+			.width   = 1,
+		},
+		.table = axg_32k_div_table,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "axg_ao_32k_div",
+		.ops = &meson_clk_dualdiv_ops,
+		.parent_names = (const char *[]){ "axg_ao_32k_pre" },
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap axg_aoclk_32k_sel = {
+	.data = &(struct clk_regmap_mux_data) {
+		.offset = AO_RTC_ALT_CLK_CNTL1,
+		.mask = 0x1,
+		.shift = 24,
+		.flags = CLK_MUX_ROUND_CLOSEST,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "axg_ao_32k_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_names = (const char *[]){ "axg_ao_32k_div",
+						  "axg_ao_32k_pre" },
+		.num_parents = 2,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap axg_aoclk_32k = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = AO_RTC_ALT_CLK_CNTL0,
+		.bit_idx = 30,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "axg_ao_32k",
+		.ops = &clk_regmap_gate_ops,
+		.parent_names = (const char *[]){ "axg_ao_32k_sel" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap axg_aoclk_cts_rtc_oscin = {
+	.data = &(struct clk_regmap_mux_data) {
+		.offset = AO_RTI_PWR_CNTL_REG0,
+		.mask = 0x1,
+		.shift = 10,
+		.flags = CLK_MUX_ROUND_CLOSEST,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "axg_ao_cts_rtc_oscin",
+		.ops = &clk_regmap_mux_ops,
+		.parent_names = (const char *[]){ "axg_ao_32k",
+						  "axg_ext_32k" },
+		.num_parents = 2,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
 static struct clk_regmap axg_aoclk_clk81 = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = AO_RTI_PWR_CNTL_REG0,
 		.mask = 0x1,
 		.shift = 8,
+		.flags = CLK_MUX_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "axg_ao_clk81",
 		.ops = &clk_regmap_mux_ro_ops,
-		.parent_names = (const char *[]){ "clk81", "ao_alt_xtal"},
+		.parent_names = (const char *[]){ "clk81",
+						  "axg_ao_cts_rtc_oscin"},
 		.num_parents = 2,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -106,17 +243,23 @@ static const unsigned int axg_aoclk_reset[] = {
 };
 
 static struct clk_regmap *axg_aoclk_regmap[] = {
-	[CLKID_AO_REMOTE]	= &axg_aoclk_remote,
-	[CLKID_AO_I2C_MASTER]	= &axg_aoclk_i2c_master,
-	[CLKID_AO_I2C_SLAVE]	= &axg_aoclk_i2c_slave,
-	[CLKID_AO_UART1]	= &axg_aoclk_uart1,
-	[CLKID_AO_UART2]	= &axg_aoclk_uart2,
-	[CLKID_AO_IR_BLASTER]	= &axg_aoclk_ir_blaster,
-	[CLKID_AO_SAR_ADC]	= &axg_aoclk_saradc,
-	[CLKID_AO_CLK81]	= &axg_aoclk_clk81,
-	[CLKID_AO_SAR_ADC_SEL]	= &axg_aoclk_saradc_mux,
-	[CLKID_AO_SAR_ADC_DIV]	= &axg_aoclk_saradc_div,
-	[CLKID_AO_SAR_ADC_CLK]	= &axg_aoclk_saradc_gate,
+	&axg_aoclk_remote,
+	&axg_aoclk_i2c_master,
+	&axg_aoclk_i2c_slave,
+	&axg_aoclk_uart1,
+	&axg_aoclk_uart2,
+	&axg_aoclk_ir_blaster,
+	&axg_aoclk_saradc,
+	&axg_aoclk_cts_oscin,
+	&axg_aoclk_32k_pre,
+	&axg_aoclk_32k_div,
+	&axg_aoclk_32k_sel,
+	&axg_aoclk_32k,
+	&axg_aoclk_cts_rtc_oscin,
+	&axg_aoclk_clk81,
+	&axg_aoclk_saradc_mux,
+	&axg_aoclk_saradc_div,
+	&axg_aoclk_saradc_gate,
 };
 
 static const struct clk_hw_onecell_data axg_aoclk_onecell_data = {
@@ -132,6 +275,12 @@ static const struct clk_hw_onecell_data axg_aoclk_onecell_data = {
 		[CLKID_AO_SAR_ADC_SEL]	= &axg_aoclk_saradc_mux.hw,
 		[CLKID_AO_SAR_ADC_DIV]	= &axg_aoclk_saradc_div.hw,
 		[CLKID_AO_SAR_ADC_CLK]	= &axg_aoclk_saradc_gate.hw,
+		[CLKID_AO_CTS_OSCIN]	= &axg_aoclk_cts_oscin.hw,
+		[CLKID_AO_32K_PRE]	= &axg_aoclk_32k_pre.hw,
+		[CLKID_AO_32K_DIV]	= &axg_aoclk_32k_div.hw,
+		[CLKID_AO_32K_SEL]	= &axg_aoclk_32k_sel.hw,
+		[CLKID_AO_32K]		= &axg_aoclk_32k.hw,
+		[CLKID_AO_CTS_RTC_OSCIN] = &axg_aoclk_cts_rtc_oscin.hw,
 	},
 	.num = NR_CLKS,
 };
diff --git a/drivers/clk/meson/axg-aoclk.h b/drivers/clk/meson/axg-aoclk.h
index 91384d8dd844..3cc27e85170f 100644
--- a/drivers/clk/meson/axg-aoclk.h
+++ b/drivers/clk/meson/axg-aoclk.h
@@ -10,18 +10,7 @@
 #ifndef __AXG_AOCLKC_H
 #define __AXG_AOCLKC_H
 
-#define NR_CLKS	11
-/* AO Configuration Clock registers offsets
- * Register offsets from the data sheet must be multiplied by 4.
- */
-#define AO_RTI_PWR_CNTL_REG1	0x0C
-#define AO_RTI_PWR_CNTL_REG0	0x10
-#define AO_RTI_GEN_CNTL_REG0	0x40
-#define AO_OSCIN_CNTL		0x58
-#define AO_CRT_CLK_CNTL1	0x68
-#define AO_SAR_CLK		0x90
-#define AO_RTC_ALT_CLK_CNTL0	0x94
-#define AO_RTC_ALT_CLK_CNTL1	0x98
+#define NR_CLKS	17
 
 #include <dt-bindings/clock/axg-aoclkc.h>
 #include <dt-bindings/reset/axg-aoclkc.h>
-- 
2.19.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
