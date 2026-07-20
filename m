Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64397C44520
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jul 2026 15:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sGOMte3bRLStp+BwLxJrlR2ZjK34PAt9AOANy6YWgfI=; b=B8f3/f5A/0wLQz
	SVGNuqjIg2Mn9C0Q7qdrW8F+3kukKmN+aaqH7jb2roseIN8/c82mNU1bKf+spGoL44F0xmdwnJ0lw
	FFkwVP3i57hYtOt9uQrRiWiyzLpyXsHybptOxcU/R9zOXynu5JBBQoYnQ27yMRu+ND9iCoGAw0DpX
	1i8gjEl6t9WtCywTMQ4hlWwJALSqYZzMOLWZr+xsE+0ISLJ8HHN6Phf6QRLjtvq03y/tFTLafw2DY
	eZvFctC2hqTJ7nTLoTddooLcWZ84f38BxyA+szh71P2W2gs5eDZudk5oujEacjqHFXhbLpZE5nmWK
	JAYzqLeK2VxLnLQ6+cSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq7G-00000007EEb-108f;
	Mon, 20 Jul 2026 15:41:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq7F-00000007ECU-1JL9
	for linux-amlogic@bombadil.infradead.org;
	Mon, 20 Jul 2026 15:41:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/m2It/8MnIxoX8xbOWjx4p2UhJgFTMfhBAqsULip3yI=; b=qmq+fK3pjpMoiVTUZE8HVEhhhw
	F/sLCgGlyNraLz3V7DPvPAdu1MlEeNKkXfz2D6z0BYbNToiMKckggSbTxFUHZ/PCkiRvutZ8ni37B
	e60pnt3McFxkz8yeY+qdSKjiUIMie4j4yTarHBxWZStQCgEigcqWcSNiseBIyhUUHzCYiQ5J/qe2Y
	cszwzOz8MiTFXE22ihqSigwLGr9dI3+sWg5qvF8RLr1Wm88wm5zzJmh4diQZsxCSusL9QyN8Epz9l
	kKsgh6+7HQ7KyTlHA3gw6vgQc8wKB0dx6LVKA2VfuXpEGPKHGPqgkxZYsMLZ70IPD1BhxOCrd1LIK
	qYljyqUg==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wlq7C-0000000GkHF-2V0Q
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Jul 2026 15:41:12 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4954d383e64so16282335e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Jul 2026 08:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784562069; x=1785166869; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/m2It/8MnIxoX8xbOWjx4p2UhJgFTMfhBAqsULip3yI=;
        b=JhhAGFMz/58WncTcLFSfGXe5VoGt9FbpBueC6PldvHQ+TB6tdwTOZMZcbm0ILywdtD
         /E7QP234NQt0IrGrLIOOE0vJd40xmgeERDtBB5Kx4bElXA4IzB/ETM334crFGOsR7vTD
         7W0BAxZY02jgMz51FnYSZZkk6XWCu+0eUpELWOQk3BMmam4Dz93ElQXyKYrSN/XBFFpU
         qCk/4+z+ECS/n1N/RzZrMpyxKorD7BnLPxt9BkwTb3ut3LyK00XCVj8XPw5Ysp+L1GDU
         5bDO8JkyRdxxqJNKFImWu2ljO0tL/PTX+iKH4G6TH2Z3tbaxBQ1TxwTJ0q0ddJjD5S7u
         1e6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562069; x=1785166869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/m2It/8MnIxoX8xbOWjx4p2UhJgFTMfhBAqsULip3yI=;
        b=RasbwKOijVtMGczKMsMDYQkrrNAZhkFxpXZlz4UmHpg9PMydTgKe4poTNLEHzGuPxB
         BvGaF/vPHGXjVI2kJT8gEGsN/LLhBckoXj1UfjMQIUAjb+xpfqvsDRtcS9qtgRU4ykJR
         28oK82m872x1rbxXllIydeL6VpAZPp1pBsQMDITBtB9zjlJF0XP7UnzYeVbyHGyW5Inu
         uzBqOXcVuXqHVJzIxTCdKhOFIFE451C/jdGnX2ND3ETzLztfDX0DQbcM0c2N7dUiUskT
         1nUd/kt9ITxOpD7mpdR3fgVv9OC7yd4Uqe6u64Spfxke+6onlAb5yfcu9oj4I74q3xnv
         vCnw==
X-Forwarded-Encrypted: i=1; AHgh+RqFWUuu89FLvEVUPFMjiOW0qOfQTwMvoYqMBhjNbRHSXsW1do2Ckn0jHcAynFDVRozaQqOgdqBNaBdoH5uV@lists.infradead.org
X-Gm-Message-State: AOJu0YzhULWZH0qNv5VDlrP7CgLrQykCm3+VsL9RUNjioNeyvXUgiCJ1
	S4fGoimcG0pMLzN3NEYVVt6tbi8YEJ37g1BE6YhV/GmkfYmORrn5ChP4
X-Gm-Gg: AfdE7cmBiUUAD0ejTbKRudNXnlxcvcyEjc2hFd31FtUHuWLqcp5zwBNI+5b21a+QIuK
	ssjreA/hPhCPHYpLbQ6Dg3Y33ue21+IuODAkTfF1WwYNP51ErR3eZXsFO7CyA6wCYQ3tCWkDq8r
	iBFOUvC7G/tXeM5tvpsyJeT5abAvshkB+BJ+gJzJfAuQ7WsmvVuVF9L4aJMHmeaikKlVD3xg2O+
	pTkxj8jmh6DP/GFWAyEHOtvh/T3Fiyx5aWF8b7VYZDqvare+R4EgIJ24e9eTcseRZbUj6s5MEYB
	bJQsZdycLPpIJl68OyeVdWh9PoG1eDpQVAt3tFtc9J2YSmfkZ8FGdCRrnLGZcmf9Iucu8RAiD9e
	4T+7RKVRRE5hX1OPzU2pjVxbGa8k1A3lPOK/4rps9e8dlDHyNaJlVrrp+kFqUl9tIbYHzMT9bT7
	6O9mpi7enHMw==
X-Received: by 2002:a05:600c:1f8c:b0:493:cefc:d113 with SMTP id 5b1f17b1804b1-4954a3e6e29mr174459165e9.5.1784562068798;
        Mon, 20 Jul 2026 08:41:08 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:e9c1:2f80:10a9:c708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm32667936f8f.21.2026.07.20.08.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:41:08 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 20 Jul 2026 17:40:38 +0200
Subject: [PATCH v2 06/15] drm/virtio: remove dependency on DRM simple
 helpers
MIME-Version: 1.0
Message-Id: <20260720-drm_simple_encoder_init-v2-6-5020b630668a@gmail.com>
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
X-CRM114-CacheID: sfid-20260720_164110_705400_1ECD7C74 
X-CRM114-Status: GOOD (  12.82  )
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
 drivers/gpu/drm/virtio/virtgpu_display.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index 44ffffec550f..67023d91d40b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -28,11 +28,11 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_vblank_helper.h>
 
@@ -232,6 +232,10 @@ static enum drm_mode_status virtio_gpu_conn_mode_valid(struct drm_connector *con
 	return MODE_BAD;
 }
 
+static const struct drm_encoder_funcs virtio_gpu_enc_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs virtio_gpu_enc_helper_funcs = {
 	.mode_set   = virtio_gpu_enc_mode_set,
 	.enable     = virtio_gpu_enc_enable,
@@ -306,7 +310,11 @@ static int vgdev_output_init(struct virtio_gpu_device *vgdev, int index)
 	if (vgdev->has_edid)
 		drm_connector_attach_edid_property(connector);
 
-	drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_VIRTUAL);
+	ret = drm_encoder_init(dev, encoder, &virtio_gpu_enc_funcs,
+			       DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (ret)
+		return ret;
+
 	drm_encoder_helper_add(encoder, &virtio_gpu_enc_helper_funcs);
 	encoder->possible_crtcs = 1 << index;
 

-- 
2.54.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
