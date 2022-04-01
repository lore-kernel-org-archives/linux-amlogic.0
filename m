Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A89CC433F5
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Apr 2022 10:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k4Ic9ZEX3Arz+Bw6RK1nfAl2DqgT5XNv/RDJ1Mf49zI=; b=Gr9+bEvT5tPJuA
	Xbn4s1Ye3K5/Ex1Ru7X0QoAFZyzdvgyTAy1mkoyk3fyVL+o5OtKsWiPEAV5Vx+WWD+j7SyLGahpWT
	JCMtum+PhlG+K+CnxaelzAf4caDp1GkFLKyxpQCTA3nXFMF9+apmX1gwnxZF2T2Nvw0WH+oP8rQvN
	DIUzTlWwNqwX7pvQlbn5UoyRdc8C7Jc98VYvnLj8aCPRd6yj2sb4/iyNgXVoPTss+NR4i22WapcZj
	KtTHYNLEYLtQGz/z0cMjIi+ZWU5TJXOiYNTSK8oqAXvEBc90ViUsH5n5lEflQyKaNPQawciRyT5+S
	I9FRD3q/pH79PzMUvGiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naEiX-005FeE-24; Fri, 01 Apr 2022 10:41:21 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naEdj-005Cqn-KS; Fri, 01 Apr 2022 10:36:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648809383; x=1680345383;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EuhF9tdayYP61bXggQczwdo90eZaDVg9/mxLRlJMSCY=;
 b=no2qYojSbXHFn/J1za/dg81ftgFAU+JOwn0K0+23gCwXpZXB88aJoNdB
 19yt8gMED2XtMqufVxdMwZ0PsZkg42DXNEICxLJvp4SXkccKKUVdEzgHO
 SBfJGYj+sC6lhy4i7OM+MT7If1tfuzodBcqUGTC6cKuIQadaP3H2N+YMp
 A6BsroJGaEXy919mghf07vV0aVx1eNPHOwWUqSTtCWEudXf0VZzCpTwVs
 fmarPcFcEMTZc+DrbOWtcydg25cHWMpsmWrYe04SdPahpTLUihXAEcpKv
 NoE5xOR1t66j5EpRhSGGmizuIg7+2o5c91C2dePwUBhj1kejVd0ejlWhK A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10303"; a="258932128"
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="258932128"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 03:36:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="695847066"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga001.fm.intel.com with ESMTP; 01 Apr 2022 03:35:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 08D40612; Fri,  1 Apr 2022 13:36:06 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Qianggui Song <qianggui.song@amlogic.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v4 09/13] pinctrl: meson: Rename REG_* to MESON_REG_*
Date: Fri,  1 Apr 2022 13:36:00 +0300
Message-Id: <20220401103604.8705-10-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
References: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_033623_736780_0DB40A14 
X-CRM114-Status: GOOD (  14.76  )
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

Currently compilation test fails on x86 due to name collision. The usual
way to fix that is to move both conflicting parts to their own namespaces.

Rename REG_* to MESON_REG_* as a prerequisite for enabling COMPILE_TEST.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 24 ++++++++++++------------
 drivers/pinctrl/meson/pinctrl-meson.h | 24 ++++++++++++------------
 2 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 49851444a6e3..5b46a0979db7 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -218,13 +218,13 @@ static int meson_pinconf_set_output(struct meson_pinctrl *pc,
 				    unsigned int pin,
 				    bool out)
 {
-	return meson_pinconf_set_gpio_bit(pc, pin, REG_DIR, !out);
+	return meson_pinconf_set_gpio_bit(pc, pin, MESON_REG_DIR, !out);
 }
 
 static int meson_pinconf_get_output(struct meson_pinctrl *pc,
 				    unsigned int pin)
 {
-	int ret = meson_pinconf_get_gpio_bit(pc, pin, REG_DIR);
+	int ret = meson_pinconf_get_gpio_bit(pc, pin, MESON_REG_DIR);
 
 	if (ret < 0)
 		return ret;
@@ -236,13 +236,13 @@ static int meson_pinconf_set_drive(struct meson_pinctrl *pc,
 				   unsigned int pin,
 				   bool high)
 {
-	return meson_pinconf_set_gpio_bit(pc, pin, REG_OUT, high);
+	return meson_pinconf_set_gpio_bit(pc, pin, MESON_REG_OUT, high);
 }
 
 static int meson_pinconf_get_drive(struct meson_pinctrl *pc,
 				   unsigned int pin)
 {
-	return meson_pinconf_get_gpio_bit(pc, pin, REG_OUT);
+	return meson_pinconf_get_gpio_bit(pc, pin, MESON_REG_OUT);
 }
 
 static int meson_pinconf_set_output_drive(struct meson_pinctrl *pc,
@@ -269,7 +269,7 @@ static int meson_pinconf_disable_bias(struct meson_pinctrl *pc,
 	if (ret)
 		return ret;
 
-	meson_calc_reg_and_bit(bank, pin, REG_PULLEN, &reg, &bit);
+	meson_calc_reg_and_bit(bank, pin, MESON_REG_PULLEN, &reg, &bit);
 	ret = regmap_update_bits(pc->reg_pullen, reg, BIT(bit), 0);
 	if (ret)
 		return ret;
@@ -288,7 +288,7 @@ static int meson_pinconf_enable_bias(struct meson_pinctrl *pc, unsigned int pin,
 	if (ret)
 		return ret;
 
-	meson_calc_reg_and_bit(bank, pin, REG_PULL, &reg, &bit);
+	meson_calc_reg_and_bit(bank, pin, MESON_REG_PULL, &reg, &bit);
 	if (pull_up)
 		val = BIT(bit);
 
@@ -296,7 +296,7 @@ static int meson_pinconf_enable_bias(struct meson_pinctrl *pc, unsigned int pin,
 	if (ret)
 		return ret;
 
-	meson_calc_reg_and_bit(bank, pin, REG_PULLEN, &reg, &bit);
+	meson_calc_reg_and_bit(bank, pin, MESON_REG_PULLEN, &reg, &bit);
 	ret = regmap_update_bits(pc->reg_pullen, reg, BIT(bit),	BIT(bit));
 	if (ret)
 		return ret;
@@ -321,7 +321,7 @@ static int meson_pinconf_set_drive_strength(struct meson_pinctrl *pc,
 	if (ret)
 		return ret;
 
-	meson_calc_reg_and_bit(bank, pin, REG_DS, &reg, &bit);
+	meson_calc_reg_and_bit(bank, pin, MESON_REG_DS, &reg, &bit);
 
 	if (drive_strength_ua <= 500) {
 		ds_val = MESON_PINCONF_DRV_500UA;
@@ -407,7 +407,7 @@ static int meson_pinconf_get_pull(struct meson_pinctrl *pc, unsigned int pin)
 	if (ret)
 		return ret;
 
-	meson_calc_reg_and_bit(bank, pin, REG_PULLEN, &reg, &bit);
+	meson_calc_reg_and_bit(bank, pin, MESON_REG_PULLEN, &reg, &bit);
 
 	ret = regmap_read(pc->reg_pullen, reg, &val);
 	if (ret)
@@ -416,7 +416,7 @@ static int meson_pinconf_get_pull(struct meson_pinctrl *pc, unsigned int pin)
 	if (!(val & BIT(bit))) {
 		conf = PIN_CONFIG_BIAS_DISABLE;
 	} else {
-		meson_calc_reg_and_bit(bank, pin, REG_PULL, &reg, &bit);
+		meson_calc_reg_and_bit(bank, pin, MESON_REG_PULL, &reg, &bit);
 
 		ret = regmap_read(pc->reg_pull, reg, &val);
 		if (ret)
@@ -447,7 +447,7 @@ static int meson_pinconf_get_drive_strength(struct meson_pinctrl *pc,
 	if (ret)
 		return ret;
 
-	meson_calc_reg_and_bit(bank, pin, REG_DS, &reg, &bit);
+	meson_calc_reg_and_bit(bank, pin, MESON_REG_DS, &reg, &bit);
 
 	ret = regmap_read(pc->reg_ds, reg, &val);
 	if (ret)
@@ -595,7 +595,7 @@ static int meson_gpio_get(struct gpio_chip *chip, unsigned gpio)
 	if (ret)
 		return ret;
 
-	meson_calc_reg_and_bit(bank, gpio, REG_IN, &reg, &bit);
+	meson_calc_reg_and_bit(bank, gpio, MESON_REG_IN, &reg, &bit);
 	regmap_read(pc->reg_gpio, reg, &val);
 
 	return !!(val & BIT(bit));
diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
index ff5372e0a475..fa042cd6a7ff 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.h
+++ b/drivers/pinctrl/meson/pinctrl-meson.h
@@ -63,12 +63,12 @@ struct meson_reg_desc {
  * enum meson_reg_type - type of registers encoded in @meson_reg_desc
  */
 enum meson_reg_type {
-	REG_PULLEN,
-	REG_PULL,
-	REG_DIR,
-	REG_OUT,
-	REG_IN,
-	REG_DS,
+	MESON_REG_PULLEN,
+	MESON_REG_PULL,
+	MESON_REG_DIR,
+	MESON_REG_OUT,
+	MESON_REG_IN,
+	MESON_REG_DS,
 	NUM_REG,
 };
 
@@ -150,12 +150,12 @@ struct meson_pinctrl {
 		.irq_first	= fi,					\
 		.irq_last	= li,					\
 		.regs = {						\
-			[REG_PULLEN]	= { per, peb },			\
-			[REG_PULL]	= { pr, pb },			\
-			[REG_DIR]	= { dr, db },			\
-			[REG_OUT]	= { or, ob },			\
-			[REG_IN]	= { ir, ib },			\
-			[REG_DS]	= { dsr, dsb },			\
+			[MESON_REG_PULLEN]	= { per, peb },		\
+			[MESON_REG_PULL]	= { pr, pb },		\
+			[MESON_REG_DIR]		= { dr, db },		\
+			[MESON_REG_OUT]		= { or, ob },		\
+			[MESON_REG_IN]		= { ir, ib },		\
+			[MESON_REG_DS]		= { dsr, dsb },		\
 		},							\
 	 }
 
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
