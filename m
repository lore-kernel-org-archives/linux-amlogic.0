Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9932CD6E51
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 May 2026 07:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LG/4nc+a3ZcO71Q5qMDJQGgaf0uPnm4ysYKZpUOKjUY=; b=KvYMHx8Cj48lZX
	GPZa4tJaq1G3jcgCf2iVLZIurQNjhrw10usO6NFRzqUFCT3xlxxnEThG1ojKawoo8AiXQCFYpRVxq
	7YJv++rYBKwSHTSVBq3/fkfVWQ7i+aYcARasieQB1xVvXXr/BG33M4UbID0pOkGLTve9XoLrl0xui
	LElOmMGB2sstDKU62JI0R7kJTmL9TQuyRqIVs8KbuvVo1Esyvr9P3o77kD5D4XPGEmEhinFK2gJOg
	eFPSR8DirZlAJrw3q6TDVkNgabEPHgxuz8ht/FEddaWBpDqlPEgl4CAwm/vaglS/Dvvt9Hduhj474
	T110YvtUzlx1Olp5ZviA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTaiv-00000009KRI-2AsI;
	Sun, 31 May 2026 07:36:41 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTait-00000009KQQ-2pc9
	for linux-amlogic@lists.infradead.org;
	Sun, 31 May 2026 07:36:40 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-84229481d44so305639b3a.0
        for <linux-amlogic@lists.infradead.org>; Sun, 31 May 2026 00:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780212999; x=1780817799; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jKPe1TO+FoogghrC8LGLLeXq7GSJc49agxpkGaHZqpM=;
        b=d7pHjL59QR2tdWNgqa+tnzZQMygIZB4fSHa9zEQe7V3kZ+v0iY0pXk3mRjoEpyynxB
         IsrWT/VTxLEqfkBHlioVcdUOGe+tjOHKCbqMmJipr8oY6Cejjxk4wc2+cM4WziC3866B
         q3RPqV+km2wrkWKQZUoRs93C00M6pqvqjo3h6iMMES9VO69NFvTYs0C4/XeZs5l8u8UK
         C1CqQVvSIbwgej3Fluf1kRvnzgoSiy21Kkmhl7UO6cSSRpoz28PShBu3KufSPFrgtqCU
         l4HC8GF2Yvr0NeejD5TJKxwjxagnwoGW3EFzO6t/SxTSBTXZsWz+0cQHN54fL5vO6tkr
         M2RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780212999; x=1780817799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jKPe1TO+FoogghrC8LGLLeXq7GSJc49agxpkGaHZqpM=;
        b=CEHUPVuhuHSkkpd2YfcPPQ1aCb1uPuDNbxTAO1+fnfg7TWMV/+mg/yBwaG6m3rN5c5
         Ud9tTtf8Au6RCHOBvvZiepAwF3sGmVsd2R9zxTy00rzDGnnffG8+fRdTlBMWzYw7Yew/
         oOCPhVxgibZ42BsSGuh00W6/XYgQilt8gbXoIpOLkHSRtRtPr8JRN76NFlXnYU0wa6V7
         TL0tusBNnisPb7rZPHu3qcueinZCh6rt02VBD5SF6anGpFn0kuz5iEbuEGJ0sQXBm9RR
         X5uMO67R3Lw9yvy25WHdGampOljynsQ8CzFCx2K/8rrLqx2h0mhRJjvVvsc3HjULnRIX
         UOvw==
X-Forwarded-Encrypted: i=1; AFNElJ/Lya0Zyzyy2kH9rKloWB9mVxXtfdspw2SJpzNkqiWE9iCcq1aNQ62TvPb4wTokKUlzvKBkmFECnDGMVXR0@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5muBX0pz0PHG5MBjaXrnCop5zgYhLSqbtGSsDxmQoKlOjdkG4
	Xc3rDwIDUTKw7NsJd3SM9KPbpa0w27UyY/jZcm8DVNJwzgSGapget2EL
X-Gm-Gg: Acq92OGSl2Ncdu5ucWiFWU7FSFsM+aD1hHzNX9bEOAdsYv+3y09Kx0U8x4jnxuO1/La
	CD/7GL0388TQHyub+ZRcBS7ojRLzvUgoxIOKaIp6/ZrYFDc0fOloMA8L/MHEOmPpB+/5ho1Xm2n
	pgebFjyZSvlmMitFgcD1d2t+fx86hx0UyyTLB3dMkbHq0b86iwTA5qiWKZQElN6DE2vChZLhnLQ
	J5w8+lpUkhobim3bvz60O43TAa4r0iVp7bAQzRujpC2xIFjcP8fS8PGaQ/grSrZTJ7vBQwtXCtr
	96UsU/iNtE7qY9pI1Foec9rMcs/9QUt3QaY/Uh6Tv8Qxh7eOHUjKbcTvM4zYI0ng6w0WFzlpfLs
	hVzIwW241C1U1qwWM6uTBWIM5rr8p+0PklbCkcL1hIPsxPZYsfrnPr0UwtmQTugNfoSavwSBGaq
	uVG1Kz26Qd79ON4B/aES29FxiWL7s+ahOqjx3Qm1vVlw==
X-Received: by 2002:a05:6a00:1a05:b0:842:3373:f662 with SMTP id d2e1a72fcca58-8423374104dmr2845469b3a.11.1780212998783;
        Sun, 31 May 2026 00:36:38 -0700 (PDT)
Received: from Naman.Naman ([2401:4900:1f39:4c4a:1e56:d301:ce43:ac25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8422e712309sm3760709b3a.59.2026.05.31.00.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 00:36:38 -0700 (PDT)
From: Naman Arora <namanarora029@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: tzimmermann@suse.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	stefan@agner.ch,
	alison.wang@nxp.com,
	jyri.sarha@iki.fi,
	tomi.valkeinen@ideasonboard.com,
	kraxel@redhat.com,
	dmitry.osipenko@collabora.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Naman Arora <namanarora029@gmail.com>
Subject: [PATCH 1/6] drm/fsl-dcu: Open-code drm_simple_encoder_init()
Date: Sun, 31 May 2026 13:05:27 +0530
Message-Id: <20260531073532.8609-2-namanarora029@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260531073532.8609-1-namanarora029@gmail.com>
References: <20260531073532.8609-1-namanarora029@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_003639_715061_6F192501 
X-CRM114-Status: GOOD (  10.11  )
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

The helper drm_simple_encoder_init() is a thin wrapper around
drm_encoder_init() with a simple destroy-only encoder funcs struct.
Remove the dependency on drm_simple_kms_helper by open-coding the
encoder initialization directly in the driver.

Signed-off-by: Naman Arora <namanarora029@gmail.com>
---
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
index 84eff7519..a16c6013e 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
@@ -14,11 +14,14 @@
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "fsl_dcu_drm_drv.h"
 #include "fsl_tcon.h"
 
+static const struct drm_encoder_funcs fsl_dcu_drm_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 int fsl_dcu_drm_encoder_create(struct fsl_dcu_drm_device *fsl_dev,
 			       struct drm_crtc *crtc)
 {
@@ -31,8 +34,9 @@ int fsl_dcu_drm_encoder_create(struct fsl_dcu_drm_device *fsl_dev,
 	if (fsl_dev->tcon)
 		fsl_tcon_bypass_enable(fsl_dev->tcon);
 
-	ret = drm_simple_encoder_init(fsl_dev->drm, encoder,
-				      DRM_MODE_ENCODER_LVDS);
+	ret = drm_encoder_init(fsl_dev->drm, encoder,
+			       &fsl_dcu_drm_encoder_funcs,
+			       DRM_MODE_ENCODER_LVDS, NULL);
 	if (ret < 0)
 		return ret;
 
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
