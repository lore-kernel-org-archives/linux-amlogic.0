Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF6FC4450A
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2026 23:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2GjwR7LCgV+VmDExsOjJzG6xdjCNm5d+lyrxWvdwJwU=; b=QHgZTU+zciee0g
	iSthuMPnOkNjTkpoZZf8tyEwn790fgeP0KtgYpKESiuJ3fsXM0Rtz2OHcUNoGKc5cgTpHlQvHCeFj
	Em9rtslt6Ni+Evps1OtKHh/l3W2prE8YmYJcnB/guH+H8p19023cOlWr4q1MYVj3T6ow+ayGHA1rQ
	bZOD/nwqxQg2XWKH5mzVm/cR1G1SdyPCB9UWj/pPzS2bxPfjFnK6zeaoeuFXk8nNQFrjvs7Y1Ok0R
	lZtTRgH4jzFIlGx+NyvhK61HmYy0fTcaeZ80Q5yZJXGZrRPyN5g8EC9+2mArvgfofs6xU5WdwtGIH
	e4Gwz2PHs4s8IhN8RZag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlEa4-00000004c0O-0N7W;
	Sat, 18 Jul 2026 23:36:28 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlEa0-00000004bv2-0i9M
	for linux-amlogic@lists.infradead.org;
	Sat, 18 Jul 2026 23:36:25 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4954c0833b4so9390225e9.1
        for <linux-amlogic@lists.infradead.org>; Sat, 18 Jul 2026 16:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784417782; x=1785022582; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ATiv+bDbiK4r8/Ev/Mp3rnzRTm75IqK6z6i5srau5Es=;
        b=emSYkNvhyVQpsVYx999zJOlbp5Xb8RHe6kQ7BK7CaeyZIknASV6xZhYgfwV+c/wgHv
         u3xTcSC8OCWrKbdr8bqclN5OB0Na6ognSE6v8a2/dp2iGe0gwPiYnsd9TTmBYIZ9mFy3
         W67DtDkFQgVZ2LV0csNpvJNdrePTY+6rKCXRLRtG+rwGm+Nk9dxyQB6qvcLi72XT0Q+Q
         gpKcJXFZd0YRWk+ogsNu1reDP4U6FiHF7XYPArUsF6gdRaI/Blv2hfaaBq43W1psDVvI
         Het/P0tXiBwbXCw6tLzHuqwGfq6Z2ZyokwqD00IV+4u0PQvYs2ACWi2Ikc6u8ZxSy0H7
         M0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784417782; x=1785022582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ATiv+bDbiK4r8/Ev/Mp3rnzRTm75IqK6z6i5srau5Es=;
        b=LNKQx8NqpK8kxgoP02vhTEWFlcFhbiRpnsAx1CDG4QCJwnYzNeojVNHZCdosFMP+eW
         VAJc+GVoLS7lKRMGDcdn5cweRxnrETcYccWTGQ/qP1STGtuPBDS2cjevXBa4sYVpeC3c
         7KKEUsJzO8dDBZOehLXCInzooStC/rdco1Y2bEL4WJ4zGpEN8Lkat05J5djEGf5+xvRb
         qu6qRpySTcW2kgCXT67hZLrjV/o2bdZkC4UG1HAMbGTwI92X+8+Z/j0fag81xcIs6O+5
         L1HngMFSeUsIpuCl8hbe3IRz6SyJqnh7jz/VHhCl+VWY105/zSH9O8GT4VzMooQuuDYV
         ajaQ==
X-Forwarded-Encrypted: i=1; AHgh+RoZLwvMlXuwS4lAsomOKxwB9IwfDY9QN3OVDIZ16G4UCvKEmirZYYP1mbUufJl4WWrgu9ZuCbr4oGrHalNK@lists.infradead.org
X-Gm-Message-State: AOJu0YzFwzXZXBvmWZarlyMdFNa9yDd/UfI9AoNCOWdARnEDwjO3mJis
	tlUkBveHjSPrmAwvGxYxmGtXvzcn+aS1mn1uYp2hfvEE1+dpNy/ucCkv
X-Gm-Gg: AfdE7cnok64nWkExhGrL1anad04V5opXA/ctOxtPTfCDl74sK17QYoYL8sLfz5Vr1Qa
	N0qBbZDmTzCiM6i3eIHwp70iItp7pa+a9XxLmdTHRCnYRnN1k8ftJofJcMYvu3Gm/DTu7AYyrUs
	n6kknMpyolj1ehQdFZt73CRI5vdv6si8c5/rw8IkAE66gkzhtV0lOpqYubTiXdWD2ngfiHxkgD7
	KT3yCMLnFkK7cBEjKkWbOT0ROBSijLDntw+kri6ZY5HRwLAYGxQIafbfAl53iXAsv99xWSVUbDy
	IqvYIixaI28oCGB1xZBYg1smIBKwrpczZl4FZXE4+8soFyks4yQtwKBEw8EOp4pn/qqhuoaYdMD
	wlS2LqMpN4l81nZdWAIQr7SyZ3wCN3dRzO9408WwXwzeiq9l7y34Nl5cA43BcIpukpn27esGe5N
	g5pgysy6MX1A==
X-Received: by 2002:a05:600c:4746:b0:495:4d07:4fcb with SMTP id 5b1f17b1804b1-4954d0784c6mr79013155e9.36.1784417782504;
        Sat, 18 Jul 2026 16:36:22 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:645b:9e5c:7fe3:c09f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a24b6sm160964675e9.3.2026.07.18.16.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:36:21 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 19 Jul 2026 01:35:38 +0200
Subject: [PATCH 07/15] drm/tidss: remove dependency on DRM simple helpers
MIME-Version: 1.0
Message-Id: <20260719-drm_simple_encoder_init-v1-7-a78c509e3062@gmail.com>
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
X-CRM114-CacheID: sfid-20260718_163624_258261_109F9063 
X-CRM114-Status: GOOD (  11.81  )
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
 drivers/gpu/drm/tidss/tidss_encoder.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_encoder.c b/drivers/gpu/drm/tidss/tidss_encoder.c
index 698f8d964ca0..10dbcc6cdf6a 100644
--- a/drivers/gpu/drm/tidss/tidss_encoder.c
+++ b/drivers/gpu/drm/tidss/tidss_encoder.c
@@ -9,11 +9,11 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_of.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "tidss_crtc.h"
 #include "tidss_drv.h"
@@ -81,6 +81,10 @@ static const struct drm_bridge_funcs tidss_bridge_funcs = {
 	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
 };
 
+static const struct drm_encoder_funcs tidss_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 int tidss_encoder_create(struct tidss_device *tidss,
 			 struct drm_bridge *next_bridge,
 			 u32 encoder_type, u32 possible_crtcs)
@@ -95,8 +99,8 @@ int tidss_encoder_create(struct tidss_device *tidss,
 	if (IS_ERR(t_enc))
 		return PTR_ERR(t_enc);
 
-	ret = drm_simple_encoder_init(&tidss->ddev, &t_enc->encoder,
-				      encoder_type);
+	ret = drm_encoder_init(&tidss->ddev, &t_enc->encoder,
+			       &tidss_encoder_funcs, encoder_type, NULL);
 	if (ret)
 		return ret;
 

-- 
2.54.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
