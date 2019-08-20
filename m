Return-Path: <SRS0=f3iC=WQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EEC9C3A59D
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 08:41:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED6E52339F
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 08:41:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZaXpUAd4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="0oN9KfCg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED6E52339F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P0kR5uNTkVPaFXGfX72LITRrApbUQOiKGNPZZ1bNxhk=; b=ZaXpUAd4JFoKAn
	maJLFCtqv9wXQ3XC674UCICkHQoOeA1jmB53Yzh5S2bCIGDW/Be6p4T4tR2jWkN/nweYo8kQkupRW
	IOX7vHDYQK0RniUu355SAeYHKC9PpYIBmbC94Rvcc21cdQbxMiyhRe6HI+exHOqcF/k5myiL/oy7c
	qjQi+krYSuer0e7J6BLre2c1xUeA+m6GX3jTkBhutM91h611rB1UA7cKDJfo/TMCdT3k8lmW9RCaA
	PX9ojx8lTzQMehukiXoeJd216ItDEh0JQdgFG0vWHRCn2QLuriV4wErP/bFEd+6fCAIfit8yWjcz4
	R4smFVY5LbdkReiP09gw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hzzho-00054p-KF; Tue, 20 Aug 2019 08:41:28 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hzzhd-0004os-EZ
 for linux-amlogic@lists.infradead.org; Tue, 20 Aug 2019 08:41:18 +0000
Received: by mail-wm1-x343.google.com with SMTP id k1so1569379wmi.1
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Aug 2019 01:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ecwbnitdiOv4GNJMlaQYE3q8EXMkI0eb0YmQtYFZpyw=;
 b=0oN9KfCgtlO6Fg0pLmVaOu8bb5Xnlza1CkqRkD5lz/aIbUP82APa1908Vrpz9x3f50
 vZq9cT3wbjmn/onMOlykMl3WOauVS8YCNBdsqt7SW3G5pWHpTmq3oNdM02053B1IiW3U
 H8M0eMor5Zh4Wvw8qK0fU9+SLL+fYCzI++wVsZhNOlulbyE1mo3qknbs0xLaXCQI0zD7
 WRwCelBUJZw8nVmN8uGWkIjlyfq4PBaj+tqGPF1O3lEjASVVDFfDijFeGkx9kF96D5Fn
 VFr9aORWvvgE+Tb6N6L1Xp7CjI+GVc2zIP0N9N8yTTz6UaQP6kVtNiHS1vGYPFN5JMea
 9dGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ecwbnitdiOv4GNJMlaQYE3q8EXMkI0eb0YmQtYFZpyw=;
 b=WeLtsWOofiSKLTSKXh14KAnrmxrRpUrspvECZhUpYkivmYWi4YV1K50vHUOip4uRQ+
 dHvJRKuZn0tVfYZeADRRpPw/O16rB37CsNybOF7SjwQja/O+0KqhkzmKGz+/qMalxd2m
 7wter9ddntyobKlvRXejAVR45umj9VClNMeISUkGp2LZGC2PskKIwgoyWxH05QAZ3sfa
 w4XCSHjRvDSH1evTTxK8fPt/WZyNkMCAe/Q3hxWHzoAmmu04pbbY0rnsxfwgclPYNdQX
 8e6LM23PiDOgo9JyIMEWEF/i8O7ilxBkGTW/+qJr1QEPAZVVPgSyx3rhvcaZ/6Us+Idq
 ud2A==
X-Gm-Message-State: APjAAAU/Oa7iEFDLsY+7VnPVREfAlZ21HnZIp7SG3jGQ7EFif4j64r2C
 EZcAECxmhNc724HenqZ3XWdTYg==
X-Google-Smtp-Source: APXvYqwQ4da5rpbUSTUs9ZIZMRsQGsu7wIFZMWvm+TOalIMoawh4Z8UCunL3BDDxlisCvn7PHe2kkQ==
X-Received: by 2002:a05:600c:22c7:: with SMTP id
 7mr25158111wmg.129.1566290475940; 
 Tue, 20 Aug 2019 01:41:15 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g2sm34275648wru.27.2019.08.20.01.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 01:41:14 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [RFC 03/11] drm/meson: meson_dw_hdmi: switch to drm_bridge_funcs
Date: Tue, 20 Aug 2019 10:41:01 +0200
Message-Id: <20190820084109.24616-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190820084109.24616-1-narmstrong@baylibre.com>
References: <20190820084109.24616-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_014117_487439_84B11510 
X-CRM114-Status: GOOD (  12.60  )
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

Switch the dw-hdmi driver to drm_bridge_funcs, and add the default supported
YUV444 bus format to the encoder output_bus_caps.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 37 +++++++++++++++++----------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 9f0b08eaf003..9a99d3920610 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -368,7 +368,7 @@ static inline void meson_dw_hdmi_phy_reset(struct meson_dw_hdmi *dw_hdmi)
 }
 
 static void dw_hdmi_set_vclk(struct meson_dw_hdmi *dw_hdmi,
-			     struct drm_display_mode *mode)
+			     const struct drm_display_mode *mode)
 {
 	struct meson_drm *priv = dw_hdmi->priv;
 	int vic = drm_match_cea_mode(mode);
@@ -670,15 +670,17 @@ static const struct drm_encoder_funcs meson_venc_hdmi_encoder_funcs = {
 	.destroy        = meson_venc_hdmi_encoder_destroy,
 };
 
-static int meson_venc_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
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
+	struct drm_encoder *encoder = bridge_to_encoder(bridge);
 	struct meson_dw_hdmi *dw_hdmi = encoder_to_meson_dw_hdmi(encoder);
 	struct meson_drm *priv = dw_hdmi->priv;
 
@@ -691,8 +693,9 @@ static void meson_venc_hdmi_encoder_disable(struct drm_encoder *encoder)
 	writel_relaxed(0, priv->io_base + _REG(ENCP_VIDEO_EN));
 }
 
-static void meson_venc_hdmi_encoder_enable(struct drm_encoder *encoder)
+static void meson_venc_hdmi_encoder_enable(struct drm_bridge *bridge)
 {
+	struct drm_encoder *encoder = bridge_to_encoder(bridge);
 	struct meson_dw_hdmi *dw_hdmi = encoder_to_meson_dw_hdmi(encoder);
 	struct meson_drm *priv = dw_hdmi->priv;
 
@@ -704,10 +707,11 @@ static void meson_venc_hdmi_encoder_enable(struct drm_encoder *encoder)
 		writel_relaxed(1, priv->io_base + _REG(ENCP_VIDEO_EN));
 }
 
-static void meson_venc_hdmi_encoder_mode_set(struct drm_encoder *encoder,
-				   struct drm_display_mode *mode,
-				   struct drm_display_mode *adjusted_mode)
+static void meson_venc_hdmi_encoder_mode_set(struct drm_bridge *bridge,
+				   const struct drm_display_mode *mode,
+				   const struct drm_display_mode *adjusted_mode)
 {
+	struct drm_encoder *encoder = bridge_to_encoder(bridge);
 	struct meson_dw_hdmi *dw_hdmi = encoder_to_meson_dw_hdmi(encoder);
 	struct meson_drm *priv = dw_hdmi->priv;
 	int vic = drm_match_cea_mode(mode);
@@ -724,11 +728,10 @@ static void meson_venc_hdmi_encoder_mode_set(struct drm_encoder *encoder,
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
 	.mode_set	= meson_venc_hdmi_encoder_mode_set,
 };
 
@@ -800,6 +803,10 @@ static bool meson_hdmi_connector_is_available(struct device *dev)
 	return false;
 }
 
+static const u32 meson_dw_hdmi_out_bus_fmts[] = {
+	MEDIA_BUS_FMT_YUV8_1X24,
+};
+
 static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 				void *data)
 {
@@ -810,6 +817,7 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 	struct meson_drm *priv = drm->dev_private;
 	struct dw_hdmi_plat_data *dw_plat_data;
 	struct drm_encoder *encoder;
+	struct drm_bus_caps *bus_caps;
 	struct resource *res;
 	int irq;
 	int ret;
@@ -837,6 +845,7 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 	meson_dw_hdmi->data = match;
 	dw_plat_data = &meson_dw_hdmi->dw_plat_data;
 	encoder = &meson_dw_hdmi->encoder;
+	bus_caps = &encoder->bridge.output_bus_caps;
 
 	meson_dw_hdmi->hdmi_supply = devm_regulator_get_optional(dev, "hdmi");
 	if (IS_ERR(meson_dw_hdmi->hdmi_supply)) {
@@ -910,8 +919,7 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 
 	/* Encoder */
 
-	drm_encoder_helper_add(encoder, &meson_venc_hdmi_encoder_helper_funcs);
-
+	encoder->bridge.funcs = &meson_venc_hdmi_encoder_bridge_funcs;
 	ret = drm_encoder_init(drm, encoder, &meson_venc_hdmi_encoder_funcs,
 			       DRM_MODE_ENCODER_TMDS, "meson_hdmi");
 	if (ret) {
@@ -919,6 +927,9 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 		return ret;
 	}
 
+	bus_caps->supported_fmts = meson_dw_hdmi_out_bus_fmts;
+	bus_caps->num_supported_fmts = ARRAY_SIZE(meson_dw_hdmi_out_bus_fmts);
+
 	encoder->possible_crtcs = BIT(0);
 
 	DRM_DEBUG_DRIVER("encoder initialized\n");
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
