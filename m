Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B07C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Dec 2021 23:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jBDy4GN9w6S+/5d1UT7dfZ2X/J731qiWQqc/g3FHqlc=; b=B7sRbYymfjfVqa
	mc3VgaZf1vv2+9LY58BFzKC0UA62VaGCuXFd0Xe2wqQGMNoq5haSi6AP2w2B2Ipm6umli+FPD7HEH
	CoqS+BCybtjYzh9LiST+QAJfh42Ol2gfH5Fz7wtzgwTJxMgxps+KUuePpFiLLH4pxpM/vHWmFbBke
	iuu/RTT0w6LZ/td/UDo55M2/hfGj1e4jl7lCwU8gyhUPXQM0mD0c9IcZF4vovHwt12C+1lWzy/o5W
	3w3T+VXBa2iWzcquJbRM03FiX6vpksgeZ6DirAw2287GdYtg4B4aMS5V1ZTbeWErGXSlQCFmztdzZ
	YO7asxDMHy0/f/oTqeLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n35Hk-005QfP-Px; Thu, 30 Dec 2021 23:56:40 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n35HN-005QWD-9Y; Thu, 30 Dec 2021 23:56:18 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 j140-20020a1c2392000000b003399ae48f58so16784433wmj.5; 
 Thu, 30 Dec 2021 15:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HquMs86R/2fSeMwrKiFYntNswT/jyW+k3LeVZxsjHFc=;
 b=aimcO/TVd9nLXP7KRWG9TSbEhFtB8BJ5Ypa/LerWNZpYC2h0L6iZj56Qz+jlNG/BSg
 sM2L9k0hfACJB+f7Ajp5KiZ1YrA5/8Vmq0Kc5vaw8oGvx9aLt2yogvggS3NTJG49fFG6
 jmAJdNj6c2tAIwVzkLMd3J/HbVaaXrywKXtbBgYY6xxuptnuO8Bn+ydOZALpWnwADh7m
 ch5pyVOD5DK4H3c2OpUu0WNBzzb8I5KyjOnu1nLuN/1daBe4GCq3bF2vvZ6p3JUQGPv4
 uglLVhg+sEbUcUJ+BAEA1RpeqORqdNISz3VL764tRkg7+WpbzedShoj/K++apOlwPiJ5
 EQ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HquMs86R/2fSeMwrKiFYntNswT/jyW+k3LeVZxsjHFc=;
 b=Dxkee3/XxtJEOUx7g0p38orZb/eUfCzWvQQ3bDXGmkgiQseTPwxvHk+rzAuGnNfOra
 yF9q3NjHghKyeuXItOdGmyFPFHtqdx7rdCkuWOFUV8FG/e/5bUyeE+Cedmm5MbxTYlPl
 7KBsT5Aa2RmXw+tfs7zX2a4uHiYSrY8evLPelKfguVSHIproc1ZBLY6vGk0ldoDbJL9S
 Edj1mDSOKTP5T+FXuaHNd8y+6uxbvn9BcXjTfDNjbT6wRhLr28pVpxbx6Hi+dZjdqyeF
 knkL377H1ViY5rHTlQtCfNclEgG8AOnpmNYM5D/VHWYGsEOUMrzAvg4yFXkKV2U+PsYx
 26gw==
X-Gm-Message-State: AOAM533i3/4CjTEwUefiS3qGSgO0aqbXR31w1hM5OU6Wb2KKlSRkUHtz
 0GLsQDhzKSatfySIC3QXW0k5b/Ue7QQ=
X-Google-Smtp-Source: ABdhPJxsbq3CsAbIef75T6kasQUgh1BPtxbFzJI3LjtCD4VpZZEwaW683xGiB2wbopwaPfTSrv4Kcg==
X-Received: by 2002:a05:600c:4ed1:: with SMTP id
 g17mr19264564wmq.112.1640908575690; 
 Thu, 30 Dec 2021 15:56:15 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-2a01-0c23-c015-2400-f22f-74ff-fe21-0725.c23.pool.telefonica.de.
 [2a01:c23:c015:2400:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id f16sm35137581wmg.27.2021.12.30.15.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 15:56:15 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, narmstrong@baylibre.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 2/2] drm/meson: Fix error handling when afbcd.ops->init fails
Date: Fri, 31 Dec 2021 00:55:15 +0100
Message-Id: <20211230235515.1627522-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211230235515.1627522-1-martin.blumenstingl@googlemail.com>
References: <20211230235515.1627522-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211230_155617_352998_8209CF64 
X-CRM114-Status: GOOD (  11.54  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

When afbcd.ops->init fails we need to free the struct drm_device. Also
all errors which come after afbcd.ops->init was successful need to exit
the AFBCD, just like meson_drv_unbind() does.

Fixes: d1b5e41e13a7e9 ("drm/meson: Add AFBCD module driver")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/gpu/drm/meson/meson_drv.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index b919271a6e50..26aeaf0ab86e 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -302,42 +302,42 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 	if (priv->afbcd.ops) {
 		ret = priv->afbcd.ops->init(priv);
 		if (ret)
-			return ret;
+			goto free_drm;
 	}
 
 	/* Encoder Initialization */
 
 	ret = meson_encoder_cvbs_init(priv);
 	if (ret)
-		goto free_drm;
+		goto exit_afbcd;
 
 	if (has_components) {
 		ret = component_bind_all(drm->dev, drm);
 		if (ret) {
 			dev_err(drm->dev, "Couldn't bind all components\n");
-			goto free_drm;
+			goto exit_afbcd;
 		}
 	}
 
 	ret = meson_encoder_hdmi_init(priv);
 	if (ret)
-		goto free_drm;
+		goto exit_afbcd;
 
 	ret = meson_plane_create(priv);
 	if (ret)
-		goto free_drm;
+		goto exit_afbcd;
 
 	ret = meson_overlay_create(priv);
 	if (ret)
-		goto free_drm;
+		goto exit_afbcd;
 
 	ret = meson_crtc_create(priv);
 	if (ret)
-		goto free_drm;
+		goto exit_afbcd;
 
 	ret = request_irq(priv->vsync_irq, meson_irq, 0, drm->driver->name, drm);
 	if (ret)
-		goto free_drm;
+		goto exit_afbcd;
 
 	drm_mode_config_reset(drm);
 
@@ -355,6 +355,9 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 
 uninstall_irq:
 	free_irq(priv->vsync_irq, drm);
+exit_afbcd:
+	if (priv->afbcd.ops)
+		priv->afbcd.ops->exit(priv);
 free_drm:
 	drm_dev_put(drm);
 
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
