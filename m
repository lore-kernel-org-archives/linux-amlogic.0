Return-Path: <SRS0=WmWE=PD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B1C4C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Oct 2021 14:26:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 249AB610E5
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Oct 2021 14:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 249AB610E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qs9exKaVmfqxt+GoYvIfjTB8iXA0VbvR44MJ8xJyo/M=; b=4p6S6XRc5Idvi/
	TJFbcv/pYTXuLoBFcVDyj0imTQhhwfsGMHgI0kW1AmHuCS59bnb6UnZc2pgZZ2xcUJPROkK3DS43S
	FHtcweM2TuQlXTRI2Tx72Hxq2m+1B0mUB/BMXIH7DMbX+YKZhHJJHqq3f4dYN+YEpxjIN3g+ClLA8
	YNuEVJ3Mx/PXdHfhrpRC1+SRoQlqbdbxHQ69jzaY8GNhevgeUav8fIY0OIi7E0f3El4pKsNVJtT+L
	TAQQPH7tIUHv3FBxD42gmleZfeOHnnmCyg6GOI9SU2tfJsUcL8jOtPMyutaDFdmKYPDOFbYvx3DIy
	L0GZadPesCb8ietIXI5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbOA3-007aAh-8X; Fri, 15 Oct 2021 14:26:15 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbNvZ-007TtI-JK
 for linux-amlogic@lists.infradead.org; Fri, 15 Oct 2021 14:11:26 +0000
Received: by mail-wm1-x332.google.com with SMTP id m42so2683199wms.2
 for <linux-amlogic@lists.infradead.org>; Fri, 15 Oct 2021 07:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IgKXKmA5jh1M5/JgrkIpFJaHLpsPQ9KGW4RlhoyxOss=;
 b=fhA0dG6vZ4+WhOLwZNl/55nHDixFR5lRe2/gCw2IYrxI91+w9Uzz2SdQqH8cp0emD1
 l3F1j+Egs9HDi6kb7s1Lp28+rZ58qhxtvBHVSp1G0KJqfKjws5sdvsr7sFMHTrQLJAaW
 erDdRgmEh9f1LzZ8soLG4MM5ieYVKWdpfyyuh8MhD4d/K+AARYpleejlJKDnDV34ZO24
 HzGppC5iAp9uMvj6tWt1FOWLhz21sIK8X+W2k0d39E7RpkGlns9WNFModOmfwBeiegn5
 w1aUf9Gs09bUoiaN6kf4Q+MDNb677TbZaTemKKyQnMeP5iVAswHQfdOkmWFnVzVpyspH
 OxMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IgKXKmA5jh1M5/JgrkIpFJaHLpsPQ9KGW4RlhoyxOss=;
 b=54rDJ5oJIo+u1aGcyiYf+wlDN6OfqmV9wSZiEENaBKH1mmjiB6t88JgLgESI45AJo5
 9ok4Ium4K7H0jHmCKY8q/rWnqHZ4ts5vHMUq6xdJijBfbcLJ9Zs8Ue/g01vumPXo4y3s
 dAtG8O40euTYsqEYOBhwfEFDSl7EE9ZD1vFplAKnFg+c5yAXfl6LpKbceMl960+g54nA
 LmKFm1YdaSg5DsjV0TF5sKtcTHdk4Sc5od1lgAbJQ2rYcuou9UehTOFHjdZvQaQZu1fN
 xvav1igLtvmqQuJBEWcSdl1pELyJ+q2orbKIHTIOKxCUpoBLneciE5YhJBOVEUQrLPQ8
 eUNA==
X-Gm-Message-State: AOAM533SnHkl+JyEmB0naQeNOQr7V0pqJ4nEdEQKm5tC+dlQkgO82y3X
 Bli5zTIOeFpyuI+PBfhKi6lOsA==
X-Google-Smtp-Source: ABdhPJwPb0s9K4vZNxnAXhBpo4Mx9GD9ZvaVXLe0eJi9wl2naslgcW0ZHYt4HRH7dDyR7rAahQj4Cw==
X-Received: by 2002:a05:600c:208:: with SMTP id
 8mr25648509wmi.173.1634307075917; 
 Fri, 15 Oct 2021 07:11:15 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:f6e3:13bd:45ae:5eeb])
 by smtp.gmail.com with ESMTPSA id f15sm4971434wrt.38.2021.10.15.07.11.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 07:11:15 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	Laurent.pinchart@ideasonboard.com,
	sam@ravnborg.org
Cc: martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 5/6] drm/meson: rename venc_cvbs to encoder_cvbs
Date: Fri, 15 Oct 2021 16:11:06 +0200
Message-Id: <20211015141107.2430800-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015141107.2430800-1-narmstrong@baylibre.com>
References: <20211015141107.2430800-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9537; h=from:subject;
 bh=GO9vyBjaiEs4l+N+Oo/xmB70F6vIdoW18+YDeab6GsA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhaYolVTuEQKmLI0wqTtDiIed6Z4ESxlQRX+EHzgi5
 cvwDzBSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYWmKJQAKCRB33NvayMhJ0VmcEA
 C0hRvFwkCJirT4RJ3SNzUzE/U5RZZp1QTGF8cndgM7Z2bkQIeUDDFKY4jJBK9fwDYkPkY3La8s55ZW
 Et0VxbW33tZeX8t7UGCuc2EpC+wwCCVqYceTVnVA+jE2Uroe5yLZbtD3RlwH0CQF3pjqmeiAGRil2I
 3WZDiojTBpbdB4dwPrhf1KME+7JgNxaKnvXH+K/Mz9eyPjzsl3hdnBcqG54qz3j0JKmBSASyCg3vy1
 CN2RKh5FWnjuI8OrsWQWAfsUwir6Ike/3agwqch+H54i98gkhNysZPHePbwrEqjQFCaSG5FGE4Odkx
 WffsiIWs7xph5QKBs6ao+Auj91Wcbc/FVVSGoQGAjt34bi+JUT8ttNRBu66b2BJ5fQsDTwblgKkzpg
 aGKeFkzaWMxqI6bUXM9o/q8BBfpAetkmXZeQpCxUkOsS+ZaYe/ImruP/DHz26bw2Gw8jxkvqy+W2gK
 ri5XpVEcdQKQ5ffdEPE+6oW69ncGKH2Hm53zjyyWa6UNytNAxbm1x4wF7vOrc9KOyDkI4RBib9i20r
 1sBpdZJMoECHNvE1cluRBUNAD5cdzIp9iqkAcLSmZ+9IXQeaw1PZZJaaT9PmOfl3DlggAojHCI7hI3
 qTrw6Mn7pAAo/xx4qGhTn9J2+OE4HpkvCG4bsIvYqokr8FmksZbRV1v607nA==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_071117_731396_494BBEE3 
X-CRM114-Status: GOOD (  18.94  )
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

Rename the cvbs encoder to match the newly introduced meson_encoder_hdmi.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/meson/Makefile                |  2 +-
 drivers/gpu/drm/meson/meson_drv.c             |  4 +-
 ...meson_venc_cvbs.c => meson_encoder_cvbs.c} | 78 +++++++++----------
 ...meson_venc_cvbs.h => meson_encoder_cvbs.h} |  2 +-
 4 files changed, 43 insertions(+), 43 deletions(-)
 rename drivers/gpu/drm/meson/{meson_venc_cvbs.c => meson_encoder_cvbs.c} (74%)
 rename drivers/gpu/drm/meson/{meson_venc_cvbs.h => meson_encoder_cvbs.h} (92%)

diff --git a/drivers/gpu/drm/meson/Makefile b/drivers/gpu/drm/meson/Makefile
index 523fce45f16b..3afa31bdc950 100644
--- a/drivers/gpu/drm/meson/Makefile
+++ b/drivers/gpu/drm/meson/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-meson-drm-y := meson_drv.o meson_plane.o meson_crtc.o meson_venc_cvbs.o
+meson-drm-y := meson_drv.o meson_plane.o meson_crtc.o meson_encoder_cvbs.o
 meson-drm-y += meson_viu.o meson_vpp.o meson_venc.o meson_vclk.o meson_overlay.o
 meson-drm-y += meson_rdma.o meson_osd_afbcd.o
 meson-drm-y += meson_encoder_hdmi.o
diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 0978b440f336..80f1d439841a 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -31,7 +31,7 @@
 #include "meson_plane.h"
 #include "meson_osd_afbcd.h"
 #include "meson_registers.h"
-#include "meson_venc_cvbs.h"
+#include "meson_encoder_cvbs.h"
 #include "meson_encoder_hdmi.h"
 #include "meson_viu.h"
 #include "meson_vpp.h"
@@ -307,7 +307,7 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 
 	/* Encoder Initialization */
 
-	ret = meson_venc_cvbs_create(priv);
+	ret = meson_encoder_cvbs_init(priv);
 	if (ret)
 		goto free_drm;
 
diff --git a/drivers/gpu/drm/meson/meson_venc_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
similarity index 74%
rename from drivers/gpu/drm/meson/meson_venc_cvbs.c
rename to drivers/gpu/drm/meson/meson_encoder_cvbs.c
index f1747fde1fe0..01024c5f610c 100644
--- a/drivers/gpu/drm/meson/meson_venc_cvbs.c
+++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
@@ -20,7 +20,7 @@
 
 #include "meson_registers.h"
 #include "meson_vclk.h"
-#include "meson_venc_cvbs.h"
+#include "meson_encoder_cvbs.h"
 
 /* HHI VDAC Registers */
 #define HHI_VDAC_CNTL0		0x2F4 /* 0xbd offset in data sheet */
@@ -28,16 +28,16 @@
 #define HHI_VDAC_CNTL1		0x2F8 /* 0xbe offset in data sheet */
 #define HHI_VDAC_CNTL1_G12A	0x2F0 /* 0xbe offset in data sheet */
 
-struct meson_venc_cvbs {
+struct meson_encoder_cvbs {
 	struct drm_encoder	encoder;
 	struct drm_connector	connector;
 	struct meson_drm	*priv;
 };
-#define encoder_to_meson_venc_cvbs(x) \
-	container_of(x, struct meson_venc_cvbs, encoder)
+#define encoder_to_meson_encoder_cvbs(x) \
+	container_of(x, struct meson_encoder_cvbs, encoder)
 
-#define connector_to_meson_venc_cvbs(x) \
-	container_of(x, struct meson_venc_cvbs, connector)
+#define connector_to_meson_encoder_cvbs(x) \
+	container_of(x, struct meson_encoder_cvbs, connector)
 
 /* Supported Modes */
 
@@ -140,16 +140,16 @@ struct drm_connector_helper_funcs meson_cvbs_connector_helper_funcs = {
 
 /* Encoder */
 
-static void meson_venc_cvbs_encoder_destroy(struct drm_encoder *encoder)
+static void meson_encoder_cvbs_encoder_destroy(struct drm_encoder *encoder)
 {
 	drm_encoder_cleanup(encoder);
 }
 
-static const struct drm_encoder_funcs meson_venc_cvbs_encoder_funcs = {
-	.destroy        = meson_venc_cvbs_encoder_destroy,
+static const struct drm_encoder_funcs meson_encoder_cvbs_encoder_funcs = {
+	.destroy        = meson_encoder_cvbs_encoder_destroy,
 };
 
-static int meson_venc_cvbs_encoder_atomic_check(struct drm_encoder *encoder,
+static int meson_encoder_cvbs_encoder_atomic_check(struct drm_encoder *encoder,
 					struct drm_crtc_state *crtc_state,
 					struct drm_connector_state *conn_state)
 {
@@ -159,11 +159,11 @@ static int meson_venc_cvbs_encoder_atomic_check(struct drm_encoder *encoder,
 	return -EINVAL;
 }
 
-static void meson_venc_cvbs_encoder_disable(struct drm_encoder *encoder)
+static void meson_encoder_cvbs_encoder_disable(struct drm_encoder *encoder)
 {
-	struct meson_venc_cvbs *meson_venc_cvbs =
-					encoder_to_meson_venc_cvbs(encoder);
-	struct meson_drm *priv = meson_venc_cvbs->priv;
+	struct meson_encoder_cvbs *meson_encoder_cvbs =
+					encoder_to_meson_encoder_cvbs(encoder);
+	struct meson_drm *priv = meson_encoder_cvbs->priv;
 
 	/* Disable CVBS VDAC */
 	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
@@ -175,11 +175,11 @@ static void meson_venc_cvbs_encoder_disable(struct drm_encoder *encoder)
 	}
 }
 
-static void meson_venc_cvbs_encoder_enable(struct drm_encoder *encoder)
+static void meson_encoder_cvbs_encoder_enable(struct drm_encoder *encoder)
 {
-	struct meson_venc_cvbs *meson_venc_cvbs =
-					encoder_to_meson_venc_cvbs(encoder);
-	struct meson_drm *priv = meson_venc_cvbs->priv;
+	struct meson_encoder_cvbs *meson_encoder_cvbs =
+					encoder_to_meson_encoder_cvbs(encoder);
+	struct meson_drm *priv = meson_encoder_cvbs->priv;
 
 	/* VDAC0 source is not from ATV */
 	writel_bits_relaxed(VENC_VDAC_SEL_ATV_DMD, 0,
@@ -198,14 +198,14 @@ static void meson_venc_cvbs_encoder_enable(struct drm_encoder *encoder)
 	}
 }
 
-static void meson_venc_cvbs_encoder_mode_set(struct drm_encoder *encoder,
+static void meson_encoder_cvbs_encoder_mode_set(struct drm_encoder *encoder,
 				   struct drm_display_mode *mode,
 				   struct drm_display_mode *adjusted_mode)
 {
 	const struct meson_cvbs_mode *meson_mode = meson_cvbs_get_mode(mode);
-	struct meson_venc_cvbs *meson_venc_cvbs =
-					encoder_to_meson_venc_cvbs(encoder);
-	struct meson_drm *priv = meson_venc_cvbs->priv;
+	struct meson_encoder_cvbs *meson_encoder_cvbs =
+					encoder_to_meson_encoder_cvbs(encoder);
+	struct meson_drm *priv = meson_encoder_cvbs->priv;
 
 	if (meson_mode) {
 		meson_venci_cvbs_mode_set(priv, meson_mode->enci);
@@ -219,14 +219,14 @@ static void meson_venc_cvbs_encoder_mode_set(struct drm_encoder *encoder,
 }
 
 static const struct drm_encoder_helper_funcs
-				meson_venc_cvbs_encoder_helper_funcs = {
-	.atomic_check	= meson_venc_cvbs_encoder_atomic_check,
-	.disable	= meson_venc_cvbs_encoder_disable,
-	.enable		= meson_venc_cvbs_encoder_enable,
-	.mode_set	= meson_venc_cvbs_encoder_mode_set,
+				meson_encoder_cvbs_encoder_helper_funcs = {
+	.atomic_check	= meson_encoder_cvbs_encoder_atomic_check,
+	.disable	= meson_encoder_cvbs_encoder_disable,
+	.enable		= meson_encoder_cvbs_encoder_enable,
+	.mode_set	= meson_encoder_cvbs_encoder_mode_set,
 };
 
-static bool meson_venc_cvbs_connector_is_available(struct meson_drm *priv)
+static bool meson_encoder_cvbs_connector_is_available(struct meson_drm *priv)
 {
 	struct device_node *remote;
 
@@ -238,27 +238,27 @@ static bool meson_venc_cvbs_connector_is_available(struct meson_drm *priv)
 	return true;
 }
 
-int meson_venc_cvbs_create(struct meson_drm *priv)
+int meson_encoder_cvbs_init(struct meson_drm *priv)
 {
 	struct drm_device *drm = priv->drm;
-	struct meson_venc_cvbs *meson_venc_cvbs;
+	struct meson_encoder_cvbs *meson_encoder_cvbs;
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
 	int ret;
 
-	if (!meson_venc_cvbs_connector_is_available(priv)) {
+	if (!meson_encoder_cvbs_connector_is_available(priv)) {
 		dev_info(drm->dev, "CVBS Output connector not available\n");
 		return 0;
 	}
 
-	meson_venc_cvbs = devm_kzalloc(priv->dev, sizeof(*meson_venc_cvbs),
+	meson_encoder_cvbs = devm_kzalloc(priv->dev, sizeof(*meson_encoder_cvbs),
 				       GFP_KERNEL);
-	if (!meson_venc_cvbs)
+	if (!meson_encoder_cvbs)
 		return -ENOMEM;
 
-	meson_venc_cvbs->priv = priv;
-	encoder = &meson_venc_cvbs->encoder;
-	connector = &meson_venc_cvbs->connector;
+	meson_encoder_cvbs->priv = priv;
+	encoder = &meson_encoder_cvbs->encoder;
+	connector = &meson_encoder_cvbs->connector;
 
 	/* Connector */
 
@@ -276,10 +276,10 @@ int meson_venc_cvbs_create(struct meson_drm *priv)
 
 	/* Encoder */
 
-	drm_encoder_helper_add(encoder, &meson_venc_cvbs_encoder_helper_funcs);
+	drm_encoder_helper_add(encoder, &meson_encoder_cvbs_encoder_helper_funcs);
 
-	ret = drm_encoder_init(drm, encoder, &meson_venc_cvbs_encoder_funcs,
-			       DRM_MODE_ENCODER_TVDAC, "meson_venc_cvbs");
+	ret = drm_encoder_init(drm, encoder, &meson_encoder_cvbs_encoder_funcs,
+			       DRM_MODE_ENCODER_TVDAC, "meson_encoder_cvbs");
 	if (ret) {
 		dev_err(priv->dev, "Failed to init CVBS encoder\n");
 		return ret;
diff --git a/drivers/gpu/drm/meson/meson_venc_cvbs.h b/drivers/gpu/drm/meson/meson_encoder_cvbs.h
similarity index 92%
rename from drivers/gpu/drm/meson/meson_venc_cvbs.h
rename to drivers/gpu/drm/meson/meson_encoder_cvbs.h
index ab7f76ba469c..61d9d183ce7f 100644
--- a/drivers/gpu/drm/meson/meson_venc_cvbs.h
+++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.h
@@ -24,6 +24,6 @@ struct meson_cvbs_mode {
 /* Modes supported by the CVBS output */
 extern struct meson_cvbs_mode meson_cvbs_modes[MESON_CVBS_MODES_COUNT];
 
-int meson_venc_cvbs_create(struct meson_drm *priv);
+int meson_encoder_cvbs_init(struct meson_drm *priv);
 
 #endif /* __MESON_VENC_CVBS_H */
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
