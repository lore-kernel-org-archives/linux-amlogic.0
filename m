Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC120C4452B
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jul 2026 15:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+LjS8NZeU22606DkaDNVB5sj0oYlvhZjR8k+rTYyJyc=; b=g8iWTQWIoC/IsP
	8O0dLDJfzGDsswjCr3t087eIg+fuVEL73AaK1VZbwIz2eNsNXR2r7hPok2ACrzSgOA7uW9I96spRe
	U0VfaDsU+shACSyRNw6g4bLeNU+vEOz/qX7xXK22JQ8oxC5YwUwJnDvpdMjRHnN3GRENA6GGF7mZh
	9a/YD42TWWHgHMQRZ/S1QStKm9L7L2fErd/sxIdwhe8HAk6h4kUP8nFrstPtyyNOMDj3vqfK6X64H
	/I200cKSrv5Xbb9R9qtYmXkYJFBhN9fWFjdcm4nyVOZoPYRUn4s6oqHzE2Q1WCWcVbziRI1CXx+Lw
	pI83BriNxtnPL7z2lsDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq74-00000007E1W-45Av;
	Mon, 20 Jul 2026 15:41:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq73-00000007Dz7-1sw8
	for linux-amlogic@bombadil.infradead.org;
	Mon, 20 Jul 2026 15:41:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=O7zJzFQDZ2ba/zKljTx71fkG4BHmnEG0mOPFGgp16IY=; b=WUSyqAafZuSIrMfSq3W9AjeaCU
	OVSNqTJ/GRZo/dpKlXe68ovEhy73qnbx/+XjUF8AjMj+vH78OJuQv0MacfjV3HaWltB1q3ZdV+o0R
	8NJ7vQmrUACAj0A2+7ghgtBE6WA+IWf+vHupX8maWQ3Wyb21E2JdMEN6hPHuH0+SuCced6F3ClvL8
	uwO4JDQ6On6+cXo4B0BE4j1k+HoQtoJoDf+6mZIAXuIaY2r8DOSfgXWU6YDI0q6swchTYnNl9YaMC
	hLbwlvS0uVLhTdI5A5DtA1I7jnyV9YZFhkb5Ht0jmYT/qqOwwLDudi+IfzJq/5BNhSIrNyxay7mq6
	ExTXEdaw==;
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wlq70-0000000GkDq-3ERc
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Jul 2026 15:41:00 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-47f71156e1aso804188f8f.3
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Jul 2026 08:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784562057; x=1785166857; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O7zJzFQDZ2ba/zKljTx71fkG4BHmnEG0mOPFGgp16IY=;
        b=Ww2viWcwbRZH8tFSzu99P38rfuWoPbYtcibCLC4VYPwUS6tSeA15B8CnkM/7Hpjs3x
         3/0Ahjl70K1xfbqT3vlQ/euT5AZvGqpYEsii2up5S/tfwfxS85v+BmAcNG+1ayrZMeXL
         zJegZOv0Vikb8aEthZ1Q9k5VmzQwfTXdmqeCU/XjC1gESEuXzVHjK6thfafHFNEcLLm+
         WqldpMI95oWK1i/g8qruOl0Uf/dKRCKkzJSxh0oJKXPIo+F5M/5/bUz6Ot5nLvvAzbad
         KncZs9BjgMm0tJfsEFJNwpUWynn6JpPwG6t2vSbG/wTkCrZyK37RVZbKg3obpWMQkfWB
         NiGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562057; x=1785166857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O7zJzFQDZ2ba/zKljTx71fkG4BHmnEG0mOPFGgp16IY=;
        b=A+Wsj09ECritkHcNGM3RIzF599otVTQRfDru8WmAyMA4NkYEC/pZ3Xk7ynV9zwoBf/
         dOIjfDhaTCu8zd5CT3903XdSSmGgSIh0nzQa7B87msg/jpaaOslaU9+eGcG5lcF6FxfQ
         3O5PKaVRIJXOdXZ8aK4rFdsa1awvb2PMm8JYbG+bYXLWwU+u+cukwTCdhgUm+JT2YNYc
         HD+/B/k+/fIQf13PY0OiOGlk21fLvQ/mwFQh9iDddA7gp0XBjBQ0XnsqHAT35aOgvl8Z
         bp4xprcnr4f992i6BfzMJUdExfh6+X9kGd6ymrSIe9jap89IYwkiJVFTBl6ZC1BiCFpk
         lglQ==
X-Forwarded-Encrypted: i=1; AHgh+RoPLww+FNkjCxsBB9V/boPWDevpNpGk6rMzZO26NzFdstimWvCHSnAXoS2RoexiGTFYFaFTZIW6lKmYfB2d@lists.infradead.org
X-Gm-Message-State: AOJu0YyqcDw17f7GhD16NwipXtKxCoU90rZYRHBVi+R6EtrlOgXAPUN6
	yQFP4tWkwbg7gzDSYBRKSQJhRA2/nwhHHQsX0hkwgAw9c6HyxUnBXGzg
X-Gm-Gg: AR+sD11EOY61x7VIxUU7YJSISlxn/823tYDbwyp3lg5b5i94bPCPja69JMrWYDB7VEs
	foMZIhW1dUMS6WIIeKVZ22x8Iy76vLm+mfTEyqs5sZS8fEa7VP3doTkilfjZ165Z2txKfBSk7Df
	LZzsYTM8p77vPQRlXIyRvBDHpVDNG+S6A5lnVqEyAy1A10mdPjAtei2xnWZeWPZhrifQl1wbFlf
	scnjtC1gZR8r7tUI1IEdL4C3/n9Q0bZfNxSP8RgxnS31mpeo6qsAXa6dPLMfsyp0NMIuGklJP8q
	a0tjCZlZt0n5hE0dcQFjdKMAbG34mIut6W2UmjB+s1Wfosd3+WLMszl3kvi7VozTATIGuJ0DywV
	VbxTuUqnhGDFCj3vjHxq2umoTVPxY8fmFwCYBH8NFxAq2AhVmIzu47X36nZtkJE7pI0BchoY/Dq
	upErES91NJkQ==
X-Received: by 2002:a5d:6f02:0:b0:47f:7154:ab20 with SMTP id ffacd0b85a97d-47f7154ae17mr8536055f8f.37.1784562057410;
        Mon, 20 Jul 2026 08:40:57 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:e9c1:2f80:10a9:c708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm32667936f8f.21.2026.07.20.08.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:40:56 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 20 Jul 2026 17:40:35 +0200
Subject: [PATCH v2 03/15] drm/tegra: remove dependency on DRM simple
 helpers
MIME-Version: 1.0
Message-Id: <20260720-drm_simple_encoder_init-v2-3-5020b630668a@gmail.com>
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
X-CRM114-CacheID: sfid-20260720_164058_892488_527313B0 
X-CRM114-Status: GOOD (  14.02  )
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
Also check the return value from drm_encoder_init() to avoid silent
failures.

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 drivers/gpu/drm/tegra/dsi.c | 16 +++++++++++++---
 drivers/gpu/drm/tegra/rgb.c | 15 +++++++++++++--
 2 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index e7fdd8c7ac12..3f818c195e9a 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -20,11 +20,11 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_debugfs.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_file.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "dc.h"
 #include "drm.h"
@@ -1055,6 +1055,10 @@ tegra_dsi_encoder_atomic_check(struct drm_encoder *encoder,
 	return err;
 }
 
+static const struct drm_encoder_funcs tegra_dsi_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs tegra_dsi_encoder_helper_funcs = {
 	.disable = tegra_dsi_encoder_disable,
 	.enable = tegra_dsi_encoder_enable,
@@ -1078,8 +1082,14 @@ static int tegra_dsi_init(struct host1x_client *client)
 					 &tegra_dsi_connector_helper_funcs);
 		dsi->output.connector.dpms = DRM_MODE_DPMS_OFF;
 
-		drm_simple_encoder_init(drm, &dsi->output.encoder,
-					DRM_MODE_ENCODER_DSI);
+		err = drm_encoder_init(drm, &dsi->output.encoder,
+				       &tegra_dsi_encoder_funcs,
+				       DRM_MODE_ENCODER_DSI, NULL);
+		if (err) {
+			drm_err(drm, "failed to initialize encoder: %d\n", err);
+			return err;
+		}
+
 		drm_encoder_helper_add(&dsi->output.encoder,
 				       &tegra_dsi_encoder_helper_funcs);
 
diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index e67fbb2362e6..bc1c93c7554c 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -9,7 +9,8 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge_connector.h>
-#include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_encoder.h>
+#include <drm/drm_print.h>
 
 #include "drm.h"
 #include "dc.h"
@@ -194,6 +195,10 @@ tegra_rgb_encoder_atomic_check(struct drm_encoder *encoder,
 	return err;
 }
 
+static const struct drm_encoder_funcs tegra_rgb_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs tegra_rgb_encoder_helper_funcs = {
 	.disable = tegra_rgb_encoder_disable,
 	.enable = tegra_rgb_encoder_enable,
@@ -305,7 +310,13 @@ int tegra_dc_rgb_init(struct drm_device *drm, struct tegra_dc *dc)
 	if (!dc->rgb)
 		return -ENODEV;
 
-	drm_simple_encoder_init(drm, &output->encoder, DRM_MODE_ENCODER_LVDS);
+	err = drm_encoder_init(drm, &output->encoder, &tegra_rgb_encoder_funcs,
+			       DRM_MODE_ENCODER_LVDS, NULL);
+	if (err) {
+		drm_err(drm, "failed to initialize encoder: %d\n", err);
+		return err;
+	}
+
 	drm_encoder_helper_add(&output->encoder,
 			       &tegra_rgb_encoder_helper_funcs);
 

-- 
2.54.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
