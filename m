Return-Path: <SRS0=f3iC=WQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE1DC3A589
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 08:42:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50B1A2377F
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 08:42:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nhJN9wmo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="budJapU3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50B1A2377F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P1YCnJ0P1uPPbdeh/450qA/5vYbsPo/cZyyjuGWUsOc=; b=nhJN9wmonE4IGc
	Grd2nxLqgqsCbf5sj3Nmg5skYdSiufYAd8grUZv7xJQr9Mai/eU34iKGxXGIsVo0OU3gTTCO80GHV
	8/ooPCksLhRGQC+x1vNK5tqQcfinsgTrK5dKYxMJo2p6ziSad4I0sKlm9PthkehKglDXCG60SvpPq
	sVwx1Sei1nIaLLcfE2hkHN7EVudfnUMaadn0mU4q5AEOyRuDF4x7relKxcCswQJ87Mp1XfiIxwX0W
	ibJjZiqpc0TxlzzXCRpGYF5B5bCQT7J7v5FXEuPd6ssJhbAlVn13G3292UpiGwoWaPDL48+ATjbBI
	Lw79Ru4ba5lLNO+Zmt2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hzziU-0005Uh-Gs; Tue, 20 Aug 2019 08:42:10 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hzzhm-00050N-EJ
 for linux-amlogic@lists.infradead.org; Tue, 20 Aug 2019 08:41:28 +0000
Received: by mail-wm1-x344.google.com with SMTP id o4so1862341wmh.2
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Aug 2019 01:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xy1qnLsKWFkepE2eVJklIXtvEsTFEdORlGXRZsnp/Hc=;
 b=budJapU3FIwjPA0nU+CX7g26XTXLWgqAsjOrAm3cQykqovVXGdtIO6vNopaqgdXlBT
 jzqIGHgFqRjHi5kXTz38nR8DHGCrPSBfqUEcPT7Qd9bL2Nod+gs5rhXkLXLo8FPq06yD
 hBHDw3HOdwE0VVnAcUwvqetXwCuDWo8wPte09VB3TU9Q+iX8rpkJu3cLG/aTrLo6g8q9
 bPOB5X59PhY4X5t5dTI0hN7I/KjBhZnkRf6+lAnONSRz8TQaGE85s3/YL4Mrxmf/g3Ul
 9aoxdDRntFYt+vArpjP65oQ6KujL2O4BWhK5AAMNE6jKyxMceBMY0fZuFktKgMJx1Pme
 EzGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xy1qnLsKWFkepE2eVJklIXtvEsTFEdORlGXRZsnp/Hc=;
 b=ZK0V51emKagulNo2VGVVcfN1wcdvr1QVBOZLsNsKfSfOdd/wjiAEss7KXV+ef//MnQ
 +egk7iSoUF4q6VA6KxK8XGVD4IUNknIeg6VP4XLqBiwxMfDfEt4yh+6ssR14jsstJI3F
 ViGKZWMtJUs4m1GxAvou7SwfFv8DkBmPH7xi3Fy+/PAFxzRG05No+Q6LOW4zRnxFI+4K
 fYnd8pSyDtHqIVjJP2LR4W3dn9IYCku3byoDZeQhDlMiNd5SYqpspaRJ1fGxkZW83pmF
 8TEL9tnEeu8TIanJwt5xdfTJ2ZRO3VhJ+Yzqn+zPiWvmBfRaHtYb9Iu2a4gHBrG3phHx
 wi3w==
X-Gm-Message-State: APjAAAVrOHlmihUV9LPlW4R7Zz+Sh3ecvmnv3vKb/zZv/Pi8lvUitXF8
 3SI4gIMWZTlkIlINj45dEuWUmA==
X-Google-Smtp-Source: APXvYqzXYjo5seCVjMxRWJExxoEuO7NDt8Wiuz3Jhx6O12NxwZDuG1xC/KDSUZlzcVTw6ABbi/ioOw==
X-Received: by 2002:a1c:d185:: with SMTP id i127mr13298939wmg.63.1566290484417; 
 Tue, 20 Aug 2019 01:41:24 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g2sm34275648wru.27.2019.08.20.01.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 01:41:23 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [RFC 10/11] drm/meson: vclk: add support for YUV420 setup
Date: Tue, 20 Aug 2019 10:41:08 +0200
Message-Id: <20190820084109.24616-11-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190820084109.24616-1-narmstrong@baylibre.com>
References: <20190820084109.24616-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_014126_609240_EAF4B00B 
X-CRM114-Status: GOOD (  17.36  )
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

This patch adds clocking support for the YUV420 output from the
Amlogic Meson SoCs Video Processing Unit to the HDMI Controller.

The YUV420 is obtained by generating a YUV444 pixel stream like
the classic HDMI display modes, but then the Video Encoder output
can be configured to down-sample the YUV444 pixel stream to a YUV420
stream.

This mode needs a different clock generation scheme since the TMDS PHY
clock must match the 10x ratio with the YUV420 pixel clock, but
the video encoder must run at 2x the pixel clock.

This patch adds the TMDS PHY clock value in all the video clock setup
in order to better support these specific uses cases and switch
to the Common Clock framework for clocks handling in the future.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c   | 24 ++++---
 drivers/gpu/drm/meson/meson_vclk.c      | 93 +++++++++++++++++++------
 drivers/gpu/drm/meson/meson_vclk.h      |  7 +-
 drivers/gpu/drm/meson/meson_venc_cvbs.c |  3 +-
 4 files changed, 93 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 2b278ee75100..3ce7a63fa994 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -372,15 +372,19 @@ static void dw_hdmi_set_vclk(struct meson_dw_hdmi *dw_hdmi,
 {
 	struct meson_drm *priv = dw_hdmi->priv;
 	int vic = drm_match_cea_mode(mode);
+	unsigned int phy_freq;
 	unsigned int vclk_freq;
 	unsigned int venc_freq;
 	unsigned int hdmi_freq;
 
 	vclk_freq = mode->clock;
 
+	/* TMDS clock is pixel_clock * 10 */
+	phy_freq = vclk_freq * 10;
+
 	if (!vic) {
-		meson_vclk_setup(priv, MESON_VCLK_TARGET_DMT, vclk_freq,
-				 vclk_freq, vclk_freq, false);
+		meson_vclk_setup(priv, MESON_VCLK_TARGET_DMT, phy_freq,
+				 vclk_freq, vclk_freq, vclk_freq, false);
 		return;
 	}
 
@@ -398,11 +402,11 @@ static void dw_hdmi_set_vclk(struct meson_dw_hdmi *dw_hdmi,
 	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
 		venc_freq /= 2;
 
-	DRM_DEBUG_DRIVER("vclk:%d venc=%d hdmi=%d enci=%d\n",
-		vclk_freq, venc_freq, hdmi_freq,
+	DRM_DEBUG_DRIVER("vclk:%d phy=%d venc=%d hdmi=%d enci=%d\n",
+		phy_freq, vclk_freq, venc_freq, hdmi_freq,
 		priv->venc.hdmi_use_enci);
 
-	meson_vclk_setup(priv, MESON_VCLK_TARGET_HDMI, vclk_freq,
+	meson_vclk_setup(priv, MESON_VCLK_TARGET_HDMI, phy_freq, vclk_freq,
 			 venc_freq, hdmi_freq, priv->venc.hdmi_use_enci);
 }
 
@@ -611,6 +615,7 @@ dw_hdmi_mode_valid(struct drm_connector *connector,
 		   const struct drm_display_mode *mode)
 {
 	struct meson_drm *priv = connector->dev->dev_private;
+	unsigned int phy_freq;
 	unsigned int vclk_freq;
 	unsigned int venc_freq;
 	unsigned int hdmi_freq;
@@ -637,6 +642,9 @@ dw_hdmi_mode_valid(struct drm_connector *connector,
 
 	vclk_freq = mode->clock;
 
+	/* TMDS clock is pixel_clock * 10 */
+	phy_freq = vclk_freq * 10;
+
 	/* 480i/576i needs global pixel doubling */
 	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
 		vclk_freq *= 2;
@@ -653,10 +661,10 @@ dw_hdmi_mode_valid(struct drm_connector *connector,
 	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
 		venc_freq /= 2;
 
-	dev_dbg(connector->dev->dev, "%s: vclk:%d venc=%d hdmi=%d\n", __func__,
-		vclk_freq, venc_freq, hdmi_freq);
+	dev_dbg(connector->dev->dev, "%s: vclk:%d phy=%d venc=%d hdmi=%d\n",
+		__func__, phy_freq, vclk_freq, venc_freq, hdmi_freq);
 
-	return meson_vclk_vic_supported_freq(vclk_freq);
+	return meson_vclk_vic_supported_freq(phy_freq, vclk_freq);
 }
 
 /* Encoder */
diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
index 8abff51f937d..aedbf2ded97c 100644
--- a/drivers/gpu/drm/meson/meson_vclk.c
+++ b/drivers/gpu/drm/meson/meson_vclk.c
@@ -353,12 +353,17 @@ enum {
 /* 2970 /1 /1 /1 /5 /2  => /1 /1 */
 	MESON_VCLK_HDMI_297000,
 /* 5940 /1 /1 /2 /5 /1  => /1 /1 */
-	MESON_VCLK_HDMI_594000
+	MESON_VCLK_HDMI_594000,
+/* 2970 /1 /1 /1 /5 /1  => /1 /2 */
+	MESON_VCLK_HDMI_594000_YUV420,
 };
 
 struct meson_vclk_params {
+	unsigned int pll_freq;
+	unsigned int phy_freq;
+	unsigned int vclk_freq;
+	unsigned int venc_freq;
 	unsigned int pixel_freq;
-	unsigned int pll_base_freq;
 	unsigned int pll_od1;
 	unsigned int pll_od2;
 	unsigned int pll_od3;
@@ -366,8 +371,11 @@ struct meson_vclk_params {
 	unsigned int vclk_div;
 } params[] = {
 	[MESON_VCLK_HDMI_ENCI_54000] = {
+		.pll_freq = 4320000,
+		.phy_freq = 270000,
+		.vclk_freq = 54000,
+		.venc_freq = 54000,
 		.pixel_freq = 54000,
-		.pll_base_freq = 4320000,
 		.pll_od1 = 4,
 		.pll_od2 = 4,
 		.pll_od3 = 1,
@@ -375,8 +383,11 @@ struct meson_vclk_params {
 		.vclk_div = 1,
 	},
 	[MESON_VCLK_HDMI_DDR_54000] = {
-		.pixel_freq = 54000,
-		.pll_base_freq = 4320000,
+		.pll_freq = 4320000,
+		.phy_freq = 270000,
+		.vclk_freq = 54000,
+		.venc_freq = 54000,
+		.pixel_freq = 27000,
 		.pll_od1 = 4,
 		.pll_od2 = 4,
 		.pll_od3 = 1,
@@ -384,8 +395,11 @@ struct meson_vclk_params {
 		.vclk_div = 1,
 	},
 	[MESON_VCLK_HDMI_DDR_148500] = {
-		.pixel_freq = 148500,
-		.pll_base_freq = 2970000,
+		.pll_freq = 2970000,
+		.phy_freq = 742500,
+		.vclk_freq = 148500,
+		.venc_freq = 148500,
+		.pixel_freq = 74250,
 		.pll_od1 = 4,
 		.pll_od2 = 1,
 		.pll_od3 = 1,
@@ -393,8 +407,11 @@ struct meson_vclk_params {
 		.vclk_div = 1,
 	},
 	[MESON_VCLK_HDMI_74250] = {
+		.pll_freq = 2970000,
+		.phy_freq = 742500,
+		.vclk_freq = 74250,
+		.venc_freq = 74250,
 		.pixel_freq = 74250,
-		.pll_base_freq = 2970000,
 		.pll_od1 = 2,
 		.pll_od2 = 2,
 		.pll_od3 = 2,
@@ -402,8 +419,11 @@ struct meson_vclk_params {
 		.vclk_div = 1,
 	},
 	[MESON_VCLK_HDMI_148500] = {
+		.pll_freq = 2970000,
+		.phy_freq = 1485000,
+		.vclk_freq = 148500,
+		.venc_freq = 148500,
 		.pixel_freq = 148500,
-		.pll_base_freq = 2970000,
 		.pll_od1 = 1,
 		.pll_od2 = 2,
 		.pll_od3 = 2,
@@ -411,8 +431,11 @@ struct meson_vclk_params {
 		.vclk_div = 1,
 	},
 	[MESON_VCLK_HDMI_297000] = {
+		.pll_freq = 5940000,
+		.phy_freq = 2970000,
+		.venc_freq = 297000,
+		.vclk_freq = 297000,
 		.pixel_freq = 297000,
-		.pll_base_freq = 5940000,
 		.pll_od1 = 2,
 		.pll_od2 = 1,
 		.pll_od3 = 1,
@@ -420,14 +443,29 @@ struct meson_vclk_params {
 		.vclk_div = 2,
 	},
 	[MESON_VCLK_HDMI_594000] = {
+		.pll_freq = 5940000,
+		.phy_freq = 5940000,
+		.venc_freq = 594000,
+		.vclk_freq = 594000,
 		.pixel_freq = 594000,
-		.pll_base_freq = 5940000,
 		.pll_od1 = 1,
 		.pll_od2 = 1,
 		.pll_od3 = 2,
 		.vid_pll_div = VID_PLL_DIV_5,
 		.vclk_div = 1,
 	},
+	[MESON_VCLK_HDMI_594000_YUV420] = {
+		.pll_freq = 5940000,
+		.phy_freq = 2970000,
+		.venc_freq = 594000,
+		.vclk_freq = 594000,
+		.pixel_freq = 297000,
+		.pll_od1 = 2,
+		.pll_od2 = 1,
+		.pll_od3 = 1,
+		.vid_pll_div = VID_PLL_DIV_5,
+		.vclk_div = 1,
+	},
 	{ /* sentinel */ },
 };
 
@@ -694,6 +732,7 @@ static void meson_hdmi_pll_generic_set(struct meson_drm *priv,
 	unsigned int od, m, frac, od1, od2, od3;
 
 	if (meson_hdmi_pll_find_params(priv, pll_freq, &m, &frac, &od)) {
+		/* OD2 goes to the PHY, and needs to be *10, so keep OD3=1 */
 		od3 = 1;
 		if (od < 4) {
 			od1 = 2;
@@ -716,21 +755,28 @@ static void meson_hdmi_pll_generic_set(struct meson_drm *priv,
 }
 
 enum drm_mode_status
-meson_vclk_vic_supported_freq(unsigned int freq)
+meson_vclk_vic_supported_freq(unsigned int phy_freq,
+			      unsigned int vclk_freq)
 {
 	int i;
 
-	DRM_DEBUG_DRIVER("freq = %d\n", freq);
+	DRM_DEBUG_DRIVER("phy_freq = %d vclk_freq = %d\n",
+			 phy_freq, vclk_freq);
 
 	for (i = 0 ; params[i].pixel_freq ; ++i) {
 		DRM_DEBUG_DRIVER("i = %d pixel_freq = %d alt = %d\n",
 				 i, params[i].pixel_freq,
 				 FREQ_1000_1001(params[i].pixel_freq));
+		DRM_DEBUG_DRIVER("i = %d phy_freq = %d alt = %d\n",
+				 i, params[i].phy_freq,
+				 FREQ_1000_1001(params[i].phy_freq/10)*10);
 		/* Match strict frequency */
-		if (freq == params[i].pixel_freq)
+		if (phy_freq == params[i].phy_freq &&
+		    vclk_freq == params[i].vclk_freq)
 			return MODE_OK;
 		/* Match 1000/1001 variant */
-		if (freq == FREQ_1000_1001(params[i].pixel_freq))
+		if (phy_freq == (FREQ_1000_1001(params[i].phy_freq/10)*10) &&
+		    vclk_freq == FREQ_1000_1001(params[i].vclk_freq))
 			return MODE_OK;
 	}
 
@@ -958,8 +1004,9 @@ static void meson_vclk_set(struct meson_drm *priv, unsigned int pll_base_freq,
 }
 
 void meson_vclk_setup(struct meson_drm *priv, unsigned int target,
-		      unsigned int vclk_freq, unsigned int venc_freq,
-		      unsigned int dac_freq, bool hdmi_use_enci)
+		      unsigned int phy_freq, unsigned int vclk_freq,
+		      unsigned int venc_freq, unsigned int dac_freq,
+		      bool hdmi_use_enci)
 {
 	bool vic_alternate_clock = false;
 	unsigned int freq;
@@ -978,7 +1025,7 @@ void meson_vclk_setup(struct meson_drm *priv, unsigned int target,
 		 * - venc_div = 1
 		 * - encp encoder
 		 */
-		meson_vclk_set(priv, vclk_freq * 10, 0, 0, 0,
+		meson_vclk_set(priv, phy_freq, 0, 0, 0,
 			       VID_PLL_DIV_5, 2, 1, 1, false, false);
 		return;
 	}
@@ -1000,9 +1047,11 @@ void meson_vclk_setup(struct meson_drm *priv, unsigned int target,
 	}
 
 	for (freq = 0 ; params[freq].pixel_freq ; ++freq) {
-		if (vclk_freq == params[freq].pixel_freq ||
-		    vclk_freq == FREQ_1000_1001(params[freq].pixel_freq)) {
-			if (vclk_freq != params[freq].pixel_freq)
+		if ((phy_freq == params[freq].phy_freq ||
+		     phy_freq == FREQ_1000_1001(params[freq].phy_freq/10)*10) &&
+		    (vclk_freq == params[freq].vclk_freq ||
+		     vclk_freq == FREQ_1000_1001(params[freq].vclk_freq))) {
+			if (vclk_freq != params[freq].vclk_freq)
 				vic_alternate_clock = true;
 			else
 				vic_alternate_clock = false;
@@ -1031,7 +1080,7 @@ void meson_vclk_setup(struct meson_drm *priv, unsigned int target,
 		return;
 	}
 
-	meson_vclk_set(priv, params[freq].pll_base_freq,
+	meson_vclk_set(priv, params[freq].pll_freq,
 		       params[freq].pll_od1, params[freq].pll_od2,
 		       params[freq].pll_od3, params[freq].vid_pll_div,
 		       params[freq].vclk_div, hdmi_tx_div, venc_div,
diff --git a/drivers/gpu/drm/meson/meson_vclk.h b/drivers/gpu/drm/meson/meson_vclk.h
index b62125540aef..aed0ab2efa71 100644
--- a/drivers/gpu/drm/meson/meson_vclk.h
+++ b/drivers/gpu/drm/meson/meson_vclk.h
@@ -25,10 +25,11 @@ enum {
 enum drm_mode_status
 meson_vclk_dmt_supported_freq(struct meson_drm *priv, unsigned int freq);
 enum drm_mode_status
-meson_vclk_vic_supported_freq(unsigned int freq);
+meson_vclk_vic_supported_freq(unsigned int phy_freq, unsigned int vclk_freq);
 
 void meson_vclk_setup(struct meson_drm *priv, unsigned int target,
-		      unsigned int vclk_freq, unsigned int venc_freq,
-		      unsigned int dac_freq, bool hdmi_use_enci);
+		      unsigned int phy_freq, unsigned int vclk_freq,
+		      unsigned int venc_freq, unsigned int dac_freq,
+		      bool hdmi_use_enci);
 
 #endif /* __MESON_VCLK_H */
diff --git a/drivers/gpu/drm/meson/meson_venc_cvbs.c b/drivers/gpu/drm/meson/meson_venc_cvbs.c
index 45a467f10b9b..7fe574adb8dd 100644
--- a/drivers/gpu/drm/meson/meson_venc_cvbs.c
+++ b/drivers/gpu/drm/meson/meson_venc_cvbs.c
@@ -205,7 +205,8 @@ static void meson_venc_cvbs_encoder_mode_set(struct drm_encoder *encoder,
 			/* Setup 27MHz vclk2 for ENCI and VDAC */
 			meson_vclk_setup(priv, MESON_VCLK_TARGET_CVBS,
 					 MESON_VCLK_CVBS, MESON_VCLK_CVBS,
-					 MESON_VCLK_CVBS, true);
+					 MESON_VCLK_CVBS, MESON_VCLK_CVBS,
+					 true);
 			break;
 		}
 	}
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
