Return-Path: <SRS0=8dHl=YD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B8C0C4360C
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Oct 2019 09:27:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB9402064A
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Oct 2019 09:27:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HWIJGnqP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ait9xnBM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB9402064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XSo6WD3alwkW7s8bVr98dGp6HVsqCyFhZ6EOz5V77+s=; b=HWIJGnqPunyaJv
	drE03ABtQEbxAkaamP1F76ryH0wHnCRykzjZWSkPNflmXXFA0838QYZj3VU6RAOzao97IJ0r+RLzi
	mRQ4U/2SZevuetQ0OZ0enCjN/RTEF+pjrmkmW7LLUZ5/n5V3D7GHH7Tz9iYSK6eig4XQ5CL+Uo7yy
	FWL/8Pwv0ONHhe0ztOCziO/5Pzjd4BYBtC1Mgmb9nr+e2d2c9toXkQd6iLZHdBAN4aGd2wSQdXau8
	mezfGNs/9YSjO4PhlnDz79594aXFRO7I39Mcu10imjlK3++KvIt2QdlqxdxSrgA6zC9VIKn8Qnw2V
	dJmaCA8tFDJ8kUgV/ObA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iIUjG-0007tM-PO; Thu, 10 Oct 2019 09:27:26 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iIUhU-000614-Nn
 for linux-amlogic@lists.infradead.org; Thu, 10 Oct 2019 09:25:43 +0000
Received: by mail-wm1-x344.google.com with SMTP id y21so5976825wmi.0
 for <linux-amlogic@lists.infradead.org>; Thu, 10 Oct 2019 02:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EiSsjXYdZZOyYEr4Sge65wETKP2xlBLGlhOiCPBSXkE=;
 b=ait9xnBMAOrsRdMi5CeL3NzDmgSZD2mVAD1mIfGugZMYn1LWUCbSMLxvX7m+O9sj8j
 MizCi7lUiBstoNe4tB/ksuELUrMzaVoT1PMfZsznDKFUZdOg9U9IKLZ3nvIvhGLzp0Fl
 xsJJnbQqkv7raoZb9wjJqlOO0iJV/SvhEkzSzm2WpS0iy8uCjlRETj0ZWhr4isYKbc53
 f472PSfqZ6syHo52gpBCORvtO+lQELs0Dj2XdsVF+QlC+dQsqunyDw+MddP4LbctGHSf
 frufH6kgbjBEspcvyq9q0SsZTNTR1U2Qxqfd2L7G76Tq3MRehl+04/GkAg73dEFSNKa3
 daYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EiSsjXYdZZOyYEr4Sge65wETKP2xlBLGlhOiCPBSXkE=;
 b=F0Vgh6QOIyWUO9SI1AcWoCU4s87pnFnrYXhWm0NXrWhviPJ0s1Oz8Dh8UAednH3why
 sj6lqnhF1qiyevah+A1UF8vo+QoUT9a48F97Tv29UIQO+kcuCzp6p5WkONa5qNJHw3VH
 Rzn4lL0QejWusWmeY2lTi7O4YXCcvc3CWSs2fUUrb+pZ+aJ1EwSTSC6FAH1IGwLQqey9
 xRnlkx7s3i5Y/UmpE3IFwE5mHlZ6HNahFOIzIeILIhIzhhVJ52sceuORJZM+Ivc8mG5C
 f9f99uUElhyEC9NJASMx1iIhBtvtIakfmzwFQgR77eIe1yiUHf7dl15Oel4dvCpFAeVu
 km/A==
X-Gm-Message-State: APjAAAX+QKhMFE+L1SKo2oFGNXuW2ZTBx17riR/9Awf40a8bzrNCaTUY
 LCCO6BQ7/YLXjkpt35l837xaKg==
X-Google-Smtp-Source: APXvYqyBVoajlP5vjix/c17dx4moWvI5EYXInH/3U4U3nugr56QHYjHvFE4nqRv5CRTh3wdaMlLlxQ==
X-Received: by 2002:a05:600c:22d7:: with SMTP id
 23mr6633492wmg.31.1570699535221; 
 Thu, 10 Oct 2019 02:25:35 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s10sm8373770wmf.48.2019.10.10.02.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 02:25:34 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 7/7] drm/meson: crtc: add OSD1 plane AFBC commit
Date: Thu, 10 Oct 2019 11:25:26 +0200
Message-Id: <20191010092526.10419-8-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191010092526.10419-1-narmstrong@baylibre.com>
References: <20191010092526.10419-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191010_022536_855821_15310A1A 
X-CRM114-Status: GOOD (  13.45  )
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
Cc: khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 ayan.halder@arm.com, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
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
