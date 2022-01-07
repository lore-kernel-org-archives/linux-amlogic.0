Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFB7C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jan 2022 14:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/422eNYgtuvUo5bZG0OYreFJ2cL7TxG0sySvj3Fkqt0=; b=OdXs7sA8Rq5er2
	77W/L32ddtNN80YNO4QixZyFSLmb0tp3RaP6ZZeFxSaDmKD0D4pBhdVlA7ySxCGK/2Z5Fe904PnKh
	s9DyHiKF8/BQ5OJjX5LBXyltNAtJlp60DE5NGu3awrTbQsoKdAqM3XEphojZoUV4ZsvvqyolhMJs/
	LdZonSHi93aG5U97d1Jo7amW8hYJvyJHhSiaXnO0gDmOJVk0TioM1WjiMNv7jJdMSthSs+HvH9Iyj
	1IytOJakiU9Jx+iVpqIyec2gfkTDwrMxsvXq95reBVmK47i2wSkPgwf0EpWEqOB44mXCbPaYWMcYr
	xJJtlGYZa7V5yXLyOaWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5qfO-004KM5-Cb; Fri, 07 Jan 2022 14:56:30 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5qeQ-004JnL-Rq
 for linux-amlogic@lists.infradead.org; Fri, 07 Jan 2022 14:55:33 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so967472wme.0
 for <linux-amlogic@lists.infradead.org>; Fri, 07 Jan 2022 06:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VFZwn07Jf42Rg7k/gx/lsnWK8vEpodBGY1nxYIP45Co=;
 b=SXiREtI7DvACqaMKBYVCYdDVwkm0nV4JuIdPFzhYTKa7fqiyjtzW2YEZoFyIotPl6j
 /KrFLzRnMCeGWmslUGzNOOZf5elqJDFAYY5YBQVGJzm4yusQyFgeXyicrETlY0bmSuQd
 RRyBBpDzOzInl/xb/QgPU0S9hwoI+FN7VNxEdvkqc/3Y+fbAVNm9QxrWoSE86zb7FWep
 Nxuor8/UEm/KnLQSWN3XMD8beYtmrDgjsnTs/hNb0Br7yF6/fsi5Pkp2iLuYITKkWekp
 8rcRADKKerD7HsAnuZiO+55hTRzat9tiGZLpSd0N3LlrhH1URoRfaOEzqNGV7zs93ASK
 jn2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VFZwn07Jf42Rg7k/gx/lsnWK8vEpodBGY1nxYIP45Co=;
 b=crJfCtG0qAzT4z29jRSW0QxU6VpQze+Uqu8EV0uKlBp9nBy9sPEoYchD0idxlybWRK
 iSP5tJZ6ulu1bUYLpH1Y/7kvkp2r/KoV7XvCapBLsCCjRiOsJ1ZPhytoGAXXgVOkIoeF
 7UcshA0kE2eLx/+ul1K+ltBS5j+mqqAGRnttLL0I/UW22XFh6ke9HhdgKdBo6FUim8ue
 eIhtF6l3FgRaS8+P0vNzgAQcGK6lihX7o/IQRs6nLTqf82MT9SlcsrEslaZZS6QXyNdR
 lLo4VMCte0QBNxpm8T2LSvtHiY3SW/AsBwo6RoSan+KDz5J7Z+nkmDXLczmbHn+onW4d
 Xk2w==
X-Gm-Message-State: AOAM532iHgAOTmGoESwCZV3Fh1Y901qHZJdA/lPBG1oyRUD9Ux2BIwcs
 NWCaPij2lrlYn84EP969/vBROw==
X-Google-Smtp-Source: ABdhPJx3d7g/WcznS2OkJ88H1Pu58V9KR7gILLkyib5RT8vIhKNje9gHEIlSrDN8Yd+FRNGvfqseVQ==
X-Received: by 2002:a05:600c:228d:: with SMTP id
 13mr11567433wmf.134.1641567328229; 
 Fri, 07 Jan 2022 06:55:28 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:fc89:e826:8938:cbde])
 by smtp.gmail.com with ESMTPSA id n8sm5594492wri.47.2022.01.07.06.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 06:55:27 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 4/6] drm/meson: vclk: add DSI clock config
Date: Fri,  7 Jan 2022 15:55:13 +0100
Message-Id: <20220107145515.613009-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107145515.613009-1-narmstrong@baylibre.com>
References: <20220107145515.613009-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_065530_987402_F25C5414 
X-CRM114-Status: GOOD (  12.78  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The DSI path used the ENCL pixel encoder, thus this adds a clock
config using the HDMI PLL in order to feed the ENCL encoder via the
VCLK2 path and the CTS_ENCL clock output.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_vclk.c | 47 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/meson/meson_vclk.h |  1 +
 2 files changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
index 2a82119eb58e..5e4d982be1c8 100644
--- a/drivers/gpu/drm/meson/meson_vclk.c
+++ b/drivers/gpu/drm/meson/meson_vclk.c
@@ -55,6 +55,8 @@
 #define VCLK2_DIV_MASK		0xff
 #define VCLK2_DIV_EN		BIT(16)
 #define VCLK2_DIV_RESET		BIT(17)
+#define CTS_ENCL_SEL_MASK	(0xf << 12)
+#define CTS_ENCL_SEL_SHIFT	12
 #define CTS_VDAC_SEL_MASK	(0xf << 28)
 #define CTS_VDAC_SEL_SHIFT	28
 #define HHI_VIID_CLK_CNTL	0x12c /* 0x4b offset in data sheet */
@@ -83,6 +85,7 @@
 #define VCLK_DIV12_EN		BIT(4)
 #define HHI_VID_CLK_CNTL2	0x194 /* 0x65 offset in data sheet */
 #define CTS_ENCI_EN		BIT(0)
+#define CTS_ENCL_EN		BIT(3)
 #define CTS_ENCP_EN		BIT(2)
 #define CTS_VDAC_EN		BIT(4)
 #define HDMI_TX_PIXEL_EN	BIT(5)
@@ -1024,6 +1027,47 @@ static void meson_vclk_set(struct meson_drm *priv, unsigned int pll_base_freq,
 	regmap_update_bits(priv->hhi, HHI_VID_CLK_CNTL, VCLK_EN, VCLK_EN);
 }
 
+static void meson_dsi_clock_config(struct meson_drm *priv, unsigned int freq)
+{
+	meson_hdmi_pll_generic_set(priv, freq * 10);
+
+	/* Setup vid_pll divider value /5 */
+	meson_vid_pll_set(priv, VID_PLL_DIV_5);
+
+	/* Disable VCLK2 */
+	regmap_update_bits(priv->hhi, HHI_VIID_CLK_CNTL, VCLK2_EN, 0);
+
+	/* Setup the VCLK2 divider value /2 */
+	regmap_update_bits(priv->hhi, HHI_VIID_CLK_DIV, VCLK2_DIV_MASK, 2 - 1);
+
+	/* select vid_pll for vclk2 */
+	regmap_update_bits(priv->hhi, HHI_VIID_CLK_CNTL,
+			   VCLK2_SEL_MASK, (0 << VCLK2_SEL_SHIFT));
+
+	/* enable vclk2 gate */
+	regmap_update_bits(priv->hhi, HHI_VIID_CLK_CNTL, VCLK2_EN, VCLK2_EN);
+
+	/* select vclk2_div1 for encl */
+	regmap_update_bits(priv->hhi, HHI_VIID_CLK_DIV,
+			   CTS_ENCL_SEL_MASK, (8 << CTS_ENCL_SEL_SHIFT));
+
+	/* release vclk2_div_reset and enable vclk2_div */
+	regmap_update_bits(priv->hhi, HHI_VIID_CLK_DIV, VCLK2_DIV_EN | VCLK2_DIV_RESET,
+			   VCLK2_DIV_EN);
+
+	/* enable vclk2_div1 gate */
+	regmap_update_bits(priv->hhi, HHI_VIID_CLK_CNTL, VCLK2_DIV1_EN, VCLK2_DIV1_EN);
+
+	/* reset vclk2 */
+	regmap_update_bits(priv->hhi, HHI_VIID_CLK_CNTL, VCLK2_SOFT_RESET, VCLK2_SOFT_RESET);
+	regmap_update_bits(priv->hhi, HHI_VIID_CLK_CNTL, VCLK2_SOFT_RESET, 0);
+
+	/* enable encl_clk */
+	regmap_update_bits(priv->hhi, HHI_VID_CLK_CNTL2, CTS_ENCL_EN, CTS_ENCL_EN);
+
+	usleep_range(10000, 11000);
+}
+
 void meson_vclk_setup(struct meson_drm *priv, unsigned int target,
 		      unsigned int phy_freq, unsigned int vclk_freq,
 		      unsigned int venc_freq, unsigned int dac_freq,
@@ -1050,6 +1094,9 @@ void meson_vclk_setup(struct meson_drm *priv, unsigned int target,
 		meson_vclk_set(priv, phy_freq, 0, 0, 0,
 			       VID_PLL_DIV_5, 2, 1, 1, false, false);
 		return;
+	} else if (target == MESON_VCLK_TARGET_DSI) {
+		meson_dsi_clock_config(priv, phy_freq);
+		return;
 	}
 
 	hdmi_tx_div = vclk_freq / dac_freq;
diff --git a/drivers/gpu/drm/meson/meson_vclk.h b/drivers/gpu/drm/meson/meson_vclk.h
index 60617aaf18dd..1152b3af8d2e 100644
--- a/drivers/gpu/drm/meson/meson_vclk.h
+++ b/drivers/gpu/drm/meson/meson_vclk.h
@@ -17,6 +17,7 @@ enum {
 	MESON_VCLK_TARGET_CVBS = 0,
 	MESON_VCLK_TARGET_HDMI = 1,
 	MESON_VCLK_TARGET_DMT = 2,
+	MESON_VCLK_TARGET_DSI = 3,
 };
 
 /* 27MHz is the CVBS Pixel Clock */
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
