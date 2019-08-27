Return-Path: <SRS0=C9TS=WX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B72D0C3A5A3
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Aug 2019 08:14:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 881AC206BF
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Aug 2019 08:14:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Nsh4MyU6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="KWmJrIF5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 881AC206BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XXK9R+lrIrW4WjjH+GqvGQklacc/wVXmNYdMOdJb3sQ=; b=Nsh4MyU6MYgFKL
	97RmkWDKrwQHLlvZVqAJAGHC7TPhp9pfYQbP6cr3liWGmuxhik/pZhU7BJ1/IHQhmYu6/7TS98NsW
	uEApm7KnwEC3znFkErsSAFXV2j62ZKGa9Va4dyYSjIEfqU565yNPwhVEN7A75o2fsp+RofkD0WMMA
	mXA7kvSADnxjZ8gkwcniAsdFIE4AKrJcb6jK4Pvhz/hddO5z2Em6PCICie5LTB57Z1/j+eEaBDV/o
	svU4qdHoqoleVDJztzFnpEF6YeBUxgXfb9hOdLHjmt43sYo49cUnIyBCgPQ9bYxw0ej1Lp5ly1RMc
	99xDjg6M/3hs9X52pXVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2Wcu-000456-6Q; Tue, 27 Aug 2019 08:14:52 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2Wcb-0003m1-NL
 for linux-amlogic@lists.infradead.org; Tue, 27 Aug 2019 08:14:37 +0000
Received: by mail-wm1-x341.google.com with SMTP id g67so2004754wme.1
 for <linux-amlogic@lists.infradead.org>; Tue, 27 Aug 2019 01:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D4e7iGHsnMCj/mwiWKJTzKLUGfzuq+WR9rmN1dnOPAE=;
 b=KWmJrIF5DhACxVfxJuxqoiBamz86vy3kyWZvsEo2ZlNlEFVsiGIFodSwTWpLcX6Fdx
 2VTUDNOipJSYOFR1VAQfxpxk9pGhaat/NPalWshlriMRzGHXauhgP9Wprs6gVW/OS2VB
 YfYrq+8zaQ8mwTufZOC0JrVP3i2RjQZRiBUa5ul3DdUIBra/NTzCZzalP9zNpuE1OJyq
 AKW5d5tq2dQlfXcLHn8DbO7oTNh840c3KKgo2moHwZqjCI6IuL5b05V5Aw/5x/LcNvLd
 90U+TMMR/B61z9ZJZ/tp9q6Kt+dlKFBi9qZcHqZtjFxubtEPajNniiknzSiu6VsapRyJ
 76jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D4e7iGHsnMCj/mwiWKJTzKLUGfzuq+WR9rmN1dnOPAE=;
 b=f9EY3WYOHflDs0+qiP+SxzXKFQ+IzIu9Cy4oxAH7OqJJC+ylr3wuI8YaZ3lFOlb2s2
 YMC6Nu63YPuao4HM/o+iaX7r7lRvhhG/8G+N9usNWpQm687jc7/Fl2PmM8LFE5ZVGmZY
 s/vcycmGLp5ItO4CodkkMWr97dINfD7ihA8qYTHffzUzCnvpIXnoIL5uYL4dezYk8o2/
 IC5XvlyrRARruw2ge8HK6MKSnTS8NTpB0QJPX1+VXITLUkozGTMVAEIKncJXsgluTvjp
 jjA72qLV2BKLidgMgVClE4AtBG6YWjakujwLX63H5c4iyxjC0ohevA2AL+0pFPapRbq5
 8kbA==
X-Gm-Message-State: APjAAAWfHYuEgdpmK0Q+K8+sFkadlW1BjkDoXDgHqGgNe7HU6pL5ozEt
 uzJk0RgWe0ftJpMZqfKPs5a03g==
X-Google-Smtp-Source: APXvYqzLXBigLBi2lvRnCuJqjyc4AYPGhWY6lt0F37CPz03pQQSr11lfP/riguLWT7NS8aD1+lTn4w==
X-Received: by 2002:a1c:a514:: with SMTP id o20mr27565979wme.149.1566893670659; 
 Tue, 27 Aug 2019 01:14:30 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id f18sm11911792wrx.85.2019.08.27.01.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 01:14:30 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH RFC v2 3/8] drm/bridge: synopsys: dw-hdmi: add bus format
 negociation
Date: Tue, 27 Aug 2019 10:14:20 +0200
Message-Id: <20190827081425.15011-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190827081425.15011-1-narmstrong@baylibre.com>
References: <20190827081425.15011-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190827_011433_770231_868C2B1C 
X-CRM114-Status: GOOD (  14.92  )
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

Add the atomic_get_output_bus_fmts, atomic_get_input_bus_fmts to negociate
the possible output and input formats for the current mode and monitor,
and use the negociated formats in a basic atomic_check callback.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 245 +++++++++++++++++++++-
 1 file changed, 241 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index bd65d0479683..00aacad51e29 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -1987,11 +1987,10 @@ static int dw_hdmi_setup(struct dw_hdmi *hdmi, struct drm_display_mode *mode)
 	hdmi->hdmi_data.video_mode.mpixelrepetitionoutput = 0;
 	hdmi->hdmi_data.video_mode.mpixelrepetitioninput = 0;
 
-	/* TOFIX: Get input format from plat data or fallback to RGB888 */
 	if (hdmi->plat_data->input_bus_format)
 		hdmi->hdmi_data.enc_in_bus_format =
 			hdmi->plat_data->input_bus_format;
-	else
+	else if (hdmi->hdmi_data.enc_in_bus_format == MEDIA_BUS_FMT_FIXED)
 		hdmi->hdmi_data.enc_in_bus_format = MEDIA_BUS_FMT_RGB888_1X24;
 
 	/* TOFIX: Get input encoding from plat data or fallback to none */
@@ -2001,8 +2000,8 @@ static int dw_hdmi_setup(struct dw_hdmi *hdmi, struct drm_display_mode *mode)
 	else
 		hdmi->hdmi_data.enc_in_encoding = V4L2_YCBCR_ENC_DEFAULT;
 
-	/* TOFIX: Default to RGB888 output format */
-	hdmi->hdmi_data.enc_out_bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+	if (hdmi->hdmi_data.enc_out_bus_format == MEDIA_BUS_FMT_FIXED)
+		hdmi->hdmi_data.enc_out_bus_format = MEDIA_BUS_FMT_RGB888_1X24;
 
 	hdmi->hdmi_data.pix_repet_factor = 0;
 	hdmi->hdmi_data.hdcp_enable = 0;
@@ -2227,6 +2226,240 @@ static const struct drm_connector_helper_funcs dw_hdmi_connector_helper_funcs =
 	.get_modes = dw_hdmi_connector_get_modes,
 };
 
+static void dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state,
+					unsigned int *num_output_fmts,
+					u32 *output_fmts)
+{
+	struct drm_connector *conn = conn_state->connector;
+	struct drm_display_info *info = &conn->display_info;
+	struct drm_display_mode *mode = &crtc_state->mode;
+	bool is_hdmi2_sink = info->hdmi.scdc.supported;	
+	int i = 0;
+
+	/*
+	 * If the current mode enforces 4:2:0, force the output but format
+	 * to 4:2:0 and do not add the YUV422/444/RGB formats
+	 */
+	if (drm_mode_is_420_only(info, mode) ||
+	    (!is_hdmi2_sink && drm_mode_is_420_also(info, mode))) {
+
+		/* Order bus formats from 16bit to 8bit if supported */
+		if (info->bpc == 16 &&
+		    (info->hdmi.y420_dc_modes & DRM_EDID_YCBCR420_DC_48)) {
+			if (output_fmts)
+				output_fmts[i] = MEDIA_BUS_FMT_UYYVYY16_0_5X48;
+			++i;
+		}
+
+		if (info->bpc >= 12 &&
+		    (info->hdmi.y420_dc_modes & DRM_EDID_YCBCR420_DC_36)) {
+			if (output_fmts)
+				output_fmts[i] = MEDIA_BUS_FMT_UYYVYY12_0_5X36;
+			++i;
+		}
+
+		if (info->bpc >= 10 &&
+		    (info->hdmi.y420_dc_modes & DRM_EDID_YCBCR420_DC_30)) {
+			if (output_fmts)
+				output_fmts[i] = MEDIA_BUS_FMT_UYYVYY10_0_5X30;
+			++i;
+		}
+
+		/* Default 8bit fallback */
+		if (output_fmts)
+			output_fmts[i] = MEDIA_BUS_FMT_UYYVYY8_0_5X24;
+		++i;
+
+		*num_output_fmts = i;
+
+		return;
+	}
+
+	/*
+	 * Order bus formats from 16bit to 8bit and from YUV422 to RGB
+	 * if supported. In any case the default RGB888 format is added
+	 */
+
+	if (info->bpc == 16) {
+		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444) {
+			if (output_fmts)
+				output_fmts[i] = MEDIA_BUS_FMT_YUV16_1X48;
+			++i;
+		}
+
+		if (output_fmts)
+			output_fmts[i] = MEDIA_BUS_FMT_RGB161616_1X48;
+		++i;
+	}
+
+	if (info->bpc >= 12) {
+		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422) {
+			if (output_fmts)
+				output_fmts[i] = MEDIA_BUS_FMT_UYVY12_1X24;
+			++i;
+		}
+
+		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444) {
+			if (output_fmts)
+				output_fmts[i] = MEDIA_BUS_FMT_YUV12_1X36;
+			++i;
+		}
+
+		if (output_fmts)
+			output_fmts[i] = MEDIA_BUS_FMT_RGB121212_1X36;
+		++i;
+	}
+
+	if (info->bpc >= 10) {
+		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422) {
+			if (output_fmts)
+				output_fmts[i] = MEDIA_BUS_FMT_UYVY10_1X20;
+			++i;
+		}
+
+		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444) {
+			if (output_fmts)
+				output_fmts[i] = MEDIA_BUS_FMT_YUV10_1X30;
+			++i;
+		}
+
+		if (output_fmts)
+			output_fmts[i] = MEDIA_BUS_FMT_RGB101010_1X30;
+		++i;
+	}
+
+	if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422) {
+		if (output_fmts)
+			output_fmts[i] = MEDIA_BUS_FMT_UYVY8_1X16;
+		++i;
+	}
+
+	if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444) {
+		if (output_fmts)
+			output_fmts[i] = MEDIA_BUS_FMT_YUV8_1X24;
+		++i;
+	}
+
+	/* Default 8bit RGB fallback */
+	if (output_fmts)
+		output_fmts[i] = MEDIA_BUS_FMT_RGB888_1X24;
+	++i;
+
+	*num_output_fmts = i;
+}
+
+static void dw_hdmi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state,
+					u32 output_fmt,
+					unsigned int *num_input_fmts,
+					u32 *input_fmts)
+{
+	int i = 0;
+
+	switch (output_fmt) {
+		/* 8bit */
+		case MEDIA_BUS_FMT_RGB888_1X24:
+			if (input_fmts)
+				input_fmts[i] = MEDIA_BUS_FMT_RGB888_1X24;
+			++i;
+		/* Fallthrought */
+		case MEDIA_BUS_FMT_YUV8_1X24:
+			if (input_fmts)
+				input_fmts[i] = MEDIA_BUS_FMT_YUV8_1X24;
+			++i;
+			break;
+		case MEDIA_BUS_FMT_UYVY8_1X16:
+		/* Fallthrought */
+		case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
+			if (input_fmts)
+				input_fmts[i] = output_fmt;
+			++i;
+			break;
+
+		/* 10bit */
+		case MEDIA_BUS_FMT_RGB101010_1X30:
+			if (input_fmts)
+				input_fmts[i] = output_fmt;
+			++i;
+		/* Fallthrought */
+		case MEDIA_BUS_FMT_YUV10_1X30:
+			if (input_fmts)
+				input_fmts[i] = MEDIA_BUS_FMT_YUV10_1X30;
+			++i;
+			break;
+		case MEDIA_BUS_FMT_UYVY10_1X20:
+		/* Fallthrought */
+		case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
+			if (input_fmts)
+				input_fmts[i] = output_fmt;
+			++i;
+			break;
+
+		/* 12bit */
+		case MEDIA_BUS_FMT_RGB121212_1X36:
+			if (input_fmts)
+				input_fmts[i] = output_fmt;
+			++i;
+		/* Fallthrought */
+		case MEDIA_BUS_FMT_YUV12_1X36:
+			if (input_fmts)
+				input_fmts[i] = MEDIA_BUS_FMT_YUV12_1X36;
+			++i;
+			break;
+		case MEDIA_BUS_FMT_UYVY12_1X24:
+		/* Fallthrought */
+		case MEDIA_BUS_FMT_UYYVYY12_0_5X36:
+			if (input_fmts)
+				input_fmts[i] = output_fmt;
+			++i;
+			break;
+
+		/* 16bit */
+		case MEDIA_BUS_FMT_RGB161616_1X48:
+			if (input_fmts)
+				input_fmts[i] = output_fmt;
+			++i;
+		/* Fallthrought */
+		case MEDIA_BUS_FMT_YUV16_1X48:
+			if (input_fmts)
+				input_fmts[i] = MEDIA_BUS_FMT_YUV16_1X48;
+			++i;
+			break;
+		case MEDIA_BUS_FMT_UYYVYY16_0_5X48:
+			if (input_fmts)
+				input_fmts[i] = output_fmt;
+			++i;
+			break;
+	}
+
+	*num_input_fmts = i;
+}
+
+static int dw_hdmi_bridge_atomic_check(struct drm_bridge *bridge,
+				       struct drm_bridge_state *bridge_state,
+				       struct drm_crtc_state *crtc_state,
+				       struct drm_connector_state *conn_state)
+{
+	struct dw_hdmi *hdmi = bridge->driver_private;
+
+	dev_dbg(hdmi->dev, "selected output format %x\n",
+			bridge_state->output_bus_cfg.fmt);
+
+	hdmi->hdmi_data.enc_out_bus_format = bridge_state->output_bus_cfg.fmt;
+
+	dev_dbg(hdmi->dev, "selected input format %x\n",
+			bridge_state->input_bus_cfg.fmt);
+
+	hdmi->hdmi_data.enc_in_bus_format = bridge_state->input_bus_cfg.fmt;
+
+	return 0;
+}
+
 static int dw_hdmi_bridge_attach(struct drm_bridge *bridge)
 {
 	struct dw_hdmi *hdmi = bridge->driver_private;
@@ -2327,6 +2560,9 @@ static void dw_hdmi_bridge_enable(struct drm_bridge *bridge)
 static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
 	.attach = dw_hdmi_bridge_attach,
 	.detach = dw_hdmi_bridge_detach,
+	.atomic_check = dw_hdmi_bridge_atomic_check,
+	.atomic_get_output_bus_fmts = dw_hdmi_bridge_atomic_get_output_bus_fmts,
+	.atomic_get_input_bus_fmts = dw_hdmi_bridge_atomic_get_input_bus_fmts,
 	.enable = dw_hdmi_bridge_enable,
 	.disable = dw_hdmi_bridge_disable,
 	.mode_set = dw_hdmi_bridge_mode_set,
@@ -2790,6 +3026,7 @@ __dw_hdmi_probe(struct platform_device *pdev,
 
 	hdmi->bridge.driver_private = hdmi;
 	hdmi->bridge.funcs = &dw_hdmi_bridge_funcs;
+
 #ifdef CONFIG_OF
 	hdmi->bridge.of_node = pdev->dev.of_node;
 #endif
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
