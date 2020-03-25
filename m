Return-Path: <SRS0=FVXd=5K=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF4F3C18E5B
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Mar 2020 08:53:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9062A20714
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Mar 2020 08:53:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Sg5CYF8B";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="aYBMrSDL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9062A20714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UoH5nrpQq8n3fPtf/4SzRN+BoboeYWWqyi8C9x+M1og=; b=Sg5CYF8BJ3T1Ij
	iyqm2P3vN/MCmcrCiIjgWZqvq0iEzm3pRE++lUzmfG8Kfw8m4SjvWawK2AmMj/8QLeFzAo7VD1Lel
	vXOmwQ7WCxf2wx42/4HpZyvqr0wbmiM45qWj22gHp74qZdN0l11g/QULm07JUbS4K71R0kHh179go
	3eAHOZBQg5jpjPMypAT7aM92NDBqlU6x+WNCIXAboM0MuQjEbQYkhtp+3xvG0Avk6JJidhdmfB/ik
	JYiS7OfvmZQSSqUEuNeeRUNmio1oHquf0JieVYrvTjTs1QB8HRfmWzNJvk1yQp0t8AWqFe/hAZRUH
	xDEao053YbTmZPSQX89w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jH1mW-0005Vk-1P; Wed, 25 Mar 2020 08:53:00 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jH1kE-0002o7-T7
 for linux-amlogic@lists.infradead.org; Wed, 25 Mar 2020 08:50:48 +0000
Received: by mail-wm1-x343.google.com with SMTP id z5so1371459wml.5
 for <linux-amlogic@lists.infradead.org>; Wed, 25 Mar 2020 01:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fPJX5pxHatWlhsndvDxqYNXpPbJWSaIQ/yvG8JwAaPQ=;
 b=aYBMrSDLGFsR9VGiA3afn25swSvBzlrBXb5UxObkLtHAfr5/+WOEvT0kDWgdi4FwZQ
 zjXQdJNgPta9PL4WL8iKpMmwrCQUjzd7L5DroRcX2ImHVgy2LegXPtXrazdftqoeVc1x
 2JDqjdl6bhSvwuIox3qPuKmXyKjgduvx0k6LVHhGYu7wNyvXwXb8oxn2Wxep8JR3Hxmh
 RNa4Dxv30pWkhHsYO3464gILGOeas27+J+86DpavRaAJ7e6k8QqAH9FkhtwLZQSBiRJ1
 bFMxqGTXHot17KqkZH0jUGmqpKnDXFuM9gVBRsTp5fT56nLY0EtNYwRzcv0if1ux9Ukw
 OuOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fPJX5pxHatWlhsndvDxqYNXpPbJWSaIQ/yvG8JwAaPQ=;
 b=pPBllHXfrzAdy3WdMsKhM+r4NeJWyIPevoHpn++EBEsXTqPoqhPwtOe8eMPortZZgr
 KLKvOEk/L84lVvg13YCcJWbmJyz1lWpBHwppquLk0XIqOX5j5Y2QsvTmiSMiWftGPgCK
 iZYplZ51lLWZmwK6QpmfSYOR+DaVsOiWX7QTbT8FQE6KIX3/nzMjnYRCR6DqUnh8Y3z+
 uHQJpAconDf+JL+8s6FsGG50ORKc4FYt1muQ8RICymnS0hrSKYE4jlQAnl9uQiwkKyoc
 hjOd3xTcdabaYQ7gTKWmB6VAZnAd3PxW6NQ7Bl4L0zkfYFB0iR9v0jEyX7ZY/pWzqqIb
 /RIg==
X-Gm-Message-State: ANhLgQ3BY0OA8xIkb2vLKN0Dv8B0QnssG+RVxV/JTn2PPNKCfjY0fmth
 BS/rMkgm62Hy5Y1XpstPyQ4F3w==
X-Google-Smtp-Source: ADFU+vuYjdCM+0T2o7saCgezXhu9RnRogVZPN6H0/ZPkKnWZxBuY5GQnR1RGVO/FZ47BMHplkvQV5g==
X-Received: by 2002:a1c:9a43:: with SMTP id c64mr2217618wme.173.1585126237494; 
 Wed, 25 Mar 2020 01:50:37 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
 by smtp.gmail.com with ESMTPSA id o16sm33892229wrs.44.2020.03.25.01.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 01:50:37 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 6/8] drm/meson: overlay: setup overlay for Amlogic FBC
 Memory Saving mode
Date: Wed, 25 Mar 2020 09:50:23 +0100
Message-Id: <20200325085025.30631-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200325085025.30631-1-narmstrong@baylibre.com>
References: <20200325085025.30631-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200325_015038_992265_6FED6379 
X-CRM114-Status: GOOD (  10.76  )
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
Cc: mjourdan@baylibre.com, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 ppaalanen@gmail.com, linux-amlogic@lists.infradead.org, brian.starkey@arm.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Setup the Amlogic FBC decoder for the VD1 video overlay plane to use
a different superblock size for the Memory Saving mode.

Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_overlay.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/meson/meson_overlay.c
index 51fa038ad5d7..8b9d4984b2a7 100644
--- a/drivers/gpu/drm/meson/meson_overlay.c
+++ b/drivers/gpu/drm/meson/meson_overlay.c
@@ -487,6 +487,9 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
 					  AFBC_HOLD_LINE_NUM(8) |
 					  AFBC_BURST_LEN(2);
 
+		if (fb->modifier & DRM_FORMAT_MOD_AMLOGIC_FBC_MEM_SAVING)
+			priv->viu.vd1_afbc_mode |= AFBC_BLK_MEM_MODE;
+
 		priv->viu.vd1_afbc_en = 0x1600 | AFBC_DEC_ENABLE;
 
 		priv->viu.vd1_afbc_conv_ctrl = AFBC_CONV_LBUF_LEN(256);
@@ -672,12 +675,17 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
 	}
 
 	if (priv->viu.vd1_afbc) {
+		/* Default mode is 4k per superblock */
+		unsigned long block_size = 4096;
 		unsigned long body_size;
 
-		/* Default mode is 4k per superblock */
+		/* 8bit mem saving mode is 3072bytes per superblock */
+		if (priv->viu.vd1_afbc_mode & AFBC_BLK_MEM_MODE)
+			block_size = 3072;
+
 		body_size = (ALIGN(priv->viu.vd1_stride0, 64) / 64) *
 			    (ALIGN(priv->viu.vd1_height0, 32) / 32) *
-			    4096;
+			    block_size;
 
 		priv->viu.vd1_afbc_body_addr = priv->viu.vd1_addr0 >> 4;
 
@@ -763,6 +771,8 @@ static const uint32_t supported_drm_formats[] = {
 };
 
 static const uint64_t format_modifiers[] = {
+	DRM_FORMAT_MOD_AMLOGIC_FBC(DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_BASIC |
+				   DRM_FORMAT_MOD_AMLOGIC_FBC_MEM_SAVING),
 	DRM_FORMAT_MOD_AMLOGIC_FBC(DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_BASIC),
 	DRM_FORMAT_MOD_LINEAR,
 	DRM_FORMAT_MOD_INVALID,
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
