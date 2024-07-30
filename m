Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16956C3DA7E
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Jul 2024 12:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P5/U6SGpmrpMN9LWR3utjtIHuZ8nwIyNltgw0czdvVw=; b=FCzuz7yI30x6gE
	ArBGQZJJQT82HZ1ePnJrE5Dm7i46AP0K0FlkECLRA3ZdlOrLem0XgLY3e6lUXIor0VwI03k9KGE23
	rRmYydNcA15F77yN/Q655Arjuf0FFuUvfN5vG+Y5AmfVkt7AnZ5hk79YTHMAwruvV0fhcHnfJTg4o
	7rc7YiTvZrGq+MDM/4/tivZhGh9WnbTMr9OeHasbWAlTPEevWgtHeFW+0quLFezdqv4lzhTVLgFMe
	5TmV7/PVUXk+cZHbrmhW2FXGjxAm0FYrjd4v2JJ3GxRi1+xnrW3pgoR9+J7iUrKxXZ+BYzyYg7qNy
	+WcLPk4myY6PAVbek3/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYmJZ-0000000FA7c-3adT;
	Tue, 30 Jul 2024 12:50:53 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYmJO-0000000F9w8-272U
	for linux-amlogic@lists.infradead.org;
	Tue, 30 Jul 2024 12:50:45 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-368380828d6so2765034f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 30 Jul 2024 05:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722343841; x=1722948641; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mASIbGHgicNkpjEZJDVQTMm2DP0XPbvH1Sd0GVs1rHs=;
        b=xWoAfbAYIEqziyyWz1RT4b2J9OxdDfM7y/MRaAUM4W4oaWouoo3KwZurONYjVu3Zfw
         XCiJYlEsE8gthEykZ+VyfpPkJK7i3rIgqlJpGRxaWRIEhZBCQ8V6MC753F+B375/Az1p
         8wp4B8LwMYTzM7p3QpxQGDSj7QL54V2ZNu2lB0TDoitA6iYsKSnGag1CfIK6bS7u3uFl
         OiWnC0E1jXmgwf04R0dutFrPifBH8zsIFMZu5MQ/DUOvZDu/nuRuRXMJ6pUsMcu/l5oL
         oGcm2nFg3qaJed55KEQUA8psD12/2UZx9VN45t+A0Q6PSTghsEje3TSHuZ74AAMDzLqb
         ZIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722343841; x=1722948641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mASIbGHgicNkpjEZJDVQTMm2DP0XPbvH1Sd0GVs1rHs=;
        b=NgMjlBXAvcX2E24P47IZZGXJEPIjdN+2Dxehczy+0a3DKPOLgXuZWgjjMX7rKoJciB
         2lZfJxhTsW3kvh7o6vzIhXswTC/bltcsHFalvcwM9Xn3t7P+KQ6ZmLZr7JgX+crElINj
         5p6Tl22qUENKJLuHSjIbEfCFDaLKXN3IvTCcz9v543IVeyvVwI05NdOHO6S5J69WGfL7
         RN+OooZwsAWXAIGaKMtYvSsm23eMNQV8AwgyhPV3OlYhZdSAVrfPgtXyX0Luc5hIYxDY
         SNMth6X/UMRnHbkmk1AF8HgG41o3NJvXPlVu/iLbD5ZlV+FFA0fU5TItULfra9hXU3fm
         4Vsw==
X-Forwarded-Encrypted: i=1; AJvYcCXmTS8igPgW6EQFW+FlCdx9uALYs7+nv07FhmbrdM3vZxkuoLuL4EHYMBY493Y7m0P5t8lhcRnO+8O6pcbIhj36l9HFbXomZiJKugSeWUq7/40=
X-Gm-Message-State: AOJu0Yx9R31YmBrJ6k0vTRswiE/h860SHWXGGYCRtibcIhI+87v6RSkV
	kqkk+apiZK9HHh6x8zpjQfgPwX9q7NVYiPqioQAHoMzpO+217J680pjkYA27RI8=
X-Google-Smtp-Source: AGHT+IGgAowgwPOjeaL86WpoU9wRwRtqxrk1rp/DYm6nll47JN9ogSrFK3ue1xuiQZz1zSdyf7rnBg==
X-Received: by 2002:a05:6000:11cb:b0:368:3194:8a85 with SMTP id ffacd0b85a97d-36b5cee9bfdmr7815247f8f.7.1722343840573;
        Tue, 30 Jul 2024 05:50:40 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:291e:4a48:358e:6f49])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42805730e68sm216521405e9.9.2024.07.30.05.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 05:50:40 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/9] drm/meson: dw-hdmi: use matched data
Date: Tue, 30 Jul 2024 14:50:17 +0200
Message-ID: <20240730125023.710237-8-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730125023.710237-1-jbrunet@baylibre.com>
References: <20240730125023.710237-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_055042_945837_2B733D99 
X-CRM114-Status: GOOD (  19.77  )
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

Using several string comparisons with if/else if/else clauses
is fairly inefficient and does not scale well.

Use matched data to tweak the driver depending on the matched
SoC instead.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 209 +++++++++++++++++---------
 1 file changed, 139 insertions(+), 70 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 7c39e5c99043..ef059c5ef520 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -125,8 +125,17 @@
 #define HHI_HDMI_PHY_CNTL4	0x3b0 /* 0xec */
 #define HHI_HDMI_PHY_CNTL5	0x3b4 /* 0xed */
 
+struct meson_dw_hdmi_speed {
+	const struct reg_sequence *regs;
+	unsigned int reg_num;
+	unsigned int limit;
+};
+
 struct meson_dw_hdmi_data {
 	int (*reg_init)(struct device *dev);
+	const struct meson_dw_hdmi_speed *speeds;
+	unsigned int speed_num;
+	bool use_drm_infoframe;
 	u32 cntl0_init;
 	u32 cntl1_init;
 };
@@ -185,78 +194,33 @@ struct meson_dw_hdmi {
 	struct regmap *top;
 };
 
-static inline int dw_hdmi_is_compatible(struct meson_dw_hdmi *dw_hdmi,
-					const char *compat)
-{
-	return of_device_is_compatible(dw_hdmi->dev->of_node, compat);
-}
-
-/* Bridge */
-
 /* Setup PHY bandwidth modes */
-static void meson_hdmi_phy_setup_mode(struct meson_dw_hdmi *dw_hdmi,
+static int meson_hdmi_phy_setup_mode(struct meson_dw_hdmi *dw_hdmi,
 				      const struct drm_display_mode *mode,
 				      bool mode_is_420)
 {
 	struct meson_drm *priv = dw_hdmi->priv;
 	unsigned int pixel_clock = mode->clock;
+	int i;
 
 	/* For 420, pixel clock is half unlike venc clock */
-	if (mode_is_420) pixel_clock /= 2;
-
-	if (dw_hdmi_is_compatible(dw_hdmi, "amlogic,meson-gxl-dw-hdmi") ||
-	    dw_hdmi_is_compatible(dw_hdmi, "amlogic,meson-gxm-dw-hdmi")) {
-		if (pixel_clock >= 371250) {
-			/* 5.94Gbps, 3.7125Gbps */
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, 0x333d3282);
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL3, 0x2136315b);
-		} else if (pixel_clock >= 297000) {
-			/* 2.97Gbps */
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, 0x33303382);
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL3, 0x2036315b);
-		} else if (pixel_clock >= 148500) {
-			/* 1.485Gbps */
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, 0x33303362);
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL3, 0x2016315b);
-		} else {
-			/* 742.5Mbps, and below */
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, 0x33604142);
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL3, 0x0016315b);
-		}
-	} else if (dw_hdmi_is_compatible(dw_hdmi,
-					 "amlogic,meson-gxbb-dw-hdmi")) {
-		if (pixel_clock >= 371250) {
-			/* 5.94Gbps, 3.7125Gbps */
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, 0x33353245);
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL3, 0x2100115b);
-		} else if (pixel_clock >= 297000) {
-			/* 2.97Gbps */
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, 0x33634283);
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL3, 0xb000115b);
-		} else {
-			/* 1.485Gbps, and below */
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, 0x33632122);
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL3, 0x2000115b);
-		}
-	} else if (dw_hdmi_is_compatible(dw_hdmi,
-					 "amlogic,meson-g12a-dw-hdmi")) {
-		if (pixel_clock >= 371250) {
-			/* 5.94Gbps, 3.7125Gbps */
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, 0x37eb65c4);
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL3, 0x2ab0ff3b);
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL5, 0x0000080b);
-		} else if (pixel_clock >= 297000) {
-			/* 2.97Gbps */
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, 0x33eb6262);
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL3, 0x2ab0ff3b);
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL5, 0x00000003);
-		} else {
-			/* 1.485Gbps, and below */
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, 0x33eb4242);
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL3, 0x2ab0ff3b);
-			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL5, 0x00000003);
-		}
+	if (mode_is_420)
+		pixel_clock /= 2;
+
+	for (i = 0; i < dw_hdmi->data->speed_num; i++) {
+		if (pixel_clock >= dw_hdmi->data->speeds[i].limit)
+			break;
 	}
+
+	/* No match found - Last entry should have a 0 limit */
+	if (WARN_ON(i == dw_hdmi->data->speed_num))
+		return -EINVAL;
+
+	regmap_multi_reg_write(priv->hhi,
+			       dw_hdmi->data->speeds[i].regs,
+			       dw_hdmi->data->speeds[i].reg_num);
+
+	return 0;
 }
 
 static inline void meson_dw_hdmi_phy_reset(struct meson_dw_hdmi *dw_hdmi)
@@ -543,22 +507,133 @@ static int meson_dw_init_regmap_g12(struct device *dev)
 	return 0;
 }
 
+static const struct reg_sequence gxbb_3g7_regs[] = {
+	{ .reg = HHI_HDMI_PHY_CNTL0, .def = 0x33353245 },
+	{ .reg = HHI_HDMI_PHY_CNTL3, .def = 0x2100115b },
+};
+
+static const struct reg_sequence gxbb_3g_regs[] = {
+	{ .reg = HHI_HDMI_PHY_CNTL0, .def = 0x33634283 },
+	{ .reg = HHI_HDMI_PHY_CNTL3, .def = 0xb000115b },
+};
+
+static const struct reg_sequence gxbb_def_regs[] = {
+	{ .reg = HHI_HDMI_PHY_CNTL0, .def = 0x33632122 },
+	{ .reg = HHI_HDMI_PHY_CNTL3, .def = 0x2000115b },
+};
+
+static const struct meson_dw_hdmi_speed gxbb_speeds[] = {
+	{
+		.limit = 371250,
+		.regs = gxbb_3g7_regs,
+		.reg_num = ARRAY_SIZE(gxbb_3g7_regs)
+	}, {
+		.limit = 297000,
+		.regs = gxbb_3g_regs,
+		.reg_num = ARRAY_SIZE(gxbb_3g_regs)
+	}, {
+		.regs = gxbb_def_regs,
+		.reg_num = ARRAY_SIZE(gxbb_def_regs)
+	}
+};
+
 static const struct meson_dw_hdmi_data meson_dw_hdmi_gxbb_data = {
 	.reg_init = meson_dw_init_regmap_gx,
 	.cntl0_init = 0x0,
 	.cntl1_init = PHY_CNTL1_INIT | PHY_INVERT,
+	.use_drm_infoframe = false,
+	.speeds = gxbb_speeds,
+	.speed_num = ARRAY_SIZE(gxbb_speeds),
+};
+
+static const struct reg_sequence gxl_3g7_regs[] = {
+	{ .reg = HHI_HDMI_PHY_CNTL0, .def = 0x333d3282 },
+	{ .reg = HHI_HDMI_PHY_CNTL3, .def = 0x2136315b },
+};
+
+static const struct reg_sequence gxl_3g_regs[] = {
+	{ .reg = HHI_HDMI_PHY_CNTL0, .def = 0x33303382 },
+	{ .reg = HHI_HDMI_PHY_CNTL3, .def = 0x2036315b },
+};
+
+static const struct reg_sequence gxl_def_regs[] = {
+	{ .reg = HHI_HDMI_PHY_CNTL0, .def = 0x33303362 },
+	{ .reg = HHI_HDMI_PHY_CNTL3, .def = 0x2016315b },
+};
+
+static const struct reg_sequence gxl_270m_regs[] = {
+	{ .reg = HHI_HDMI_PHY_CNTL0, .def = 0x33604142 },
+	{ .reg = HHI_HDMI_PHY_CNTL3, .def = 0x0016315b },
+};
+
+static const struct meson_dw_hdmi_speed gxl_speeds[] = {
+	{
+		.limit = 371250,
+		.regs = gxl_3g7_regs,
+		.reg_num = ARRAY_SIZE(gxl_3g7_regs)
+	}, {
+		.limit = 297000,
+		.regs = gxl_3g_regs,
+		.reg_num = ARRAY_SIZE(gxl_3g_regs)
+	}, {
+		.limit = 148500,
+		.regs = gxl_def_regs,
+		.reg_num = ARRAY_SIZE(gxl_def_regs)
+	}, {
+		.regs = gxl_270m_regs,
+		.reg_num = ARRAY_SIZE(gxl_270m_regs)
+	}
 };
 
 static const struct meson_dw_hdmi_data meson_dw_hdmi_gxl_data = {
 	.reg_init = meson_dw_init_regmap_gx,
 	.cntl0_init = 0x0,
 	.cntl1_init = PHY_CNTL1_INIT,
+	.use_drm_infoframe = true,
+	.speeds = gxl_speeds,
+	.speed_num = ARRAY_SIZE(gxl_speeds),
+};
+
+static const struct reg_sequence g12a_3g7_regs[] = {
+	{ .reg = HHI_HDMI_PHY_CNTL0, .def = 0x37eb65c4 },
+	{ .reg = HHI_HDMI_PHY_CNTL3, .def = 0x2ab0ff3b },
+	{ .reg = HHI_HDMI_PHY_CNTL5, .def = 0x0000080b },
+};
+
+static const struct reg_sequence g12a_3g_regs[] = {
+	{ .reg = HHI_HDMI_PHY_CNTL0, .def = 0x33eb6262 },
+	{ .reg = HHI_HDMI_PHY_CNTL3, .def = 0x2ab0ff3b },
+	{ .reg = HHI_HDMI_PHY_CNTL5, .def = 0x00000003 },
+};
+
+static const struct reg_sequence g12a_def_regs[] = {
+	{ .reg = HHI_HDMI_PHY_CNTL0, .def = 0x33eb4242 },
+	{ .reg = HHI_HDMI_PHY_CNTL3, .def = 0x2ab0ff3b },
+	{ .reg = HHI_HDMI_PHY_CNTL5, .def = 0x00000003 },
+};
+
+static const struct meson_dw_hdmi_speed g12a_speeds[] = {
+	{
+		.limit = 371250,
+		.regs = g12a_3g7_regs,
+		.reg_num = ARRAY_SIZE(g12a_3g7_regs)
+	}, {
+		.limit = 297000,
+		.regs = g12a_3g_regs,
+		.reg_num = ARRAY_SIZE(g12a_3g_regs)
+	}, {
+		.regs = g12a_def_regs,
+		.reg_num = ARRAY_SIZE(g12a_def_regs)
+	}
 };
 
 static const struct meson_dw_hdmi_data meson_dw_hdmi_g12a_data = {
 	.reg_init = meson_dw_init_regmap_g12,
 	.cntl0_init = 0x000b4242, /* Bandgap */
 	.cntl1_init = PHY_CNTL1_INIT,
+	.use_drm_infoframe = true,
+	.speeds = g12a_speeds,
+	.speed_num = ARRAY_SIZE(g12a_speeds),
 };
 
 static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
@@ -590,7 +665,6 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 	platform_set_drvdata(pdev, meson_dw_hdmi);
 
 	meson_dw_hdmi->priv = priv;
-	meson_dw_hdmi->dev = dev;
 	meson_dw_hdmi->data = match;
 	dw_plat_data = &meson_dw_hdmi->dw_plat_data;
 
@@ -650,7 +724,6 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 	meson_dw_hdmi_init(meson_dw_hdmi);
 
 	/* Bridge / Connector */
-
 	dw_plat_data->priv_data = meson_dw_hdmi;
 	dw_plat_data->phy_ops = &meson_dw_hdmi_phy_ops;
 	dw_plat_data->phy_name = "meson_dw_hdmi_phy";
@@ -659,11 +732,7 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 	dw_plat_data->ycbcr_420_allowed = true;
 	dw_plat_data->disable_cec = true;
 	dw_plat_data->output_port = 1;
-
-	if (dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-gxl-dw-hdmi") ||
-	    dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-gxm-dw-hdmi") ||
-	    dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-g12a-dw-hdmi"))
-		dw_plat_data->use_drm_infoframe = true;
+	dw_plat_data->use_drm_infoframe = meson_dw_hdmi->data->use_drm_infoframe;
 
 	meson_dw_hdmi->hdmi = dw_hdmi_probe(pdev, &meson_dw_hdmi->dw_plat_data);
 	if (IS_ERR(meson_dw_hdmi->hdmi))
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
