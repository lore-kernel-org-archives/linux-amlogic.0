Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C2FC48BF6
	for <linux-amlogic@archiver.kernel.org>; Sun, 18 Feb 2024 17:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oZBn1zLEddaLwFJgNAscOFlfx39kF8nNhrnyU+cihng=; b=1nASOYD3/6sxbw
	TTD6vRd+ptBME8haBHnQqB/k4L+R/93JjidwIwyuUq9zAfl+OfcEm+xZWmapQVU3XhtinQxBh/2ey
	Eu1o6TRVOpkF3UL3Z/uQhqDtQeCCHZ2WLMO9PofhT7s9YuabArgXUKNXyZbeWGU1qUy+CC+jxmEAm
	FhvYjp/5s5vIdqWjLix0RXHq8Napj67gcOlmjCqf5ldxzTfWqO+J/n9uDOeKYCRyODVHbEwpbdTtz
	SX/QXv0GXiIrcDonfs7sZL0zflCoBx2Xmovzzedl9aBZxwU+XAaOU79GNsBIzmO1rT3xnu9MeySvp
	M8Am4YUfwOBzPwJuh4Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rblJN-000000088TA-0cru;
	Sun, 18 Feb 2024 17:50:45 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rblJK-000000088Rl-0741;
	Sun, 18 Feb 2024 17:50:43 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2d107900457so50846521fa.1;
        Sun, 18 Feb 2024 09:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1708278640; x=1708883440; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yjpbxfuUN8ClVWyejRT9z307tEN2okR2Dj3IppGtU+I=;
        b=OwFLlRp3ipzauK8nFRklrmt4gCrPzeTbObCAKX2AfWmN7hnv970UBkCsjfaAlf4z1b
         6mTUssimyovPrZeaSSyYIp4K+zYcrPkke3z1yy0IfcMQ9JMCMS1rmnNxFD0tCFOW4kA9
         LllQxppHSBmqrlAnGEDnhRMXijOeAnVef2zraha8OvEIzSi6HdSUQvXbety+HmNMe403
         H0CDURzqqgkUPJfar+dSBGHGwqcVL2myma/FUNhIX59MYH9lKSaujXuS8BM9ljcDody/
         NuwAhi/xGYsd9/fERBuMcN2tFrw0n+e2hIszF5wnU621s2sIdAi7fxkHHzxhYO97bsfn
         lraA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708278640; x=1708883440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yjpbxfuUN8ClVWyejRT9z307tEN2okR2Dj3IppGtU+I=;
        b=YX7ge4yTutblcIyXs8zgcilyaSKrl2plwB9wYxi3/4a0DbyOWXzOP5KZHQF5jJhQ9j
         HBoOZFBOO/2atGuJ6UCdHyq+EfWpe1ELuCwBj9IRJkw4S/BWQsGoYJT3aU326iNrXePj
         qzFDpMpZXRoGo9ph/y/YlVO48XaLOVOLikWuRj8FQrkG4tGACS17AkPGBGkc+/aQqaI9
         2wBOmwXbGiBozBFsR/x7a9i0R29HtPi4YrGGIWH0TB+JhVegNKFNxZtABXj2ZcB2hA3y
         ZfUaFEEJpBZmzNu+qa18zUQ711ZpNyrjqn6eeWY5H+FI/86CFDXZx3IHqbpgfy9LU89W
         FyzA==
X-Forwarded-Encrypted: i=1; AJvYcCWXK7GB2wNGKMaud4Ab2j0t+5eq42zhADN/2CBzr2X+n9oMjO2fIQC0otB03IwmFknjd4sdRYEtE7UPL5YTUcfYZUIlZrHv4a307esB3zDC/oLnxNjpKdQMDYthLtcvPGfC9+VbT/NLO24PIiZ0YJWCtN3sDVZSNA==
X-Gm-Message-State: AOJu0YyO6hjwPa/O6wyYb8IxQQ8BwMxp7iHHe5RE8/50AiptO/8j1UxU
	JzJUbtixC637rATsTlrsbrSA1Q2hAop2pnQgrDS1P5uh/60ECGp+irgVk0aN
X-Google-Smtp-Source: AGHT+IF+k6EDEC5TlndQFlEFI46CiqTKLip+fjyqgK9pMQUYRRCGzERWQTf0G82WXK5WrbdSBKZ4+A==
X-Received: by 2002:a2e:854e:0:b0:2d0:9a93:1fe0 with SMTP id u14-20020a2e854e000000b002d09a931fe0mr6234553ljj.11.1708278639558;
        Sun, 18 Feb 2024 09:50:39 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a01-0c22-7b37-4900-0000-0000-0000-0e63.c22.pool.telefonica.de. [2a01:c22:7b37:4900::e63])
        by smtp.googlemail.com with ESMTPSA id ck8-20020a0564021c0800b0056452477a5esm829283edb.24.2024.02.18.09.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Feb 2024 09:50:39 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org
Cc: neil.armstrong@linaro.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1] drm/meson: improve encoder probe / initialization error handling
Date: Sun, 18 Feb 2024 18:50:35 +0100
Message-ID: <20240218175035.1948165-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240218_095042_094571_687FEE56 
X-CRM114-Status: GOOD (  18.32  )
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

Rename meson_encoder_{cvbs,dsi,hdmi}_init() to
meson_encoder_{cvbs,dsi,hdmi}_probe() so it's clear that these functions
are used at probe time during driver initialization. Also switch all
error prints inside those functions to use dev_err_probe() for
consistency.

This makes the code more straight forward to read and makes the error
prints within those functions consistent (by logging all -EPROBE_DEFER
with dev_dbg(), while actual errors are logged with dev_err() and get
the error value printed).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
This is meant to be applied on top of my other patch called
"drm/meson: Don't remove bridges which are created by other drivers" [0]


[0] https://lore.kernel.org/dri-devel/20240215220442.1343152-1-martin.blumenstingl@googlemail.com/


 drivers/gpu/drm/meson/meson_drv.c          |  6 +++---
 drivers/gpu/drm/meson/meson_encoder_cvbs.c | 24 ++++++++++------------
 drivers/gpu/drm/meson/meson_encoder_cvbs.h |  2 +-
 drivers/gpu/drm/meson/meson_encoder_dsi.c  | 23 +++++++++------------
 drivers/gpu/drm/meson/meson_encoder_dsi.h  |  2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 15 +++++++-------
 drivers/gpu/drm/meson/meson_encoder_hdmi.h |  2 +-
 7 files changed, 35 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index cb674966e9ac..17a5cca007e2 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -312,7 +312,7 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 
 	/* Encoder Initialization */
 
-	ret = meson_encoder_cvbs_init(priv);
+	ret = meson_encoder_cvbs_probe(priv);
 	if (ret)
 		goto exit_afbcd;
 
@@ -326,12 +326,12 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 		}
 	}
 
-	ret = meson_encoder_hdmi_init(priv);
+	ret = meson_encoder_hdmi_probe(priv);
 	if (ret)
 		goto exit_afbcd;
 
 	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
-		ret = meson_encoder_dsi_init(priv);
+		ret = meson_encoder_dsi_probe(priv);
 		if (ret)
 			goto exit_afbcd;
 	}
diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
index 3407450435e2..d1191de855d9 100644
--- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
+++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
@@ -219,7 +219,7 @@ static const struct drm_bridge_funcs meson_encoder_cvbs_bridge_funcs = {
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 };
 
-int meson_encoder_cvbs_init(struct meson_drm *priv)
+int meson_encoder_cvbs_probe(struct meson_drm *priv)
 {
 	struct drm_device *drm = priv->drm;
 	struct meson_encoder_cvbs *meson_encoder_cvbs;
@@ -240,10 +240,9 @@ int meson_encoder_cvbs_init(struct meson_drm *priv)
 
 	meson_encoder_cvbs->next_bridge = of_drm_find_bridge(remote);
 	of_node_put(remote);
-	if (!meson_encoder_cvbs->next_bridge) {
-		dev_err(priv->dev, "Failed to find CVBS Connector bridge\n");
-		return -EPROBE_DEFER;
-	}
+	if (!meson_encoder_cvbs->next_bridge)
+		return dev_err_probe(priv->dev, -EPROBE_DEFER,
+				     "Failed to find CVBS Connector bridge\n");
 
 	/* CVBS Encoder Bridge */
 	meson_encoder_cvbs->bridge.funcs = &meson_encoder_cvbs_bridge_funcs;
@@ -259,10 +258,9 @@ int meson_encoder_cvbs_init(struct meson_drm *priv)
 	/* Encoder */
 	ret = drm_simple_encoder_init(priv->drm, &meson_encoder_cvbs->encoder,
 				      DRM_MODE_ENCODER_TVDAC);
-	if (ret) {
-		dev_err(priv->dev, "Failed to init CVBS encoder: %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(priv->dev, ret,
+				     "Failed to init CVBS encoder\n");
 
 	meson_encoder_cvbs->encoder.possible_crtcs = BIT(0);
 
@@ -276,10 +274,10 @@ int meson_encoder_cvbs_init(struct meson_drm *priv)
 
 	/* Initialize & attach Bridge Connector */
 	connector = drm_bridge_connector_init(priv->drm, &meson_encoder_cvbs->encoder);
-	if (IS_ERR(connector)) {
-		dev_err(priv->dev, "Unable to create CVBS bridge connector\n");
-		return PTR_ERR(connector);
-	}
+	if (IS_ERR(connector))
+		return dev_err_probe(priv->dev, PTR_ERR(connector),
+				     "Unable to create CVBS bridge connector\n");
+
 	drm_connector_attach_encoder(connector, &meson_encoder_cvbs->encoder);
 
 	priv->encoders[MESON_ENC_CVBS] = meson_encoder_cvbs;
diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.h b/drivers/gpu/drm/meson/meson_encoder_cvbs.h
index 09710fec3c66..7b7bc85c03f7 100644
--- a/drivers/gpu/drm/meson/meson_encoder_cvbs.h
+++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.h
@@ -24,7 +24,7 @@ struct meson_cvbs_mode {
 /* Modes supported by the CVBS output */
 extern struct meson_cvbs_mode meson_cvbs_modes[MESON_CVBS_MODES_COUNT];
 
-int meson_encoder_cvbs_init(struct meson_drm *priv);
+int meson_encoder_cvbs_probe(struct meson_drm *priv);
 void meson_encoder_cvbs_remove(struct meson_drm *priv);
 
 #endif /* __MESON_VENC_CVBS_H */
diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
index 311b91630fbe..7816902f5907 100644
--- a/drivers/gpu/drm/meson/meson_encoder_dsi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
@@ -100,7 +100,7 @@ static const struct drm_bridge_funcs meson_encoder_dsi_bridge_funcs = {
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 };
 
-int meson_encoder_dsi_init(struct meson_drm *priv)
+int meson_encoder_dsi_probe(struct meson_drm *priv)
 {
 	struct meson_encoder_dsi *meson_encoder_dsi;
 	struct device_node *remote;
@@ -118,10 +118,9 @@ int meson_encoder_dsi_init(struct meson_drm *priv)
 	}
 
 	meson_encoder_dsi->next_bridge = of_drm_find_bridge(remote);
-	if (!meson_encoder_dsi->next_bridge) {
-		dev_dbg(priv->dev, "Failed to find DSI transceiver bridge\n");
-		return -EPROBE_DEFER;
-	}
+	if (!meson_encoder_dsi->next_bridge)
+		return dev_err_probe(priv->dev, -EPROBE_DEFER,
+				     "Failed to find DSI transceiver bridge\n");
 
 	/* DSI Encoder Bridge */
 	meson_encoder_dsi->bridge.funcs = &meson_encoder_dsi_bridge_funcs;
@@ -135,19 +134,17 @@ int meson_encoder_dsi_init(struct meson_drm *priv)
 	/* Encoder */
 	ret = drm_simple_encoder_init(priv->drm, &meson_encoder_dsi->encoder,
 				      DRM_MODE_ENCODER_DSI);
-	if (ret) {
-		dev_err(priv->dev, "Failed to init DSI encoder: %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(priv->dev, ret,
+				     "Failed to init DSI encoder\n");
 
 	meson_encoder_dsi->encoder.possible_crtcs = BIT(0);
 
 	/* Attach DSI Encoder Bridge to Encoder */
 	ret = drm_bridge_attach(&meson_encoder_dsi->encoder, &meson_encoder_dsi->bridge, NULL, 0);
-	if (ret) {
-		dev_err(priv->dev, "Failed to attach bridge: %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(priv->dev, ret,
+				     "Failed to attach bridge\n");
 
 	/*
 	 * We should have now in place:
diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.h b/drivers/gpu/drm/meson/meson_encoder_dsi.h
index 9277d7015193..85d5b61805f2 100644
--- a/drivers/gpu/drm/meson/meson_encoder_dsi.h
+++ b/drivers/gpu/drm/meson/meson_encoder_dsi.h
@@ -7,7 +7,7 @@
 #ifndef __MESON_ENCODER_DSI_H
 #define __MESON_ENCODER_DSI_H
 
-int meson_encoder_dsi_init(struct meson_drm *priv);
+int meson_encoder_dsi_probe(struct meson_drm *priv);
 void meson_encoder_dsi_remove(struct meson_drm *priv);
 
 #endif /* __MESON_ENCODER_DSI_H */
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index c4686568c9ca..22e07847a9a7 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -354,7 +354,7 @@ static const struct drm_bridge_funcs meson_encoder_hdmi_bridge_funcs = {
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 };
 
-int meson_encoder_hdmi_init(struct meson_drm *priv)
+int meson_encoder_hdmi_probe(struct meson_drm *priv)
 {
 	struct meson_encoder_hdmi *meson_encoder_hdmi;
 	struct platform_device *pdev;
@@ -374,8 +374,8 @@ int meson_encoder_hdmi_init(struct meson_drm *priv)
 
 	meson_encoder_hdmi->next_bridge = of_drm_find_bridge(remote);
 	if (!meson_encoder_hdmi->next_bridge) {
-		dev_err(priv->dev, "Failed to find HDMI transceiver bridge\n");
-		ret = -EPROBE_DEFER;
+		ret = dev_err_probe(priv->dev, -EPROBE_DEFER,
+				    "Failed to find HDMI transceiver bridge\n");
 		goto err_put_node;
 	}
 
@@ -393,7 +393,7 @@ int meson_encoder_hdmi_init(struct meson_drm *priv)
 	ret = drm_simple_encoder_init(priv->drm, &meson_encoder_hdmi->encoder,
 				      DRM_MODE_ENCODER_TMDS);
 	if (ret) {
-		dev_err(priv->dev, "Failed to init HDMI encoder: %d\n", ret);
+		dev_err_probe(priv->dev, ret, "Failed to init HDMI encoder\n");
 		goto err_put_node;
 	}
 
@@ -403,7 +403,7 @@ int meson_encoder_hdmi_init(struct meson_drm *priv)
 	ret = drm_bridge_attach(&meson_encoder_hdmi->encoder, &meson_encoder_hdmi->bridge, NULL,
 				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret) {
-		dev_err(priv->dev, "Failed to attach bridge: %d\n", ret);
+		dev_err_probe(priv->dev, ret, "Failed to attach bridge\n");
 		goto err_put_node;
 	}
 
@@ -411,8 +411,9 @@ int meson_encoder_hdmi_init(struct meson_drm *priv)
 	meson_encoder_hdmi->connector = drm_bridge_connector_init(priv->drm,
 							&meson_encoder_hdmi->encoder);
 	if (IS_ERR(meson_encoder_hdmi->connector)) {
-		dev_err(priv->dev, "Unable to create HDMI bridge connector\n");
-		ret = PTR_ERR(meson_encoder_hdmi->connector);
+		ret = dev_err_probe(priv->dev,
+				    PTR_ERR(meson_encoder_hdmi->connector),
+				    "Unable to create HDMI bridge connector\n");
 		goto err_put_node;
 	}
 	drm_connector_attach_encoder(meson_encoder_hdmi->connector,
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.h b/drivers/gpu/drm/meson/meson_encoder_hdmi.h
index a6cd38eb5f71..fd5485875db8 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.h
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.h
@@ -7,7 +7,7 @@
 #ifndef __MESON_ENCODER_HDMI_H
 #define __MESON_ENCODER_HDMI_H
 
-int meson_encoder_hdmi_init(struct meson_drm *priv);
+int meson_encoder_hdmi_probe(struct meson_drm *priv);
 void meson_encoder_hdmi_remove(struct meson_drm *priv);
 
 #endif /* __MESON_ENCODER_HDMI_H */
-- 
2.43.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
