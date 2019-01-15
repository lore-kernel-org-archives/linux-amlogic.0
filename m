Return-Path: <SRS0=K5c1=PX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D347DC43387
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 12:33:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A178820657
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 12:33:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ErDFdGnq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="fIqGQHyh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A178820657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bj0TU/rFr8zbuLy4f2dfzUI1bKTUQmyovCFkkPUJ5E8=; b=ErDFdGnq6jVN4f
	GgDn0FkKrqVm7Co0ZfjDUcHjYa/YftpD6LlWY2Vl2YXJNxGtMLeRgoqAdGMe54zz9iyU2xHg+fj1P
	z2MfymJRMpbg+3YUKDmLoUZgupGQugPqCkz+a3i7RX047zu/M7JpwHmkUmkeaYm1vDn1r/JEj+5JK
	U4pu7QbcmJU4Hji3yuUwwtWYQOGeAB4HmWn81LTlQwuMOxcyrVjNEqpo3Zy2YnBFokJnaBGgTjIVM
	n/BlVyCx+cJM5kBd/COOlmDpUNvj73bO+BAGnOarATtLEQAvO/NJaeS9eR5ybY4swKqM5F3MN+0kU
	f8ZFxC0yZHuqSOQ8m3Xw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjNuR-0006qL-Rz; Tue, 15 Jan 2019 12:33:35 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjNuI-0006fw-Vd
 for linux-amlogic@lists.infradead.org; Tue, 15 Jan 2019 12:33:31 +0000
Received: by mail-wm1-x342.google.com with SMTP id y185so932773wmd.1
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Jan 2019 04:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Nd1Cj+hoz2z03pL58bd6lWHRqjA5p8xij9MrrsVaWv8=;
 b=fIqGQHyhI5D0brVd6oBbeLBl6xfQaDfMFsInXy5MeqSDJONoJBUU+m0xl6TBh0X4JU
 Arq6dZxKd8qiGOtjvA8+d52kVKU7Y/FJ1URfUH+YYrUh4zZNuTZyk1nVL9a/waftAQLX
 n4yZG/0UiwpeqkuC3CgIjq7z+SEfIawajqhRECVUtL8whqv0UzSfNk8HA3cRoxaZywfj
 GHuz+UlmD20nA8NrQVwzlj+mPjc7oyYWq4mJHlwvZea+fv6VcF9dDEU4xG5UCxADH+cD
 MMp2SsoykL9I7n5gm76yrihH+W0OayuB46hj2uHxyPU3Zfv6pxA9Z5sRAmMC5qGT2eg0
 EG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Nd1Cj+hoz2z03pL58bd6lWHRqjA5p8xij9MrrsVaWv8=;
 b=LWLTorfsRqEWakRwRwz6D2EITq4Hrig9uWqoa0wx4ERWXj7UnopmUEKkrKs16srr0A
 la/djGE6tZ5U5dh6ndTMLBOgZjhg4mqzBuHauXEVaMv18XC8suNwLDVW1qeU+f3IVxb4
 YT3/T47XZzE0LIINthx5hYb0JXqq48ClDYvYYF80l43nrDPDO1Zm+BVqb6oNOlENHjat
 E7pdisdjj4A4ig95YTV2wfnj15eQRhK3Iac4HPnfqGJYTycNDksqUwTRBWTjv96B2VMh
 CKZ1XvqDcworLYOHGtC4bMfZzRbfx7Lqi+/Wu5ZLfRpGqCWL7EG/nIuAh9PfcQ+3KFPf
 tcJQ==
X-Gm-Message-State: AJcUukdu8yuvOrB62q/fknP3Z2TCz+w/U0yYEAw0gP2VEDq0VMkEITu+
 uYHb1+2FpoHEZ7y+YHxum60luw==
X-Google-Smtp-Source: ALg8bN73P7Zqc3nGhBH5gS9uiO9K4MKDpp5jpXRTtKf9q/mAYn1ou77aD+7y6mXRmLSMB1RysdlT5w==
X-Received: by 2002:a1c:7dd7:: with SMTP id y206mr3236670wmc.50.1547555604994; 
 Tue, 15 Jan 2019 04:33:24 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id x15sm75658842wrs.27.2019.01.15.04.33.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 15 Jan 2019 04:33:24 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
 Philipp Zabel <p.zabel@pengutronix.de>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 maxime.ripard@bootlin.com
Subject: [PATCH 4/8] drm/bridge: dw-hdmi: add support for YUV420 output
Date: Tue, 15 Jan 2019 13:33:11 +0100
Message-Id: <20190115123315.11069-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190115123315.11069-1-narmstrong@baylibre.com>
References: <20190115123315.11069-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190115_043327_045496_697A4BEB 
X-CRM114-Status: GOOD (  19.54  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, Zheng Yang <zhengyang@rock-chips.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

In order to support the HDMI2.0 YUV420 display modes, this patch
adds support for the YUV420 TMDS Clock divided by 2 and the controller
passthrough mode.

YUV420 Synopsys PHY support will need some specific configuration table
to support theses modes.

This patch is based on work from Zheng Yang <zhengyang@rock-chips.com> in
the Rockchip Linux 4.4 BSP at [1]

[1] https://github.com/rockchip-linux/kernel/tree/release-4.4

Cc: Zheng Yang <zhengyang@rock-chips.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 68 ++++++++++++++++++-----
 1 file changed, 54 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index fcd941d52753..4a9a24e854db 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -99,6 +99,7 @@ struct hdmi_vmode {
 	unsigned int mpixelclock;
 	unsigned int mpixelrepetitioninput;
 	unsigned int mpixelrepetitionoutput;
+	unsigned int mtmdsclock;
 };
 
 struct hdmi_data_info {
@@ -543,7 +544,7 @@ static void hdmi_init_clk_regenerator(struct dw_hdmi *hdmi)
 static void hdmi_clk_regenerator_update_pixel_clock(struct dw_hdmi *hdmi)
 {
 	mutex_lock(&hdmi->audio_mutex);
-	hdmi_set_clk_regenerator(hdmi, hdmi->hdmi_data.video_mode.mpixelclock,
+	hdmi_set_clk_regenerator(hdmi, hdmi->hdmi_data.video_mode.mtmdsclock,
 				 hdmi->sample_rate);
 	mutex_unlock(&hdmi->audio_mutex);
 }
@@ -552,7 +553,7 @@ void dw_hdmi_set_sample_rate(struct dw_hdmi *hdmi, unsigned int rate)
 {
 	mutex_lock(&hdmi->audio_mutex);
 	hdmi->sample_rate = rate;
-	hdmi_set_clk_regenerator(hdmi, hdmi->hdmi_data.video_mode.mpixelclock,
+	hdmi_set_clk_regenerator(hdmi, hdmi->hdmi_data.video_mode.mtmdsclock,
 				 hdmi->sample_rate);
 	mutex_unlock(&hdmi->audio_mutex);
 }
@@ -653,6 +654,20 @@ static bool hdmi_bus_fmt_is_yuv422(unsigned int bus_format)
 	}
 }
 
+static bool hdmi_bus_fmt_is_yuv420(unsigned int bus_format)
+{
+	switch (bus_format) {
+	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
+	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
+	case MEDIA_BUS_FMT_UYYVYY12_0_5X36:
+	case MEDIA_BUS_FMT_UYYVYY16_0_5X48:
+		return true;
+
+	default:
+		return false;
+	}
+}
+
 static int hdmi_bus_fmt_color_depth(unsigned int bus_format)
 {
 	switch (bus_format) {
@@ -882,7 +897,8 @@ static void hdmi_video_packetize(struct dw_hdmi *hdmi)
 	u8 val, vp_conf;
 
 	if (hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_out_bus_format) ||
-	    hdmi_bus_fmt_is_yuv444(hdmi->hdmi_data.enc_out_bus_format)) {
+	    hdmi_bus_fmt_is_yuv444(hdmi->hdmi_data.enc_out_bus_format) ||
+	    hdmi_bus_fmt_is_yuv420(hdmi->hdmi_data.enc_out_bus_format)) {
 		switch (hdmi_bus_fmt_color_depth(
 					hdmi->hdmi_data.enc_out_bus_format)) {
 		case 8:
@@ -1036,7 +1052,7 @@ EXPORT_SYMBOL_GPL(dw_hdmi_phy_i2c_write);
  */
 void dw_hdmi_set_high_tmds_clock_ratio(struct dw_hdmi *hdmi)
 {
-	unsigned long mtmdsclock = hdmi->hdmi_data.video_mode.mpixelclock;
+	unsigned long mtmdsclock = hdmi->hdmi_data.video_mode.mtmdsclock;
 
 	/* Control for TMDS Bit Period/TMDS Clock-Period Ratio */
 	if (hdmi->connector.display_info.hdmi.scdc.supported) {
@@ -1198,6 +1214,8 @@ static int hdmi_phy_configure_dwc_hdmi_3d_tx(struct dw_hdmi *hdmi,
 	const struct dw_hdmi_curr_ctrl *curr_ctrl = pdata->cur_ctr;
 	const struct dw_hdmi_phy_config *phy_config = pdata->phy_config;
 
+	/* TOFIX Will need 420 specific PHY configuration tables */
+
 	/* PLL/MPLL Cfg - always match on final entry */
 	for (; mpll_config->mpixelclock != ~0UL; mpll_config++)
 		if (mpixelclock <= mpll_config->mpixelclock)
@@ -1245,6 +1263,7 @@ static int hdmi_phy_configure(struct dw_hdmi *hdmi)
 	const struct dw_hdmi_phy_data *phy = hdmi->phy.data;
 	const struct dw_hdmi_plat_data *pdata = hdmi->plat_data;
 	unsigned long mpixelclock = hdmi->hdmi_data.video_mode.mpixelclock;
+	unsigned long mtmdsclock = hdmi->hdmi_data.video_mode.mtmdsclock;
 	int ret;
 
 	dw_hdmi_phy_power_off(hdmi);
@@ -1273,7 +1292,7 @@ static int hdmi_phy_configure(struct dw_hdmi *hdmi)
 	}
 
 	/* Wait for resuming transmission of TMDS clock and data */
-	if (mpixelclock > HDMI14_MAX_TMDSCLK)
+	if (mtmdsclock > HDMI14_MAX_TMDSCLK)
 		msleep(100);
 
 	return dw_hdmi_phy_power_on(hdmi);
@@ -1383,6 +1402,9 @@ static void hdmi_config_AVI(struct dw_hdmi *hdmi, struct drm_display_mode *mode)
 	struct hdmi_avi_infoframe frame;
 	u8 val;
 
+	if (hdmi_bus_fmt_is_yuv420(hdmi->hdmi_data.enc_out_bus_format))
+		is_hdmi2_sink = true;
+
 	/* Initialise info frame from DRM mode */
 	drm_hdmi_avi_infoframe_from_display_mode(&frame, mode, is_hdmi2_sink);
 
@@ -1390,6 +1412,8 @@ static void hdmi_config_AVI(struct dw_hdmi *hdmi, struct drm_display_mode *mode)
 		frame.colorspace = HDMI_COLORSPACE_YUV444;
 	else if (hdmi_bus_fmt_is_yuv422(hdmi->hdmi_data.enc_out_bus_format))
 		frame.colorspace = HDMI_COLORSPACE_YUV422;
+	else if (hdmi_bus_fmt_is_yuv420(hdmi->hdmi_data.enc_out_bus_format))
+		frame.colorspace = HDMI_COLORSPACE_YUV420;
 	else
 		frame.colorspace = HDMI_COLORSPACE_RGB;
 
@@ -1547,15 +1571,18 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
 	struct drm_hdmi_info *hdmi_info = &hdmi->connector.display_info.hdmi;
 	struct hdmi_vmode *vmode = &hdmi->hdmi_data.video_mode;
 	int hblank, vblank, h_de_hs, v_de_vs, hsync_len, vsync_len;
-	unsigned int vdisplay;
+	unsigned int vdisplay, hdisplay;
 
-	vmode->mpixelclock = mode->clock * 1000;
+	vmode->mtmdsclock = vmode->mpixelclock = mode->clock * 1000;
 
 	dev_dbg(hdmi->dev, "final pixclk = %d\n", vmode->mpixelclock);
 
+	if (hdmi_bus_fmt_is_yuv420(hdmi->hdmi_data.enc_out_bus_format))
+		vmode->mtmdsclock /= 2;
+
 	/* Set up HDMI_FC_INVIDCONF */
 	inv_val = (hdmi->hdmi_data.hdcp_enable ||
-		   vmode->mpixelclock > HDMI14_MAX_TMDSCLK ||
+		   vmode->mtmdsclock > HDMI14_MAX_TMDSCLK ||
 		   hdmi_info->scdc.scrambling.low_rates ?
 		HDMI_FC_INVIDCONF_HDCP_KEEPOUT_ACTIVE :
 		HDMI_FC_INVIDCONF_HDCP_KEEPOUT_INACTIVE);
@@ -1589,6 +1616,22 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
 
 	hdmi_writeb(hdmi, inv_val, HDMI_FC_INVIDCONF);
 
+	hdisplay = mode->hdisplay;
+	hblank = mode->htotal - mode->hdisplay;
+	h_de_hs = mode->hsync_start - mode->hdisplay;
+	hsync_len = mode->hsync_end - mode->hsync_start;
+
+	/*
+	 * When we're setting a YCbCr420 mode, we need
+	 * to adjust the horizontal timing to suit.
+	 */
+	if (hdmi_bus_fmt_is_yuv420(hdmi->hdmi_data.enc_out_bus_format)) {
+		hdisplay /= 2;
+		hblank /= 2;
+		h_de_hs /= 2;
+		hsync_len /= 2;
+	}
+
 	vdisplay = mode->vdisplay;
 	vblank = mode->vtotal - mode->vdisplay;
 	v_de_vs = mode->vsync_start - mode->vdisplay;
@@ -1607,7 +1650,7 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
 
 	/* Scrambling Control */
 	if (hdmi_info->scdc.supported) {
-		if (vmode->mpixelclock > HDMI14_MAX_TMDSCLK ||
+		if (vmode->mtmdsclock > HDMI14_MAX_TMDSCLK ||
 		    hdmi_info->scdc.scrambling.low_rates) {
 			/*
 			 * HDMI2.0 Specifies the following procedure:
@@ -1645,15 +1688,14 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
 	}
 
 	/* Set up horizontal active pixel width */
-	hdmi_writeb(hdmi, mode->hdisplay >> 8, HDMI_FC_INHACTV1);
-	hdmi_writeb(hdmi, mode->hdisplay, HDMI_FC_INHACTV0);
+	hdmi_writeb(hdmi, hdisplay >> 8, HDMI_FC_INHACTV1);
+	hdmi_writeb(hdmi, hdisplay, HDMI_FC_INHACTV0);
 
 	/* Set up vertical active lines */
 	hdmi_writeb(hdmi, vdisplay >> 8, HDMI_FC_INVACTV1);
 	hdmi_writeb(hdmi, vdisplay, HDMI_FC_INVACTV0);
 
 	/* Set up horizontal blanking pixel region width */
-	hblank = mode->htotal - mode->hdisplay;
 	hdmi_writeb(hdmi, hblank >> 8, HDMI_FC_INHBLANK1);
 	hdmi_writeb(hdmi, hblank, HDMI_FC_INHBLANK0);
 
@@ -1661,7 +1703,6 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
 	hdmi_writeb(hdmi, vblank, HDMI_FC_INVBLANK);
 
 	/* Set up HSYNC active edge delay width (in pixel clks) */
-	h_de_hs = mode->hsync_start - mode->hdisplay;
 	hdmi_writeb(hdmi, h_de_hs >> 8, HDMI_FC_HSYNCINDELAY1);
 	hdmi_writeb(hdmi, h_de_hs, HDMI_FC_HSYNCINDELAY0);
 
@@ -1669,7 +1710,6 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
 	hdmi_writeb(hdmi, v_de_vs, HDMI_FC_VSYNCINDELAY);
 
 	/* Set up HSYNC active pulse width (in pixel clks) */
-	hsync_len = mode->hsync_end - mode->hsync_start;
 	hdmi_writeb(hdmi, hsync_len >> 8, HDMI_FC_HSYNCINWIDTH1);
 	hdmi_writeb(hdmi, hsync_len, HDMI_FC_HSYNCINWIDTH0);
 
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
