Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFEE5C44521
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2026 23:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5nKsgoGrt1O8vTZOdMrYo/5hF39rH0ClnJtQiy/ZMY0=; b=FX8F+jWcXDQjpE
	QVhHNswVQPjjvaslIkM5jHxXITC8a5Z/+lC8r5l7YgTrJsLDxbxyuc63HG2By0GSNKLblzoOrCh7+
	PXVVn87UGJfTOqVR8Kq4jWCJfwG7lStAtBLbOBlu2bxfG4oo9rPPI+9hgu/LgQUQ7S4yVTt7UxJD/
	rBfoxlxQq0jqMRMjSzjIUw4dDy7rO/JV9INWbljQG9gxDGNu9f26jq4o32r27aBPXDEIUEqZxm/DG
	d17nmEB9G8fNU59LjimwPJBH/U03tHh5zfdIqERTEiXewk11IVsTUQx+gKSZlqGzbEXmCmQFwJ5jr
	EJ7MdA7U7EUoLJTtCEGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlEaF-00000004cFO-3XBq;
	Sat, 18 Jul 2026 23:36:39 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlEaA-00000004c7w-3Hcj
	for linux-amlogic@lists.infradead.org;
	Sat, 18 Jul 2026 23:36:38 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49546c690ffso17985435e9.2
        for <linux-amlogic@lists.infradead.org>; Sat, 18 Jul 2026 16:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784417793; x=1785022593; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=46qE/+7MkuQ3i6sxWImy8gxRhDtZKExvMlDvjet5bv4=;
        b=XeTXULK2lKQKbyCDfD2OrjaJ3pypO+zea9cIoqHluv3G8fWQpTxC3ZtqDxHs2aY8bP
         qLeVVQt8soYlvy8nhjbcVP+tXSvMZk+5v8yjLbtSlAB45yMROVezEgoDGLNrmKoFZyeK
         ixOjXLbTknQwOlTapFkVMoDUoe4yquvX0ZfVoiCYQd6MiZdCaFEFux4evKhMGhtMUWTA
         NKuhwaE8XuApBy0pxC8UEx2e+23pVND9WxrzoEixxLyh+Sv3Xc2BlE1IOpxRBG8hS4lY
         O325y8wQQMH90ODfsLbNlFlIYPdPBXb2BneqUMhcQrv/FyPrw+u4HTaJwM06QXFWf5Aw
         gM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784417793; x=1785022593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=46qE/+7MkuQ3i6sxWImy8gxRhDtZKExvMlDvjet5bv4=;
        b=r1zhXe4yOEBLXDoXKNeGWgUUsZMlYqVHsbBd5X9KsJ9b0fx2axLvTHGa4iX4OHs2hQ
         plvtdhR3ArDkRTyZJGJO5zt2nzO0mmAVBpcHOrMuSwvLfi2NrMVDG3kghRjyUhTQGhd6
         zk5hTDePLYTbBoE6zTkl8qDKvYvVnrfdHC0pTSfO2Cv+FT7JfLzLV2yRrsHIndGsHx8K
         ACwxX4ajx1DvRiEnPGot5YGL+XAQaaQwXZ73+J87M63IIQOFm4+Qf0szOkrIe5BkaNHa
         11quiVVaLyk/gl3IOFrlJTRz0VYsbMZAo4ypkaYOC4nin4M3fgiKN+oewDJ+x3OIFODz
         1xKA==
X-Forwarded-Encrypted: i=1; AHgh+RqhIA6kHWzprTvBUFygXPiyefWwbknOAJVlyc10Yzqd1ktqrD+xoRFswQELcKJ3RcF8m4pVixOP4htwN+s8@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8kQv42pYUVnMfu37Ya+9WGIkDL8+03h7y9onSBTHIc/iRUn8D
	1ssmk+y5r4yPDTklvmbMEbnwV6s5SpkCnJ+ELCMGHFaEAKYoRFkBL5IZ
X-Gm-Gg: AfdE7clEs+zaqBjpPqNR0KLQRx7poVmk+/yZ+QB+290pKQIIQ9sKqN7LPhkd2nI+xtj
	IzKcgqat9flwo0u1pRbDOq/pUxjKxuxd5x/jUDlJ/inkojq7e2UHaa5+HzWdMZiCZ6/+ZOeXk/I
	t7fS3w35YBTZL168mFXCG4GtkCpWfrBldalpk5lQQAYMZ/uGlWAEeyygvnq/lKFE2cXYDY097GA
	uRy+kWaACpyBNGeRqiqdd8msRMC8tMz0C12QK3tsB+hZg0eRyBQyu+gW/CN7wGhSGfwXNEQ797J
	/WPhrPaWwH+cuMbm2zm0vJKlvp/yrYj/9MEabqpIOsVKct7q91ONETpHp4ldZLFS1lIQDlBa1ec
	8S1HuPB3nR3LCcqkhbvvGihjnYDmbfylmLa8E/JkoEk2Hf/62mHcaoaGV8bHoLmi+3jXr4EOrFn
	lZobvxrrZKRw==
X-Received: by 2002:a05:600c:6287:b0:493:e79e:da63 with SMTP id 5b1f17b1804b1-4954a51319dmr90732155e9.34.1784417793083;
        Sat, 18 Jul 2026 16:36:33 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:645b:9e5c:7fe3:c09f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a24b6sm160964675e9.3.2026.07.18.16.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:36:32 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 19 Jul 2026 01:35:41 +0200
Subject: [PATCH 10/15] drm/renesas/shmobile: remove dependency on DRM
 simple helpers
MIME-Version: 1.0
Message-Id: <20260719-drm_simple_encoder_init-v1-10-a78c509e3062@gmail.com>
References: <20260719-drm_simple_encoder_init-v1-0-a78c509e3062@gmail.com>
In-Reply-To: <20260719-drm_simple_encoder_init-v1-0-a78c509e3062@gmail.com>
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
X-CRM114-CacheID: sfid-20260718_163634_923327_0CFFCC04 
X-CRM114-Status: GOOD (  12.41  )
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
