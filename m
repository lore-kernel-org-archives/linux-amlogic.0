Return-Path: <SRS0=oWvG=AO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 470B0C433DF
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Jul 2020 08:08:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15C0C206A1
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Jul 2020 08:08:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BiJq8nPL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="PyLrch+f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15C0C206A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KHVJgrnbBsynPFDiu+EVi/BluxmdpvmxUVNqI0WrVqY=; b=BiJq8nPLwtU8fnme8rzFuizTs
	tJRMITfBJcCZb5wEXobVbPvLDLG3X0WslxcfZ9ig2EDLwOZs9Z+SbssDKGGgPTS2UEsxiVCTHRfvX
	I267r85iGPFoBKlH/K/iB4c7evu2Sv2HghTwbYMDne1J5Vch0iqMcMBt7tJG/6jFFWaG24w/EQsZA
	fOnrSMyTeUVN4rypKcJZ7Nd0NUN09x9/zOOR1ujZ2q+1eai7ZhHKA8Y+M5ZOH5/RxR8ATQkdFAHis
	yXldsLywIDo9rRoB7jkGuqLeVtwB31S7DavOyVVUb0JCSsZImho8KZta/GWHd3svLRORiASVOYZLB
	5Uxu2k9sQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrGkC-0002X3-Dz; Fri, 03 Jul 2020 08:08:24 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrGja-0002F2-6L
 for linux-amlogic@lists.infradead.org; Fri, 03 Jul 2020 08:07:51 +0000
Received: by mail-wr1-x442.google.com with SMTP id j4so29245300wrp.10
 for <linux-amlogic@lists.infradead.org>; Fri, 03 Jul 2020 01:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/ng/jUwloNmcdfo+1PiIEF30ni1dXh2rT+0xtNGPS4s=;
 b=PyLrch+fX/y3on1e2GaZG7BbOXo3AxtFqG3wdXsEOSq2iC38M5weP7wSyKmLRJWcCc
 F3ovW8aquYh2TDG8N7rWl5GEK5lpKOs1QgLKxfFg715G8DcIcV3uYSOqKDkz0kaPNJFP
 a867mkMngjEdS9w4S/KEOUG9T3gXA62ZonFMi2soZEyW6CLDDXiuKeHUDRS48dvcQTeH
 EaT71E5n+v6C5r3yMt4S+9gkoISwt0XraBFa2+3885t7ljkzyRWC8w4kTl8H14Z1W6oL
 xHQVTvHtX4ooAqOUt+3CRepyul/8hK/WDp3a710K7pwq5UcOXGvLZ4rAz2zOjjFsb70j
 FlVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/ng/jUwloNmcdfo+1PiIEF30ni1dXh2rT+0xtNGPS4s=;
 b=lLu+CMbsqRbcMaglNs8DqMaVKCpZYNeYKZI5CMLSOJHS4yJbr5GdkcNGpOVoDZrq2M
 1G20JBKJPPlctByxF3mZ0Mu1J9fHlKGvCT178xgEsdx/CbFQnpsA7XWjI6v/ddVzbyzX
 b4vn/mEyJzT1x/L52vdZHj80HZ0WH3dR0Xm6/LYi7uqBkmgRqBe661nsRKDUVBC4MY9R
 YwfVElBPe0qvxXBS3S+rAj/n8iEhLXIT8vqHSAjb+nK5M+leqErgQWK/+ucEYcP/HUjU
 EEqZpWvoAXKh+Unqr0aDh4KmoncOoPWKuNF2WuUGiDFnWOxmFwE6C7NlXUGOBCLZPXh8
 7r8w==
X-Gm-Message-State: AOAM530vQKJVnSZvl9xk9oWagBVIBSgtKcBz97MpAGI5/bnzQswT8rhh
 hRArkOWC6jkMJYU5AloF1QUhkg==
X-Google-Smtp-Source: ABdhPJwUXFlxviRDdo8T8RyU2xfFfWIniJJPgGGQKHZ5n/u/fWnGMblZd1yorghXWb7RlCzqeH+T9Q==
X-Received: by 2002:a5d:6ac7:: with SMTP id u7mr7285462wrw.25.1593763665073;
 Fri, 03 Jul 2020 01:07:45 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:6959:e617:6562:cabf])
 by smtp.gmail.com with ESMTPSA id 1sm12682403wmf.0.2020.07.03.01.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 01:07:44 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v9 5/6] drm/meson: overlay: setup overlay for Amlogic FBC
 Scatter Memory layout
Date: Fri,  3 Jul 2020 10:07:27 +0200
Message-Id: <20200703080728.25207-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200703080728.25207-1-narmstrong@baylibre.com>
References: <20200703080728.25207-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_040746_351936_C372E0F8 
X-CRM114-Status: GOOD (  12.82  )
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
Cc: jianxin.pan@amlogic.com, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Setup the Amlogic FBC decoder for the VD1 video overlay plane to use
read the FBC header as Scatter Memory layout reference.

Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Kevin Hilman <khilman@baylibre.com>
---
 drivers/gpu/drm/meson/meson_overlay.c | 53 ++++++++++++++++++---------
 1 file changed, 35 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/meson/meson_overlay.c
index 1566a887d482..1f7b2055e012 100644
--- a/drivers/gpu/drm/meson/meson_overlay.c
+++ b/drivers/gpu/drm/meson/meson_overlay.c
@@ -490,6 +490,10 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
 						AMLOGIC_FBC_OPTION_MEM_SAVING))
 			priv->viu.vd1_afbc_mode |= AFBC_BLK_MEM_MODE;
 
+		if ((fb->modifier & __fourcc_mod_amlogic_layout_mask) ==
+				AMLOGIC_FBC_LAYOUT_SCATTER)
+			priv->viu.vd1_afbc_mode |= AFBC_SCATTER_MODE;
+
 		priv->viu.vd1_afbc_en = 0x1600 | AFBC_DEC_ENABLE;
 
 		priv->viu.vd1_afbc_conv_ctrl = AFBC_CONV_LBUF_LEN(256);
@@ -675,23 +679,32 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
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
@@ -754,7 +767,8 @@ static bool meson_overlay_format_mod_supported(struct drm_plane *plane,
 			return false;
 		}
 
-		if (layout != AMLOGIC_FBC_LAYOUT_BASIC) {
+		if (layout != AMLOGIC_FBC_LAYOUT_BASIC &&
+		    layout != AMLOGIC_FBC_LAYOUT_SCATTER) {
 			DRM_DEBUG_KMS("%llx invalid layout %x\n",
 				      modifier, layout);
 			return false;
@@ -800,8 +814,11 @@ static const uint32_t supported_drm_formats[] = {
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
