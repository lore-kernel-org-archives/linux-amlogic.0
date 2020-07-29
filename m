Return-Path: <SRS0=TJbE=BI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5344BC433E4
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Jul 2020 15:44:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2B092083E
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Jul 2020 15:44:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VA4n20VO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="OfAx+z+3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2B092083E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O3K8ubGvg+5Xmt3IWCrXl+T3TFRgkv6y4G7plD1X1ZQ=; b=VA4n20VOZZKsa6ZBdY8rc4Far
	3US2Ypb16qkg145gljs5CZebsV8LGNiUXVk/dYgQCp5Dh2afF759IOkWiJdkcKN0kQQm9MCE9r9ka
	SFQWDW3sQ5I+GvM7whKSuRaf86HUUR0UQxe5zDXVe14bRpzcmPJo/SqjOudP7T+y0CMT+nABuuHmW
	z9e1kwI2X+iZ23y9aFIV884z/JOSqzvHY+FQQ2r2qRIz+lQJNvpjtcya+SW0zaoEJR0HsCXknR0iU
	C7ql2chsXdczZEPln9va3+JEONtXJfo/2DhW7uS3G8l2e3NTy1fX1/W69PHDQTMqWCizXCjReu0um
	fFep0j6Rw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0oFb-0002vg-50; Wed, 29 Jul 2020 15:44:15 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0oFW-0002tv-Np
 for linux-amlogic@lists.infradead.org; Wed, 29 Jul 2020 15:44:12 +0000
Received: by mail-wr1-x443.google.com with SMTP id a5so12130606wrm.6
 for <linux-amlogic@lists.infradead.org>; Wed, 29 Jul 2020 08:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yp/yuUeWaoEU++o8YiqJZ6Ow3f9kDkTqY4X3Il1fAaU=;
 b=OfAx+z+38BroiK1UxjBz316l00GKw6NR4nK+Qbixfz/rYzg3GvwXZv6zj8aIdlOGbr
 ZCw/ibRyT2LLtpcbR5a6GkNX2ahQcFzrXURYua0ZvoMaOqrtGsnSzzI5WUM/g0XP2Spt
 EqdsseD7LgqAW2oJ6RR7Udl6o+ugCwvhi70KGxGvdkZhXO96DbGyvKhOdgGid7Pdwrh8
 P+/9XJe7BBXAiUOS+2ThQ8p6suLIM1hy+1ceQULFN7x+uAFmyBpZfFPSr31WQFoi7TNh
 s8m6Sf5c83PFhiHch9IsOr21AiQUH9jZpTUA3dpf4kIfUcCHsa05QDzMvgvl/5ozHOs3
 lbkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yp/yuUeWaoEU++o8YiqJZ6Ow3f9kDkTqY4X3Il1fAaU=;
 b=RwkpKVS81vkxxcF3CefYxjsafSMbqBX5HYO5pvWgsgXOLyhf/XvgY4hoWn/7c7fOfK
 zq1mah2o/RhP+R2HyeIPz1ngqyFyTP2UReNnobRKGpY1vQ37zZu/eRNJvfKn0j+n0dMu
 fmpFSnPoTqSd0sQPauGvtgHZzrwm4n4XUMSmWeFRzzVrnjWtGY2Re0oBtxX5x8WUtdsv
 GPTvw/AsiWO5vR1JwA099vd80kJVZL1foqscM5SDjj+HVN79Uba9x5JPTwWNZiA0qB+5
 SHNcXbbBSBNHyKVYEJT0D9BHg/tQ3j5n6OkDILeLGn00O8BSxHprJJ8IRftJ2CmNtWbz
 6s0A==
X-Gm-Message-State: AOAM531NX5CYm1EVTR+W1M4Qb8RidL4H5OIHaZGxWvMJayNkpMUoGnFK
 BAnQ1lI4LyWMChlTpc3JaZAtNA==
X-Google-Smtp-Source: ABdhPJyLNVsGNKiTLhfrWHsr6RG7KXjk22Yr2Px7XacWgic1dr9bMjrMGeMcikX5l1IXnYFsXtrkow==
X-Received: by 2002:adf:bb07:: with SMTP id r7mr24475972wrg.102.1596037449509; 
 Wed, 29 Jul 2020 08:44:09 -0700 (PDT)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id a134sm6526030wmd.17.2020.07.29.08.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 08:44:08 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
	linux-clk@vger.kernel.org
Subject: [PATCH 3/3] clk: meson: axg-audio: fix g12a tdmout sclk inverter
Date: Wed, 29 Jul 2020 17:43:59 +0200
Message-Id: <20200729154359.1983085-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200729154359.1983085-1-jbrunet@baylibre.com>
References: <20200729154359.1983085-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_114410_808152_03652EFB 
X-CRM114-Status: GOOD (  14.19  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Fix the tdmout inverter of the g12a and following SoC families.
This inverter is special and needs two bits to be the inverse of each other
for the inverter to operate properly.

Fixes: 075001385c66 ("clk: meson: axg-audio: add g12a support")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/axg-audio.c | 85 ++++++++++++++++++++++++-----------
 1 file changed, 60 insertions(+), 25 deletions(-)

diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index 9918cb375de3..7c8d02164443 100644
--- a/drivers/clk/meson/axg-audio.c
+++ b/drivers/clk/meson/axg-audio.c
@@ -147,6 +147,29 @@
 	},								\
 }
 
+#define AUD_SCLK_WS(_name, _reg, _width, _shift_ph, _shift_ws, _pname,	\
+		    _iflags) {						\
+	.data = &(struct meson_sclk_ws_inv_data) {			\
+		.ph = {							\
+			.reg_off = (_reg),				\
+			.shift   = (_shift_ph),				\
+			.width   = (_width),				\
+		},							\
+		.ws = {							\
+			.reg_off = (_reg),				\
+			.shift   = (_shift_ws),				\
+			.width   = (_width),				\
+		},							\
+	},								\
+	.hw.init = &(struct clk_init_data) {				\
+		.name = "aud_"#_name,					\
+		.ops = &meson_clk_phase_ops,				\
+		.parent_names = (const char *[]){ #_pname },		\
+		.num_parents = 1,					\
+		.flags = (_iflags),					\
+	},								\
+}
+
 /* Audio Master Clocks */
 static const struct clk_parent_data mst_mux_parent_data[] = {
 	{ .fw_name = "mst_in0", },
@@ -254,6 +277,10 @@ static const struct clk_parent_data tdm_lrclk_parent_data[] = {
 	AUD_PHASE(tdm##_name##_sclk, _reg, 1, 29,			\
 		  aud_tdm##_name##_sclk_post_en,			\
 		  CLK_DUTY_CYCLE_PARENT | CLK_SET_RATE_PARENT)
+#define AUD_TDM_SCLK_WS(_name, _reg)					\
+	AUD_SCLK_WS(tdm##_name##_sclk, _reg, 1, 29, 28,			\
+		    aud_tdm##_name##_sclk_post_en,			\
+		    CLK_DUTY_CYCLE_PARENT | CLK_SET_RATE_PARENT)
 
 #define AUD_TDM_LRLCK(_name, _reg)					\
 	AUD_MUX(tdm##_name##_lrclk, _reg, 0xf, 20,			\
@@ -499,12 +526,6 @@ static struct clk_regmap tdmin_c_sclk =
 	AUD_TDM_SCLK(in_c, AUDIO_CLK_TDMIN_C_CTRL);
 static struct clk_regmap tdmin_lb_sclk =
 	AUD_TDM_SCLK(in_lb, AUDIO_CLK_TDMIN_LB_CTRL);
-static struct clk_regmap tdmout_a_sclk =
-	AUD_TDM_SCLK(out_a, AUDIO_CLK_TDMOUT_A_CTRL);
-static struct clk_regmap tdmout_b_sclk =
-	AUD_TDM_SCLK(out_b, AUDIO_CLK_TDMOUT_B_CTRL);
-static struct clk_regmap tdmout_c_sclk =
-	AUD_TDM_SCLK(out_c, AUDIO_CLK_TDMOUT_C_CTRL);
 
 static struct clk_regmap tdmin_a_lrclk =
 	AUD_TDM_LRLCK(in_a, AUDIO_CLK_TDMIN_A_CTRL);
@@ -521,6 +542,14 @@ static struct clk_regmap tdmout_b_lrclk =
 static struct clk_regmap tdmout_c_lrclk =
 	AUD_TDM_LRLCK(out_c, AUDIO_CLK_TDMOUT_C_CTRL);
 
+/* AXG Clocks */
+static struct clk_regmap axg_tdmout_a_sclk =
+	AUD_TDM_SCLK(out_a, AUDIO_CLK_TDMOUT_A_CTRL);
+static struct clk_regmap axg_tdmout_b_sclk =
+	AUD_TDM_SCLK(out_b, AUDIO_CLK_TDMOUT_B_CTRL);
+static struct clk_regmap axg_tdmout_c_sclk =
+	AUD_TDM_SCLK(out_c, AUDIO_CLK_TDMOUT_C_CTRL);
+
 /* AXG/G12A Clocks */
 static struct clk_hw axg_aud_top = {
 	.init = &(struct clk_init_data) {
@@ -591,7 +620,13 @@ static struct clk_regmap g12a_tdm_sclk_pad_1 = AUD_TDM_PAD_CTRL(
 static struct clk_regmap g12a_tdm_sclk_pad_2 = AUD_TDM_PAD_CTRL(
 	sclk_pad_2, AUDIO_MST_PAD_CTRL1, 8, sclk_pad_ctrl_parent_data);
 
-/* G12a/SM1 clocks */
+static struct clk_regmap g12a_tdmout_a_sclk =
+	AUD_TDM_SCLK_WS(out_a, AUDIO_CLK_TDMOUT_A_CTRL);
+static struct clk_regmap g12a_tdmout_b_sclk =
+	AUD_TDM_SCLK_WS(out_b, AUDIO_CLK_TDMOUT_B_CTRL);
+static struct clk_regmap g12a_tdmout_c_sclk =
+	AUD_TDM_SCLK_WS(out_c, AUDIO_CLK_TDMOUT_C_CTRL);
+
 static struct clk_regmap toram =
 	AUD_PCLK_GATE(toram, AUDIO_CLK_GATE_EN, 20);
 static struct clk_regmap spdifout_b =
@@ -889,9 +924,9 @@ static struct clk_hw_onecell_data axg_audio_hw_onecell_data = {
 		[AUD_CLKID_TDMIN_B_SCLK]	= &tdmin_b_sclk.hw,
 		[AUD_CLKID_TDMIN_C_SCLK]	= &tdmin_c_sclk.hw,
 		[AUD_CLKID_TDMIN_LB_SCLK]	= &tdmin_lb_sclk.hw,
-		[AUD_CLKID_TDMOUT_A_SCLK]	= &tdmout_a_sclk.hw,
-		[AUD_CLKID_TDMOUT_B_SCLK]	= &tdmout_b_sclk.hw,
-		[AUD_CLKID_TDMOUT_C_SCLK]	= &tdmout_c_sclk.hw,
+		[AUD_CLKID_TDMOUT_A_SCLK]	= &axg_tdmout_a_sclk.hw,
+		[AUD_CLKID_TDMOUT_B_SCLK]	= &axg_tdmout_b_sclk.hw,
+		[AUD_CLKID_TDMOUT_C_SCLK]	= &axg_tdmout_c_sclk.hw,
 		[AUD_CLKID_TDMIN_A_LRCLK]	= &tdmin_a_lrclk.hw,
 		[AUD_CLKID_TDMIN_B_LRCLK]	= &tdmin_b_lrclk.hw,
 		[AUD_CLKID_TDMIN_C_LRCLK]	= &tdmin_c_lrclk.hw,
@@ -1026,9 +1061,9 @@ static struct clk_hw_onecell_data g12a_audio_hw_onecell_data = {
 		[AUD_CLKID_TDMIN_B_SCLK]	= &tdmin_b_sclk.hw,
 		[AUD_CLKID_TDMIN_C_SCLK]	= &tdmin_c_sclk.hw,
 		[AUD_CLKID_TDMIN_LB_SCLK]	= &tdmin_lb_sclk.hw,
-		[AUD_CLKID_TDMOUT_A_SCLK]	= &tdmout_a_sclk.hw,
-		[AUD_CLKID_TDMOUT_B_SCLK]	= &tdmout_b_sclk.hw,
-		[AUD_CLKID_TDMOUT_C_SCLK]	= &tdmout_c_sclk.hw,
+		[AUD_CLKID_TDMOUT_A_SCLK]	= &g12a_tdmout_a_sclk.hw,
+		[AUD_CLKID_TDMOUT_B_SCLK]	= &g12a_tdmout_b_sclk.hw,
+		[AUD_CLKID_TDMOUT_C_SCLK]	= &g12a_tdmout_c_sclk.hw,
 		[AUD_CLKID_TDMIN_A_LRCLK]	= &tdmin_a_lrclk.hw,
 		[AUD_CLKID_TDMIN_B_LRCLK]	= &tdmin_b_lrclk.hw,
 		[AUD_CLKID_TDMIN_C_LRCLK]	= &tdmin_c_lrclk.hw,
@@ -1170,9 +1205,9 @@ static struct clk_hw_onecell_data sm1_audio_hw_onecell_data = {
 		[AUD_CLKID_TDMIN_B_SCLK]	= &tdmin_b_sclk.hw,
 		[AUD_CLKID_TDMIN_C_SCLK]	= &tdmin_c_sclk.hw,
 		[AUD_CLKID_TDMIN_LB_SCLK]	= &tdmin_lb_sclk.hw,
-		[AUD_CLKID_TDMOUT_A_SCLK]	= &tdmout_a_sclk.hw,
-		[AUD_CLKID_TDMOUT_B_SCLK]	= &tdmout_b_sclk.hw,
-		[AUD_CLKID_TDMOUT_C_SCLK]	= &tdmout_c_sclk.hw,
+		[AUD_CLKID_TDMOUT_A_SCLK]	= &g12a_tdmout_a_sclk.hw,
+		[AUD_CLKID_TDMOUT_B_SCLK]	= &g12a_tdmout_b_sclk.hw,
+		[AUD_CLKID_TDMOUT_C_SCLK]	= &g12a_tdmout_c_sclk.hw,
 		[AUD_CLKID_TDMIN_A_LRCLK]	= &tdmin_a_lrclk.hw,
 		[AUD_CLKID_TDMIN_B_LRCLK]	= &tdmin_b_lrclk.hw,
 		[AUD_CLKID_TDMIN_C_LRCLK]	= &tdmin_c_lrclk.hw,
@@ -1322,9 +1357,9 @@ static struct clk_regmap *const axg_clk_regmaps[] = {
 	&tdmin_b_sclk,
 	&tdmin_c_sclk,
 	&tdmin_lb_sclk,
-	&tdmout_a_sclk,
-	&tdmout_b_sclk,
-	&tdmout_c_sclk,
+	&axg_tdmout_a_sclk,
+	&axg_tdmout_b_sclk,
+	&axg_tdmout_c_sclk,
 	&tdmin_a_lrclk,
 	&tdmin_b_lrclk,
 	&tdmin_c_lrclk,
@@ -1447,9 +1482,9 @@ static struct clk_regmap *const g12a_clk_regmaps[] = {
 	&tdmin_b_sclk,
 	&tdmin_c_sclk,
 	&tdmin_lb_sclk,
-	&tdmout_a_sclk,
-	&tdmout_b_sclk,
-	&tdmout_c_sclk,
+	&g12a_tdmout_a_sclk,
+	&g12a_tdmout_b_sclk,
+	&g12a_tdmout_c_sclk,
 	&tdmin_a_lrclk,
 	&tdmin_b_lrclk,
 	&tdmin_c_lrclk,
@@ -1584,9 +1619,9 @@ static struct clk_regmap *const sm1_clk_regmaps[] = {
 	&tdmin_b_sclk,
 	&tdmin_c_sclk,
 	&tdmin_lb_sclk,
-	&tdmout_a_sclk,
-	&tdmout_b_sclk,
-	&tdmout_c_sclk,
+	&g12a_tdmout_a_sclk,
+	&g12a_tdmout_b_sclk,
+	&g12a_tdmout_c_sclk,
 	&tdmin_a_lrclk,
 	&tdmin_b_lrclk,
 	&tdmin_c_lrclk,
-- 
2.25.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
