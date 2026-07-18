Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09E3C4450A
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2026 23:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bHRnoBtgVCK4BGXnR7+S0qXIYPy36Jb30P37Caj0hGM=; b=1VZHLYZbl3X+FT
	/Zr5xi/tcWDk1nwUavTKpFDsbtuaAdjGLZibCek4JzkVehBv2NctvdW++cDGg+MNEI5pQitTUwobk
	FPDLaGi9CkHwWoa1qYfnojWAdpkD8kTBzJxyzTWQuf4BOgWIj/CBBuTKgsuc0UYyTK/fUVdfPy1bj
	xvE05jPdIiL3ocBtnWv7cG0g3DYuhA6fLNJt+jag4lBk/q0mGjfjIzkIYwhg5VtoRgS2hY+f3GE3/
	M8OKs2NHGLSd+SEjNk8W0HqqNF1cbDhbr+Eu9fVPYQYRJH2YVVbTEPUb1dfBuQHyOrDOui6aonZdS
	7mki1NgvI+0kSbuyrBGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlEa7-00000004c5e-42z7;
	Sat, 18 Jul 2026 23:36:31 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlEa4-00000004bzs-2t9Y
	for linux-amlogic@lists.infradead.org;
	Sat, 18 Jul 2026 23:36:30 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-495590dde14so1122105e9.0
        for <linux-amlogic@lists.infradead.org>; Sat, 18 Jul 2026 16:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784417787; x=1785022587; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3qoMRiXvV6BHSei+lkJBYDW1cqZXXpht0BCmlOitIE4=;
        b=hHGkh3H4Y3eLv+bePcEodfyPRSBuoSu4Nkt+zo/81MMYkLqYvvwJ6fzO9A2hn8qKAr
         RacOZaJP5ojj7rKxpbAqtJ6xZSdbzSuh+u20JvIJaok+HokP4Eo4J45PMKg4ShBn3imT
         iPxz0Y0+GcXrlyg36yLSARrCHIv0vhG/nzWFB2yNTwlD/fQelbPoNVw72+/RL8Kgu3yo
         6qV/t0e8VKlBodRmzjvGxJEutUnO6/OOC+4wFjWbf/gdJKPUX4a0zxr1KEYelHkTui7k
         U/Q0uWnP1mSQ0NVBwmp5Lat6scQjL+g7IomMKFWtjT1kolYDy70OOE+HlE9IoUmQRUKU
         LRHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784417787; x=1785022587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3qoMRiXvV6BHSei+lkJBYDW1cqZXXpht0BCmlOitIE4=;
        b=UJQ68aSYb6YjfEfTUKEqIP23i1i8Z9cRWUDC6Y6YhUB5oAr9cSjzkOz+0YWarSUcyM
         AGdyDL/5avjjkk/0nvidYiEl9C9VCSiAP37GxPXzvu0fgqRHZaBon8IZ9cm5pC7j8dIR
         Ri7cvy6vfU0aAU/vs+ctfSEAbZ9RzN55Uv2gdKFeFyv+YYUau1hP4nIMJsa4Dp78Gw/b
         LQ1/PQy/DVNIdgwWXz3FdoGpVd/bD+Smjmy7Lmbvg2ydR1dYwdtTWo1Qwf8P3eWhbEsr
         ooyV430WQTR3kksfPA1iVjC0JImeIoESa9nm+TuGEluGZJhz84B3z39cSSAmaBUhdjLd
         nJrw==
X-Forwarded-Encrypted: i=1; AHgh+RoSwnu7J4KH9L/GB67j441Kmmro2LFvi4TyrCeYVxqQmk1bpwg6rDgZ+m4UhehUT0bW8+E5Xe2yOzZQvQ5l@lists.infradead.org
X-Gm-Message-State: AOJu0YzWcWfn6YdvAwZN4kqsY+Y4yfAqxHp9r7uo4119+mMGhnbfZss2
	0jUORePttuSypJ1OjCudguGm9oN+JgrFtQ6hy2HKxp5KEamA6k3VlyYV
X-Gm-Gg: AfdE7cl5ly2qy3cXA4hUUu7u/DYXtORRJZ9XHp2byit0kGSCxPzW0S80MA4lG0wfwJY
	8tOXs7/pxOX4fe9LHMvWHNsXXpHrbkmYh5Dtup8fPTJSP8sSUYUiaxTDFSk5KS4ESi1gJaqWDrB
	AmSl01WS/0rz0TabEqndMUTZC3FNw+2KZogxY19kFVtYXtf+4wdvxJbzA/lmgHBq97roO/JYaYy
	ibhj8sD57zgAUlDl9cWdupA69PH/uPG1IKm7eVtALwOJUVehRe/UrIovQnoPLHjweZckN8ouRgw
	EEdJ09LM1GO3Bj4Z3B08XhcodZNzaFiETXjYvmTU6tYoMcITSdiCIxZ/68jc/ZjHUfk83aF58jS
	3YAPNVqYfNNOrXXbdXnosKaXqWY6T4T9KULUr+LCbnOCkTxV42KMgCvREndY5DzqjMlKL//Y/PH
	yWoOaGnfoqVqfRvHBrz83D
X-Received: by 2002:a05:600c:a42:b0:493:e983:806e with SMTP id 5b1f17b1804b1-4954a3ee98emr95800615e9.3.1784417786829;
        Sat, 18 Jul 2026 16:36:26 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:645b:9e5c:7fe3:c09f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a24b6sm160964675e9.3.2026.07.18.16.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:36:26 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 19 Jul 2026 01:35:39 +0200
Subject: [PATCH 08/15] drm/imx: remove dependency on DRM simple helpers
MIME-Version: 1.0
Message-Id: <20260719-drm_simple_encoder_init-v1-8-a78c509e3062@gmail.com>
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
X-CRM114-CacheID: sfid-20260718_163628_814414_EB787E02 
X-CRM114-Status: GOOD (  12.17  )
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
 drivers/gpu/drm/imx/dc/dc-kms.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-kms.c b/drivers/gpu/drm/imx/dc/dc-kms.c
index 0f8cfaf4c4d1..a9adcfc68b84 100644
--- a/drivers/gpu/drm/imx/dc/dc-kms.c
+++ b/drivers/gpu/drm/imx/dc/dc-kms.c
@@ -17,7 +17,6 @@
 #include <drm/drm_mode_config.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
 
 #include "dc-de.h"
@@ -30,6 +29,10 @@ static const struct drm_mode_config_funcs dc_drm_mode_config_funcs = {
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
+static const struct drm_encoder_funcs dc_kms_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static int dc_kms_init_encoder_per_crtc(struct dc_drm_device *dc_drm,
 					int crtc_index)
 {
@@ -55,7 +58,8 @@ static int dc_kms_init_encoder_per_crtc(struct dc_drm_device *dc_drm,
 	}
 
 	encoder = &dc_drm->encoder[crtc_index];
-	ret = drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_NONE);
+	ret = drm_encoder_init(drm, encoder, &dc_kms_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
 	if (ret) {
 		dev_err(dev, "failed to initialize encoder for CRTC%u: %d\n",
 			crtc->index, ret);

-- 
2.54.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
