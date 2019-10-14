Return-Path: <SRS0=+CC3=YH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9637EECE587
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Oct 2019 12:40:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67D3220650
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Oct 2019 12:40:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gDY0yZdx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ydNvvSOI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67D3220650
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RMdZuYSuRXREIY1+ZG7IGxTRUAzQ4+rM96gt+VvkGjQ=; b=gDY0yZdxZekl1J
	7Ni0HruzUMH8mtDHyMfntQNzOigs/k2o6KMUsS3XA+/qeXEevn0bXjKceIAjYEWej3uHLpFRGitzG
	pN0ES6296AFZIVv4eouZBFkT1jAe3DeYrtLtiy9zec7dbtpCgYEx4sE8yRF5mZFtBTOYIqJk50gP4
	OyhG2FG/y0LcDp12fTHqDIFUvxrcCN7tSjMsbcYtfpf2zg31Fqes7Q2tIBZ9pM3YlwTi5D5RtPHSb
	/Vuk5KOSdWzOZSDRwplyeKfJNrq0IlVdC0dv0x8vR0IPSv6T3E2geBcaunxKaz8ghXy2hhagXCily
	3oIMjxI9I51kT312pfRw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iJzed-0002gE-AF; Mon, 14 Oct 2019 12:40:51 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iJzcS-00084k-BD
 for linux-amlogic@lists.infradead.org; Mon, 14 Oct 2019 12:38:45 +0000
Received: by mail-wr1-x444.google.com with SMTP id y19so19569978wrd.3
 for <linux-amlogic@lists.infradead.org>; Mon, 14 Oct 2019 05:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZUMaf0SNyeTXqJDQ2zj2y54gRfa0la6e9vYK/qX/aYM=;
 b=ydNvvSOIkPhQ/svDJzvckOn8NGmrpiGQKRN4sWqCiyG8VvMcy9AdVdAhx5IrlQlY8Z
 qYJkB241N2Rf+6QtFjqR8t5enA8Mhs/m3fWs3+SNC9OxjJG7MLcx/M8RD8d9n45T37yB
 nUcsIyD84PSuNj/yrOMhSmZ1KoJEns+tv3h461zXd3SVG2JDmGQU1XOCJpsriijIlzBZ
 UkI2N2pLp+0HqUgifVnOyzQ8KTUAKvqEb/4tCfznijqPvGHrtSdTClR1lGUxK73zwujo
 8kF4tV4M7Vzil0vf/95G+kH9gf2u2/2veLGCjRglDFUeXfr3YCATeW9OZM+miK0u9Ikm
 5VnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZUMaf0SNyeTXqJDQ2zj2y54gRfa0la6e9vYK/qX/aYM=;
 b=qAsKGWfdAoI+fZ/O6UMaQY1CwPb4Cr2BRpQkRQcHi+oHPqXC90xvQHVFa909EAZPAV
 y/SjItJ+fgHxfi4i2JcnXl3nqiXRo3CbKFAVWe0DlOVo9Mdeez7HZC2YxPNKL+wkPJJO
 6bL6T9LR5GeRVkBZe/xFoSeI99/CS0O8nQzthKAQ5F7WyONATKYdXjA9QBvvbaCZBfbF
 zH5LrJ3mVecqB4Hvsil0aDD2Q2kVpD7K28hLqifkmT00uCEE/DHY0X5XBqd6B5iS9PE+
 gONEpv6HlzUBFndJdDaRAQEvltmfASMXJS3m224/9pzrK1yAOgEoyR90nLAoVoQ0gbAL
 HBkQ==
X-Gm-Message-State: APjAAAUjH1PbYdCevdBuz8ssBMCbIP7lRg1D1xt8M5tFoREZr9snzEOC
 VWfXTScJedOh00O90TOVgW2YoQ==
X-Google-Smtp-Source: APXvYqzJNRPaaQMtvLEpbINL9YKBHIeyCgYQe7WPDcGPn9WtfZyiiCXRhhBXXx0P44Rp/tMTr2rkZQ==
X-Received: by 2002:adf:fd0a:: with SMTP id e10mr24001667wrr.55.1571056714934; 
 Mon, 14 Oct 2019 05:38:34 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id 3sm19171203wmo.22.2019.10.14.05.38.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 05:38:34 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 5/7] drm/meson: viu: add AFBC modules routing functions
Date: Mon, 14 Oct 2019 14:38:24 +0200
Message-Id: <20191014123826.27629-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191014123826.27629-1-narmstrong@baylibre.com>
References: <20191014123826.27629-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191014_053836_401635_49E84CF0 
X-CRM114-Status: GOOD (  10.42  )
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

The Amlogic G12A AFBC Decoder pixel input need to be routed diferently
than the Amlogic GXM AFBC decoder, this adds support for routing the
VIU OSD1 pixel source to the AFBC "Mali Unpack" module.

This "Mali Unpack" module is also configured with a static RGBA mapping
for now until we support more pixel formats.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_viu.c | 76 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/meson/meson_viu.h |  4 ++
 2 files changed, 80 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_viu.c b/drivers/gpu/drm/meson/meson_viu.c
index 68cf2c2eca5f..07713588063e 100644
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
