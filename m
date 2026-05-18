Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C49CD4F3C
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 May 2026 18:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hIkv0S9+Kz1JgmkG4Pix3oltsKtokaYYGMlj2r3k8Ak=; b=cYaSJESu17TtEa
	OSOFerR+wHhxjuhLQTbOyYLb/snUlpE5NvD5IjGtR8LoD9Jgd+iqu5zuFPRO31hCwI9H5+YJMkW2M
	M5uWikviOnrIR+9/zPiR1I1O/U+SYkzCbSkpR92E+ncEjjyeXSYhz0DYt/66QRq1tRBDgfyuDgXLz
	WTAGzfRLpLAmcrUPEEFhS65FC/ka1DSUg6tND4ZcCfxDQltxmkYHWgXUIzYRzGSO7pkcSigTlBuD3
	qWc66wW2t85dBYnfNk7YuhB9nXpIOZY4rldl8gfCxzSyA45Zpx1e7Iznk6QuD5kkgOS3D9vFqatP7
	Ef4Qz7Mue5swmJqEH/0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2K8-0000000GVLA-0RiF;
	Mon, 18 May 2026 18:04:16 +0000
Received: from smtp.forwardemail.net ([2001:19f0:ac01:372:5400:5ff:fe53:764a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2Jw-0000000GV4r-333q
	for linux-amlogic@lists.infradead.org;
	Mon, 18 May 2026 18:04:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1779127442; bh=pRDjhi4A67HVrKb8G93iuKDjCCMCnoa34s8OGiHVDR4=;
 b=CaQ/WpmQAuvObrT0hq053fm3RfgdudcuFvXUz8VxC1dT3pyt69bXNahWUzQtJKw2vmB/usZBP
 McyLkBE3ZmtCyigrNRSOut/6p2SQ2Cf9rRbrmF4YPf+RMB6Q4UkC/EMUzIiQvAxvAslROC/+3ln
 kJwckUTf4YnbShoPaT8TQWEoVBOFrL4Zws6YWvOl0X3cbbCpkr5pcOLK1YJCRhSOY6uhuyTa9ts
 N8wJ55w/AQS9CSVzv5Nu1aKDTNKy4BgNmmGC48zIaRncbdL4ypQe3IwOWc7EtlFKxRfX4v1nVnb
 b6PqHnNZ8EbIYkmhseYybk3iS7ovnmVYRSlXyfKjvPKg==
X-Forward-Email-ID: 6a0b546ab84dbc72d2274f59
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
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
Subject: [PATCH v7 16/23] drm: bridge: dw_hdmi: Update EDID and CEC phys addr in bridge detect()
Date: Mon, 18 May 2026 18:01:52 +0000
Message-ID: <20260518180206.2480119-17-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518180206.2480119-1-jonas@kwiboo.se>
References: <20260518180206.2480119-1-jonas@kwiboo.se>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_110404_905626_6BB29B46 
X-CRM114-Status: GOOD (  11.03  )
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

Update EDID and CEC phys addr in the bridge detect() func to closely
match the behavior of a bridge connector with a HDMI bridge attached
and the dw-hdmi connector.

This change introduce a slight delay to the bridge connector detect()
and get_modes() funcs due to multiple EDID reads. This is an acceptable
added delay to help ensure EDID and CEC phys addr always are correct.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v7: Update commit message
v6: New patch

This is a temporary change until dw-hdmi is fully converted into a
HDMI bridge in a future part of this multi-series effort.

The patch "drm/bridge-connector: Use cached connector status in
.get_modes()" [1] can help remove one unnecessary EDID read until
dw-hdmi is fully converted into a HDMI bridge.

[1] https://lore.kernel.org/dri-devel/20260426-dw-hdmi-qp-scramb-v5-3-d778e70c317b@collabora.com/
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 37406555af7b..0c4388e7aa5e 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2947,8 +2947,17 @@ static enum drm_connector_status
 dw_hdmi_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct dw_hdmi *hdmi = bridge->driver_private;
+	enum drm_connector_status status;
 
-	return dw_hdmi_detect(hdmi);
+	status = dw_hdmi_detect(hdmi);
+
+	/*
+	 * Update EDID and CEC phys addr to match the behavior of a bridge
+	 * connector with a HDMI bridge attached and the dw-hdmi connector.
+	 */
+	dw_hdmi_connector_status_update(hdmi, connector, status);
+
+	return status;
 }
 
 static const struct drm_edid *dw_hdmi_bridge_edid_read(struct drm_bridge *bridge,
-- 
2.54.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
