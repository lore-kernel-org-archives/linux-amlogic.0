Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0EF606A31B
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Nov 2026 15:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZKf3aeW0;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KpNZA4Eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=UKWadsTvovEIq6WoyI+TPMk26BlUwgA91HZOSsqydTs=; b=ZKf3aeW0SWaux7983AtA+9jO4M
	voaybKk8FlSCL2c+ZFB/IhidmjO31XAioacKidb9Zl86vMT7NhmeT+7uV73nlhzV5Z5zinXs4Y/Lw
	C5E1562DVOP3xm/kAOdtSfiXybVlebHH2uMeM4pZ2Sqg8B3D3tA4xB4evHeIO+g5NyT4gpd8hvmls
	u9hmIQUTLLHkU1NwO6VbJ2nF6vAWzAEzJYkuqE6G3R/m3i+T7Rf7aHe1ijYRbiGHhe5442/m4tnM2
	0XKETPyWM0VBRutTNoMFNalod4vFbuo9ybd2brWrTSsr6pH0xaI0epFaTcADQdgzxFWyo6231f+uG
	aQAVg1GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdGt-00000005qTp-0Lil;
	Wed, 04 Nov 2026 15:51:31 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdGp-00000005qS7-2msF
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Nov 2026 15:51:29 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so591930f8f.3
        for <linux-amlogic@lists.infradead.org>; Wed, 04 Nov 2026 07:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793807485; x=1794412285; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5MryvWougc8oZCTNV6AOfjFxzrIHneZrJJ6z1cTNnJA=;
        b=KpNZA4EulL+kH4wd/Ba0cg5wfV9IRubQ+nYyN7ypexM+PClZh/2IXZVyaRd9SF6DoJ
         0DMGrhBtMv6bguDHosHxavjQX0a/CT4sYqW8yZ/AaQe0+KCSe5j/GVVPGpVi8UMJfn5b
         HkIYdsAT2Mot9EKBETLd5v0XhG4Cjsm9wHT6RGydZ++NvzGlh3oQIBwIICyTjTlNTiSf
         BxSJ8qA6JZGg2b3s8wEkx05TKKt05iOL04uS8O+B7q9KAA/fHDx60EZRFEZk3FlfEi0f
         20g453gcmJvE1POWSClbLCl6oPTFDbFaan5XmB/MISQ0jO9gkOBJBg3vMRxpxqytm1Ix
         IW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793807485; x=1794412285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5MryvWougc8oZCTNV6AOfjFxzrIHneZrJJ6z1cTNnJA=;
        b=LRwuEXbxwNUL/WQ7Q9Q55xMZI9j/cazPQUKyIsRy3myFlB6z/leG5QQUDypuqdfePa
         eAEjkxXUMDLMf2z30LGyYmSyLIWzY5JPIcnmZmGitfjLLktbjhdbHnTnac+EQuw+KhLP
         GWEfbsrNf1N5Cihukz7fWMnxQKyumtENU/S0zVZNEC2jGKqbX6vQLMZ40yutAHBjNJT7
         DZPmAm4HN3Yg7DHQFZW1ESrA6VThXGBzhTP8MZ9JNlw5Yh5c1p3CFQUnW5+VHhVr1hRB
         mY4fOI27EEl+FfTOB+YlxPXVLijcRBWqpVn8I31vW7r/UT532FNMZox752vSn1xwD6lT
         s8zw==
X-Forwarded-Encrypted: i=1; AKwUvBzTQTVbpWGwd9hR4NyrFOGENxEyn0CQCF34FfnigdBhwQ0v1dzcwxKKyRVuNAwj5HC+iXhzcBGcPmsFWUCp@lists.infradead.org
X-Gm-Message-State: APuU4Z+diHee8aDpXlP3gfNnvSVo1u650ZqiBS3sl1KBYQt09f6DKtyb
	nvsguHeEu07QnJ9wpwnfu0oZk/gaLMHb6F6gYbt5K6uvKhoEngUm1PBJ
X-Gm-Gg: AYBFou3PUKUljkkRVMPpqpuKUdOG31mSidTx3TXMTBSiGTwuJj53huyn07m81draFt9
	AHLxA3UFGvy2etq+/wSY7WcKmYflTfWQYGVQhPpXoriMCgZH4b3N4biGHtXYuNwLXO8vgsogVT3
	1ZGaSD3MN04salmbE/tt4+AhO8mrqDl/eZh/q5Tp7D9S+PL6Ph8uC2aN5Qw+aWX6qs9ZxGv7ura
	gZkbPTsYEKged6xLuO3ykUzP6eydwxmSe1RukLQgTJHf82mhq+bw4HL48CSYHsOHsYmFZdCPqMF
	XO+jzp3avG3g84QlVJte7B9r3hNfEaoHK2pyynTFE+W7y3BoPC6koHZ8RQUzQmqMw2foiSNX3lM
	LnAefRuNzhhd8zw0noB0wY/NVtpRDzRMIXqNnqxvqK8/E0NMFnGwtPCBghLcxEZz6oXdZB4rkNx
	yqY79jXRcea0+68EuFddxgrZsz9CPFjM8EDRd/g8IQSJt7v3pltrZPJpmPIXMUGuzBhCqQeyQE5
	GT8FYh5XL+d0RLC/9N1/qjqp7yjK8LitlR3G78+uwSKSBcfB2qFN1tDid1SPFlt3//ptVIj0Gm0
	K+NgZhh9tEod4sYDyTrICf+kHCgvSHSyDGL4VZIgFOpGkQ==
X-Received: by 2002:a05:6000:402c:b0:48e:76ab:7906 with SMTP id ffacd0b85a97d-48e76ab7f39mr33469456f8f.9.1793807485352;
        Wed, 04 Nov 2026 07:51:25 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecac2772sm4394985f8f.18.2026.11.04.07.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:51:24 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org
Cc: Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jose Nieto <jnieto.alaber@gmail.com>
Subject: [PATCH] drm/meson: plane: add pixel blend mode property
Date: Wed,  4 Nov 2026 16:51:19 +0100
Message-ID: <20261104155119.284708-1-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_075127_718184_977833EE 
X-CRM114-Status: GOOD (  13.41  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The primary plane exposes ARGB8888, a format with alpha, but never set up
the pixel blend mode property. This makes the DRM core warn at boot:

  [PLANE:...:meson_primary_plane] pixel format with alpha exposed but
  blend mode not setup. Please fix.

Advertise PIXEL_NONE and COVERAGE and derive OSD_REPLACE_EN from the
requested blend mode. Formats without alpha (e.g. XRGB8888) keep the
previous opaque behaviour.

Signed-off-by: Jose Nieto <jnieto.alaber@gmail.com>
---
 drivers/gpu/drm/meson/meson_plane.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
index cf8c90158fcf..115849a0b0c8 100644
--- a/drivers/gpu/drm/meson/meson_plane.c
+++ b/drivers/gpu/drm/meson/meson_plane.c
@@ -233,18 +233,13 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
 		}
 	}
 
-	switch (fb->format->format) {
-	case DRM_FORMAT_XRGB8888:
-	case DRM_FORMAT_XBGR8888:
-		/* For XRGB, replace the pixel's alpha by 0xFF */
+	if (!fb->format->has_alpha ||
+	    new_state->pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE)
+		/* Ignore the pixel's alpha */
 		priv->viu.osd1_ctrl_stat2 |= OSD_REPLACE_EN;
-		break;
-	case DRM_FORMAT_ARGB8888:
-	case DRM_FORMAT_ABGR8888:
-		/* For ARGB, use the pixel's alpha */
+	else
+		/* Use the pixel's alpha */
 		priv->viu.osd1_ctrl_stat2 &= ~OSD_REPLACE_EN;
-		break;
-	}
 
 	/* Default scaler parameters */
 	vsc_bot_rcv_num = 0;
@@ -536,6 +531,7 @@ int meson_plane_create(struct meson_drm *priv)
 	struct drm_plane *plane;
 	const uint64_t *format_modifiers = format_modifiers_default;
 	int ret;
+	unsigned int blend_modes = BIT(DRM_MODE_BLEND_PIXEL_NONE) | BIT(DRM_MODE_BLEND_COVERAGE);
 
 	meson_plane = devm_kzalloc(priv->drm->dev, sizeof(*meson_plane),
 				   GFP_KERNEL);
@@ -566,6 +562,10 @@ int meson_plane_create(struct meson_drm *priv)
 	/* For now, OSD Primary plane is always on the front */
 	drm_plane_create_zpos_immutable_property(plane, 1);
 
+	ret = drm_plane_create_blend_mode_property(plane, blend_modes);
+	if (ret)
+		return ret;
+
 	priv->primary_plane = plane;
 
 	return 0;
-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
