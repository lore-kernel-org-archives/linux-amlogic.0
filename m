Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A98C44525
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2026 23:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+iE88nFKDF6cvvKUg7jDUUY9gkpeCQnX+eufapiNOw8=; b=yzRewwk2NJvm7P
	AwiDNUxpMzwAJ7B0JMgcsdIZWM7HxzBQdvaP9E80QqXhRrHTtVEdOhW7iYWYEAfrY4RfttOVkiNgl
	c2EJua7/Y9+IwuXVxa++sO3cVG4tCMcPTkk+9F6EZbMWY2p34x9VUvBQKDcUNL8tiF4j5IlkpW1Tk
	usYdpVy2U/kGYUYXo4u25XBYOpGka1QXW6cd+PdKLXVNM/PyTks1WSnkLL4TAcSSfdbRPtMasDqT4
	4ICVaaeStvw8CfZXkjfP/+y/rl/A0dvtdI82ZK43Rbd5cebMCIwcTtxUghEZ9Gg+4WRLUq00oliSF
	oB2ZthTGBYdD/XwMtXGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlEaH-00000004cGv-0f9G;
	Sat, 18 Jul 2026 23:36:41 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlEaE-00000004cBn-0YmL
	for linux-amlogic@lists.infradead.org;
	Sat, 18 Jul 2026 23:36:39 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso6889385e9.3
        for <linux-amlogic@lists.infradead.org>; Sat, 18 Jul 2026 16:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784417796; x=1785022596; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UCTzuFV7eFCGxIzO9ORcmzHtSM3Ggk/jrKBR0xDgYaA=;
        b=lSsyZOfe7NiC2Mc40EcaW1wzWmtipGbsPJvPkre6sY3bJdHiVY4FvzqqLIWy5fL/0I
         jC1aoHDoPlqZvdMgXDQbZIRv/DhaZUuJWxhKy04i5FmR+v21v2JliwRiYfsOTs1zQC7/
         J3zZAQwq4vsO7TY8O6qR46F91RgFAlNEU/krgIn0JU/UgfOPmyfnW66s7AUnfNfWgNc8
         EY2ghzG0yjHk8jy0y/DLrwl/JYgOvDjEup1ZLoV/gonyXh5xj899MeYJrFzQ7RU+oFpk
         DtFRik4YkaqT69zZX29BMiqMB9vvr2rQ+vfb7igX2LCwjF9SWiLjHKyHKXMgoBRMR5my
         ZVQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784417796; x=1785022596;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UCTzuFV7eFCGxIzO9ORcmzHtSM3Ggk/jrKBR0xDgYaA=;
        b=pSa0dTALuhxHqp/9UPz/zvNym1ChOqdhC8GJemu1Cnwy/C8s9bdI8JSmK9gKbequ5D
         mlfndbCQE6MWloe0usnyfXQ7CuY/wSx+X2u1EowIlBxVgKwYqNubjejTAimreYCYdwKZ
         1QgWZIBBFQf4c1ljzJed3JArvoqnGOiI+rJZKURwZi/HWJ0wN2i1iL0RZPkKjvn6fiT6
         WhZMSf3YVNiBszGVcRYABV7BPSlrsSk6J/0vAdySoo3MJYaMACq8iOXSdFHs+cBDAh5D
         YdhD+TS6ZtwgWVjrGdTZCTV2h1KqsCDHRf98m/ZB6pDrTcNJU+M05rd30oaN5+NPYMAh
         5oXA==
X-Forwarded-Encrypted: i=1; AHgh+RpyOSN0rnPvx3YXQ8wZKbmKzTPUDACKnul8/uKXpZ+oGLTRj5q778P6SmsBf5TXv2u1WsNAwAHHviRZ3j6m@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6v9uBIEszgv59TftZEuVN3UYBfbh9jqiJBA6XmrILb2rWKR6F
	V+6HRs1YifZhQqvIYZWkDQITZ283Z8lKux2ANc7/tsLApqiFjcgm60dj
X-Gm-Gg: AfdE7cnNBMIUQV4uxFryGiuq/rW2gFtPvFY7S8MBl/SAOnLBRv16heFrjsIgvY9qQuM
	AEeBNMfi71fnDlpDBWJft7mPHiHeU4h6YqhWb3KipclpavNTeIQHNqo3h8zeNs6hHyR3ni2SAsP
	bPwRSFSHjhDbRnzVK0RqM/2tRBap7xrEULtpMkSxcvb5KGsjxUw8aTaBVNxJ8g4HxmvQQHJRfBv
	HXHKksTp+rBc3RQwCt2vBzHaO2byn0v66L20/Pt+vhFwzu2xeQ+PqpnOdYgc4B9qJzAwSCHpbh+
	2oK9HhblD1PemF06G+cwauXdOvSj+gOxnNlvj2UYaEWSRKv19jbZ4sjdF2yhnbbSLNT7f+KTHUN
	pL3Z5ouFFRI9NSyjN9swmF94XJ5ELvp0X39Vg8fcpFoMO33VvNH0wRLOe0KkQiAumDru5ApCgyu
	ZI2nEtC7ALIw==
X-Received: by 2002:a05:600c:3b91:b0:495:4c62:9d43 with SMTP id 5b1f17b1804b1-4954c629e5emr98503215e9.34.1784417796224;
        Sat, 18 Jul 2026 16:36:36 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:645b:9e5c:7fe3:c09f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a24b6sm160964675e9.3.2026.07.18.16.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:36:35 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 19 Jul 2026 01:35:42 +0200
Subject: [PATCH 11/15] drm/hisilicon/kirin: remove dependency on DRM simple
 helpers
MIME-Version: 1.0
Message-Id: <20260719-drm_simple_encoder_init-v1-11-a78c509e3062@gmail.com>
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
X-CRM114-CacheID: sfid-20260718_163638_256537_1CFB0440 
X-CRM114-Status: GOOD (  11.91  )
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
