Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C195C4345F
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Apr 2024 16:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7VfzmDSEce7zajE3NrWSCiRjBaUzRJMPYVkbInhA6gk=; b=eLrcruaz0ieGsx
	Htb0J7UkjveiGk744M3GJDBJMivagauIvcBpRcngfbNr2MKKrWY3DQw45EVb+i1xP9DY/6beT6cEE
	d6tNPgFiHvB0EzYav6uBVoKcYX4yNL5bchS697b+Hg3B++5K71J7/svzUT9HvChFCObNV064AAjO7
	/b6N9a5Dg9DselTP2x+PJLKrglr8Owy5CsQ5SXt72K0zUTFnfamffYqaaDj+6vAGAxwcmse3vGSbW
	23c78DcOmnJhvr9rV4IiAPFF3KjCBNl4bg2tVrNN8b1aoRF9UvhajKyCSWkndRU6feFlVbU3Ty698
	Vpy1UPrWlZjeYGqI7wxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0O2r-0000000DAqh-2pgv;
	Fri, 26 Apr 2024 16:03:29 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0O2j-0000000DAlg-0NlM
	for linux-amlogic@lists.infradead.org;
	Fri, 26 Apr 2024 16:03:28 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-41b5e74fa2fso11270975e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 26 Apr 2024 09:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714147399; x=1714752199; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VwWBLD0qVTKGOAoQ6eE14pnlmcdWHx3m3KgGPqRsyL0=;
        b=VstYEGRTqm6rqicvcTjTeNyz2hV1R1Im94BcwCSxYCK6FAYKQ69FgCAaX1im5fNYnO
         cO45h29z1MNHW3Fmmfs7inWK2ksyoZyVYp8ikNUPodhGNRbPwJ6QCE5n4nH1f+bLi0Cm
         LgtphpN6OyB5EsSehZF9TDLA5tCkhmZAckvxUWOxKtAzDq2P9Ty5MAl2ft4S8yD1zkJH
         cyyo/uOoJ/HAd1eGro0b/9k+HCFKVrBjVCfgAw7QhnjTHOyikhNgenN7ACuT7ZJDg2TW
         ikmF2b+xzHoMasCS4kMxyx5N37k6Ah0/yvl4G7V+AheJHvyqSTw/ltW9CUgjyOVmtdP6
         up7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714147399; x=1714752199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VwWBLD0qVTKGOAoQ6eE14pnlmcdWHx3m3KgGPqRsyL0=;
        b=JvFh3LC+AT0vRWfKpbNsnI9y0cCQ//56sF6n5ciLAZGqfBACTelq/+Mtu/mq1rk6gx
         LpBwLunERbD0xW4EazOU2eP8IhvhzkKBHFlGHp9aQDQdkxz2b9V9S8XNO2uP1a/r+2Lo
         NtzvCN4s8/o8TVp9SDxXVK8/57+79dyXPDU2awaJZFbsm9QKrDIVhkPkhOQ55oeEcrgU
         vp1INJUxuN3II0OfpBPaEtTNTQDX+yin+BULr8EqMXu0MpnSiZShKz3Gh9zLl5hcRzly
         O8I/4aDVyqc8ZZ/F51vVAFDWUcAiuv312J+v4QxkI220XtlI/WKtniCbPjsaMTuYG7Hu
         elKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrnsLGxIECqptbXsvdf0gqrUT5Aes/6VnOHeO7dckualyfgw5snq/g6jlzbivFMUyyVzswyHorqVTixojuD9PovrGt9VjjFYcPY1/2adI39Ns=
X-Gm-Message-State: AOJu0YxuQUl0RyxH1jg/jJpIFp5u0Wc15z3zBdO5W6Gz+aE06J2zVzBz
	yRJUi5mexAQz0yNiuuK0oHjZOItTfNr8Ii9N2iz/vm+c70DD2ufGYM+RInnvCX8=
X-Google-Smtp-Source: AGHT+IHkz1L3NwwxZXGlD2vu7++NI5Hhk5UYu+PbPcgI+aC0ZN9bQl9YHJFAVv+F4MLdLuQUjRV3jw==
X-Received: by 2002:a05:600c:1913:b0:41b:ab72:3f4d with SMTP id j19-20020a05600c191300b0041bab723f4dmr749759wmq.1.1714147399382;
        Fri, 26 Apr 2024 09:03:19 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1926:f73e:8b99:1c0a])
        by smtp.googlemail.com with ESMTPSA id p14-20020a05600c1d8e00b0041bab13cd74sm1271408wms.17.2024.04.26.09.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 09:03:19 -0700 (PDT)
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
Subject: [PATCH 2/2] drm/meson: dw-hdmi: add bandgap setting for g12
Date: Fri, 26 Apr 2024 18:02:54 +0200
Message-ID: <20240426160256.3089978-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240426160256.3089978-1-jbrunet@baylibre.com>
References: <20240426160256.3089978-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_090321_515948_95C2001B 
X-CRM114-Status: GOOD (  15.46  )
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

When no mode is set, the utility pin appears to be grounded. No signal
is getting through.

This is problematic because ARC and eARC use this line and may do so even
if no display mode is set.

This change enable the bandgap setting on g12 chip, which fix the problem
with the utility pin. This is done by restoring init values on PHY init and
disable.

Fixes: 3b7c1237a72a ("drm/meson: Add G12A support for the DW-HDMI Glue")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 43 ++++++++++++++++-----------
 1 file changed, 26 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index a83d93078537..5565f7777529 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -106,6 +106,8 @@
 #define HHI_HDMI_CLK_CNTL	0x1cc /* 0x73 */
 #define HHI_HDMI_PHY_CNTL0	0x3a0 /* 0xe8 */
 #define HHI_HDMI_PHY_CNTL1	0x3a4 /* 0xe9 */
+#define  PHY_CNTL1_INIT		0x03900000
+#define  PHY_INVERT		BIT(17)
 #define HHI_HDMI_PHY_CNTL2	0x3a8 /* 0xea */
 #define HHI_HDMI_PHY_CNTL3	0x3ac /* 0xeb */
 #define HHI_HDMI_PHY_CNTL4	0x3b0 /* 0xec */
@@ -130,6 +132,8 @@ struct meson_dw_hdmi_data {
 				    unsigned int addr);
 	void		(*dwc_write)(struct meson_dw_hdmi *dw_hdmi,
 				     unsigned int addr, unsigned int data);
+	u32 cntl0_init;
+	u32 cntl1_init;
 };
 
 struct meson_dw_hdmi {
@@ -458,7 +462,9 @@ static void dw_hdmi_phy_disable(struct dw_hdmi *hdmi,
 
 	DRM_DEBUG_DRIVER("\n");
 
-	regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, 0);
+	/* Fallback to init mode */
+	regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL1, dw_hdmi->data->cntl1_init);
+	regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, dw_hdmi->data->cntl0_init);
 }
 
 static enum drm_connector_status dw_hdmi_read_hpd(struct dw_hdmi *hdmi,
@@ -576,11 +582,22 @@ static const struct regmap_config meson_dw_hdmi_regmap_config = {
 	.fast_io = true,
 };
 
-static const struct meson_dw_hdmi_data meson_dw_hdmi_gx_data = {
+static const struct meson_dw_hdmi_data meson_dw_hdmi_gxbb_data = {
 	.top_read = dw_hdmi_top_read,
 	.top_write = dw_hdmi_top_write,
 	.dwc_read = dw_hdmi_dwc_read,
 	.dwc_write = dw_hdmi_dwc_write,
+	.cntl0_init = 0x0,
+	.cntl1_init = PHY_CNTL1_INIT | PHY_INVERT,
+};
+
+static const struct meson_dw_hdmi_data meson_dw_hdmi_gxl_data = {
+	.top_read = dw_hdmi_top_read,
+	.top_write = dw_hdmi_top_write,
+	.dwc_read = dw_hdmi_dwc_read,
+	.dwc_write = dw_hdmi_dwc_write,
+	.cntl0_init = 0x0,
+	.cntl1_init = PHY_CNTL1_INIT,
 };
 
 static const struct meson_dw_hdmi_data meson_dw_hdmi_g12a_data = {
@@ -588,6 +605,8 @@ static const struct meson_dw_hdmi_data meson_dw_hdmi_g12a_data = {
 	.top_write = dw_hdmi_g12a_top_write,
 	.dwc_read = dw_hdmi_g12a_dwc_read,
 	.dwc_write = dw_hdmi_g12a_dwc_write,
+	.cntl0_init = 0x000b4242, /* Bandgap */
+	.cntl1_init = PHY_CNTL1_INIT,
 };
 
 static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
@@ -626,18 +645,8 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
 	meson_dw_hdmi->data->top_write(meson_dw_hdmi, HDMITX_TOP_BIST_CNTL, BIT(12));
 
 	/* Setup PHY */
-	regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1,
-			   0xffff << 16, 0x0390 << 16);
-
-	/* BIT_INVERT */
-	if (dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-gxl-dw-hdmi") ||
-	    dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-gxm-dw-hdmi") ||
-	    dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-g12a-dw-hdmi"))
-		regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1,
-				   BIT(17), 0);
-	else
-		regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1,
-				   BIT(17), BIT(17));
+	regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL1, meson_dw_hdmi->data->cntl1_init);
+	regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, meson_dw_hdmi->data->cntl0_init);
 
 	/* Enable HDMI-TX Interrupt */
 	meson_dw_hdmi->data->top_write(meson_dw_hdmi, HDMITX_TOP_INTR_STAT_CLR,
@@ -848,11 +857,11 @@ static const struct dev_pm_ops meson_dw_hdmi_pm_ops = {
 
 static const struct of_device_id meson_dw_hdmi_of_table[] = {
 	{ .compatible = "amlogic,meson-gxbb-dw-hdmi",
-	  .data = &meson_dw_hdmi_gx_data },
+	  .data = &meson_dw_hdmi_gxbb_data },
 	{ .compatible = "amlogic,meson-gxl-dw-hdmi",
-	  .data = &meson_dw_hdmi_gx_data },
+	  .data = &meson_dw_hdmi_gxl_data },
 	{ .compatible = "amlogic,meson-gxm-dw-hdmi",
-	  .data = &meson_dw_hdmi_gx_data },
+	  .data = &meson_dw_hdmi_gxl_data },
 	{ .compatible = "amlogic,meson-g12a-dw-hdmi",
 	  .data = &meson_dw_hdmi_g12a_data },
 	{ }
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
