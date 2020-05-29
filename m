Return-Path: <SRS0=2vyU=7L=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CF31C433E1
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 May 2020 15:22:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D2B720776
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 May 2020 15:22:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eNLYGa/U";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ebeiHui+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D2B720776
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v7x58jvDQphLDX7/pjCjPImfC1BRfe9oI9UXAnn7fH8=; b=eNLYGa/UJQBk/D
	bh1WxRl6UKwiGmMClnw9rshVi6uJBgm4YP4RIhvWgEiv+1/ZXb+ZkVSbXw+9jdDVKFxwep6PtGFZE
	cpQmD6J7YhRq/pOWBydG3qJQ2PV3yzB8Cbx+YuSAjWQIhhWNst7BMGgQBCRGfRJR0hYjoI849LmxM
	W/y76faO9NB8R9YushH26gyJL27rfKoGV6ZKiI/0Hrm2vYCVoynwkaJRi0Ok9OaaWuQQp1xIIfigs
	qvRZ6Cwxz0GXjGEwZEVxsZb2ZMSDqOMg4166yv4Roqj4Ta1IZ7wpvSXYKjiOGuDkoK3SngpVS79Ai
	6sCGcJujR5ffkCZxXZgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jegph-0001fT-RI; Fri, 29 May 2020 15:22:05 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jegnZ-0005wI-UV
 for linux-amlogic@lists.infradead.org; Fri, 29 May 2020 15:19:56 +0000
Received: by mail-wr1-x442.google.com with SMTP id r7so4139920wro.1
 for <linux-amlogic@lists.infradead.org>; Fri, 29 May 2020 08:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ci6ooCorfZ5Pyg0EKRJeiIb8tL4fvaY6SA1psV8+SCw=;
 b=ebeiHui+gb0SaexTEeiiNYaNrYp9uJKBSGyCsZsbv7S2yZ1npfUepK5stN7XcIBsjx
 0C0wFuLZ7C1cP9JnwZ2/cn2wI82XWJrTGuSOOEiwE4febxj1zy/p1G5Jo9uVwXvnEB1Q
 OX0n8l4Tcah7xmI1iequpYrLaDOeyOFcRJPTvH1jvvkLJkh5ZB0UZAwWLJqcYPSDT8A/
 IB6/FwDkhx7P+ve1uDPTuIiup8N/fC9fMlm5TZjgHtiPOygOSX5kdMRuT7REcchDaG/u
 B4hWhi9HK/XGK83oa5Qp4wYJONN+at5RwkS090LpCYoQyt2ywwCdGJHT7DPXbQI1EHT5
 uXcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ci6ooCorfZ5Pyg0EKRJeiIb8tL4fvaY6SA1psV8+SCw=;
 b=f+tdf45yVfBLliRYvCXrsmQqnUocOzGtJH5RC91555AonhsthGgtgwrepvAQDzCZv/
 BxD8z8/KCps4HkjfBkPpkjGYOrVXSk7m4KyBnUxhr62sqdkpWAls1jUQRf19qEXkV8qe
 ypoe1sULjpH3mo4aFOOSLRvBRdVKWXMUqvy//zCgE8T9Mn/U2CERR3AzeO5FQii4mBs7
 3iXZz8a1OZHHDfYWSWvJt4zX0a2cBnNCQnXRJ1gyBx4Bko38cdUUTGYLLBDi2KSv2+nS
 oUrq+8+Dorff4SaapGUdTKWEGygc/C2INRurIZnBrLMJ3iRjBbKRmbDaGpHYMP0ouINA
 By7w==
X-Gm-Message-State: AOAM531FNquTTNw8BxmpilIzt+h7zpY5Vwk7KAAa6og/wqgJdEgbUMWU
 JtzqkFBHtQKnz2wDiF+om8kSzDW+wmGhPw==
X-Google-Smtp-Source: ABdhPJxlmEawJReBNJCAkcPlO2zWAadd4qjgDEw3TpFI6PsFWA4NuoVaNPZXnjjj3Pvau7zSZMlV2g==
X-Received: by 2002:a5d:45c2:: with SMTP id b2mr8688524wrs.323.1590765592325; 
 Fri, 29 May 2020 08:19:52 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:acf8:18a8:b3a5:a17b])
 by smtp.gmail.com with ESMTPSA id x66sm9220421wmb.40.2020.05.29.08.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 08:19:51 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v7 6/6] drm/meson: crtc: handle commit of Amlogic FBC frames
Date: Fri, 29 May 2020 17:19:35 +0200
Message-Id: <20200529151935.13418-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200529151935.13418-1-narmstrong@baylibre.com>
References: <20200529151935.13418-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_081953_997665_570A22AC 
X-CRM114-Status: GOOD (  10.67  )
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

Since the VD1 Amlogic FBC decoder is now configured by the overlay driver,
commit the right registers to decode the Amlogic FBC frame.

Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_crtc.c | 118 +++++++++++++++++++++--------
 1 file changed, 88 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_crtc.c b/drivers/gpu/drm/meson/meson_crtc.c
index e66b6271ff58..2854272dc2d9 100644
--- a/drivers/gpu/drm/meson/meson_crtc.c
+++ b/drivers/gpu/drm/meson/meson_crtc.c
@@ -291,6 +291,10 @@ static void meson_crtc_enable_vd1(struct meson_drm *priv)
 			    VPP_VD1_PREBLEND | VPP_VD1_POSTBLEND |
 			    VPP_COLOR_MNG_ENABLE,
 			    priv->io_base + _REG(VPP_MISC));
+
+	writel_bits_relaxed(VIU_CTRL0_AFBC_TO_VD1,
+			    priv->viu.vd1_afbc ? VIU_CTRL0_AFBC_TO_VD1 : 0,
+			    priv->io_base + _REG(VIU_MISC_CTRL0));
 }
 
 static void meson_g12a_crtc_enable_vd1(struct meson_drm *priv)
@@ -300,6 +304,10 @@ static void meson_g12a_crtc_enable_vd1(struct meson_drm *priv)
 		       VD_BLEND_POSTBLD_SRC_VD1 |
 		       VD_BLEND_POSTBLD_PREMULT_EN,
 		       priv->io_base + _REG(VD1_BLEND_SRC_CTRL));
+
+	writel_relaxed(priv->viu.vd1_afbc ?
+		       (VD1_AXI_SEL_AFBC | AFBC_VD1_SEL) : 0,
+		       priv->io_base + _REG(VD1_AFBCD0_MISC_CTRL));
 }
 
 void meson_crtc_irq(struct meson_drm *priv)
@@ -383,36 +391,86 @@ void meson_crtc_irq(struct meson_drm *priv)
 	/* Update the VD1 registers */
 	if (priv->viu.vd1_enabled && priv->viu.vd1_commit) {
 
-		switch (priv->viu.vd1_planes) {
-		case 3:
-			meson_canvas_config(priv->canvas,
-					    priv->canvas_id_vd1_2,
-					    priv->viu.vd1_addr2,
-					    priv->viu.vd1_stride2,
-					    priv->viu.vd1_height2,
-					    MESON_CANVAS_WRAP_NONE,
-					    MESON_CANVAS_BLKMODE_LINEAR,
-					    MESON_CANVAS_ENDIAN_SWAP64);
-		/* fallthrough */
-		case 2:
-			meson_canvas_config(priv->canvas,
-					    priv->canvas_id_vd1_1,
-					    priv->viu.vd1_addr1,
-					    priv->viu.vd1_stride1,
-					    priv->viu.vd1_height1,
-					    MESON_CANVAS_WRAP_NONE,
-					    MESON_CANVAS_BLKMODE_LINEAR,
-					    MESON_CANVAS_ENDIAN_SWAP64);
-		/* fallthrough */
-		case 1:
-			meson_canvas_config(priv->canvas,
-					    priv->canvas_id_vd1_0,
-					    priv->viu.vd1_addr0,
-					    priv->viu.vd1_stride0,
-					    priv->viu.vd1_height0,
-					    MESON_CANVAS_WRAP_NONE,
-					    MESON_CANVAS_BLKMODE_LINEAR,
-					    MESON_CANVAS_ENDIAN_SWAP64);
+		if (priv->viu.vd1_afbc) {
+			writel_relaxed(priv->viu.vd1_afbc_head_addr,
+				       priv->io_base +
+				       _REG(AFBC_HEAD_BADDR));
+			writel_relaxed(priv->viu.vd1_afbc_body_addr,
+				       priv->io_base +
+				       _REG(AFBC_BODY_BADDR));
+			writel_relaxed(priv->viu.vd1_afbc_en,
+				       priv->io_base +
+				       _REG(AFBC_ENABLE));
+			writel_relaxed(priv->viu.vd1_afbc_mode,
+				       priv->io_base +
+				       _REG(AFBC_MODE));
+			writel_relaxed(priv->viu.vd1_afbc_size_in,
+				       priv->io_base +
+				       _REG(AFBC_SIZE_IN));
+			writel_relaxed(priv->viu.vd1_afbc_dec_def_color,
+				       priv->io_base +
+				       _REG(AFBC_DEC_DEF_COLOR));
+			writel_relaxed(priv->viu.vd1_afbc_conv_ctrl,
+				       priv->io_base +
+				       _REG(AFBC_CONV_CTRL));
+			writel_relaxed(priv->viu.vd1_afbc_size_out,
+				       priv->io_base +
+				       _REG(AFBC_SIZE_OUT));
+			writel_relaxed(priv->viu.vd1_afbc_vd_cfmt_ctrl,
+				       priv->io_base +
+				       _REG(AFBC_VD_CFMT_CTRL));
+			writel_relaxed(priv->viu.vd1_afbc_vd_cfmt_w,
+				       priv->io_base +
+				       _REG(AFBC_VD_CFMT_W));
+			writel_relaxed(priv->viu.vd1_afbc_mif_hor_scope,
+				       priv->io_base +
+				       _REG(AFBC_MIF_HOR_SCOPE));
+			writel_relaxed(priv->viu.vd1_afbc_mif_ver_scope,
+				       priv->io_base +
+				       _REG(AFBC_MIF_VER_SCOPE));
+			writel_relaxed(priv->viu.vd1_afbc_pixel_hor_scope,
+				       priv->io_base+
+				       _REG(AFBC_PIXEL_HOR_SCOPE));
+			writel_relaxed(priv->viu.vd1_afbc_pixel_ver_scope,
+				       priv->io_base +
+				       _REG(AFBC_PIXEL_VER_SCOPE));
+			writel_relaxed(priv->viu.vd1_afbc_vd_cfmt_h,
+				       priv->io_base +
+				       _REG(AFBC_VD_CFMT_H));
+		} else {
+			switch (priv->viu.vd1_planes) {
+			case 3:
+				meson_canvas_config(priv->canvas,
+						    priv->canvas_id_vd1_2,
+						    priv->viu.vd1_addr2,
+						    priv->viu.vd1_stride2,
+						    priv->viu.vd1_height2,
+						    MESON_CANVAS_WRAP_NONE,
+						    MESON_CANVAS_BLKMODE_LINEAR,
+						    MESON_CANVAS_ENDIAN_SWAP64);
+				fallthrough;
+			case 2:
+				meson_canvas_config(priv->canvas,
+						    priv->canvas_id_vd1_1,
+						    priv->viu.vd1_addr1,
+						    priv->viu.vd1_stride1,
+						    priv->viu.vd1_height1,
+						    MESON_CANVAS_WRAP_NONE,
+						    MESON_CANVAS_BLKMODE_LINEAR,
+						    MESON_CANVAS_ENDIAN_SWAP64);
+				fallthrough;
+			case 1:
+				meson_canvas_config(priv->canvas,
+						    priv->canvas_id_vd1_0,
+						    priv->viu.vd1_addr0,
+						    priv->viu.vd1_stride0,
+						    priv->viu.vd1_height0,
+						    MESON_CANVAS_WRAP_NONE,
+						    MESON_CANVAS_BLKMODE_LINEAR,
+						    MESON_CANVAS_ENDIAN_SWAP64);
+			}
+
+			writel_relaxed(0, priv->io_base + _REG(AFBC_ENABLE));
 		}
 
 		writel_relaxed(priv->viu.vd1_if0_gen_reg,
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
