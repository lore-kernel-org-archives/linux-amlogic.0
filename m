Return-Path: <SRS0=mlCU=YO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B103CA9EB9
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Oct 2019 09:19:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B19720659
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Oct 2019 09:19:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HxpapDLK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ofDGK82V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B19720659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BOaakJP9sDXjpq020sEHo4qi1Wyh2w1dit57e2nLa+g=; b=HxpapDLK6NN2wM
	sZ041H279+xCgmT7AptyXiqzPI8U3GFLw2Cm1LN/yW4610O7L2XlzK8A/GUeD8gu4HZTYem+6bsCj
	klJOHneHg4M7HeT4ENNfX4+LLLcHUSff5a6mrXxPn7sA49UPPs4tn7UzK+T4rETLOiApmIaYD5WRX
	TCYevD2jFMUt10FXlLdxS5KU76Uyl60Api9ZuY4CIL9dMa8a6vjJMAK80YI5+dRObxMZumdhx9QFM
	K+fsfHzjTcOWrdfPclMs5tGUt1mN9m1q6p9xWSR41XY0f2t1Ahph25GfQ9JuNsJ27dESy+amcTDc2
	sTYJAz8F9wMEonre3zYA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMTqU-0005ik-Kd; Mon, 21 Oct 2019 09:19:22 +0000
Received: from mail-wr1-f67.google.com ([209.85.221.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMTmZ-0002jb-RF
 for linux-amlogic@lists.infradead.org; Mon, 21 Oct 2019 09:15:28 +0000
Received: by mail-wr1-f67.google.com with SMTP id s1so4242645wro.0
 for <linux-amlogic@lists.infradead.org>; Mon, 21 Oct 2019 02:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L7PVn0GT+Q53b4/05X2gw4wIJMYhfbWDBhvgtlSOvjw=;
 b=ofDGK82VOw5Ncz2vVTOV1TMjbrUX7M29g/YosoTtWp/VEzgfXZJyPxyQJZaA1jYUDI
 6VwARmBgnEuTXOmVoZ8f2DWfXMOKKab/Rmyd+tFR1aerGApBOm5Kmmznv+vm1WPeHhYB
 cpID+cSEINtBgzrK0M5lSHQnuYoKG+daWWPgnqeSrV0GSnM62YZ+2ysxqmkiFeE3VVgo
 EBqoceFLRvOA8nW6RJJwjDj0rQoS0oig6aRrQNjfyGjAcWICXWjRwDap4eXeTe6mpyhW
 MaD64Zt9wNEBQUA+U/xNAAtn0ai/zoeDijMgOy3zO++Ugu65aQ6LGsIegXif1PXvfH/y
 LCfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L7PVn0GT+Q53b4/05X2gw4wIJMYhfbWDBhvgtlSOvjw=;
 b=U5q/Y0Fjfd9GzFEbGc0uExEgNnazWuj+UuwPrTkhhKx6YspX9Q3qbgZAmjcPXwQGxI
 XdqObO9fVPmtlM4tfa6n4xf62TyAyzb2VRZyN0GJf8Ga4JF4jChuJiFzMVqW7dDqZiwE
 0+GbvxgfZ+Mf7ylY9PqHh3YdslhIEP2okfAHeHUh91vNNhH3TNK8Zs0bU1iVDa83n49g
 oBBh3GCZES3j2Is4zccPE5IweGgx17NV336PJ78dBC5KYMcVXwxoIf1nLk4oLiQ68l5H
 +plrnb0ba3IXy5sVSM14p3KqIyXfnj0+RJl2kkwShYf+0ra/dc7VG9sDyDbRNier7Pk/
 R5Kg==
X-Gm-Message-State: APjAAAX4LO+hwJM625HPBppALi6m3HJas1mcG+6ZihTO7vpGuQDiUP1k
 aPstmkMU7itYj5TRnV8sG2Af3Q==
X-Google-Smtp-Source: APXvYqwAqbtjZjSfSNeJmQ4stzCKH53tgotYC+GelIt6j4qQHRvFi9R3qDk8zExKNDBhi/6D0FAODw==
X-Received: by 2002:adf:fc4c:: with SMTP id e12mr7862537wrs.179.1571649317355; 
 Mon, 21 Oct 2019 02:15:17 -0700 (PDT)
Received: from localhost.localdomain
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t13sm20281595wra.70.2019.10.21.02.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 02:15:16 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 7/9] drm/meson: viu: add AFBC modules routing functions
Date: Mon, 21 Oct 2019 11:15:07 +0200
Message-Id: <20191021091509.3864-8-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191021091509.3864-1-narmstrong@baylibre.com>
References: <20191021091509.3864-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191021_021519_984800_F34B1C5B 
X-CRM114-Status: GOOD (  11.21  )
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

The Amlogic G12A AFBC Decoder pixel input need to be routed diferently
than the Amlogic GXM AFBC decoder, this adds support for routing the
VIU OSD1 pixel source to the AFBC "Mali Unpack" module.

This "Mali Unpack" module is also configured with a static RGBA mapping
for now until we support more pixel formats.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_viu.c | 81 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/meson/meson_viu.h |  4 ++
 2 files changed, 85 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_viu.c b/drivers/gpu/drm/meson/meson_viu.c
index 68cf2c2eca5f..fc246248226b 100644
--- a/drivers/gpu/drm/meson/meson_viu.c
+++ b/drivers/gpu/drm/meson/meson_viu.c
@@ -7,6 +7,9 @@
  */
 
 #include <linux/export.h>
+#include <linux/bitfield.h>
+
+#include <drm/drm_fourcc.h>
 
 #include "meson_drv.h"
 #include "meson_viu.h"
@@ -335,6 +338,79 @@ void meson_viu_osd1_reset(struct meson_drm *priv)
 	meson_viu_load_matrix(priv);
 }
 
+#define OSD1_MALI_ORDER_ABGR				\
+	(FIELD_PREP(VIU_OSD1_MALI_AFBCD_A_REORDER,	\
+		    VIU_OSD1_MALI_REORDER_A) |		\
+	 FIELD_PREP(VIU_OSD1_MALI_AFBCD_B_REORDER,	\
+		    VIU_OSD1_MALI_REORDER_B) |		\
+	 FIELD_PREP(VIU_OSD1_MALI_AFBCD_G_REORDER,	\
+		    VIU_OSD1_MALI_REORDER_G) |		\
+	 FIELD_PREP(VIU_OSD1_MALI_AFBCD_R_REORDER,	\
+		    VIU_OSD1_MALI_REORDER_R))
+
+#define OSD1_MALI_ORDER_ARGB				\
+	(FIELD_PREP(VIU_OSD1_MALI_AFBCD_A_REORDER,	\
+		    VIU_OSD1_MALI_REORDER_A) |		\
+	 FIELD_PREP(VIU_OSD1_MALI_AFBCD_B_REORDER,	\
+		    VIU_OSD1_MALI_REORDER_R) |		\
+	 FIELD_PREP(VIU_OSD1_MALI_AFBCD_G_REORDER,	\
+		    VIU_OSD1_MALI_REORDER_G) |		\
+	 FIELD_PREP(VIU_OSD1_MALI_AFBCD_R_REORDER,	\
+		    VIU_OSD1_MALI_REORDER_B))
+
+void meson_viu_g12a_enable_osd1_afbc(struct meson_drm *priv)
+{
+	u32 afbc_order = OSD1_MALI_ORDER_ARGB;
+
+	/* Enable Mali AFBC Unpack */
+	writel_bits_relaxed(VIU_OSD1_MALI_UNPACK_EN,
+			    VIU_OSD1_MALI_UNPACK_EN,
+			    priv->io_base + _REG(VIU_OSD1_MALI_UNPACK_CTRL));
+
+	switch (priv->afbcd.format) {
+	case DRM_FORMAT_XBGR8888:
+	case DRM_FORMAT_ABGR8888:
+		afbc_order = OSD1_MALI_ORDER_ABGR;
+		break;
+	}
+
+	/* Setup RGBA Reordering */
+	writel_bits_relaxed(VIU_OSD1_MALI_AFBCD_A_REORDER |
+			    VIU_OSD1_MALI_AFBCD_B_REORDER |
+			    VIU_OSD1_MALI_AFBCD_G_REORDER |
+			    VIU_OSD1_MALI_AFBCD_R_REORDER,
+			    afbc_order,
+			    priv->io_base + _REG(VIU_OSD1_MALI_UNPACK_CTRL));
+
+	/* Select AFBCD path for OSD1 */
+	writel_bits_relaxed(OSD_PATH_OSD_AXI_SEL_OSD1_AFBCD,
+			    OSD_PATH_OSD_AXI_SEL_OSD1_AFBCD,
+			    priv->io_base + _REG(OSD_PATH_MISC_CTRL));
+}
+
+void meson_viu_g12a_disable_osd1_afbc(struct meson_drm *priv)
+{
+	/* Disable AFBCD path for OSD1 */
+	writel_bits_relaxed(OSD_PATH_OSD_AXI_SEL_OSD1_AFBCD, 0,
+			    priv->io_base + _REG(OSD_PATH_MISC_CTRL));
+
+	/* Disable AFBCD unpack */
+	writel_bits_relaxed(VIU_OSD1_MALI_UNPACK_EN, 0,
+			    priv->io_base + _REG(VIU_OSD1_MALI_UNPACK_CTRL));
+}
+
+void meson_viu_gxm_enable_osd1_afbc(struct meson_drm *priv)
+{
+	writel_bits_relaxed(MALI_AFBC_MISC, FIELD_PREP(MALI_AFBC_MISC, 0x90),
+			    priv->io_base + _REG(VIU_MISC_CTRL1));
+}
+
+void meson_viu_gxm_disable_osd1_afbc(struct meson_drm *priv)
+{
+	writel_bits_relaxed(MALI_AFBC_MISC, FIELD_PREP(MALI_AFBC_MISC, 0x00),
+			    priv->io_base + _REG(VIU_MISC_CTRL1));
+}
+
 static inline uint32_t meson_viu_osd_burst_length_reg(uint32_t length)
 {
 	uint32_t val = (((length & 0x80) % 24) / 12);
@@ -420,8 +496,13 @@ void meson_viu_init(struct meson_drm *priv)
 
 		writel_bits_relaxed(DOLBY_BYPASS_EN(0xc), DOLBY_BYPASS_EN(0xc),
 				    priv->io_base + _REG(DOLBY_PATH_CTRL));
+
+		meson_viu_g12a_disable_osd1_afbc(priv);
 	}
 
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXM))
+		meson_viu_gxm_disable_osd1_afbc(priv);
+
 	priv->viu.osd1_enabled = false;
 	priv->viu.osd1_commit = false;
 	priv->viu.osd1_interlace = false;
diff --git a/drivers/gpu/drm/meson/meson_viu.h b/drivers/gpu/drm/meson/meson_viu.h
index e297772d967f..e4a2f24d7c38 100644
--- a/drivers/gpu/drm/meson/meson_viu.h
+++ b/drivers/gpu/drm/meson/meson_viu.h
@@ -63,6 +63,10 @@
 #define OSD_PENDING_STAT_CLEAN	BIT(1)
 
 void meson_viu_osd1_reset(struct meson_drm *priv);
+void meson_viu_g12a_enable_osd1_afbc(struct meson_drm *priv);
+void meson_viu_g12a_disable_osd1_afbc(struct meson_drm *priv);
+void meson_viu_gxm_enable_osd1_afbc(struct meson_drm *priv);
+void meson_viu_gxm_disable_osd1_afbc(struct meson_drm *priv);
 void meson_viu_init(struct meson_drm *priv);
 
 #endif /* __MESON_VIU_H */
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
