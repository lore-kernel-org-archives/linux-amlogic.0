Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A99DC433FE
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jan 2022 14:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pKmCUncjEblRM2G/T+IspfywyNBwU90ZbTzUA24lQ+A=; b=WRtPVlRm6KNpo3
	dsQTvfhsqliAxho20is6uY+EwfXmPrjY0rs2wV4sb8LSm3jUt80MW3fPHu5n2ppPvVBFsV6Z5W5va
	PzNUb1mkjDYjHqOXT8SnrxGqDsbNGjF0SnbPytG1MCmSJNfZ3FogZBNqxTW0iGZUiU2eRfuhmFL0J
	24bD93qexmLLo/E5q7IKQNW08cvItTS5ZmaRYWWLYbf+XjtF4xmem1P5UVsjdUWz3vxQ9r97EHdvb
	B5MWRdnFcXQBo94W6TZb+ZBQug9MxOm1LwSBajhMPPMxlV6EPGvnyPXCH001lGPSo2CHtl2rL23rx
	OoUC63n48wHJ0fT5Zv2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5qfr-004Kex-0d; Fri, 07 Jan 2022 14:56:59 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5qeQ-004Jn0-Ry
 for linux-amlogic@lists.infradead.org; Fri, 07 Jan 2022 14:55:35 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 bg19-20020a05600c3c9300b0034565e837b6so3543120wmb.1
 for <linux-amlogic@lists.infradead.org>; Fri, 07 Jan 2022 06:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LtshNUIT9g+YpDW+NWrUuTDRNeZDvITsLsH/cm24sno=;
 b=B9jzPXrDzcllSeZg3f6CjLfAfk92PhG08NJryQUpsUMkljOe52uT300GPI+PecGIM3
 9Ew+PZUvQkp9zx9ncKRXW+WDrBoP4OaFfz30JJrEVXTSsAHpJHRSYAoieicXL05M1C9U
 JD3MkFpXDPfnI5INme+en9GFLeYLhyC3U/7nczohPUCVUIlloFsKc9FMFI/XrSyaMlTi
 gq9bp7lHgEg1x2CqT6j+Kdh5D1IO6o5G7O/xj/20vyBK5jmpuxP1LmXAYCiW/4UNBGtv
 GTU/rBrBAuE9CCLX7XngCvVed/oiG05NjFRZWwR1yNrYaDjhA8vsWte0D0vopEcXeJu8
 G44Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LtshNUIT9g+YpDW+NWrUuTDRNeZDvITsLsH/cm24sno=;
 b=443cpUtlA3vgngVVNIAWBivMbx81jxxXIsp2ildpfiurZgbyfujQR+J9hO8DIqkVMK
 Q6m5oFkqDDk6snHzxyXaykb6uDBlAvlqrwLOnmuZENtZKrhOWRVwy8JItoUIRT3ekzAf
 fLF+5bm5FikIwljiMBfwOcssaH2rpfScpNVwTRXygVoL9bey7SMYrOZrcYtJA4YW4eb+
 glcIYI4khERHelBlNxVrJJxNfKJ3X+I6357HeqsQ997Zuc2OqfwAx0Jfko45+05//dzJ
 PpJGdKv/m3j+2rLFLnkB+a+e3YWrwfpSY9Tw4x9h4Fyw3FHcRO0yIgi+ZXXJEhilncww
 8jug==
X-Gm-Message-State: AOAM532dXVofEyWzTVQ/OCIM+xUoYItReRMAM+CaxSdrpp0QINipfAxD
 JXvTy7PFHWAkjAdBhXm0FpvjcQ==
X-Google-Smtp-Source: ABdhPJye4pGIKQsNuqxDEi9QsXibz5eV8gqHYxCEs7VRpIgRfj4EMBE4SL1+RSczondzAAefraZU/Q==
X-Received: by 2002:a05:600c:4013:: with SMTP id
 i19mr11378897wmm.93.1641567327246; 
 Fri, 07 Jan 2022 06:55:27 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:fc89:e826:8938:cbde])
 by smtp.gmail.com with ESMTPSA id n8sm5594492wri.47.2022.01.07.06.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 06:55:26 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 3/6] drm/meson: venc: add ENCL encoder setup for MIPI-DSI
 output
Date: Fri,  7 Jan 2022 15:55:12 +0100
Message-Id: <20220107145515.613009-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107145515.613009-1-narmstrong@baylibre.com>
References: <20220107145515.613009-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_065531_079914_28150F28 
X-CRM114-Status: GOOD (  17.95  )
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

This adds supports for the ENCL encoder connected to a MIPI-DSI transceiver on the
Amlogic AXG SoCs.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_venc.c | 230 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/meson/meson_venc.h |   6 +
 drivers/gpu/drm/meson/meson_vpp.h  |   2 +
 3 files changed, 236 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
index 3c55ed003359..b430dc06aa34 100644
--- a/drivers/gpu/drm/meson/meson_venc.c
+++ b/drivers/gpu/drm/meson/meson_venc.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/export.h>
+#include <linux/iopoll.h>
 
 #include <drm/drm_modes.h>
 
@@ -1557,6 +1558,224 @@ void meson_venc_hdmi_mode_set(struct meson_drm *priv, int vic,
 }
 EXPORT_SYMBOL_GPL(meson_venc_hdmi_mode_set);
 
+static unsigned short meson_encl_gamma_table[256] = {
+	0, 4, 8, 12, 16, 20, 24, 28, 32, 36, 40, 44, 48, 52, 56, 60,
+	64, 68, 72, 76, 80, 84, 88, 92, 96, 100, 104, 108, 112, 116, 120, 124,
+	128, 132, 136, 140, 144, 148, 152, 156, 160, 164, 168, 172, 176, 180, 184, 188,
+	192, 196, 200, 204, 208, 212, 216, 220, 224, 228, 232, 236, 240, 244, 248, 252,
+	256, 260, 264, 268, 272, 276, 280, 284, 288, 292, 296, 300, 304, 308, 312, 316,
+	320, 324, 328, 332, 336, 340, 344, 348, 352, 356, 360, 364, 368, 372, 376, 380,
+	384, 388, 392, 396, 400, 404, 408, 412, 416, 420, 424, 428, 432, 436, 440, 444,
+	448, 452, 456, 460, 464, 468, 472, 476, 480, 484, 488, 492, 496, 500, 504, 508,
+	512, 516, 520, 524, 528, 532, 536, 540, 544, 548, 552, 556, 560, 564, 568, 572,
+	576, 580, 584, 588, 592, 596, 600, 604, 608, 612, 616, 620, 624, 628, 632, 636,
+	640, 644, 648, 652, 656, 660, 664, 668, 672, 676, 680, 684, 688, 692, 696, 700,
+	704, 708, 712, 716, 720, 724, 728, 732, 736, 740, 744, 748, 752, 756, 760, 764,
+	768, 772, 776, 780, 784, 788, 792, 796, 800, 804, 808, 812, 816, 820, 824, 828,
+	832, 836, 840, 844, 848, 852, 856, 860, 864, 868, 872, 876, 880, 884, 888, 892,
+	896, 900, 904, 908, 912, 916, 920, 924, 928, 932, 936, 940, 944, 948, 952, 956,
+	960, 964, 968, 972, 976, 980, 984, 988, 992, 996, 1000, 1004, 1008, 1012, 1016, 1020,
+};
+
+#define GAMMA_VCOM_POL    7     /* RW */
+#define GAMMA_RVS_OUT     6     /* RW */
+#define ADR_RDY           5     /* Read Only */
+#define WR_RDY            4     /* Read Only */
+#define RD_RDY            3     /* Read Only */
+#define GAMMA_TR          2     /* RW */
+#define GAMMA_SET         1     /* RW */
+#define GAMMA_EN          0     /* RW */
+
+#define H_RD              12
+#define H_AUTO_INC        11
+#define H_SEL_R           10
+#define H_SEL_G           9
+#define H_SEL_B           8
+#define HADR_MSB          7            /* 7:0 */
+#define HADR              0            /* 7:0 */
+
+#define GAMMA_RETRY       1000
+
+static void meson_encl_set_gamma_table(struct meson_drm *priv, u16 *data,
+				       u32 rgb_mask)
+{
+	int i, ret;
+	u32 reg;
+
+	writel_bits_relaxed(BIT(GAMMA_EN), 0,
+			    priv->io_base + _REG(L_GAMMA_CNTL_PORT));
+
+	ret = readl_relaxed_poll_timeout(priv->io_base +
+						_REG(L_GAMMA_CNTL_PORT),
+					 reg, reg & BIT(ADR_RDY), 10, 10000);
+	if (ret)
+		pr_warn("%s: GAMMA ADR_RDY timeout\n", __func__);
+
+	writel_relaxed(BIT(H_AUTO_INC) |
+		       BIT(rgb_mask) |
+		       (0 << HADR),
+		       priv->io_base + _REG(L_GAMMA_ADDR_PORT));
+
+	for (i = 0; i < 256; i++) {
+		ret = readl_relaxed_poll_timeout(priv->io_base +
+							_REG(L_GAMMA_CNTL_PORT),
+						 reg, reg & BIT(WR_RDY),
+						 10, 10000);
+		if (ret)
+			pr_warn_once("%s: GAMMA WR_RDY timeout\n", __func__);
+
+		writel_relaxed(data[i],
+			       priv->io_base + _REG(L_GAMMA_DATA_PORT));
+	}
+
+	ret = readl_relaxed_poll_timeout(priv->io_base +
+						_REG(L_GAMMA_CNTL_PORT),
+					 reg, reg & BIT(ADR_RDY), 10, 10000);
+	if (ret)
+		pr_warn("%s: GAMMA ADR_RDY timeout\n", __func__);
+
+	writel_relaxed(BIT(H_AUTO_INC) |
+		       BIT(rgb_mask) |
+		       (0x23 << HADR),
+		       priv->io_base + _REG(L_GAMMA_ADDR_PORT));
+}
+
+void meson_encl_load_gamma(struct meson_drm *priv)
+{
+	meson_encl_set_gamma_table(priv, meson_encl_gamma_table, H_SEL_R);
+	meson_encl_set_gamma_table(priv, meson_encl_gamma_table, H_SEL_G);
+	meson_encl_set_gamma_table(priv, meson_encl_gamma_table, H_SEL_B);
+
+	writel_bits_relaxed(BIT(GAMMA_EN), BIT(GAMMA_EN),
+			    priv->io_base + _REG(L_GAMMA_CNTL_PORT));
+}
+
+void meson_venc_mipi_dsi_mode_set(struct meson_drm *priv,
+				  const struct drm_display_mode *mode)
+{
+	unsigned int max_pxcnt;
+	unsigned int max_lncnt;
+	unsigned int havon_begin;
+	unsigned int havon_end;
+	unsigned int vavon_bline;
+	unsigned int vavon_eline;
+	unsigned int hso_begin;
+	unsigned int hso_end;
+	unsigned int vso_begin;
+	unsigned int vso_end;
+	unsigned int vso_bline;
+	unsigned int vso_eline;
+
+	max_pxcnt = mode->htotal - 1;
+	max_lncnt = mode->vtotal - 1;
+	havon_begin = mode->htotal - mode->hsync_start;
+	havon_end = havon_begin + mode->hdisplay - 1;
+	vavon_bline = mode->vtotal - mode->vsync_start;
+	vavon_eline = vavon_bline + mode->vdisplay - 1;
+	hso_begin = 0;
+	hso_end = mode->hsync_end - mode->hsync_start;
+	vso_begin = 0;
+	vso_end = 0;
+	vso_bline = 0;
+	vso_eline = mode->vsync_end - mode->vsync_start;
+
+	meson_vpp_setup_mux(priv, MESON_VIU_VPP_MUX_ENCL);
+
+	writel_relaxed(0, priv->io_base + _REG(ENCL_VIDEO_EN));
+
+	writel_relaxed(0x8000, priv->io_base + _REG(ENCL_VIDEO_MODE));
+	writel_relaxed(0x0418, priv->io_base + _REG(ENCL_VIDEO_MODE_ADV));
+
+	writel_relaxed(0x1000, priv->io_base + _REG(ENCL_VIDEO_FILT_CTRL));
+	writel_relaxed(max_pxcnt, priv->io_base + _REG(ENCL_VIDEO_MAX_PXCNT));
+	writel_relaxed(max_lncnt, priv->io_base + _REG(ENCL_VIDEO_MAX_LNCNT));
+	writel_relaxed(havon_begin, priv->io_base + _REG(ENCL_VIDEO_HAVON_BEGIN));
+	writel_relaxed(havon_end, priv->io_base + _REG(ENCL_VIDEO_HAVON_END));
+	writel_relaxed(vavon_bline, priv->io_base + _REG(ENCL_VIDEO_VAVON_BLINE));
+	writel_relaxed(vavon_eline, priv->io_base + _REG(ENCL_VIDEO_VAVON_ELINE));
+
+	writel_relaxed(hso_begin, priv->io_base + _REG(ENCL_VIDEO_HSO_BEGIN));
+	writel_relaxed(hso_end, priv->io_base + _REG(ENCL_VIDEO_HSO_END));
+	writel_relaxed(vso_begin, priv->io_base + _REG(ENCL_VIDEO_VSO_BEGIN));
+	writel_relaxed(vso_end, priv->io_base + _REG(ENCL_VIDEO_VSO_END));
+	writel_relaxed(vso_bline, priv->io_base + _REG(ENCL_VIDEO_VSO_BLINE));
+	writel_relaxed(vso_eline, priv->io_base + _REG(ENCL_VIDEO_VSO_ELINE));
+	writel_relaxed(3, priv->io_base + _REG(ENCL_VIDEO_RGBIN_CTRL));
+
+	/* default black pattern */
+	writel_relaxed(0, priv->io_base + _REG(ENCL_TST_MDSEL));
+	writel_relaxed(0, priv->io_base + _REG(ENCL_TST_Y));
+	writel_relaxed(0, priv->io_base + _REG(ENCL_TST_CB));
+	writel_relaxed(0, priv->io_base + _REG(ENCL_TST_CR));
+	writel_relaxed(1, priv->io_base + _REG(ENCL_TST_EN));
+	writel_bits_relaxed(BIT(3), 0, priv->io_base + _REG(ENCL_VIDEO_MODE_ADV));
+
+	writel_relaxed(1, priv->io_base + _REG(ENCL_VIDEO_EN));
+
+	writel_relaxed(0, priv->io_base + _REG(L_RGB_BASE_ADDR));
+	writel_relaxed(0x400, priv->io_base + _REG(L_RGB_COEFF_ADDR));
+	writel_relaxed(0x400, priv->io_base + _REG(L_DITH_CNTL_ADDR));
+
+	/* DE signal for TTL */
+	writel_relaxed(havon_begin, priv->io_base + _REG(L_OEH_HS_ADDR));
+	writel_relaxed(havon_end + 1, priv->io_base + _REG(L_OEH_HE_ADDR));
+	writel_relaxed(vavon_bline, priv->io_base + _REG(L_OEH_VS_ADDR));
+	writel_relaxed(vavon_eline, priv->io_base + _REG(L_OEH_VE_ADDR));
+
+	/* DE signal for TTL */
+	writel_relaxed(havon_begin, priv->io_base + _REG(L_OEV1_HS_ADDR));
+	writel_relaxed(havon_end + 1, priv->io_base + _REG(L_OEV1_HE_ADDR));
+	writel_relaxed(vavon_bline, priv->io_base + _REG(L_OEV1_VS_ADDR));
+	writel_relaxed(vavon_eline, priv->io_base + _REG(L_OEV1_VE_ADDR));
+
+	/* Hsync signal for TTL */
+	if (mode->flags & DRM_MODE_FLAG_PHSYNC) {
+		writel_relaxed(hso_end, priv->io_base + _REG(L_STH1_HS_ADDR));
+		writel_relaxed(hso_begin, priv->io_base + _REG(L_STH1_HE_ADDR));
+	} else {
+		writel_relaxed(hso_begin, priv->io_base + _REG(L_STH1_HS_ADDR));
+		writel_relaxed(hso_end, priv->io_base + _REG(L_STH1_HE_ADDR));
+	}
+	writel_relaxed(0, priv->io_base + _REG(L_STH1_VS_ADDR));
+	writel_relaxed(max_lncnt, priv->io_base + _REG(L_STH1_VE_ADDR));
+
+	/* Vsync signal for TTL */
+	writel_relaxed(vso_begin, priv->io_base + _REG(L_STV1_HS_ADDR));
+	writel_relaxed(vso_end, priv->io_base + _REG(L_STV1_HE_ADDR));
+	if (mode->flags & DRM_MODE_FLAG_PVSYNC) {
+		writel_relaxed(vso_eline, priv->io_base + _REG(L_STV1_VS_ADDR));
+		writel_relaxed(vso_bline, priv->io_base + _REG(L_STV1_VE_ADDR));
+	} else {
+		writel_relaxed(vso_bline, priv->io_base + _REG(L_STV1_VS_ADDR));
+		writel_relaxed(vso_eline, priv->io_base + _REG(L_STV1_VE_ADDR));
+	}
+
+	/* DE signal */
+	writel_relaxed(havon_begin, priv->io_base + _REG(L_DE_HS_ADDR));
+	writel_relaxed(havon_end + 1, priv->io_base + _REG(L_DE_HE_ADDR));
+	writel_relaxed(vavon_bline, priv->io_base + _REG(L_DE_VS_ADDR));
+	writel_relaxed(vavon_eline, priv->io_base + _REG(L_DE_VE_ADDR));
+
+	/* Hsync signal */
+	writel_relaxed(hso_begin, priv->io_base + _REG(L_HSYNC_HS_ADDR));
+	writel_relaxed(hso_end, priv->io_base + _REG(L_HSYNC_HE_ADDR));
+	writel_relaxed(0, priv->io_base + _REG(L_HSYNC_VS_ADDR));
+	writel_relaxed(max_lncnt, priv->io_base + _REG(L_HSYNC_VE_ADDR));
+
+	/* Vsync signal */
+	writel_relaxed(vso_begin, priv->io_base + _REG(L_VSYNC_HS_ADDR));
+	writel_relaxed(vso_end, priv->io_base + _REG(L_VSYNC_HE_ADDR));
+	writel_relaxed(vso_bline, priv->io_base + _REG(L_VSYNC_VS_ADDR));
+	writel_relaxed(vso_eline, priv->io_base + _REG(L_VSYNC_VE_ADDR));
+
+	writel_relaxed(0, priv->io_base + _REG(L_INV_CNT_ADDR));
+	writel_relaxed(BIT(4) | BIT(5),
+		       priv->io_base + _REG(L_TCON_MISC_SEL_ADDR));
+
+	priv->venc.current_mode = MESON_VENC_MODE_MIPI_DSI;
+}
+EXPORT_SYMBOL_GPL(meson_venc_mipi_dsi_mode_set);
+
 void meson_venci_cvbs_mode_set(struct meson_drm *priv,
 			       struct meson_cvbs_enci_mode *mode)
 {
@@ -1747,8 +1966,15 @@ unsigned int meson_venci_get_field(struct meson_drm *priv)
 
 void meson_venc_enable_vsync(struct meson_drm *priv)
 {
-	writel_relaxed(VENC_INTCTRL_ENCI_LNRST_INT_EN,
-		       priv->io_base + _REG(VENC_INTCTRL));
+	switch (priv->venc.current_mode) {
+	case MESON_VENC_MODE_MIPI_DSI:
+		writel_relaxed(0x200,
+			       priv->io_base + _REG(VENC_INTCTRL));
+		break;
+	default:
+		writel_relaxed(VENC_INTCTRL_ENCI_LNRST_INT_EN,
+			       priv->io_base + _REG(VENC_INTCTRL));
+	}
 	regmap_update_bits(priv->hhi, HHI_GCLK_MPEG2, BIT(25), BIT(25));
 }
 
diff --git a/drivers/gpu/drm/meson/meson_venc.h b/drivers/gpu/drm/meson/meson_venc.h
index 9138255ffc9e..0f59adb1c6db 100644
--- a/drivers/gpu/drm/meson/meson_venc.h
+++ b/drivers/gpu/drm/meson/meson_venc.h
@@ -21,6 +21,7 @@ enum {
 	MESON_VENC_MODE_CVBS_PAL,
 	MESON_VENC_MODE_CVBS_NTSC,
 	MESON_VENC_MODE_HDMI,
+	MESON_VENC_MODE_MIPI_DSI,
 };
 
 struct meson_cvbs_enci_mode {
@@ -47,6 +48,9 @@ struct meson_cvbs_enci_mode {
 	unsigned int analog_sync_adj;
 };
 
+/* LCD Encoder gamma setup */
+void meson_encl_load_gamma(struct meson_drm *priv);
+
 /* HDMI Clock parameters */
 enum drm_mode_status
 meson_venc_hdmi_supported_mode(const struct drm_display_mode *mode);
@@ -63,6 +67,8 @@ void meson_venc_hdmi_mode_set(struct meson_drm *priv, int vic,
 			      unsigned int ycrcb_map,
 			      bool yuv420_mode,
 			      const struct drm_display_mode *mode);
+void meson_venc_mipi_dsi_mode_set(struct meson_drm *priv,
+				  const struct drm_display_mode *mode);
 unsigned int meson_venci_get_field(struct meson_drm *priv);
 
 void meson_venc_enable_vsync(struct meson_drm *priv);
diff --git a/drivers/gpu/drm/meson/meson_vpp.h b/drivers/gpu/drm/meson/meson_vpp.h
index afc9553ed8d3..b790042a1650 100644
--- a/drivers/gpu/drm/meson/meson_vpp.h
+++ b/drivers/gpu/drm/meson/meson_vpp.h
@@ -12,6 +12,8 @@
 struct drm_rect;
 struct meson_drm;
 
+/* Mux VIU/VPP to ENCL */
+#define MESON_VIU_VPP_MUX_ENCL	0x0
 /* Mux VIU/VPP to ENCI */
 #define MESON_VIU_VPP_MUX_ENCI	0x5
 /* Mux VIU/VPP to ENCP */
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
