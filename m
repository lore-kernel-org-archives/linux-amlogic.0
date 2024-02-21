Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B609C48BEB
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Feb 2024 15:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i7TiWSmPe4q3WzB0C9VN8MCl6nMKRyVfu5O2XY+RrJc=; b=svP/VbdTKEDOhU
	5WbRbl0OBmmMVaN/KzWLQcKU99R6eww7pnLVFgSx5bqpu9dQlgdwHQm/YxotAhh4dC1VEGy2QknwC
	gGwRNwiSWc8gwP97NMxrqDp2a4rOMQKWT9shWCwcu00Ez1AAlXsDQppEJxoWgpGnpOAjByadKDtj7
	JWcvNJltGurDjMTsF+dcUeHHYFqwv3bVm7PReUtkiGZSdUOuXZaHWFNoi6JkeDKClOIO6Lc568r5R
	PFpRfhUELYR5qKsY156h9JMtt1fJMJhYXb3iv6qC41CvDzwm6IBm1oJIUmI8R4wkGj70jEuuyCeXe
	6dgqWyZVJh4IJYZms8nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcoGf-00000001QSo-1Bgd;
	Wed, 21 Feb 2024 15:12:17 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcoGb-00000001QQi-1AlY
	for linux-amlogic@lists.infradead.org;
	Wed, 21 Feb 2024 15:12:14 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-41275f1b45aso5202085e9.3
        for <linux-amlogic@lists.infradead.org>; Wed, 21 Feb 2024 07:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708528332; x=1709133132; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h74FeFDIe1tQA6L7395dqtw/ncyV+KOTJre2S3F/uNM=;
        b=xmUQvDWtnage5+AVdv7wJ1MCpET9vieZNbEDiuSRceHkuI2OpHbcpo6D6i2myCN+lF
         cs8AGyB4vWJ+isPE5AnPp3Lo0iDGDh+qFeOW0O9vNDYRujxsCrTXWVw4yQNFHfU745qd
         KIwzUMHnomvkJ96RwA4TnXgIEJhGrIcQz3tEmxtSplc2qPnfpfhuK29K2oHRT7uYwHth
         yqOP/B47acse5h1rtTFolQbQzr+IJPqgTkU8tXR/Q9DIxneiTKnC6EC2uOofxJral5ia
         ITkax6KlwNQd3jUVyAMUZG+tl99lN8P+IGKIqY/okHeaiv5PFsfEkoeNRjfJJwntBr+b
         f8Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708528332; x=1709133132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h74FeFDIe1tQA6L7395dqtw/ncyV+KOTJre2S3F/uNM=;
        b=owX7R4Fs6czBNOZATl7YIZBntkW6U6HEm0w1hp+NU+d1y5M3AZw9Zi4Hksm8u10duP
         QSnNuhrUcWEh3ZDI37Nng3jLI+kicYfqOPFyL42gF+gV3+h3zeVzTZ8V/icGPXKjnyAk
         JTUHIPvK9DUBFzGvRlvSi4hwmoM1KxSsdoF8bgeLs570Kl6/P2tlNJkqz7teAlcQrOHs
         4bgeL9FFQx8/tjpx2vNQA++yfZIuasLTs9OR74SDoF46IL4bWWBe/vijr+dEvBYp2Tkc
         +32dunWXSq+0nvGx5ZTy4kYmqSXJ48T+sEHRLvbAQwtuQ9bKAgISuWq2GjKd4lkRCASn
         HP/g==
X-Forwarded-Encrypted: i=1; AJvYcCUQ3XacTt+4iNQanzEUGrfQKtUh8w927V7sC0cTJkOQDsxrGckNgmt+wDt7F6ZadTdDpzt4NjMajIz+HkCjdKN433XU6pExvUTbLmxdTo8HE0M=
X-Gm-Message-State: AOJu0Yxw1rUsQoyTYDvk67luUcxPrQb/7qgxPy5yGRgT5TN2jJNwiR46
	xf5Bw31MwHgV4AKGXXPeFRhc3bwARgs7fSB9Fk49KBJgd1nLKNOnIsYUENH2lgY=
X-Google-Smtp-Source: AGHT+IH0BIGfDcyECWrL+G0YcnBelN2VYVCfDRoTAKneFYafATVPl+LVdCn8hr7FrY+5box9ZQGFEg==
X-Received: by 2002:a05:600c:4f83:b0:411:ddc2:28b2 with SMTP id n3-20020a05600c4f8300b00411ddc228b2mr17153344wmq.27.1708528332062;
        Wed, 21 Feb 2024 07:12:12 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1b1a:d907:d735:9f9e])
        by smtp.googlemail.com with ESMTPSA id bg22-20020a05600c3c9600b0040fc56712e8sm18725342wmb.17.2024.02.21.07.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 07:12:11 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	JunYi Zhao <junyi.zhao@amlogic.com>
Subject: [PATCH v5 5/5] pwm: meson: add generic compatible for meson8 to sm1
Date: Wed, 21 Feb 2024 16:11:51 +0100
Message-ID: <20240221151154.26452-6-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240221151154.26452-1-jbrunet@baylibre.com>
References: <20240221151154.26452-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_071213_371726_F034DE6C 
X-CRM114-Status: GOOD (  25.73  )
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

Introduce a new compatible support in the Amlogic PWM driver.

The PWM HW is actually the same for all SoCs supported so far. A specific
compatible is needed only because the clock sources of the PWMs are
hard-coded in the driver.

It is better to have the clock source described in DT but this changes the
bindings so a new compatible must be introduced.

When all supported platform have migrated to the new compatible, support
for the legacy ones may be removed from the driver.

The addition of this new compatible makes the old ones obsolete, as
described in the DT documentation.

Adding a callback to setup the clock will also make it easier to add
support for the new PWM HW found in a1, s4, c3 and t7 SoC families.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/pwm/pwm-meson.c | 195 +++++++++++++++++++++++++---------------
 1 file changed, 121 insertions(+), 74 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index fe61335d87d0..90fc7b349723 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -101,6 +101,7 @@ struct meson_pwm_channel {
 
 struct meson_pwm_data {
 	const char *const parent_names[MESON_NUM_MUX_PARENTS];
+	int (*channels_init)(struct pwm_chip *chip);
 };
 
 struct meson_pwm {
@@ -341,86 +342,16 @@ static const struct pwm_ops meson_pwm_ops = {
 	.get_state = meson_pwm_get_state,
 };
 
-static const struct meson_pwm_data pwm_meson8b_data = {
-	.parent_names = { "xtal", NULL, "fclk_div4", "fclk_div3" },
-};
-
-/*
- * Only the 2 first inputs of the GXBB AO PWMs are valid
- * The last 2 are grounded
- */
-static const struct meson_pwm_data pwm_gxbb_ao_data = {
-	.parent_names = { "xtal", "clk81", NULL, NULL },
-};
-
-static const struct meson_pwm_data pwm_axg_ee_data = {
-	.parent_names = { "xtal", "fclk_div5", "fclk_div4", "fclk_div3" },
-};
-
-static const struct meson_pwm_data pwm_axg_ao_data = {
-	.parent_names = { "xtal", "axg_ao_clk81", "fclk_div4", "fclk_div5" },
-};
-
-static const struct meson_pwm_data pwm_g12a_ao_ab_data = {
-	.parent_names = { "xtal", "g12a_ao_clk81", "fclk_div4", "fclk_div5" },
-};
-
-static const struct meson_pwm_data pwm_g12a_ao_cd_data = {
-	.parent_names = { "xtal", "g12a_ao_clk81", NULL, NULL },
-};
-
-static const struct of_device_id meson_pwm_matches[] = {
-	{
-		.compatible = "amlogic,meson8b-pwm",
-		.data = &pwm_meson8b_data
-	},
-	{
-		.compatible = "amlogic,meson-gxbb-pwm",
-		.data = &pwm_meson8b_data
-	},
-	{
-		.compatible = "amlogic,meson-gxbb-ao-pwm",
-		.data = &pwm_gxbb_ao_data
-	},
-	{
-		.compatible = "amlogic,meson-axg-ee-pwm",
-		.data = &pwm_axg_ee_data
-	},
-	{
-		.compatible = "amlogic,meson-axg-ao-pwm",
-		.data = &pwm_axg_ao_data
-	},
-	{
-		.compatible = "amlogic,meson-g12a-ee-pwm",
-		.data = &pwm_meson8b_data
-	},
-	{
-		.compatible = "amlogic,meson-g12a-ao-pwm-ab",
-		.data = &pwm_g12a_ao_ab_data
-	},
-	{
-		.compatible = "amlogic,meson-g12a-ao-pwm-cd",
-		.data = &pwm_g12a_ao_cd_data
-	},
-	{},
-};
-MODULE_DEVICE_TABLE(of, meson_pwm_matches);
-
-static int meson_pwm_init_channels(struct pwm_chip *chip)
+static int meson_pwm_init_clocks_meson8b(struct pwm_chip *chip,
+					 struct clk_parent_data *mux_parent_data)
 {
 	struct meson_pwm *meson = to_meson_pwm(chip);
-	struct clk_parent_data mux_parent_data[MESON_NUM_MUX_PARENTS] = {};
 	struct device *dev = pwmchip_parent(chip);
 	unsigned int i;
 	char name[255];
 	int err;
 
-	for (i = 0; i < MESON_NUM_MUX_PARENTS; i++) {
-		mux_parent_data[i].index = -1;
-		mux_parent_data[i].name = meson->data->parent_names[i];
-	}
-
-	for (i = 0; i < chip->npwm; i++) {
+	for (i = 0; i < MESON_NUM_PWMS; i++) {
 		struct meson_pwm_channel *channel = &meson->channels[i];
 		struct clk_parent_data pdata = {};
 		struct meson8b_pwm_clocks *clks;
@@ -502,6 +433,122 @@ static int meson_pwm_init_channels(struct pwm_chip *chip)
 	return 0;
 }
 
+static int meson_pwm_init_channels_meson8b_legacy(struct pwm_chip *chip)
+{
+	struct clk_parent_data mux_parent_data[MESON_NUM_MUX_PARENTS] = {};
+	struct meson_pwm *meson = to_meson_pwm(chip);
+	int i;
+
+	dev_warn_once(pwmchip_parent(chip),
+		      "using obsolete compatible, please consider updating dt\n");
+
+	for (i = 0; i < MESON_NUM_MUX_PARENTS; i++) {
+		mux_parent_data[i].index = -1;
+		mux_parent_data[i].name = meson->data->parent_names[i];
+	}
+
+	return meson_pwm_init_clocks_meson8b(chip, mux_parent_data);
+}
+
+static int meson_pwm_init_channels_meson8b_v2(struct pwm_chip *chip)
+{
+	struct clk_parent_data mux_parent_data[MESON_NUM_MUX_PARENTS] = {};
+	int i;
+
+	/*
+	 * NOTE: Instead of relying on the hard coded names in the driver
+	 * as the legacy version, this relies on DT to provide the list of
+	 * clocks.
+	 * For once, using input numbers actually makes more sense than names.
+	 * Also DT requires clock-names to be explicitly ordered, so there is
+	 * no point bothering with clock names in this case.
+	 */
+	for (i = 0; i < MESON_NUM_MUX_PARENTS; i++)
+		mux_parent_data[i].index = i;
+
+	return meson_pwm_init_clocks_meson8b(chip, mux_parent_data);
+}
+
+static const struct meson_pwm_data pwm_meson8b_data = {
+	.parent_names = { "xtal", NULL, "fclk_div4", "fclk_div3" },
+	.channels_init = meson_pwm_init_channels_meson8b_legacy,
+};
+
+/*
+ * Only the 2 first inputs of the GXBB AO PWMs are valid
+ * The last 2 are grounded
+ */
+static const struct meson_pwm_data pwm_gxbb_ao_data = {
+	.parent_names = { "xtal", "clk81", NULL, NULL },
+	.channels_init = meson_pwm_init_channels_meson8b_legacy,
+};
+
+static const struct meson_pwm_data pwm_axg_ee_data = {
+	.parent_names = { "xtal", "fclk_div5", "fclk_div4", "fclk_div3" },
+	.channels_init = meson_pwm_init_channels_meson8b_legacy,
+};
+
+static const struct meson_pwm_data pwm_axg_ao_data = {
+	.parent_names = { "xtal", "axg_ao_clk81", "fclk_div4", "fclk_div5" },
+	.channels_init = meson_pwm_init_channels_meson8b_legacy,
+};
+
+static const struct meson_pwm_data pwm_g12a_ao_ab_data = {
+	.parent_names = { "xtal", "g12a_ao_clk81", "fclk_div4", "fclk_div5" },
+	.channels_init = meson_pwm_init_channels_meson8b_legacy,
+};
+
+static const struct meson_pwm_data pwm_g12a_ao_cd_data = {
+	.parent_names = { "xtal", "g12a_ao_clk81", NULL, NULL },
+	.channels_init = meson_pwm_init_channels_meson8b_legacy,
+};
+
+static const struct meson_pwm_data pwm_meson8_v2_data = {
+	.channels_init = meson_pwm_init_channels_meson8b_v2,
+};
+
+static const struct of_device_id meson_pwm_matches[] = {
+	{
+		.compatible = "amlogic,meson8-pwm-v2",
+		.data = &pwm_meson8_v2_data
+	},
+	/* The following compatibles are obsolete */
+	{
+		.compatible = "amlogic,meson8b-pwm",
+		.data = &pwm_meson8b_data
+	},
+	{
+		.compatible = "amlogic,meson-gxbb-pwm",
+		.data = &pwm_meson8b_data
+	},
+	{
+		.compatible = "amlogic,meson-gxbb-ao-pwm",
+		.data = &pwm_gxbb_ao_data
+	},
+	{
+		.compatible = "amlogic,meson-axg-ee-pwm",
+		.data = &pwm_axg_ee_data
+	},
+	{
+		.compatible = "amlogic,meson-axg-ao-pwm",
+		.data = &pwm_axg_ao_data
+	},
+	{
+		.compatible = "amlogic,meson-g12a-ee-pwm",
+		.data = &pwm_meson8b_data
+	},
+	{
+		.compatible = "amlogic,meson-g12a-ao-pwm-ab",
+		.data = &pwm_g12a_ao_ab_data
+	},
+	{
+		.compatible = "amlogic,meson-g12a-ao-pwm-cd",
+		.data = &pwm_g12a_ao_cd_data
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, meson_pwm_matches);
+
 static int meson_pwm_probe(struct platform_device *pdev)
 {
 	struct pwm_chip *chip;
@@ -522,7 +569,7 @@ static int meson_pwm_probe(struct platform_device *pdev)
 
 	meson->data = of_device_get_match_data(&pdev->dev);
 
-	err = meson_pwm_init_channels(chip);
+	err = meson->data->channels_init(chip);
 	if (err < 0)
 		return err;
 
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
