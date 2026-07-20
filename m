Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B3FC44515
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jul 2026 15:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5nKsgoGrt1O8vTZOdMrYo/5hF39rH0ClnJtQiy/ZMY0=; b=SttueTs9Ji4BJG
	2pooxeJoRrzcSlYUvvGRgHyKJOxrwPBwHI/gFbYqSoeNW3Oyx4/TXmuqcjc4/1kgqQK25LljBarHz
	Ov+KC35l0ipb7LFylmsNTcBwnpEhRbb84/hi+6xlO/wDudodG9xXe9bFXg/GYVENePhofT4UxTeNb
	Q1e/QhUfhdz/VPuCJQ7wAM6Zv/pRjjmZgozrFqhxyxNJd94e/PkckRldF97/vYJREVTqlAZ6uDUS6
	gHFr56v4tnrU7m69M3EuDUPY2JiG+csmC4psl3Nsr8DnQ+71yOzzvYDAe48cPORFBPNV81o4V6cDi
	vujcuwGhBE+lomLPPfBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq7V-00000007EZ5-0nOg;
	Mon, 20 Jul 2026 15:41:29 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq7S-00000007ES1-1fEz
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Jul 2026 15:41:27 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-475417f010dso5722899f8f.2
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Jul 2026 08:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784562084; x=1785166884; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=46qE/+7MkuQ3i6sxWImy8gxRhDtZKExvMlDvjet5bv4=;
        b=KpbVBrwJHBMJp3kAZgmdqajC844m3H6L992PdhIrTsDDA66Pk3Oz4y3wW9eT0GEFJp
         IJAp1LD3AZIqNQ1UspNQzcNNZkCxg3X4Wl8mIn7WTiaJ99dzb/oHCnhwngd0FSIMcPcp
         STyNacq8b/l3vyMQphlxYhI0I6k2MWG5aX12y3qWpFHIWVelKd5+ur+G23YIgIzsat5w
         MwfKoI5j0NIzl0oN5E1uBvFdX0lAGtuLaFmgE2DOVRvsfky8JgqiXr0oIdPCPPFGn8Wv
         /k4rzfwEScjKPp3LpYfMDtgZGMM7DXsHGKSIgtP9aIz7e4MS7Psnj/iC3aP55oUEWI5t
         fRcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562084; x=1785166884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=46qE/+7MkuQ3i6sxWImy8gxRhDtZKExvMlDvjet5bv4=;
        b=fVQILZW57Xf0HmeP87AxivW/zi0Na9PJU8WKwsamS53RXi3Nz2OotymcswgSmzN9Bh
         2yBxrYDWqoOkzAjyYSGWHvyk+inOzuZZnpnWSUTim/8NxYppMMN5yaAapAIlZ8GmRPk7
         6F1Ql5ued8HX0+/34UYtX+b6x05fLFS8kYFfePopeCFO2kUIUPSPFuc8M9ylxpovI8BP
         3tN52YXn/4M9L37yx+5JUDcxBl9ep5kDIy/prTRJ5vEoo6NYaesuS3OULjha+hHjnCW/
         kS4dPLMqGWwCK96ci4Ruo+u552Weuq1EbTL46ieo9Dp+YenfVMcorRVjKJ+JglaeYzyW
         4DgA==
X-Forwarded-Encrypted: i=1; AHgh+RoPwVzRoqKv0sRRzCV/uoygrbQsqi6/qrNN1UpvD28NVaqiXTMLvJpdkHO9O7Zwh1pWyZ393yN4sQRFXWRA@lists.infradead.org
X-Gm-Message-State: AOJu0YzmvxrYGXebQARQwhScqIBK7LiMFAFpLz67Z1qnKGSFWAEEglHq
	5InjRJJMelRk1uQau3c2yjhgJbz0WZxssTyAtocwIkS2Rrq6IABAfJ8L
X-Gm-Gg: AfdE7cmiCSibQ4pgUe9DTaUhMHNMMGOeVVl0JL7LSMIDxBzNpmTHVEKdZsRLVYAjT63
	sSBnAMp/MP4yV3mF1fYG2iYnPBLI8UIFw4ch0ZCBKKofhsTHeaEzWhBiwPwYGkvj3hnqHKPnW7G
	VKyz6u13UQThIsvBF646vNO4ep+Pv0sqRo19stP20iPmQzvMJkvMd0zxzXNcrI5Aqnf3aFYnfj9
	XH6ZQpXyqYffbxnD8hMNKGQccO0xAfwzB0J0X45ICJZqls5EYJEDw9io0E7i79GmKohpVdwHkkp
	8A7+IzjeEF/rPap8u0c7KFX1perq5N5HtkvHMzSHPewHOFzr5tBF0oFgq/0C0rUi8h3c0EcM8LO
	+BwQ6I48OSlpXLpW1ayWu5ueOFrXErM6jktm35Jw+h6LcPAG16AMZlAAfotcj9S2NngY/Z9CCM/
	a+aLnsSbnMiA==
X-Received: by 2002:a05:600c:4fc2:b0:495:5b02:23b0 with SMTP id 5b1f17b1804b1-4955b0224c7mr79919205e9.26.1784562084325;
        Mon, 20 Jul 2026 08:41:24 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:e9c1:2f80:10a9:c708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm32667936f8f.21.2026.07.20.08.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:41:23 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 20 Jul 2026 17:40:42 +0200
Subject: [PATCH v2 10/15] drm/renesas/shmobile: remove dependency on DRM
 simple helpers
MIME-Version: 1.0
Message-Id: <20260720-drm_simple_encoder_init-v2-10-5020b630668a@gmail.com>
References: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com>
In-Reply-To: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Michal Simek <michal.simek@amd.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Stefan Agner <stefan@agner.ch>, 
 Alison Wang <alison.wang@nxp.com>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Xinliang Liu <xinliang.liu@linaro.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev, 
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-doc@vger.kernel.org, Diogo Silva <diogompaissilva@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_084126_477058_ED28F1CA 
X-CRM114-Status: GOOD (  12.43  )
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

The simple KMS helpers are deprecated because they only add an
intermediate layer between drivers and atomic modesetting.

Open-code drm_simple_encoder_init() by calling drm_encoder_init()
directly and providing driver-local drm_encoder_funcs.

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
index 1a2b9b68af6f..2dc477c7eda6 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
@@ -21,6 +21,7 @@
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
@@ -29,7 +30,6 @@
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
 
 #include <video/videomode.h>
@@ -436,6 +436,10 @@ static const struct drm_encoder_helper_funcs encoder_helper_funcs = {
 	.mode_fixup = shmob_drm_encoder_mode_fixup,
 };
 
+static const struct drm_encoder_funcs shmob_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 /* -----------------------------------------------------------------------------
  * Encoder
  */
@@ -448,8 +452,8 @@ int shmob_drm_encoder_create(struct shmob_drm_device *sdev)
 
 	encoder->possible_crtcs = 1;
 
-	ret = drm_simple_encoder_init(&sdev->ddev, encoder,
-				      DRM_MODE_ENCODER_DPI);
+	ret = drm_encoder_init(&sdev->ddev, encoder, &shmob_encoder_funcs,
+			       DRM_MODE_ENCODER_DPI, NULL);
 	if (ret < 0)
 		return ret;
 

-- 
2.54.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
