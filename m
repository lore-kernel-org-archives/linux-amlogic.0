Return-Path: <SRS0=3Avb=UO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F201EC31E50
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Jun 2019 19:15:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B554A21852
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Jun 2019 19:15:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tyUdoYpm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DdwXdVno"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B554A21852
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=69qgswyYMhI4O2EIyqJgOQT1Qi0TT2HKesti9TvV+BU=; b=tyUdoYpmatoRRmyokwIi9FFEZZ
	yebHX68Bueh7weZ+Ms/Gw0c2muNzV8Z6J97Ybb/qJFM3eDipuqB0m+12ybur76EEJmtJW6ehY6sHi
	b8xpdY8jDsqM1v29/7I8F3WF3k5ZXksJZPomtY/BLLZXj/x8vlWeAEdMDbM9Q+dDY9xq+kumUBgpF
	lcLOD9x29eoF0+bpc/CmKc4EZwIZeWm9h2AP2fJ5dHurCGM1aCDL9CwRXGI8MiTrzpyTZeouR1UO5
	CIrlZE8lVaYT2OkORazvxwKnZMk97PLpSOK0F3/hLVHB9i4ubytgZxocJ78gWgfL7z7oG4rF8BHv2
	YkeRSumA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hcE8i-0002nd-VH; Sat, 15 Jun 2019 19:15:01 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hcE8g-0002mh-7e
 for linux-amlogic@lists.infradead.org; Sat, 15 Jun 2019 19:14:59 +0000
Received: by mail-wr1-x444.google.com with SMTP id p11so5807910wre.7
 for <linux-amlogic@lists.infradead.org>; Sat, 15 Jun 2019 12:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=kWIQ9hQVZ066bmXL3XHq6TPG8ePXRtFW8JS8y5mSKOo=;
 b=DdwXdVnolm9Q74qbqAzNu6R5UP4mbfU5fF+NQS84xe8KYnpEKyGqu7l/Dijxe5xXbF
 2aLRlycVGabzDz6Y1KDzxCzdZ5YU1Q97qceGr9Ol466g6UFGUUAoJW9uo1mEpMXu2WFu
 p55T0MZr+EEcnoIhVO1WEOp9KzkAWUkOMP3Dj6gIhfgb/5grZ2SRDI/B30qA7y7GkOuL
 NQxitrAU5jfdiVoHbs2VRnxrV2dr4PKlbcjXq7Dy6BF8J5AwXOccsHwNFXNTf95RKSS/
 v7zuAgtVftOgUKmtyeCZNhpe9ShRSeRbe6JS9Iyd6w/BfUdhNfk9fMcSzd7OEvallFCR
 YHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=kWIQ9hQVZ066bmXL3XHq6TPG8ePXRtFW8JS8y5mSKOo=;
 b=NtWQFBtzAgOwG+/AAv5MVpHvxh/wiKCJN5mzqXkxkc4rM/lG063RjLCwcpDQy2Adfl
 qXA/7g3lN3RTa0rj2EPeflb1wSSx3SqWW+UfAmG8PqfCq6M0HDpT85MWtQLg48n45rMe
 +uvS5iBbdIraVZPrb+2Z/ux7LTwc3/4iYVO0pFpP87AYvPS23TyFsWFaAcPokmCvJpHl
 JVKE4AIQcrmt0eRhYL6GzLf02b06WItfoF9wjtIcKE+aO0ZArJQFGLXB5+I4rbrIw4At
 TOsClpuve8fp1gZd2ayUrXPdw2Se1PV+Kuz4iAaJHncTtzjJs9Qq52j8er2VCAzIf4pF
 zUMg==
X-Gm-Message-State: APjAAAXodB8yvU209vwi+WEoT+f6TgOniTEB31tPWWh/Wr6OlDlRcylP
 3fYNn9xgVH2P6JCTZtu8y/9Z2TRo
X-Google-Smtp-Source: APXvYqy6jJlUNxO8aAYMtwK7VcSzvregvcD/wX+FX4vI7J9uhNmkzDW6H65It42f8znnn2Wd9ffXYA==
X-Received: by 2002:a5d:56d0:: with SMTP id m16mr16732505wrw.276.1560626094683; 
 Sat, 15 Jun 2019 12:14:54 -0700 (PDT)
Received: from afl1.intra.ditec.sk (adsl-dyn95.78-98-50.t-com.sk.
 [78.98.50.95])
 by smtp.googlemail.com with ESMTPSA id d3sm17339945wrf.87.2019.06.15.12.14.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 15 Jun 2019 12:14:54 -0700 (PDT)
From: afl1 <afl2001@gmail.com>
To: linux-amlogic@lists.infradead.org
Subject: [PATCH] pinctrl: meson: add missing tsin pinctrl for meson gxbb/gxl
Date: Sat, 15 Jun 2019 21:14:49 +0200
Message-Id: <20190615191449.3131-1-afl2001@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190615075902.32341-1-afl2001@gmail.com>
References: <20190615075902.32341-1-afl2001@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190615_121458_282737_26D1EAA0 
X-CRM114-Status: GOOD (  10.60  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Igor Vavro <afl2001@yahoo.com>, Igor Vavro <afl2001@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Igor Vavro <afl2001@yahoo.com>

This patch adds missing tsin pinctrl definitions
for meson gxbb and gxl/gxm.

Signed-off-by: Igor Vavro <afl2001@gmail.com>
---
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c | 35 ++++++++++++++++++++++
 drivers/pinctrl/meson/pinctrl-meson-gxl.c  | 27 +++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
index 4edeb4cae72a..63a25b5bc4c0 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
@@ -237,10 +237,24 @@ static const unsigned int hdmi_hpd_pins[]	= { GPIOH_0 };
 static const unsigned int hdmi_sda_pins[]	= { GPIOH_1 };
 static const unsigned int hdmi_scl_pins[]	= { GPIOH_2 };
 
+static const unsigned int tsin_a_d_valid_pins[] = { GPIOY_0 };
+static const unsigned int tsin_a_sop_pins[]	= { GPIOY_1 };
+static const unsigned int tsin_a_clk_pins[]	= { GPIOY_2 };
+static const unsigned int tsin_a_d0_pins[]	= { GPIOY_3 };
+static const unsigned int tsin_a_dp_pins[]	= {
+	GPIOY_4, GPIOY_5, GPIOY_6, GPIOY_7, GPIOY_8, GPIOY_9, GPIOY_10
+};
+
+static const unsigned int tsin_a_fail_pins[]	= { GPIOY_11 };
 static const unsigned int i2s_out_ch23_y_pins[]	= { GPIOY_8 };
 static const unsigned int i2s_out_ch45_y_pins[]	= { GPIOY_9 };
 static const unsigned int i2s_out_ch67_y_pins[]	= { GPIOY_10 };
 
+static const unsigned int tsin_b_d_valid_pins[] = { GPIOX_6 };
+static const unsigned int tsin_b_sop_pins[]	= { GPIOX_7 };
+static const unsigned int tsin_b_clk_pins[]	= { GPIOX_8 };
+static const unsigned int tsin_b_d0_pins[]	= { GPIOX_9 };
+
 static const unsigned int spdif_out_y_pins[]	= { GPIOY_12 };
 
 static const unsigned int gen_clk_out_pins[]	= { GPIOY_15 };
@@ -443,8 +457,18 @@ static struct meson_pmx_group meson_gxbb_periphs_groups[] = {
 	GROUP(pwm_a_x,		3,	17),
 	GROUP(pwm_e,		2,	30),
 	GROUP(pwm_f_x,		3,	18),
+	GROUP(tsin_b_d_valid,	3,	9),
+	GROUP(tsin_b_sop,	3,	8),
+	GROUP(tsin_b_clk,	3,	10),
+	GROUP(tsin_b_d0,	3,	7),
 
 	/* Bank Y */
+	GROUP(tsin_a_fail,	3,	3),
+	GROUP(tsin_a_d_valid,	3,	2),
+	GROUP(tsin_a_sop,	3,	1),
+	GROUP(tsin_a_clk,	3,	0),
+	GROUP(tsin_a_d0,	3,	4),
+	GROUP(tsin_a_dp,	3,	5),
 	GROUP(uart_cts_c,	1,	19),
 	GROUP(uart_rts_c,	1,	18),
 	GROUP(uart_tx_c,	1,	17),
@@ -607,6 +631,15 @@ static const char * const gpio_periphs_groups[] = {
 	"GPIOX_20", "GPIOX_21", "GPIOX_22",
 };
 
+static const char * const tsin_a_groups[] = {
+	"tsin_a_clk", "tsin_a_sop", "tsin_a_d_valid", "tsin_a_d0",
+	"tsin_a_dp", "tsin_a_fail",
+};
+
+static const char * const tsin_b_groups[] = {
+	"tsin_b_clk", "tsin_b_sop", "tsin_b_d_valid", "tsin_b_d0",
+};
+
 static const char * const emmc_groups[] = {
 	"emmc_nand_d07", "emmc_clk", "emmc_cmd", "emmc_ds",
 };
@@ -798,6 +831,8 @@ static struct meson_pmx_func meson_gxbb_periphs_functions[] = {
 	FUNCTION(i2s_out),
 	FUNCTION(spdif_out),
 	FUNCTION(gen_clk_out),
+	FUNCTION(tsin_a),
+	FUNCTION(tsin_b),
 };
 
 static struct meson_pmx_func meson_gxbb_aobus_functions[] = {
diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxl.c b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
index 0c0a5018102b..984d0e2086a5 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxl.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
@@ -247,6 +247,17 @@ static const unsigned int tsin_a_dp_pins[] = {
 	GPIODV_1, GPIODV_2, GPIODV_3, GPIODV_4, GPIODV_5, GPIODV_6, GPIODV_7,
 };
 
+static const unsigned int tsin_b_clk_pins[]	= { GPIOH_6 };
+static const unsigned int tsin_b_d0_pins[]	= { GPIOH_7 };
+static const unsigned int tsin_b_sop_pins[]	= { GPIOH_8 };
+static const unsigned int tsin_b_d_valid_pins[] = { GPIOH_9 };
+
+static const unsigned int tsin_b_fail_z4_pins[] = { GPIOZ_4 };
+static const unsigned int tsin_b_clk_z3_pins[]	= { GPIOZ_3 };
+static const unsigned int tsin_b_d0_z2_pins[]	= { GPIOZ_2 };
+static const unsigned int tsin_b_sop_z1_pins[]	= { GPIOZ_1 };
+static const unsigned int tsin_b_d_valid_z0_pins[] = { GPIOZ_0 };
+
 static const struct pinctrl_pin_desc meson_gxl_aobus_pins[] = {
 	MESON_PIN(GPIOAO_0),
 	MESON_PIN(GPIOAO_1),
@@ -444,6 +455,11 @@ static struct meson_pmx_group meson_gxl_periphs_groups[] = {
 	GROUP(eth_txd1,		4,	12),
 	GROUP(eth_txd2,		4,	11),
 	GROUP(eth_txd3,		4,	10),
+	GROUP(tsin_b_fail_z4,	3,	15),
+	GROUP(tsin_b_clk_z3,	3,	16),
+	GROUP(tsin_b_d0_z2,	3,	17),
+	GROUP(tsin_b_sop_z1,	3,	18),
+	GROUP(tsin_b_d_valid_z0, 3,	19),
 	GROUP(pwm_c,		3,	20),
 	GROUP(i2s_out_ch23_z,	3,	26),
 	GROUP(i2s_out_ch45_z,	3,	25),
@@ -460,6 +476,10 @@ static struct meson_pmx_group meson_gxl_periphs_groups[] = {
 	GROUP(i2s_out_lr_clk,	6,	24),
 	GROUP(i2s_out_ch01,	6,	23),
 	GROUP(spdif_out_h,	6,	28),
+	GROUP(tsin_b_d0,	6,	17),
+	GROUP(tsin_b_sop,	6,	18),
+	GROUP(tsin_b_d_valid,	6,	19),
+	GROUP(tsin_b_clk,	6,	20),
 
 	/* Bank DV */
 	GROUP(uart_tx_b,	2,	16),
@@ -695,6 +715,12 @@ static const char * const tsin_a_groups[] = {
 	"tsin_a_dp", "tsin_a_fail",
 };
 
+static const char * const tsin_b_groups[] = {
+	"tsin_b_clk", "tsin_b_sop", "tsin_b_d_valid", "tsin_b_d0",
+	"tsin_b_clk_z3", "tsin_b_sop_z1", "tsin_b_d_valid_z0", "tsin_b_d0_z2",
+	"tsin_b_fail_z4",
+};
+
 static const char * const gpio_aobus_groups[] = {
 	"GPIOAO_0", "GPIOAO_1", "GPIOAO_2", "GPIOAO_3", "GPIOAO_4",
 	"GPIOAO_5", "GPIOAO_6", "GPIOAO_7", "GPIOAO_8", "GPIOAO_9",
@@ -770,6 +796,7 @@ static struct meson_pmx_func meson_gxl_periphs_functions[] = {
 	FUNCTION(spdif_out),
 	FUNCTION(eth_led),
 	FUNCTION(tsin_a),
+	FUNCTION(tsin_b),
 };
 
 static struct meson_pmx_func meson_gxl_aobus_functions[] = {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
