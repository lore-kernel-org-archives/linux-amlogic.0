Return-Path: <SRS0=oWvG=AO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA79EC433E0
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Jul 2020 08:08:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAF32206A1
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Jul 2020 08:08:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZLWvYac6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Laus+5j3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAF32206A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dQA/tjuw23E3IIzQ2/fD0UUM+0mfzkmEeHn2vEb2aDY=; b=ZLWvYac6ksKiWCOQXQZrAfq7A
	JsCEDbeeVvU6wWa6Owv3sC+zxO0K12agI9CRcD0mBYzBaJ0lHIF0roYQ2xLyrA+P4XMvH/Y88TQpe
	fY1s5Awa3aoWbs8XI1ZDkFUs/PO8NX3Sqw4s3YA79IS95b1PjzslYPwgE3UrnynPAVNrTEIbkwC4Z
	ZZY3ZIPuLUjMolZDUYq6WnaPTyny1tzC+C7SXz+DLYpemIygwWgFfjH7fM2CUO2YwZgdib91FVJ9N
	2icMZ5OLTs7pI90pqaepC1LwU4Mg4l/rSXpb/kbMD/8YOcchzMF4bhReZuksM3RWQI9qSYJa0WRVC
	B5L4a+x6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrGjy-0002QE-EY; Fri, 03 Jul 2020 08:08:10 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrGjY-0002Dk-Vg
 for linux-amlogic@lists.infradead.org; Fri, 03 Jul 2020 08:07:47 +0000
Received: by mail-wm1-x341.google.com with SMTP id q15so31130800wmj.2
 for <linux-amlogic@lists.infradead.org>; Fri, 03 Jul 2020 01:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LrAaYs53s/z1iv5bVLRtnzC+1Oun/iXiyK2qaKijDuU=;
 b=Laus+5j3YNevclRYYUCi4YVDK91XWl8BUwxhii80Ed/v0IggUlAan8JZ4E8+3CFXli
 X3Cygr/7qIG41o4kOs9ipx+mQpAjiaxoWIYVeZ0ZNDopMdGXNycAi4MNSdDBi7UybeX2
 JYBvxGgGQXs+jSZYUdf7eYviqIag8z5oU68CnZFA+EOCqnurd+VJK46c6jAAtJz1wtxC
 EwKSuQZl49S+L4VGV8Q9qdtb+7Y+w4BeRCXqvUuiciKd1JXZam39V/Y1W3M0D0UOYsnL
 yw+yGjxKoyJI6iQlxzTVYDBQsBysHuz4Ip5U3FzVra5M8WnW/ITD/PoOKyBcv3hcAcVV
 9rvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LrAaYs53s/z1iv5bVLRtnzC+1Oun/iXiyK2qaKijDuU=;
 b=bdWF2j2RaYfjHkfS+NXAmgiLgfictpds6QAZbacKv2tvilyiGB6YWovgXUkk3F+tdk
 Sp41LC4+mUS3/GJuoq6IjhssiE9vqgnOg437uzjqX01zIPRYy0pniYOVG5DOExHKpxm3
 XGnvC8TgaD47P6NW26busgshsSecarcBqPU3Y6gVE+2KANfeI/Zx5p96taJXAAHbuJ1N
 S/3DBZBJQTKeTeRcLGt20oNz0Y6tsmBBAoCZJya1lHlNQ63QTsDUOF0HcrwOiC1YJqA5
 1Bi15zzUaiU3PLGm8tIeK2MZt69rGGvWo2fg4xtQLlicgT4UDOLoneFy5F7Y1E/zFKNc
 uTDQ==
X-Gm-Message-State: AOAM531Ge9fx+iIXxFG5nCXGXZ06ONjCgmTnFhVW5T8/ew8JPM04p0iL
 eIQWgSxZGSq9UPppgDxQ7fvOTQ==
X-Google-Smtp-Source: ABdhPJzX5k1i5r8s9fDNvSWDNAPPRelDlrCD79abcF4sbtYxOfHwj8r0iEmeXN9k9vmXsKp9KAMilw==
X-Received: by 2002:a1c:2906:: with SMTP id p6mr35885064wmp.68.1593763663665; 
 Fri, 03 Jul 2020 01:07:43 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:6959:e617:6562:cabf])
 by smtp.gmail.com with ESMTPSA id 1sm12682403wmf.0.2020.07.03.01.07.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 01:07:42 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v9 4/6] drm/meson: overlay: setup overlay for Amlogic FBC
 Memory Saving mode
Date: Fri,  3 Jul 2020 10:07:26 +0200
Message-Id: <20200703080728.25207-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200703080728.25207-1-narmstrong@baylibre.com>
References: <20200703080728.25207-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_040745_199198_0EDC1CA5 
X-CRM114-Status: GOOD (  11.81  )
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
a different superblock size for the Memory Saving mode.

Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Kevin Hilman <khilman@baylibre.com>
---
 drivers/gpu/drm/meson/meson_overlay.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/meson/meson_overlay.c
index 293f606ba164..1566a887d482 100644
--- a/drivers/gpu/drm/meson/meson_overlay.c
+++ b/drivers/gpu/drm/meson/meson_overlay.c
@@ -486,6 +486,10 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
 					  AFBC_HOLD_LINE_NUM(8) |
 					  AFBC_BURST_LEN(2);
 
+		if (fb->modifier & DRM_FORMAT_MOD_AMLOGIC_FBC(0,
+						AMLOGIC_FBC_OPTION_MEM_SAVING))
+			priv->viu.vd1_afbc_mode |= AFBC_BLK_MEM_MODE;
+
 		priv->viu.vd1_afbc_en = 0x1600 | AFBC_DEC_ENABLE;
 
 		priv->viu.vd1_afbc_conv_ctrl = AFBC_CONV_LBUF_LEN(256);
@@ -671,12 +675,17 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
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
 
@@ -734,6 +743,9 @@ static bool meson_overlay_format_mod_supported(struct drm_plane *plane,
 		unsigned int layout = modifier &
 			DRM_FORMAT_MOD_AMLOGIC_FBC(
 				__fourcc_mod_amlogic_layout_mask, 0);
+		unsigned int options =
+			(modifier >> __fourcc_mod_amlogic_options_shift) &
+			__fourcc_mod_amlogic_options_mask;
 
 		if (format != DRM_FORMAT_YUV420_8BIT &&
 		    format != DRM_FORMAT_YUV420_10BIT) {
@@ -748,6 +760,13 @@ static bool meson_overlay_format_mod_supported(struct drm_plane *plane,
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
 
@@ -781,6 +800,8 @@ static const uint32_t supported_drm_formats[] = {
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
