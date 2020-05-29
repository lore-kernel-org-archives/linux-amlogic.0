Return-Path: <SRS0=2vyU=7L=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6138DC433E0
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 May 2020 15:22:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B886206A4
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 May 2020 15:22:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lyund0Ya";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="pEqG5L5G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B886206A4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X36snZFg1vHtbqFqKBTS6STk9Pp3Imm08ohUNgVGlJw=; b=Lyund0YauESbYA
	ytcpOkIGkjt/mk4LMIe96Oxa9P9DoN9x5SHRBxDDWq7kqpyg2B0YH15An3vnExnalaxKLYsMr8Huc
	mTdhlD1IORVF4KQQ8Ja/2DKVoqKi6sHCzCs+NXys6wbflnGMc+Snb8ychNPARClmt7hpTr+n0cOB2
	3qLdEZgtLabrp2lQMSS+cTXR0rCGS5UZzUz8XaWzm+oT6kry/J5RgsyiAWmaGXKe7vnX4uGTEYygl
	XNk95fr78bQjHT7REj5sIipVsdtQNvh8DXnWZkobuMBxHlacl6D3AVuaxHEXsNIeYS4O/xFrCxKHR
	LpcFiscpwN67maZyO2Cw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jegpd-0001c0-En; Fri, 29 May 2020 15:22:01 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jegnZ-0005tm-Aq
 for linux-amlogic@lists.infradead.org; Fri, 29 May 2020 15:19:56 +0000
Received: by mail-wm1-x344.google.com with SMTP id l26so3772116wme.3
 for <linux-amlogic@lists.infradead.org>; Fri, 29 May 2020 08:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2W/tk3xtyOOYW8CHtOYgazclqfCaFCGaEqtWfgUm9eE=;
 b=pEqG5L5GWWSwNPpPU9DM02ap3Zr2QmJjPVWHkferukyZLyvxACGqoVFwYOgQwB2G5S
 ttMlimnv6urPWI82mVmCulLFHsRBhZsg+1cF4vwbtoyiphcqTaU5EaG8ah+Bw9xMV8NI
 9i6ak139bVdmpQSFMqQuxKaj5Iy2cB+4dtnZmyFj1nFg9hu7mrt0CcB/6Zg5k20s9UsK
 MxPfJU9zY9BRa5rKuqp/z2qYIoE1AM9qB1aUCsjClipjFEyUZJ0tNgmYToyB+eY+Gfdp
 3FK7ZiLnbVU0g0PyFmT0tcjD97T2GImoPNMe3K2bHU+znEHKBQhc5fTdZCJ6hFhTbMjl
 2v2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2W/tk3xtyOOYW8CHtOYgazclqfCaFCGaEqtWfgUm9eE=;
 b=Zzb4FbBURMnEiZlILQkl5D4plXOxU8z3Fv5en6gsyD9XAsd57Gt31QtwtjafcK75wU
 +bAkI90cA391UspjcfFuWeWhNKf1bzjIBDKiWxIx0XSM2OXZ0YEMzT9CM557QE7F0Cgk
 1GInlnSkEo8VP20d9mLCmAkrpyQu72Dsz6ami55o2l0zDkyFLR4Y6uW7Hg0Fa82j88V1
 1wOO4wpc/czxOH0+Vjl5d5xh/qyueVYGWG03fuejzvcqlCXorhRxIZtxIv9MDyXrrrK8
 UJaSI/uOOVTUOmMBrbQrZonQRWMf1OHrCYSydXELrSbKcgXbG2rEg4jVebfWvz+h7FVv
 GoKA==
X-Gm-Message-State: AOAM533Lxq0Yo6zhWl4BaSewEXpqSud0WhYqkcesb0HMr5SnwOw94/qK
 dJmgu0yRemCrbKwhbxwNtlR1/Q==
X-Google-Smtp-Source: ABdhPJxgdPXo7ecKSgHx2RWpGVgE0uFXTqOD/vOeodmVPVNl9pS6GXox41J79wfvY5tURiBuFX9XUA==
X-Received: by 2002:a1c:1d94:: with SMTP id d142mr9128523wmd.42.1590765590342; 
 Fri, 29 May 2020 08:19:50 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:acf8:18a8:b3a5:a17b])
 by smtp.gmail.com with ESMTPSA id x66sm9220421wmb.40.2020.05.29.08.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 08:19:49 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v7 5/6] drm/meson: overlay: setup overlay for Amlogic FBC
 Scatter Memory layout
Date: Fri, 29 May 2020 17:19:34 +0200
Message-Id: <20200529151935.13418-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200529151935.13418-1-narmstrong@baylibre.com>
References: <20200529151935.13418-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_081953_392299_8E6A0DC8 
X-CRM114-Status: GOOD (  13.72  )
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
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Setup the Amlogic FBC decoder for the VD1 video overlay plane to use
read the FBC header as Scatter Memory layout reference.

Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_overlay.c | 53 ++++++++++++++++++---------
 1 file changed, 35 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/meson/meson_overlay.c
index b5c502876428..6aef28767fc1 100644
--- a/drivers/gpu/drm/meson/meson_overlay.c
+++ b/drivers/gpu/drm/meson/meson_overlay.c
@@ -491,6 +491,10 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
 						AMLOGIC_FBC_OPTION_MEM_SAVING))
 			priv->viu.vd1_afbc_mode |= AFBC_BLK_MEM_MODE;
 
+		if ((fb->modifier & __fourcc_mod_amlogic_layout_mask) ==
+				AMLOGIC_FBC_LAYOUT_SCATTER)
+			priv->viu.vd1_afbc_mode |= AFBC_SCATTER_MODE;
+
 		priv->viu.vd1_afbc_en = 0x1600 | AFBC_DEC_ENABLE;
 
 		priv->viu.vd1_afbc_conv_ctrl = AFBC_CONV_LBUF_LEN(256);
@@ -676,23 +680,32 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
 	}
 
 	if (priv->viu.vd1_afbc) {
-		/* Default mode is 4k per superblock */
-		unsigned long block_size = 4096;
-		unsigned long body_size;
-
-		/* 8bit mem saving mode is 3072bytes per superblock */
-		if (priv->viu.vd1_afbc_mode & AFBC_BLK_MEM_MODE)
-			block_size = 3072;
-
-		body_size = (ALIGN(priv->viu.vd1_stride0, 64) / 64) *
-			    (ALIGN(priv->viu.vd1_height0, 32) / 32) *
-			    block_size;
-
-		priv->viu.vd1_afbc_body_addr = priv->viu.vd1_addr0 >> 4;
-
-		/* Header is after body content */
-		priv->viu.vd1_afbc_head_addr = (priv->viu.vd1_addr0 +
-						body_size) >> 4;
+		if (priv->viu.vd1_afbc_mode & AFBC_SCATTER_MODE) {
+			/*
+			 * In Scatter mode, the header contains the physical
+			 * body content layout, thus the body content
+			 * size isn't needed.
+			 */
+			priv->viu.vd1_afbc_head_addr = priv->viu.vd1_addr0 >> 4;
+			priv->viu.vd1_afbc_body_addr = 0;
+		} else {
+			/* Default mode is 4k per superblock */
+			unsigned long block_size = 4096;
+			unsigned long body_size;
+
+			/* 8bit mem saving mode is 3072bytes per superblock */
+			if (priv->viu.vd1_afbc_mode & AFBC_BLK_MEM_MODE)
+				block_size = 3072;
+
+			body_size = (ALIGN(priv->viu.vd1_stride0, 64) / 64) *
+				    (ALIGN(priv->viu.vd1_height0, 32) / 32) *
+				    block_size;
+
+			priv->viu.vd1_afbc_body_addr = priv->viu.vd1_addr0 >> 4;
+			/* Header is after body content */
+			priv->viu.vd1_afbc_head_addr = (priv->viu.vd1_addr0 +
+							body_size) >> 4;
+		}
 	}
 
 	priv->viu.vd1_enabled = true;
@@ -755,7 +768,8 @@ static bool meson_overlay_format_mod_supported(struct drm_plane *plane,
 			return false;
 		}
 
-		if (layout != AMLOGIC_FBC_LAYOUT_BASIC) {
+		if (layout != AMLOGIC_FBC_LAYOUT_BASIC &&
+		    layout != AMLOGIC_FBC_LAYOUT_SCATTER) {
 			DRM_DEBUG_KMS("%llx invalid layout %x\n",
 				      modifier, layout);
 			return false;
@@ -801,8 +815,11 @@ static const uint32_t supported_drm_formats[] = {
 };
 
 static const uint64_t format_modifiers[] = {
+	DRM_FORMAT_MOD_AMLOGIC_FBC(AMLOGIC_FBC_LAYOUT_SCATTER,
+				   AMLOGIC_FBC_OPTION_MEM_SAVING),
 	DRM_FORMAT_MOD_AMLOGIC_FBC(AMLOGIC_FBC_LAYOUT_BASIC,
 				   AMLOGIC_FBC_OPTION_MEM_SAVING),
+	DRM_FORMAT_MOD_AMLOGIC_FBC(AMLOGIC_FBC_LAYOUT_SCATTER, 0),
 	DRM_FORMAT_MOD_AMLOGIC_FBC(AMLOGIC_FBC_LAYOUT_BASIC, 0),
 	DRM_FORMAT_MOD_LINEAR,
 	DRM_FORMAT_MOD_INVALID,
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
