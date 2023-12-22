Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2418BC41535
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 Dec 2023 11:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PxhLPtLk8fYDtU58D3j0YOII58HuAjH2Z7UuKyRqUZc=; b=GTeQPueCb7joDD
	35Y23ZMjsLPe5d6X30Nt7nZIL2XaXV6QVRapH1swpJItZ5sGLkBHt/S3ZfmxOif0N42YWl0I806c9
	61KpIolZaeTpYcT6PY6fCqvPIMhJtcRkork0HKYZgipEZga3WzrHvdSzg4PFvGSHG+gzLQcj9Eq2L
	L5qUzWQ4TAizU/RWcAXL15+JSEe8feNm7JSyMaVKjJ1SBnSAfCRp4HLBAw0msRHj9Hiyns3wSgBmb
	iATu37G8kyJTs6A73gmyvisEvW3AhqozT2Yottum8jabcmnalgd5HoIGk+1hIWmKz1nvw6WNwLcsM
	bm/XcdXuP2wW/gLBHuXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGdX4-005eJg-1o;
	Fri, 22 Dec 2023 11:17:34 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGdX0-005eGJ-2U
	for linux-amlogic@lists.infradead.org;
	Fri, 22 Dec 2023 11:17:32 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2cc843af59fso20962311fa.0
        for <linux-amlogic@lists.infradead.org>; Fri, 22 Dec 2023 03:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1703243847; x=1703848647; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WLdzLfSEEVamw81pFt4PJ3qeYp2a8WvdFrJ9tUWJ7PY=;
        b=cbJ8A8KgnHEwnbSLeMlWB0i+CSq43F0bREjlGJkwCXqmVgqN7Dtv6nxXk/d+s88FCq
         IqjxNW9OjapdQBRo1A0M8OcoktP9jO7/GCJsjn04HbaNw/nvrqU8ZxQI66L2aCGWaOwD
         RVUQgiN626Ym+fY9q5gl/7y2lX59Pohii6EA2r0fOU9/kTN/RI1S5L1yK0RjY008/bze
         fTeGbGIhfx+bDhaU41HrPSsEyLD1qK0PiYQ9MOSZdf7fogWp6xr2hKYKhWHEJ1AzlMFv
         6exmm6CIRFYdeScYNOwvTaROJtFWwPXp6kH9Bet2h7krVs1VnJO0DMWfeANnBN9TOKpt
         xUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703243847; x=1703848647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WLdzLfSEEVamw81pFt4PJ3qeYp2a8WvdFrJ9tUWJ7PY=;
        b=q7AxP8jmdawPCFzRMyU6JvQ8FWsV+xuXyC/c+ksNZ4ZOoRGAwp5JYkwYSk1Lv4gsSK
         lXwK5TuUsd4NUBllJ3M9J/qD+HMytLzKId3GBBEdOYvPKflBkiZUMKYWpN8eZo+GGatG
         /T0G17d3ax/jGXZkQCN50ypf6uZjTVXmuNp3P0IHSAPgpzc4dG8q6OTyHivPzMNd7IrA
         Gn3n+xnYwWhZqZRiMPfhSUVgD7aw/FOVb5bxH0l9i0ckaAAMYEKj6NKXoEClNZEEB8q8
         ZJiTP4bl6WmU5aICMcLMwMgnreQ2mn1b0VvZ8c0Yb2ry11yABR1M2klOnKEiaB/Y/Jgv
         kFyw==
X-Gm-Message-State: AOJu0Yw4w7b1QgPECq9/1juiK5jj08sYvgKoUmF/wZnNeKg85LmBwval
	q6JT5KGoWNSycl3sXeA8KsWjnsPJk8uzKw==
X-Google-Smtp-Source: AGHT+IHF8QykG43zRtMmkctjbVuKLYsW7rfsMx5OwczXw8lbMFtHQDq4/lLUPm3DgBYBmQiLWpgdfQ==
X-Received: by 2002:a2e:2407:0:b0:2cc:2678:6d35 with SMTP id k7-20020a2e2407000000b002cc26786d35mr573523ljk.6.1703243846824;
        Fri, 22 Dec 2023 03:17:26 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:c099:e596:3179:b0fa])
        by smtp.googlemail.com with ESMTPSA id f8-20020adffcc8000000b003366b500047sm4054069wrs.50.2023.12.22.03.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 03:17:26 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
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
Subject: [PATCH v4 6/6] pwm: meson: add generic compatible for meson8 to sm1
Date: Fri, 22 Dec 2023 12:16:54 +0100
Message-ID: <20231222111658.832167-7-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231222111658.832167-1-jbrunet@baylibre.com>
References: <20231222111658.832167-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_031730_817129_0919ECF1 
X-CRM114-Status: GOOD (  25.38  )
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
 drivers/pwm/pwm-meson.c | 240 ++++++++++++++++++++++++----------------
 1 file changed, 143 insertions(+), 97 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index fb113bc8da29..9c0a8a6e4f48 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -95,6 +95,7 @@ struct meson_pwm_channel {
 
 struct meson_pwm_data {
 	const char * const *parent_names;
+	int (*channels_init)(struct device *dev);
 };
 
 struct meson_pwm {
@@ -333,108 +334,14 @@ static const struct pwm_ops meson_pwm_ops = {
 	.get_state = meson_pwm_get_state,
 };
 
-static const char * const pwm_meson8b_parent_names[] = {
-	"xtal", NULL, "fclk_div4", "fclk_div3"
-};
-
-static const struct meson_pwm_data pwm_meson8b_data = {
-	.parent_names = pwm_meson8b_parent_names,
-};
-
-/*
- * Only the 2 first inputs of the GXBB AO PWMs are valid
- * The last 2 are grounded
- */
-static const char * const pwm_gxbb_ao_parent_names[] = {
-	"xtal", "clk81", NULL, NULL,
-};
-
-static const struct meson_pwm_data pwm_gxbb_ao_data = {
-	.parent_names = pwm_gxbb_ao_parent_names,
-};
-
-static const char * const pwm_axg_ee_parent_names[] = {
-	"xtal", "fclk_div5", "fclk_div4", "fclk_div3"
-};
-
-static const struct meson_pwm_data pwm_axg_ee_data = {
-	.parent_names = pwm_axg_ee_parent_names,
-};
-
-static const char * const pwm_axg_ao_parent_names[] = {
-	"xtal", "axg_ao_clk81", "fclk_div4", "fclk_div5"
-};
-
-static const struct meson_pwm_data pwm_axg_ao_data = {
-	.parent_names = pwm_axg_ao_parent_names,
-};
-
-static const char * const pwm_g12a_ao_ab_parent_names[] = {
-	"xtal", "g12a_ao_clk81", "fclk_div4", "fclk_div5"
-};
-
-static const struct meson_pwm_data pwm_g12a_ao_ab_data = {
-	.parent_names = pwm_g12a_ao_ab_parent_names,
-};
-
-static const char * const pwm_g12a_ao_cd_parent_names[] = {
-	"xtal", "g12a_ao_clk81", NULL, NULL,
-};
-
-static const struct meson_pwm_data pwm_g12a_ao_cd_data = {
-	.parent_names = pwm_g12a_ao_cd_parent_names,
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
-static int meson_pwm_init_channels(struct device *dev)
+static int meson_pwm_init_clocks_legacy(struct device *dev,
+					struct clk_parent_data *mux_parent_data)
 {
-	struct clk_parent_data mux_parent_data[MESON_NUM_MUX_PARENTS] = {};
 	struct meson_pwm *meson = dev_get_drvdata(dev);
 	unsigned int i;
 	char name[255];
 	int err;
 
-	for (i = 0; i < MESON_NUM_MUX_PARENTS; i++) {
-		mux_parent_data[i].index = -1;
-		mux_parent_data[i].name = meson->data->parent_names[i];
-	}
-
 	for (i = 0; i < MESON_NUM_PWMS; i++) {
 		struct meson_pwm_channel *channel = &meson->channels[i];
 		struct clk_parent_data div_parent = {}, gate_parent = {};
@@ -527,6 +434,145 @@ static int meson_pwm_init_channels(struct device *dev)
 	return 0;
 }
 
+static int meson_pwm_init_channels_legacy(struct device *dev)
+{
+	struct clk_parent_data mux_parent_data[MESON_NUM_MUX_PARENTS] = {};
+	struct meson_pwm *meson = dev_get_drvdata(dev);
+	int i;
+
+	dev_warn_once(dev, "using obsolete compatible, please consider updating dt\n");
+
+	for (i = 0; i < MESON_NUM_MUX_PARENTS; i++) {
+		mux_parent_data[i].index = -1;
+		mux_parent_data[i].name = meson->data->parent_names[i];
+	}
+
+	return meson_pwm_init_clocks_legacy(dev, mux_parent_data);
+}
+
+static int meson_pwm_init_channels_meson8b_v2(struct device *dev)
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
+	return meson_pwm_init_clocks_legacy(dev, mux_parent_data);
+}
+
+static const char * const pwm_meson8b_parent_names[] = {
+	"xtal", NULL, "fclk_div4", "fclk_div3"
+};
+
+static const struct meson_pwm_data pwm_meson8b_data = {
+	.parent_names = pwm_meson8b_parent_names,
+	.channels_init = meson_pwm_init_channels_legacy,
+};
+
+/*
+ * Only the 2 first inputs of the GXBB AO PWMs are valid
+ * The last 2 are grounded
+ */
+static const char * const pwm_gxbb_ao_parent_names[] = {
+	"xtal", "clk81", NULL, NULL,
+};
+
+static const struct meson_pwm_data pwm_gxbb_ao_data = {
+	.parent_names = pwm_gxbb_ao_parent_names,
+	.channels_init = meson_pwm_init_channels_legacy,
+};
+
+static const char * const pwm_axg_ee_parent_names[] = {
+	"xtal", "fclk_div5", "fclk_div4", "fclk_div3"
+};
+
+static const struct meson_pwm_data pwm_axg_ee_data = {
+	.parent_names = pwm_axg_ee_parent_names,
+	.channels_init = meson_pwm_init_channels_legacy,
+};
+
+static const char * const pwm_axg_ao_parent_names[] = {
+	"xtal", "axg_ao_clk81", "fclk_div4", "fclk_div5"
+};
+
+static const struct meson_pwm_data pwm_axg_ao_data = {
+	.parent_names = pwm_axg_ao_parent_names,
+	.channels_init = meson_pwm_init_channels_legacy,
+};
+
+static const char * const pwm_g12a_ao_ab_parent_names[] = {
+	"xtal", "g12a_ao_clk81", "fclk_div4", "fclk_div5"
+};
+
+static const struct meson_pwm_data pwm_g12a_ao_ab_data = {
+	.parent_names = pwm_g12a_ao_ab_parent_names,
+	.channels_init = meson_pwm_init_channels_legacy,
+};
+
+static const char * const pwm_g12a_ao_cd_parent_names[] = {
+	"xtal", "g12a_ao_clk81", NULL, NULL,
+};
+
+static const struct meson_pwm_data pwm_g12a_ao_cd_data = {
+	.parent_names = pwm_g12a_ao_cd_parent_names,
+	.channels_init = meson_pwm_init_channels_legacy,
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
 	struct meson_pwm *meson;
@@ -554,7 +600,7 @@ static int meson_pwm_probe(struct platform_device *pdev)
 
 	meson->data = of_device_get_match_data(&pdev->dev);
 
-	err = meson_pwm_init_channels(&pdev->dev);
+	err = meson->data->channels_init(&pdev->dev);
 	if (err < 0)
 		return err;
 
-- 
2.42.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
