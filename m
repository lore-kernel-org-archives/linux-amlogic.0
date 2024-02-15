Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C22C48BC4
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Feb 2024 22:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a+bHBxVKQkcN55LBQauHTvyi8Gzqs829U95VrHnvZe0=; b=aRtEKMXXBhuLjK
	tC5wXwmTbb+deGaUASR6BZ33KnNEoJzWeioKDuDftEtvtR9dhugqsaJwiDPM2sruNhAKQ+RaxuzTp
	zL0bWJ+6sEUQDTPd30tPdl7ZBO50MA/GUM037CIw6YVNULbg/cmh9D6wlVEEBZSI6eu79koC99xZr
	uvhagxW7jkAuW0ttAEbtoHoriG6srp9pfvniPjjRP4bMoiHSMun/j2b/KRycfblUBaf/dTL98iLi1
	V4e2LqQbIU5ipeVtJzcusGKVjU/NjetStUK+GmRT877nihJ0t1WIXiV1Bn+APRlo3iW6xjNQHLuTp
	XXYEv3A/nvU2PROJHjOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rajqx-00000000HKI-3DZ4;
	Thu, 15 Feb 2024 22:05:11 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rajqv-00000000HIh-2yCo;
	Thu, 15 Feb 2024 22:05:10 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-511a4a1c497so1558325e87.3;
        Thu, 15 Feb 2024 14:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1708034707; x=1708639507; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6rc6eGU7njaSrd3gOPv3RWA0Ip0OaiWxwVmzreal714=;
        b=Ux6W5vcktdt/gVSzISJhEcI7IteICsfNmaxO/iuM2hnRnwsaLWbyquujz8VhpOkFJk
         t9O2QPJpMfVlPryB9VZw33KTfDlAp/bVPDGz9OravZyvPn/g+MM913aGsSsIA5xPw1mY
         C1s/eSfK47x2bFWkDhw/n1U9LTlqC0cARp0sYpsxiqNeFGVpwxgzTDTPYCuS6AcT7ey3
         i9WMbYnUSUGuNhupSxnbNrVJIriVEFDmHxtNipwDVmp6mghUNNW69hRDeWJjG0uOirZs
         zukm+ANCowW5VkDH6S5LWCTOI+Rvv3peATNEWamCQCsVnVB52jXqptB8y/brSPf3tHGQ
         U7+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708034707; x=1708639507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6rc6eGU7njaSrd3gOPv3RWA0Ip0OaiWxwVmzreal714=;
        b=KJzVGH1pDBbE0fbsgRzerB4W7Pc9xJ2fU6j8b4bHC5vjLc7OZn/lRQ0nv60s68vsgs
         HCqD2/1DG0Q5FMo1J6u7n5PQc5pjWGZXwYMqTow8Zm8V38vpbArcANsNxL8X8Uyi0pVT
         7HB02I5oIXFJ/xjjZpNb1Jz+x3QB9Wr4Wyw4JWerF9x39UlAmnOKfjxgH+3OGkrGF3Q5
         2MjyaXYzPiLWg/p063OQD4CNe/lA9nr78aahyG9t/MctaJYWjlDgHKdo35JnU9HvGxl0
         JPzTpzXcmBsf96UxOuVvaN8y94LRvqHnelnCJEWIVoDENrInrFRyW2qvX3reWug+/rz9
         fRvg==
X-Forwarded-Encrypted: i=1; AJvYcCUN+I1Yaz0F+GsgdcVV5uZ0G5bijfw20KE9clJ6Hm4FwL3AI/Y8x13Tn7+5yekFWWnIbZz9ZsvDkH63KRvG5Ov1KQ/D1DPjWfClkz/ZLPEWQYREdYs=
X-Gm-Message-State: AOJu0YwaFgGPWJufIDKkkbvHO9dtJA8yX1PknYl9cDMtTTN8JOEcdyF7
	ITaO3lJjex7Y5DcFautvW+WxRDR/3MfpNjBUKfURJQY6kEvbozVAr9i+jNHn
X-Google-Smtp-Source: AGHT+IGSIYZ0XnvTKya7l899GJk/rCpQGsTezNi2GKDId5wCowIGk1MLv8BFbvHyGiVhfeUDOVhy5Q==
X-Received: by 2002:a19:e054:0:b0:511:79ef:529 with SMTP id g20-20020a19e054000000b0051179ef0529mr2474521lfj.55.1708034707051;
        Thu, 15 Feb 2024 14:05:07 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a01-0c22-7b54-ff00-f22f-74ff-fe21-0725.c22.pool.telefonica.de. [2a01:c22:7b54:ff00:f22f:74ff:fe21:725])
        by smtp.googlemail.com with ESMTPSA id p17-20020a1709060e9100b00a3d11feb32esm945630ejf.186.2024.02.15.14.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 14:05:06 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Cc: neil.armstrong@linaro.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	adrian.larumbe@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	stable@vger.kernel.org,
	Steve Morvai <stevemorvai@hotmail.com>
Subject: [PATCH] drm/meson: Don't remove bridges which are created by other drivers
Date: Thu, 15 Feb 2024 23:04:42 +0100
Message-ID: <20240215220442.1343152-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_140509_770175_2D6AC4A9 
X-CRM114-Status: GOOD (  13.99  )
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

Stop calling drm_bridge_remove() for bridges allocated/managed by other
drivers in the remove paths of meson_encoder_{cvbs,dsi,hdmi}.
drm_bridge_remove() unregisters the bridge so it cannot be used
anymore. Doing so for bridges we don't own can lead to the video
pipeline not being able to come up after -EPROBE_DEFER of the VPU
because we're unregistering a bridge that's managed by another driver.
The other driver doesn't know that we have unregistered it's bridge
and on subsequent .probe() we're not able to find those bridges anymore
(since nobody re-creates them).

This fixes probe errors on Meson8b boards with the CVBS outputs enabled.

Fixes: 09847723c12f ("drm/meson: remove drm bridges at aggregate driver unbind time")
Fixes: 42dcf15f901c ("drm/meson: add DSI encoder")
Cc: stable@vger.kernel.org
Reported-by: Steve Morvai <stevemorvai@hotmail.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
This issue was reported by Steve off-list to me (thanks again for your
patience and sorry it took so long)!
The Meson8b VPU driver is not upstream, but the problematic code is.
Meaning: This issue can also appear on SoCs which are supported
upstream if the meson DRM driver probe has to be re-tried (with
-EPROBE_DEFER). That's why I chose to Cc the stable list.


 drivers/gpu/drm/meson/meson_encoder_cvbs.c | 1 -
 drivers/gpu/drm/meson/meson_encoder_dsi.c  | 1 -
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 1 -
 3 files changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
index 3f73b211fa8e..3407450435e2 100644
--- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
+++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
@@ -294,6 +294,5 @@ void meson_encoder_cvbs_remove(struct meson_drm *priv)
 	if (priv->encoders[MESON_ENC_CVBS]) {
 		meson_encoder_cvbs = priv->encoders[MESON_ENC_CVBS];
 		drm_bridge_remove(&meson_encoder_cvbs->bridge);
-		drm_bridge_remove(meson_encoder_cvbs->next_bridge);
 	}
 }
diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
index 3f93c70488ca..311b91630fbe 100644
--- a/drivers/gpu/drm/meson/meson_encoder_dsi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
@@ -168,6 +168,5 @@ void meson_encoder_dsi_remove(struct meson_drm *priv)
 	if (priv->encoders[MESON_ENC_DSI]) {
 		meson_encoder_dsi = priv->encoders[MESON_ENC_DSI];
 		drm_bridge_remove(&meson_encoder_dsi->bridge);
-		drm_bridge_remove(meson_encoder_dsi->next_bridge);
 	}
 }
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 25ea76558690..c4686568c9ca 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -474,6 +474,5 @@ void meson_encoder_hdmi_remove(struct meson_drm *priv)
 	if (priv->encoders[MESON_ENC_HDMI]) {
 		meson_encoder_hdmi = priv->encoders[MESON_ENC_HDMI];
 		drm_bridge_remove(&meson_encoder_hdmi->bridge);
-		drm_bridge_remove(meson_encoder_hdmi->next_bridge);
 	}
 }
-- 
2.43.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
