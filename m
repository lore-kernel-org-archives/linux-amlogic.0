Return-Path: <SRS0=0Q1W=UM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0211C31E45
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jun 2019 18:39:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 757D2208CA
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jun 2019 18:39:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Koq11aYf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qZn42OQ9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 757D2208CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=wVgzT3UeFguxFkIkqWJ8TiRAR+g8NghcgaDhcbg+StI=; b=Koq
	11aYfw+0CM2zLSrgIbkhdXOPvhNd0toJVRtwVlVGkNQurDdO1ruSC8uGNcIDmmbivlAnSfRhqG32N
	OQSdByqpWxtitcUqTGmKHIMht3LfmyUzIyVFeI4wtx9CgmNr3w2kpyp1zMmMPaFa22iJWqwZCjD15
	m72QW3Xv/XiNETI6PlVCnW8Q2T7jKXvhT5to28UnpDqYcsd6uDR9XmY3J9b/eRXaWWC0lfDi8oNaX
	67XlkM1MRMEf8eiUj6hxYxjAHaE+Uu5iHXjODes1FmxNZT0Wv5PARW3gMnsjAfWeIF0/GCpwANh5T
	cUNhrWbTIfcCI+Q1G12BOsnHpRFQLeQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hbUch-0008Ik-4Z; Thu, 13 Jun 2019 18:38:55 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbUce-0008I5-4d
 for linux-amlogic@lists.infradead.org; Thu, 13 Jun 2019 18:38:53 +0000
Received: by mail-wr1-x444.google.com with SMTP id k11so3682104wrl.1
 for <linux-amlogic@lists.infradead.org>; Thu, 13 Jun 2019 11:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=JKC0zeiPIS9RVO3mHrVjw2mOEOMCNjKxnjL4SH5EdWA=;
 b=qZn42OQ9BraT0hjYKQDmG0CH1B7K3lXtwedodHcnvKW/qCafQKFJ4SUoMetoX3BgDS
 A9jUdxpjEIMYk0JFczCC1i1dPkUAEfdO/c3k6YZp3xbvY7ZGG0LsFIemwO/RzerLaL+U
 pgSw0VrBsFiegYLLGz2n0lwESxu1GoC+AzIkz7k5BPx8dvk7iEcZJY+bjTR0IlJgRRmJ
 9vKBxaXI7gr71trGDk1IvxLk7lqANepYMfyXI8io6UBnEhUDFdAlIrErzHMDkqp6vk91
 bCSB/ALREBjgQa8eMIAfAKSK/PJvv2Wz3fQxSg2ehEjGk8CBNP8dbVKrVRCCwpQsrm44
 ld3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=JKC0zeiPIS9RVO3mHrVjw2mOEOMCNjKxnjL4SH5EdWA=;
 b=pCRYFAZl3yiB5yXSCzDIkBVPmAs815PSd6nkoQBV61EbFS4RQ1IUABGmfqxZxTRiI0
 fibG4mblUfWooJZYqF7bkv0bW5Sek4tdAICAk7sOYzG3/JbcVtdHjrp1dgbLosiNZWvZ
 /jxvs2NKm6FnrVXTz5WcPnDClHgMDDLKZglEdfmygVLgzFycgO2LefF2wT5cnCFjUZtI
 3HgLV5hfKePtAhduQOv5gEvUALHUbk2ct/zjbo+19m26qdTSIXg5Uc2bEHtmelRjpFOf
 kgRfp82JITEh6sSZXMuhZEO9w4O3BYTKl2jMbHiNYUvQT296hTJN0NMKG8s4H90cov+C
 unvA==
X-Gm-Message-State: APjAAAWZyp9MlRehh7Yeiec76dT8Q2RlagmPX1JT3FC658+CjEUb/TFd
 mmyiv7BbmgbZLcivKHN0LH0gkwG9
X-Google-Smtp-Source: APXvYqwEpgapMM2AoD2HPUK9ljc65YOn+QxQvrVQllmOMrNChIXMtWLTgXg9tMeCzaJaaHUph5BRww==
X-Received: by 2002:adf:fe4e:: with SMTP id m14mr11537895wrs.21.1560451130307; 
 Thu, 13 Jun 2019 11:38:50 -0700 (PDT)
Received: from afl1.intra.ditec.sk (adsl-dyn95.78-98-50.t-com.sk.
 [78.98.50.95])
 by smtp.googlemail.com with ESMTPSA id s7sm6650738wmc.2.2019.06.13.11.38.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 11:38:49 -0700 (PDT)
From: afl1 <afl2001@gmail.com>
To: linux-amlogic@lists.infradead.org
Subject: [PATCH] pinctrl: add tsin pins for meson-gxbb/gxl/gxm
Date: Thu, 13 Jun 2019 20:38:46 +0200
Message-Id: <20190613183846.18679-1-afl2001@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190613_113852_186077_75E62D3B 
X-CRM114-Status: UNSURE (   9.00  )
X-CRM114-Notice: Please train this message.
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
Cc: afl1 <afl2001@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Sorry for previous two emails. I hoppe this will be correctly formatted.
This patch adds missing  pins for tsin in meson-gxbb/gxl/gxm  platform.

Author: afl1 <afl2001@gmail.com>
Date:   Sun Feb 3 11:30:17 2019 +0100

    pinctrl: add tsin pins for meson-gxbb/gxl/gxm

---
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c | 31 ++++++++++++++++++++++
 drivers/pinctrl/meson/pinctrl-meson-gxl.c  | 13 +++++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
index 4edeb4cae72a..6de3d58277a1 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
@@ -237,10 +237,21 @@ static const unsigned int hdmi_hpd_pins[]	= { GPIOH_0 };
 static const unsigned int hdmi_sda_pins[]	= { GPIOH_1 };
 static const unsigned int hdmi_scl_pins[]	= { GPIOH_2 };
 
+static const unsigned int tsin_a_d_valid_pins[] = { GPIOY_0 };
+static const unsigned int tsin_a_sop_pins[] 	= { GPIOY_1 };
+static const unsigned int tsin_a_clk_pins[] 	= { GPIOY_2 };
+static const unsigned int tsin_a_d0_pins[] 	= { GPIOY_3 };
+static const unsigned int tsin_a_dp_pins[] 	= { GPIOY_4, GPIOY_5, GPIOY_6, GPIOY_7, GPIOY_8, GPIOY_9, GPIOY_10 };
+static const unsigned int tsin_a_fail_pins[]	= { GPIOY_11 };
 static const unsigned int i2s_out_ch23_y_pins[]	= { GPIOY_8 };
 static const unsigned int i2s_out_ch45_y_pins[]	= { GPIOY_9 };
 static const unsigned int i2s_out_ch67_y_pins[]	= { GPIOY_10 };
 
+static const unsigned int tsin_b_d_valid_pins[] = { GPIOX_6 };
+static const unsigned int tsin_b_sop_pins[] 	= { GPIOX_7 };
+static const unsigned int tsin_b_clk_pins[] 	= { GPIOX_8 };
+static const unsigned int tsin_b_d0_pins[] 	= { GPIOX_9 };
+
 static const unsigned int spdif_out_y_pins[]	= { GPIOY_12 };
 
 static const unsigned int gen_clk_out_pins[]	= { GPIOY_15 };
@@ -443,8 +454,18 @@ static struct meson_pmx_group meson_gxbb_periphs_groups[] = {
 	GROUP(pwm_a_x,		3,	17),
 	GROUP(pwm_e,		2,	30),
 	GROUP(pwm_f_x,		3,	18),
+	GROUP(tsin_b_d_valid, 	3, 	9),
+	GROUP(tsin_b_sop, 	3, 	8),
+	GROUP(tsin_b_clk, 	3, 	10),
+	GROUP(tsin_b_d0,	3, 	7),
 
 	/* Bank Y */
+	GROUP(tsin_a_fail, 	3, 	3),
+	GROUP(tsin_a_d_valid, 	3, 	2),
+	GROUP(tsin_a_sop, 	3, 	1),
+	GROUP(tsin_a_clk, 	3, 	0),
+	GROUP(tsin_a_d0, 	3, 	4),
+	GROUP(tsin_a_dp, 	3, 	5),
 	GROUP(uart_cts_c,	1,	19),
 	GROUP(uart_rts_c,	1,	18),
 	GROUP(uart_tx_c,	1,	17),
@@ -607,6 +628,14 @@ static const char * const gpio_periphs_groups[] = {
 	"GPIOX_20", "GPIOX_21", "GPIOX_22",
 };
 
+static const char * const tsin_a_groups[] = {
+	"tsin_a_clk", "tsin_a_sop", "tsin_a_d_valid", "tsin_a_d0",
+	"tsin_a_dp", "tsin_a_fail",
+};
+static const char * const tsin_b_groups[] = {
+	"tsin_b_clk", "tsin_b_sop", "tsin_b_d_valid", "tsin_b_d0",
+};
+
 static const char * const emmc_groups[] = {
 	"emmc_nand_d07", "emmc_clk", "emmc_cmd", "emmc_ds",
 };
@@ -798,6 +827,8 @@ static struct meson_pmx_func meson_gxbb_periphs_functions[] = {
 	FUNCTION(i2s_out),
 	FUNCTION(spdif_out),
 	FUNCTION(gen_clk_out),
+	FUNCTION(tsin_a),
+	FUNCTION(tsin_b),
 };
 
 static struct meson_pmx_func meson_gxbb_aobus_functions[] = {
diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxl.c b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
index 0c0a5018102b..c14090a56b61 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxl.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
@@ -246,6 +246,10 @@ static const unsigned int tsin_a_fail_pins[]	= { GPIODV_11 };
 static const unsigned int tsin_a_dp_pins[] = {
 	GPIODV_1, GPIODV_2, GPIODV_3, GPIODV_4, GPIODV_5, GPIODV_6, GPIODV_7,
 };
+static const unsigned int tsin_b_clk_pins[]	= { GPIOH_6 };
+static const unsigned int tsin_b_d0_pins[]	= { GPIOH_7 };
+static const unsigned int tsin_b_sop_pins[]	= { GPIOH_8 };
+static const unsigned int tsin_b_d_valid_pins[] = { GPIOH_9 };
 
 static const struct pinctrl_pin_desc meson_gxl_aobus_pins[] = {
 	MESON_PIN(GPIOAO_0),
@@ -460,6 +464,10 @@ static struct meson_pmx_group meson_gxl_periphs_groups[] = {
 	GROUP(i2s_out_lr_clk,	6,	24),
 	GROUP(i2s_out_ch01,	6,	23),
 	GROUP(spdif_out_h,	6,	28),
+	GROUP(tsin_b_d0,	6,	17),
+	GROUP(tsin_b_sop,	6,	18),
+	GROUP(tsin_b_d_valid,	6,	19),
+	GROUP(tsin_b_clk,	6,	20),
 
 	/* Bank DV */
 	GROUP(uart_tx_b,	2,	16),
@@ -694,6 +702,10 @@ static const char * const tsin_a_groups[] = {
 	"tsin_a_d_valid", "tsin_a_d0",
 	"tsin_a_dp", "tsin_a_fail",
 };
+static const char * const tsin_b_groups[] = {
+	"tsin_b_clk", "tsin_b_sop",
+	"tsin_b_d_valid", "tsin_b_d0",
+};
 
 static const char * const gpio_aobus_groups[] = {
 	"GPIOAO_0", "GPIOAO_1", "GPIOAO_2", "GPIOAO_3", "GPIOAO_4",
@@ -770,6 +782,7 @@ static struct meson_pmx_func meson_gxl_periphs_functions[] = {
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
