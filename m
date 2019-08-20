Return-Path: <SRS0=f3iC=WQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CD05C3A589
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 08:42:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42CB92377F
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 08:42:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JUUH3xt0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="QMidmmTZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42CB92377F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2UaoH6GCVfsEhevuBPoBVlKbZOcg404mZ5wRCZaslS4=; b=JUUH3xt0bviCK9
	ah9WfM+P3YFx615tsgWNyDhF84qfwmcUhmJ93NSUQw5RmiV0YCDNuIBoSh/a+SpgH8HnZ+afbpG+B
	w5f/MNUm8hbiqoPj0q1A1LD6nQlt0az+KzoiUoTYZb/RgcV0oiVdi3r+AyHrLhOO0kImLHN8jiYNu
	7ZST9wnwOItj+iDlUrLtJJIIJGGc+2Jpdgtgf1i4KtBas05PBC+f9sB/EEl3V8IxaXMEatB8nds+J
	dL5B1UC9F2YdTw+k0ye3/r5MDt3D65Z6jTQtgS8BtIMjlRaS+pXRb4L3VzPfutTm/jmKlG082wxrJ
	3uJYPdrHNfDsU07spUyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hzziY-0005XE-Jk; Tue, 20 Aug 2019 08:42:14 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hzzhn-000522-Dt
 for linux-amlogic@lists.infradead.org; Tue, 20 Aug 2019 08:41:29 +0000
Received: by mail-wr1-x444.google.com with SMTP id b16so11462321wrq.9
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Aug 2019 01:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rDysPVUE2Bn6L30B6dElX7MpwbtEvcVqr5cZfWiXnEM=;
 b=QMidmmTZizPTQpbbgzJOC59JsTytQEU1LsWstDvePe0b+kyyuC1XKy2r382OWBzT0w
 6EvLvYKfQkh1O5Qcr3GE184VT8jpOCcQ9FuXKwOme5zEvEr+AShmS/0q3JtGQJVf1V7J
 O4eK0qooXGIxol62awW7t05SCYvKZv2PPjQPPEQgbY7qGhMq+hzrQe/aJcMWnS6mUxes
 Z7MhWImk8uctefaTzW0jrs0RWGRyQfjaUPZJKHywRutjxjRAGELO1gfl1pU5nzIWNkah
 UusNFA6r/+y0jeo5GyvbXLl4sjW97MzGKf7OSvKsXczGAuLGpQm1ImrNgEDt7ZbX8j7d
 Lxaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rDysPVUE2Bn6L30B6dElX7MpwbtEvcVqr5cZfWiXnEM=;
 b=fJPkIfBQo176QjxO2VNH50i3WSoKfy3tEUhvsOei0LYppivn1143eN+cfvGKoWovs5
 Z80UCtPA6CSEnwynTy2WS/ldqTeBJBp9TI1CZFBAjO3vdI5kJvDMnGxoAGrpT/RlKq3p
 9gwthFbEBmDibvGZHDCZ2n8GRHT1J+kDIjKeahxcbWy+yzEkMu8cobDSbucEXugygi31
 dxsiDo8M+5XjLz9KXgGfnwKfJnhQM5tHasOwREh1vGEpy7DC4Z4wNzg3+CGKjoIZ3wIP
 Sy07I1+G3ARDRI3eo8ly75xcxijmy6+pFnMxy9IHKwR6bcKCTrv5yI0YxwMcI4zuE/uS
 cYJw==
X-Gm-Message-State: APjAAAWOZdcd/YW0CwosdowABiT3f4SNKC+xXvcaRBCKZDNaLayMXCJS
 Aamap9ddKGPYdVcozZFGjLd9Bg==
X-Google-Smtp-Source: APXvYqyfzdwX8oHXPjV6iPFllE4I8S4k7WkKPo70x3YWM03yV+lkFI871gysW+VEAcxd8jI2fYV2pg==
X-Received: by 2002:adf:fe85:: with SMTP id l5mr30861142wrr.5.1566290485555;
 Tue, 20 Aug 2019 01:41:25 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g2sm34275648wru.27.2019.08.20.01.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 01:41:24 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [RFC 11/11] drm/meson: Add YUV420 output support
Date: Tue, 20 Aug 2019 10:41:09 +0200
Message-Id: <20190820084109.24616-12-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190820084109.24616-1-narmstrong@baylibre.com>
References: <20190820084109.24616-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_014127_603252_DF841205 
X-CRM114-Status: GOOD (  18.65  )
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

This patch enables the bridge bus format negociation, and handles
the YUV420 case if selected by the negociation.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 74 +++++++++++++++++++++++----
 1 file changed, 63 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 3ce7a63fa994..f7a9c1205937 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -148,6 +148,7 @@ struct meson_dw_hdmi {
 	struct regulator *hdmi_supply;
 	u32 irq_stat;
 	struct dw_hdmi *hdmi;
+	unsigned long output_bus_fmt;
 };
 #define encoder_to_meson_dw_hdmi(x) \
 	container_of(x, struct meson_dw_hdmi, encoder)
@@ -297,6 +298,10 @@ static void meson_hdmi_phy_setup_mode(struct meson_dw_hdmi *dw_hdmi,
 	struct meson_drm *priv = dw_hdmi->priv;
 	unsigned int pixel_clock = mode->clock;
 
+	/* For 420, pixel clock is half unlike venc clock */
+	if (dw_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYYVYY8_0_5X24)
+		pixel_clock /= 2;
+
 	if (dw_hdmi_is_compatible(dw_hdmi, "amlogic,meson-gxl-dw-hdmi") ||
 	    dw_hdmi_is_compatible(dw_hdmi, "amlogic,meson-gxm-dw-hdmi")) {
 		if (pixel_clock >= 371250) {
@@ -379,6 +384,10 @@ static void dw_hdmi_set_vclk(struct meson_dw_hdmi *dw_hdmi,
 
 	vclk_freq = mode->clock;
 
+	/* For 420, pixel clock is half unlike venc clock */
+	if (dw_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYYVYY8_0_5X24)
+		vclk_freq /= 2;
+
 	/* TMDS clock is pixel_clock * 10 */
 	phy_freq = vclk_freq * 10;
 
@@ -388,13 +397,16 @@ static void dw_hdmi_set_vclk(struct meson_dw_hdmi *dw_hdmi,
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
@@ -439,8 +451,9 @@ static int dw_hdmi_phy_init(struct dw_hdmi *hdmi, void *data,
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
@@ -615,6 +628,7 @@ dw_hdmi_mode_valid(struct drm_connector *connector,
 		   const struct drm_display_mode *mode)
 {
 	struct meson_drm *priv = connector->dev->dev_private;
+	bool is_hdmi2_sink = connector->display_info.hdmi.scdc.supported;
 	unsigned int phy_freq;
 	unsigned int vclk_freq;
 	unsigned int venc_freq;
@@ -624,9 +638,11 @@ dw_hdmi_mode_valid(struct drm_connector *connector,
 
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
@@ -642,6 +658,12 @@ dw_hdmi_mode_valid(struct drm_connector *connector,
 
 	vclk_freq = mode->clock;
 
+	/* For 420, pixel clock is half unlike venc clock */
+	if (drm_mode_is_420_only(&connector->display_info, mode) ||
+	    (!is_hdmi2_sink &&
+	     drm_mode_is_420_also(&connector->display_info, mode)))
+		vclk_freq /= 2;
+
 	/* TMDS clock is pixel_clock * 10 */
 	phy_freq = vclk_freq * 10;
 
@@ -652,8 +674,11 @@ dw_hdmi_mode_valid(struct drm_connector *connector,
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
@@ -683,6 +708,20 @@ static int meson_venc_hdmi_encoder_atomic_check(struct drm_bridge *bridge,
 					struct drm_crtc_state *crtc_state,
 					struct drm_connector_state *conn_state)
 {
+	struct drm_encoder *encoder = bridge_to_encoder(bridge);
+	struct meson_dw_hdmi *dw_hdmi = encoder_to_meson_dw_hdmi(encoder);
+	int ret;
+
+	ret = drm_atomic_bridge_choose_output_bus_cfg(bridge_state,
+						      crtc_state,
+						      conn_state);
+	if (ret)
+		return ret;
+
+	dw_hdmi->output_bus_fmt = bridge_state->output_bus_cfg.fmt;
+
+	DRM_DEBUG_DRIVER("output_bus_fmt %lx\n", dw_hdmi->output_bus_fmt);
+
 	return 0;
 }
 
@@ -723,18 +762,29 @@ static void meson_venc_hdmi_encoder_mode_set(struct drm_bridge *bridge,
 	struct meson_dw_hdmi *dw_hdmi = encoder_to_meson_dw_hdmi(encoder);
 	struct meson_drm *priv = dw_hdmi->priv;
 	int vic = drm_match_cea_mode(mode);
+	unsigned int ycrcb_map = MESON_VENC_MAP_CB_Y_CR;
+	bool yuv420_mode = false;
 
 	DRM_DEBUG_DRIVER("\"%s\" vic %d\n", mode->name, vic);
 
+	if (dw_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYYVYY8_0_5X24) {
+		ycrcb_map = MESON_VENC_MAP_CR_Y_CB;
+		yuv420_mode = true;
+	}
+
 	/* VENC + VENC-DVI Mode setup */
-	meson_venc_hdmi_mode_set(priv, vic, ycrcb_map, false,
-				 MESON_VENC_MAP_CB_Y_CR);
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
@@ -814,6 +864,7 @@ static bool meson_hdmi_connector_is_available(struct device *dev)
 
 static const u32 meson_dw_hdmi_out_bus_fmts[] = {
 	MEDIA_BUS_FMT_YUV8_1X24,
+	MEDIA_BUS_FMT_UYYVYY8_0_5X24,
 };
 
 static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
@@ -985,6 +1036,7 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 	dw_plat_data->phy_name = "meson_dw_hdmi_phy";
 	dw_plat_data->phy_data = meson_dw_hdmi;
 	dw_plat_data->input_bus_encoding = V4L2_YCBCR_ENC_709;
+	dw_plat_data->ycbcr_420_allowed = true;
 
 	platform_set_drvdata(pdev, meson_dw_hdmi);
 
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
