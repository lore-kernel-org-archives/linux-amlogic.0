Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53187CD5BD1
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 May 2026 07:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V8mRdYa1JKaceWXRyOpoVD8HaIWVVeA96acaB56Z1mw=; b=A28HupBxTdUa+S
	6Zd5eY9oGpzHBUWlfm9+CsJnuTC3BG2cMPUBjUefx6qQpFjwxhgPk9Qb8AVUyAX4MurMRo5pVt0Ye
	AklPKchF2fTscFQE5pnB563q5ofPptI+SXvWq934k/90PskizSn2xjYLeRg1TsXnXQ7n//qntFhWX
	Lgq19IksS1MPkSol8G6CpjTxMQOOyLefaXnf++xQw7jchQD1pN390A/baVTHvioGsRm7CRO2IFaRH
	C4qekAz7EQlCHzA8AhwasAGMKrAgUbPL8QjaIPwjlrk6DX75E1tqYgxzNMEkAXPc9BhMUjaV1M9wQ
	tv54TP0RlT4sU+y289bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTajg-00000009Ke0-41t0;
	Sun, 31 May 2026 07:37:28 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTajd-00000009KcJ-49rW
	for linux-amlogic@lists.infradead.org;
	Sun, 31 May 2026 07:37:27 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-36b903567fdso2873875a91.1
        for <linux-amlogic@lists.infradead.org>; Sun, 31 May 2026 00:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780213045; x=1780817845; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7Nfdh9lJmyo73Y+RAkYTNq+7+iO9zy7FykzaU5yHn8=;
        b=hcHqKhSW1cdlHt1VC7S6KgEbP/ia3OTornEcFgzCcT2XPfiIfi98lRIKBIheShY1Yr
         8LTv9R0b8CKrPlDYdmA9SEeaa2zECvJhOrJbs1Ay35VRVeG8+TjzuL4ZHU0Z7U97bTDC
         0COdaHB+ans6HeKFAMYmBaIZeFh9DP8sRLm9mYAgAQY/6iwFTHhAIOLVE/v9BYUhrF4i
         6XgQxTHnRo3vd5gALublv+7hIu3RAITDZoSNudbu4mC6QcPnhuYBL9Yg8M47wT6iSTMU
         OTZhMjQvACLqRT2/MBmN0/mYbzwrbJnODyeLvcB5BFfQ0hS2k4lSBFgOMpWhyv5ZAW2U
         DreA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780213045; x=1780817845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g7Nfdh9lJmyo73Y+RAkYTNq+7+iO9zy7FykzaU5yHn8=;
        b=nbtFcDrypJsccpX5GoDlcIlsCj0XtxvRvJc7iI9eBsDnsQMNpdHkZZ25KtO1lUcwlY
         VxxFd5mWRpqdWChzdty+b6g5ukv2NiVfLh2Bu8EodaBCKumqM3CwqN/pG99aEwyzFC0r
         d+76WLJwFWjSkxq1GrSdREHp7+WqNieB799keGY/M9x687pWKlXjQnwW7L6waS+K9ze6
         xVOBKR2+JwYEZADl1lBuj6CD0KR/5gyrQ0MJL8/riQOJhXl5OV1YzzAWtY0RqaFwH2bM
         S6l/pAL6fP4I6gBOvDWWouUXL7ygAGmLXEVEbJyeHwLR1KdvaVxz69BNfdvSC10LS/1E
         Hg8Q==
X-Forwarded-Encrypted: i=1; AFNElJ9uvY8e1WrOStB2YOH/qPLYhf/AKcLuL7zq27/+ADjNyBsVKOQGC0GRHCK0qs1/in81CaVwe53CXAj/E4EM@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5psQA7T5mA3AsEo6lqSlrB5Vx0fYdouNAPmxJ7GOPYU2Hta4X
	EwxGjU+NOPYGsFk9xI1RS10sZaJ6K5esp3XmTKflHr2071nQiKBOKdVO
X-Gm-Gg: Acq92OHqMPYAiI+isNtHcia4y6Sx9CvftXEu38u5lzUD2R5PlhopzGEjF8hkhvQV55g
	wUYINkjSCR3jXW2ipz2dRKJafrUvIlS+FkVtO65F6mmQ8GLNy+yklQJb/cS0twM6fhDQLpTOXYu
	5FVBYoL7b7exGDaGImvHibEBjJaH7FqpaShk778dffYQNUjriWuCd105NpXUjaejQX61imAYBNT
	+khQQfd5VSh72mVo/84TBw9G4OU59IC3M2VqN31jmkhBhBi0+z/FjoofJrj3riMLNJDb+hl+Ba8
	ix9+R9U6+IWxG2UKczI4D0rLl6SND1vp/eTnKxyhDzM8ux2zI4wg1SIlSJKLH7swXwJisHrqERG
	aBFtN0EaDOCTFQbHlCk3aQrWkBCsM77MoUstpBivti9E7l4q9bRz7lqIvE+nVqCkL+KO1RzIMRo
	kzkkqJiNML7qmxulMP6ZkTNHHIge7cv0VbAHWyfr8kyg==
X-Received: by 2002:a05:6a20:d04e:b0:39f:3ca8:a33b with SMTP id adf61e73a8af0-3b427fe4d91mr6837181637.17.1780213044907;
        Sun, 31 May 2026 00:37:24 -0700 (PDT)
Received: from Naman.Naman ([2401:4900:1f39:4c4a:1e56:d301:ce43:ac25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8422e712309sm3760709b3a.59.2026.05.31.00.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 00:37:23 -0700 (PDT)
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
Subject: [PATCH 3/6] drm/virtio: Open-code drm_simple_encoder_init()
Date: Sun, 31 May 2026 13:05:29 +0530
Message-Id: <20260531073532.8609-4-namanarora029@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260531073532.8609-1-namanarora029@gmail.com>
References: <20260531073532.8609-1-namanarora029@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_003726_026235_F618FB7C 
X-CRM114-Status: GOOD (  10.77  )
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
 drivers/gpu/drm/virtio/virtgpu_display.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index f1dae9569..5b99cce17 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -32,7 +32,6 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_vblank_helper.h>
 
@@ -271,6 +270,10 @@ static const struct drm_connector_funcs virtio_gpu_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
+static const struct drm_encoder_funcs virtio_gpu_drm_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static int vgdev_output_init(struct virtio_gpu_device *vgdev, int index)
 {
 	struct drm_device *dev = vgdev->ddev;
@@ -306,7 +309,8 @@ static int vgdev_output_init(struct virtio_gpu_device *vgdev, int index)
 	if (vgdev->has_edid)
 		drm_connector_attach_edid_property(connector);
 
-	drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_VIRTUAL);
+	drm_encoder_init(dev, encoder, &virtio_gpu_drm_encoder_funcs,
+			 DRM_MODE_ENCODER_VIRTUAL, NULL);
 	drm_encoder_helper_add(encoder, &virtio_gpu_enc_helper_funcs);
 	encoder->possible_crtcs = 1 << index;
 
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
