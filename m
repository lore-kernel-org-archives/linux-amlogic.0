Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2EEC44530
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jul 2026 15:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/2NQLPTHjvunTeGn4irr3JwLzlxV01J6ECrgZVPjh6I=; b=yzR473USjrPO/c
	aoslReT5dZB5mc3nXgUts+FBr0VeeCFojdB5lOUTWxEMKrNKcmLyZWYhJJhqFCwb5oCy+7ONMPypJ
	P48aQ8XrrG9oLXQNkgebnrigmFfA4Fo/oCs0Nkbi3mLAweJp5Y/4LliuGabpNJHe+9DHiuU89qhRT
	ugaUlnJ6dJ4xS3WG2TL606T7fKQtH9VWsgCgG1/XwxTHbNZORsHQ9kqVGBnuutyj5TqkaJyqfLHdk
	iBI3nmwqLZMfq9U2G+FevnBxZyyHmky7nSa5SK4lp6NgoaBnTugCTg5/Eq/3+VDGItqz2ACeRPYGo
	uobN2yJ6Sm4cZNO1MSAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq6u-00000007Dr6-1ZzS;
	Mon, 20 Jul 2026 15:40:53 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq6q-00000007DpJ-0Mrx
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Jul 2026 15:40:50 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-472326ca506so7942421f8f.2
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Jul 2026 08:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784562046; x=1785166846; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+RhVkb1Ieh+bhF0gQzF1Ju+q7qk3GiWptVGwICJBljM=;
        b=qs+p2suJbsYG2JnuGmJmYFXavExUxCBtDonXG6JuLyNCVMmLn3HYOpMIXKZkGAYA7P
         ZjqDmIqkKt4/PBjrKogk1qyn+RY1J7xJGjFKnLYqCLTIGzUaF71lDSGeb/kd0RIoagG9
         2FdN6+Mbi01ppKfdytYJC7x7dn/ik/ZWfLOsSW4OhAh8FTL4Yhvp4KPO5OAHrb/NSiM5
         mJgjm8GBbBcW7TDE2VUEyVeWgAtC9ASL+WYdDWY4Sd5dIAwe34WFQYJHbDLLVhAU+zPu
         ASiaEvVbJ/IS9tW+Con4SigCCNT91ZRb6uiSeym73PIHMEAigNgUtJABaAzr4kVkb+zi
         bKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562046; x=1785166846;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+RhVkb1Ieh+bhF0gQzF1Ju+q7qk3GiWptVGwICJBljM=;
        b=VMaI1zXNThL1QOfJN+j5oq1paMzNXNk2ZC8hKfXlRwtZYBg8cMkQwtx7ur7zI4gv/s
         IPE00Vyu9vuRZtISuh987Hi14BHYExHbD9OHtAYfvH0l3o8K6jJDAhVE9Ci1k1/FYvzJ
         Fwpyz3ZgSiZT9Qt8lieY7CVLGlJoQb6jiot4cDdmdBVW0l+8eXEboUUxnCYlxyhx41o1
         CWOppcKMcoAB20qDkJTMm/qTFAZwDMLB/GvcMJaneXBwyWSgrkfwpGLbTL3HwCSDJKJX
         CFUfQPVjqM7HhKALNcHmZHjqjv9RS26a33PHO6B7P3FM1KxhYgXVR7CI7QI+0eh2E4ve
         /ytg==
X-Forwarded-Encrypted: i=1; AHgh+RpWd1kJ8tDu7csKL5Cf9Z5efTKZNHXOdv4M3c82LaudQJZCZNgAdGqjWAL5SBPIssMQe3aItPmoCQaRgouE@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0ClZCskSeSPIWGxs61kr26k287Cj+9+BVg5rTmaOZpTbJejHj
	W1T+LOroE3vbn5QDclVO2F8tymNOPVPb9zXlJoiwHjZc1Btoa7JZ1UJT
X-Gm-Gg: AR+sD10tIX0Mdlg0cRJwO9Y2AkFr/lQcLoH2YUfHZYPra+RLnEm8y67MpzEENWLYC1l
	ePjratiXwIMg9JkTmAyCKu3Mrhgoi/EmaktevMSb89lLxBiQTNe2bylaJ8w6ET6+TXhI52J+z+j
	ODXU8ZgN7QXcmI8hSWhQqDkqXkAoMutRw9cJW3tHBQm2RUytXNlqFf4uQwdC9Eatkoprs/YzM7k
	rrkjbdLXXRQGmFRkJCZ6XkpnuBTdUGJz8EFCJTX0/K/k5bO2a/yLdZ8j9mxQc5JABTQbVtD4JXC
	s1fR0GGjKHvXcKbxA2ILY4kpVgMcXqQ3gcdn7gJ7Oq8wqqDVfYAGbAWDT9p3/19/taqdZ6cX2TK
	INwChNX3N3apC0casc54sOSuYd4wYJNGyFeOK0hUJkqdteS05btjFThhxNTUdlFmhG0nlUCYunz
	/2jNUad1ax2g==
X-Received: by 2002:a05:6000:4310:b0:47e:b336:6385 with SMTP id ffacd0b85a97d-47f622d054fmr17529323f8f.0.1784562045728;
        Mon, 20 Jul 2026 08:40:45 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:e9c1:2f80:10a9:c708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm32667936f8f.21.2026.07.20.08.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:40:45 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Subject: [PATCH v2 00/15] drm/drm_simple: remove drm_simple_encoder_init
Date: Mon, 20 Jul 2026 17:40:32 +0200
Message-Id: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHFBXmoC/3WNyw6CMBBFf4V0bU2pysOV/2EIKdMBxtCWtNhoC
 P8uYFy6PMm958wsoCcM7JrMzGOkQM6uIA8Jg17ZDjnplZkUMhN5WnDtTR3IjAPWaMFp9DVZmrg
 WWanOAHlbNGx9jx5beu3me/Xl8GweCNOm2xY9hcn5956O6bb7Vcq/lZhywVVewEWUeBKZvHVG0
 XAEZ1i1LMsHAbIKNtAAAAA=
X-Change-ID: 20260718-drm_simple_encoder_init-d069a4cc7f8b
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
X-CRM114-CacheID: sfid-20260720_084048_168012_FF20FA82 
X-CRM114-Status: GOOD (  13.19  )
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

This series open-codes all remaining drm_simple_encoder_init() users by
calling drm_encoder_init() directly and providing driver-local
drm_encoder_funcs where needed. After the driver conversions, the helper
is removed and the completed DRM todo item is dropped.

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
Changes in v2:
- Change logging to consistently use drm_err()
- Link to v1: https://patch.msgid.link/20260719-drm_simple_encoder_init-v1-0-a78c509e3062@gmail.com

To: Jingoo Han <jingoohan1@gmail.com>
To: Inki Dae <inki.dae@samsung.com>
To: Seung-Woo Kim <sw0312.kim@samsung.com>
To: Kyungmin Park <kyungmin.park@samsung.com>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: Michal Simek <michal.simek@amd.com>
To: Thierry Reding <thierry.reding@kernel.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
To: Jonathan Hunter <jonathanh@nvidia.com>
To: Stefan Agner <stefan@agner.ch>
To: Alison Wang <alison.wang@nxp.com>
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: David Airlie <airlied@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
To: Chia-I Wu <olvaffe@gmail.com>
To: Jyri Sarha <jyri.sarha@iki.fi>
To: Liu Ying <victor.liu@nxp.com>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
To: Xinliang Liu <xinliang.liu@linaro.org>
To: Sumit Semwal <sumit.semwal@linaro.org>
To: Yongqin Liu <yongqin.liu@linaro.org>
To: John Stultz <jstultz@google.com>
To: Liviu Dudau <liviu.dudau@arm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Cc: virtualization@lists.linux.dev
Cc: imx@lists.linux.dev
Cc: linux-mediatek@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-doc@vger.kernel.org

---
Diogo Silva (15):
      drm/exynos: remove dependency on DRM simple helpers
      drm/xlnx/zynqmp_dpsub: remove dependency on DRM simple helpers
      drm/tegra: remove dependency on DRM simple helpers
      drm/fsl-dcu: remove dependency on DRM simple helpers
      drm/kmb: remove dependency on DRM simple helpers
      drm/virtio: remove dependency on DRM simple helpers
      drm/tidss: remove dependency on DRM simple helpers
      drm/imx: remove dependency on DRM simple helpers
      drm/mediatek: remove dependency on DRM simple helpers
      drm/renesas/shmobile: remove dependency on DRM simple helpers
      drm/hisilicon/kirin: remove dependency on DRM simple helpers
      drm/arm/komeda: remove dependency on DRM simple helpers
      drm/meson: remove dependency on DRM simple helpers
      drm/drm_simple: remove deprecated drm_simple_encoder_init function
      Documentation/gpu: remove completed drm_simple_encoder_init() todo

 Documentation/gpu/todo.rst                        | 15 ---------------
 drivers/gpu/drm/arm/display/komeda/komeda_crtc.c  |  9 +++++++--
 drivers/gpu/drm/drm_simple_kms_helper.c           | 13 ++-----------
 drivers/gpu/drm/exynos/exynos_dp.c                | 13 +++++++++++--
 drivers/gpu/drm/exynos/exynos_drm_dpi.c           | 13 +++++++++++--
 drivers/gpu/drm/exynos/exynos_drm_dsi.c           | 11 +++++++++--
 drivers/gpu/drm/exynos/exynos_drm_vidi.c          | 13 +++++++++++--
 drivers/gpu/drm/exynos/exynos_hdmi.c              | 14 ++++++++++++--
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c         | 10 +++++++---
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c      |  9 +++++++--
 drivers/gpu/drm/imx/dc/dc-kms.c                   |  8 ++++++--
 drivers/gpu/drm/kmb/kmb_dsi.c                     |  9 +++++++--
 drivers/gpu/drm/mediatek/mtk_dsi.c                | 10 +++++++---
 drivers/gpu/drm/meson/meson_encoder_cvbs.c        | 11 ++++++++---
 drivers/gpu/drm/meson/meson_encoder_dsi.c         | 11 ++++++++---
 drivers/gpu/drm/meson/meson_encoder_hdmi.c        | 11 ++++++++---
 drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 10 +++++++---
 drivers/gpu/drm/tegra/dsi.c                       | 16 +++++++++++++---
 drivers/gpu/drm/tegra/rgb.c                       | 15 +++++++++++++--
 drivers/gpu/drm/tidss/tidss_encoder.c             | 10 +++++++---
 drivers/gpu/drm/virtio/virtgpu_display.c          | 12 ++++++++++--
 drivers/gpu/drm/xlnx/zynqmp_kms.c                 | 14 ++++++++++++--
 include/drm/drm_simple_kms_helper.h               |  4 ----
 23 files changed, 183 insertions(+), 78 deletions(-)
---
base-commit: e1113c37ba4f166e37dec74a729e6dfd8cba1687
change-id: 20260718-drm_simple_encoder_init-d069a4cc7f8b

Best regards,
--  
Diogo Silva <diogompaissilva@gmail.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
