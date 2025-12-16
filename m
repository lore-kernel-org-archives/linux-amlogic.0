Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E13D609DB
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Dec 2025 18:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q6ZVOyHq6jtiDKaXFc3eGIMcbCzszhhISefMTMRmz5s=; b=pBsGwb65Yvajmf
	GXHl+Zam7vZBDy7cBIngBcqLASznrTHmlqsOYD1k9B53eeEMDvrbBctHygrAY8ZVaRZNQSsZUuRNx
	BDPdmOSKAZHx480x5PrVqw8ycPWCT8yTm0oNf4hcQG3mILXCZt7JxKGi2UnbydKSFEbh732V1GVc/
	lxb32BuFwU8PzQ1pRBBg7EU7UWs/XKr7NLUzODXdtMhgztHBHvWpEjshYbrIHfPiOvtttf8GRIkGr
	BOu1OO9ldsFy5u7Cam2Yv1XBmR+QRwwarJANb/LJIWep2kOVvsaOTUCEhK6u4oVCauWjcvWrxklYq
	mapK81lP/JVq5ipArsaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZLI-00000005eL8-1tsI;
	Tue, 16 Dec 2025 18:00:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZLE-00000005eG7-0ltg
	for linux-amlogic@bombadil.infradead.org;
	Tue, 16 Dec 2025 18:00:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=onXsky4iYh8qdHLUFksOwNzxyXs/762w685miz/sGuY=; b=Opat+KcCXeI2NJ2gFHABEJWCH6
	9/DoNarE1+Qqp5MjQg4sSDc28/sHZaU1fj7GgjAxd2G99VtTOBGQnIwoIu8flHUdJWrI2a2wP/QWU
	EoAA2DO7gXeP9U5fFSiZesRQjWdhMra/bL9XQGuadjRgnawwCFla3agPCoZrmy6cbPn8oUi8WtR8h
	qNzjSso1ZHnS3xx63S92XZlYRm9tJhnA9osKZ8cAfKcawwqFm3PbABI4QIUxWUl+S/7OdHJY4O63Z
	njTRoGcpvzcP8DNpB2NStIt/B2ZXBk8YbqiWmt2myPhyZg24MMDbfTBRPgdI0VFlCJdGVI0msqds/
	wlSnB5vQ==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYTf-00000005JUE-3jv8
	for linux-amlogic@lists.infradead.org;
	Tue, 16 Dec 2025 17:04:51 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7D0AD1A2214;
	Tue, 16 Dec 2025 18:00:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4E54D6071C;
	Tue, 16 Dec 2025 18:00:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3F02F119A97F2;
	Tue, 16 Dec 2025 18:59:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765908000; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=onXsky4iYh8qdHLUFksOwNzxyXs/762w685miz/sGuY=;
	b=NiFXJ3LvVlVlbQaR1ydTw0y0QHcb5WH2n9zoyKRRhiY/o+/5yadBMruygMhNKX3cG8sS74
	qTQ9/vcQQ5iMSyhfcWoDxsd8Xd0YdXbWNx1FWQASh92BtxgRf97wau3Y0mq929Q14jtWH+
	VP+bI09BKzTrUbHTzC7MliSvGoYESQZuDz1YA/BKz0dY9JImbFFqPb+E5nrCEVFefscvxP
	N/UP3FEi3RqXvFJI2VOysnqQ6Q7yygBN3d+mQr0f0j6FRs/CsZ2/b3PYZcx4VCZWT5/0ax
	owZh2mNsjtwvgrmV4KGkH6ZTeBqLf8/eax+bN2nPySdFW/0exZRg5jZ4KVM5cQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 16 Dec 2025 18:58:42 +0100
Subject: [PATCH v3 09/22] drm/bridge: simple-bridge: get/put the next
 bridge
MIME-Version: 1.0
Message-Id: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-9-b5165fab8058@bootlin.com>
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
X-CRM114-CacheID: sfid-20251216_170448_179684_36C52CA9 
X-CRM114-Status: GOOD (  14.13  )
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
 drivers/gpu/drm/bridge/simple-bridge.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index 2cd1847ba776..873b32cfb508 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -31,7 +31,6 @@ struct simple_bridge {
 
 	const struct simple_bridge_info *info;
 
-	struct drm_bridge	*next_bridge;
 	struct regulator	*vdd;
 	struct gpio_desc	*enable;
 };
@@ -54,8 +53,8 @@ static int simple_bridge_get_modes(struct drm_connector *connector)
 	const struct drm_edid *drm_edid;
 	int ret;
 
-	if (sbridge->next_bridge->ops & DRM_BRIDGE_OP_EDID) {
-		drm_edid = drm_bridge_edid_read(sbridge->next_bridge, connector);
+	if (sbridge->bridge.next_bridge->ops & DRM_BRIDGE_OP_EDID) {
+		drm_edid = drm_bridge_edid_read(sbridge->bridge.next_bridge, connector);
 		if (!drm_edid)
 			DRM_INFO("EDID read failed. Fallback to standard modes\n");
 	} else {
@@ -90,7 +89,7 @@ simple_bridge_connector_detect(struct drm_connector *connector, bool force)
 {
 	struct simple_bridge *sbridge = drm_connector_to_simple_bridge(connector);
 
-	return drm_bridge_detect(sbridge->next_bridge, connector);
+	return drm_bridge_detect(sbridge->bridge.next_bridge, connector);
 }
 
 static const struct drm_connector_funcs simple_bridge_con_funcs = {
@@ -109,7 +108,7 @@ static int simple_bridge_attach(struct drm_bridge *bridge,
 	struct simple_bridge *sbridge = drm_bridge_to_simple_bridge(bridge);
 	int ret;
 
-	ret = drm_bridge_attach(encoder, sbridge->next_bridge, bridge,
+	ret = drm_bridge_attach(encoder, sbridge->bridge.next_bridge, bridge,
 				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret < 0)
 		return ret;
@@ -122,7 +121,7 @@ static int simple_bridge_attach(struct drm_bridge *bridge,
 	ret = drm_connector_init_with_ddc(bridge->dev, &sbridge->connector,
 					  &simple_bridge_con_funcs,
 					  sbridge->info->connector_type,
-					  sbridge->next_bridge->ddc);
+					  sbridge->bridge.next_bridge->ddc);
 	if (ret) {
 		DRM_ERROR("Failed to initialize connector\n");
 		return ret;
@@ -180,10 +179,10 @@ static int simple_bridge_probe(struct platform_device *pdev)
 	if (!remote)
 		return -EINVAL;
 
-	sbridge->next_bridge = of_drm_find_bridge(remote);
+	sbridge->bridge.next_bridge = of_drm_find_and_get_bridge(remote);
 	of_node_put(remote);
 
-	if (!sbridge->next_bridge) {
+	if (!sbridge->bridge.next_bridge) {
 		dev_dbg(&pdev->dev, "Next bridge not found, deferring probe\n");
 		return -EPROBE_DEFER;
 	}

-- 
2.52.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
