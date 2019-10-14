Return-Path: <SRS0=+CC3=YH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F024ECE587
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Oct 2019 12:40:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54D8B2089C
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Oct 2019 12:40:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HE3cDOUA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="RnrWUEFN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54D8B2089C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XSo6WD3alwkW7s8bVr98dGp6HVsqCyFhZ6EOz5V77+s=; b=HE3cDOUAHW5BKu
	guIhd8IjPuAUQSr2B3GGE8hwlIB2oR64ZkLnXiPmHD7oRZfTxX6wpbx/ggir8O0gdJVUlifm2tlbh
	CZnD+MRRBTB7+WvWSf6IMcJ8OpiT0mh0i9Y/Rpmylb6AkbdpyFnx/j3dCOAGRKR0a/tLHCjC/4WeF
	LBUKeSkpkmtOV6FUfCsZmEfH+YLNIscamuVHv/ioCLP1Kp4XxScEQkl80e0K3P3JJ5GHs2ToClsOL
	s49zr68X385bzHKgRM7ExZiJZjLx2NVFYz/YTg/xIxEIFx3igqfus1FIZl5MUgdRtjZFUKS+Hqus1
	qKQ0Xwr6M/QzzhDTuDQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iJzef-0002iP-3H; Mon, 14 Oct 2019 12:40:53 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iJzcU-00086p-Li
 for linux-amlogic@lists.infradead.org; Mon, 14 Oct 2019 12:38:47 +0000
Received: by mail-wm1-x342.google.com with SMTP id y135so14419930wmc.1
 for <linux-amlogic@lists.infradead.org>; Mon, 14 Oct 2019 05:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EiSsjXYdZZOyYEr4Sge65wETKP2xlBLGlhOiCPBSXkE=;
 b=RnrWUEFN8vlpvLRfCehFrxjuaM3ZPHu283UjOXmJxLbT1c8e8xMrzbwKmim6fENpYj
 dTuRcMey7nMCXj3OUJneBs0DWVuZFw4EQXcPj40zn+DHdsMHNHCFKIVIvkuXNMAubGTj
 UEDWW8Q6PmJtaQBK+rkcLks46jxJyiA0euIKb2QShBqK7KiFwBDxNeKaywxhWRCXZvuo
 +4oKJXllMlVPe1FU26JJnKQ71pKGKGC3TW8Fzb0GYbA7NhK0+/YCdzhImKBod+LUHyM+
 4CuY+nEX456JhK4nYKgoSzdlSI6Hk6DNIjnnGYH0vGnRtVsB4tf71iTpA3pvA4a9ggVP
 nwsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EiSsjXYdZZOyYEr4Sge65wETKP2xlBLGlhOiCPBSXkE=;
 b=noVuSk1xCXfwlt0EYu6pRsZ18cLatLHoCrOCBlKn+wvgroipQYEnoNw4u5HrmOi5I3
 3fTLONPtcyorAyJuMQfQo9E2m1RN7ggXktjGrcyP6zPC8SK/nHzQBOsqUSHO0/0xv5CU
 TIstaijfQHUc5xIN0GLVpRBZnX83ympyUMi2eO6fVuzqe6QTtz1t81ItZrZe+x0vh9sX
 OQ/9ELNv5X1gudxj1dkU1sZKB1n6v6KlxWlHbBaK5vlwOQ1JOahmwScKet7qFa7PSBwN
 O7JXyzZ0eWN5aNTsVOMBaIbPXpcVFFuB7e7aTtS8ksGYcAQYOom2BDaQxQ4AOW2uS/Dt
 UqEQ==
X-Gm-Message-State: APjAAAWj3VQGWa4YWyIsEwQoTbsD6+jTiNNqAgxIADzgHvOmg6wFN87D
 il39Ul7ya75wm29iy53HIOGgKw==
X-Google-Smtp-Source: APXvYqzQsEvFHjzDzBZg9POutNu7rB/rrGxvWic5J6WlC0lB4yoepYEDP1Wv+bO14FoAwTG3v7zvaQ==
X-Received: by 2002:a05:600c:2308:: with SMTP id
 8mr14332978wmo.73.1571056716969; 
 Mon, 14 Oct 2019 05:38:36 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id 3sm19171203wmo.22.2019.10.14.05.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 05:38:35 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 7/7] drm/meson: crtc: add OSD1 plane AFBC commit
Date: Mon, 14 Oct 2019 14:38:26 +0200
Message-Id: <20191014123826.27629-8-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191014123826.27629-1-narmstrong@baylibre.com>
References: <20191014123826.27629-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191014_053838_809058_1F5F2213 
X-CRM114-Status: GOOD (  13.60  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, ayan.halder@arm.com, Brian.Starkey@arm.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Finally, setup the VIU registers and start the AFBC decoder at each
vsync IRQ to support displaying AFBC encoded buffers on Amlogic GXM
and G12A SoCs.

Since the DRM core will stop the vsync IRQ after a few interrupts,
we need to keep the IRQ enabled while using the AFBC decoder.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_crtc.c | 79 ++++++++++++++++++++++++++++--
 1 file changed, 74 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_crtc.c b/drivers/gpu/drm/meson/meson_crtc.c
index d478fa232951..d28efd0dbf11 100644
--- a/drivers/gpu/drm/meson/meson_crtc.c
+++ b/drivers/gpu/drm/meson/meson_crtc.c
@@ -24,6 +24,7 @@
 #include "meson_venc.h"
 #include "meson_viu.h"
 #include "meson_vpp.h"
+#include "meson_osd_afbcd.h"
 
 #define MESON_G12A_VIU_OFFSET	0x5ec0
 
@@ -35,7 +36,11 @@ struct meson_crtc {
 	struct meson_drm *priv;
 	void (*enable_osd1)(struct meson_drm *priv);
 	void (*enable_vd1)(struct meson_drm *priv);
+	void (*enable_osd1_afbc)(struct meson_drm *priv);
+	void (*disable_osd1_afbc)(struct meson_drm *priv);
 	unsigned int viu_offset;
+	bool vsync_forced;
+	bool vsync_disabled;
 };
 #define to_meson_crtc(x) container_of(x, struct meson_crtc, base)
 
@@ -46,6 +51,7 @@ static int meson_crtc_enable_vblank(struct drm_crtc *crtc)
 	struct meson_crtc *meson_crtc = to_meson_crtc(crtc);
 	struct meson_drm *priv = meson_crtc->priv;
 
+	meson_crtc->vsync_disabled = false;
 	meson_venc_enable_vsync(priv);
 
 	return 0;
@@ -56,7 +62,10 @@ static void meson_crtc_disable_vblank(struct drm_crtc *crtc)
 	struct meson_crtc *meson_crtc = to_meson_crtc(crtc);
 	struct meson_drm *priv = meson_crtc->priv;
 
-	meson_venc_disable_vsync(priv);
+	if (!meson_crtc->vsync_forced) {
+		meson_crtc->vsync_disabled = true;
+		meson_venc_disable_vsync(priv);
+	}
 }
 
 static const struct drm_crtc_funcs meson_crtc_funcs = {
@@ -236,6 +245,26 @@ static void meson_crtc_enable_osd1(struct meson_drm *priv)
 			    priv->io_base + _REG(VPP_MISC));
 }
 
+static void meson_crtc_g12a_enable_osd1_afbc(struct meson_drm *priv)
+{
+	writel_relaxed(priv->viu.osd1_blk2_cfg4,
+		       priv->io_base + _REG(VIU_OSD1_BLK2_CFG_W4));
+
+	writel_bits_relaxed(OSD_MEM_LINEAR_ADDR, OSD_MEM_LINEAR_ADDR,
+			    priv->io_base + _REG(VIU_OSD1_CTRL_STAT));
+
+	writel_relaxed(priv->viu.osd1_blk1_cfg4,
+		       priv->io_base + _REG(VIU_OSD1_BLK1_CFG_W4));
+
+	meson_viu_g12a_enable_osd1_afbc(priv);
+
+	writel_bits_relaxed(OSD_MEM_LINEAR_ADDR, OSD_MEM_LINEAR_ADDR,
+			    priv->io_base + _REG(VIU_OSD1_CTRL_STAT));
+
+	writel_bits_relaxed(OSD_MALI_SRC_EN, OSD_MALI_SRC_EN,
+			    priv->io_base + _REG(VIU_OSD1_BLK0_CFG_W0));
+}
+
 static void meson_g12a_crtc_enable_osd1(struct meson_drm *priv)
 {
 	writel_relaxed(priv->viu.osd_blend_din0_scope_h,
@@ -293,6 +322,19 @@ void meson_crtc_irq(struct meson_drm *priv)
 				priv->io_base + _REG(VIU_OSD1_BLK0_CFG_W3));
 		writel_relaxed(priv->viu.osd1_blk0_cfg[4],
 				priv->io_base + _REG(VIU_OSD1_BLK0_CFG_W4));
+
+		if (priv->viu.osd1_afbcd) {
+			if (meson_crtc->enable_osd1_afbc)
+				meson_crtc->enable_osd1_afbc(priv);
+		} else {
+			if (meson_crtc->disable_osd1_afbc)
+				meson_crtc->disable_osd1_afbc(priv);
+			if (priv->afbcd.ops) {
+				priv->afbcd.ops->reset(priv);
+				priv->afbcd.ops->disable(priv);
+			}
+		}
+
 		writel_relaxed(priv->viu.osd_sc_ctrl0,
 				priv->io_base + _REG(VPP_OSD_SC_CTRL0));
 		writel_relaxed(priv->viu.osd_sc_i_wh_m1,
@@ -314,15 +356,23 @@ void meson_crtc_irq(struct meson_drm *priv)
 		writel_relaxed(priv->viu.osd_sc_v_ctrl0,
 				priv->io_base + _REG(VPP_OSD_VSC_CTRL0));
 
-		meson_canvas_config(priv->canvas, priv->canvas_id_osd1,
-				priv->viu.osd1_addr, priv->viu.osd1_stride,
-				priv->viu.osd1_height, MESON_CANVAS_WRAP_NONE,
-				MESON_CANVAS_BLKMODE_LINEAR, 0);
+		if (!priv->viu.osd1_afbcd)
+			meson_canvas_config(priv->canvas, priv->canvas_id_osd1,
+					    priv->viu.osd1_addr,
+					    priv->viu.osd1_stride,
+					    priv->viu.osd1_height,
+					    MESON_CANVAS_WRAP_NONE,
+					    MESON_CANVAS_BLKMODE_LINEAR, 0);
 
 		/* Enable OSD1 */
 		if (meson_crtc->enable_osd1)
 			meson_crtc->enable_osd1(priv);
 
+		if (priv->viu.osd1_afbcd)
+			meson_crtc->vsync_forced = true;
+		else
+			meson_crtc->vsync_forced = false;
+
 		priv->viu.osd1_commit = false;
 	}
 
@@ -545,6 +595,15 @@ void meson_crtc_irq(struct meson_drm *priv)
 		priv->viu.vd1_commit = false;
 	}
 
+	if (meson_crtc->vsync_forced && priv->viu.osd1_afbcd) {
+		priv->afbcd.ops->reset(priv);
+		priv->afbcd.ops->setup(priv);
+		priv->afbcd.ops->enable(priv);
+	}
+
+	if (meson_crtc->vsync_disabled)
+		return;
+
 	drm_crtc_handle_vblank(priv->crtc);
 
 	spin_lock_irqsave(&priv->drm->event_lock, flags);
@@ -581,10 +640,20 @@ int meson_crtc_create(struct meson_drm *priv)
 		meson_crtc->enable_osd1 = meson_g12a_crtc_enable_osd1;
 		meson_crtc->enable_vd1 = meson_g12a_crtc_enable_vd1;
 		meson_crtc->viu_offset = MESON_G12A_VIU_OFFSET;
+		meson_crtc->enable_osd1_afbc =
+					meson_crtc_g12a_enable_osd1_afbc;
+		meson_crtc->disable_osd1_afbc =
+					meson_viu_g12a_disable_osd1_afbc;
 		drm_crtc_helper_add(crtc, &meson_g12a_crtc_helper_funcs);
 	} else {
 		meson_crtc->enable_osd1 = meson_crtc_enable_osd1;
 		meson_crtc->enable_vd1 = meson_crtc_enable_vd1;
+		if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXM)) {
+			meson_crtc->enable_osd1_afbc =
+					meson_viu_gxm_enable_osd1_afbc;
+			meson_crtc->disable_osd1_afbc =
+					meson_viu_gxm_disable_osd1_afbc;
+		}
 		drm_crtc_helper_add(crtc, &meson_crtc_helper_funcs);
 	}
 
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
