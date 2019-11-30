Return-Path: <SRS0=VwQk=ZW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BD21C432C0
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Nov 2019 22:26:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D028A2084D
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Nov 2019 22:26:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gQvJYe3X";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="fi6nj6EV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D028A2084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x2PDE2BcaHmvVgrO1+bzzpUO6vV4QArZUg0gkh+I5oQ=; b=gQvJYe3X0ZGBoj
	iHyZV7whzgcti+52A48p4s3CCsUOJM1NM4g9VTXi0wLAQXaiSSOAJLgSHSAe2QSpSdU76HrgxIWLu
	yXuyw+WR3XO2zJw2huPf104P5FmYMVLtlHBiv7rj7Uo5tWHyYT49fCt3kyyBzDESvlh8fTVgYyzQS
	Yfe8HNWtI3otFDmhNe0ZVJYNNndDG8djxUhBqoJT91vD+26zsNrdGM5UJEH3lBU65Mi3ULpzs0H6N
	5O3njprzHZSUhXPXzlOSZG+t2CnA210/z4DM1z0tUqBAbDGuq6fUKNui2rEDjoI6wMcjtpOaIq4TI
	OJV4x1vsMpF28iQ+vyHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ibBBn-0005CM-Am; Sat, 30 Nov 2019 22:26:07 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibBBk-0005Bu-9h; Sat, 30 Nov 2019 22:26:05 +0000
Received: by mail-wr1-x444.google.com with SMTP id y17so684128wrh.5;
 Sat, 30 Nov 2019 14:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bupTiDGvcydZYN2Rnj/bXhOvQ014P8Ct3uBt5NbJKS8=;
 b=fi6nj6EVbWIV/2fhXGOQgkkRptg3mNzbFfVm4h7Lx3k31Gd/rdMvatqedH2AHz+fTI
 JA/tugb+Ci5XR+WmopY5bNT3Kyc/wh4bp+rlLoxlfqmtdV7Pnnj5aaoixosAp7mmvaqy
 jippza5lpblGhOfDmzNUK+vsBOeBoY0cQoW5dTGXBO4cOrf5mlZ3yiMxbScXD0aLIWt5
 Aes9ebuA77Em4dDWQ+DshvhfptHrVRohoWlsTXL6zRv+W32H2/MH5XIFvTcKQeXuUTR2
 Aij4/EWbitIheNds46i9dsiG36YypcQcwmsV80mFsBv7rxHKQsOZ2ptDJ247SzPm9uYC
 WDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bupTiDGvcydZYN2Rnj/bXhOvQ014P8Ct3uBt5NbJKS8=;
 b=LdmB1CPDVba/Fc/MeJp4t9jG3VyDMQzfjWKLBz7cTVOk+LD51Yfk89hHZzLFZVY883
 sp2LvbyV9cWw/pQSk6WnKy1djUUDJXzUE30i6yqkU+BbVAqm/nED5TiSv6qTuXFTSya9
 kU8aOdTFQt5KEn1z+gKm//18oHhiwFI4xNAQ6UfkIz2Zkur+21CJY4BktwynRIthjvv7
 f7Ddh0mGTGF7m9d1T21jWtrAgX1Mt9DLDa5ScoGylEZJcZMp8kklpf+qxUYzo5XHcUVY
 jni0f+QpUqh1hbR2z9DEFSNFHg6Nl/FF4NjI79625aaxuB5dKLeiz2AIP77V4ULFNn+Z
 P/cg==
X-Gm-Message-State: APjAAAXQVxZ8/zwy+pdlAJ47MzAsug/XF+Gli/5wT2R6CqXvRZxRGh7F
 xgb1IOD5FA7GLGnFU7h/cqYgY//a
X-Google-Smtp-Source: APXvYqwjN3lyPniHb9sLZ4uyBqG1FGZjCFKXKddgkyxV/pen1ugXXLKQtr2k6+big4hC461LRG5JBw==
X-Received: by 2002:adf:f5c2:: with SMTP id k2mr60867770wrp.118.1575152762350; 
 Sat, 30 Nov 2019 14:26:02 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1371CB100428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:371c:b100:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id i71sm36265650wri.68.2019.11.30.14.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2019 14:26:01 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	narmstrong@baylibre.com
Subject: [PATCH] drm: meson: venc: cvbs: fix CVBS mode matching
Date: Sat, 30 Nov 2019 23:25:55 +0100
Message-Id: <20191130222555.2005375-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191130_142604_338422_37DEBA9B 
X-CRM114-Status: GOOD (  11.41  )
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

Drop the picture_aspect_ratio from the drm_display_modes which are valid
for the Amlogic Meson CVBS encoder. meson_venc_cvbs_encoder_atomic_check
and meson_venc_cvbs_encoder_mode_set only support two very specific
drm_display_modes.

With commit 222ec1618c3ace ("drm: Add aspect ratio parsing in DRM
layer") the drm core started honoring the picture_aspect_ratio field
when comparing two drm_display_modes. Prior to that it was ignored.
When the CVBS encoder driver was initially submitted there was no aspect
ratio check.

This patch fixes "kmscube" and X.org output using the CVBS connector
with the Amlogic Meson VPU driver. Prior to this patch kmscube reported:
  failed to set mode: Invalid argument
Additionally it makes the CVBS mode checking behave identical to the
sun4i (drivers/gpu/drm/sun4i/sun4i_tv.c sun4i_tv_mode_to_drm_mode) and
ZTE (drivers/gpu/drm/zte/zx_tvenc.c tvenc_mode_{pal,ntsc}) which are
both not setting "picture_aspect_ratio" either.

Fixes: 222ec1618c3ace ("drm: Add aspect ratio parsing in DRM layer")
Fixes: bbbe775ec5b5da ("drm: Add support for Amlogic Meson Graphic Controller")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/gpu/drm/meson/meson_venc_cvbs.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_venc_cvbs.c b/drivers/gpu/drm/meson/meson_venc_cvbs.c
index 9ab27aecfcf3..2ddcda8fa5b0 100644
--- a/drivers/gpu/drm/meson/meson_venc_cvbs.c
+++ b/drivers/gpu/drm/meson/meson_venc_cvbs.c
@@ -49,7 +49,6 @@ struct meson_cvbs_mode meson_cvbs_modes[MESON_CVBS_MODES_COUNT] = {
 				 720, 732, 795, 864, 0, 576, 580, 586, 625, 0,
 				 DRM_MODE_FLAG_INTERLACE),
 			.vrefresh = 50,
-			.picture_aspect_ratio = HDMI_PICTURE_ASPECT_4_3,
 		},
 	},
 	{ /* NTSC */
@@ -59,7 +58,6 @@ struct meson_cvbs_mode meson_cvbs_modes[MESON_CVBS_MODES_COUNT] = {
 				720, 739, 801, 858, 0, 480, 488, 494, 525, 0,
 				DRM_MODE_FLAG_INTERLACE),
 			.vrefresh = 60,
-			.picture_aspect_ratio = HDMI_PICTURE_ASPECT_4_3,
 		},
 	},
 };
-- 
2.24.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
