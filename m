Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2EE4CF34A1
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Nov 2025 13:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2dx7p2rIH5dvrLTghoEsdfev8FlxC5566O2O4Qlf7Qg=; b=j5tTxrBZ5eSRXO
	XCQJJr2JWDSzZpts/B7p3FUbKu+CyE6UkxU710Z8k5WnsB5SIPtEmCyf6AXLWfsBQsUl7WiL4C6/+
	ku0RX0VbBxdB5ZU0JmwHGRd0+nEZ/1mWoLVKRh4KpgJ1qOhTKZbsogudro2rftrgz6OAnNOrR9dLe
	FLi/RLpSnrnDacBx0KVDBe6TMcypnlRKsh0Uatrfro7nHPiTl42wGpyaknSpV+2wlXhLwE1wQZ1DX
	Z1zFgkACNeBVguXoB0FvhYfm0TiON6i2GswzspSvuFVvPufKhiHyFsZ1KzWwEzOcg0HUzhebTWmlL
	R+hkDQDNWMIKGf9U7SaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhvt-00000003FUv-40xH;
	Wed, 19 Nov 2025 13:09:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhvs-00000003FTZ-1ngj
	for linux-amlogic@bombadil.infradead.org;
	Wed, 19 Nov 2025 13:09:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=3R9jccAwgQfoRpcq0lXtghHeDDBdPUn13/IbmzrW/D4=; b=I/f0AC804ceKaxgKCWXyLfhp+q
	Ih+QiC8sMxgso2DhtTreDCj08dXkiZ5iD9EqZ4b5iumFohpPx/iy4Mqdq55gozwLHryMOxJi5pTz9
	JnIXhWorIrORRyJ8gGamAiTTVXtq9qYo+r3H4YWMk87jMw0X8eiLDIMWsNDN4M6ci+rqRiaw08qtH
	Ome7eEMM4a2moZa6SC2tesG4fo7kfJkLLG+bWjRP9i+9zaNPTGLLNqYdu3a+hgZdQptxJ4arteI4V
	afxU4TSJkAruujWDvciub5lk3NVnp7jB7+6gzZ5PODRz4Jg1MJAtTa2k+AFGpi7MInPFpaYDJgbT1
	M7yQBUZg==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLh4C-0000000CAhu-1bwN
	for linux-amlogic@lists.infradead.org;
	Wed, 19 Nov 2025 12:13:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9A8ACC1118A;
	Wed, 19 Nov 2025 13:08:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CE48160699;
	Wed, 19 Nov 2025 13:09:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C17DC10371A50;
	Wed, 19 Nov 2025 14:08:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763557746; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3R9jccAwgQfoRpcq0lXtghHeDDBdPUn13/IbmzrW/D4=;
	b=jaLXfTlgfGJD1q4ycUmrcHO2vva+cVfi9yOr1R17eKYTKZugDmnQwimfnLmkK5B7MW1IR2
	pWtow/fuKK/UsBCMQuW+QEcnd7b/qiZ0l91BMWVXucVPrLHevhYo577jnatl9XyyEkqOPJ
	0MIUPKAMLKM57gtwl30bSRAW/YGJDgJQzs739b8cHP1uvfmic/uBlPO7mqEwxYVV3YFhn1
	0bl+kJs//1IeryI8MRllnVxIt19k54Lq9Qj+hamfLB86gXMkJNEbKwftXlssXG36uUxTp8
	gPEgMAMNaD/dr39Jvza7BijfAYSTMuRjdQU0495vGo7L6tfonnVkiBXufzWGDA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 19 Nov 2025 14:05:52 +0100
Subject: [PATCH 21/26] drm/imx/ipuv3: use devm_drm_of_find_bridge() to put
 the next bridge
MIME-Version: 1.0
Message-Id: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-21-0db98a7fe474@bootlin.com>
References: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com>
In-Reply-To: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>, 
 Phong LE <ple@baylibre.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Adrien Grassein <adrien.grassein@gmail.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Edmund Dea <edmund.j.dea@intel.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_121344_725041_371AE991 
X-CRM114-Status: GOOD (  13.62  )
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

This driver obtains a bridge pointer from of_drm_find_bridge() in the probe
function and stores it until driver removal. of_drm_find_bridge() is
deprecated. Move to devm_drm_of_find_bridge() which puts the bridge
reference on remove or on probe failure.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c b/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c
index 07e5f96202d4..1e6be89c3815 100644
--- a/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c
+++ b/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c
@@ -241,7 +241,7 @@ static int dw_hdmi_imx_probe(struct platform_device *pdev)
 	if (IS_ERR(hdmi->hdmi))
 		return PTR_ERR(hdmi->hdmi);
 
-	hdmi->bridge = of_drm_find_bridge(np);
+	hdmi->bridge = devm_drm_of_find_bridge(&pdev->dev, np);
 	if (!hdmi->bridge) {
 		dev_err(hdmi->dev, "Unable to find bridge\n");
 		dw_hdmi_remove(hdmi->hdmi);

-- 
2.51.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
