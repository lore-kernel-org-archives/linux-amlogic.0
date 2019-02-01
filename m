Return-Path: <SRS0=EwLr=QI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1DB7C282DB
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Feb 2019 12:08:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A42F3218AC
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Feb 2019 12:08:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dIYlKYeP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="NwBzbaxQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A42F3218AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zbWsvq9v6q7bltYcprvFzXfQvjPaPNLlnoEMo4pNtEo=; b=dIYlKYePLgszgUOMGPAkR5Hgu/
	MnKpIWfS1Zx+/o3YttO+c2dbfplqy7sk2Y3VBkmufyLeJjMGB5GkGolpJZXfeD4QwkNIdtwhkzWAq
	mMW4gK7aUBSkZssZgVLuR0H/2w3191omjoGSHwxfoUTXj4kW+UvkB2X2BnDpBUC24Ti3Rm8LIQLnO
	bQKVoc1OYbTeyHrVL1VoGdLb0lmDWumr9t32/t2lgubbL0ymbS7GDkAklv79O+yvhP2ydsy3cRWTt
	JrrmeXTCZrdVO7luwZgUIszzC6bQuoYvX89TNd1aces3seL1vJekJICwALtMZvEuluFm20RagGS7r
	RnHecPFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gpXcH-0007ly-UD; Fri, 01 Feb 2019 12:08:17 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpXc3-0007UM-RJ
 for linux-amlogic@lists.infradead.org; Fri, 01 Feb 2019 12:08:10 +0000
Received: by mail-wr1-x443.google.com with SMTP id x10so6817266wrs.8
 for <linux-amlogic@lists.infradead.org>; Fri, 01 Feb 2019 04:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=YmeQCsRJTNLKNsGg9dSIflZt2BFrMDndI8ETA/7O6Z8=;
 b=NwBzbaxQ2EzXc/pyPL/SLaR6CQSGI38APUnqvRwOWJ7iOB6bSAFOAbe4oyixX30p2Q
 RUBEMdzJ9tb7/X2Z8mShFnOZl/HNuJkctiVCQ134VXNDO7I8U9PII9Ur4Qt9/BAG7H8w
 pUdeD3oaDIJtxoDqD98zTwF+ZED3mJQrEvSY6Suu2jxXmLcO1oe9puh+YOMDSZEJOb4U
 eQaRqwUzqy+/lGAl49gdvb2K4j9FoFvZlHJ1PIa+hoXw+7XjFcv8g2H+ez/zR+y0YIPo
 Q2c9At1itibp3KZX/HpYlgVBVOD/qcoQS9I/oDL3lWVMZP0el1o13l/Wq2sl0j3/taKn
 BtHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=YmeQCsRJTNLKNsGg9dSIflZt2BFrMDndI8ETA/7O6Z8=;
 b=LoAESaRSA3K6Pzh3P4KVnPmtEciMPEHM/qCNSQ/RfwGQ0yl1G7DHeGT4uSTDpZqQvR
 XN3X0z4wh3UNrHqfrXobyC6ct/33n53n8ybByYv9nw+7kevXni4nFJDtFvyE+dA/OUyi
 sv95CuaOAnAEouhQuOpaThBHwj6c9f/DyFGLE3yBAxfZn3h+HUFoxizu9PmwR5+Oz3h0
 BZp5+kxpfTZmJ8PHPp8zXXWWGur99Y6TOR8P6AIefV2tc+amxIRd0v7/MPP4uz+EZfSV
 IKHR42SJ2hymIslChmD5BHAhJuFj8E1ClHH1aM88wrlJHNbgCqied5BUZbG+2VOBfsrh
 GvJg==
X-Gm-Message-State: AJcUukchiXqN5NqNe5XiEJcZcVlTuxxfZdOWYBOx1EK+/2PoRNdBflpN
 jvtIgCvP/UMkof2XNvD+zbIZSA==
X-Google-Smtp-Source: ALg8bN7fl9wZX5CMgbEWPCkQRG/0VgzT2HjpBK/xlFSw2GMQNCwJmbOsZdrTzKuTROEh6ExNMEjKzQ==
X-Received: by 2002:adf:e983:: with SMTP id h3mr36908139wrm.232.1549022880692; 
 Fri, 01 Feb 2019 04:08:00 -0800 (PST)
Received: from localhost.localdomain ([51.15.160.169])
 by smtp.gmail.com with ESMTPSA id m13sm2577103wmd.6.2019.02.01.04.07.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 01 Feb 2019 04:07:59 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
 p.zabel@pengutronix.de, Sandy Huang <hjc@rock-chips.com>, heiko@sntech.de,
 maxime.ripard@bootlin.com
Subject: [PATCH v2 4/8] drm/bridge: dw-hdmi: add support for YUV420 output
Date: Fri,  1 Feb 2019 12:07:49 +0000
Message-Id: <1549022873-40549-5-git-send-email-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1549022873-40549-1-git-send-email-narmstrong@baylibre.com>
References: <1549022873-40549-1-git-send-email-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190201_040804_177090_EF81CDE2 
X-CRM114-Status: GOOD (  19.67  )
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
MIME-Version: 1.0
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
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 65 ++++++++++++++++++++++++-------
 1 file changed, 51 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 6d5a2e9..a63e5f0 100644
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
@@ -1390,6 +1409,8 @@ static void hdmi_config_AVI(struct dw_hdmi *hdmi, struct drm_display_mode *mode)
 		frame.colorspace = HDMI_COLORSPACE_YUV444;
 	else if (hdmi_bus_fmt_is_yuv422(hdmi->hdmi_data.enc_out_bus_format))
 		frame.colorspace = HDMI_COLORSPACE_YUV422;
+	else if (hdmi_bus_fmt_is_yuv420(hdmi->hdmi_data.enc_out_bus_format))
+		frame.colorspace = HDMI_COLORSPACE_YUV420;
 	else
 		frame.colorspace = HDMI_COLORSPACE_RGB;
 
@@ -1547,15 +1568,18 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
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
@@ -1589,6 +1613,22 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
 
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
@@ -1607,7 +1647,7 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
 
 	/* Scrambling Control */
 	if (hdmi_info->scdc.supported) {
-		if (vmode->mpixelclock > HDMI14_MAX_TMDSCLK ||
+		if (vmode->mtmdsclock > HDMI14_MAX_TMDSCLK ||
 		    hdmi_info->scdc.scrambling.low_rates) {
 			/*
 			 * HDMI2.0 Specifies the following procedure:
@@ -1645,15 +1685,14 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
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
 
@@ -1661,7 +1700,6 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
 	hdmi_writeb(hdmi, vblank, HDMI_FC_INVBLANK);
 
 	/* Set up HSYNC active edge delay width (in pixel clks) */
-	h_de_hs = mode->hsync_start - mode->hdisplay;
 	hdmi_writeb(hdmi, h_de_hs >> 8, HDMI_FC_HSYNCINDELAY1);
 	hdmi_writeb(hdmi, h_de_hs, HDMI_FC_HSYNCINDELAY0);
 
@@ -1669,7 +1707,6 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
 	hdmi_writeb(hdmi, v_de_vs, HDMI_FC_VSYNCINDELAY);
 
 	/* Set up HSYNC active pulse width (in pixel clks) */
-	hsync_len = mode->hsync_end - mode->hsync_start;
 	hdmi_writeb(hdmi, hsync_len >> 8, HDMI_FC_HSYNCINWIDTH1);
 	hdmi_writeb(hdmi, hsync_len, HDMI_FC_HSYNCINWIDTH0);
 
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
