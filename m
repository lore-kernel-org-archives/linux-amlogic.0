Return-Path: <SRS0=K5c1=PX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C85AC43387
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 16:18:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24A9220657
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 16:18:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B/rMG0s/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="LIH57qtJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24A9220657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rYYhD7F46Zrqpx9rEZmspvRL8PlC7CgLRqzEa0MI5oU=; b=B/rMG0s/22/ERK
	pQz8ywJgVRosn5pNEP5Cu+BGOxchqw+Z1u5jWMdCZO9w8H84jldttrQ467elGqZ9Z5eAfHRcSAi1t
	uzKc78K/DctB97d9CsgZsV8pfvSjtcenZEYxwbupzYV6KCN8AG4rYsMHPATeS5ROQ03L2JXTaiE9j
	m8i9iDJYEATxZi855FHETFFDMg7bs25aTLOZkDHxxunQ3V3tsVB+sJgXYwohI9PM/9W9n6NlJWzC/
	pXYXrykEn587OWAbs7KkWZKeIOpPO7UwiZyhWpsXYhCGzr6bgj2Kbovm39oKm+2JHCQZ2YGQxi5Ae
	pKcA7c9NKYf++ewkU8jA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjRPq-00077U-P1; Tue, 15 Jan 2019 16:18:14 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjRPk-00073k-Ut
 for linux-amlogic@lists.infradead.org; Tue, 15 Jan 2019 16:18:11 +0000
Received: by mail-wm1-x342.google.com with SMTP id b11so3904348wmj.1
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Jan 2019 08:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HLXCMBKEHPRUkMWtQbT+e5gi6t0D7BrUDp+VzPNZZWU=;
 b=LIH57qtJ9bScOvRwcMuHtVz3zC4uPGC/WwdZ1/FbBmgSciTc7XKr1cB+mbhqRu5Fdw
 s6z4zxHfwub+2iSYFUjsVJfjYqwM9qV50bKPTNuwWLKufVygGqsfKHmQkU7eepbZhDRi
 MOSlJx4RGHqdpLK15IEfLTXSIbgCKdEwngUsWYR54QCBW1iecqMVYWcp7LtpH9YOEiPi
 kdd4h6LuJxNX109XfQnpli6m1Qv6I8dVey1WwDmd9u0CDO6KFORSmHfIJGTVig4+J4BE
 NDtfGMxKlXE5vL8nXTB2GMw28NAUbiMTwp4VTg8fHTSwtsNeq3ED0QvxU5wf3TZBSAZk
 IjeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HLXCMBKEHPRUkMWtQbT+e5gi6t0D7BrUDp+VzPNZZWU=;
 b=TMmYmDwrlaxLm74Ay3Ty2457tcojlsFx/beQZHW2pw0+CmCqzHzKM8u7aVRNZlcoup
 IJoadeUA8sXAWq0vJUNmQytZOcjg+IwHPvJ8m4c3d1DYEKiYcRkIOdtQ+WUI5MO6qb/R
 UrI1Awx3e2AYp5mbbu3szT6Ta9Oeg5cyxX1LPRmbzHugntAYHyExLioebxG6nnBdbMM9
 1OFbaC0N40yqWNYv9sdl/ybLpTq1/vJvc/KngVrs1S0EotjfS1OZslxcEmIt/5Ykh6+T
 1U1td+PkX8ZVgKtIEkZ4Qwh/X6glTs1em5G/vcmixaK0VmfvVitDoGcT3VQYF3zxT2Ii
 J6ug==
X-Gm-Message-State: AJcUukcrliEd0zQZPlnEgC4dS9MVZAL0zanGV5J8S5Mma17oUfhrr6N1
 37oJMkSMZAhl+VAsd2/7h0fNhQ==
X-Google-Smtp-Source: ALg8bN5QkcuYSSB0K/Tu6w/p9b1GGniWxOFl4wQNXwbtHednhnP+cqT+40y2ZDCFZE2f6dl2x1EQfA==
X-Received: by 2002:a1c:8d53:: with SMTP id p80mr4207295wmd.68.1547569086866; 
 Tue, 15 Jan 2019 08:18:06 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o81sm54014829wmd.10.2019.01.15.08.18.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 15 Jan 2019 08:18:05 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: agust@denx.de,
	u-boot@lists.denx.de
Subject: [PATCH u-boot 03/11] video: dw_hdmi: add support for color conversion
Date: Tue, 15 Jan 2019 17:17:51 +0100
Message-Id: <20190115161759.1657-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190115161759.1657-1-narmstrong@baylibre.com>
References: <20190115161759.1657-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190115_081809_107963_BEB7928E 
X-CRM114-Status: GOOD (  17.98  )
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
Cc: mjourdan@baylibre.com, Neil Armstrong <narmstrong@baylibre.com>,
 Jorge Ramire-Ortiz <jramirez@baylibre.com>, linux-amlogic@lists.infradead.org,
 Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>

Some IPs like the meson VPU can only feed a particular pixel format to
dw_hdmi. As of now, the driver is hardcoded to use RGB888 as input.

This commit enables different pixel format inputs, with the appropriate
CSC configuration.

Signed-off-by: Jorge Ramire-Ortiz <jramirez@baylibre.com>
Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/video/dw_hdmi.c    | 253 ++++++++++++++++++++++++++++++++++++-
 include/dw_hdmi.h          |  72 +++++++++++
 include/media_bus_format.h | 156 +++++++++++++++++++++++
 3 files changed, 480 insertions(+), 1 deletion(-)
 create mode 100644 include/media_bus_format.h

diff --git a/drivers/video/dw_hdmi.c b/drivers/video/dw_hdmi.c
index e03f24fa98..463436edf3 100644
--- a/drivers/video/dw_hdmi.c
+++ b/drivers/video/dw_hdmi.c
@@ -8,6 +8,7 @@
 #include <common.h>
 #include <fdtdec.h>
 #include <asm/io.h>
+#include <media_bus_format.h>
 #include "dw_hdmi.h"
 
 struct tmds_n_cts {
@@ -52,6 +53,24 @@ static const struct tmds_n_cts n_cts_table[] = {
 	}
 };
 
+static const u16 csc_coeff_default[3][4] = {
+	{ 0x2000, 0x0000, 0x0000, 0x0000 },
+	{ 0x0000, 0x2000, 0x0000, 0x0000 },
+	{ 0x0000, 0x0000, 0x2000, 0x0000 }
+};
+
+static const u16 csc_coeff_rgb_in_eitu601[3][4] = {
+	{ 0x2591, 0x1322, 0x074b, 0x0000 },
+	{ 0x6535, 0x2000, 0x7acc, 0x0200 },
+	{ 0x6acd, 0x7534, 0x2000, 0x0200 }
+};
+
+static const u16 csc_coeff_rgb_out_eitu601[3][4] = {
+	{ 0x2000, 0x6926, 0x74fd, 0x010e },
+	{ 0x2000, 0x2cdd, 0x0000, 0x7e9a },
+	{ 0x2000, 0x0000, 0x38b4, 0x7e3b }
+};
+
 static void dw_hdmi_write(struct dw_hdmi *hdmi, u8 val, int offset)
 {
 	switch (hdmi->reg_io_width) {
@@ -162,9 +181,52 @@ static void hdmi_audio_set_samplerate(struct dw_hdmi *hdmi, u32 pixel_clk)
  */
 static void hdmi_video_sample(struct dw_hdmi *hdmi)
 {
-	u32 color_format = 0x01;
+	u32 color_format;
 	uint val;
 
+	switch (hdmi->hdmi_data.enc_in_bus_format) {
+	case MEDIA_BUS_FMT_RGB888_1X24:
+		color_format = 0x01;
+		break;
+	case MEDIA_BUS_FMT_RGB101010_1X30:
+		color_format = 0x03;
+		break;
+	case MEDIA_BUS_FMT_RGB121212_1X36:
+		color_format = 0x05;
+		break;
+	case MEDIA_BUS_FMT_RGB161616_1X48:
+		color_format = 0x07;
+		break;
+	case MEDIA_BUS_FMT_YUV8_1X24:
+	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
+		color_format = 0x09;
+		break;
+	case MEDIA_BUS_FMT_YUV10_1X30:
+	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
+		color_format = 0x0B;
+		break;
+	case MEDIA_BUS_FMT_YUV12_1X36:
+	case MEDIA_BUS_FMT_UYYVYY12_0_5X36:
+		color_format = 0x0D;
+		break;
+	case MEDIA_BUS_FMT_YUV16_1X48:
+	case MEDIA_BUS_FMT_UYYVYY16_0_5X48:
+		color_format = 0x0F;
+		break;
+	case MEDIA_BUS_FMT_UYVY8_1X16:
+		color_format = 0x16;
+		break;
+	case MEDIA_BUS_FMT_UYVY10_1X20:
+		color_format = 0x14;
+		break;
+	case MEDIA_BUS_FMT_UYVY12_1X24:
+		color_format = 0x12;
+		break;
+	default:
+		color_format = 0x01;
+		break;
+	}
+
 	val = HDMI_TX_INVID0_INTERNAL_DE_GENERATOR_DISABLE |
 	      ((color_format << HDMI_TX_INVID0_VIDEO_MAPPING_OFFSET) &
 	      HDMI_TX_INVID0_VIDEO_MAPPING_MASK);
@@ -457,6 +519,180 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
 	hdmi_write(hdmi, edid->vsync_len.typ, HDMI_FC_VSYNCINWIDTH);
 }
 
+static bool hdmi_bus_fmt_is_rgb(unsigned int bus_format)
+{
+	switch (bus_format) {
+	case MEDIA_BUS_FMT_RGB888_1X24:
+	case MEDIA_BUS_FMT_RGB101010_1X30:
+	case MEDIA_BUS_FMT_RGB121212_1X36:
+	case MEDIA_BUS_FMT_RGB161616_1X48:
+		return true;
+
+	default:
+		return false;
+	}
+}
+
+static bool hdmi_bus_fmt_is_yuv444(unsigned int bus_format)
+{
+	switch (bus_format) {
+	case MEDIA_BUS_FMT_YUV8_1X24:
+	case MEDIA_BUS_FMT_YUV10_1X30:
+	case MEDIA_BUS_FMT_YUV12_1X36:
+	case MEDIA_BUS_FMT_YUV16_1X48:
+		return true;
+
+	default:
+		return false;
+	}
+}
+
+static bool hdmi_bus_fmt_is_yuv422(unsigned int bus_format)
+{
+	switch (bus_format) {
+	case MEDIA_BUS_FMT_UYVY8_1X16:
+	case MEDIA_BUS_FMT_UYVY10_1X20:
+	case MEDIA_BUS_FMT_UYVY12_1X24:
+		return true;
+
+	default:
+		return false;
+	}
+}
+
+static int is_color_space_interpolation(struct dw_hdmi *hdmi)
+{
+	if (!hdmi_bus_fmt_is_yuv422(hdmi->hdmi_data.enc_in_bus_format))
+		return 0;
+
+	if (hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_out_bus_format) ||
+	    hdmi_bus_fmt_is_yuv444(hdmi->hdmi_data.enc_out_bus_format))
+		return 1;
+
+	return 0;
+}
+
+static int is_color_space_decimation(struct dw_hdmi *hdmi)
+{
+	if (!hdmi_bus_fmt_is_yuv422(hdmi->hdmi_data.enc_out_bus_format))
+		return 0;
+
+	if (hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_in_bus_format) ||
+	    hdmi_bus_fmt_is_yuv444(hdmi->hdmi_data.enc_in_bus_format))
+		return 1;
+
+	return 0;
+}
+
+static int hdmi_bus_fmt_color_depth(unsigned int bus_format)
+{
+	switch (bus_format) {
+	case MEDIA_BUS_FMT_RGB888_1X24:
+	case MEDIA_BUS_FMT_YUV8_1X24:
+	case MEDIA_BUS_FMT_UYVY8_1X16:
+	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
+		return 8;
+
+	case MEDIA_BUS_FMT_RGB101010_1X30:
+	case MEDIA_BUS_FMT_YUV10_1X30:
+	case MEDIA_BUS_FMT_UYVY10_1X20:
+	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
+		return 10;
+
+	case MEDIA_BUS_FMT_RGB121212_1X36:
+	case MEDIA_BUS_FMT_YUV12_1X36:
+	case MEDIA_BUS_FMT_UYVY12_1X24:
+	case MEDIA_BUS_FMT_UYYVYY12_0_5X36:
+		return 12;
+
+	case MEDIA_BUS_FMT_RGB161616_1X48:
+	case MEDIA_BUS_FMT_YUV16_1X48:
+	case MEDIA_BUS_FMT_UYYVYY16_0_5X48:
+		return 16;
+
+	default:
+		return 0;
+	}
+}
+
+static int is_color_space_conversion(struct dw_hdmi *hdmi)
+{
+	return hdmi->hdmi_data.enc_in_bus_format !=
+	       hdmi->hdmi_data.enc_out_bus_format;
+}
+
+static void dw_hdmi_update_csc_coeffs(struct dw_hdmi *hdmi)
+{
+	const u16 (*csc_coeff)[3][4] = &csc_coeff_default;
+	unsigned int i;
+	u32 csc_scale = 1;
+
+	if (is_color_space_conversion(hdmi)) {
+		if (hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_out_bus_format)) {
+			csc_coeff = &csc_coeff_rgb_out_eitu601;
+		} else if (hdmi_bus_fmt_is_rgb(
+					hdmi->hdmi_data.enc_in_bus_format)) {
+			csc_coeff = &csc_coeff_rgb_in_eitu601;
+			csc_scale = 0;
+		}
+	}
+
+	/* The CSC registers are sequential, alternating MSB then LSB */
+	for (i = 0; i < ARRAY_SIZE(csc_coeff_default[0]); i++) {
+		u16 coeff_a = (*csc_coeff)[0][i];
+		u16 coeff_b = (*csc_coeff)[1][i];
+		u16 coeff_c = (*csc_coeff)[2][i];
+
+		hdmi_write(hdmi, coeff_a & 0xff, HDMI_CSC_COEF_A1_LSB + i * 2);
+		hdmi_write(hdmi, coeff_a >> 8, HDMI_CSC_COEF_A1_MSB + i * 2);
+		hdmi_write(hdmi, coeff_b & 0xff, HDMI_CSC_COEF_B1_LSB + i * 2);
+		hdmi_write(hdmi, coeff_b >> 8, HDMI_CSC_COEF_B1_MSB + i * 2);
+		hdmi_write(hdmi, coeff_c & 0xff, HDMI_CSC_COEF_C1_LSB + i * 2);
+		hdmi_write(hdmi, coeff_c >> 8, HDMI_CSC_COEF_C1_MSB + i * 2);
+	}
+
+	hdmi_mod(hdmi, HDMI_CSC_SCALE, HDMI_CSC_SCALE_CSCSCALE_MASK, csc_scale);
+}
+
+static void hdmi_video_csc(struct dw_hdmi *hdmi)
+{
+	int color_depth = 0;
+	int interpolation = HDMI_CSC_CFG_INTMODE_DISABLE;
+	int decimation = 0;
+
+	/* YCC422 interpolation to 444 mode */
+	if (is_color_space_interpolation(hdmi))
+		interpolation = HDMI_CSC_CFG_INTMODE_CHROMA_INT_FORMULA1;
+	else if (is_color_space_decimation(hdmi))
+		decimation = HDMI_CSC_CFG_DECMODE_CHROMA_INT_FORMULA3;
+
+	switch (hdmi_bus_fmt_color_depth(hdmi->hdmi_data.enc_out_bus_format)) {
+	case 8:
+		color_depth = HDMI_CSC_SCALE_CSC_COLORDE_PTH_24BPP;
+		break;
+	case 10:
+		color_depth = HDMI_CSC_SCALE_CSC_COLORDE_PTH_30BPP;
+		break;
+	case 12:
+		color_depth = HDMI_CSC_SCALE_CSC_COLORDE_PTH_36BPP;
+		break;
+	case 16:
+		color_depth = HDMI_CSC_SCALE_CSC_COLORDE_PTH_48BPP;
+		break;
+
+	default:
+		return;
+	}
+
+	/* Configure the CSC registers */
+	hdmi_write(hdmi, interpolation | decimation, HDMI_CSC_CFG);
+
+	hdmi_mod(hdmi, HDMI_CSC_SCALE, HDMI_CSC_SCALE_CSC_COLORDE_PTH_MASK,
+		 color_depth);
+
+	dw_hdmi_update_csc_coeffs(hdmi);
+}
+
 /* hdmi initialization step b.4 */
 static void hdmi_enable_video_path(struct dw_hdmi *hdmi, bool audio)
 {
@@ -483,6 +719,20 @@ static void hdmi_enable_video_path(struct dw_hdmi *hdmi, bool audio)
 	clkdis &= ~HDMI_MC_CLKDIS_TMDSCLK_DISABLE;
 	hdmi_write(hdmi, clkdis, HDMI_MC_CLKDIS);
 
+	/* Enable csc path */
+	if (is_color_space_conversion(hdmi)) {
+		clkdis &= ~HDMI_MC_CLKDIS_CSCCLK_DISABLE;
+		hdmi_write(hdmi, clkdis, HDMI_MC_CLKDIS);
+	}
+
+	/* Enable color space conversion if needed */
+	if (is_color_space_conversion(hdmi))
+		hdmi_write(hdmi, HDMI_MC_FLOWCTRL_FEED_THROUGH_OFF_CSC_IN_PATH,
+			   HDMI_MC_FLOWCTRL);
+	else
+		hdmi_write(hdmi, HDMI_MC_FLOWCTRL_FEED_THROUGH_OFF_CSC_BYPASS,
+			   HDMI_MC_FLOWCTRL);
+
 	if (audio) {
 		clkdis &= ~HDMI_MC_CLKDIS_AUDCLK_DISABLE;
 		hdmi_write(hdmi, clkdis, HDMI_MC_CLKDIS);
@@ -736,6 +986,7 @@ int dw_hdmi_enable(struct dw_hdmi *hdmi, const struct display_timing *edid)
 	}
 
 	hdmi_video_packetize(hdmi);
+	hdmi_video_csc(hdmi);
 	hdmi_video_sample(hdmi);
 
 	hdmi_clear_overflow(hdmi);
diff --git a/include/dw_hdmi.h b/include/dw_hdmi.h
index 35edc189c0..90fb64bc99 100644
--- a/include/dw_hdmi.h
+++ b/include/dw_hdmi.h
@@ -174,6 +174,34 @@
 #define HDMI_MC_LOCKONCLOCK                     0x4006
 #define HDMI_MC_HEACPHY_RST                     0x4007
 
+/* Color Space  Converter Registers */
+#define HDMI_CSC_CFG                            0x4100
+#define HDMI_CSC_SCALE                          0x4101
+#define HDMI_CSC_COEF_A1_MSB                    0x4102
+#define HDMI_CSC_COEF_A1_LSB                    0x4103
+#define HDMI_CSC_COEF_A2_MSB                    0x4104
+#define HDMI_CSC_COEF_A2_LSB                    0x4105
+#define HDMI_CSC_COEF_A3_MSB                    0x4106
+#define HDMI_CSC_COEF_A3_LSB                    0x4107
+#define HDMI_CSC_COEF_A4_MSB                    0x4108
+#define HDMI_CSC_COEF_A4_LSB                    0x4109
+#define HDMI_CSC_COEF_B1_MSB                    0x410A
+#define HDMI_CSC_COEF_B1_LSB                    0x410B
+#define HDMI_CSC_COEF_B2_MSB                    0x410C
+#define HDMI_CSC_COEF_B2_LSB                    0x410D
+#define HDMI_CSC_COEF_B3_MSB                    0x410E
+#define HDMI_CSC_COEF_B3_LSB                    0x410F
+#define HDMI_CSC_COEF_B4_MSB                    0x4110
+#define HDMI_CSC_COEF_B4_LSB                    0x4111
+#define HDMI_CSC_COEF_C1_MSB                    0x4112
+#define HDMI_CSC_COEF_C1_LSB                    0x4113
+#define HDMI_CSC_COEF_C2_MSB                    0x4114
+#define HDMI_CSC_COEF_C2_LSB                    0x4115
+#define HDMI_CSC_COEF_C3_MSB                    0x4116
+#define HDMI_CSC_COEF_C3_LSB                    0x4117
+#define HDMI_CSC_COEF_C4_MSB                    0x4118
+#define HDMI_CSC_COEF_C4_LSB                    0x4119
+
 /* I2C Master Registers (E-DDC) */
 #define HDMI_I2CM_SLAVE                         0x7E00
 #define HDMI_I2CM_ADDRESS                       0x7E01
@@ -416,7 +444,11 @@ enum {
 	HDMI_AUD_INPUTCLKFS_128 = 0x0,
 
 	/* mc_clkdis field values */
+	HDMI_MC_CLKDIS_HDCPCLK_DISABLE = 0x40,
+	HDMI_MC_CLKDIS_CECCLK_DISABLE = 0x20,
+	HDMI_MC_CLKDIS_CSCCLK_DISABLE = 0x10,
 	HDMI_MC_CLKDIS_AUDCLK_DISABLE = 0x8,
+	HDMI_MC_CLKDIS_PREPCLK_DISABLE = 0x4,
 	HDMI_MC_CLKDIS_TMDSCLK_DISABLE = 0x2,
 	HDMI_MC_CLKDIS_PIXELCLK_DISABLE = 0x1,
 
@@ -444,6 +476,27 @@ enum {
 	HDMI_I2CM_DIV_FAST_MODE = 0x8,
 	HDMI_I2CM_DIV_STD_MODE = 0x0,
 	HDMI_I2CM_SOFTRSTZ_MASK = 0x1,
+
+	/* CSC_CFG field values */
+	HDMI_CSC_CFG_INTMODE_MASK = 0x30,
+	HDMI_CSC_CFG_INTMODE_OFFSET = 4,
+	HDMI_CSC_CFG_INTMODE_DISABLE = 0x00,
+	HDMI_CSC_CFG_INTMODE_CHROMA_INT_FORMULA1 = 0x10,
+	HDMI_CSC_CFG_INTMODE_CHROMA_INT_FORMULA2 = 0x20,
+	HDMI_CSC_CFG_DECMODE_MASK = 0x3,
+	HDMI_CSC_CFG_DECMODE_OFFSET = 0,
+	HDMI_CSC_CFG_DECMODE_DISABLE = 0x0,
+	HDMI_CSC_CFG_DECMODE_CHROMA_INT_FORMULA1 = 0x1,
+	HDMI_CSC_CFG_DECMODE_CHROMA_INT_FORMULA2 = 0x2,
+	HDMI_CSC_CFG_DECMODE_CHROMA_INT_FORMULA3 = 0x3,
+
+	/* CSC_SCALE field values */
+	HDMI_CSC_SCALE_CSC_COLORDE_PTH_MASK = 0xF0,
+	HDMI_CSC_SCALE_CSC_COLORDE_PTH_24BPP = 0x00,
+	HDMI_CSC_SCALE_CSC_COLORDE_PTH_30BPP = 0x50,
+	HDMI_CSC_SCALE_CSC_COLORDE_PTH_36BPP = 0x60,
+	HDMI_CSC_SCALE_CSC_COLORDE_PTH_48BPP = 0x70,
+	HDMI_CSC_SCALE_CSCSCALE_MASK = 0x03,
 };
 
 struct hdmi_mpll_config {
@@ -463,6 +516,24 @@ struct hdmi_phy_config {
 	u32 vlev_ctr;   /* voltage level control */
 };
 
+struct hdmi_vmode {
+	bool mdataenablepolarity;
+
+	unsigned int mpixelclock;
+	unsigned int mpixelrepetitioninput;
+	unsigned int mpixelrepetitionoutput;
+};
+
+struct hdmi_data_info {
+	unsigned int enc_in_bus_format;
+	unsigned int enc_out_bus_format;
+	unsigned int enc_in_encoding;
+	unsigned int enc_out_encoding;
+	unsigned int pix_repet_factor;
+	unsigned int hdcp_enable;
+	struct hdmi_vmode video_mode;
+};
+
 struct dw_hdmi {
 	ulong ioaddr;
 	const struct hdmi_mpll_config *mpll_cfg;
@@ -470,6 +541,7 @@ struct dw_hdmi {
 	u8 i2c_clk_high;
 	u8 i2c_clk_low;
 	u8 reg_io_width;
+	struct hdmi_data_info hdmi_data;
 
 	int (*phy_set)(struct dw_hdmi *hdmi, uint mpixelclock);
 	void (*write_reg)(struct dw_hdmi *hdmi, u8 val, int offset);
diff --git a/include/media_bus_format.h b/include/media_bus_format.h
new file mode 100644
index 0000000000..d6a5a3bfe6
--- /dev/null
+++ b/include/media_bus_format.h
@@ -0,0 +1,156 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Media Bus API header
+ *
+ * Copyright (C) 2009, Guennadi Liakhovetski <g.liakhovetski@gmx.de>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef __LINUX_MEDIA_BUS_FORMAT_H
+#define __LINUX_MEDIA_BUS_FORMAT_H
+
+/*
+ * These bus formats uniquely identify data formats on the data bus. Format 0
+ * is reserved, MEDIA_BUS_FMT_FIXED shall be used by host-client pairs, where
+ * the data format is fixed. Additionally, "2X8" means that one pixel is
+ * transferred in two 8-bit samples, "BE" or "LE" specify in which order those
+ * samples are transferred over the bus: "LE" means that the least significant
+ * bits are transferred first, "BE" means that the most significant bits are
+ * transferred first, and "PADHI" and "PADLO" define which bits - low or high,
+ * in the incomplete high byte, are filled with padding bits.
+ *
+ * The bus formats are grouped by type, bus_width, bits per component, samples
+ * per pixel and order of subsamples. Numerical values are sorted using generic
+ * numerical sort order (8 thus comes before 10).
+ *
+ * As their value can't change when a new bus format is inserted in the
+ * enumeration, the bus formats are explicitly given a numerical value. The next
+ * free values for each category are listed below, update them when inserting
+ * new pixel codes.
+ */
+
+#define MEDIA_BUS_FMT_FIXED			0x0001
+
+/* RGB - next is	0x101b */
+#define MEDIA_BUS_FMT_RGB444_1X12		0x1016
+#define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE	0x1001
+#define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE	0x1002
+#define MEDIA_BUS_FMT_RGB555_2X8_PADHI_BE	0x1003
+#define MEDIA_BUS_FMT_RGB555_2X8_PADHI_LE	0x1004
+#define MEDIA_BUS_FMT_RGB565_1X16		0x1017
+#define MEDIA_BUS_FMT_BGR565_2X8_BE		0x1005
+#define MEDIA_BUS_FMT_BGR565_2X8_LE		0x1006
+#define MEDIA_BUS_FMT_RGB565_2X8_BE		0x1007
+#define MEDIA_BUS_FMT_RGB565_2X8_LE		0x1008
+#define MEDIA_BUS_FMT_RGB666_1X18		0x1009
+#define MEDIA_BUS_FMT_RBG888_1X24		0x100e
+#define MEDIA_BUS_FMT_RGB666_1X24_CPADHI	0x1015
+#define MEDIA_BUS_FMT_RGB666_1X7X3_SPWG		0x1010
+#define MEDIA_BUS_FMT_BGR888_1X24		0x1013
+#define MEDIA_BUS_FMT_GBR888_1X24		0x1014
+#define MEDIA_BUS_FMT_RGB888_1X24		0x100a
+#define MEDIA_BUS_FMT_RGB888_2X12_BE		0x100b
+#define MEDIA_BUS_FMT_RGB888_2X12_LE		0x100c
+#define MEDIA_BUS_FMT_RGB888_1X7X4_SPWG		0x1011
+#define MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA	0x1012
+#define MEDIA_BUS_FMT_ARGB8888_1X32		0x100d
+#define MEDIA_BUS_FMT_RGB888_1X32_PADHI		0x100f
+#define MEDIA_BUS_FMT_RGB101010_1X30		0x1018
+#define MEDIA_BUS_FMT_RGB121212_1X36		0x1019
+#define MEDIA_BUS_FMT_RGB161616_1X48		0x101a
+
+/* YUV (including grey) - next is	0x202d */
+#define MEDIA_BUS_FMT_Y8_1X8			0x2001
+#define MEDIA_BUS_FMT_UV8_1X8			0x2015
+#define MEDIA_BUS_FMT_UYVY8_1_5X8		0x2002
+#define MEDIA_BUS_FMT_VYUY8_1_5X8		0x2003
+#define MEDIA_BUS_FMT_YUYV8_1_5X8		0x2004
+#define MEDIA_BUS_FMT_YVYU8_1_5X8		0x2005
+#define MEDIA_BUS_FMT_UYVY8_2X8			0x2006
+#define MEDIA_BUS_FMT_VYUY8_2X8			0x2007
+#define MEDIA_BUS_FMT_YUYV8_2X8			0x2008
+#define MEDIA_BUS_FMT_YVYU8_2X8			0x2009
+#define MEDIA_BUS_FMT_Y10_1X10			0x200a
+#define MEDIA_BUS_FMT_Y10_2X8_PADHI_LE		0x202c
+#define MEDIA_BUS_FMT_UYVY10_2X10		0x2018
+#define MEDIA_BUS_FMT_VYUY10_2X10		0x2019
+#define MEDIA_BUS_FMT_YUYV10_2X10		0x200b
+#define MEDIA_BUS_FMT_YVYU10_2X10		0x200c
+#define MEDIA_BUS_FMT_Y12_1X12			0x2013
+#define MEDIA_BUS_FMT_UYVY12_2X12		0x201c
+#define MEDIA_BUS_FMT_VYUY12_2X12		0x201d
+#define MEDIA_BUS_FMT_YUYV12_2X12		0x201e
+#define MEDIA_BUS_FMT_YVYU12_2X12		0x201f
+#define MEDIA_BUS_FMT_UYVY8_1X16		0x200f
+#define MEDIA_BUS_FMT_VYUY8_1X16		0x2010
+#define MEDIA_BUS_FMT_YUYV8_1X16		0x2011
+#define MEDIA_BUS_FMT_YVYU8_1X16		0x2012
+#define MEDIA_BUS_FMT_YDYUYDYV8_1X16		0x2014
+#define MEDIA_BUS_FMT_UYVY10_1X20		0x201a
+#define MEDIA_BUS_FMT_VYUY10_1X20		0x201b
+#define MEDIA_BUS_FMT_YUYV10_1X20		0x200d
+#define MEDIA_BUS_FMT_YVYU10_1X20		0x200e
+#define MEDIA_BUS_FMT_VUY8_1X24			0x2024
+#define MEDIA_BUS_FMT_YUV8_1X24			0x2025
+#define MEDIA_BUS_FMT_UYYVYY8_0_5X24		0x2026
+#define MEDIA_BUS_FMT_UYVY12_1X24		0x2020
+#define MEDIA_BUS_FMT_VYUY12_1X24		0x2021
+#define MEDIA_BUS_FMT_YUYV12_1X24		0x2022
+#define MEDIA_BUS_FMT_YVYU12_1X24		0x2023
+#define MEDIA_BUS_FMT_YUV10_1X30		0x2016
+#define MEDIA_BUS_FMT_UYYVYY10_0_5X30		0x2027
+#define MEDIA_BUS_FMT_AYUV8_1X32		0x2017
+#define MEDIA_BUS_FMT_UYYVYY12_0_5X36		0x2028
+#define MEDIA_BUS_FMT_YUV12_1X36		0x2029
+#define MEDIA_BUS_FMT_YUV16_1X48		0x202a
+#define MEDIA_BUS_FMT_UYYVYY16_0_5X48		0x202b
+
+/* Bayer - next is	0x3021 */
+#define MEDIA_BUS_FMT_SBGGR8_1X8		0x3001
+#define MEDIA_BUS_FMT_SGBRG8_1X8		0x3013
+#define MEDIA_BUS_FMT_SGRBG8_1X8		0x3002
+#define MEDIA_BUS_FMT_SRGGB8_1X8		0x3014
+#define MEDIA_BUS_FMT_SBGGR10_ALAW8_1X8		0x3015
+#define MEDIA_BUS_FMT_SGBRG10_ALAW8_1X8		0x3016
+#define MEDIA_BUS_FMT_SGRBG10_ALAW8_1X8		0x3017
+#define MEDIA_BUS_FMT_SRGGB10_ALAW8_1X8		0x3018
+#define MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8		0x300b
+#define MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8		0x300c
+#define MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8		0x3009
+#define MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8		0x300d
+#define MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_BE	0x3003
+#define MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE	0x3004
+#define MEDIA_BUS_FMT_SBGGR10_2X8_PADLO_BE	0x3005
+#define MEDIA_BUS_FMT_SBGGR10_2X8_PADLO_LE	0x3006
+#define MEDIA_BUS_FMT_SBGGR10_1X10		0x3007
+#define MEDIA_BUS_FMT_SGBRG10_1X10		0x300e
+#define MEDIA_BUS_FMT_SGRBG10_1X10		0x300a
+#define MEDIA_BUS_FMT_SRGGB10_1X10		0x300f
+#define MEDIA_BUS_FMT_SBGGR12_1X12		0x3008
+#define MEDIA_BUS_FMT_SGBRG12_1X12		0x3010
+#define MEDIA_BUS_FMT_SGRBG12_1X12		0x3011
+#define MEDIA_BUS_FMT_SRGGB12_1X12		0x3012
+#define MEDIA_BUS_FMT_SBGGR14_1X14		0x3019
+#define MEDIA_BUS_FMT_SGBRG14_1X14		0x301a
+#define MEDIA_BUS_FMT_SGRBG14_1X14		0x301b
+#define MEDIA_BUS_FMT_SRGGB14_1X14		0x301c
+#define MEDIA_BUS_FMT_SBGGR16_1X16		0x301d
+#define MEDIA_BUS_FMT_SGBRG16_1X16		0x301e
+#define MEDIA_BUS_FMT_SGRBG16_1X16		0x301f
+#define MEDIA_BUS_FMT_SRGGB16_1X16		0x3020
+
+/* JPEG compressed formats - next is	0x4002 */
+#define MEDIA_BUS_FMT_JPEG_1X8			0x4001
+
+/* Vendor specific formats - next is	0x5002 */
+
+/* S5C73M3 sensor specific interleaved UYVY and JPEG */
+#define MEDIA_BUS_FMT_S5C_UYVY_JPEG_1X8		0x5001
+
+/* HSV - next is	0x6002 */
+#define MEDIA_BUS_FMT_AHSV8888_1X32		0x6001
+
+#endif /* __LINUX_MEDIA_BUS_FORMAT_H */
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
