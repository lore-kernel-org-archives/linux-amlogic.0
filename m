Return-Path: <SRS0=woOx=QK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C144C282DA
	for <linux-amlogic@archiver.kernel.org>; Sun,  3 Feb 2019 11:54:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D290721773
	for <linux-amlogic@archiver.kernel.org>; Sun,  3 Feb 2019 11:54:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZmPLQ7c0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JecWKPO/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D290721773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7PCKEpdv53leBILD9vQsh/9GDeNpz4jShDyccGKGhek=; b=ZmPLQ7c05zuGnbSla2QoYl08xa
	3P0z58kavefyc4rh9s5tzaphHcl8ayq/oAhMWoQQYaKlk4hhR2/aRCUBhxXkwkN+iB2+ZQAVSGx+b
	nkSKG7HaE+UW+69vbB2kQFvgp67XJfNDLw6qusx8t3lmYfa2NfirMfrMCa/5WrMN2FnBT4/gzVhD0
	zWM9kwGW7ErLQvwk6H8hJAzPS0Akj9MKv22baM8FSDhAW5MP5lkwn4M3LEOE5LGjaEEatH+n/uqKT
	t2rddowoAKNTemMN7fKtHDNvm5it0nSMSAeDwjeWvM4/4ifx4aQ1zL1KZq99Il1teMmcSivFnYJNw
	6LbTbCjQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqGMK-00007S-Ro; Sun, 03 Feb 2019 11:54:48 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqGMG-000875-2P
 for linux-amlogic@lists.infradead.org; Sun, 03 Feb 2019 11:54:47 +0000
Received: by mail-wm1-x342.google.com with SMTP id r24so7944962wmh.0
 for <linux-amlogic@lists.infradead.org>; Sun, 03 Feb 2019 03:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=DeqhVdtaD0WNb5slV+JdqraC8aBA1NVBU0MN2j+wwj8=;
 b=JecWKPO/FbpCts7+YzhR96yJGuxXAoSovWgBMUX3A1tkmts4Ek7aBk8ya8DPV32sQe
 aJpsQaFcUt9lAU+Jf6XhjpEoW3KHlB/zjHFa7Ydp8hzVt6uzTIugAW7j20dBexO1Y/NL
 ZA+xRjjhgloGU0vVJy53r4gGMYUgtcBLKun6arh/JLKjTdMMBuXpJIKiaC1tDreDxlQf
 KFBwZYy5iEAxjZmUuO2zixJB3ksXZP8xkiynUk0OYuX+TfXKzm7dMZyfJhupypqUaKxI
 89uhkjBkKUZ5vvwAalRbmSigKH6kVPLosHnxPVI+dbG0HYM+DnQP3994gptLn8ZsWG99
 ePsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=DeqhVdtaD0WNb5slV+JdqraC8aBA1NVBU0MN2j+wwj8=;
 b=ptnLjUyK2NqL+L9nHYHqHWm7FFZ1Dfx3XIc4XAXu1755ndgB9ypgBmeioSFxxbrOd5
 mFL88boqAzOBpBg97onJQxbPaW3QpXAwOeq8KesFnWkibnrEedwVipYxg8VvP3O9qhps
 h64OsbcgbLYR2p17CfNSqmhXJgjfkatcHJu/FIHa0Y2Kp+roV+5G1cyZQ/75eLPDWHzj
 9uVvuP+7D3XFYY6vAvp8TprAtb0H+nv4TfmFz7+zLxo6LVSPTQLcs5qk9v93lI2BZhM+
 CeapvfzbAmQ/FLauN24O5frKbxWd2Nh2hKSrcZ1FD/P189hJPrlryO8vHaeC+8CtGXVh
 /euw==
X-Gm-Message-State: AHQUAubvQ8NzQUolxCNXYiARWg0DNPo2bF5FBcJpwRlgmeZvb317CtDQ
 TL3pGBkmZoObdYGjhLHQehoKVYhJ
X-Google-Smtp-Source: AHgI3IbOsnJfGG+3+4T7lOkzYAyN9ZuagJyEEV8hdU/kFrAvBUVZf6KNERnv5+vv/wOzig3iYKCzpw==
X-Received: by 2002:a7b:c1d3:: with SMTP id a19mr1509920wmj.41.1549194882023; 
 Sun, 03 Feb 2019 03:54:42 -0800 (PST)
Received: from afl1.intra.ditec.sk (adsl-dyn125.78-98-60.t-com.sk.
 [78.98.60.125])
 by smtp.googlemail.com with ESMTPSA id w10sm18475905wmb.1.2019.02.03.03.54.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 03 Feb 2019 03:54:41 -0800 (PST)
From: afl1 <afl2001@gmail.com>
To: linux-amlogic@lists.infradead.org
Subject: [PATCH] pinctrl: add tsin pins for meson-gxbb/gxl/gxm
Date: Sun,  3 Feb 2019 12:53:24 +0100
Message-Id: <20190203115324.9097-2-afl2001@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190203115324.9097-1-afl2001@gmail.com>
References: <20190203115324.9097-1-afl2001@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190203_035444_364394_06FE88C4 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
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
Cc: afl1 <afl2001@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

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
