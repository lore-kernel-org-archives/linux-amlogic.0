Return-Path: <SRS0=8dHl=YD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AD4BC4360C
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Oct 2019 09:26:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 355332064A
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Oct 2019 09:26:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jZ///UYr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="LirWXDC/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 355332064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CucNkfxf0ujb4mFA0A5SICe4Zan/K3b8i5w0ARsS0cg=; b=jZ///UYrQITc/W
	Tq8QbIr2fHMSd3RCAFiqysFVqB8aU8ibqasyQ3ziliv3ftZWXAW4ScIS32clKtGTQRLc0KYDKPUAg
	jokBQEaESHS9z5fW1XldUNt8EhtSh3/jicIyL/5gGjXgXN3apGMkohNkbMlQJ7qwGn+Yvz/1MD6/1
	hEtKtZbNp4nKbQFUWVqdhvighrIGlTMDjLZEMwlkocW9OvZDVZhBD+3/3gRh5Sbe16BXN3pYUcH7E
	2bspIl7+QdQc5MyXrqirV2KnIFwUXPL8VUe7nHYPYNhwqASoA654QyCwuRRsEtA+2Ji57MJDiLw4D
	QgNl5/QG4aRQdyt25gog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iIUiH-0006mt-9t; Thu, 10 Oct 2019 09:26:25 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iIUhR-0005yq-BZ
 for linux-amlogic@lists.infradead.org; Thu, 10 Oct 2019 09:25:37 +0000
Received: by mail-wm1-x343.google.com with SMTP id 3so5971036wmi.3
 for <linux-amlogic@lists.infradead.org>; Thu, 10 Oct 2019 02:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jNOW6VFMFnuOEHBHUTNnkLO8G+eFUm1jKDuBa5pJiKw=;
 b=LirWXDC/uJCGfPj6YwT8MzFZ/H8e3/V/KIYk6xg9HSOap4IKAfXvSPWxCbXaqk84nJ
 qnZ+HIRKaUknvCY9Wy7uMsfe+3HD6Rr5rhnpifac91CnRM2o4j6AI0rQuQ8be/WaRTHu
 hgsgTBGLXPnRkw9+Jx2bwqwN/CPI/6IyjvA8NHAtMW+m85dX5as7MwHgTZNNyn4Cm4y3
 Lb4te3Ce/SGrkF5TA+s1mrxx85RJ4DyxdGGrjuHIqJ3P6QtVXoMhqdb0KL+dsqtDX9ev
 L8Od8xDxC0HFUGQw5E6kRabxnZ1bevJqX90cD67QSLoCrJG/wUt00KhxIhVEPd7q47H6
 r0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jNOW6VFMFnuOEHBHUTNnkLO8G+eFUm1jKDuBa5pJiKw=;
 b=k1DJR+uAJbaWdjnSgeIRUpI9wk4qi5GlxbdtFJbjPLM+1vVwXt/BdH4Zy27zVSnNER
 3pAOuAl/eBfugs1GOTmS0MSBsMDiuaq4c+2SxcN+nT5g8J7B1Wk0Ii0GwDz4nPu21xDr
 8fKOA3ksvv28rAA4G9oTjOYmazC+1uXCwKpOSU+y5BcAP4I2WtYTVCnHIJsrpIYbj0cs
 PT3SC59ZKdsWIAnApnQRKTtYvN1xUiy2YASnytTT/5mng15TdkXw3G3ENsIWxc5h9t7T
 aNAL5wPHKkcrl3IA+Y360cTJa/4GyXkLAY4M0Ob93lLua5Kg6XMFHJmwsudZuPpKq5ss
 yOTA==
X-Gm-Message-State: APjAAAVwe3zIB7xaJRYsl6WqFwJ7inWM39051vtEMppOytqQ+GXwuUw0
 4bz9bMuW+CACjkp9dTTGpbNir+IRnUJ7hA==
X-Google-Smtp-Source: APXvYqwrx9k09Qz9beA56ra3SmYtiEFiO6W6iJpVpbX/4MiFYrKQUlpbm22UU2M2mqGVU9vMVtpwwA==
X-Received: by 2002:a05:600c:c1:: with SMTP id u1mr6233756wmm.87.1570699531768; 
 Thu, 10 Oct 2019 02:25:31 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s10sm8373770wmf.48.2019.10.10.02.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 02:25:31 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/7] drm/meson: Add AFBCD module driver
Date: Thu, 10 Oct 2019 11:25:22 +0200
Message-Id: <20191010092526.10419-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191010092526.10419-1-narmstrong@baylibre.com>
References: <20191010092526.10419-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191010_022533_531170_CACD229A 
X-CRM114-Status: GOOD (  22.79  )
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

This adds the driver for the ARM Framebuffer Compression decoders found
in the Amlogic GXM and G12A SoCs.

The Amlogic GXM and G12A AFBC decoder are totally different, the GXM only
handling only the AFBC v1.0 modes and the G12A decoder handling the
AFBC v1.2 modes.

The G12A AFBC decoder is an external IP integrated in the video pipeline,
and the GXM AFBC decoder seems to the an Amlogic custom decoder more
tighly integrated in the video pipeline.

The GXM AFBC decoder can handle only one AFBC plane for 2 available
OSD planes available in HW, and the G12A AFBC decoder can handle up
to 4 AFBC planes for up to 3 OSD planes available in HW.

The Amlogic GXM supports 16x16 SPARSE and 16x16 SPLIT AFBC buffers up
to 4k.

On the other side, for G12A SPLIT is mandatory in 16x16 block mode, but
for 4k modes 32x8+SPLIT AFBC buffers is manadatory for performances reasons.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/Makefile          |   1 +
 drivers/gpu/drm/meson/meson_drv.c       |  38 ++-
 drivers/gpu/drm/meson/meson_drv.h       |  12 +
 drivers/gpu/drm/meson/meson_osd_afbcd.c | 370 ++++++++++++++++++++++++
 drivers/gpu/drm/meson/meson_osd_afbcd.h |  28 ++
 5 files changed, 443 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/drm/meson/meson_osd_afbcd.c
 create mode 100644 drivers/gpu/drm/meson/meson_osd_afbcd.h

diff --git a/drivers/gpu/drm/meson/Makefile b/drivers/gpu/drm/meson/Makefile
index c389e2399133..b1fa055aaed3 100644
--- a/drivers/gpu/drm/meson/Makefile
+++ b/drivers/gpu/drm/meson/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 meson-drm-y := meson_drv.o meson_plane.o meson_crtc.o meson_venc_cvbs.o
 meson-drm-y += meson_viu.o meson_vpp.o meson_venc.o meson_vclk.o meson_overlay.o
+meson-drm-y += meson_osd_afbcd.o
 
 obj-$(CONFIG_DRM_MESON) += meson-drm.o
 obj-$(CONFIG_DRM_MESON_DW_HDMI) += meson_dw_hdmi.o
diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index a24f8dec5adc..0f31e70bb94f 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -28,6 +28,7 @@
 #include "meson_drv.h"
 #include "meson_overlay.h"
 #include "meson_plane.h"
+#include "meson_osd_afbcd.h"
 #include "meson_registers.h"
 #include "meson_venc_cvbs.h"
 #include "meson_viu.h"
@@ -184,6 +185,7 @@ static void meson_remove_framebuffers(void)
 static int meson_drv_bind_master(struct device *dev, bool has_components)
 {
 	struct platform_device *pdev = to_platform_device(dev);
+	const struct meson_drm_match_data *match;
 	struct meson_drm *priv;
 	struct drm_device *drm;
 	struct resource *res;
@@ -196,6 +198,10 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 		return -ENODEV;
 	}
 
+	match = of_device_get_match_data(dev);
+	if (!match)
+		return -ENODEV;
+
 	drm = drm_dev_alloc(&meson_driver, dev);
 	if (IS_ERR(drm))
 		return PTR_ERR(drm);
@@ -208,8 +214,8 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 	drm->dev_private = priv;
 	priv->drm = drm;
 	priv->dev = dev;
-
-	priv->compat = (enum vpu_compatible)of_device_get_match_data(priv->dev);
+	priv->compat = match->compat;
+	priv->afbcd.ops = match->afbcd_ops;
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "vpu");
 	regs = devm_ioremap_resource(dev, res);
@@ -289,6 +295,8 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 	meson_venc_init(priv);
 	meson_vpp_init(priv);
 	meson_viu_init(priv);
+	if (priv->afbcd.ops)
+		priv->afbcd.ops->init(priv);
 
 	/* Encoder Initialization */
 
@@ -454,15 +462,33 @@ static int meson_drv_probe(struct platform_device *pdev)
 	return 0;
 };
 
+static struct meson_drm_match_data meson_drm_gxbb_data = {
+	.compat = VPU_COMPATIBLE_GXBB,
+};
+
+static struct meson_drm_match_data meson_drm_gxl_data = {
+	.compat = VPU_COMPATIBLE_GXL,
+};
+
+static struct meson_drm_match_data meson_drm_gxm_data = {
+	.compat = VPU_COMPATIBLE_GXM,
+	.afbcd_ops = &meson_afbcd_gxm_ops,
+};
+
+static struct meson_drm_match_data meson_drm_g12a_data = {
+	.compat = VPU_COMPATIBLE_G12A,
+	.afbcd_ops = &meson_afbcd_g12a_ops,
+};
+
 static const struct of_device_id dt_match[] = {
 	{ .compatible = "amlogic,meson-gxbb-vpu",
-	  .data       = (void *)VPU_COMPATIBLE_GXBB },
+	  .data       = (void *)&meson_drm_gxbb_data },
 	{ .compatible = "amlogic,meson-gxl-vpu",
-	  .data       = (void *)VPU_COMPATIBLE_GXL },
+	  .data       = (void *)&meson_drm_gxl_data },
 	{ .compatible = "amlogic,meson-gxm-vpu",
-	  .data       = (void *)VPU_COMPATIBLE_GXM },
+	  .data       = (void *)&meson_drm_gxm_data },
 	{ .compatible = "amlogic,meson-g12a-vpu",
-	  .data       = (void *)VPU_COMPATIBLE_G12A },
+	  .data       = (void *)&meson_drm_g12a_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
diff --git a/drivers/gpu/drm/meson/meson_drv.h b/drivers/gpu/drm/meson/meson_drv.h
index 3287282450a9..60f13c6f34e5 100644
--- a/drivers/gpu/drm/meson/meson_drv.h
+++ b/drivers/gpu/drm/meson/meson_drv.h
@@ -16,6 +16,7 @@ struct drm_crtc;
 struct drm_device;
 struct drm_plane;
 struct meson_drm;
+struct meson_afbcd_ops;
 
 enum vpu_compatible {
 	VPU_COMPATIBLE_GXBB = 0,
@@ -24,6 +25,11 @@ enum vpu_compatible {
 	VPU_COMPATIBLE_G12A = 3,
 };
 
+struct meson_drm_match_data {
+	enum vpu_compatible compat;
+	struct meson_afbcd_ops *afbcd_ops;
+};
+
 struct meson_drm {
 	struct device *dev;
 	enum vpu_compatible compat;
@@ -123,6 +129,12 @@ struct meson_drm {
 		bool venc_repeat;
 		bool hdmi_use_enci;
 	} venc;
+
+	struct {
+		struct meson_afbcd_ops *ops;
+		u64 modifier;
+		u32 format;
+	} afbcd;
 };
 
 static inline int meson_vpu_is_compatible(struct meson_drm *priv,
diff --git a/drivers/gpu/drm/meson/meson_osd_afbcd.c b/drivers/gpu/drm/meson/meson_osd_afbcd.c
new file mode 100644
index 000000000000..36caf5716e8c
--- /dev/null
+++ b/drivers/gpu/drm/meson/meson_osd_afbcd.c
@@ -0,0 +1,370 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2019 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#include <linux/bitfield.h>
+
+#include <drm/drm_print.h>
+#include <drm/drm_fourcc.h>
+
+#include "meson_drv.h"
+#include "meson_registers.h"
+#include "meson_viu.h"
+#include "meson_osd_afbcd.h"
+
+/*
+ * DOC: Driver for the ARM FrameBuffer Compression Decoders
+ *
+ * The Amlogic GXM and G12A SoC families embeds an AFBC Decoder,
+ * to decode compressed buffers generated by the ARM Mali GPU.
+ *
+ * For the GXM Family, Amlogic designed their own Decoder, named in
+ * the vendor source as "MESON_AFBC", and a single decoder is available
+ * for the 2 OSD planes.
+ * This decoder is compatible with the AFBC 1.0 specifications and the
+ * Mali T820 GPU capabilities.
+ * It supports :
+ * - basic AFBC buffer for RGB32 only, thus YTR feature is mandatory
+ * - SPARSE layout and SPLIT layout
+ * - only 16x16 superblock
+ *
+ * The decoder reads the data from the SDRAM, decodes and sends the
+ * decoded pixel stream to the OSD1 Plane pixel composer.
+ *
+ * For the G12A Family, Amlogic integrated an ARM AFBC Decoder, named
+ * in the vendor source as "MALI_AFBC", and the decoder can decode up
+ * to 4 surfaces, one for each of the 4 available OSDs.
+ * This decoder is compatible with the AFBC 1.2 specifications for the
+ * Mali G31 and G52 GPUs.
+ * Is supports :
+ * - basic AFBC buffer for multiple RGB and YUV pixel formats
+ * - SPARSE layout and SPLIT layout
+ * - 16x16 and 32x8 "wideblk" superblocks
+ * - Tiled header
+ *
+ * The ARM AFBC Decoder independent from the VPU Pixel Pipeline, so
+ * the ARM AFBC Decoder reads the data from the SDRAM then decodes
+ * into a private internal physical address where the OSD1 Plane pixel
+ * composer unpacks the decoded data.
+ */
+
+/* Amlogic AFBC Decoder for GXM Family */
+
+#define OSD1_AFBCD_RGB32	0x15
+
+static int meson_gxm_afbcd_pixel_fmt(u64 modifier, uint32_t format)
+{
+	switch (format) {
+	case DRM_FORMAT_XRGB8888:
+	case DRM_FORMAT_ARGB8888:
+	case DRM_FORMAT_XBGR8888:
+	case DRM_FORMAT_ABGR8888:
+		return OSD1_AFBCD_RGB32;
+	/* TOFIX support mode formats */
+	default:
+		DRM_DEBUG("unsupported afbc format[%08x]\n", format);
+		return -EINVAL;
+	}
+}
+
+static bool meson_gxm_afbcd_supported_fmt(u64 modifier, uint32_t format)
+{
+	if (modifier & AFBC_FORMAT_MOD_BLOCK_SIZE_32x8)
+		return false;
+
+	if (!(modifier & AFBC_FORMAT_MOD_YTR))
+		return false;
+
+	return meson_gxm_afbcd_pixel_fmt(modifier, format) >= 0;
+}
+
+static int meson_gxm_afbcd_init(struct meson_drm *priv)
+{
+	return 0;
+}
+
+static int meson_gxm_afbcd_reset(struct meson_drm *priv)
+{
+	writel_relaxed(VIU_SW_RESET_OSD1_AFBCD,
+		       priv->io_base + _REG(VIU_SW_RESET));
+	writel_relaxed(0, priv->io_base + _REG(VIU_SW_RESET));
+
+	return 0;
+}
+
+static int meson_gxm_afbcd_enable(struct meson_drm *priv)
+{
+	writel_relaxed(FIELD_PREP(OSD1_AFBCD_ID_FIFO_THRD, 0x40) |
+		       OSD1_AFBCD_DEC_ENABLE,
+		       priv->io_base + _REG(OSD1_AFBCD_ENABLE));
+
+	return 0;
+}
+
+static int meson_gxm_afbcd_disable(struct meson_drm *priv)
+{
+	writel_bits_relaxed(OSD1_AFBCD_DEC_ENABLE, 0,
+			    priv->io_base + _REG(OSD1_AFBCD_ENABLE));
+
+	return 0;
+}
+
+static int meson_gxm_afbcd_setup(struct meson_drm *priv)
+{
+	u32 conv_lbuf_len;
+	u32 mode = FIELD_PREP(OSD1_AFBCD_MIF_URGENT, 3) |
+		   FIELD_PREP(OSD1_AFBCD_HOLD_LINE_NUM, 4) |
+		   FIELD_PREP(OSD1_AFBCD_RGBA_EXCHAN_CTRL, 0x34) |
+		   meson_gxm_afbcd_pixel_fmt(priv->afbcd.modifier,
+					     priv->afbcd.format);
+
+	if (priv->afbcd.modifier & AFBC_FORMAT_MOD_SPARSE)
+		mode |= OSD1_AFBCD_HREG_HALF_BLOCK;
+
+	if (priv->afbcd.modifier & AFBC_FORMAT_MOD_SPLIT)
+		mode |= OSD1_AFBCD_HREG_BLOCK_SPLIT;
+
+	writel_relaxed(mode, priv->io_base + _REG(OSD1_AFBCD_MODE));
+
+	writel_relaxed(FIELD_PREP(OSD1_AFBCD_HREG_VSIZE_IN,
+				  priv->viu.osd1_width) |
+		       FIELD_PREP(OSD1_AFBCD_HREG_HSIZE_IN,
+				  priv->viu.osd1_height),
+		       priv->io_base + _REG(OSD1_AFBCD_SIZE_IN));
+
+	writel_relaxed(priv->viu.osd1_addr >> 4,
+		       priv->io_base + _REG(OSD1_AFBCD_HDR_PTR));
+	writel_relaxed(priv->viu.osd1_addr >> 4,
+		       priv->io_base + _REG(OSD1_AFBCD_FRAME_PTR));
+	/* TOFIX: bits 31:24 are not documented, nor the meaning of 0xe4 */
+	writel_relaxed((0xe4 << 24) | (priv->viu.osd1_addr & 0xffffff),
+		       priv->io_base + _REG(OSD1_AFBCD_CHROMA_PTR));
+
+	if (priv->viu.osd1_width <= 128)
+		conv_lbuf_len = 32;
+	else if (priv->viu.osd1_width <= 256)
+		conv_lbuf_len = 64;
+	else if (priv->viu.osd1_width <= 512)
+		conv_lbuf_len = 128;
+	else if (priv->viu.osd1_width <= 1024)
+		conv_lbuf_len = 256;
+	else if (priv->viu.osd1_width <= 2048)
+		conv_lbuf_len = 512;
+	else
+		conv_lbuf_len = 1024;
+
+	writel_relaxed(conv_lbuf_len,
+		       priv->io_base + _REG(OSD1_AFBCD_CONV_CTRL));
+
+	writel_relaxed(FIELD_PREP(OSD1_AFBCD_DEC_PIXEL_BGN_H, 0) |
+		       FIELD_PREP(OSD1_AFBCD_DEC_PIXEL_END_H,
+				  priv->viu.osd1_width - 1),
+		       priv->io_base + _REG(OSD1_AFBCD_PIXEL_HSCOPE));
+
+	writel_relaxed(FIELD_PREP(OSD1_AFBCD_DEC_PIXEL_BGN_V, 0) |
+		       FIELD_PREP(OSD1_AFBCD_DEC_PIXEL_END_V,
+				  priv->viu.osd1_height - 1),
+		       priv->io_base + _REG(OSD1_AFBCD_PIXEL_VSCOPE));
+
+	return 0;
+}
+
+struct meson_afbcd_ops meson_afbcd_gxm_ops = {
+	.init = meson_gxm_afbcd_init,
+	.reset = meson_gxm_afbcd_reset,
+	.enable = meson_gxm_afbcd_enable,
+	.disable = meson_gxm_afbcd_disable,
+	.setup = meson_gxm_afbcd_setup,
+	.supported_fmt = meson_gxm_afbcd_supported_fmt,
+};
+
+/* ARM AFBC Decoder for G12A Family */
+
+/* Amlogic G12A Mali AFBC Decoder supported formats */
+enum {
+	MAFBC_FMT_RGB565 = 0,
+	MAFBC_FMT_RGBA5551,
+	MAFBC_FMT_RGBA1010102,
+	MAFBC_FMT_YUV420_10B,
+	MAFBC_FMT_RGB888,
+	MAFBC_FMT_RGBA8888,
+	MAFBC_FMT_RGBA4444,
+	MAFBC_FMT_R8,
+	MAFBC_FMT_RG88,
+	MAFBC_FMT_YUV420_8B,
+	MAFBC_FMT_YUV422_8B = 11,
+	MAFBC_FMT_YUV422_10B = 14,
+};
+
+static int meson_g12a_afbcd_pixel_fmt(u64 modifier, uint32_t format)
+{
+	switch (format) {
+	case DRM_FORMAT_XRGB8888:
+	case DRM_FORMAT_ARGB8888:
+	case DRM_FORMAT_XBGR8888:
+	case DRM_FORMAT_ABGR8888:
+		return MAFBC_FMT_RGBA8888;
+	case DRM_FORMAT_RGB888:
+		return MAFBC_FMT_RGB888;
+	case DRM_FORMAT_RGB565:
+		return MAFBC_FMT_RGB565;
+	/* TOFIX support mode formats */
+	default:
+		DRM_DEBUG("unsupported afbc format[%08x]\n", format);
+		return -EINVAL;
+	}
+}
+
+static int meson_g12a_afbcd_bpp(uint32_t format)
+{
+	switch (format) {
+	case DRM_FORMAT_XRGB8888:
+	case DRM_FORMAT_ARGB8888:
+	case DRM_FORMAT_XBGR8888:
+	case DRM_FORMAT_ABGR8888:
+		return 32;
+	case DRM_FORMAT_RGB888:
+		return 24;
+	case DRM_FORMAT_RGB565:
+		return 16;
+	/* TOFIX support mode formats */
+	default:
+		DRM_ERROR("unsupported afbc format[%08x]\n", format);
+		return 0;
+	}
+}
+
+static int meson_g12a_afbcd_fmt_to_blk_mode(u64 modifier, uint32_t format)
+{
+	switch (format) {
+	case DRM_FORMAT_XRGB8888:
+	case DRM_FORMAT_ARGB8888:
+	case DRM_FORMAT_XBGR8888:
+	case DRM_FORMAT_ABGR8888:
+		return OSD_MALI_COLOR_MODE_RGBA8888;
+	case DRM_FORMAT_RGB888:
+		return OSD_MALI_COLOR_MODE_RGB888;
+	case DRM_FORMAT_RGB565:
+		return OSD_MALI_COLOR_MODE_RGB565;
+	/* TOFIX support mode formats */
+	default:
+		DRM_DEBUG("unsupported afbc format[%08x]\n", format);
+		return -EINVAL;
+	}
+}
+
+static bool meson_g12a_afbcd_supported_fmt(u64 modifier, uint32_t format)
+{
+	if (!(modifier & AFBC_FORMAT_MOD_YTR))
+		return false;
+
+	return meson_g12a_afbcd_pixel_fmt(modifier, format) >= 0;
+}
+
+static int meson_g12a_afbcd_init(struct meson_drm *priv)
+{
+	/* Handle AFBC Decoder reset manually */
+	writel_bits_relaxed(MALI_AFBCD_MANUAL_RESET, MALI_AFBCD_MANUAL_RESET,
+			    priv->io_base + _REG(MALI_AFBCD_TOP_CTRL));
+
+	return 0;
+}
+
+static int meson_g12a_afbcd_reset(struct meson_drm *priv)
+{
+	writel_relaxed(VIU_SW_RESET_G12A_AFBC_ARB |
+		       VIU_SW_RESET_G12A_OSD1_AFBCD,
+		       priv->io_base + _REG(VIU_SW_RESET));
+	writel_relaxed(0, priv->io_base + _REG(VIU_SW_RESET));
+
+	return 0;
+}
+
+static int meson_g12a_afbcd_enable(struct meson_drm *priv)
+{
+	writel_relaxed(VPU_MAFBC_IRQ_SURFACES_COMPLETED |
+		       VPU_MAFBC_IRQ_CONFIGURATION_SWAPPED |
+		       VPU_MAFBC_IRQ_DECODE_ERROR |
+		       VPU_MAFBC_IRQ_DETILING_ERROR,
+		       priv->io_base + _REG(VPU_MAFBC_IRQ_MASK));
+
+	writel_bits_relaxed(VPU_MAFBC_S0_ENABLE, VPU_MAFBC_S0_ENABLE,
+			    priv->io_base + _REG(VPU_MAFBC_SURFACE_CFG));
+
+	writel_relaxed(VPU_MAFBC_DIRECT_SWAP,
+		       priv->io_base + _REG(VPU_MAFBC_COMMAND));
+
+	return 0;
+}
+
+static int meson_g12a_afbcd_disable(struct meson_drm *priv)
+{
+	writel_bits_relaxed(VPU_MAFBC_S0_ENABLE, 0,
+			    priv->io_base + _REG(VPU_MAFBC_SURFACE_CFG));
+
+	return 0;
+}
+
+static int meson_g12a_afbcd_setup(struct meson_drm *priv)
+{
+	u32 format = meson_g12a_afbcd_pixel_fmt(priv->afbcd.modifier,
+						priv->afbcd.format);
+
+	if (priv->afbcd.modifier & AFBC_FORMAT_MOD_YTR)
+		format |= VPU_MAFBC_YUV_TRANSFORM;
+
+	if (priv->afbcd.modifier & AFBC_FORMAT_MOD_SPLIT)
+		format |= VPU_MAFBC_BLOCK_SPLIT;
+
+	if (priv->afbcd.modifier & AFBC_FORMAT_MOD_TILED)
+		format |= VPU_MAFBC_TILED_HEADER_EN;
+
+	if ((priv->afbcd.modifier & AFBC_FORMAT_MOD_BLOCK_SIZE_MASK) ==
+		AFBC_FORMAT_MOD_BLOCK_SIZE_32x8)
+		format |= FIELD_PREP(VPU_MAFBC_SUPER_BLOCK_ASPECT, 1);
+
+	writel_relaxed(format,
+		       priv->io_base + _REG(VPU_MAFBC_FORMAT_SPECIFIER_S0));
+
+	writel_relaxed(priv->viu.osd1_addr,
+		       priv->io_base + _REG(VPU_MAFBC_HEADER_BUF_ADDR_LOW_S0));
+	writel_relaxed(0,
+		       priv->io_base + _REG(VPU_MAFBC_HEADER_BUF_ADDR_HIGH_S0));
+
+	writel_relaxed(priv->viu.osd1_width,
+		       priv->io_base + _REG(VPU_MAFBC_BUFFER_WIDTH_S0));
+	writel_relaxed(ALIGN(priv->viu.osd1_height, 32),
+		       priv->io_base + _REG(VPU_MAFBC_BUFFER_HEIGHT_S0));
+
+	writel_relaxed(0,
+		       priv->io_base + _REG(VPU_MAFBC_BOUNDING_BOX_X_START_S0));
+	writel_relaxed(priv->viu.osd1_width - 1,
+		       priv->io_base + _REG(VPU_MAFBC_BOUNDING_BOX_X_END_S0));
+	writel_relaxed(0,
+		       priv->io_base + _REG(VPU_MAFBC_BOUNDING_BOX_Y_START_S0));
+	writel_relaxed(priv->viu.osd1_height - 1,
+		       priv->io_base + _REG(VPU_MAFBC_BOUNDING_BOX_Y_END_S0));
+
+	writel_relaxed(MESON_G12A_AFBCD_OUT_ADDR,
+		       priv->io_base + _REG(VPU_MAFBC_OUTPUT_BUF_ADDR_LOW_S0));
+	writel_relaxed(0,
+		       priv->io_base + _REG(VPU_MAFBC_OUTPUT_BUF_ADDR_HIGH_S0));
+
+	writel_relaxed(priv->viu.osd1_width *
+		       (meson_g12a_afbcd_bpp(priv->afbcd.format) / 8),
+		       priv->io_base + _REG(VPU_MAFBC_OUTPUT_BUF_STRIDE_S0));
+
+	return 0;
+}
+
+struct meson_afbcd_ops meson_afbcd_g12a_ops = {
+	.init = meson_g12a_afbcd_init,
+	.reset = meson_g12a_afbcd_reset,
+	.enable = meson_g12a_afbcd_enable,
+	.disable = meson_g12a_afbcd_disable,
+	.setup = meson_g12a_afbcd_setup,
+	.fmt_to_blk_mode = meson_g12a_afbcd_fmt_to_blk_mode,
+	.supported_fmt = meson_g12a_afbcd_supported_fmt,
+};
diff --git a/drivers/gpu/drm/meson/meson_osd_afbcd.h b/drivers/gpu/drm/meson/meson_osd_afbcd.h
new file mode 100644
index 000000000000..5e5523304f42
--- /dev/null
+++ b/drivers/gpu/drm/meson/meson_osd_afbcd.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2019 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#ifndef __MESON_OSD_AFBCD_H
+#define __MESON_OSD_AFBCD_H
+
+#include "meson_drv.h"
+
+/* This is an internal address used to transfer pixel from AFBC to the VIU */
+#define MESON_G12A_AFBCD_OUT_ADDR	0x1000000
+
+struct meson_afbcd_ops {
+	int (*init)(struct meson_drm *priv);
+	int (*reset)(struct meson_drm *priv);
+	int (*enable)(struct meson_drm *priv);
+	int (*disable)(struct meson_drm *priv);
+	int (*setup)(struct meson_drm *priv);
+	int (*fmt_to_blk_mode)(u64 modifier, uint32_t format);
+	bool (*supported_fmt)(u64 modifier, uint32_t format);
+};
+
+extern struct meson_afbcd_ops meson_afbcd_gxm_ops;
+extern struct meson_afbcd_ops meson_afbcd_g12a_ops;
+
+#endif /* __MESON_OSD_AFBCD_H */
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
