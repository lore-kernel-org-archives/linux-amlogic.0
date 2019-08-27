Return-Path: <SRS0=C9TS=WX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B37C3A5A3
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Aug 2019 08:14:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4B1021883
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Aug 2019 08:14:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tXqPkl3L";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="dKf+hYqW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4B1021883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WlH/HSt7HnoiBKQh+bsb+7o9MAftcQS0ZjGwFCf16lo=; b=tXqPkl3Ls5qqU1
	AnlFlqUU+9kI734eScVK+OPUX3i8aPRBQDoTkY/e40qsDFlRZLaB1s5636S5avbYao/xJa6Omez0J
	oA6lVLf9wujRzU4QKU6xIB3uJfx0cMY8XeE1t5NqTiNDoIJf/XsRcPm4e2JkF/TeJnKInauRQNQsl
	zHjvAO4XYlefi9Qj+0d5dWSOWGUVYT0pe3KZDe9Rbz7pbbjAIAwDXXsvqe+hBGha5/fGuwEdRXSa6
	sCHz/y1r+GPIcP6EfK+PPE1gZ9B9LShOuJhtLDwv3GLp8GfGkGOpF/khSTBoeNR7atNbHHPwsgYCl
	qcqT3kQWwnw4leFE8tzA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2Wcw-00047X-As; Tue, 27 Aug 2019 08:14:54 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2Wce-0003ni-J3
 for linux-amlogic@lists.infradead.org; Tue, 27 Aug 2019 08:14:38 +0000
Received: by mail-wm1-x342.google.com with SMTP id i63so1982399wmg.4
 for <linux-amlogic@lists.infradead.org>; Tue, 27 Aug 2019 01:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AHSCP8eF6R66zBKuoLdUdIg9WzlUKOlPH86Fd6tbhWo=;
 b=dKf+hYqW55ms2Fszjnk+WqnXaINcywJjgX6BKG6QUkaklf7//doHDj75pZ/1HsTgj6
 n7MEZf/VNHTv/IswknNw1al/HnBrMNX+NpEKMTn91vdli4zfnnB7V73bIL69Nf/NV/PF
 /138gumu+DGgweyinkT0YjsPYqfV02VEJIpKFvL2jl8bIPjXMijcMjJhUtLJJs7/DABU
 vtkP87S4tmgmzMPx/oSGhgsWNbL8FnwwBaWT70KUl3+R5f+6EFyBOuS6vWtoOIyR6VX/
 aQfUuqrOsQ0mHERnSL5xGa46GAxjAJL2mHf1h1YuBlDQwrBBkmmtysr3mU7Xkr9bPi6q
 vwYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AHSCP8eF6R66zBKuoLdUdIg9WzlUKOlPH86Fd6tbhWo=;
 b=boCFxXBNaM9Nm+5BvE9dJdkJYbDu6aECCApA6Q/oX2CumkaamUp7PIdizIujAuNdIh
 2k19NIYsROGmNyyCWzcWDUzZVQixeM3AnQXD0DX8ABS02VaHiAmxAI5DVAg+wgj4K35P
 jQ0/PGZH3Uz+SrvAfw7Tt9nN2QHiH4YKo+Fleyld1pAEX4dp+1sNCMyM8Rk+dqqjtC6U
 sJMCMhNm3/rhgGYLaFDsZwxQvcGmZbOsoASWI1tLj48bGU7bYsh4krADT8oLpABNyEc8
 M4idZk7WBrmbN5srO7mayNL975KzU/QKteQHbNQkJTrY4trRV6TECXHAECmJ65k8XQJz
 3Mxg==
X-Gm-Message-State: APjAAAUlZcJ673VaLBncoMud9EwdGNy+Qai3XoMpYRpjOl0pazrVfqE1
 XyyNPOgb8S96BwAV4UezX8Oypw==
X-Google-Smtp-Source: APXvYqyczMkD3BCWCKbqBKK2Epk+8BKX1eKSbZkdVuqz7gSEUlx6nyzrmOicXiNWRsP4gnuS1RSAcw==
X-Received: by 2002:a05:600c:389:: with SMTP id
 w9mr26156481wmd.119.1566893674449; 
 Tue, 27 Aug 2019 01:14:34 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id f18sm11911792wrx.85.2019.08.27.01.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 01:14:33 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH RFC v2 7/8] drm/meson: vclk: add support for YUV420 setup
Date: Tue, 27 Aug 2019 10:14:24 +0200
Message-Id: <20190827081425.15011-8-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190827081425.15011-1-narmstrong@baylibre.com>
References: <20190827081425.15011-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190827_011436_721446_CB78568D 
X-CRM114-Status: GOOD (  17.54  )
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
index 2c69024e5bcf..38316c6cac26 100644
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
 
@@ -613,6 +617,7 @@ dw_hdmi_mode_valid(struct drm_connector *connector,
 		   const struct drm_display_mode *mode)
 {
 	struct meson_drm *priv = connector->dev->dev_private;
+	unsigned int phy_freq;
 	unsigned int vclk_freq;
 	unsigned int venc_freq;
 	unsigned int hdmi_freq;
@@ -639,6 +644,9 @@ dw_hdmi_mode_valid(struct drm_connector *connector,
 
 	vclk_freq = mode->clock;
 
+	/* TMDS clock is pixel_clock * 10 */
+	phy_freq = vclk_freq * 10;
+
 	/* 480i/576i needs global pixel doubling */
 	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
 		vclk_freq *= 2;
@@ -655,10 +663,10 @@ dw_hdmi_mode_valid(struct drm_connector *connector,
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
index 869231c93617..a7cbbc75ef1b 100644
--- a/drivers/gpu/drm/meson/meson_vclk.c
+++ b/drivers/gpu/drm/meson/meson_vclk.c
@@ -354,12 +354,17 @@ enum {
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
@@ -367,8 +372,11 @@ struct meson_vclk_params {
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
@@ -376,8 +384,11 @@ struct meson_vclk_params {
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
@@ -385,8 +396,11 @@ struct meson_vclk_params {
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
@@ -394,8 +408,11 @@ struct meson_vclk_params {
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
@@ -403,8 +420,11 @@ struct meson_vclk_params {
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
@@ -412,8 +432,11 @@ struct meson_vclk_params {
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
@@ -421,14 +444,29 @@ struct meson_vclk_params {
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
 
@@ -696,6 +734,7 @@ static void meson_hdmi_pll_generic_set(struct meson_drm *priv,
 	unsigned int od, m, frac, od1, od2, od3;
 
 	if (meson_hdmi_pll_find_params(priv, pll_freq, &m, &frac, &od)) {
+		/* OD2 goes to the PHY, and needs to be *10, so keep OD3=1 */
 		od3 = 1;
 		if (od < 4) {
 			od1 = 2;
@@ -718,21 +757,28 @@ static void meson_hdmi_pll_generic_set(struct meson_drm *priv,
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
 
@@ -960,8 +1006,9 @@ static void meson_vclk_set(struct meson_drm *priv, unsigned int pll_base_freq,
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
@@ -981,7 +1028,7 @@ void meson_vclk_setup(struct meson_drm *priv, unsigned int target,
 		 * - venc_div = 1
 		 * - encp encoder
 		 */
-		meson_vclk_set(priv, vclk_freq * 10, 0, 0, 0,
+		meson_vclk_set(priv, phy_freq, 0, 0, 0,
 			       VID_PLL_DIV_5, 2, 1, 1, false, false);
 		return;
 	}
@@ -1003,9 +1050,11 @@ void meson_vclk_setup(struct meson_drm *priv, unsigned int target,
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
@@ -1034,7 +1083,7 @@ void meson_vclk_setup(struct meson_drm *priv, unsigned int target,
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
index 6dc130a24070..564def4d0b04 100644
--- a/drivers/gpu/drm/meson/meson_venc_cvbs.c
+++ b/drivers/gpu/drm/meson/meson_venc_cvbs.c
@@ -206,7 +206,8 @@ static void meson_venc_cvbs_encoder_mode_set(struct drm_encoder *encoder,
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
