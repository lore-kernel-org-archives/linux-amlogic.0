Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E710FF885A
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 May 2026 19:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1eBbFS1IofxF/LRhlB9pGiuxT1/BGfdLtsOIrGIx7D8=; b=heO3ba2E6T69HG
	oi9BD0E0EQN2AOZvxHvRTlIS5CE75t4LgFRKzKr3D3Lx48Lv33MBi0N4tr4b2iWGwQS5ElK7Fxkvc
	fqfC6eJDVFI2o0XewODKqeoSNWu/EJ0fcyhZ1r9SX0IjoEf+o6YjydZzlBrwMYZa353pS1U+Ifvub
	JSKSrnyJy7TPawCOZ6Ery4BXWAVwnaOPRMOGSyVYClCvcZjZYqGoaOendkMnqYdHQkD9c/V/fpHhi
	r+kEAyUqRfhsnEzEKsuTUIURWSLI+RWMV5EGsNXeQJjPZXdztUVpZLRDq8uBYBi1iQS9HBRyUPtAu
	RaAlmPVJxuNBlDFnMAKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJyhg-0000000E5Aj-3q4f;
	Mon, 04 May 2026 19:11:40 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJyhe-0000000E56e-3oDk
	for linux-amlogic@lists.infradead.org;
	Mon, 04 May 2026 19:11:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1777921898; bh=+lbSKPdiopZL30uTDNbEN1kUm1XZOh7nc0sDCC6RnNk=;
 b=mLg6OkSlBGoTct82i2tUtcN7cfvnroOi7T2SGlA4WVhal0Xu4ft6krRGIi/5EmRmH0kExeLav
 6yd2ZMyqor6VQ3Nwf54n/dtMHrh3vxc4XFRxhDNeK3pEwnu9ni0U5zoixcFDTN4jVKFeZpBqV1k
 zw0hUEfKTomA0LLUyDp3x2GROx0lgCRP5iGkPEa9QpOb7kBroBAN7JnINSInTCRgJk5z79l+6Dg
 gzx0G9GmYWWuYimc/jtW7Vef1Ie1N8+dRZrBNt4nZ69JqBwQmgkKP2PrAC1q6RiDtAXB9X2W/TH
 QJbBJyKZI/bJyfsmjSPP9DP1HWuRzuwGP6D6FBqR0RDg==
X-Forward-Email-ID: 69f8ef5604bb1dff846bb854
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.7.7
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
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v4 03/17] drm: bridge: dw_hdmi: Call poweron/poweroff from atomic enable/disable
Date: Mon,  4 May 2026 19:10:40 +0000
Message-ID: <20260504191059.275928-4-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260504191059.275928-1-jonas@kwiboo.se>
References: <20260504191059.275928-1-jonas@kwiboo.se>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_121138_947665_39E5E01F 
X-CRM114-Status: GOOD (  12.57  )
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

Change to only call poweron/poweroff from atomic_enable/atomic_disable
funcs instead of trying to be clever by keeping a bridge_is_on state and
poweron/off in the hotplug irq handler.

The bridge is already enabled/disabled depending on connection state
with the call to drm_helper_hpd_irq_event() in hotplug irq handler.

A benefit of this is that drm mode_config mutex is always held at
poweron/off, something that may reduce the need for the dw-hdmi mutex.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v4: No change
v3: Collect r-b tag
v2: Update commit message
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 33 ++---------------------
 1 file changed, 2 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 0647ec6632d8..4ecad0d2eeaa 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -171,7 +171,6 @@ struct dw_hdmi {
 	enum drm_connector_force force;	/* mutex-protected force state */
 	struct drm_connector *curr_conn;/* current connector (only valid when !disabled) */
 	bool disabled;			/* DRM has disabled our bridge */
-	bool bridge_is_on;		/* indicates the bridge is on */
 	bool rxsense;			/* rxsense state */
 	u8 phy_mask;			/* desired phy int mask settings */
 	u8 mc_clkdis;			/* clock disable register */
@@ -2400,8 +2399,6 @@ static void initialize_hdmi_ih_mutes(struct dw_hdmi *hdmi)
 
 static void dw_hdmi_poweron(struct dw_hdmi *hdmi)
 {
-	hdmi->bridge_is_on = true;
-
 	/*
 	 * The curr_conn field is guaranteed to be valid here, as this function
 	 * is only be called when !hdmi->disabled.
@@ -2415,30 +2412,6 @@ static void dw_hdmi_poweroff(struct dw_hdmi *hdmi)
 		hdmi->phy.ops->disable(hdmi, hdmi->phy.data);
 		hdmi->phy.enabled = false;
 	}
-
-	hdmi->bridge_is_on = false;
-}
-
-static void dw_hdmi_update_power(struct dw_hdmi *hdmi)
-{
-	int force = hdmi->force;
-
-	if (hdmi->disabled) {
-		force = DRM_FORCE_OFF;
-	} else if (force == DRM_FORCE_UNSPECIFIED) {
-		if (hdmi->rxsense)
-			force = DRM_FORCE_ON;
-		else
-			force = DRM_FORCE_OFF;
-	}
-
-	if (force == DRM_FORCE_OFF) {
-		if (hdmi->bridge_is_on)
-			dw_hdmi_poweroff(hdmi);
-	} else {
-		if (!hdmi->bridge_is_on)
-			dw_hdmi_poweron(hdmi);
-	}
 }
 
 /*
@@ -2563,7 +2536,6 @@ static void dw_hdmi_connector_force(struct drm_connector *connector)
 
 	mutex_lock(&hdmi->mutex);
 	hdmi->force = connector->force;
-	dw_hdmi_update_power(hdmi);
 	dw_hdmi_update_phy_mask(hdmi);
 	mutex_unlock(&hdmi->mutex);
 }
@@ -2988,7 +2960,7 @@ static void dw_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
 	mutex_lock(&hdmi->mutex);
 	hdmi->disabled = true;
 	hdmi->curr_conn = NULL;
-	dw_hdmi_update_power(hdmi);
+	dw_hdmi_poweroff(hdmi);
 	dw_hdmi_update_phy_mask(hdmi);
 	handle_plugged_change(hdmi, false);
 	mutex_unlock(&hdmi->mutex);
@@ -3006,7 +2978,7 @@ static void dw_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
 	mutex_lock(&hdmi->mutex);
 	hdmi->disabled = false;
 	hdmi->curr_conn = connector;
-	dw_hdmi_update_power(hdmi);
+	dw_hdmi_poweron(hdmi);
 	dw_hdmi_update_phy_mask(hdmi);
 	handle_plugged_change(hdmi, true);
 	mutex_unlock(&hdmi->mutex);
@@ -3106,7 +3078,6 @@ void dw_hdmi_setup_rx_sense(struct dw_hdmi *hdmi, bool hpd, bool rx_sense)
 		if (hpd)
 			hdmi->rxsense = true;
 
-		dw_hdmi_update_power(hdmi);
 		dw_hdmi_update_phy_mask(hdmi);
 	}
 	mutex_unlock(&hdmi->mutex);
-- 
2.54.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
