Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FC3C44524
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2026 23:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+FJ5JHVVomarwEqp/3pvIxYOSIL2RiIVuv4UiA4NOJE=; b=BWZwr2ln7k6Knp
	RFtjeD8igEvOWekZCgDPAeUF0aYPy0ded81MybVYi4fq6+rayKyDFfbYs8s9vH5HonKDPtG+MLTPT
	Aqj5/sfbefNNxxAbKbuMKQqvA4Y6t1dNuyyCMJBU9BQ+hwiAhLSCjRhO+lxAEMVrGTtVrWgEZ6ZXf
	WhKRKYbyI24a+JqNAiEI7OYXYbmg3bftCzkKdDWKUZOST9xz0wB/UkxYATiK3IhTzVOcc9avU5jJf
	MY7BWd2uDkcxPAe3rKwbPpC8OtIMdTqoWvEixNwKxVUawnx+LRDObCg0f6kpnNQFkh69LTJsN2+Di
	KiToYHmTyG8zGtCAsbpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlEaU-00000004cYS-3aYr;
	Sat, 18 Jul 2026 23:36:54 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlEaR-00000004cTS-1k8r
	for linux-amlogic@lists.infradead.org;
	Sat, 18 Jul 2026 23:36:53 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-493b966dd74so36650145e9.3
        for <linux-amlogic@lists.infradead.org>; Sat, 18 Jul 2026 16:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784417810; x=1785022610; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=77r3PWO7yo5+W5LQS9FlqiYUpbSGXMMaR8d5GZmSOF4=;
        b=kBfwcd0xj4BOAQ8WHqSdypREsdJW2elx3EIym28PPkIK5tMekVhkxtPFho9EY0fcho
         rJ2M1JC2JVYqmsx+kRnemyJAYx1wUjfOSQRbpYUuawcjtpnKVkngCXnm5uZzjOcnWnIZ
         3/rxHWfOOnTVo9kTDLll3B3zssmbbX9Cidtw9bdSmoguQFaxB/AyReFwP7kXGunbroYE
         hJa+X1jKjLdX5FX5Mo9dvaWiMJuEbA1aTyHwvMsSK8QPgrqV0s+yDMsOKFskN+vjpWvh
         gWtMs1WMT952lOLUZ/Vp3oIiCwYqUmSVq4V+8I3ySRuyOohvT31eq6mEEFqg4y9bJWf0
         xvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784417810; x=1785022610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=77r3PWO7yo5+W5LQS9FlqiYUpbSGXMMaR8d5GZmSOF4=;
        b=sE6MIS8hgqZPaVFfUc24Dm/9q4DQ9iop0BXPp3zquGNVBjm/RYSh04wsF6Otc/L/E9
         3I0sJcrZZhEpkinuLwpU/S+807TmIWPsnbodbb4I+ZqQAhkd4L6dOTv3J1G7Ic73MpjF
         Zc80KhQNCWN7BU8zpwpi2jHBle4GG3uMIPMukZFOPLcfR3TjItZ67SPKMwtRrXgTh3WE
         QvYSM8m1mOcld3bdJgVMokc+d2q+hexyoqcvXjzU7QWw3v7Rlj8c6FWyWBD+3KLIPe0a
         M+KY/5nAfRJ3tUNT1zuE0VTUSzm2MkeRSIjYGmYz5CbBInXTjf6S2ZR2fp6Irnc2bhbR
         64XQ==
X-Forwarded-Encrypted: i=1; AHgh+RrPBqKsuPCK2hxIbkGuI1Ml7KGKtnKzjlKm7NyjzAuFFIu20koXcHI08SaU6Sps4FzXX+bUECbSgDM3M6l9@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh0fZiBYeqDq7t3oFztR8f40mAS/vY/VHsnKApaTIp4fCenRZs
	o63ULE3qS3joZtyCGVUerQb3lqHtRP5tyZArBMXHt12uSDEntI2enydR
X-Gm-Gg: AfdE7clsRBqsj+9vFQxfd5Gn/pNrUxCcBtzkG5b5ll1hR01x96ydG9/Ric9jf6BZIRp
	X7+gnH04AZQJvjPBbOjWWl5d3NomyZtjMbk/rQnvAkKUSv/Sv4hQdnEYfzIFj4Xr3ykh/Lp9bAY
	i6FCIQ2mHmkEClv9vvrJDV2SxphT6vX6NBS9a2hR0IdK24/mlhz6ZnlPyVq7EamvCz/fAvdLNa3
	nxXrEtiCqX0SM475DxI3iaFHM/JlZ5/kswix4x5FT67z3qZcM9WREX0ONrnJmY6cjr/lVtuD6cn
	VKEX/zq/egqk26tBDXSfs//mEk7h2cANgWy/h6grhDpA7FLsGzlLWU0bwgGfdzxbcN6Z4YvAr1o
	p42+9zdfU5dO+9R9tM1GxMiAK+I+ioUdWDFQwP5onBYoHKw4IV75LIp1i6m+Yqb25O62DyeAUI7
	xLy2mDwIIaMw==
X-Received: by 2002:a05:600c:3b28:b0:493:a623:d090 with SMTP id 5b1f17b1804b1-4954a3f36b6mr89247115e9.10.1784417809642;
        Sat, 18 Jul 2026 16:36:49 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:645b:9e5c:7fe3:c09f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a24b6sm160964675e9.3.2026.07.18.16.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:36:49 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 19 Jul 2026 01:35:46 +0200
Subject: [PATCH 15/15] Documentation/gpu: remove completed
 drm_simple_encoder_init() todo
MIME-Version: 1.0
Message-Id: <20260719-drm_simple_encoder_init-v1-15-a78c509e3062@gmail.com>
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
X-CRM114-CacheID: sfid-20260718_163651_492387_FECFA954 
X-CRM114-Status: GOOD (  10.18  )
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

All drm_simple_encoder_init() users have been removed, so drop the
completed todo item.

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 Documentation/gpu/todo.rst | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 14cf37590fc7..b7351467dc74 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -29,21 +29,6 @@ refactorings already and are an expert in the specific area
 Subsystem-wide refactorings
 ===========================
 
-Open-code drm_simple_encoder_init()
------------------------------------
-
-The helper drm_simple_encoder_init() was supposed to simplify encoder
-initialization. Instead it only added an intermediate layer between atomic
-modesetting and the DRM driver.
-
-The task here is to remove drm_simple_encoder_init(). Search for a driver
-that calls drm_simple_encoder_init() and inline the helper. The driver will
-also need its own instance of drm_encoder_funcs.
-
-Contact: Thomas Zimmermann, respective driver maintainer
-
-Level: Easy
-
 Replace struct drm_simple_display_pipe with regular atomic helpers
 ------------------------------------------------------------------
 

-- 
2.54.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
