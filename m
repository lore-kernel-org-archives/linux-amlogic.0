Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A39C44520
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jul 2026 15:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=COKB1latUZIFTtFXebGikTsnyE2iZddIcZemen28Kkw=; b=xYv+IJcL2ZSejT
	VQhDXm3Cduw4aDhcPn2h/hwPnsVb+aa9nQVALNGqC5xOwAO7OmkR4bs3FvHadn9FRQS5UWXfY1kgO
	RckgX9TNSDgsI8W3LAv3azMP/HJzAEMoKik+/8tSmJC/Semx5V4nWr9Pa5G6ttp4JLfkLyESteFXh
	bikde+7F2JtHNXv/J7JYMxm/VsGjWj5OsuvCoWK7eV+xVpo8OJURloF5euc+GHKj29bWeNM6curAW
	mJ3GvohPCBlHPw/U7MliYrSwSQpN7JdaM/IO+Tk/Tm4SjV+cqukV+L9zR2te8cV8/ZWvqXPcFT4hG
	dddwz+PqV0qudqQCSJ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq7g-00000007Enc-11tm;
	Mon, 20 Jul 2026 15:41:40 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq7d-00000007EiA-1bWW
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Jul 2026 15:41:39 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-4728c12ba97so5146065f8f.0
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Jul 2026 08:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784562096; x=1785166896; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ITwMWTyjPOpmiBS75ZF02CenxzeBHARaB0ED7f6Tp6A=;
        b=IlE2BeVVzY7mGS9UZpG8DJr4ZIeBMSiTytKy8utatdvmRIaMfuuty1lXuh5cGuC3yM
         wtm/2Vgk2oTvoiGbBIM332KS1mpxPF0sU4pHu/OF0VnR9mr6b6fDLubnnjBlqkdIde5H
         gRcmPNhl0KKEosv079lPZljsk5Em9bHdo5RkKynRFjVLsGycjksuQcV503NkOBHh9sq5
         jrs9jsInL+oYUWZdKSeKCsBcvl+Ux748J6lJ/hSubhw9/BW22iQaVNLhVJ7s1p5jAzP0
         BrOoK++N9MY7MnRNz9wE7koJSq2HKgeqEgxQ+e9YfxpItAa+RCBbqu3W720knQF6SkGM
         vkYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562096; x=1785166896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ITwMWTyjPOpmiBS75ZF02CenxzeBHARaB0ED7f6Tp6A=;
        b=kFuTJWjvQWQv0RYXttGx+s7oA5Dra5zsdXYMJfQQvcNA5pv9q9S2+3BuC4nYfUmu/1
         BpHWfVLAQ5PO3Z1I5Ky6yQ4cE/dmdEeBwtG8en4FkHx+xzXb3FNkJB9VUPRTLcYlC4bV
         udsCcusOVAuoBjbs0ZADyiygYYP7GMLAg+C4VrHV+cKrBpBfXd9MZZOCEOQBjfEVEF5P
         NPq0AMev7vzODQhi6+oIbGHCofeaKt2/24d6pa8LQmJ3L6uIc4GIgWJu0vsF7nFARv+6
         V7wk8AyiqIn6dIptsZz7Ao1Bs96xvSqyBO6WYOTbS4GvACKXvPPu4dRVcntj9WVm1RXC
         O7nA==
X-Forwarded-Encrypted: i=1; AHgh+Ro87XGBPKcJ+Z4L5CuVImfc50ZuoY+ZLxGugq8PEp7FNIFEUq3yu/4boeCMLk8cDhFy+3lIK1x91YYVT8Pw@lists.infradead.org
X-Gm-Message-State: AOJu0YzniKD41oLhWCH+e6pJpxZ1fqsXYkXnEYVu9bVTAsPngP7l81HP
	LtegeH8DfGuhpFIDpIFATu1R1bgHU2Uj9ImcR0/eWHq0jqhzfDRkr2zv
X-Gm-Gg: AR+sD11xZ7I5HAurR4jqgJxHBuDPUGsHsxMJXE+KzzDSVBsVuN85UblMiPVLeH1hduA
	cosCzBaqad0ZBwmWi4hjSg0sJ9RxMXu52cdBXQa/coQJfsIoKKbVNg/4c8P7dwb39SC0PtFvqRV
	GaqAOko5r7g7lKNKXEppPyNAKnL3XNVHHZ+ZjL9oGycP+kdTSagLMdAoOY6kym80AAOYVj1SzQo
	/GIr4KYUhrQqLZffjSSJ3YM3HNpnJgEoc7h970tDXurazOhMlSROTIj+cKmEfi0wq7z71aD2WGi
	IeCnknRNuileSFAg3jtgbi7gpChp1s73xvXqJZDNK8pE6MRqcAVuwI9y9wlutd6eaot2Ts58lPz
	qRRz/gl6rG80ZpgV0A/dd0LG4eUkAHGZfEB4/n9Nua1LL8WB8x3pg2D2gpg8WlBtXmzz7AtRdLC
	dbEGD50ty3a7hs4Kx9lAIi
X-Received: by 2002:a05:6000:18a6:b0:47f:6f98:4993 with SMTP id ffacd0b85a97d-47f6f984b87mr10186539f8f.29.1784562095536;
        Mon, 20 Jul 2026 08:41:35 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:e9c1:2f80:10a9:c708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm32667936f8f.21.2026.07.20.08.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:41:35 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 20 Jul 2026 17:40:45 +0200
Subject: [PATCH v2 13/15] drm/meson: remove dependency on DRM simple
 helpers
MIME-Version: 1.0
Message-Id: <20260720-drm_simple_encoder_init-v2-13-5020b630668a@gmail.com>
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
X-CRM114-CacheID: sfid-20260720_084137_465058_CFDA28F1 
X-CRM114-Status: GOOD (  11.83  )
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
 drivers/gpu/drm/meson/meson_encoder_cvbs.c | 11 ++++++++---
 drivers/gpu/drm/meson/meson_encoder_dsi.c  | 11 ++++++++---
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 11 ++++++++---
 3 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
index 22cacb1660c4..cdb84d2283f8 100644
--- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
+++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
@@ -17,8 +17,8 @@
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_device.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "meson_registers.h"
 #include "meson_vclk.h"
@@ -218,6 +218,10 @@ static const struct drm_bridge_funcs meson_encoder_cvbs_bridge_funcs = {
 	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 };
 
+static const struct drm_encoder_funcs meson_encoder_cvbs_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 int meson_encoder_cvbs_probe(struct meson_drm *priv)
 {
 	struct drm_device *drm = priv->drm;
@@ -257,8 +261,9 @@ int meson_encoder_cvbs_probe(struct meson_drm *priv)
 	meson_encoder_cvbs->priv = priv;
 
 	/* Encoder */
-	ret = drm_simple_encoder_init(priv->drm, &meson_encoder_cvbs->encoder,
-				      DRM_MODE_ENCODER_TVDAC);
+	ret = drm_encoder_init(priv->drm, &meson_encoder_cvbs->encoder,
+			       &meson_encoder_cvbs_funcs,
+			       DRM_MODE_ENCODER_TVDAC, NULL);
 	if (ret)
 		return dev_err_probe(priv->dev, ret,
 				     "Failed to init CVBS encoder\n");
diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
index 3e422b612f74..faa309cb97a6 100644
--- a/drivers/gpu/drm/meson/meson_encoder_dsi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
@@ -10,10 +10,10 @@
 #include <linux/of_graph.h>
 
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_device.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_probe_helper.h>
 
 #include "meson_drv.h"
@@ -99,6 +99,10 @@ static const struct drm_bridge_funcs meson_encoder_dsi_bridge_funcs = {
 	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 };
 
+static const struct drm_encoder_funcs meson_encoder_dsi_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 int meson_encoder_dsi_probe(struct meson_drm *priv)
 {
 	struct meson_encoder_dsi *meson_encoder_dsi;
@@ -133,8 +137,9 @@ int meson_encoder_dsi_probe(struct meson_drm *priv)
 	meson_encoder_dsi->priv = priv;
 
 	/* Encoder */
-	ret = drm_simple_encoder_init(priv->drm, &meson_encoder_dsi->encoder,
-				      DRM_MODE_ENCODER_DSI);
+	ret = drm_encoder_init(priv->drm, &meson_encoder_dsi->encoder,
+			       &meson_encoder_dsi_funcs, DRM_MODE_ENCODER_DSI,
+			       NULL);
 	if (ret)
 		return dev_err_probe(priv->dev, ret,
 				     "Failed to init DSI encoder\n");
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 0c7a72cb514a..c4355c5cc340 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -23,8 +23,8 @@
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_device.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include <linux/media-bus-format.h>
 #include <linux/videodev2.h>
@@ -369,6 +369,10 @@ static const struct drm_bridge_funcs meson_encoder_hdmi_bridge_funcs = {
 	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 };
 
+static const struct drm_encoder_funcs meson_encoder_hdmi_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 int meson_encoder_hdmi_probe(struct meson_drm *priv)
 {
 	struct meson_encoder_hdmi *meson_encoder_hdmi;
@@ -407,8 +411,9 @@ int meson_encoder_hdmi_probe(struct meson_drm *priv)
 	meson_encoder_hdmi->priv = priv;
 
 	/* Encoder */
-	ret = drm_simple_encoder_init(priv->drm, &meson_encoder_hdmi->encoder,
-				      DRM_MODE_ENCODER_TMDS);
+	ret = drm_encoder_init(priv->drm, &meson_encoder_hdmi->encoder,
+			       &meson_encoder_hdmi_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
 	if (ret) {
 		dev_err_probe(priv->dev, ret, "Failed to init HDMI encoder\n");
 		goto err_put_node;

-- 
2.54.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
