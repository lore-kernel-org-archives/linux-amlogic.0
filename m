Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88D2D609D8
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Dec 2025 18:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=40+qsXnFsH4oaqbDvLk/XXLFWnBiXMISw44WoHu6Fxs=; b=yT7AhvSrNheOEd
	kl0UHGhanfi/kkhDBfBdlnm1ZucnhIe8gOYwP2uQ8H3A6Rrr95vxxr+E6EvrGwwgc1ArS6GNO2DJ+
	GspDlfyF0QjagkjFkPtVWjsal9srGpcFv1xL4rwy14iy/4IJMBYFLK2yhuRFcUDqnfPtWtX+T4kF4
	rULvxSs7T/KXGUbVvNJbORQ58cRf4R10SxHw9uI+tQRpnbyOUHod8Y9szfqwQU1dZrKW7zuChbaeW
	CrceHvSAuqLfRacfObDYL3l3uNwk9sb731fh/eG++4PUqhA/WOGrXakQjb2ljFo6uXP+bajIrKOS2
	sMpyPVYUvaKwui2Pl5SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZLD-00000005eGC-1rAc;
	Tue, 16 Dec 2025 18:00:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZL9-00000005eBO-1eNa
	for linux-amlogic@bombadil.infradead.org;
	Tue, 16 Dec 2025 18:00:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=pdfuvq8Da5wDFIV2j2xMDJsP1aZVRXCSX+C3BQ6euSA=; b=VHrQ/zbeyT+n7Jpk4n3q0nmKH2
	yx9IcaYaTu3TaJdQolCvpPPHVZae8lfsa+nJ6haUWPPvjHuG8qfj0pFA1g1OGlQ6yFuIs7jc1XaoL
	7jhhSfmWNr35X58qDkZJaKLXCoH1z4/OrO/IpvXa33iUc+rGMxvzyBIbO8fupzaA2XCxEPIk3s1Vv
	mVIF9EfFr+sSKgI1ekiRVjgjhJFp5uig0ZQxF4MjBz3JFVktHOe+/iFhytPnNYtkC8TWVm6qUSLCt
	K7HzShzwzPE8zO0tMtNC9ou+vazug1iiOTEM/zyjOHof+cmbpyrwOZLpXSnydSsmRaLpi+SdO02WZ
	DZhQnt4A==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYTb-00000005JRh-35Y5
	for linux-amlogic@lists.infradead.org;
	Tue, 16 Dec 2025 17:04:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 57C681A2257;
	Tue, 16 Dec 2025 17:59:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2D3616073D;
	Tue, 16 Dec 2025 17:59:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C56FD119A97F1;
	Tue, 16 Dec 2025 18:59:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765907996; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pdfuvq8Da5wDFIV2j2xMDJsP1aZVRXCSX+C3BQ6euSA=;
	b=DghY/Hrtc+jcjjGQOpuF405MXO3TebHRiT08Bn8h/TiUKqQp0c0PFS+aUhjSgcqbw3gpGt
	Z1DDBzwsJb4snp+EygzdAxCrdm4Fq8zSiyid+QHayT8bD09vEtrGJ2sG+6r5CfMzM+W1Jj
	22KH3Eq/dBU4r54vP0wbPNkrhYD6daFllEWRzAfvLl7GsIa1Wl4KeTbS0xSMWQB6YdkGao
	P/4M1YpBGGxIzQ9KLLb9sneh9t0dlVllJtl6zBc0d+rTKr2gzkmNV6X4DdznBp4zeoadwT
	4ehJooGXCFff86lQRMd8k9zMhdBQrldfoaof6uMPkNd4fTf4JQlkiKsuWeWg2Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 16 Dec 2025 18:58:41 +0100
Subject: [PATCH v3 08/22] drm/bridge: imx8qxp-pixel-combiner: get/put the
 next bridge
MIME-Version: 1.0
Message-Id: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-8-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
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
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_170444_826565_6EDA43C6 
X-CRM114-Status: GOOD (  11.94  )
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
deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
refcounted and use bridge->next_bridge to put the reference on
deallocation.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
index 8517b1c953d4..74eda8b54023 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
@@ -60,7 +60,6 @@ enum imx8qxp_pc_pix_data_format {
 
 struct imx8qxp_pc_channel {
 	struct drm_bridge bridge;
-	struct drm_bridge *next_bridge;
 	struct imx8qxp_pc *pc;
 	unsigned int stream_id;
 };
@@ -120,7 +119,7 @@ static int imx8qxp_pc_bridge_attach(struct drm_bridge *bridge,
 	}
 
 	return drm_bridge_attach(encoder,
-				 ch->next_bridge, bridge,
+				 ch->bridge.next_bridge, bridge,
 				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 }
 
@@ -326,8 +325,8 @@ static int imx8qxp_pc_bridge_probe(struct platform_device *pdev)
 			goto free_child;
 		}
 
-		ch->next_bridge = of_drm_find_bridge(remote);
-		if (!ch->next_bridge) {
+		ch->bridge.next_bridge = of_drm_find_and_get_bridge(remote);
+		if (!ch->bridge.next_bridge) {
 			of_node_put(remote);
 			ret = -EPROBE_DEFER;
 			DRM_DEV_DEBUG_DRIVER(dev,
@@ -349,7 +348,7 @@ static int imx8qxp_pc_bridge_probe(struct platform_device *pdev)
 free_child:
 	of_node_put(child);
 
-	if (i == 1 && pc->ch[0]->next_bridge)
+	if (i == 1 && pc->ch[0]->bridge.next_bridge)
 		drm_bridge_remove(&pc->ch[0]->bridge);
 
 	pm_runtime_disable(dev);

-- 
2.52.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
