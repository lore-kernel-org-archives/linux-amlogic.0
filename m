Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7400C04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 13:38:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB8B720856
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 13:38:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dpEuuqhs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="j4uX6SCu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB8B720856
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0iuXAVK4LcW1E+LycBEthDNlZHWNbzbfZ1T372tYh7g=; b=dpEuuqhsIOYNbb
	projA2Ifw5lo5ZiIMUVRst41hqajv2snDU3DQhJOX8/mzSS51XkHcirPwrh+wmSswyG9gVgVTVq5d
	yFWwhvVqKZNwJpRQVXIq2YhH3H7TrqTAgWsOkX6e0bz1SD+GVUB/Iu/gXwXBBNctA+vDYYhca2nNs
	SxNXHR/4HQIAO8BZzWRUsrMzQCChx1aUDLaqXjcYit8idqad9W1+HW+6TWIyFRdh4ofdU8AazERYI
	YXvAq34fFpSip5NNB6cu36HFeD6V33Yi5LMarEsU46n4mtcupXOk503/Iz1dxUeBP8E2fcnR9DGbl
	tmdM6RGAiARvqV1B04EA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSiUW-00054o-GT; Mon, 20 May 2019 13:38:12 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSiUL-0004wC-Dr
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 13:38:03 +0000
Received: by mail-wr1-x443.google.com with SMTP id w8so14669640wrl.6
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 06:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WK3u8/ndCxq4jioi0PwfFEPZB+6Qz5E/d+j0WFTc0jY=;
 b=j4uX6SCuV87+MjAHfij8Yg59JJHav72YCDp5eiEkuT+Nu01QY4pI8MU6LRjJyFRjYl
 jCbkfPBb1oyu0D6ZoGWOiFGmqpk+EA67BqCO8TvPr4i17/FgiA7CV4uUdVRv8QavufmO
 Tpquff/U2q2P2ptXoCrSSLSc7DgFJ8sbBmzRZpleZhB2sSBFlr49KNvN17ln99+nB0D4
 KO8d+jcrBxyni4Kfd7CdHZD3QBknYuC36kfOJ3xKT3SeM99e802mY3xVAfW1wXgK9eJe
 3I4xAsYSoO3I3235eXfnkGXfpjh3PHBzdjXOYBtPXTQFmBiQWJIuZYu08f7957Uzf03x
 S7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WK3u8/ndCxq4jioi0PwfFEPZB+6Qz5E/d+j0WFTc0jY=;
 b=YkROWmapngj7F0N4lHtBBtmsGEJKrKS8R3EML4vUpj5UedvGYGMYcHHQ94fsU9wCiM
 E6GiJwJr1X8ROkYNM5chssx3jlqyQIEB5nTEAYCwVZUGxwyz5sw/FKIAX2EqsLhIYRxN
 f+ghVYpoCURH1MXCgV7CdY+JdDd24W0FjA414OYMJ5mSnPGI/2YnLgoFVms7R4UXSd8r
 kwQOhvz6qf4ujum8xKEoMytvVfgyozBJI6HN0i8/wvwhzwcpQDnhVMFQrQDwduoOH+qJ
 C/DM1zjbc37tpQtVxBnOAxvsLDpk0LegZxdwRYHnED0NeHNTHcxdvsZGhFfFDts8qP/F
 hqsw==
X-Gm-Message-State: APjAAAV6EYxH+c4vFbAXfRvvLhF4ZqHAkRALkcWWiLQw5qQbeswdvmmb
 W1QZpf05DQ0ICzxEtKYyXy+FzQ==
X-Google-Smtp-Source: APXvYqzUMHoSq9Wq79xRMpZ8XfEvh+NyiLctBUedlrZTgq0sEpkBGkE46QMIlYX5qWgsh1wLwlhF4A==
X-Received: by 2002:adf:f041:: with SMTP id t1mr39880363wro.74.1558359479889; 
 Mon, 20 May 2019 06:37:59 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t19sm12167059wmi.42.2019.05.20.06.37.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 20 May 2019 06:37:59 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com,
	Laurent.pinchart@ideasonboard.com
Subject: [PATCH 3/5] drm/bridge: dw-hdmi: Add support for dynamic output
 format setup
Date: Mon, 20 May 2019 15:37:51 +0200
Message-Id: <20190520133753.23871-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190520133753.23871-1-narmstrong@baylibre.com>
References: <20190520133753.23871-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_063801_649256_618E510D 
X-CRM114-Status: GOOD (  17.05  )
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
Cc: jernej.skrabec@siol.net, heiko@sntech.de,
 Neil Armstrong <narmstrong@baylibre.com>, maxime.ripard@bootlin.com,
 jonas@kwiboo.se, hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, hverkuil@xs4all.nl,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

In order to support the HDMI2.0 YUV420, YUV422 and the 10bit, 12bit and
16bits outpu use cases, add support for the recently introduced bridge
callback format_set().

This callback will setup the new input format and encoding from encoder,
then these information will be used instead of the default ones
in the dw_hdmi_setup() function.

To determine the output bus format, has been added :
- support for the connector display_info bus_formats, where a fixed
  output bus format can be enforced by the encoder
- support for synami output bus format depending on the input format,
  especially the YUV420 input bus format, enforcing YUV420 as output
  with the correct bit depth

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 121 ++++++++++++++++++++--
 1 file changed, 112 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index b50c49caf7ae..284ce59be8f8 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -103,6 +103,8 @@ struct hdmi_vmode {
 };
 
 struct hdmi_data_info {
+	unsigned int bridge_in_bus_format;
+	unsigned int bridge_in_encoding;
 	unsigned int enc_in_bus_format;
 	unsigned int enc_out_bus_format;
 	unsigned int enc_in_encoding;
@@ -1838,8 +1840,51 @@ static void hdmi_disable_overflow_interrupts(struct dw_hdmi *hdmi)
 		    HDMI_IH_MUTE_FC_STAT2);
 }
 
+/*
+ * The DW-HDMI CSC can only interpolate and decimate from 4:2:2 to 4:4:4/RGB
+ * and from 4:4:4/RGB to 4:2:2.
+ * Default to RGB output except if 4:2:0 as input, which CSC cannot convert.
+ */
+static unsigned long dw_hdmi_determine_output_bus_format(struct dw_hdmi *hdmi)
+{
+	unsigned int depth = hdmi_bus_fmt_color_depth(
+					hdmi->hdmi_data.enc_in_bus_format);
+	bool is_420 = hdmi_bus_fmt_is_yuv420(hdmi->hdmi_data.enc_in_bus_format);
+	unsigned long fmt = MEDIA_BUS_FMT_RGB888_1X24;
+
+	switch (depth) {
+	case 8:
+		if (is_420)
+			fmt = MEDIA_BUS_FMT_UYYVYY8_0_5X24;
+		else
+			fmt = MEDIA_BUS_FMT_RGB888_1X24;
+		break;
+	case 10:
+		if (is_420)
+			fmt = MEDIA_BUS_FMT_UYYVYY10_0_5X30;
+		else
+			fmt = MEDIA_BUS_FMT_RGB101010_1X30;
+		break;
+	case 12:
+		if (is_420)
+			fmt = MEDIA_BUS_FMT_UYYVYY12_0_5X36;
+		else
+			fmt = MEDIA_BUS_FMT_RGB121212_1X36;
+		break;
+	case 16:
+		if (is_420)
+			fmt = MEDIA_BUS_FMT_UYYVYY16_0_5X48;
+		else
+			fmt = MEDIA_BUS_FMT_RGB161616_1X48;
+		break;
+	}
+
+	return fmt;
+}
+
 static int dw_hdmi_setup(struct dw_hdmi *hdmi, struct drm_display_mode *mode)
 {
+	struct drm_display_info *display = &hdmi->connector.display_info;
 	int ret;
 
 	hdmi_disable_overflow_interrupts(hdmi);
@@ -1853,9 +1898,9 @@ static int dw_hdmi_setup(struct dw_hdmi *hdmi, struct drm_display_mode *mode)
 	}
 
 	if ((hdmi->vic == 6) || (hdmi->vic == 7) ||
-	    (hdmi->vic == 21) || (hdmi->vic == 22) ||
-	    (hdmi->vic == 2) || (hdmi->vic == 3) ||
-	    (hdmi->vic == 17) || (hdmi->vic == 18))
+		 (hdmi->vic == 21) || (hdmi->vic == 22) ||
+		 (hdmi->vic == 2) || (hdmi->vic == 3) ||
+		 (hdmi->vic == 17) || (hdmi->vic == 18))
 		hdmi->hdmi_data.enc_out_encoding = V4L2_YCBCR_ENC_601;
 	else
 		hdmi->hdmi_data.enc_out_encoding = V4L2_YCBCR_ENC_709;
@@ -1863,22 +1908,29 @@ static int dw_hdmi_setup(struct dw_hdmi *hdmi, struct drm_display_mode *mode)
 	hdmi->hdmi_data.video_mode.mpixelrepetitionoutput = 0;
 	hdmi->hdmi_data.video_mode.mpixelrepetitioninput = 0;
 
-	/* TOFIX: Get input format from plat data or fallback to RGB888 */
-	if (hdmi->plat_data->input_bus_format)
+	if (hdmi->hdmi_data.bridge_in_bus_format)
+		hdmi->hdmi_data.enc_in_bus_format =
+			hdmi->hdmi_data.bridge_in_bus_format;
+	else if (hdmi->plat_data->input_bus_format)
 		hdmi->hdmi_data.enc_in_bus_format =
 			hdmi->plat_data->input_bus_format;
 	else
 		hdmi->hdmi_data.enc_in_bus_format = MEDIA_BUS_FMT_RGB888_1X24;
 
-	/* TOFIX: Get input encoding from plat data or fallback to none */
-	if (hdmi->plat_data->input_bus_encoding)
+	if (hdmi->hdmi_data.bridge_in_encoding)
+		hdmi->hdmi_data.enc_in_encoding =
+			hdmi->hdmi_data.bridge_in_encoding;
+	else if (hdmi->plat_data->input_bus_encoding)
 		hdmi->hdmi_data.enc_in_encoding =
 			hdmi->plat_data->input_bus_encoding;
 	else
 		hdmi->hdmi_data.enc_in_encoding = V4L2_YCBCR_ENC_DEFAULT;
 
-	/* TOFIX: Default to RGB888 output format */
-	hdmi->hdmi_data.enc_out_bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+	if (display->num_bus_formats)
+		hdmi->hdmi_data.enc_out_bus_format = display->bus_formats[0];
+	else
+		hdmi->hdmi_data.enc_out_bus_format =
+				dw_hdmi_determine_output_bus_format(hdmi);
 
 	hdmi->hdmi_data.pix_repet_factor = 0;
 	hdmi->hdmi_data.hdcp_enable = 0;
@@ -2150,6 +2202,56 @@ dw_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
 	return mode_status;
 }
 
+static bool dw_hdmi_drm_bridge_format_set(struct drm_bridge *bridge,
+					 const u32 input_bus_format,
+					 const u32 input_encoding)
+{
+	struct dw_hdmi *hdmi = bridge->driver_private;
+
+	/* Filter supported input bus formats */
+	switch (input_bus_format) {
+	case MEDIA_BUS_FMT_RGB888_1X24:
+	case MEDIA_BUS_FMT_RGB101010_1X30:
+	case MEDIA_BUS_FMT_RGB121212_1X36:
+	case MEDIA_BUS_FMT_RGB161616_1X48:
+	case MEDIA_BUS_FMT_YUV8_1X24:
+	case MEDIA_BUS_FMT_YUV10_1X30:
+	case MEDIA_BUS_FMT_YUV12_1X36:
+	case MEDIA_BUS_FMT_YUV16_1X48:
+	case MEDIA_BUS_FMT_UYVY8_1X16:
+	case MEDIA_BUS_FMT_UYVY10_1X20:
+	case MEDIA_BUS_FMT_UYVY12_1X24:
+	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
+	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
+	case MEDIA_BUS_FMT_UYYVYY12_0_5X36:
+	case MEDIA_BUS_FMT_UYYVYY16_0_5X48:
+		break;
+	default:
+		dev_dbg(hdmi->dev, "Unsupported Input bus format %x\n",
+			input_bus_format);
+		return false;
+	}
+
+	/* Filter supported input bus encoding */
+	switch (input_encoding) {
+	case V4L2_YCBCR_ENC_DEFAULT:
+	case V4L2_YCBCR_ENC_601:
+	case V4L2_YCBCR_ENC_709:
+	case V4L2_YCBCR_ENC_XV601:
+	case V4L2_YCBCR_ENC_XV709:
+		break;
+	default:
+		dev_dbg(hdmi->dev, "Unsupported Input encoding %x\n",
+			input_bus_format);
+		return false;
+	}
+
+	hdmi->hdmi_data.bridge_in_bus_format = input_bus_format;
+	hdmi->hdmi_data.bridge_in_encoding = input_encoding;
+
+	return true;
+}
+
 static void dw_hdmi_bridge_mode_set(struct drm_bridge *bridge,
 				    const struct drm_display_mode *orig_mode,
 				    const struct drm_display_mode *mode)
@@ -2192,6 +2294,7 @@ static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
 	.disable = dw_hdmi_bridge_disable,
 	.mode_set = dw_hdmi_bridge_mode_set,
 	.mode_valid = dw_hdmi_bridge_mode_valid,
+	.format_set = dw_hdmi_drm_bridge_format_set,
 };
 
 static irqreturn_t dw_hdmi_i2c_irq(struct dw_hdmi *hdmi)
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
