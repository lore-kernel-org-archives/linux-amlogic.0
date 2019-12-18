Return-Path: <SRS0=A4ao=2I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD541C2D0CD
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Dec 2019 15:47:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EC7620684
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Dec 2019 15:47:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jz3J4ymQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="D7SdX6mx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EC7620684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uFTjk1mGgHBvLOy3JB1Sgs9oIRw6Sg1BLo0zSkwDog8=; b=Jz3J4ymQilVVYV
	YqUeTSIZpSVn3Qf1eyxQfslsAc/3cNEWTQaSm4x6A5o65DZQni2ANt/GhDjZtg6fVtqHhaEWJrZWE
	uAfzXND+Mf/6wOkk22RP1ERA4YYKxpitPaiq8TrcAzR6sfcVwtKQBihMoxrzSIqWg4FU1oLLsIQF2
	60Hws+zGG2SSzDe33zn8u2piQLHTreb6iO5c3MYKbsNwm4FkdYOpFEqMeaB2JHfeFf7982dPzZG9+
	LOsp6/LJcqYKmmEyfGt66rQuF5utZpG6juKYAPDLkDCpNjcaI78A5tfcUUBG49lpoqzBLpOS6KMOD
	brRhRtqHtED7biAxl6FA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihbXO-0008El-BL; Wed, 18 Dec 2019 15:46:58 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihbXD-00080z-Hi
 for linux-amlogic@lists.infradead.org; Wed, 18 Dec 2019 15:46:49 +0000
Received: by mail-wm1-x343.google.com with SMTP id t14so2415033wmi.5
 for <linux-amlogic@lists.infradead.org>; Wed, 18 Dec 2019 07:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i65pvNIPiWBKdak58AV7JLUyNgUSd6fQ4UWjmRJnjgY=;
 b=D7SdX6mxCL+h8Pr+SnCWWRV9EGwV7JhgPVWwusuLJsF0ydrwd/Eh5WluMCbXPq7Rcf
 RIqF5e56aK91BCDo76zmuTil/Tt+aaOvEQNaEzFI8qRbO+qjYDOfGlx/NDItzw3bCLZY
 JLlLdUfWsDtyU+/uojagGdr/mmOLcaOuIO1gAtzmNcw6brhR0nSJKa0oKEyJ9svnoBDt
 wtvnhhTNIvWYK3hIlcQ0MSqg+Ug9zOuM6i+i/8XBilwiUZneL4NX9bERv7fvUpHYq5Ou
 wDDoSGthOyQuBU4vZhnLqj1uVLZwe/jrnYCdWJNwiOmOVQsLPYWTxZ5wr9DZ8RBv70R+
 G5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i65pvNIPiWBKdak58AV7JLUyNgUSd6fQ4UWjmRJnjgY=;
 b=c9u1osJtbS/PDTLJ5ENK5s50BBc+ZM/zEPkFlba2mei53aHVLrucndmgVuJDXArOCI
 OxfnIxb1P7zd+zcEoZyM8aYQY2hRboltntk4CUTA/Rz2HHsNnRAbhDgPyOY61qixYEH2
 CUb96vG8u2ic8qAoe2uogUhlKB2O8LMfmcFzQCwWM7Nsqja2VXXEGezzpf6aY/W+H214
 F7oqaEU4GirT6XfB/F80WkOplJfoSGWxBt65J2kqNoJMJ+k5O2cZIvwX0HMYsX9YhOjy
 N6rZuXQvwQ19xEoPmPnAXCkgm+3sVxfmxtXcX2Z7CTT4EG/EwdaDYxjtNjz/yVRrkKPr
 cpPw==
X-Gm-Message-State: APjAAAVXIOVKNawVXNkrhOdpQ7BkONbqFFRF9xm9LWlNUTBf8xHY2xrK
 m5rV/jX5C+1buw/c3ColpY78aQ==
X-Google-Smtp-Source: APXvYqxCnVXln0mX8X9TDTIsDdvLKVUMkeAbyy4/EIKV4lPxJrPtnbWh61eduHV2VK3QhgQ0dBPSdA==
X-Received: by 2002:a05:600c:149:: with SMTP id
 w9mr3893035wmm.132.1576684006154; 
 Wed, 18 Dec 2019 07:46:46 -0800 (PST)
Received: from bender.baylibre.local
 (lfbn-nic-1-505-157.w90-116.abo.wanadoo.fr. [90.116.92.157])
 by smtp.gmail.com with ESMTPSA id x1sm2891492wru.50.2019.12.18.07.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 07:46:45 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH v3 06/10] drm/meson: meson_dw_hdmi: add bridge and switch to
 drm_bridge_funcs
Date: Wed, 18 Dec 2019 16:46:33 +0100
Message-Id: <20191218154637.17509-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191218154637.17509-1-narmstrong@baylibre.com>
References: <20191218154637.17509-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_074647_617342_0B59E81D 
X-CRM114-Status: GOOD (  14.73  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Switch the dw-hdmi driver to drm_bridge_funcs by implementing a new local
bridge, connecting it to the dw-hdmi bridge, then implement the
atomic_get_input_bus_fmts/atomic_get_output_bus_fmts.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 98 ++++++++++++++++++++++-----
 1 file changed, 80 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 3bb7ffe5fc39..8729575777d5 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -16,6 +16,7 @@
 
 #include <drm/bridge/dw_hdmi.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
 #include <drm/drm_device.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_probe_helper.h>
@@ -135,6 +136,7 @@ struct meson_dw_hdmi_data {
 
 struct meson_dw_hdmi {
 	struct drm_encoder encoder;
+	struct drm_bridge bridge;
 	struct dw_hdmi_plat_data dw_plat_data;
 	struct meson_drm *priv;
 	struct device *dev;
@@ -151,6 +153,8 @@ struct meson_dw_hdmi {
 };
 #define encoder_to_meson_dw_hdmi(x) \
 	container_of(x, struct meson_dw_hdmi, encoder)
+#define bridge_to_meson_dw_hdmi(x) \
+	container_of(x, struct meson_dw_hdmi, bridge)
 
 static inline int dw_hdmi_is_compatible(struct meson_dw_hdmi *dw_hdmi,
 					const char *compat)
@@ -368,7 +372,7 @@ static inline void meson_dw_hdmi_phy_reset(struct meson_dw_hdmi *dw_hdmi)
 }
 
 static void dw_hdmi_set_vclk(struct meson_dw_hdmi *dw_hdmi,
-			     struct drm_display_mode *mode)
+			     const struct drm_display_mode *mode)
 {
 	struct meson_drm *priv = dw_hdmi->priv;
 	int vic = drm_match_cea_mode(mode);
@@ -663,6 +667,10 @@ dw_hdmi_mode_valid(struct drm_connector *connector,
 
 /* Encoder */
 
+static const u32 meson_dw_hdmi_out_bus_fmts[] = {
+	MEDIA_BUS_FMT_YUV8_1X24,
+};
+
 static void meson_venc_hdmi_encoder_destroy(struct drm_encoder *encoder)
 {
 	drm_encoder_cleanup(encoder);
@@ -672,16 +680,63 @@ static const struct drm_encoder_funcs meson_venc_hdmi_encoder_funcs = {
 	.destroy        = meson_venc_hdmi_encoder_destroy,
 };
 
-static int meson_venc_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
+static u32 *
+meson_venc_hdmi_encoder_get_out_bus_fmts(struct drm_bridge *bridge,
+					 struct drm_bridge_state *bridge_state,
+					 struct drm_crtc_state *crtc_state,
+					 struct drm_connector_state *conn_state,
+					 unsigned int *num_output_fmts)
+{
+	u32 *output_fmts;
+
+	*num_output_fmts = ARRAY_SIZE(meson_dw_hdmi_out_bus_fmts);
+	output_fmts = kcalloc(*num_output_fmts, sizeof(*output_fmts),
+			      GFP_KERNEL);
+	if (!output_fmts)
+		return NULL;
+
+	memcpy(output_fmts, meson_dw_hdmi_out_bus_fmts, *num_output_fmts);
+
+	return output_fmts;
+}
+
+static u32 *
+meson_venc_hdmi_encoder_get_inp_bus_fmts(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state,
+					u32 output_fmt,
+					unsigned int *num_input_fmts)
+{
+	u32 *input_fmts = NULL;
+
+	if (output_fmt == meson_dw_hdmi_out_bus_fmts[0]) {
+		*num_input_fmts = 1;
+		input_fmts = kcalloc(*num_input_fmts,
+				     sizeof(*input_fmts),
+				     GFP_KERNEL);
+		if (!input_fmts)
+			return NULL;
+
+		input_fmts[0] = output_fmt;
+	} else {
+		*num_input_fmts = 0;
+	}
+
+	return input_fmts;
+}
+
+static int meson_venc_hdmi_encoder_atomic_check(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
 					struct drm_crtc_state *crtc_state,
 					struct drm_connector_state *conn_state)
 {
 	return 0;
 }
 
-static void meson_venc_hdmi_encoder_disable(struct drm_encoder *encoder)
+static void meson_venc_hdmi_encoder_disable(struct drm_bridge *bridge)
 {
-	struct meson_dw_hdmi *dw_hdmi = encoder_to_meson_dw_hdmi(encoder);
+	struct meson_dw_hdmi *dw_hdmi = bridge_to_meson_dw_hdmi(bridge);
 	struct meson_drm *priv = dw_hdmi->priv;
 
 	DRM_DEBUG_DRIVER("\n");
@@ -693,9 +748,9 @@ static void meson_venc_hdmi_encoder_disable(struct drm_encoder *encoder)
 	writel_relaxed(0, priv->io_base + _REG(ENCP_VIDEO_EN));
 }
 
-static void meson_venc_hdmi_encoder_enable(struct drm_encoder *encoder)
+static void meson_venc_hdmi_encoder_enable(struct drm_bridge *bridge)
 {
-	struct meson_dw_hdmi *dw_hdmi = encoder_to_meson_dw_hdmi(encoder);
+	struct meson_dw_hdmi *dw_hdmi = bridge_to_meson_dw_hdmi(bridge);
 	struct meson_drm *priv = dw_hdmi->priv;
 
 	DRM_DEBUG_DRIVER("%s\n", priv->venc.hdmi_use_enci ? "VENCI" : "VENCP");
@@ -706,11 +761,11 @@ static void meson_venc_hdmi_encoder_enable(struct drm_encoder *encoder)
 		writel_relaxed(1, priv->io_base + _REG(ENCP_VIDEO_EN));
 }
 
-static void meson_venc_hdmi_encoder_mode_set(struct drm_encoder *encoder,
-				   struct drm_display_mode *mode,
-				   struct drm_display_mode *adjusted_mode)
+static void meson_venc_hdmi_encoder_mode_set(struct drm_bridge *bridge,
+				   const struct drm_display_mode *mode,
+				   const struct drm_display_mode *adjusted_mode)
 {
-	struct meson_dw_hdmi *dw_hdmi = encoder_to_meson_dw_hdmi(encoder);
+	struct meson_dw_hdmi *dw_hdmi = bridge_to_meson_dw_hdmi(bridge);
 	struct meson_drm *priv = dw_hdmi->priv;
 	int vic = drm_match_cea_mode(mode);
 
@@ -726,11 +781,12 @@ static void meson_venc_hdmi_encoder_mode_set(struct drm_encoder *encoder,
 	writel_relaxed(0, priv->io_base + _REG(VPU_HDMI_FMT_CTRL));
 }
 
-static const struct drm_encoder_helper_funcs
-				meson_venc_hdmi_encoder_helper_funcs = {
-	.atomic_check	= meson_venc_hdmi_encoder_atomic_check,
-	.disable	= meson_venc_hdmi_encoder_disable,
+static const struct drm_bridge_funcs meson_venc_hdmi_encoder_bridge_funcs = {
 	.enable		= meson_venc_hdmi_encoder_enable,
+	.disable	= meson_venc_hdmi_encoder_disable,
+	.atomic_check	= meson_venc_hdmi_encoder_atomic_check,
+	.atomic_get_output_bus_fmts = meson_venc_hdmi_encoder_get_out_bus_fmts,
+	.atomic_get_input_bus_fmts = meson_venc_hdmi_encoder_get_inp_bus_fmts,
 	.mode_set	= meson_venc_hdmi_encoder_mode_set,
 };
 
@@ -852,6 +908,7 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 	struct drm_device *drm = data;
 	struct meson_drm *priv = drm->dev_private;
 	struct dw_hdmi_plat_data *dw_plat_data;
+	struct drm_bridge *next_bridge;
 	struct drm_encoder *encoder;
 	struct resource *res;
 	int irq;
@@ -953,8 +1010,6 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 
 	/* Encoder */
 
-	drm_encoder_helper_add(encoder, &meson_venc_hdmi_encoder_helper_funcs);
-
 	ret = drm_encoder_init(drm, encoder, &meson_venc_hdmi_encoder_funcs,
 			       DRM_MODE_ENCODER_TMDS, "meson_hdmi");
 	if (ret) {
@@ -962,6 +1017,9 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 		return ret;
 	}
 
+	meson_dw_hdmi->bridge.funcs = &meson_venc_hdmi_encoder_bridge_funcs;
+	drm_bridge_attach(encoder, &meson_dw_hdmi->bridge, NULL);
+
 	encoder->possible_crtcs = BIT(0);
 
 	DRM_DEBUG_DRIVER("encoder initialized\n");
@@ -984,11 +1042,15 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 
 	platform_set_drvdata(pdev, meson_dw_hdmi);
 
-	meson_dw_hdmi->hdmi = dw_hdmi_bind(pdev, encoder,
-					   &meson_dw_hdmi->dw_plat_data);
+	meson_dw_hdmi->hdmi = dw_hdmi_probe(pdev,
+					    &meson_dw_hdmi->dw_plat_data);
 	if (IS_ERR(meson_dw_hdmi->hdmi))
 		return PTR_ERR(meson_dw_hdmi->hdmi);
 
+	next_bridge = of_drm_find_bridge(pdev->dev.of_node);
+	if (next_bridge)
+		drm_bridge_attach(encoder, next_bridge, &meson_dw_hdmi->bridge);
+
 	DRM_DEBUG_DRIVER("HDMI controller initialized\n");
 
 	return 0;
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
