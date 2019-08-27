Return-Path: <SRS0=C9TS=WX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 282CFC3A5A6
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Aug 2019 08:14:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED4CF206BF
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Aug 2019 08:14:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gyat8wpd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="tHMHiMgS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED4CF206BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eMg2j4ZyrB8Tm3Dcs9oPkVmVP9HxdRK5MAHSqAxCvMc=; b=Gyat8wpdxgz/bl
	ND+bygeRwPV+8HjJTdWSbdkra78wFFgJbEu+wi+YWBij5YS+vWuOomALRh2sLgXVadDwOCzJQUoEe
	geiI1c2NJNVlYaOSXQZyn/SDZD1MQC8DxsPxeuupIj1e8bROzabUuRg6hgVsTVIHmH8RLcts+MjFX
	a0UyUJASR1iq4sWqkeDIvZymlUA60y3ldf2wzPJYB5Ubykaaseew0Hfki557so2gpPhJHMwN824bG
	HOX7MKS1/OoE+oZjcGHuT0DT9xwk7vrFVBuUWSdYM2zEXDNBkZdkBxo6u2JSfa1AicMPgfTgakQTe
	Lj008XLHNxbMA+vtEtZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2Wcl-0003v9-Kn; Tue, 27 Aug 2019 08:14:43 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2Wca-0003m0-SG
 for linux-amlogic@lists.infradead.org; Tue, 27 Aug 2019 08:14:36 +0000
Received: by mail-wr1-x443.google.com with SMTP id t16so17820965wra.6
 for <linux-amlogic@lists.infradead.org>; Tue, 27 Aug 2019 01:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P263Nz8GEJ4vmRFoF7UucI5AUC0r0zMRf0rnaRk+enY=;
 b=tHMHiMgSk47lpDEmrla9XXBM90OwrHN+lkL+/xh2RCq0cro5bbtsH/H12lBK+XQyPE
 Qkwk0TTJbfPh8pWIshAMztu+Kg7TiV2UFJnczaOAFCUC4w5TV7G1gSoKPC0nBMgnBMhG
 nUZqfwbwWeMOuARUiXgDZuIjYnqL2NOzdPHrmKHGYnsVH4eFXmeOcHIXlv2iIO+eOK/V
 te9YSmTZTbpJkXfnaqOgrxN4nnVDClGTXNj8cSUV920GwkyQwd+KnoUjhATe/5YC0G4p
 omwlvu9weNOdnFgeNFaKFEv894XlPbYCrB2/l01w3iBL+c0JBvedmUjvraTrgHBYF9h0
 w5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P263Nz8GEJ4vmRFoF7UucI5AUC0r0zMRf0rnaRk+enY=;
 b=jm4hSxUMCGrvvD4HF0sFSiybhQO+PKvn5YNyVXJizv4Oa+VNKXZlyn6kOGZ8ez8zGz
 cRFjzo+lwsAxajE75za9nO9qlaDXvNTwynhgASM25CHN/IEzEgstoQBhM7qeZNX2h/yM
 SZg0rHUE4sGeHiiEDNMJffAkCJ7wVPYpTBeI4z9jw/BpNBgkV/8t9hDqzA73TneGMgFv
 73J29ClcGdO+XiRd9h5ylHEHrd4Zlf7YGJ1fYQivruesCAkz2XpIkgk5JS6AZ8Kb2fu4
 KOEWmPh09le/yK5b5sZwpcbl++2PfZ61n7Ovp/oFe7K+ViWlbdKjiLqqHFZwXRrUFR/E
 BoXA==
X-Gm-Message-State: APjAAAWJ+AoJXsDHH2Eyiva8ltSC9ZH7bjP7m1smE+f3iUuPcnK7jm+M
 ID6iYvr4DguFwq30Nj4MDZm1ww==
X-Google-Smtp-Source: APXvYqwpvbZyC/pu+tVMvm17ws3ojExWy0ldiSpgNaiDeRPVrh1zPmuhZG2aTGT2a9jcu4lVoorn0w==
X-Received: by 2002:a5d:4446:: with SMTP id x6mr27380733wrr.11.1566893669899; 
 Tue, 27 Aug 2019 01:14:29 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id f18sm11911792wrx.85.2019.08.27.01.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 01:14:29 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH RFC v2 2/8] drm/meson: meson_dw_hdmi: switch to
 drm_bridge_funcs
Date: Tue, 27 Aug 2019 10:14:19 +0200
Message-Id: <20190827081425.15011-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190827081425.15011-1-narmstrong@baylibre.com>
References: <20190827081425.15011-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190827_011433_056362_3FFB20FD 
X-CRM114-Status: GOOD (  12.36  )
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

Switch the dw-hdmi driver to drm_bridge_funcs, and implement the
atomic_get_input_bus_fmts/atomic_get_output_bus_fmts.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 67 +++++++++++++++++++++------
 1 file changed, 54 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index f893ebd0b799..333583ef3ab9 100644
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
@@ -663,6 +663,10 @@ dw_hdmi_mode_valid(struct drm_connector *connector,
 
 /* Encoder */
 
+static const u32 meson_dw_hdmi_out_bus_fmts[] = {
+	MEDIA_BUS_FMT_YUV8_1X24,
+};
+
 static void meson_venc_hdmi_encoder_destroy(struct drm_encoder *encoder)
 {
 	drm_encoder_cleanup(encoder);
@@ -672,15 +676,50 @@ static const struct drm_encoder_funcs meson_venc_hdmi_encoder_funcs = {
 	.destroy        = meson_venc_hdmi_encoder_destroy,
 };
 
-static int meson_venc_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
+static void
+meson_venc_hdmi_encoder_get_out_bus_fmts(struct drm_bridge *bridge,
+					 struct drm_bridge_state *bridge_state,
+					 struct drm_crtc_state *crtc_state,
+					 struct drm_connector_state *conn_state,
+					 unsigned int *num_output_fmts,
+					 u32 *output_fmts)
+{
+	*num_output_fmts = ARRAY_SIZE(meson_dw_hdmi_out_bus_fmts);
+
+	if (output_fmts)
+		memcpy(output_fmts, meson_dw_hdmi_out_bus_fmts,
+		       ARRAY_SIZE(meson_dw_hdmi_out_bus_fmts));
+}
+
+static void
+meson_venc_hdmi_encoder_get_inp_bus_fmts(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state,
+					u32 output_fmt,
+					unsigned int *num_input_fmts,
+					u32 *input_fmts)
+{
+	if (output_fmt == meson_dw_hdmi_out_bus_fmts[0]) {
+		*num_input_fmts = 1;
+		if (input_fmts)
+			input_fmts[0] = output_fmt;
+	}
+	else
+		*num_input_fmts = 0;
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
+	struct drm_encoder *encoder = bridge_to_encoder(bridge);
 	struct meson_dw_hdmi *dw_hdmi = encoder_to_meson_dw_hdmi(encoder);
 	struct meson_drm *priv = dw_hdmi->priv;
 
@@ -693,8 +732,9 @@ static void meson_venc_hdmi_encoder_disable(struct drm_encoder *encoder)
 	writel_relaxed(0, priv->io_base + _REG(ENCP_VIDEO_EN));
 }
 
-static void meson_venc_hdmi_encoder_enable(struct drm_encoder *encoder)
+static void meson_venc_hdmi_encoder_enable(struct drm_bridge *bridge)
 {
+	struct drm_encoder *encoder = bridge_to_encoder(bridge);
 	struct meson_dw_hdmi *dw_hdmi = encoder_to_meson_dw_hdmi(encoder);
 	struct meson_drm *priv = dw_hdmi->priv;
 
@@ -706,10 +746,11 @@ static void meson_venc_hdmi_encoder_enable(struct drm_encoder *encoder)
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
@@ -726,11 +767,12 @@ static void meson_venc_hdmi_encoder_mode_set(struct drm_encoder *encoder,
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
 
@@ -912,8 +954,7 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 
 	/* Encoder */
 
-	drm_encoder_helper_add(encoder, &meson_venc_hdmi_encoder_helper_funcs);
-
+	encoder->bridge.funcs = &meson_venc_hdmi_encoder_bridge_funcs;
 	ret = drm_encoder_init(drm, encoder, &meson_venc_hdmi_encoder_funcs,
 			       DRM_MODE_ENCODER_TMDS, "meson_hdmi");
 	if (ret) {
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
