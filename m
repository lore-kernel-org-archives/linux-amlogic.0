Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA259C44515
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jul 2026 15:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BOqKxTG3y7dbvhvdJFvVdYz7cdXMqKpZedEMHIHf99g=; b=jYMe6ZWrEHxLhs
	FhLQyhceP5g+fGmbBevsFUJ2Gxhwhwr1Yx9BMi09gkFmU9Rwd07Y2kTJChrS7GE6M/PmtNQhKXTLc
	WmgDoSXkGTbHEQ0Olem4wD0F6CVFvhM5aidDSs4vepr0v9JCOFVRBNt/tPyKX6U2fDIAqf7cNOc8a
	JHVJd1tUcw1WVycvK0v8mIEK352cDOgxdKe6594YbBEhkEULakhlf6ThoHOIhjf9D9tKzmEkScJbA
	ucKVASiirCQWcXP+rw4iFdOHOU51z/pdIBtaEDkUprpv6NN0+7R0Ce1IQp+TalEvHNlwXmedUWHT+
	BwORngdxJ33s8BHfgRWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq79-00000007E5O-0tht;
	Mon, 20 Jul 2026 15:41:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq77-00000007E3z-3Jpa
	for linux-amlogic@bombadil.infradead.org;
	Mon, 20 Jul 2026 15:41:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Hoju8K5XWFY53znMwRCcUMP/RKb2Y+W04UW3kIqcXC0=; b=OF3eOawzzTAHKXjGUT5vnBe//n
	CQP+zc5dGxWQqzgev2nwzI5Vs2I/0k0/GUvhmDA145WDzNB52R9v7LpgvC0jV+PzlMUgD5+1LdnBS
	pmzmjhnaKiWPFPvFeJerX+Sobr/shnic7p2aItuH22gECSwHkaeWL+WCM2skaaBEi2NMSmfubICk3
	CgPUUxm3svK0INSv7ZO+Nvh5f8nXPA5J3kjiJ/md9xvG6iwjkgeJK/al2UrJtuGhXWk1IhqbkRCXg
	d/YSChNkTQSwUKlMRgq2lq3MKhid/p06Zdr9W5tmH1TwSMtbkmqMOcyC//79PjICLcebwZzZY76pk
	X6/eBZVw==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wlq75-0000000GkEx-0UeT
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Jul 2026 15:41:04 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-476d8e647e9so9368248f8f.0
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Jul 2026 08:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784562061; x=1785166861; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hoju8K5XWFY53znMwRCcUMP/RKb2Y+W04UW3kIqcXC0=;
        b=A/sxLFP70Sx9UxQ10Csoyluac40M50p2QhBlCPlHIi+EWBPZn0H0/44646PUZ5Xmep
         fb0mS10FaMxBssrPvzFe3+hDn31MGp4xvZ9HvdIk1Vp25MnOB8DSKJxgzQ56Q4SsIsZh
         gkZak24jHbQ7L/yUdoKIPJlKR3jQg1A0cXklYwnSwch8FPZv7l65r6MKRakgRAwhFjyp
         qQLs3xSpfnDDQMoc5prJecva36DOL9zYsVrvFyXkhA/txpKtd8P+lvX9ul83Oiu04zJv
         9Xfq+76lgzZ0HLcW16PoKgWO8ro+OLivDQILUHGir5v5hCZMlVdhVrnjhK/LvzJEdE2Q
         mnsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562061; x=1785166861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hoju8K5XWFY53znMwRCcUMP/RKb2Y+W04UW3kIqcXC0=;
        b=cRsn74OZLyCZ2m0rsfd7F6SePUM00adtMXuibj4/fYmQo0/PtsKLW4bh/LEg2FWoq+
         pIOTavkuNBQgBompxWexI9oMLp6FwhjjOpR1x6ksVxltmiuK9FD4mnhkVHbSAppEJvQE
         JSq/cUECCC/6EyUIeMuksnlb4iZzo591agFDoTtuttqqmqwjGj61SK6hSck1dP/DhdE9
         I2mGOK8q1X1flGGbkI4xFJErCL0Xkq/JGiacohU8SXUUnlwqdF7Up9i9MtqUTUm1tx0c
         j8i7Kt8Hl3ic5C1F5MZ0ChB+D68n4Qxipw84zR94z5mqHpuj1bWMkgb+6pf9k5c0aW9R
         ZYIw==
X-Forwarded-Encrypted: i=1; AHgh+RpmyFHK64bPcChW7YKvFaqlDo0ybnl7+ao4dIa/npaUfkaTmRV6kpsccw5lXqVGZTRVY968zRBtdrw65bAw@lists.infradead.org
X-Gm-Message-State: AOJu0YyWfcjrgvAZ3JMgykqoVYCHcmDpYB0Dh2nALukPRRfCU99x7das
	YePLFcJtOV8F7BDQIYrl4CSYc1kzyxSDF+2D+OPAbkGaUZWamVKhZyVd
X-Gm-Gg: AR+sD13nrYI3SlZZMF/XHNRW5RZt7286smRfecGYfEHfAVPiPxZ+DVg1GLK7qxMuZCn
	4iMlTq7TztGUH9OcLwKy8Y2ipkWl7DwnZBDLxhO0TDUTJy1zWSUQk6ZfUwl8ayPnv9yhiBc+1d0
	Hf9sB1p793ztjsnHYkHv1aco0EJGi//KF8vOeoqUT7KhK6KbKbe0Z7BzrqbWkSruGxA0aSWPJNy
	3y8owV1uX6Y9/vW5rgvA4XbZ7dZCq0ixfDBa0xuyHCAFKkNNxz5CYGYlDluYA6wqN7J4R7OTbYC
	UxUPoW06WlLuIpJjgJST6+SQT/4I+2JD5QGKOe1utTi0TIvY1vy4Ej6vc4flFDmViBIZ4H+1H3d
	zvStFyQbs9Ubxk/7lHwfYxW45bylEnmBKdtsHYXGN19/1G6I9jU62i5RbOHZyZYbRq+NFQU8/O6
	MX5MmDk7RE4w==
X-Received: by 2002:a05:6000:178f:b0:47f:7261:3a58 with SMTP id ffacd0b85a97d-47f72613ae8mr9133006f8f.1.1784562061166;
        Mon, 20 Jul 2026 08:41:01 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:e9c1:2f80:10a9:c708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm32667936f8f.21.2026.07.20.08.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:41:00 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 20 Jul 2026 17:40:36 +0200
Subject: [PATCH v2 04/15] drm/fsl-dcu: remove dependency on DRM simple
 helpers
MIME-Version: 1.0
Message-Id: <20260720-drm_simple_encoder_init-v2-4-5020b630668a@gmail.com>
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
X-CRM114-CacheID: sfid-20260720_164103_188571_188AA05A 
X-CRM114-Status: GOOD (  11.61  )
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
