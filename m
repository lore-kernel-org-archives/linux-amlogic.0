Return-Path: <SRS0=R+dC=Z6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9266C43603
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Dec 2019 17:19:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAB8220409
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Dec 2019 17:19:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hUKQULWq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="HSeJVcOu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAB8220409
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P1xtD27tBz5LqOIXLlZSrGNlBWU7gQSMqQb/wkioo44=; b=hUKQULWqj4PtZC
	sRlHR83VM0XwdLiBACnOkaNd6B+o1zbFH94x4FPig1STld+LPa8VKZSqkJRpytA4/2B1cd155YCRo
	STLasCklfm1kLVjns4+eH79IdJj2SkMlAh4nocq2HbXoTrj8SJr00EcdIq9+1r74Rzo6vHiu40+P4
	kVDud8DcbcaAE6zbp5NvU8AJ4xZN7h2Uyrx/nZZuQ96OEm/8nqLRBaSlFboOT1k9h67lzGU4Yx33+
	PfV9l9Fqb4Ey0cfpN67nS+evkO44MoldvPIZTwCczQZprmCQ4BZH4StxGEJ6IMxuIdklAbYDIL1Ep
	VAxsWxrOJqbtXOGrLvug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ie0DQ-0003Ju-NN; Sun, 08 Dec 2019 17:19:28 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ie0D3-0002sf-Nx; Sun, 08 Dec 2019 17:19:08 +0000
Received: by mail-wm1-x341.google.com with SMTP id g206so12952492wme.1;
 Sun, 08 Dec 2019 09:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Af0AIrF2pn2WiljuwZLbgsnTz6mwhPcm7wLICRG7aXU=;
 b=HSeJVcOunCaBhrbYJRxC+JJuLUSzSb8dl6z/zdArFxVXJJsloVOq8463hSurjc+3TP
 wjIn7/G6dNRHl5p/UKKibhYd1Ua7uLmpkb/c0umZcPjJ9IRBF8eNRlRSByt0FpLCACF3
 sCjMP0xkROPJikNqBxmC5M945CXBFcQnF/FJ9N7/Dh3vDXMyYfGLRr9lZ8E1M6zW3aef
 Ril7fpN8dRm/tVbhlGd5n73y61PGYgG3FWsJ6eqJgCJasaCqv9e6AaTzmsFfBvKUh+vD
 DF617jh3WLGIzM82GuhNLbFmAtEgEHlXfpkYujDD7aKXPE99Bfbhnd/qvbFikkFPQvDd
 VjQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Af0AIrF2pn2WiljuwZLbgsnTz6mwhPcm7wLICRG7aXU=;
 b=HgJsQ1/YyGj6nYe9v2p3a3q+Htkv/1lNkUiOKW7RiLeVgc9YUo2abBSQBxwHSRLwuO
 9uIoRdX+dLuugLwOW7Cy+5uVZgQUJV5Nd+8PY1oIkcRYvBMe8Pa+eKzMwEd9qMXE23Il
 IZWHA666PMZTCfpBcPfOEhwBBACEMMDC66dIWQ4JaXfGU8Rf5sIuv78dVGjAmck3zumw
 /bsD4cKli84eK52bb4xZPW0SX/b/YVI7EaJ0ASJIlIkMkhcff5wq7D+iGTcb9OnvydyE
 wssW3Ri/jRt0LJXhtmPGFYEkqN85pSJS6EN7JKervSC5hPtrIB21ZqeI+xCmXTtooxxP
 hMpA==
X-Gm-Message-State: APjAAAWuDZ0Aua9P4eA7ZLZCHMViFeZARIsnsH+OOqCC3ZvuYKtR4hj7
 zc7hkrD/SK6wbt4XzXMdJyCyZmNX
X-Google-Smtp-Source: APXvYqzKs5N7Q7VkfHt/A0pJeugUntAJWwWw96d/Y+AABbb6hRDfVkYvauPT6/LzxBSp7XZU8E51bw==
X-Received: by 2002:a7b:c190:: with SMTP id y16mr21086627wmi.107.1575825541855; 
 Sun, 08 Dec 2019 09:19:01 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1371AD700428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:371a:d700:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id g25sm11791383wmh.3.2019.12.08.09.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2019 09:19:01 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	narmstrong@baylibre.com
Subject: [PATCH v2 2/2] drm: meson: venc: cvbs: fix CVBS mode matching
Date: Sun,  8 Dec 2019 18:18:32 +0100
Message-Id: <20191208171832.1064772-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191208171832.1064772-1-martin.blumenstingl@googlemail.com>
References: <20191208171832.1064772-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191208_091905_786553_C84236F7 
X-CRM114-Status: GOOD (  14.20  )
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, daniel@ffwll.ch,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

With commit 222ec1618c3ace ("drm: Add aspect ratio parsing in DRM
layer") the drm core started honoring the picture_aspect_ratio field
when comparing two drm_display_modes. Prior to that it was ignored.
When the CVBS encoder driver was initially submitted there was no aspect
ratio check.

Switch from drm_mode_equal() to drm_mode_match() without
DRM_MODE_MATCH_ASPECT_RATIO to fix "kmscube" and X.org output using the
CVBS connector. When (for example) kmscube sets the output mode when
using the CVBS connector it passes HDMI_PICTURE_ASPECT_NONE, making the
drm_mode_equal() fail as it include the aspect ratio.

Prior to this patch kmscube reported:
  failed to set mode: Invalid argument

The CVBS mode checking in the sun4i (drivers/gpu/drm/sun4i/sun4i_tv.c
sun4i_tv_mode_to_drm_mode) and ZTE (drivers/gpu/drm/zte/zx_tvenc.c
tvenc_mode_{pal,ntsc}) drivers don't set the "picture_aspect_ratio" at
all. The Meson VPU driver does not rely on the aspect ratio for the CVBS
output so we can safely decouple it from the hdmi_picture_aspect
setting.

Fixes: 222ec1618c3ace ("drm: Add aspect ratio parsing in DRM layer")
Fixes: bbbe775ec5b5da ("drm: Add support for Amlogic Meson Graphic Controller")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/gpu/drm/meson/meson_venc_cvbs.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_venc_cvbs.c b/drivers/gpu/drm/meson/meson_venc_cvbs.c
index 6b8a074e4ff4..1bd6b6d15ffb 100644
--- a/drivers/gpu/drm/meson/meson_venc_cvbs.c
+++ b/drivers/gpu/drm/meson/meson_venc_cvbs.c
@@ -72,7 +72,11 @@ meson_cvbs_get_mode(const struct drm_display_mode *req_mode)
 	for (i = 0; i < MESON_CVBS_MODES_COUNT; ++i) {
 		struct meson_cvbs_mode *meson_mode = &meson_cvbs_modes[i];
 
-		if (drm_mode_equal(req_mode, &meson_mode->mode))
+		if (drm_mode_match(req_mode, &meson_mode->mode,
+				   DRM_MODE_MATCH_TIMINGS |
+				   DRM_MODE_MATCH_CLOCK |
+				   DRM_MODE_MATCH_FLAGS |
+				   DRM_MODE_MATCH_3D_FLAGS))
 			return meson_mode;
 	}
 
-- 
2.24.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
