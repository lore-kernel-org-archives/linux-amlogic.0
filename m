Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB6EC072A2
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Nov 2023 13:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SAmnqWu82gJWJN1fkesmZgD7+t6wKGI/bWqoMr48EmY=; b=4Adk+c3AxmZNik
	647O7smj5bFdQfgShMQVhkvViWYBAIn/1BciXsKhUdlgZ/9NhKJuJVo9bFagMvmh6MNb5opBMBqRz
	kU3Du1VseSNISJCfFsiAgLLM9LjVINxwMc944ffdYE0fcDxGyf1ufvm6vmSwcI+KpBNhrnZ6Aw1hm
	rrrp8XP2Rt35b6s72YbnAai8Ex/4lK8eNGIhMYvO4+qfaGMv14l4fd17jK2XcjmOVdxptsWIRT26r
	m5WIDNNO4wXyE5k+ph9IcmMt86kUWOtGIOb3KFnVZPQKuxxDTW69ZwwCGzod/PcnE5/S2mgzOLFzt
	I0HcOgCgRMVeFl13oTaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3yRj-006asy-1e;
	Fri, 17 Nov 2023 12:59:43 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3yRc-006ap5-3B
	for linux-amlogic@lists.infradead.org;
	Fri, 17 Nov 2023 12:59:39 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40836ea8cbaso14402055e9.0
        for <linux-amlogic@lists.infradead.org>; Fri, 17 Nov 2023 04:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700225976; x=1700830776; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOigh6xEIHsnetURZKAyAV1p94v8dqGGYbyO3VKINpU=;
        b=B6YN0Ev2PQU0esKEWd9y/iDy6YOeyNQNEjEPqy5Zpa7aR/kP7I7y739jiBibkWJK0Z
         xlzDtkiuNSxu6yiSMNob6aDS0DqP/AX437jjwJJIOJpab7gR3qacCgJjOM87mdduxEyG
         /4HYJNE/AYD78cgxxRsyPjIii+3BWA43ri3C0dIZBwQsHUr/c1xhp/W2XrFkeJ8VrCdA
         hYfJaNtYJs15+2Fvgt4uqoYRYszn8pRNjCxEekyHMQxqdP+p6nE4Rm8HnjGPt8RK99Yz
         72062jbZpTIRQkPPhPww9SIeSZ7bbh7ni3yoaSMS1lcF6BoXGrVE126anSF+SjipF2b5
         2Bjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700225976; x=1700830776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOigh6xEIHsnetURZKAyAV1p94v8dqGGYbyO3VKINpU=;
        b=tx6yL9FE8jEOunBp7cmg1mp6pLzESLgzKjNxPg5frmSgwjVsLJ+Tnsxo8xTV3W0GHl
         Gc58gj9biQm6yB7pz/0/uHZd3SgihJWW4QWQH1FvkPmyIxOf7PC95ZujgX9oBTGNqy4o
         dloy9diwvPQk+JEChQGqATI9GOou6OYT2q3LzY0Xyvbm4CH3WbDvBEPPlQ/zXZz4zhFm
         cxpbLg2tsYtYWEDk3ubcBAsJQd3ZCc8LgmH4qd7IpufPG5ABv/rKSvHS4wG7XWn8OsLo
         89tEFlpioVtbd4Cdh/06U9zj/Zusguk8xaHlYVTAqw+tpolBvD5UQD+uILmR/sTRbrvj
         0hPw==
X-Gm-Message-State: AOJu0YyCYl+L1zdAPetQSEsE+ASew75gRyNR1dq7VlF8K4ve1KsZZ1zp
	RFoMao2nN4VZkHTuylE+CTzg3g==
X-Google-Smtp-Source: AGHT+IHEtT6ZmxVlplA97BAnVFOpyJiYia3JjhedIByl1fV2eDfHeVagprornqQXjsBhl9hpgS6Xqg==
X-Received: by 2002:a7b:c8d7:0:b0:40a:2796:61a0 with SMTP id f23-20020a7bc8d7000000b0040a279661a0mr14432533wml.33.1700225975631;
        Fri, 17 Nov 2023 04:59:35 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:8196:e423:38cb:9a09])
        by smtp.googlemail.com with ESMTPSA id k21-20020a05600c1c9500b0040a487758dcsm2671343wms.6.2023.11.17.04.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 04:59:35 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Thierry Reding <thierry.reding@gmail.com>,
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
Subject: [PATCH v2 4/6] pwm: meson: add generic compatible for meson8 to sm1
Date: Fri, 17 Nov 2023 13:59:14 +0100
Message-ID: <20231117125919.1696980-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231117125919.1696980-1-jbrunet@baylibre.com>
References: <20231117125919.1696980-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_045937_044930_53D12B4A 
X-CRM114-Status: GOOD (  24.57  )
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

The PWM HW is actually the same for all SoCs supported so far.
A specific compatible is needed only because the clock sources
of the PWMs are hard-coded in the driver.

It is better to have the clock source described in DT but this
changes the bindings so a new compatible must be introduced.

When all supported platform have migrated to the new compatible,
support for the legacy ones may be removed from the driver.

Adding a callback to setup the clock will also make it easier
to add support for the new PWM HW found in a1, s4, c3 and t7 SoC
families

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/pwm/pwm-meson.c | 224 ++++++++++++++++++++++++----------------
 1 file changed, 133 insertions(+), 91 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 5cbd65cae28a..d5d745a651d3 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -95,6 +95,7 @@ struct meson_pwm_channel {
 
 struct meson_pwm_data {
 	const char * const *parent_names;
+	int (*channels_init)(struct device *dev);
 };
 
 struct meson_pwm {
@@ -333,95 +334,6 @@ static const struct pwm_ops meson_pwm_ops = {
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
 static int meson_pwm_init_clocks_legacy(struct device *dev,
 					struct clk_parent_data *mux_parent_data)
 {
@@ -528,12 +440,15 @@ static int meson_pwm_init_clocks_legacy(struct device *dev,
 	return 0;
 }
 
-static int meson_pwm_init_channels(struct device *dev)
+static int meson_pwm_init_channels_legacy(struct device *dev)
 {
 	struct clk_parent_data mux_parent_data[MESON_NUM_MUX_PARENTS] = {};
 	struct meson_pwm *meson = dev_get_drvdata(dev);
 	int i;
 
+	dev_info(dev, "using obsolete compatible, please consider updating dt\n");
+
+
 	for (i = 0; i < MESON_NUM_MUX_PARENTS; i++) {
 		mux_parent_data[i].index = -1;
 		mux_parent_data[i].name = meson->data->parent_names[i];
@@ -542,6 +457,133 @@ static int meson_pwm_init_channels(struct device *dev)
 	return meson_pwm_init_clocks_legacy(dev, mux_parent_data);
 }
 
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
+	/*
+	 * The following compatibles are obsolete.
+	 * Support for these may be removed once the related
+	 * platforms have been updated
+	 */
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
@@ -573,7 +615,7 @@ static int meson_pwm_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
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
