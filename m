Return-Path: <SRS0=AMJk=PI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10AF8C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Oct 2021 12:41:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCC4F61355
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Oct 2021 12:41:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BCC4F61355
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dpEHLMRVb3UjnWisIPDFK9/bI+kQ9lDTz6jk3rTWSgM=; b=3EmPMhxGm3EhKh
	QVaq1PDIWUHk3yTg4zH5MdDCOUXtYSOJHosNlkTPwDrOo4gCcQgjWP9Zj19AN96beYFhUnlnV2VwY
	jWb1gdPx/TmIYq8g7F+qVLgBuijt58FnTLDGb4CiZM/B7UNfA68S1A1kV7+0j2dIXfdSMAshj32pI
	eHhoMOP8/LpaU9tjKjmaMX9odONed8JYF5VLtLy4wngwSXbS7Ca7qLeEhlS2VtPpejVH1UIJWdVDf
	lV0IdHvlRKF4TMQC/HJd4WL26UdoI9pQZobetOid4YN3EyZLVnHbSoR3rmkVc+vspH0c31bZrQv8L
	xIMi5A+w0Ek+Yj61Rcgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdAuK-004VYA-3K; Wed, 20 Oct 2021 12:41:24 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdAsv-004UqF-BD
 for linux-amlogic@lists.infradead.org; Wed, 20 Oct 2021 12:40:02 +0000
Received: by mail-wm1-x330.google.com with SMTP id g39so14532188wmp.3
 for <linux-amlogic@lists.infradead.org>; Wed, 20 Oct 2021 05:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=326SLwtQzES2hKKjA5RUtlRW9fb//6GCXyVhIKw2U9A=;
 b=Ni60kIWwHrOkCcMYZVaWhiO88VNILnqaXduVOWnXrGMLFZgleJ59/fpcCSCTs3N9bQ
 Gzn2hay9cLpV/G6UQ/k3aSiZF/y8ZU9ayfHOYuhj+iA/ixAgZM6UC223i8mUrxGabCs0
 EOKlbq9IJW3WPH09sOz8CaZOZz8J6Vd6q+uKPrc+T1L4cP8AVMqI9jvKkdSNY7x6D3FW
 KUw19l1VwQhJNgtPqb0R3iqoU4Ai2B8vKk9NylXENNLInOCza34v8bEBpAKS4uOyaesU
 7wxtKeTCoArUGNUKSwa0TPnKDCItOuChSkUHcOU6ZlJEsI/oo+8HLc9AtbvVX540232T
 eUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=326SLwtQzES2hKKjA5RUtlRW9fb//6GCXyVhIKw2U9A=;
 b=erKIR0hrFNIEkLyvVAYeLmeYjdDzTQnE8B3H6NjtNcnaDWz6m1n/oOww0HBXeGF/5l
 clCOpDAGgCWi89CY7ySTOamhmZ3goIRovnDxfj9K6GxnQAW0N1TrSRyPHKkuSbHvCxK1
 uXlcEaDLrHoAjYrP5p6R8yNjn0LlyI7E0+p9bGcuNq3iiWM0+VymMRTwXQLHjdVeGZsE
 iv7G7kXbgkY57rxyFOGRJ6csd1EQVn7S8XK/ucQnfe3/Fupm/TFWpYNILijUw2uJFdbn
 5/gTcJfBHzG073RQ+v0YI2euX7SyhNPykiWD/po3yHg5zyL87Q0ph4bj3LNlJSXN1GpO
 /aWA==
X-Gm-Message-State: AOAM530I693s6+STbjSclUXiMkqLet2AeArUL+1sKELGOqfM/o14FpBp
 UVvuOkU/8YIN/mCDVhe603JPSpkJOM/iFw==
X-Google-Smtp-Source: ABdhPJxvmIEsttfH1+nt8uAOIN9xvKFHk51uxHMYTHiM+PyXu4ZkqdgfBXl+OQajjFgwa03WzCVjhA==
X-Received: by 2002:a1c:e906:: with SMTP id q6mr13509042wmc.126.1634733595967; 
 Wed, 20 Oct 2021 05:39:55 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:d31f:1512:8915:e439])
 by smtp.gmail.com with ESMTPSA id b19sm5342680wmj.9.2021.10.20.05.39.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 05:39:55 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	Laurent.pinchart@ideasonboard.com,
	sam@ravnborg.org
Cc: martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 5/6] drm/meson: rename venc_cvbs to encoder_cvbs
Date: Wed, 20 Oct 2021 14:39:46 +0200
Message-Id: <20211020123947.2585572-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020123947.2585572-1-narmstrong@baylibre.com>
References: <20211020123947.2585572-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9605; h=from:subject;
 bh=O0XW2nrHQ+cAOx1/yhSNCSabduVbNxlUGFgrwYwQklc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhcA347XUZkTgPulTyfsQGamNZBeQCEWUfMCySaK8J
 7a3ti5KJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYXAN+AAKCRB33NvayMhJ0clTEA
 CWb+VNl7i1btlvQR9bJR1mXE8fFslqXNfChDo6y84i/MIN2HEsE9aJUbnr/mHTNlMuqlcKi2yHUCVr
 UKfZSfs1LfpLIIXfK4zbcK/4CGnV0P+N3w8gDjtDlrioa6Jyy7GAf+E+NA5v4O8ol1d+s3qNlQat4V
 5l37XE+iT3FF2GZTTl9Pd8CdoGgae86mTk231YqIXxpH+YxZ7iRhF9XA2JBXnxVN70V+hYfIXnaGFD
 skdYs0jcGmjAL/yX1+lvzoyj4FkhC65pjqP06AJAEpYGSumGTwvmSyiYj3cMVtvVHRoeY5NUdgT509
 ybM0kuJufSGH+JyJXQO+goI8h/GWMW2q9kQ6ohtFb/YX5t2GFflv5kdQSRYW0LRDvs4lIO0tO5tHHJ
 mDKNtQCnoPFqofUexloczC74KTNrZ0roVy1WMWgRICaNZIUQ7i8vWFyHKFwCHUtTlJQ6SzC+4hFa3/
 xg/HnAbO6/gL+z2k1I/GKiW54y1oGy++Kns8cLI1KP7VUiehLgd0lfLd8nmIXDWer9KxZObbBLp1ml
 GNK/7Qz6+wX2WTDO4UF/eGtpacGhNNjKMGPlTeNCiPaaDtZE2pGV9SyyAzKKslcUofJrgYdlWA8WdV
 +V/sIVm2nIzv7221IPhV+iMS+JsQAFtKbc3aBWhuA06/2cfKpT0qNa9Z0zlA==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_053957_461972_DA73EBCB 
X-CRM114-Status: GOOD (  19.13  )
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
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
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
