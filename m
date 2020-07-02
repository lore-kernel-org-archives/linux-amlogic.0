Return-Path: <SRS0=naQK=AN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68B9DC433E0
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jul 2020 07:48:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39E9220936
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jul 2020 07:48:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YVwMC/Li";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="oOEjfQkc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39E9220936
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mq32Be7F+F3h7GbcQT4aoI+aoPihy1WhOR5iwv51jmA=; b=YVwMC/LiBCkMmeEh+aL2Dqxfw
	pVPkbcWsT+lTc+23kNftkYV9cA6PjPXKQ4ELaTIs6D+uqzYncHXsy2XD9j5cX2SIn3PfRQeYryafG
	UDUEvt/vG/i++jRhIhL9HdOC4sfPXPmoVvK8Q89+y4ReE8w9a7onK2rRE2UqPpD3A9dvezqNIvWab
	ExfE9N2++bhBEjUFYVkLP80TivhsvMi7jISJEplIlmFGdU+mm+VfqjhUs/Ogfv44FgQQOvzFGuEKg
	hZXuBRc3gMBXhsXU50d8OZpty3W5x9ev3F0yVSptXVbBBcJbfUQfLAbButZHCg/V8d3Wqvf8MxLkY
	XRw4pQnWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqtxM-0000n8-VR; Thu, 02 Jul 2020 07:48:29 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqtx4-0000dP-Bl
 for linux-amlogic@lists.infradead.org; Thu, 02 Jul 2020 07:48:14 +0000
Received: by mail-wm1-x344.google.com with SMTP id f18so26759197wml.3
 for <linux-amlogic@lists.infradead.org>; Thu, 02 Jul 2020 00:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gH8Vn1HTtpNj65SmBS3hC6q15Gun4PcDgr8IzPQIXVQ=;
 b=oOEjfQkc/23VPtuyqR4DMbz/ZhfMBtlxzlMpUT9kFVlTae21pzoLeHJg0p9SEi9Btb
 YKHe7N6/qZe5TsnmTMnpmjth33AmeSOGd0myu0lXCPafmkMfgLg1hmyXBqTj/Gxad7Fy
 EGhQRbT1B2ZJBe77hKciHMpDIKkp28W1VajzD53sGgUbyp8s6gq3lshATxAkki/UlxBf
 RNlcWvgUXnv7HvVo6Dwn0RB76bYHPl2Gwz/lz1TYp4cfI6jD1hCd/LTH4IXTHwIp2u6t
 TzJIWiv4k87qIE78njht9Xj98RDkbpR8e4KwCw2P4OuHNwipMNDkLmu8WMYbyuwATr2t
 DxqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gH8Vn1HTtpNj65SmBS3hC6q15Gun4PcDgr8IzPQIXVQ=;
 b=GQ/PtGqjYgZWCJIYrSxF5r5XRaEwi7u24klSKMQuqgAewJtWW9Ggn/ALZKu86TzXgQ
 4iLuywHn7I/e54bvbicE+3lNAZ6NXzQ1r+VsR+fFJkSExsdGkISUGfmLvybRTadfzAhY
 c79vX3ar3P789AIFimMdhzia5J4iy7b4pHEvQL+rwS8RzIGum3B/P6gGvA0OxXuyg2MU
 V63wl8kmCI+4inkzSTFQKzVUdfq4IQS61MpLs3DIk7WHB3O3m9MrRfS12CAEmIA9yujY
 WiumIbJOSjebT9+GH9DqIKVeMz6LRvaGzGVuzVN23MXcIgtXbYBlFRL/T9B9Rn52JYb2
 Pc3w==
X-Gm-Message-State: AOAM532V52KAfVEossg0cdwPy78lPdFPyceAPhKaRzZmuKlY4pD27fck
 vWmec1KdJ934FIy2vYadHlmP0pGosnIQ0w==
X-Google-Smtp-Source: ABdhPJyIBtqhzOw83s4MX/++PQkYOiWfUrCWuGZhv4s9I1CJJGuhyB0fRbsmeoUaZ4BiTuS/Ddhfmg==
X-Received: by 2002:a1c:f314:: with SMTP id q20mr30392840wmq.18.1593676089110; 
 Thu, 02 Jul 2020 00:48:09 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:7023:727a:c688:cf9b])
 by smtp.gmail.com with ESMTPSA id z1sm10001882wru.30.2020.07.02.00.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 00:48:08 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v8 4/6] drm/meson: overlay: setup overlay for Amlogic FBC
 Memory Saving mode
Date: Thu,  2 Jul 2020 09:47:57 +0200
Message-Id: <20200702074759.32356-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200702074759.32356-1-narmstrong@baylibre.com>
References: <20200702074759.32356-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_034810_457767_FBF829F1 
X-CRM114-Status: GOOD (  11.85  )
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
