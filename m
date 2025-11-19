Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA09CF34AB
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Nov 2025 13:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7YZAXcWjcRobUGTklLja09XtjFP+AufnFzV7bLM14NM=; b=vVnDRq3YyPUY5C
	+kQfXG08UCoYDHSVaJRPD1NEI3GgFKkrp+J2PoPPwCoS/ZWLH6cRSytCSs4GBfFqsIx/2wx3pSoVc
	sYtXncI9UeKG7O3iuXPNCIAP5VG/1m58pDTLXWd6zr2Tt5s8hH+9wHZSXFbhAyvDTYRsWuMGq+b45
	/rPO+x9UjeczrfIQ5klhpYeI+sPRue8W1B0+Y3dP6gvaM3S2fTIFx5jCQLN5e9fS1Wt74twzmVtfa
	ANdCkTuz+9SvfaTLoIH9crLBDB/ctVZ3H+5W9exvnMknmIvLRB6y6JEq8L3INYDXWRDK9DdRJ5LpW
	kL846NM1zLTdewJhx0UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhwJ-00000003FhV-2kjL;
	Wed, 19 Nov 2025 13:09:39 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhwH-00000003Ffs-1at9;
	Wed, 19 Nov 2025 13:09:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 65380C1118B;
	Wed, 19 Nov 2025 13:09:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9A93860699;
	Wed, 19 Nov 2025 13:09:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6C22710371A51;
	Wed, 19 Nov 2025 14:09:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763557773; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4KsAxr99sySjsHY4TzPD3tHVsqK24nvaf2pqUbhtfhE=;
	b=eFO/4Rlu3Uf78uzhv0JnR9qUBkqFoe2WKu1Co1Zu2JA1WIDasTZJBx0sK1DxfzXlABNasG
	lb2jGVecmiky5rYpazHGScJ/BcAJ+e3nM+IrKfhG+z5BM5szUFS+l1xFAoQFKN4TNOQOVv
	vMTI3SNx/cFdaIT1Z2dbGRkb3Zbb000yEiForx2ryqeIbKDGL+29/XmBsxrXpO+GVPrJ63
	1H4rhHXTRroALZGquT9aB6ANlKDmYEcNXjSbskd09sExCd16ftKtkvWnm0rUFwU7H6H/eH
	nYdjSyck4h6Ng9NSBA9KBeI/qQB+Qu0y0yEisFRcfBqgnC0D0QHvj1KjddK/wg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 19 Nov 2025 14:05:55 +0100
Subject: [PATCH 24/26] drm/bridge: imx8qxp-pixel-link: simplify logic to
 find next bridge
MIME-Version: 1.0
Message-Id: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-24-0db98a7fe474@bootlin.com>
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
X-CRM114-CacheID: sfid-20251119_050937_588059_E28AFF1E 
X-CRM114-Status: GOOD (  16.92  )
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

imx8qxp_pixel_link_find_next_bridge() uses a sophisticated logic to find
the preferred next bridge, using an array with two supporting index
variables. This is more sophisticated than required because we only ever
need a pointer to the "current" bridge and to the "best so far" bridge.

Additionally this logic is going to make the addition of proper refcounting
quite complex.

Rewrite the logic using two drm_bridge pointers, which is by itself
slightly simpler and is a preparation step for introducing bridge
refcounting in a later commit.

Also reword a comment to make it clearer.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Cc: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
index e5943506981d..53016f0d53a0 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
@@ -261,12 +261,10 @@ imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 {
 	struct device_node *np = pl->dev->of_node;
 	struct device_node *port, *remote;
-	struct drm_bridge *next_bridge[PL_MAX_NEXT_BRIDGES];
+	struct drm_bridge *selected_bridge = NULL;
 	u32 port_id;
 	bool found_port = false;
-	int reg, ep_cnt = 0;
-	/* select the first next bridge by default */
-	int bridge_sel = 0;
+	int reg;
 
 	for (port_id = 1; port_id <= PL_MAX_MST_ADDR + 1; port_id++) {
 		port = of_graph_get_port_by_id(np, port_id);
@@ -300,24 +298,25 @@ imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 			continue;
 		}
 
-		next_bridge[ep_cnt] = of_drm_find_bridge(remote);
-		if (!next_bridge[ep_cnt]) {
+		struct drm_bridge *next_bridge = of_drm_find_bridge(remote);
+		if (!next_bridge) {
 			of_node_put(remote);
 			return ERR_PTR(-EPROBE_DEFER);
 		}
 
-		/* specially select the next bridge with companion PXL2DPI */
-		if (of_property_present(remote, "fsl,companion-pxl2dpi"))
-			bridge_sel = ep_cnt;
-
-		ep_cnt++;
+		/*
+		 * Select the next bridge with companion PXL2DPI if
+		 * present, otherwise default to the first bridge
+		 */
+		if (!selected_bridge || of_property_present(remote, "fsl,companion-pxl2dpi"))
+			selected_bridge = next_bridge;
 
 		of_node_put(remote);
 	}
 
 	pl->mst_addr = port_id - 1;
 
-	return next_bridge[bridge_sel];
+	return selected_bridge;
 }
 
 static int imx8qxp_pixel_link_bridge_probe(struct platform_device *pdev)

-- 
2.51.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
