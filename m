Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B12CD4F52
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 May 2026 18:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1cvO1//dePzLYTwj3s6vvdheVKBK/cj3DCVWpTu3AUo=; b=H4YeaZmQNt2rzc
	DSolGN4SEJR9JDuU6ioOh+KAQU7QfJ/fpa0n/HsgjCwgr5VsFHf4lECKo8kp+F6CJPJbKZUIvILtP
	FL487LhFx384X0/g98yj2kRAZkIxFOhd0dx8r6thOCI2JO37vrhWpQFqZWaGGWPeejWkw1FvwdOcG
	nBusDvk3QCTX+lBHzG93b0Zp3mItG9IeUTpxtGtptnmRP2b/nIqrv84x6MiONDD7UJzIpO6nGosC+
	zkV/Km1U/QkX31DySG/yy/RxWas2OVd0lPGUMQy0MTK3Ck5WiClQUx/+diljWHZXMkNbZbmkT4fbS
	hk4eIVYQN5vjKnfgQ7mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2Iw-0000000GTGQ-0OLM;
	Mon, 18 May 2026 18:03:02 +0000
Received: from smtp.forwardemail.net ([121.127.44.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2Iq-0000000GT79-3ymH
	for linux-amlogic@lists.infradead.org;
	Mon, 18 May 2026 18:02:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1779127376; bh=y1qusCJrJS8qT16e2pU+cznjnv8NM8UAIVFu7XIBUj8=;
 b=l8xDgENk0Ffz8bvIvEvFbkJYjwVKmsyNLNSs95YuQEmKjx54Yh4eDrPUZzFz6xmoHHsXs7Jyy
 MTCujYuB30sLmtz4vEsNImt5Eg2UUonHN9TPiqENTRgPvrVT4vYzame7oRF94hjd1CsEU7DDB3x
 DVrG7a+VtVeuL+d0PQEJVx8155O8u1KxhGN9HsIkzMFPB9X1yLSuCdAYAdq7P85M+xlHi9fcD/F
 /C4SvcUlLRVnlzxWFXgVTcN0lHcuo5A0Q8OiTx+/IUGTK1DuDj78D3hmtUeXN80SFYNOX8nCFq7
 ERol6XF21hAycjGYN2qOfd1T+NT1MzxstPDSpooIpscg==
X-Forward-Email-ID: 6a0b544cb84dbc72d2274e87
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.8.12
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v7 09/23] drm: bridge: dw_hdmi: Unregister CEC notifier during connector cleanup
Date: Mon, 18 May 2026 18:01:45 +0000
Message-ID: <20260518180206.2480119-10-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518180206.2480119-1-jonas@kwiboo.se>
References: <20260518180206.2480119-1-jonas@kwiboo.se>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_110257_097508_ACAD9012 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, imx@lists.linux.dev, Liu Ying <victor.liu@nxp.com>, linux-kernel@vger.kernel.org, Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev, Diederik de Haas <diederik@cknow-tech.com>, linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@kernel.org>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The CEC notifier is being unregistered when the bridge detach,
something that happens earlier than normal connector cleanup.

Change to unregister the CEC notifier at connector cleanup, in the
connector .destroy() func, to align the lifetime of the connector and
the CEC notifier and closer match a drmres handled generic CEC notifier.

Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # Rock64, RockPro64, Quartz64-B
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v7: No change
v6: Collect t-b tag
v5: New patch
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index cbbd15578042..5fd26ff8f55b 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2532,6 +2532,11 @@ static void dw_hdmi_connector_destroy(struct drm_connector *connector)
 {
 	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi, connector);
 
+	mutex_lock(&hdmi->cec_notifier_mutex);
+	cec_notifier_conn_unregister(hdmi->cec_notifier);
+	hdmi->cec_notifier = NULL;
+	mutex_unlock(&hdmi->cec_notifier_mutex);
+
 	drm_connector_cleanup(connector);
 	drm_bridge_put(&hdmi->bridge);
 }
@@ -2909,16 +2914,6 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge,
 	return dw_hdmi_connector_create(hdmi);
 }
 
-static void dw_hdmi_bridge_detach(struct drm_bridge *bridge)
-{
-	struct dw_hdmi *hdmi = bridge->driver_private;
-
-	mutex_lock(&hdmi->cec_notifier_mutex);
-	cec_notifier_conn_unregister(hdmi->cec_notifier);
-	hdmi->cec_notifier = NULL;
-	mutex_unlock(&hdmi->cec_notifier_mutex);
-}
-
 static enum drm_mode_status
 dw_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
 			  const struct drm_display_info *info,
@@ -2996,7 +2991,6 @@ static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.attach = dw_hdmi_bridge_attach,
-	.detach = dw_hdmi_bridge_detach,
 	.atomic_check = dw_hdmi_bridge_atomic_check,
 	.atomic_get_output_bus_fmts = dw_hdmi_bridge_atomic_get_output_bus_fmts,
 	.atomic_get_input_bus_fmts = dw_hdmi_bridge_atomic_get_input_bus_fmts,
-- 
2.54.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
