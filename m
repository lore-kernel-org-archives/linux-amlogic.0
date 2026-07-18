Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24530C4450A
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2026 23:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BOqKxTG3y7dbvhvdJFvVdYz7cdXMqKpZedEMHIHf99g=; b=prAaR9Ff1ScMGY
	bAOR1DA+xY/nQahT7pOGyeEbt5C4CmayYZxPmmL3GaurrvLJdhNrWjglloZhMMEslncA+1Cp6E6E6
	2t6bYD0dsdyNqMTUjx9DMZJ0tVfq2/zWjTfpaV01IJWx3rtyjkaYqOJn7AqXgnyrWS/VryDtF8sN9
	6+QqHSvsU6Gxy4PUpR+H2a1puujpqHegciSVuCRpGCX58Zvh8kiIaz7OO1ksxkb9NM3HCZAHOK4MX
	hRHnt707YtdDGLhHCHSMWIRzRKbxiDdSwxAL0ITqscpf74xy12CpSdwVXJivMLCEcQaJ8RnWChcHF
	ZDC7N+CfzKvHAJ35JKSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlEZt-00000004bnm-0tdA;
	Sat, 18 Jul 2026 23:36:17 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlEZq-00000004bjc-2B6l
	for linux-amlogic@lists.infradead.org;
	Sat, 18 Jul 2026 23:36:16 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so10947195e9.3
        for <linux-amlogic@lists.infradead.org>; Sat, 18 Jul 2026 16:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784417772; x=1785022572; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hoju8K5XWFY53znMwRCcUMP/RKb2Y+W04UW3kIqcXC0=;
        b=ixSn58tRAbz7nlbvMYamAv1/kYJ2wgqNCbBQk4PtphptW7nb14WDfFhvh1U2yK0NWV
         DqlknnK3IUahP7lMzh9emBMuAlyki5UHks3u1+8aWQAP/y6fKhZ6EZZE2ItoPNv6srRu
         1HITarvyfoG0mKfoc5RumouGvkEvSKU0F7R5Rcl/0s7aHfVS2WZ6I3DlD9b5eHJuF/tR
         CzyT9WR1d4sPEUA0NrWEvVXZvIDBRe/9p79KguwbmZ/wnpVmC0ywiT7KTd5oE5JlZA4n
         ZerSVfTw0hjN0kghJ8yBNCFI4tcM0NNlQmXCZt7VJdSYRe4v7naUysRfIV4uNpLZhLpS
         x6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784417772; x=1785022572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hoju8K5XWFY53znMwRCcUMP/RKb2Y+W04UW3kIqcXC0=;
        b=gZ0nXGrlqg65Zhy/9VoUcxJHNTC2WxGixpxNi2qpeVabxRd1dmNc71bPuHx9Qolm1/
         FTaTgPcuMqLC2/6slqqOMMFh8f4/miUpJwCJctG0XZ2TlZNaWJ3bq7vFb5vz1/g5L7H5
         SJJ8r1Ph721Cl0Kl/xsjBrviarxAMfVdv2VXh6ZJGFZE4Lf/9Jr8OyYnp1jk/M/ZfI2H
         qHne0nSdPKHaEIlzzr8m+3hD4pcFkP5MiNoxmdFsu5g07cerVqrYPxJ7mpzzvKdZZjrC
         m25KYHpir10Y9tO9lJtZLAdt7fRBXkl2+5RUX2VBnrmJOW4YWfxDgfBk/ow2+kQ+U7UV
         Tj8g==
X-Forwarded-Encrypted: i=1; AHgh+RrDUkCIinX5McGzakik3NuI1Xv20iZPJDxKk+WpftMotpgTO34ji59wXsLfxICQPmEN0QuV3K13OFe7aNKx@lists.infradead.org
X-Gm-Message-State: AOJu0YwI3k6zwqyVASoe6qlWv2fjkQcfQTXqozjPtOlnJL26FO2BHP8c
	IiUGRGwDZUkYNsqOvwMao+IbezGF+TYpD4Q76qRQTP4MSiIjsc0Ma9eb
X-Gm-Gg: AfdE7cntpSzTbChgaZr+KTlzKau/g3Jp6zJrlgxYs6vinwkSIg+hGE4q7rl6qxVTEeI
	cliga81duXb212owrM8VdUJO0UqLOiODWRDDEZgYj5LfzNPKWXAxBur04rKd9Purr/aQ/8K/uoC
	IjoOjp+5svMpTe5Kx5VXUW61BlJ8+0Y6/10uoWaiQCbp1xwFC6dXlcrKcIiVjH6ZvfmSCx65SOc
	/NC4FlhQmwasPgDd8ufZaj5vz3yLPPfzaNK3S378ZholhL9m7/jxzl8ozGVfuL/wPh5EgpEDdvF
	GOqpMYAqU4DQUR0QPYndT+1P7Lh56mYhaZGpuyWn1zYmhvYBGL3tNJMAGX2w34NXw5Pm9VRsE5p
	RolAJ6THm7PHEqqptQhd8LS+1QhK9ZmWoqu2EslvPT6iR+LgHNb8Lhmd/Oxc0Bz7BIi4gGfFqL8
	xvYRBwWk18vQ==
X-Received: by 2002:a05:600c:b85:b0:495:5365:c0d1 with SMTP id 5b1f17b1804b1-49553d85ea0mr35374355e9.14.1784417772455;
        Sat, 18 Jul 2026 16:36:12 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:645b:9e5c:7fe3:c09f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a24b6sm160964675e9.3.2026.07.18.16.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:36:11 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 19 Jul 2026 01:35:35 +0200
Subject: [PATCH 04/15] drm/fsl-dcu: remove dependency on DRM simple helpers
MIME-Version: 1.0
Message-Id: <20260719-drm_simple_encoder_init-v1-4-a78c509e3062@gmail.com>
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
X-CRM114-CacheID: sfid-20260718_163614_591965_A2A8227A 
X-CRM114-Status: GOOD (  11.53  )
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
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
index 84eff7519e32..c2b788bfa8f9 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
@@ -11,14 +11,18 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "fsl_dcu_drm_drv.h"
 #include "fsl_tcon.h"
 
+static const struct drm_encoder_funcs fsl_dcu_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 int fsl_dcu_drm_encoder_create(struct fsl_dcu_drm_device *fsl_dev,
 			       struct drm_crtc *crtc)
 {
@@ -31,8 +35,8 @@ int fsl_dcu_drm_encoder_create(struct fsl_dcu_drm_device *fsl_dev,
 	if (fsl_dev->tcon)
 		fsl_tcon_bypass_enable(fsl_dev->tcon);
 
-	ret = drm_simple_encoder_init(fsl_dev->drm, encoder,
-				      DRM_MODE_ENCODER_LVDS);
+	ret = drm_encoder_init(fsl_dev->drm, encoder, &fsl_dcu_encoder_funcs,
+			       DRM_MODE_ENCODER_LVDS, NULL);
 	if (ret < 0)
 		return ret;
 

-- 
2.54.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
