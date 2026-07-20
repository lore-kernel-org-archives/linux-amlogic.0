Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C59C9C44520
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jul 2026 15:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HSxqai90eUSNhJi/FXoJOI1anumow645N6xuWooZWQ4=; b=0o+wTSSTlBpcnw
	GyiWE+xzp6sPZY14BtMquMwuPrhNlU/YyC/+wcYMm5GjKwitOStHsjVfP1ovatpjhEyBVv4hdRCz4
	edGRleF3D7Mk+YYLEZL5mA5olAtPEykZTyAfRcq65tOSS3i3UjPZwOVXEjPSOEpNEL7uukwWzVkE0
	C6Bn8XtjHq7xItdMEC0PoMTHhGm7VEHqUnJkzrL2iVdxPUpo1Qmyv7ZmDqbQSydqOC9+KQFrKuZGE
	Pp+O7d6qfoyVvc0vBrUVhzcCC8pEdrptzzIigB/qJmmiXMzDiDy+ZKRwZrKc/6N3yJmtFmKEB/nlE
	iO/y9n7dc8qQLFWYqC5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq7D-00000007EAm-478L;
	Mon, 20 Jul 2026 15:41:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq7C-00000007E7x-0ywv
	for linux-amlogic@bombadil.infradead.org;
	Mon, 20 Jul 2026 15:41:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Vjd+2BbZ6IkIhW8JUSKZxdlN+XT2WH08r3urmJQpGFU=; b=Oqu9ltd7/63UBdmKyBIQztl31c
	e9AmAqy3ul9cKsAq7wOj5k9wNQS3IsZy4ZRG07H0be4g2A/xl904K+FovKkqgWcjHWyFdeilGulG8
	BL8xLZ9rWHB1r6c242Wj8zXLNu5xSm4wA9o6uU+B8gLRFlYscPbJyCcJ7E8QEV0LWVydo4haYnAAb
	XF3SK2zOC3f1kz+Ep44zCL7OeDOaiJp/jlmmtsWshNIkdOWLg3d6QNM15F1lDmv4QT+FnR1NhF8Tn
	VMYEeL0ul2RmGtfkJgR9UtRV8y3O0uHIKHykdqT2w7sAOhT9mXwqsEhliFchqO25FtbErdHmXbj2B
	q74CJ0Eg==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wlq79-0000000GkGD-0Zt8
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Jul 2026 15:41:09 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4954dff6536so18773745e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Jul 2026 08:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784562065; x=1785166865; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vjd+2BbZ6IkIhW8JUSKZxdlN+XT2WH08r3urmJQpGFU=;
        b=eL4gQKo2CIKavg3FEwpnC2F2bDOCj0eqKWxj4F99YvvLOkG6oQjWkFwOHLKdwtz4zj
         PSLcxfSwDezlB4qry6/5IZUT9cHoesnvAzs61ax0ht/lx6+fw8+UBMIOcdIv7qqJa504
         Ya7sKm+gSqry5Uta5HU0KcpYW9WCUdpUJ5h6gGR48LAqKQimNLQQPr2efo7p2JdtXcO5
         fJT+Z1cw2ym7LviMZ6ZwHIdL4RxO644cNIAxSUT803qZ8u6oh+8X6FC0o1kbsOY5DOax
         g99C2j3rNt0oNwVEdaL+jc0EGNuIOVtJwIcs4s2mgOzlCHOqel9IYbWxyheOTEQ8oZfg
         gY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562065; x=1785166865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vjd+2BbZ6IkIhW8JUSKZxdlN+XT2WH08r3urmJQpGFU=;
        b=Iy1r9dc0zHAHk6JQ39qiwp6mwbC4M2cxWoFePOmRMhppyRmGDm7Otybo4CaFLZNR4S
         QuDHrse+WC5z76RR6sXVpqp/sAljhJAASAe77dmtOw2EzKdemvk70n2Qgk5vdmglckSE
         VWcLkB/g+nNeSoIznWtwppf/fcj96lZVVDd30QNLUn8MbBi9axf8Pc+/GnKZDITmIcdd
         Vt/NMbB5LN+Fq8tXo74cmdwbfgAmGgoJnb8vBdewvtZ2XFx/tGw/+rWkYVnTFVRkgRgW
         gZmj80PvsVRS2gEu2XqLlLEMrPTc6T8p5+X5GLVatedHpugYaUP4K3imlIGbZm+hw2VL
         KjEQ==
X-Forwarded-Encrypted: i=1; AHgh+RoZ7PjbW7EQxrVtC0jhvBA5ziTdPBD051RFmVyS4OWi+/NLbeBBqnlqRY7OEFTorP63te6xi+ry1jS/ZWBZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxsDWGb890OZQprunjWNhVKg1R8xH0ddRYrOflF77/1ya1mfvT+
	iNUlNtF8kh6cveWdOZd8FmYohuEhBbHqVYkVDj7CAUd7gE/+S+Rs7gb0
X-Gm-Gg: AfdE7clykTfYF5ayZvf+Dkr0Pg26K5bpqmXQ1lP03c93WjbWGFwBdg5OrPaXvjtKxAz
	1BgluZRxNBjj+N0VwlQqsktF5r5dk5knQrCiHk/bYn61dNPm3FjQ5VKpScb70BEy8Y8C9Koyf4u
	g1M4AYXcneUYMZpFKkzw7ChQVFIaEau1mRfNzMW07KAvBmzW81Et6h2L2+su6ZJc2KeJuD8OBg+
	sdVZAiBCgRQBhBvMQw54y1smYaDiXrH+wjBFncon91xsG2DopA7lrrBLKjbUtZR8sEQrZVbYTeF
	k5pycNZ3PcCS44fHlsDeaiLY61GIc4DAekC233gDZ8hV+5w0ByU5FVjTjH0XgmqGvLJS0LQFp+2
	hltSyJw07IA14ZSVRr90UM0Y1P5SIi92NSG2MVBQa3fMJRcBcp1xC7hY7CFHqwP0x/ulkN5Hg2C
	c6sgAod2FtVQ==
X-Received: by 2002:a05:600c:1d1b:b0:493:f7c8:eae2 with SMTP id 5b1f17b1804b1-4954a3db7dbmr155975945e9.15.1784562065028;
        Mon, 20 Jul 2026 08:41:05 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:e9c1:2f80:10a9:c708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm32667936f8f.21.2026.07.20.08.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:41:04 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 20 Jul 2026 17:40:37 +0200
Subject: [PATCH v2 05/15] drm/kmb: remove dependency on DRM simple helpers
MIME-Version: 1.0
Message-Id: <20260720-drm_simple_encoder_init-v2-5-5020b630668a@gmail.com>
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
X-CRM114-CacheID: sfid-20260720_164107_347453_A4402DD7 
X-CRM114-Status: GOOD (  12.38  )
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
 drivers/gpu/drm/kmb/kmb_dsi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index 59d0e856392f..13adba96bc78 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -14,8 +14,8 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_mipi_dsi.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
@@ -1427,6 +1427,10 @@ struct kmb_dsi *kmb_dsi_init(struct platform_device *pdev)
 	return kmb_dsi;
 }
 
+static const struct drm_encoder_funcs kmb_dsi_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 int kmb_dsi_encoder_init(struct drm_device *dev, struct kmb_dsi *kmb_dsi)
 {
 	struct drm_encoder *encoder;
@@ -1437,7 +1441,8 @@ int kmb_dsi_encoder_init(struct drm_device *dev, struct kmb_dsi *kmb_dsi)
 	encoder->possible_crtcs = 1;
 	encoder->possible_clones = 0;
 
-	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_DSI);
+	ret = drm_encoder_init(dev, encoder, &kmb_dsi_encoder_funcs,
+			       DRM_MODE_ENCODER_DSI, NULL);
 	if (ret) {
 		dev_err(kmb_dsi->dev, "Failed to init encoder %d\n", ret);
 		return ret;

-- 
2.54.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
