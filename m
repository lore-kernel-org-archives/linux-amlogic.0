Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 826D3C4452B
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jul 2026 15:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+iE88nFKDF6cvvKUg7jDUUY9gkpeCQnX+eufapiNOw8=; b=WyGog3GFavo4GY
	2pUyktSvXd5Nerkrw1rqpN6nKAqEaVDg1x9KRTWJUiDkHp9JgNAHg86vbVyTuBBTFsjYPUAcD8JG2
	lO3HFaPzAgheTHmuuE6oQNyGShr48iccXzOJK1rqR7cLrnQM2/8h5bQ+5UPt2ECnFc0JkKQuvgv44
	hy4A+3lOpBrLsxLdoLeyTn3EAT+MlrxcasucNnPO5HJ5ZI/0yr6VLY7x+sc7SjY2ZDyUu0IZdxxbn
	hvaheweaZ0fYC/PRVpYln7xxkLDzsUd0CLlTIDnvjK5vRmFqb3r76T02vN34VtXFm54piDrll97k8
	UP9ffHYdutTpOG47h1QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq7Y-00000007EdP-3AXY;
	Mon, 20 Jul 2026 15:41:32 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq7W-00000007EYT-03uh
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Jul 2026 15:41:31 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4955adb04e8so10429735e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Jul 2026 08:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784562088; x=1785166888; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UCTzuFV7eFCGxIzO9ORcmzHtSM3Ggk/jrKBR0xDgYaA=;
        b=q6qy8r+IrXNTxMVyiVU1iGY64PhhfAAxiaO0AioYO2c7Cn+VjSViVTZSCx8UWYo4ol
         OJZMLnnkOFnDdpa9Hno8KuUn9P4UzVYFdqt9+Eni6o11mt88xe3sNMCe7JAXaw/sfshj
         XoKPc3yS9o5o8iRYY6egbO+FOo5V0UCyKhtcHfbpYu/EVuCHbAIY6fU1I7dhQPgBU2va
         37PIm3BQruen60HOGCT0e9OsxTiDQnxCWrSYY5Pas1xhS2DVBCGBihGgNYjH38XI6Gly
         ooeWmRXgAYOMWmGgtkR/irih6hZsVfBorwi+VXBG18Iodel8lNbFdS5/3ZMK4uyMpPMJ
         JtFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562088; x=1785166888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UCTzuFV7eFCGxIzO9ORcmzHtSM3Ggk/jrKBR0xDgYaA=;
        b=cGlH1fzsKgQNFHIe5WOU9MJe0NVDLI+9bmblb4kWdsYy14yCyWF9EOVlvLw2uDdA8l
         nKwtnjOroRbROlxbyIQ5WAAZzJGXRLtlsEnHbF8Cvcxl4RI2zPy8nzpgNyCINXyw/LC0
         GI5wiz934mVtGpoRxqHklESmPlbkky9Y13L9U0Nvij3lOWk7UJnX0R+kyGnE3kBj60ze
         JNPE99OX7abeaneKFlKX+MVPoXWU88JrvLkHd+mgesqXW1q6gOuc/7DPK95LeKcf/1+J
         GUCnIg6P2tbEJj4mhXzKrhGl7y9mWhMOq3eRcd5jjag6NNi+c679MdYd3JlL1YOOVzWo
         23Xw==
X-Forwarded-Encrypted: i=1; AHgh+Rpvs+Nkdj3Zl+9u/IFJMT0XEhxI/yFyjUtEw4qGxzeRRqXkblg/Tk0YyEg3f40CTO0jQ8chH9d+gzZZT+5S@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2YAFCNjFOHo4Jgf1p9nhR6yv5GyeWKfq6kTIDlfGN5mPd1234
	MfI6WNU3jOTILdqNYvJODp7YgOFAM8Iwix/4P3IAS7cUmfd25QL2TeD2
X-Gm-Gg: AfdE7clRYqBYUiarfqrHiY1gqZOUSk+MNuRyQk9rSjFsKwUmKOddx+mohNKKit9immm
	7Ps080at52lmPSmskyrDlO6L+0ay/ZaPvELPqhu/jBSQ//JIYXtkRrnwcUvDCeLdfGIjoBRlE/z
	XsL/5RMWNOBrYqROcERzgMhYQJjdiQjF8wEKEZ64hJpEK2lzJz/dHFu/pouegeTk6WF/11bsZ6O
	USoZ4HBJWaF7q5ej+d2ETBzrjus2JApWEouBgEapZrgbfbzxTAsfZiu9qeRYRZti7o79Fm48C23
	5VPpBnvPZShSl5AvCbkZoyHt4ui9pjLoWwtYFizdFpmH7WJTfqeLQXImhq35uHy5gD8yaXblb2h
	Go9XMgUw50tq2qmftmIgeJPGA+H9bBhqz6X83ZIyK1Wh4y6whRcycUCp3+HYNGTlxsf9VI1qEvJ
	GxT05PYQL50LtMo5cMeh+U
X-Received: by 2002:a05:600c:1d1e:b0:493:b6ee:fcb7 with SMTP id 5b1f17b1804b1-4954a3f39ffmr153406895e9.14.1784562088052;
        Mon, 20 Jul 2026 08:41:28 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:e9c1:2f80:10a9:c708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm32667936f8f.21.2026.07.20.08.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:41:27 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 20 Jul 2026 17:40:43 +0200
Subject: [PATCH v2 11/15] drm/hisilicon/kirin: remove dependency on DRM
 simple helpers
MIME-Version: 1.0
Message-Id: <20260720-drm_simple_encoder_init-v2-11-5020b630668a@gmail.com>
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
X-CRM114-CacheID: sfid-20260720_084130_078624_7FBEF588 
X-CRM114-Status: GOOD (  12.04  )
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
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
index 15042365dec0..62c5bd3277da 100644
--- a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
+++ b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
@@ -20,11 +20,11 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_device.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "dw_dsi_reg.h"
 
@@ -687,6 +687,10 @@ static int dsi_encoder_atomic_check(struct drm_encoder *encoder,
 	return 0;
 }
 
+static const struct drm_encoder_funcs dw_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs dw_encoder_helper_funcs = {
 	.atomic_check	= dsi_encoder_atomic_check,
 	.mode_valid	= dsi_encoder_mode_valid,
@@ -708,7 +712,8 @@ static int dw_drm_encoder_init(struct device *dev,
 	}
 
 	encoder->possible_crtcs = crtc_mask;
-	ret = drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_DSI);
+	ret = drm_encoder_init(drm_dev, encoder, &dw_encoder_funcs,
+			       DRM_MODE_ENCODER_DSI, NULL);
 	if (ret) {
 		DRM_ERROR("failed to init dsi encoder\n");
 		return ret;

-- 
2.54.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
