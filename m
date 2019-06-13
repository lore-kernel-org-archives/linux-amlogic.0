Return-Path: <SRS0=0Q1W=UM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78C11C31E45
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jun 2019 17:51:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A7CC20679
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jun 2019 17:51:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bUbme7zP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uwgls6Cl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A7CC20679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=7PCKEpdv53leBILD9vQsh/9GDeNpz4jShDyccGKGhek=; b=bUb
	me7zP8Kz2pKVwuLsJG9ToXoBFWyYdI5Hos+6nKgU5L2cjDWn8YIEdzx/M3D5GMUn4vVDRIuTA2HL/
	apFBNqClwKfRoBKG+LvX+C9BOlp2JzEBCEUFiTe18W0QC1ifKA1CEajyIGp/e351UBDKnaas+lpZO
	Xj6Do8YfvmX2UzrgdVyqHcnilUBIJf1Y+zGooP9XcofHv0XDL8qj4T8vSfO0rvWJRdiw4lkUIf2IP
	yCaQ4L98MGVEbjrMkNqXz5POWzSj3NsQjDp3tOHBm5fnx5fQpm92nKtQt5CNttskm80o/vzUTtrcs
	r86wqkBU/sI7kQXd2OIOryAkczM1/zQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hbTsx-0006oT-Ob; Thu, 13 Jun 2019 17:51:39 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbTsu-0006o1-Vd
 for linux-amlogic@lists.infradead.org; Thu, 13 Jun 2019 17:51:38 +0000
Received: by mail-wr1-x443.google.com with SMTP id f9so21687128wre.12
 for <linux-amlogic@lists.infradead.org>; Thu, 13 Jun 2019 10:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=DeqhVdtaD0WNb5slV+JdqraC8aBA1NVBU0MN2j+wwj8=;
 b=Uwgls6ClETKeyHdarKOkr/OtGmlw9GlfSYRj8DBTWdsBQHiLwMN8myknO9Mv3MYvFa
 hLXJiXQg+nY8b9irm3T/lmHDoKN6khQ0U9vXMP9S2bsHLT4kGJHBm6UT03GEmUQLWMDb
 E+n7Wxv1CgNwEieLw8yOifX79Mdsw8XLW/pgakuFSauzdV6pbfouY+OKg2BX1mvsFoJQ
 ABFeQ3yo2TKYlE/JKebQIFjwK3G7qhbfPt8BSj+f3Tx9pQIKqr6v9UCynYTWey9L87fv
 kN8qFbP8D6aYIOwdOEOJkJWEKK0SuE9hIEr9MTnDltoDkNbs6Lngo6xBu44xetF49a0Q
 7Xcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=DeqhVdtaD0WNb5slV+JdqraC8aBA1NVBU0MN2j+wwj8=;
 b=Ytlkfg60IAUz+8rnhwUhbwZuay6R7sYMeEuf3r9nDcbiJJ98ulvrAviJwHjY80sb4P
 yn4kWW5RIUC7wanu4jbxxUNS6zKZYd0e3+/6GhZp25wGIjMDDsEb+OxuFvlroJg07XfB
 Nb9AQmNRaZd8RHr68ABOP+iD0HmRqZgT4KaVrgryVVH4x2iwdVFnZFGmwKj8aLgMHFtf
 Hy5fmRVtOzrMgXHq53qnM1+1QxzVHGDKs7m/GwVcj6u8norehvj5SrZXBGeNpMRaz/RU
 A5YnuCioVf1HIbw6Y8ksGX5kVHGd7et6ZnHdp4Wi6Y+1uDHRYuv2DAxAaIu1WaXjH3bL
 BFIg==
X-Gm-Message-State: APjAAAXftijZ4FyxJIXqaD3jMwlNGYXJU1LZ5Pwhsj1e8gs8Nc2X0Eyu
 zVIft5n89SH7/L+C0+hW5SelKXeH
X-Google-Smtp-Source: APXvYqzyEfWv2Ellfja5E/NaZN8qvSLPZLtwcCK4PtNF7o4vMXcFlU3t1riQG/sTS2LNQ7AZ1KseOQ==
X-Received: by 2002:a5d:4603:: with SMTP id t3mr12453800wrq.315.1560448294759; 
 Thu, 13 Jun 2019 10:51:34 -0700 (PDT)
Received: from afl1.intra.ditec.sk (adsl-dyn95.78-98-50.t-com.sk.
 [78.98.50.95])
 by smtp.googlemail.com with ESMTPSA id d17sm635566wrx.9.2019.06.13.10.51.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 10:51:33 -0700 (PDT)
From: afl1 <afl2001@gmail.com>
To: linux-amlogic@lists.infradead.org
Subject: [PATCH] pinctrl: add tsin pins for meson-gxbb/gxl/gxm
Date: Thu, 13 Jun 2019 19:50:47 +0200
Message-Id: <20190613175047.18176-1-afl2001@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190613_105137_018573_1E3DA130 
X-CRM114-Status: UNSURE (   8.50  )
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
