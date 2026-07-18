Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1C8C4450A
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2026 23:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z1ofRNVreuvca7Wefnm1M7dCcPW52+z3CYlyWw2QwF8=; b=YIaQd0LmHcULq4
	Avq4Cj8N05dFM0aSlFFZ4+0juWfZBH/4A6s9LZ8JQRiZ82S2sEMxMxssANeNqdj78Br5QdMyRr6vA
	fec+yhAjOB6HV9E+4H0o/ElytOlrBfh0gCM+waxhPZ2jPV1zUp41AkqckK0ZM2gHkWsZusZawsKUD
	HwbxT/Fyd7LBTeIW1/FOWINItQAk1a02tbZeqNdFOU2iJqhzEwrvy+pY4KOCtyA8QOy1MJSau1vAR
	ykNlosWPJj2MvBPJS1DGQK9zYDQgyMGDpBw/FvhnSUk2bS0DS0f/7u97eHCwUfOnFqpB+kEciRND7
	v8lQNecg/2mvBUxUSASQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlEaC-00000004cAh-0GGM;
	Sat, 18 Jul 2026 23:36:36 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlEa7-00000004c4I-3ZLq
	for linux-amlogic@lists.infradead.org;
	Sat, 18 Jul 2026 23:36:34 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-495590dde14so1122305e9.0
        for <linux-amlogic@lists.infradead.org>; Sat, 18 Jul 2026 16:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784417790; x=1785022590; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o8dh5aQckfiP03vdZ5nRuu+LA2oP+sZO4zs8QLavR/M=;
        b=mOogGcxtjTvN3SZMOh8q0vxsKiTcWhy8PhXda/9W8Qx4g4zmaNq14w/ze3SkbXxVXT
         IYeQVL3wtQAd3Xsib2mroarQq3hP9QkXInGWCe1MHOS8EN83a0ebvWS0BZBooKpQ0Wmv
         BBZfOmGvDpkjZwBoqPYMGxUFkq7OdmO7sYFAHqHyTGxzrF7u0m6ChVbyaZ6byvuneaoU
         XouwJII/Hq4yNBw4fWHxRIPtqwm5yBf9AxXBvGqEAVn/ND7hnjQ9lh9aB6okE31GIe8M
         cwlWpmgbSvV2clBXLdTyr8TN2utnc0hAGp5hAu/AIE1o3hoo7VWvoj8irwvdMnyVFrPd
         DxOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784417790; x=1785022590;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o8dh5aQckfiP03vdZ5nRuu+LA2oP+sZO4zs8QLavR/M=;
        b=oeY/45LgQ+z5fQrgh3zgqV/jJMzF2iH6QDRQ5Uas+E00EyJZO2pso2wnf3p5RYS1yi
         IAEy7227PF5Lx1pubGINUhpW1U0r3nZ+yZbePR0M/UqCdvjUkgO81vqeTE+ovXNBWNeK
         p6kh8HLLW05bU0CM1sw8GgwH0rbIz67JPy96U9iMV8r8V6c+dm9ZrLwuG3e4G9r208oR
         zIXkJCgrdEttTBqkry0TLl7JUJ3xKcWBocBMMvgZOgBv0O6dBzIc+k1QZ1jW+qNAJrox
         x2YCqkiz4fMRJxA0xPxX20+UCOtxPrJwPERkGnz3nIp9YBXn3mCV9d4k3bcD55QEem7Q
         7BQA==
X-Forwarded-Encrypted: i=1; AHgh+RokrQU9jjYSJFS+M5s/kWS6TCp6XRQyTuE6AJUBKii6ZaQNX0WAzwhSVBQaKvPRYS173UsqnqtLdYnuh+Ec@lists.infradead.org
X-Gm-Message-State: AOJu0YzNHjxSmgwrTZPPOTKvk/b0lFthLS1asvNWD/01hC6xAXPOxZVz
	wdRn6r1BfL8Y6Z6SEncPabATVas0H30RIBaz2G9rgthHYd18Vi99ck+w
X-Gm-Gg: AfdE7ckRHn/OyCm2inYlqfO5p20JYMiWfYA6G6Jfz171qzuiPY+E6YkCtfeRE7hFDQV
	BxdUAjOjJVBAoAV8lAslmEULDR9BKOKoxdglmMD3n8+c9Zr5Jzt0hH6q8BX8Y1L2dWdfWvunXV/
	tiG8pnomZgrneYJpyaIs+iN5osgCEo69LOYzrjWGoZU/AwHHxDdjncJsBeDhcEg8x5VTteL9rKG
	sTsMkM5a1/wn8xLDwo+r5tN2DqFFHQx68iJRp30iadyVbzQqooISuOaWVQOd2wJaVBzPHlwB84p
	VM21VEfzusChMJgmSqsTA55QNTzIhZ3l6R9Ch53HGDXcHabbvOXPhD/YSJbgBcA+Ck7u0J6zPN4
	LjQInQ4QlTPk0Cmkn1mUETS5Q3TYBxlyCLIrdkPIod3n2FuPdPlr1y6jGGKXSLx63P+jtAltLhI
	9iXXI9OazEXw==
X-Received: by 2002:a05:600c:6dc9:b0:490:688b:f9f8 with SMTP id 5b1f17b1804b1-4954a5151e5mr67150965e9.27.1784417789982;
        Sat, 18 Jul 2026 16:36:29 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:645b:9e5c:7fe3:c09f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a24b6sm160964675e9.3.2026.07.18.16.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:36:29 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 19 Jul 2026 01:35:40 +0200
Subject: [PATCH 09/15] drm/mediatek: remove dependency on DRM simple
 helpers
MIME-Version: 1.0
Message-Id: <20260719-drm_simple_encoder_init-v1-9-a78c509e3062@gmail.com>
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
X-CRM114-CacheID: sfid-20260718_163631_930777_3C4460BE 
X-CRM114-Status: GOOD (  11.76  )
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
 drivers/gpu/drm/mediatek/mtk_dsi.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 3f3f56eed3f9..7cd136bd9605 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -21,12 +21,12 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "mtk_ddp_comp.h"
 #include "mtk_disp_drv.h"
@@ -913,12 +913,16 @@ void mtk_dsi_ddp_stop(struct device *dev)
 	mtk_dsi_poweroff(dsi);
 }
 
+static const struct drm_encoder_funcs mtk_dsi_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 {
 	int ret;
 
-	ret = drm_simple_encoder_init(drm, &dsi->encoder,
-				      DRM_MODE_ENCODER_DSI);
+	ret = drm_encoder_init(drm, &dsi->encoder, &mtk_dsi_encoder_funcs,
+			       DRM_MODE_ENCODER_DSI, NULL);
 	if (ret) {
 		drm_err(drm, "Failed to encoder init to drm\n");
 		return ret;

-- 
2.54.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
