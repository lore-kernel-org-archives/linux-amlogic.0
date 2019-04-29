Return-Path: <SRS0=ef8O=S7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3C98C43219
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2019 07:52:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFEC22087B
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2019 07:52:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JZGzUf9T";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="E8jD+2dg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFEC22087B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X1e79sKbP7CmtmeXsv72/btp7WrABStQ2FJfRsffPvw=; b=JZGzUf9TZvXa8K
	aR39+Dwnzc2+KBTaTqF4m4PbD+D7mj+gn1DzpluZ7kgkQ8g3+wiz91/lTiffpCqIz42LlLnELNhQ8
	vGAVpsO5UG+qQxbTnDTkkXNQfhr4PdZgghFVOVMnI64V4VQtlJZF2V34gEoJIKisPRFiME0CiOH9h
	OKXwuaaww6ifQhEW7dTpRDb/eyCBwmPmzN2gwiZzpcIkC2s/fOLU9dQ3kt+1QNVLpc0STh0aHI2JV
	G2pT7Hf07SzCRqASrKEoraUmYwr2otMZezVGrVT/FneoyNFj2jgpIzR80IwL6xQVdUTzbkRLXr/cF
	zz/Yd2OMJ2yraCnccRAA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hL15n-0006D4-1R; Mon, 29 Apr 2019 07:52:51 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL15e-00065Z-KD
 for linux-amlogic@lists.infradead.org; Mon, 29 Apr 2019 07:52:44 +0000
Received: by mail-wm1-x344.google.com with SMTP id p21so10835518wmc.0
 for <linux-amlogic@lists.infradead.org>; Mon, 29 Apr 2019 00:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/+GdzCUbXbc9TnjbK+IzgC3Rn7LJK/U+L3O1XBIq//I=;
 b=E8jD+2dgpZNlzi2mli6iSqHgtX8ej4k2fD+p50X7E9LOuOgNBJ8gjAiK/IBRlJ+3OM
 /ezhla4lzKCiT7PZUIbPtAXYRSXzCpZOCkroWKcKrh8BWQv4R5GbvbhvcB1fx7/d8FSy
 G4CAF6FAJedyge2rIG6AwicnNEPM8G73yQvzHGrBoS+jwiRcXIKSh6VbwpVAZ0l4VTNI
 wok7bVcf5eQrVfmQTxDMGjxS30rWsNi12GwMpYTMAgbocRh2CqzeZWkF+rgUFVyywy24
 Im77RGr1kKsu0YTlS+T2nujXKe01K7Q05lij2Nt6vydzWaZfM69r7GVKjGUj5UymDHbh
 +GdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/+GdzCUbXbc9TnjbK+IzgC3Rn7LJK/U+L3O1XBIq//I=;
 b=qRSIWSU9FW53r+Uoa9DlCFq71l1r0TOasSn5e1JsHQ3wUdA+wv8ihA5Pw2lq5apM0w
 /tqwR0Gh0/OfSMDoNhUGlkeQWE9mPmKXY59t7yP0OHoUq5k1UB8zYKPuYouV/ycX1+FF
 KdSC/TsB2zqaCGrClniBgn1rVXC/EplTYTP76nNOr8pfdHmDlXjtKI3LDRtNPdajDsxk
 oZCdxBQod005wijf2z2IIfIl3vJm1MLYeMPjw5ujHR+P+YVVP1b9TGYjnT18FoZsbR23
 X4/oLk3+UVYGxELNr4ZiRsi7NBPszWrTUA81lcfYrrqX+TS+H3Nwr/W2ahNTe1xc9FPe
 /YmA==
X-Gm-Message-State: APjAAAVsK923RXu9ISHc677t9EVhYPKOQLOLtK/whoiqqtPAaUVR54s5
 56F6EIhgS3KVb8qnsry3KzrqQA==
X-Google-Smtp-Source: APXvYqyrm9gcWdptLmdNHOe30KFoldLfiJoNxGhNez9U3SHQHqIDbxiDVW0eb3kiP7omvUckOLprWA==
X-Received: by 2002:a1c:495:: with SMTP id 143mr8270669wme.109.1556524360393; 
 Mon, 29 Apr 2019 00:52:40 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id q4sm5118457wrg.24.2019.04.29.00.52.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 29 Apr 2019 00:52:39 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/meson: Add support for XBGR8888 & ABGR8888 formats
Date: Mon, 29 Apr 2019 09:52:38 +0200
Message-Id: <20190429075238.7884-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_005242_722905_D4539DC3 
X-CRM114-Status: UNSURE (   9.25  )
X-CRM114-Notice: Please train this message.
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
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add missing XBGR8888 & ABGR8888 formats variants from the primary plane.

Fixes: bbbe775ec5b5 ("drm: Add support for Amlogic Meson Graphic Controller")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_plane.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
index bf8f1fab63aa..b8f6b08a89a6 100644
--- a/drivers/gpu/drm/meson/meson_plane.c
+++ b/drivers/gpu/drm/meson/meson_plane.c
@@ -165,6 +165,13 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
 		priv->viu.osd1_blk0_cfg[0] |= OSD_BLK_MODE_32 |
 					      OSD_COLOR_MATRIX_32_ARGB;
 		break;
+	case DRM_FORMAT_XBGR8888:
+		/* For XRGB, replace the pixel's alpha by 0xFF */
+		writel_bits_relaxed(OSD_REPLACE_EN, OSD_REPLACE_EN,
+				    priv->io_base + _REG(VIU_OSD1_CTRL_STAT2));
+		priv->viu.osd1_blk0_cfg[0] |= OSD_BLK_MODE_32 |
+					      OSD_COLOR_MATRIX_32_ABGR;
+		break;
 	case DRM_FORMAT_ARGB8888:
 		/* For ARGB, use the pixel's alpha */
 		writel_bits_relaxed(OSD_REPLACE_EN, 0,
@@ -172,6 +179,13 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
 		priv->viu.osd1_blk0_cfg[0] |= OSD_BLK_MODE_32 |
 					      OSD_COLOR_MATRIX_32_ARGB;
 		break;
+	case DRM_FORMAT_ABGR8888:
+		/* For ARGB, use the pixel's alpha */
+		writel_bits_relaxed(OSD_REPLACE_EN, 0,
+				    priv->io_base + _REG(VIU_OSD1_CTRL_STAT2));
+		priv->viu.osd1_blk0_cfg[0] |= OSD_BLK_MODE_32 |
+					      OSD_COLOR_MATRIX_32_ABGR;
+		break;
 	case DRM_FORMAT_RGB888:
 		priv->viu.osd1_blk0_cfg[0] |= OSD_BLK_MODE_24 |
 					      OSD_COLOR_MATRIX_24_RGB;
@@ -356,7 +370,9 @@ static const struct drm_plane_funcs meson_plane_funcs = {
 
 static const uint32_t supported_drm_formats[] = {
 	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_ABGR8888,
 	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XBGR8888,
 	DRM_FORMAT_RGB888,
 	DRM_FORMAT_RGB565,
 };
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
