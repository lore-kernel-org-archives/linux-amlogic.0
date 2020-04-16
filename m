Return-Path: <SRS0=I4qu=6A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2BF8C352BE
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 15:27:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95189206D6
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 15:27:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AdY21mMH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="khWHx9oT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95189206D6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6hz5DXon2M/NfN6j6s7X8ESDT85rgd2sjsXAQvIVfsY=; b=AdY21mMH4asgNq
	TiuXYLkpERe0MxTFQ7Tbp60Mu33rGi4x25p+WwyzvQ3cjqsBa3d5vngWU+yKA/6XIe2+xfj7C4oeV
	0VX8L6uFpxo+t4DsQ3AQblXKK+ZvrfSlXvgjHpaafB428S2fOniBPCbJj4QkvcAjSE19jNaGnVF65
	KxckbA4RHPqDUumXoTGvoZU2LsfXsu4ahRs6fsC2DhEnzkBX3mdv2ZMbkY1RZDuSJcTSuk9a9/ZoO
	iwv5FYqgzpEBT8yA3lOpp+M/3DluDYfEzjZA34vopEFbhThLCltV7m0IpdhN7UUu+QoJ6toGqNQXJ
	u1cP5vqD3dmT7iki99Zw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP6QW-0000tJ-MD; Thu, 16 Apr 2020 15:27:40 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP6OI-00070f-DU
 for linux-amlogic@lists.infradead.org; Thu, 16 Apr 2020 15:25:25 +0000
Received: by mail-wr1-x444.google.com with SMTP id d17so5272317wrg.11
 for <linux-amlogic@lists.infradead.org>; Thu, 16 Apr 2020 08:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oEh+32nEVm+L3h2nqrkEI2RZhWGyawtUviLim3KeczU=;
 b=khWHx9oTBXuB1jvkx97Q7Ge3/eNg08KayjK9LifGmWHefyOs7Sar790b9XmaDvc0/w
 2/LUWAfRz1Ldbt51o+u5U9gqAT6VWQYogG8wd+u0DfUzRzfWx4l7Sy/eBJ2Qwp7m2hBz
 SY/fHyKGKj/BBPQ7Dpp3bXD9VmvE+hxO6eKTuGr9bt4wmulAK6Hen19GujLVgVOKMEuv
 nzYVdHUTkD2vc6+VGUdlcQGC2sI5IjfZFiMhw2T8kZP4rGB5i9FXFufcXIw9p5Pm0Hd+
 Nx9goUzds5pn7AToyiRxOEyFwPlLVRXSsS2N454QXl/9Kv5XRHGibSR1dXoLe+NcJNc6
 yUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oEh+32nEVm+L3h2nqrkEI2RZhWGyawtUviLim3KeczU=;
 b=WSCPjapFdHJj67KhF8xVIP60EG+5SPEoqxYsEf3BJKxHTNkW6K4Xjl9LXiCAtk2UQs
 1OEOonWGd6C/JV8Ml70gTnyCrJFX59bRydkzzLkt2NoreUuOCHMNd3951rWqdhdPUNHO
 Z6ds6ekiMQA1+CbRT/dnfIgZE8Dy6YhkV1P+X0aIIZoJxyFxGHvQvIozMW/sPuWDeSEZ
 28ZT1XOGht9Sv74WwAXnAhEeMtni0HLjbHF7GJBGx1070QJmmgN693d/c7IOLRsWcsDF
 uekMqPMirPd2T260K3qKNie0yo3RFzbIQ2PgvoBqM9zPTOYbeShWma4y5yPEhsIEh27t
 EFVQ==
X-Gm-Message-State: AGi0PuYGkQVws2rgiwK0jNThK0a0tGROspx0NyCbMDw6W5QI4cZ5dt5I
 EBoLnawviDcxiqPSUThdr7nm/j3phyJSjQ==
X-Google-Smtp-Source: APiQypI7osjvHZzGJMQeIwOy4gibMUTIGvmyObz0ROfmiYS5Bg1uOzdAvHxwUv2g/n16I6yxGVwXHw==
X-Received: by 2002:a5d:5151:: with SMTP id u17mr34134663wrt.240.1587050720509; 
 Thu, 16 Apr 2020 08:25:20 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56])
 by smtp.gmail.com with ESMTPSA id
 i17sm18019489wru.39.2020.04.16.08.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 08:25:19 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 8/8] drm/meson: overlay: setup overlay for Amlogic FBC
 Scatter Memory layout
Date: Thu, 16 Apr 2020 17:25:00 +0200
Message-Id: <20200416152500.29429-9-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200416152500.29429-1-narmstrong@baylibre.com>
References: <20200416152500.29429-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_082522_486208_58C5CC80 
X-CRM114-Status: GOOD (  13.75  )
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
index bbf86e9fc0ca..29b85509dbf8 100644
--- a/drivers/gpu/drm/meson/meson_overlay.c
+++ b/drivers/gpu/drm/meson/meson_overlay.c
@@ -487,6 +487,10 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
 					  AFBC_HOLD_LINE_NUM(8) |
 					  AFBC_BURST_LEN(2);
 
+		if ((fb->modifier & DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_MASK) ==
+				DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_SCATTER)
+			priv->viu.vd1_afbc_mode |= AFBC_SCATTER_MODE;
+
 		if (fb->modifier & DRM_FORMAT_MOD_AMLOGIC_FBC_MEM_SAVING)
 			priv->viu.vd1_afbc_mode |= AFBC_BLK_MEM_MODE;
 
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
 
-		if (layout != DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_BASIC) {
+		if (layout != DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_BASIC &&
+		    layout != DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_SCATTER) {
 			DRM_DEBUG_KMS("%llx invalid layout %x\n",
 				      modifier, layout);
 			return false;
@@ -800,8 +814,11 @@ static const uint32_t supported_drm_formats[] = {
 };
 
 static const uint64_t format_modifiers[] = {
+	DRM_FORMAT_MOD_AMLOGIC_FBC(DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_SCATTER |
+				   DRM_FORMAT_MOD_AMLOGIC_FBC_MEM_SAVING),
 	DRM_FORMAT_MOD_AMLOGIC_FBC(DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_BASIC |
 				   DRM_FORMAT_MOD_AMLOGIC_FBC_MEM_SAVING),
+	DRM_FORMAT_MOD_AMLOGIC_FBC(DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_SCATTER),
 	DRM_FORMAT_MOD_AMLOGIC_FBC(DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_BASIC),
 	DRM_FORMAT_MOD_LINEAR,
 	DRM_FORMAT_MOD_INVALID,
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
