Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77FEDC43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 14:18:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44C9C2084D
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 14:18:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Bipi757H";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="te9NB4yf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44C9C2084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rj95Yr/c/JQCr7mApUC9sbwY5IDSloib6/0xV/dl+JQ=; b=Bipi757H7UhD0t
	3YngfkXMAC+DlE6MpIWqMrUh8OvqNwlVlD5CGETx00uNx8TgnPBMPWmfsNaJbDJRDPV4km2kMo6jq
	iGaSZj+AXsaBTns3ByXq60B03z1YBoPxQHYAvMKABEmsyQ4W4hAK0Pf0aRjCMRKHINt7zoLxUX1Xx
	rq85h609YCfmYh46Cb94kqrtXAiMV737mfHDleCEH9XMMcvAUPgieHvbdBfAgDillGchiKaleQ82K
	5KLXlRif8ss8WB2taAZvQyDsSxyh1aNEC+Li77NUME7M9xoqTo4cRYjjV90557U/ICFLp+PK1AlXm
	0ptZ6Z63IkS8q1pT6/1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8QR8-0007rJ-FO; Mon, 25 Mar 2019 14:18:50 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8QQw-0007gW-M9
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 14:18:44 +0000
Received: by mail-wm1-x341.google.com with SMTP id z6so82923wmi.0
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 07:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wRGLR+dyRfuuPQZw3s+4IQrXme8PCJjVx40jaIwHBCg=;
 b=te9NB4yfFAk4YnEP7lR0sO5jH6Rg45BACs2l9PBjqKUrRJHMtRp3cELQNrbpmuM11I
 F5S6rkjHuXDcLV8TsrjUUGNtdGN2KGicaLqKxkU1sRuNKYtOkU7YDlQji/zLiENmq6pi
 yAv3vX7tAx00lBVtpKayncZZAIvbBgVtz+S8HUautO9KhDfDdoEYy+YbBmjFcGyXpq9Y
 44RSt0r2oNIUplNGPUcEa5WtHDfFAVXiDquHP9AcQ5HKtOQXE/Pcac2qcoNyqpGiOW5n
 pzoeM7as7wU6rVkpqutsQuByjUDvpAaARUEtgan7qgB/26ND7MjI0IHWKH38aTM1D2T4
 biyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wRGLR+dyRfuuPQZw3s+4IQrXme8PCJjVx40jaIwHBCg=;
 b=rVHVVK92ovAm+TCgo/z0Ly3qVWxm2ILv9tx/MEoKNBD+ZnvMCFrhhLGCsLEw/V5Jin
 oWPYcVuewQEg2iI1sjUDD+bNyNuaPohbv1wcVAsWLqQErqREdKvdC/KgO2wMomdgdsKN
 a9ND4+5AfPrWMXzrnS74ipSoMWZwyvzD7KOWIZF9qaZhy4LdfyWuIWF7FAbOlV5p8Vbg
 FAh+Zw3w0n1f5mKEEmHaZlKvoXeoF49IHZXSEgVrH7sFDsWaxqQ+n0mQeRmd8hGRTrEQ
 A8PdiWEuRqNDZSepf9lOrcO1HsUPogfok1lx005ZHRpW0iQIvp6mR0eQHVIS1FnN8BWk
 auwA==
X-Gm-Message-State: APjAAAUGStdI21Hva6bcGxzoAXbAbbe346/FwGqZpdwv3m7aWqaD/duV
 mHOYGMxRt88TsCLeGeRRzabz4g==
X-Google-Smtp-Source: APXvYqx6tpje3TaJyDh+MRMrvTGqT8Ge/XEE3mBcISAbQKUH7bn+Nzgb92sZQEPo26v4DvsVHCq7Iw==
X-Received: by 2002:a1c:9c14:: with SMTP id f20mr5723899wme.16.1553523516297; 
 Mon, 25 Mar 2019 07:18:36 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id 132sm26976794wmd.30.2019.03.25.07.18.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 25 Mar 2019 07:18:35 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 07/11] drm/meson: Add G12A support for plane handling in CRTC
 driver
Date: Mon, 25 Mar 2019 15:18:20 +0100
Message-Id: <20190325141824.21259-8-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190325141824.21259-1-narmstrong@baylibre.com>
References: <20190325141824.21259-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_071838_720838_9C9AB4D6 
X-CRM114-Status: GOOD (  15.51  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patch adds support for the new OSD+VD Plane blending module
in the CRTC code by adding the G12A code to manage the blending
module and setting the right OSD1 & VD1 plane registers.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_crtc.c | 269 +++++++++++++++++++++++------
 drivers/gpu/drm/meson/meson_drv.h  |   4 +
 2 files changed, 221 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_crtc.c b/drivers/gpu/drm/meson/meson_crtc.c
index 6d9311e254ef..5579f8ac3e3f 100644
--- a/drivers/gpu/drm/meson/meson_crtc.c
+++ b/drivers/gpu/drm/meson/meson_crtc.c
@@ -39,12 +39,17 @@
 #include "meson_viu.h"
 #include "meson_registers.h"
 
+#define MESON_G12A_VIU_OFFSET	0x5ec0
+
 /* CRTC definition */
 
 struct meson_crtc {
 	struct drm_crtc base;
 	struct drm_pending_vblank_event *event;
 	struct meson_drm *priv;
+	void (*enable_osd1)(struct meson_drm *priv);
+	void (*enable_vd1)(struct meson_drm *priv);
+	unsigned int viu_offset;
 };
 #define to_meson_crtc(x) container_of(x, struct meson_crtc, base)
 
@@ -80,6 +85,44 @@ static const struct drm_crtc_funcs meson_crtc_funcs = {
 
 };
 
+static void meson_g12a_crtc_atomic_enable(struct drm_crtc *crtc,
+					  struct drm_crtc_state *old_state)
+{
+	struct meson_crtc *meson_crtc = to_meson_crtc(crtc);
+	struct drm_crtc_state *crtc_state = crtc->state;
+	struct meson_drm *priv = meson_crtc->priv;
+
+	DRM_DEBUG_DRIVER("\n");
+
+	if (!crtc_state) {
+		DRM_ERROR("Invalid crtc_state\n");
+		return;
+	}
+
+	/* VD1 Preblend vertical start/end */
+	writel(FIELD_PREP(GENMASK(11, 0), 2303),
+	       priv->io_base + _REG(VPP_PREBLEND_VD1_V_START_END));
+
+	/* Setup Blender */
+	writel(crtc_state->mode.hdisplay |
+	       crtc_state->mode.vdisplay << 16,
+	       priv->io_base + _REG(VPP_POSTBLEND_H_SIZE));
+
+	writel_relaxed(0 << 16 |
+			(crtc_state->mode.hdisplay - 1),
+			priv->io_base + _REG(VPP_OSD1_BLD_H_SCOPE));
+	writel_relaxed(0 << 16 |
+			(crtc_state->mode.vdisplay - 1),
+			priv->io_base + _REG(VPP_OSD1_BLD_V_SCOPE));
+	writel_relaxed(crtc_state->mode.hdisplay << 16 |
+			crtc_state->mode.vdisplay,
+			priv->io_base + _REG(VPP_OUT_H_V_SIZE));
+
+	drm_crtc_vblank_on(crtc);
+
+	priv->viu.osd1_enabled = true;
+}
+
 static void meson_crtc_atomic_enable(struct drm_crtc *crtc,
 				     struct drm_crtc_state *old_state)
 {
@@ -110,6 +153,31 @@ static void meson_crtc_atomic_enable(struct drm_crtc *crtc,
 	priv->viu.osd1_enabled = true;
 }
 
+static void meson_g12a_crtc_atomic_disable(struct drm_crtc *crtc,
+					   struct drm_crtc_state *old_state)
+{
+	struct meson_crtc *meson_crtc = to_meson_crtc(crtc);
+	struct meson_drm *priv = meson_crtc->priv;
+
+	DRM_DEBUG_DRIVER("\n");
+
+	drm_crtc_vblank_off(crtc);
+
+	priv->viu.osd1_enabled = false;
+	priv->viu.osd1_commit = false;
+
+	priv->viu.vd1_enabled = false;
+	priv->viu.vd1_commit = false;
+
+	if (crtc->state->event && !crtc->state->active) {
+		spin_lock_irq(&crtc->dev->event_lock);
+		drm_crtc_send_vblank_event(crtc, crtc->state->event);
+		spin_unlock_irq(&crtc->dev->event_lock);
+
+		crtc->state->event = NULL;
+	}
+}
+
 static void meson_crtc_atomic_disable(struct drm_crtc *crtc,
 				      struct drm_crtc_state *old_state)
 {
@@ -173,6 +241,53 @@ static const struct drm_crtc_helper_funcs meson_crtc_helper_funcs = {
 	.atomic_disable	= meson_crtc_atomic_disable,
 };
 
+static const struct drm_crtc_helper_funcs meson_g12a_crtc_helper_funcs = {
+	.atomic_begin	= meson_crtc_atomic_begin,
+	.atomic_flush	= meson_crtc_atomic_flush,
+	.atomic_enable	= meson_g12a_crtc_atomic_enable,
+	.atomic_disable	= meson_g12a_crtc_atomic_disable,
+};
+
+static void meson_crtc_enable_osd1(struct meson_drm *priv)
+{
+	writel_bits_relaxed(VPP_OSD1_POSTBLEND, VPP_OSD1_POSTBLEND,
+			    priv->io_base + _REG(VPP_MISC));
+}
+
+static void meson_g12a_crtc_enable_osd1(struct meson_drm *priv)
+{
+	writel_relaxed(priv->viu.osd_blend_din0_scope_h,
+		       priv->io_base +
+		       _REG(VIU_OSD_BLEND_DIN0_SCOPE_H));
+	writel_relaxed(priv->viu.osd_blend_din0_scope_v,
+		       priv->io_base +
+		       _REG(VIU_OSD_BLEND_DIN0_SCOPE_V));
+	writel_relaxed(priv->viu.osb_blend0_size,
+		       priv->io_base +
+		       _REG(VIU_OSD_BLEND_BLEND0_SIZE));
+	writel_relaxed(priv->viu.osb_blend1_size,
+		       priv->io_base +
+		       _REG(VIU_OSD_BLEND_BLEND1_SIZE));
+}
+
+static void meson_crtc_enable_vd1(struct meson_drm *priv)
+{
+	writel_bits_relaxed(VPP_VD1_PREBLEND | VPP_VD1_POSTBLEND |
+			    VPP_COLOR_MNG_ENABLE,
+			    VPP_VD1_PREBLEND | VPP_VD1_POSTBLEND |
+			    VPP_COLOR_MNG_ENABLE,
+			    priv->io_base + _REG(VPP_MISC));
+}
+
+static void meson_g12a_crtc_enable_vd1(struct meson_drm *priv)
+{
+	writel_relaxed(((1 << 16) | /* post bld premult*/
+			(1 << 8) | /* post src */
+			(1 << 4) | /* pre bld premult*/
+			(1 << 0)),
+			priv->io_base + _REG(VD1_BLEND_SRC_CTRL));
+}
+
 void meson_crtc_irq(struct meson_drm *priv)
 {
 	struct meson_crtc *meson_crtc = to_meson_crtc(priv->crtc);
@@ -219,8 +334,8 @@ void meson_crtc_irq(struct meson_drm *priv)
 				MESON_CANVAS_BLKMODE_LINEAR, 0);
 
 		/* Enable OSD1 */
-		writel_bits_relaxed(VPP_OSD1_POSTBLEND, VPP_OSD1_POSTBLEND,
-				    priv->io_base + _REG(VPP_MISC));
+		if (meson_crtc->enable_osd1)
+			meson_crtc->enable_osd1(priv);
 
 		priv->viu.osd1_commit = false;
 	}
@@ -261,89 +376,133 @@ void meson_crtc_irq(struct meson_drm *priv)
 		};
 
 		writel_relaxed(priv->viu.vd1_if0_gen_reg,
-				priv->io_base + _REG(VD1_IF0_GEN_REG));
+				priv->io_base + meson_crtc->viu_offset +
+				_REG(VD1_IF0_GEN_REG));
 		writel_relaxed(priv->viu.vd1_if0_gen_reg,
-				priv->io_base + _REG(VD2_IF0_GEN_REG));
+				priv->io_base + meson_crtc->viu_offset +
+				_REG(VD2_IF0_GEN_REG));
 		writel_relaxed(priv->viu.vd1_if0_gen_reg2,
-				priv->io_base + _REG(VD1_IF0_GEN_REG2));
+				priv->io_base + meson_crtc->viu_offset +
+				_REG(VD1_IF0_GEN_REG2));
 		writel_relaxed(priv->viu.viu_vd1_fmt_ctrl,
-				priv->io_base + _REG(VIU_VD1_FMT_CTRL));
+				priv->io_base + meson_crtc->viu_offset +
+				_REG(VIU_VD1_FMT_CTRL));
 		writel_relaxed(priv->viu.viu_vd1_fmt_ctrl,
-				priv->io_base + _REG(VIU_VD2_FMT_CTRL));
+				priv->io_base + meson_crtc->viu_offset +
+				_REG(VIU_VD2_FMT_CTRL));
 		writel_relaxed(priv->viu.viu_vd1_fmt_w,
-				priv->io_base + _REG(VIU_VD1_FMT_W));
+				priv->io_base + meson_crtc->viu_offset +
+				_REG(VIU_VD1_FMT_W));
 		writel_relaxed(priv->viu.viu_vd1_fmt_w,
-				priv->io_base + _REG(VIU_VD2_FMT_W));
+				priv->io_base + meson_crtc->viu_offset +
+				_REG(VIU_VD2_FMT_W));
 		writel_relaxed(priv->viu.vd1_if0_canvas0,
-				priv->io_base + _REG(VD1_IF0_CANVAS0));
+				priv->io_base + meson_crtc->viu_offset +
+				_REG(VD1_IF0_CANVAS0));
 		writel_relaxed(priv->viu.vd1_if0_canvas0,
-				priv->io_base + _REG(VD1_IF0_CANVAS1));
+				priv->io_base + meson_crtc->viu_offset +
+				_REG(VD1_IF0_CANVAS1));
 		writel_relaxed(priv->viu.vd1_if0_canvas0,
-				priv->io_base + _REG(VD2_IF0_CANVAS0));
+				priv->io_base + meson_crtc->viu_offset +
+				_REG(VD2_IF0_CANVAS0));
 		writel_relaxed(priv->viu.vd1_if0_canvas0,
-				priv->io_base + _REG(VD2_IF0_CANVAS1));
+				priv->io_base + meson_crtc->viu_offset +
+				_REG(VD2_IF0_CANVAS1));
 		writel_relaxed(priv->viu.vd1_if0_luma_x0,
-				priv->io_base + _REG(VD1_IF0_LUMA_X0));
+				priv->io_base + meson_crtc->viu_offset +
+				_REG(VD1_IF0_LUMA_X0));
 		writel_relaxed(priv->viu.vd1_if0_luma_x0,
-				priv->io_base + _REG(VD1_IF0_LUMA_X1));
+				priv->io_base + meson_crtc->viu_offset +
+				_REG(VD1_IF0_LUMA_X1));
 		writel_relaxed(priv->viu.vd1_if0_luma_x0,
-				priv->io_base + _REG(VD2_IF0_LUMA_X0));
+				priv->io_base + meson_crtc->viu_offset +
+				_REG(VD2_IF0_LUMA_X0));
 		writel_relaxed(priv->viu.vd1_if0_luma_x0,
-				priv->io_base + _REG(VD2_IF0_LUMA_X1));
+				priv->io_base + meson_crtc->viu_offset +
+				_REG(VD2_IF0_LUMA_X1));
 		writel_relaxed(priv->viu.vd1_if0_luma_y0,
-				priv->io_base + _REG(VD1_IF0_LUMA_Y0));
+				priv->io_base + meson_crtc->viu_offset +
+				_REG(VD1_IF0_LUMA_Y0));
 		writel_relaxed(priv->viu.vd1_if0_luma_y0,
-				priv->io_base + _REG(VD1_IF0_LUMA_Y1));
+				priv->io_base + meson_crtc->viu_offset +
+				_REG(VD1_IF0_LUMA_Y1));
 		writel_relaxed(priv->viu.vd1_if0_luma_y0,
-				priv->io_base + _REG(VD2_IF0_LUMA_Y0));
+				priv->io_base + meson_crtc->viu_offset +
+				_REG(VD2_IF0_LUMA_Y0));
 		writel_relaxed(priv->viu.vd1_if0_luma_y0,
-				priv->io_base + _REG(VD2_IF0_LUMA_Y1));
+				priv->io_base + meson_crtc->viu_offset +
+				_REG(VD2_IF0_LUMA_Y1));
 		writel_relaxed(priv->viu.vd1_if0_chroma_x0,
-				priv->io_base + _REG(VD1_IF0_CHROMA_X0));
+				priv->io_base + meson_crtc->viu_offset +
+				_REG(VD1_IF0_CHROMA_X0));
 		writel_relaxed(priv->viu.vd1_if0_chroma_x0,
-				priv->io_base + _REG(VD1_IF0_CHROMA_X1));
+				priv->io_base + meson_crtc->viu_offset +
+				_REG(VD1_IF0_CHROMA_X1));
 		writel_relaxed(priv->viu.vd1_if0_chroma_x0,
-				priv->io_base + _REG(VD2_IF0_CHROMA_X0));
+				priv->io_base + meson_crtc->viu_offset +
+				_REG(VD2_IF0_CHROMA_X0));
 		writel_relaxed(priv->viu.vd1_if0_chroma_x0,
-				priv->io_base + _REG(VD2_IF0_CHROMA_X1));
+				priv->io_base + meson_crtc->viu_offset +
+				_REG(VD2_IF0_CHROMA_X1));
 		writel_relaxed(priv->viu.vd1_if0_chroma_y0,
-				priv->io_base + _REG(VD1_IF0_CHROMA_Y0));
+				priv->io_base + meson_crtc->viu_offset +
+				_REG(VD1_IF0_CHROMA_Y0));
 		writel_relaxed(priv->viu.vd1_if0_chroma_y0,
-				priv->io_base + _REG(VD1_IF0_CHROMA_Y1));
+				priv->io_base + meson_crtc->viu_offset +
+				_REG(VD1_IF0_CHROMA_Y1));
 		writel_relaxed(priv->viu.vd1_if0_chroma_y0,
-				priv->io_base + _REG(VD2_IF0_CHROMA_Y0));
+				priv->io_base + meson_crtc->viu_offset +
+				_REG(VD2_IF0_CHROMA_Y0));
 		writel_relaxed(priv->viu.vd1_if0_chroma_y0,
-				priv->io_base + _REG(VD2_IF0_CHROMA_Y1));
+				priv->io_base + meson_crtc->viu_offset +
+				_REG(VD2_IF0_CHROMA_Y1));
 		writel_relaxed(priv->viu.vd1_if0_repeat_loop,
-				priv->io_base + _REG(VD1_IF0_RPT_LOOP));
+				priv->io_base + meson_crtc->viu_offset +
+				_REG(VD1_IF0_RPT_LOOP));
 		writel_relaxed(priv->viu.vd1_if0_repeat_loop,
-				priv->io_base + _REG(VD2_IF0_RPT_LOOP));
+				priv->io_base + meson_crtc->viu_offset +
+				_REG(VD2_IF0_RPT_LOOP));
 		writel_relaxed(priv->viu.vd1_if0_luma0_rpt_pat,
-				priv->io_base + _REG(VD1_IF0_LUMA0_RPT_PAT));
+				priv->io_base + meson_crtc->viu_offset +
+				_REG(VD1_IF0_LUMA0_RPT_PAT));
 		writel_relaxed(priv->viu.vd1_if0_luma0_rpt_pat,
-				priv->io_base + _REG(VD2_IF0_LUMA0_RPT_PAT));
+				priv->io_base + meson_crtc->viu_offset +
+				_REG(VD2_IF0_LUMA0_RPT_PAT));
 		writel_relaxed(priv->viu.vd1_if0_luma0_rpt_pat,
-				priv->io_base + _REG(VD1_IF0_LUMA1_RPT_PAT));
+				priv->io_base + meson_crtc->viu_offset +
+				_REG(VD1_IF0_LUMA1_RPT_PAT));
 		writel_relaxed(priv->viu.vd1_if0_luma0_rpt_pat,
-				priv->io_base + _REG(VD2_IF0_LUMA1_RPT_PAT));
+				priv->io_base + meson_crtc->viu_offset +
+				_REG(VD2_IF0_LUMA1_RPT_PAT));
 		writel_relaxed(priv->viu.vd1_if0_chroma0_rpt_pat,
-				priv->io_base + _REG(VD1_IF0_CHROMA0_RPT_PAT));
+				priv->io_base + meson_crtc->viu_offset +
+				_REG(VD1_IF0_CHROMA0_RPT_PAT));
 		writel_relaxed(priv->viu.vd1_if0_chroma0_rpt_pat,
-				priv->io_base + _REG(VD2_IF0_CHROMA0_RPT_PAT));
+				priv->io_base + meson_crtc->viu_offset +
+				_REG(VD2_IF0_CHROMA0_RPT_PAT));
 		writel_relaxed(priv->viu.vd1_if0_chroma0_rpt_pat,
-				priv->io_base + _REG(VD1_IF0_CHROMA1_RPT_PAT));
+				priv->io_base + meson_crtc->viu_offset +
+				_REG(VD1_IF0_CHROMA1_RPT_PAT));
 		writel_relaxed(priv->viu.vd1_if0_chroma0_rpt_pat,
-				priv->io_base + _REG(VD2_IF0_CHROMA1_RPT_PAT));
-		writel_relaxed(0, priv->io_base + _REG(VD1_IF0_LUMA_PSEL));
-		writel_relaxed(0, priv->io_base + _REG(VD1_IF0_CHROMA_PSEL));
-		writel_relaxed(0, priv->io_base + _REG(VD2_IF0_LUMA_PSEL));
-		writel_relaxed(0, priv->io_base + _REG(VD2_IF0_CHROMA_PSEL));
+				priv->io_base + meson_crtc->viu_offset +
+				_REG(VD2_IF0_CHROMA1_RPT_PAT));
+		writel_relaxed(0, priv->io_base + meson_crtc->viu_offset +
+				_REG(VD1_IF0_LUMA_PSEL));
+		writel_relaxed(0, priv->io_base + meson_crtc->viu_offset +
+				_REG(VD1_IF0_CHROMA_PSEL));
+		writel_relaxed(0, priv->io_base + meson_crtc->viu_offset +
+				_REG(VD2_IF0_LUMA_PSEL));
+		writel_relaxed(0, priv->io_base + meson_crtc->viu_offset +
+				_REG(VD2_IF0_CHROMA_PSEL));
 		writel_relaxed(priv->viu.vd1_range_map_y,
-				priv->io_base + _REG(VD1_IF0_RANGE_MAP_Y));
+				priv->io_base + meson_crtc->viu_offset +
+				_REG(VD1_IF0_RANGE_MAP_Y));
 		writel_relaxed(priv->viu.vd1_range_map_cb,
-				priv->io_base + _REG(VD1_IF0_RANGE_MAP_CB));
+				priv->io_base + meson_crtc->viu_offset +
+				_REG(VD1_IF0_RANGE_MAP_CB));
 		writel_relaxed(priv->viu.vd1_range_map_cr,
-				priv->io_base + _REG(VD1_IF0_RANGE_MAP_CR));
+				priv->io_base + meson_crtc->viu_offset +
+				_REG(VD1_IF0_RANGE_MAP_CR));
 		writel_relaxed(0x78404,
 				priv->io_base + _REG(VPP_SC_MISC));
 		writel_relaxed(priv->viu.vpp_pic_in_height,
@@ -389,11 +548,8 @@ void meson_crtc_irq(struct meson_drm *priv)
 		writel_relaxed(0x42, priv->io_base + _REG(VPP_SCALE_COEF_IDX));
 
 		/* Enable VD1 */
-		writel_bits_relaxed(VPP_VD1_PREBLEND | VPP_VD1_POSTBLEND |
-				    VPP_COLOR_MNG_ENABLE,
-				    VPP_VD1_PREBLEND | VPP_VD1_POSTBLEND |
-				    VPP_COLOR_MNG_ENABLE,
-				    priv->io_base + _REG(VPP_MISC));
+		if (meson_crtc->enable_vd1)
+			meson_crtc->enable_vd1(priv);
 
 		priv->viu.vd1_commit = false;
 	}
@@ -430,7 +586,16 @@ int meson_crtc_create(struct meson_drm *priv)
 		return ret;
 	}
 
-	drm_crtc_helper_add(crtc, &meson_crtc_helper_funcs);
+	if (meson_vpu_is_compatible(priv, "amlogic,meson-g12a-vpu")) {
+		meson_crtc->enable_osd1 = meson_g12a_crtc_enable_osd1;
+		meson_crtc->enable_vd1 = meson_g12a_crtc_enable_vd1;
+		meson_crtc->viu_offset = MESON_G12A_VIU_OFFSET;
+		drm_crtc_helper_add(crtc, &meson_g12a_crtc_helper_funcs);
+	} else {
+		meson_crtc->enable_osd1 = meson_crtc_enable_osd1;
+		meson_crtc->enable_vd1 = meson_crtc_enable_vd1;
+		drm_crtc_helper_add(crtc, &meson_crtc_helper_funcs);
+	}
 
 	priv->crtc = crtc;
 
diff --git a/drivers/gpu/drm/meson/meson_drv.h b/drivers/gpu/drm/meson/meson_drv.h
index 214a7cb18ce2..9614baa836b9 100644
--- a/drivers/gpu/drm/meson/meson_drv.h
+++ b/drivers/gpu/drm/meson/meson_drv.h
@@ -62,6 +62,10 @@ struct meson_drm {
 		uint32_t osd_sc_h_phase_step;
 		uint32_t osd_sc_h_ctrl0;
 		uint32_t osd_sc_v_ctrl0;
+		uint32_t osd_blend_din0_scope_h;
+		uint32_t osd_blend_din0_scope_v;
+		uint32_t osb_blend0_size;
+		uint32_t osb_blend1_size;
 
 		bool vd1_enabled;
 		bool vd1_commit;
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
