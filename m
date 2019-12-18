Return-Path: <SRS0=A4ao=2I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47AD0C43603
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Dec 2019 15:47:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 163CB20684
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Dec 2019 15:47:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BzLBZMmL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="p/K2DA4e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 163CB20684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9VIqItDfSY8kGqT6pg5w4+L1azNTu4yr5aQwLoqt0yU=; b=BzLBZMmLMWCEns
	z898DWT0WSRwbpWvaGSgm9X45/b3INnr9YioWP7IOVm5Tf6oiLdrxPv/xKLlRMOziEnJL8fWahmQI
	qVDwusvihG7ZfySUKzbLLoU+OcXABQLTXW2Ksr8yZzTPGR6bInCrZfctEg77NLsAh9E/xroWQ5Viy
	yQrAQehBGFcAemrmDlz6JnFziGTZqR9UkhEoXAd/5xx/oQQjf1DQiaLEvgEqYBBsIVPMsp7DOWtJT
	Jhc5zD+phiQGF6YP7hGG96cUBnjK7hYZNyRpTiANJAaNweBPsI84lQLuvBpuiTp8tgJ5ArwUue+aX
	uY/t0iU3/RZN8KVxoH9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihbXX-0008SJ-QC; Wed, 18 Dec 2019 15:47:07 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihbXI-00086Q-5C
 for linux-amlogic@lists.infradead.org; Wed, 18 Dec 2019 15:46:54 +0000
Received: by mail-wm1-x343.google.com with SMTP id p17so2442349wma.1
 for <linux-amlogic@lists.infradead.org>; Wed, 18 Dec 2019 07:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4/TA5V3tcqADPu1K+BV5/M4caj20lIOYip+ZBjXtypI=;
 b=p/K2DA4elKKe/umIqFLDDzXYHttb7FH0nG/QtbHrZUoYXHTs2oF9MlPFGuBruiVqXg
 dCImiskdofXSNO3vg75mzmCaa/mbGYAo0wka88H7UtnZVVYY/N7YtYoKWWJiK4coMLax
 0WrmWxzp8HkUBSy+5VxtY/RV0+ApcMyVz10FEiyXq+bfsvpm7yCKG9a8y4F993LzberR
 eT1z0OqXWsbkSHivMFhVLxSwFj0dzWIO1qzmmN4NPI1YTK5c8/eiA+51NNpyyo7IG+Gl
 afKkFROgmWHBemhNF6ROgCjqfJFRONhooA7YzV9uDzqkxGnyIbWs0kYVVC6uxdS3C9OB
 kk0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4/TA5V3tcqADPu1K+BV5/M4caj20lIOYip+ZBjXtypI=;
 b=agCqRj+DB3kKaRUBQMCawq5+qvYMm3hTExJcD/kHgsQ2/X0YG8Ic9ctVAQqFVxMVej
 zIbq0bs5zkqzer4VohASClGEG//q3KJtQhCdkGnbtBNovCxlBhEWpYS65unZ/j/26105
 MeBCMVb2n0OsyH2sOIZ2Ia7kdlpR2c0XPsf9pjHNSj1aL99EZ+dSDwm8JKItoe6YrRmF
 rUuvLo2DAH262AmyIkpbxWcEPrlMRc1oAl+9Bv/psUA5pM7eiBe4c7IiaZk90N9wRym5
 wDZuEYXLH5BDllilY1apwUSQLY2O05PltDCwZo3HYJ/VWndMj7ADKtZrkLcjDH1pS4l/
 tsRw==
X-Gm-Message-State: APjAAAViLgTeEjlU2oOijPwglYOlYkLSsWvtjE495u2rFlxt7JupPHYn
 dkSsxi8JXn5SJpNy98asLOxQoQ==
X-Google-Smtp-Source: APXvYqzuomsxDNlw0fZ5uXNnvYIuXSCtgP+tD9WpS5svU+SVlgn+zsKMLxMQD2gSo6uiOBS8Z1tyaA==
X-Received: by 2002:a7b:c750:: with SMTP id w16mr4281186wmk.46.1576684010516; 
 Wed, 18 Dec 2019 07:46:50 -0800 (PST)
Received: from bender.baylibre.local
 (lfbn-nic-1-505-157.w90-116.abo.wanadoo.fr. [90.116.92.157])
 by smtp.gmail.com with ESMTPSA id x1sm2891492wru.50.2019.12.18.07.46.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 07:46:50 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH v3 10/10] drm/meson: Add YUV420 output support
Date: Wed, 18 Dec 2019 16:46:37 +0100
Message-Id: <20191218154637.17509-11-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191218154637.17509-1-narmstrong@baylibre.com>
References: <20191218154637.17509-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_074652_348415_1C223568 
X-CRM114-Status: GOOD (  19.08  )
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

This patch adds support for the YUV420 output from the Amlogic Meson SoCs
Video Processing Unit to the HDMI Controller.

The YUV420 is obtained by generating a YUV444 pixel stream like
the classic HDMI display modes, but then the Video Encoder output
can be configured to down-sample the YUV444 pixel stream to a YUV420
stream.
In addition if pixel stream down-sampling, the Y Cb Cr components must
also be mapped differently to align with the HDMI2.0 specifications.

This mode needs a different clock generation scheme since the TMDS PHY
clock must match the 10x ration with the YUV420 pixel clock, but
the video encoder must run at 2x the pixel clock.

This patch enables the bridge bus format negotiation, and handles
the YUV420 case if selected by the negotiation.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 91 ++++++++++++++++++++-------
 1 file changed, 70 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index ce27dfde509e..90ec4553ed51 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -150,6 +150,7 @@ struct meson_dw_hdmi {
 	struct regulator *hdmi_supply;
 	u32 irq_stat;
 	struct dw_hdmi *hdmi;
+	unsigned long output_bus_fmt;
 };
 #define encoder_to_meson_dw_hdmi(x) \
 	container_of(x, struct meson_dw_hdmi, encoder)
@@ -301,6 +302,10 @@ static void meson_hdmi_phy_setup_mode(struct meson_dw_hdmi *dw_hdmi,
 	struct meson_drm *priv = dw_hdmi->priv;
 	unsigned int pixel_clock = mode->clock;
 
+	/* For 420, pixel clock is half unlike venc clock */
+	if (dw_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYYVYY8_0_5X24)
+		pixel_clock /= 2;
+
 	if (dw_hdmi_is_compatible(dw_hdmi, "amlogic,meson-gxl-dw-hdmi") ||
 	    dw_hdmi_is_compatible(dw_hdmi, "amlogic,meson-gxm-dw-hdmi")) {
 		if (pixel_clock >= 371250) {
@@ -383,6 +388,10 @@ static void dw_hdmi_set_vclk(struct meson_dw_hdmi *dw_hdmi,
 
 	vclk_freq = mode->clock;
 
+	/* For 420, pixel clock is half unlike venc clock */
+	if (dw_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYYVYY8_0_5X24)
+		vclk_freq /= 2;
+
 	/* TMDS clock is pixel_clock * 10 */
 	phy_freq = vclk_freq * 10;
 
@@ -392,13 +401,16 @@ static void dw_hdmi_set_vclk(struct meson_dw_hdmi *dw_hdmi,
 		return;
 	}
 
+	/* 480i/576i needs global pixel doubling */
 	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
 		vclk_freq *= 2;
 
 	venc_freq = vclk_freq;
 	hdmi_freq = vclk_freq;
 
-	if (meson_venc_hdmi_venc_repeat(vic))
+	/* VENC double pixels for 1080i, 720p and YUV420 modes */
+	if (meson_venc_hdmi_venc_repeat(vic) ||
+	    dw_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYYVYY8_0_5X24)
 		venc_freq *= 2;
 
 	vclk_freq = max(venc_freq, hdmi_freq);
@@ -445,8 +457,9 @@ static int dw_hdmi_phy_init(struct dw_hdmi *hdmi, void *data,
 	/* Enable normal output to PHY */
 	dw_hdmi->data->top_write(dw_hdmi, HDMITX_TOP_BIST_CNTL, BIT(12));
 
-	/* TMDS pattern setup (TOFIX Handle the YUV420 case) */
-	if (mode->clock > 340000) {
+	/* TMDS pattern setup */
+	if (mode->clock > 340000 &&
+	    dw_hdmi->output_bus_fmt == MEDIA_BUS_FMT_YUV8_1X24) {
 		dw_hdmi->data->top_write(dw_hdmi, HDMITX_TOP_TMDS_CLK_PTTN_01,
 				  0);
 		dw_hdmi->data->top_write(dw_hdmi, HDMITX_TOP_TMDS_CLK_PTTN_23,
@@ -621,6 +634,7 @@ dw_hdmi_mode_valid(struct drm_connector *connector,
 		   const struct drm_display_mode *mode)
 {
 	struct meson_drm *priv = connector->dev->dev_private;
+	bool is_hdmi2_sink = connector->display_info.hdmi.scdc.supported;
 	unsigned int phy_freq;
 	unsigned int vclk_freq;
 	unsigned int venc_freq;
@@ -630,9 +644,11 @@ dw_hdmi_mode_valid(struct drm_connector *connector,
 
 	DRM_DEBUG_DRIVER("Modeline " DRM_MODE_FMT "\n", DRM_MODE_ARG(mode));
 
-	/* If sink max TMDS clock, we reject the mode */
+	/* If sink does not support 540MHz, reject the non-420 HDMI2 modes */
 	if (connector->display_info.max_tmds_clock &&
-	    mode->clock > connector->display_info.max_tmds_clock)
+	    mode->clock > connector->display_info.max_tmds_clock &&
+	    !drm_mode_is_420_only(&connector->display_info, mode) &&
+	    !drm_mode_is_420_also(&connector->display_info, mode))
 		return MODE_BAD;
 
 	/* Check against non-VIC supported modes */
@@ -648,6 +664,12 @@ dw_hdmi_mode_valid(struct drm_connector *connector,
 
 	vclk_freq = mode->clock;
 
+	/* For 420, pixel clock is half unlike venc clock */
+	if (drm_mode_is_420_only(&connector->display_info, mode) ||
+	    (!is_hdmi2_sink &&
+	     drm_mode_is_420_also(&connector->display_info, mode)))
+		vclk_freq /= 2;
+
 	/* TMDS clock is pixel_clock * 10 */
 	phy_freq = vclk_freq * 10;
 
@@ -658,8 +680,11 @@ dw_hdmi_mode_valid(struct drm_connector *connector,
 	venc_freq = vclk_freq;
 	hdmi_freq = vclk_freq;
 
-	/* VENC double pixels for 1080i and 720p modes */
-	if (meson_venc_hdmi_venc_repeat(vic))
+	/* VENC double pixels for 1080i, 720p and YUV420 modes */
+	if (meson_venc_hdmi_venc_repeat(vic) ||
+	    drm_mode_is_420_only(&connector->display_info, mode) ||
+	    (!is_hdmi2_sink &&
+	     drm_mode_is_420_also(&connector->display_info, mode)))
 		venc_freq *= 2;
 
 	vclk_freq = max(venc_freq, hdmi_freq);
@@ -677,6 +702,7 @@ dw_hdmi_mode_valid(struct drm_connector *connector,
 
 static const u32 meson_dw_hdmi_out_bus_fmts[] = {
 	MEDIA_BUS_FMT_YUV8_1X24,
+	MEDIA_BUS_FMT_UYYVYY8_0_5X24,
 };
 
 static void meson_venc_hdmi_encoder_destroy(struct drm_encoder *encoder)
@@ -717,18 +743,23 @@ meson_venc_hdmi_encoder_get_inp_bus_fmts(struct drm_bridge *bridge,
 					unsigned int *num_input_fmts)
 {
 	u32 *input_fmts = NULL;
+	int i;
 
-	if (output_fmt == meson_dw_hdmi_out_bus_fmts[0]) {
-		*num_input_fmts = 1;
-		input_fmts = kcalloc(*num_input_fmts,
-				     sizeof(*input_fmts),
-				     GFP_KERNEL);
-		if (!input_fmts)
-			return NULL;
+	*num_input_fmts = 0;
 
-		input_fmts[0] = output_fmt;
-	} else {
-		*num_input_fmts = 0;
+	for (i = 0 ; i < ARRAY_SIZE(meson_dw_hdmi_out_bus_fmts) ; ++i) {
+		if (output_fmt == meson_dw_hdmi_out_bus_fmts[i]) {
+			*num_input_fmts = 1;
+			input_fmts = kcalloc(*num_input_fmts,
+					     sizeof(*input_fmts),
+					     GFP_KERNEL);
+			if (!input_fmts)
+				return NULL;
+
+			input_fmts[0] = output_fmt;
+
+			break;
+		}
 	}
 
 	return input_fmts;
@@ -739,6 +770,12 @@ static int meson_venc_hdmi_encoder_atomic_check(struct drm_bridge *bridge,
 					struct drm_crtc_state *crtc_state,
 					struct drm_connector_state *conn_state)
 {
+	struct meson_dw_hdmi *dw_hdmi = bridge_to_meson_dw_hdmi(bridge);
+
+	dw_hdmi->output_bus_fmt = bridge_state->output_bus_cfg.fmt;
+
+	DRM_DEBUG_DRIVER("output_bus_fmt %lx\n", dw_hdmi->output_bus_fmt);
+
 	return 0;
 }
 
@@ -776,18 +813,29 @@ static void meson_venc_hdmi_encoder_mode_set(struct drm_bridge *bridge,
 	struct meson_dw_hdmi *dw_hdmi = bridge_to_meson_dw_hdmi(bridge);
 	struct meson_drm *priv = dw_hdmi->priv;
 	int vic = drm_match_cea_mode(mode);
+	unsigned int ycrcb_map = VPU_HDMI_OUTPUT_CBYCR;
+	bool yuv420_mode = false;
 
 	DRM_DEBUG_DRIVER("\"%s\" vic %d\n", mode->name, vic);
 
+	if (dw_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYYVYY8_0_5X24) {
+		ycrcb_map = VPU_HDMI_OUTPUT_CRYCB;
+		yuv420_mode = true;
+	}
+
 	/* VENC + VENC-DVI Mode setup */
-	meson_venc_hdmi_mode_set(priv, vic, ycrcb_map, false,
-				 VPU_HDMI_OUTPUT_CBYCR);
+	meson_venc_hdmi_mode_set(priv, vic, ycrcb_map, yuv420_mode, mode);
 
 	/* VCLK Set clock */
 	dw_hdmi_set_vclk(dw_hdmi, mode);
 
-	/* Setup YUV444 to HDMI-TX, no 10bit diphering */
-	writel_relaxed(0, priv->io_base + _REG(VPU_HDMI_FMT_CTRL));
+	if (dw_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYYVYY8_0_5X24)
+		/* Setup YUV420 to HDMI-TX, no 10bit diphering */
+		writel_relaxed(2 | (2 << 2),
+			       priv->io_base + _REG(VPU_HDMI_FMT_CTRL));
+	else
+		/* Setup YUV444 to HDMI-TX, no 10bit diphering */
+		writel_relaxed(0, priv->io_base + _REG(VPU_HDMI_FMT_CTRL));
 }
 
 static const struct drm_bridge_funcs meson_venc_hdmi_encoder_bridge_funcs = {
@@ -1042,6 +1090,7 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 	dw_plat_data->phy_name = "meson_dw_hdmi_phy";
 	dw_plat_data->phy_data = meson_dw_hdmi;
 	dw_plat_data->input_bus_encoding = V4L2_YCBCR_ENC_709;
+	dw_plat_data->ycbcr_420_allowed = true;
 
 	if (dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-gxl-dw-hdmi") ||
 	    dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-gxm-dw-hdmi") ||
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
