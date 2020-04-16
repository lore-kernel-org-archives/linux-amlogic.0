Return-Path: <SRS0=I4qu=6A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD63C38A2B
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 15:27:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC3D2206D6
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 15:27:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JBRPmr6X";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="gb9mZRBk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC3D2206D6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CGCzV4KWYcEtpcG9ba3mOu2dboojSyeKhNB7gxWhkfc=; b=JBRPmr6XBUxKhp
	iuaBDUD7yUy+Kf0ErAdeZ5vJ3CkMR1+j/lvTTAPRAUSCZukQvcuSDRNAB008rQmNy8wfVbp//2LfN
	RDVIYRygre3Kf/ROrHFVWCJ/qLjMxekdYEiVN1JEMQZv4z1TF2gsupQI2kGN9P39519yy4aNamPab
	BcQBqg9lBSrDvXYmc5V5/hn/H9bh+xj9u5dKNXYCLfoqFl6q03YbbkhECm/+VgZARXp6jHWHktme0
	yaztJSD6JXUSaXiM02cfrSOkttow6skPWnqMMCc/Kfa+pBYPIDGqKGVMgiSprFLrpzB3LODLZZ1+Y
	dd4e09ztxgtL61uEbh0A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP6Pt-0000Dd-HJ; Thu, 16 Apr 2020 15:27:01 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP6OE-0006x5-2t
 for linux-amlogic@lists.infradead.org; Thu, 16 Apr 2020 15:25:23 +0000
Received: by mail-wr1-x443.google.com with SMTP id k1so5342391wrx.4
 for <linux-amlogic@lists.infradead.org>; Thu, 16 Apr 2020 08:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pAAPmG/Jb3adRgVZcI3+WEZjd0CmBHlfGNHq+xKmSJk=;
 b=gb9mZRBkNIdN2fCnMt+El5mgw2WvvGR6aS/C/2wNRDwfSozMtKfOA60GbKoEAcQKqh
 UFBrc3r4cbHmlEcOVWXrrYXuHdY0f1fx0OouQPqCX7h1efZVVSZTEuP+hUsuKSdDZJ53
 C3Qr94o4eDf55MkwbkY1s7dimuMAbqWaORbJU7dtwPzVEaPPMB4RSlWTIp6Fy7gKcdbW
 9j26s6VN79Do1I2hDyLrmomQw4UevEVOHs/cvpMJTx106IwRMAZZkFzmvIv7Oz++m1IQ
 qBdvcByMosAJKufkkMKkWn5QQdEmnzKEEQGR6aEPP5O1q+uHNwKg6Pu/h2Wd/piNNkQP
 EBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pAAPmG/Jb3adRgVZcI3+WEZjd0CmBHlfGNHq+xKmSJk=;
 b=bfmLXr/GPINx/dYK5xy7fQetvaHnxod1umIKl9xdu5jUdDHLTRPcnN3GbVeMj0sLFE
 3EM0InpS8g+4zzy3qnA/CwA5lfTgpys/hygQviiUY0Ve1eNqPL5LWNhXMYPrkLG8Jdbe
 JKOBwT1SC02fqz18yt2OZY36us978nS160c56NrAAQ1dxHFk6oy+H6itSq5AsP7I04PW
 wuZpaoSvUkk86elWDhIGAk99ymnfpY/JmT1+9FeGh6oLx+5pcY4PaAi5I5rsaRmw0g9O
 HiMK8i8wknzUaShD9OkAccVeBX7kfx/bGZTh3xyV4upQAVzay7oWRKlHVMYU9xPsC3mE
 ThFw==
X-Gm-Message-State: AGi0PuYAGclAYqtpsh1wKsGbddGjUr76vYn0oqOTEqgELfOPZ+s5t2fH
 LLSb1EwSXo4hAoj/5B5X/33wlk3fHXDnBQ==
X-Google-Smtp-Source: APiQypIYCGk/APKOgaU92vz2hRnB71h6Oa4IfHbO/xSY2Vhgx/msOHurLSBkaZDwyaPEWqpzBH8x2Q==
X-Received: by 2002:adf:c442:: with SMTP id a2mr33790736wrg.110.1587050716672; 
 Thu, 16 Apr 2020 08:25:16 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56])
 by smtp.gmail.com with ESMTPSA id
 i17sm18019489wru.39.2020.04.16.08.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 08:25:15 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 6/8] drm/meson: overlay: setup overlay for Amlogic FBC
 Memory Saving mode
Date: Thu, 16 Apr 2020 17:24:58 +0200
Message-Id: <20200416152500.29429-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200416152500.29429-1-narmstrong@baylibre.com>
References: <20200416152500.29429-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_082518_268634_AF9C0C14 
X-CRM114-Status: GOOD (  12.35  )
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
 drivers/gpu/drm/meson/meson_overlay.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/meson/meson_overlay.c
index 3127bd1a5d70..bbf86e9fc0ca 100644
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
 
@@ -735,6 +743,9 @@ static bool meson_overlay_format_mod_supported(struct drm_plane *plane,
 		unsigned int layout = modifier &
 			DRM_FORMAT_MOD_AMLOGIC_FBC(
 				DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_MASK);
+		unsigned int options = modifier &
+			DRM_FORMAT_MOD_AMLOGIC_FBC(
+				DRM_FORMAT_MOD_AMLOGIC_FBC_OPTIONS_MASK);
 
 		if (format != DRM_FORMAT_YUV420_8BIT &&
 		    format != DRM_FORMAT_YUV420_10BIT) {
@@ -749,6 +760,13 @@ static bool meson_overlay_format_mod_supported(struct drm_plane *plane,
 			return false;
 		}
 
+		if (options &&
+		    options != DRM_FORMAT_MOD_AMLOGIC_FBC_MEM_SAVING) {
+			DRM_DEBUG_KMS("%llx invalid layout %x\n",
+				      modifier, layout);
+			return false;
+		}
+
 		return true;
 	}
 
@@ -782,6 +800,8 @@ static const uint32_t supported_drm_formats[] = {
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
