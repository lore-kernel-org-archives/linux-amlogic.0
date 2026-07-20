Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6924C44520
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jul 2026 15:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bHRnoBtgVCK4BGXnR7+S0qXIYPy36Jb30P37Caj0hGM=; b=pUjygYupPrtnZq
	2XJmQETBMwH/m8keNghkpxCHpVir7KSfeE2DmGWHoSuR0A2XUra0DMEfbcgXi84e9mOwzL+BWMWtn
	1Hb59aNMmaLZGaXupKqfCei/0vPqJAP2GRZM0yW2f06ccUNji8dWQ5n4bwhsK5B/S3kbjr50aDRbT
	4Gb1prUf9j08EsY7Sn4pFkCm8dHvWOK/gxjCOUiR2vW1iE83dsiTvsIXE8zhpfmCoEIZTpeWILtlw
	2yclaExGwByqg/UgC4K6aPSBJq+3eKxnBj2EAi/8KC3QFtfTdfrbXd9MqJqDX3LY3WMQp8WluhXGl
	1Or4ZXTWXKqrVOR203YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq7P-00000007EPj-1Rtb;
	Mon, 20 Jul 2026 15:41:23 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq7K-00000007EIR-3nhN
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Jul 2026 15:41:20 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-49555a0e68bso9438875e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Jul 2026 08:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784562077; x=1785166877; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3qoMRiXvV6BHSei+lkJBYDW1cqZXXpht0BCmlOitIE4=;
        b=Y0EwvAfNLB95Irq8XCPkUnHpreiNxOX4OG7Sg66RZLSZFZ6LaIZ7TabdcUKcjYf3YB
         w2tTtpK8AWq/Xo3A0MhUyqivyYq/ecb3bc1s8TZ8GRQuVzskNOqdYU7lD0SqvAE65KvK
         5luco3im3QkDr1fQ+4fbGcUjhU99xvWiPsEqLCASV7mvIEqVM9xkOyaGflqPiWhVOpQb
         lKkT44dmMJX4GgfzWaGjg8j0iXG6uEdTJJKbgwUtWPEXtwEmhwuwIncFAQzJay5ZhzJx
         3tUF27kougIk2f0KLNY/iiLh40V68hWbH9N72v7i8LMqOIimyilXB0leB/uQdFh6aXEt
         KDBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562077; x=1785166877;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3qoMRiXvV6BHSei+lkJBYDW1cqZXXpht0BCmlOitIE4=;
        b=Ge/xq5abIs3kjpqYxnJOL1zn996f9dK8SCslcEA4O7j6pRWtBuUeQmakxrN05urOlF
         /obycZgUIQ6+ueIz0c0evmYxu5F05CccEAViTF47x8a2x1123oIXynyJ3qTi21nApXTg
         VIMMufKIZyugkUQZIsZpnlaDnKc8kOV+ekmPh9EkGjZfQYe+s+3c6msVK1f7DfE1/FPF
         egKvXk5M0PPtDT4ExxfsJX0LIPgvLf/12tPoVj0X5iTvpluy7v9Y/EVwyJvY6ZGJbGpS
         FLuNIb0RhJnXyKKsm+3B4Qzr07zH3C907lOH/meq4T1ue7eHDVD9kumwBZwfKeNhtDkF
         aUww==
X-Forwarded-Encrypted: i=1; AHgh+Rqhy8KtecrCUvzVrQdqHWLTROS5FYlCi5yq8UbNhXBKwYMco5ranbFNHLlkm4kvr1JeaIt3aB1Wj2WjoXwe@lists.infradead.org
X-Gm-Message-State: AOJu0YwWBUsuAVYzeRkd/P0g2NYUg0sf6wJuUCNRt1PybbgTNc/88xeW
	9ZTKOjclW5/2ORUy/4k6kCoy3o2LeJ4aNyY7Z1ofUd7lcXwt2iHFlWPr
X-Gm-Gg: AfdE7ckDI6l92BNwbLnPbfQoSeisbPREhNU00vaRf3lerp2JYGbrNtNROjk571I5a81
	7J03tstJtfykydr02VstHBZMySnx5kN7FZdZ4yU9k9B5uS+CJsxpxCNpv+MBQ35uREW+xbC9tbT
	Eq6UvggR1Jjv4zrLpw/einENLcIO06djkDGJLqSm9/UK0vq2IiugCWmhoXkPuYlA9E75oYpcSOu
	U+lkLNOYn0anEcIZ5UF8U4AVqZVlaV2LYpDKJCujPiGrScuG9MuqZeUfIrgMq/I6UlYxfFs0I3o
	jm+gQva4uBKFtFyWc2dN0YluakEVoOYcZ7SKQoTdB492jaljUJr29zMHy0dKttE0k8KbV86i/Nu
	3gukzalc6qptcK+DcLjKEKi+NPQ5XCJIpvjClUDut9n31tfxiQfNYAWb8CUhz8D+l9aCKzat+2P
	hYrmUy7wgbIg==
X-Received: by 2002:a05:600c:6b69:b0:493:e583:7053 with SMTP id 5b1f17b1804b1-4954a41431cmr113435805e9.35.1784562076586;
        Mon, 20 Jul 2026 08:41:16 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:e9c1:2f80:10a9:c708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm32667936f8f.21.2026.07.20.08.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:41:16 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 20 Jul 2026 17:40:40 +0200
Subject: [PATCH v2 08/15] drm/imx: remove dependency on DRM simple helpers
MIME-Version: 1.0
Message-Id: <20260720-drm_simple_encoder_init-v2-8-5020b630668a@gmail.com>
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
X-CRM114-CacheID: sfid-20260720_084119_171392_96EE11F6 
X-CRM114-Status: GOOD (  12.30  )
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
