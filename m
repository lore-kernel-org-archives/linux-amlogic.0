Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF3FC4452B
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jul 2026 15:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z1ofRNVreuvca7Wefnm1M7dCcPW52+z3CYlyWw2QwF8=; b=kZaV3JETpWHd40
	Z8JW3LBkXrfU+RFk9eWM63eH6fKcdijVwR+XkGAFLrq8egpH0u88UsmCEK03DFC5OUh+W6rfSHmfW
	wIMSsOCFJy0WfLTLi0chwQ0JNbmtcK5V4YBg6yLwLgn/ILLTkqjbqEwLmkrRnutKrt5aSqK5dLyl2
	OIytM7sxqXcVdS1TjL8XNG2TzSUZioT/wbjK/v5zoDF1BOvdaffZbYx6acarmG5K7qN5kT5r67J4C
	Ibqfffrvwud0zDaoYGrTFHvBn0+XcrFcO2xtzpCSfN5xtGwjwi532Na1s2VgkM2Kk1P14Ci9gGhiP
	CLGchsPjuSMpm8VP/v+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq7R-00000007ESz-37L8;
	Mon, 20 Jul 2026 15:41:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq7Q-00000007ERP-3lhk
	for linux-amlogic@bombadil.infradead.org;
	Mon, 20 Jul 2026 15:41:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=o8dh5aQckfiP03vdZ5nRuu+LA2oP+sZO4zs8QLavR/M=; b=IQ3dEka1vjPjxpGjr3pupsZ68J
	W4J9AlHmSqGMzNHYZCffuFIY62yrnvDAhwtN69weTu/Vxq/lxD2Cc7I66P6+ALBFEXnVTyBSMDYsH
	+9+R0sm0Ke1NFK43S4SfNsWWEJQK0F3kbmAZZGt0EnsnwvMcO+XmW0Fyv/zUOp5pSM7nIKunuqwun
	h0O03gf1j73j3bZq3QhAndre/lxhzbG5/XsJrJbOFF/mK17lDsBClQWoPPkfaw7vskJHenOwjYSvh
	Y9tj/95DebaA6zdq6GXPSIYL4xxmi83t1fm1Kdm6OfcC4vInsBJ5Ti0j9WV2C+x8lQwRTVE9h2dTD
	adbUEngg==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wlq7O-0000000GkKp-16CP
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Jul 2026 15:41:23 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so72427325e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Jul 2026 08:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784562080; x=1785166880; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o8dh5aQckfiP03vdZ5nRuu+LA2oP+sZO4zs8QLavR/M=;
        b=FgHE1GsnbrNmWdil2/KTR7e1iUzeeFsW7TCe3xHKtM814/aPM1Se+j+8E9JTBwwk2/
         p76ntWAKO1FfNSKcW/WcSokvWciCUr0BJfatfkCbKU/xpg9ijYcwny7jAJUuiFB/QhYL
         sTuJ9lWlegMeXepzWzJmI7W48lwGlg4vh4Q4tGSUd61DKD1rtdkLbSylsOQvo7da3MYt
         XIuaVxOIvH7piclnm4BV6EzMUS8oD2RnjT9le9NjelhvE2eUEyKxsOQY+++VtcpANBpP
         R1DJJ/FOUO7v2Pdu4XAQzBX+XzjT2dc1OZs5AwNQpoYC36rYG/KtwFhT0icwdNa4vJ0c
         AS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562080; x=1785166880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o8dh5aQckfiP03vdZ5nRuu+LA2oP+sZO4zs8QLavR/M=;
        b=KoQgnBwxhxdQNaqy/NQPQl0qUU4hc4YmSAnfdAniOny//t54YwgCrVOeTMin89ZnBR
         XyDsmEjOFBKBhrCYGelaX25WhLr5dgDQapkw+i6t10kuOQa7FbdfpnYS1y2FK5wp262h
         c1i6i++P1IubPbcaOffEmsH8BwjxghZWLYygQy242EHbwiSP0eMn6+yl6Y0LJXfkyqSB
         dAYlXoZl/xZIGBhSicbq2AX6vqUNIk1/BzJtLW8ku7+OhcoaocfA0xBLN8cw6uNNfHep
         OcEEYmMqKlF23WJzk+D4XfTk8eEfvEOVJGw7LNMJ+QaeMIN2jP+zndGHT7xrGVXc9SuF
         av7g==
X-Forwarded-Encrypted: i=1; AHgh+RqC3TtC3H3pmcKKSP8zqdbm3U/XlnpsEHndm9DNnjmdj439gS0iKblB5FjaLbLD8PgrfLFKYTJREWW6xC1T@lists.infradead.org
X-Gm-Message-State: AOJu0YxUY227DDBGKsnglIwlI3IgYLIko6s6MAS5qUAT6C1IeoPWZFcc
	bxuQTUE0eP7ziCbcp2FZS9nE0N3kWrTXBSJi1TgYpn0Mc4mTVwHs5hhP
X-Gm-Gg: AfdE7ck9QPfR5phRV+f2WinskMXFiHUDvbFfpBuCT+WOOX+MFMtPzHU003Far5i729h
	m3wGtvlqYCYEjg6qr4qSwQH4oj2JLUYCq/g7a9ODMqQu/+GX0XNMrI4vNOKGTn31SZmB8y9lR3I
	L4DxSs32HwBbPSnSqpEQXBPdYaMU7I4pzbCQCTXLsjaccBfskhi+11//hZ+lRKHeMNRl3BeJIeh
	cw+0gCWuJXPNyTZrd4/C9WF3SK7ddChX27EH4mNWGcCElc6qX7M5Gjk/tjHs41eBzGenXupLW8b
	amoJLoSrJ6VWoNZa4vx8WmPwgaN3u0wE2GA7Uo1eg5eEGlGh7jNNuMd22lA3WqUmajUkN/YHTzS
	87CPlvGRx+UXnHm/gmZvDGETPAIP0DQJvIIuuMgNAgZyNb44UFnypGuLwIAyPPdGI8uEOim1Vw8
	zFZWmGd7bE7A==
X-Received: by 2002:a05:600c:524c:b0:495:4e12:6ae5 with SMTP id 5b1f17b1804b1-4954e126afamr155928515e9.26.1784562080376;
        Mon, 20 Jul 2026 08:41:20 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:e9c1:2f80:10a9:c708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm32667936f8f.21.2026.07.20.08.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:41:19 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 20 Jul 2026 17:40:41 +0200
Subject: [PATCH v2 09/15] drm/mediatek: remove dependency on DRM simple
 helpers
MIME-Version: 1.0
Message-Id: <20260720-drm_simple_encoder_init-v2-9-5020b630668a@gmail.com>
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
X-CRM114-CacheID: sfid-20260720_164122_346136_DB5E2F82 
X-CRM114-Status: GOOD (  11.84  )
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
