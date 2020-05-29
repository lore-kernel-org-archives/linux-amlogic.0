Return-Path: <SRS0=2vyU=7L=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C386FC433DF
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 May 2020 15:21:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9548E206A4
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 May 2020 15:21:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r0j1F8tL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="CdyvHuXN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9548E206A4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hqvVHwHPr7OVx9J6YARg4tU2jnqdj+duio+Tt8OjKG8=; b=r0j1F8tLgaUPMV
	o5KIhDIArOx27nDa42LUIL4lmu0b9Bjt9sokD+NQyCOYQY/RIAPp2PQy8kS0NuswHgrka01aKOT8o
	iKAS33fv7B2+UFwXrn0+KFwFn0O4Rgvlno0V5YbD0IpIcjhmWiW/fFfjH8K16l8F7xxb0FmtHAFlr
	+Aq0opm8vtc/eYVAHXBxv0qMqE+0S3BWqJMtrlP0Ky5Fu8UYZs+CV0Ts7aAp7v1FJafv2kPH7ulnD
	0D+viacc/6Napb77OQ00UYsQm7zlgbm6mXQpIybSZeZHEP4vc6h4u7knKVdKCzb8cd64mhQqa9Y9h
	XNn2dwMsHlEB+eHacVLw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jegou-000101-3H; Fri, 29 May 2020 15:21:16 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jegnX-0005qL-FM
 for linux-amlogic@lists.infradead.org; Fri, 29 May 2020 15:19:53 +0000
Received: by mail-wm1-x343.google.com with SMTP id h4so3762557wmb.4
 for <linux-amlogic@lists.infradead.org>; Fri, 29 May 2020 08:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bxjlfwjwrOxt5UTQatxMHEDDG1cEpZr3A7ziLWB5/Ps=;
 b=CdyvHuXNeinarWetQUHY23NlfBktrI7NsPvPK4QlHcreNJ7+g9PbgZNBsYMwf6ax1F
 RNCIJSRRvKuHs2LPiVSO7cQ2FC1FLwlDYFieXVxz029U7D9UY6XnCP6xhTOW32ww8PbI
 9SVmJQIUTw6tsV37Ot+vVFVc9FC3FhMpAhtiqeJ6zYodDKT9gTDNFqSLZO6n5hp90b1s
 IttYpeJ2CZlHqOfXsmc9m7dlSnR+I2D+ShB1y8QMmgOGioE0Gg07UpAg8BQN3tfpYgBr
 PJtFYp8P8I/wA0SUC+lCCNFKZKCWuWIGe15F6Wdopx11rqkVe+TBk2NBHTzpI0EMniTH
 appQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bxjlfwjwrOxt5UTQatxMHEDDG1cEpZr3A7ziLWB5/Ps=;
 b=UDpT5TR+No4foTEtGt0HY9Li5CnjBiGkOm54n4D0XPPfq/ZqmUsTpYy1soH6WhcYbV
 00pwqYDgQgBpGhwZAbUHK1CSvwrFTZ1fvnZV2xB3pEFGwNPAomNxUmLNoSmGnDxP9suV
 UxkUGbL8ojn+SssqgFtCO8J3bCyCCWlXTLrqP25QR4QBCCZ7ac+SyqXVjYcF+/fiYzt/
 SHY9MQfSgz3QETaA0lE3rH7Y99qmWT+DvnAR6EJCOwPF8UFkM5i8HmAE2pCq5sdt8ZXR
 4oRAnoEbl0W1840wmX306Je6qh28TAuaf3hBD4JyTG2o8xD8jko4FT+lH07f8N/WujcG
 BUUQ==
X-Gm-Message-State: AOAM53252XrEAz5VlrSEhPcJZgKlMlmuwI2fck0Ta5fDXADpLMR4OxbM
 WK6Qw3Tks766TQmlAZlUmslh4g==
X-Google-Smtp-Source: ABdhPJxh/bVaeh2MVgKx4F3/KaCcTUoYmLlR6YS3YGbWKR0BbqEsj+GvB2QgVpXtXKQc6FhL6LDVEg==
X-Received: by 2002:a05:600c:2259:: with SMTP id
 a25mr3528245wmm.32.1590765587441; 
 Fri, 29 May 2020 08:19:47 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:acf8:18a8:b3a5:a17b])
 by smtp.gmail.com with ESMTPSA id x66sm9220421wmb.40.2020.05.29.08.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 08:19:46 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v7 4/6] drm/meson: overlay: setup overlay for Amlogic FBC
 Memory Saving mode
Date: Fri, 29 May 2020 17:19:33 +0200
Message-Id: <20200529151935.13418-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200529151935.13418-1-narmstrong@baylibre.com>
References: <20200529151935.13418-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_081951_520663_A8682AF7 
X-CRM114-Status: GOOD (  12.55  )
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
a different superblock size for the Memory Saving mode.

Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_overlay.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/meson/meson_overlay.c
index 2713d008cee8..b5c502876428 100644
--- a/drivers/gpu/drm/meson/meson_overlay.c
+++ b/drivers/gpu/drm/meson/meson_overlay.c
@@ -487,6 +487,10 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
 					  AFBC_HOLD_LINE_NUM(8) |
 					  AFBC_BURST_LEN(2);
 
+		if (fb->modifier & DRM_FORMAT_MOD_AMLOGIC_FBC(0,
+						AMLOGIC_FBC_OPTION_MEM_SAVING))
+			priv->viu.vd1_afbc_mode |= AFBC_BLK_MEM_MODE;
+
 		priv->viu.vd1_afbc_en = 0x1600 | AFBC_DEC_ENABLE;
 
 		priv->viu.vd1_afbc_conv_ctrl = AFBC_CONV_LBUF_LEN(256);
@@ -672,12 +676,17 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
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
 
@@ -735,6 +744,9 @@ static bool meson_overlay_format_mod_supported(struct drm_plane *plane,
 		unsigned int layout = modifier &
 			DRM_FORMAT_MOD_AMLOGIC_FBC(
 				__fourcc_mod_amlogic_layout_mask, 0);
+		unsigned int options =
+			(modifier >> __fourcc_mod_amlogic_options_shift) &
+			__fourcc_mod_amlogic_options_mask;
 
 		if (format != DRM_FORMAT_YUV420_8BIT &&
 		    format != DRM_FORMAT_YUV420_10BIT) {
@@ -749,6 +761,13 @@ static bool meson_overlay_format_mod_supported(struct drm_plane *plane,
 			return false;
 		}
 
+		if (options &&
+		    options != AMLOGIC_FBC_OPTION_MEM_SAVING) {
+			DRM_DEBUG_KMS("%llx invalid layout %x\n",
+				      modifier, layout);
+			return false;
+		}
+
 		return true;
 	}
 
@@ -782,6 +801,8 @@ static const uint32_t supported_drm_formats[] = {
 };
 
 static const uint64_t format_modifiers[] = {
+	DRM_FORMAT_MOD_AMLOGIC_FBC(AMLOGIC_FBC_LAYOUT_BASIC,
+				   AMLOGIC_FBC_OPTION_MEM_SAVING),
 	DRM_FORMAT_MOD_AMLOGIC_FBC(AMLOGIC_FBC_LAYOUT_BASIC, 0),
 	DRM_FORMAT_MOD_LINEAR,
 	DRM_FORMAT_MOD_INVALID,
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
