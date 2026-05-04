Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E698CD3427
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 May 2026 19:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jb8hDjYqmMy5mV+hyge33YBp2Rz+Pq04eA7Fb9GeS+E=; b=nIWDAP+OBSzIvq
	izWi2TjeJBEKsjEezq5Yd1mzAJtbC4REdyIKCPS0nuS/0we5LcFbLvc3vphYdbxI9iZ9UJDhCa9GF
	c+aPMyjC1mpH2dun1m6b6HSm30ckOPIO0oJUiOqeDQNWNp5L7CJgeH9I9dxS+b8zXRUDIgtPZFSyl
	ewEO0xsrRFgmSvJnZmjUY8KtjO07vaDSvQJFhTQ7rDWfsxRpwWe4x7vbyFU7GtPr70LzHcRAN+HiZ
	J583b+FDTya3xP8YhCaMluy5zx3nqOJXlRfaZ8voMEsb6YCbT5RRpDx/kLJVj0+42t/qMfAxd10xA
	rTGPlhamz01Bm13UQTqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJyhs-0000000E5UC-0Rec;
	Mon, 04 May 2026 19:11:52 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJyhk-0000000E5Fy-2pzb
	for linux-amlogic@lists.infradead.org;
	Mon, 04 May 2026 19:11:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1777921904; bh=SSjbkd7u9s/dzg55YrV/09rhDl4sPM/aDTP4vRABfBI=;
 b=qpGLwNkD+ItZdho2YpxfnpwQcDmBCTHD3l+cYyjYRFu2Jqpz5DA+ZUbb56qrdqG+3tzt7VTDY
 1V3RDUf6ooRtWqlY4RAwBUJKmGqxxcq0kTr3CH2XfxfJtGltKLd9dyZLcTB49YGOD6FbsIpfYrC
 8PSlUkqBh88Xf/gjzi8Ad4ePieymNaMNUJRJxycH8M3yIQnESd4x0LQPUETafkiLAh3Z90Ps6C9
 VvgSdQyx29paHmQoTRCE+NnC+gY9pXpnoEMzfUqRhq9PftlIHceATXVyqMBxPy2j1kpO+neRKPi
 K++Vy79Zw+ZJrXBPbonbH1A+duvNPBYXmncmUu3pNSOg==
X-Forward-Email-ID: 69f8ef6304bb1dff846bb8a5
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
Subject: [PATCH v4 06/17] drm: bridge: dw_hdmi: Remove previous_mode and mode_set
Date: Mon,  4 May 2026 19:10:43 +0000
Message-ID: <20260504191059.275928-7-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260504191059.275928-1-jonas@kwiboo.se>
References: <20260504191059.275928-1-jonas@kwiboo.se>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_121144_842166_32B6EB79 
X-CRM114-Status: GOOD (  11.58  )
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

With the use of adjusted_mode directly from the crtc_state there is no
longer a need to store a copy in previous_mode, remove it and the now
unneeded mode_set ops.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v4: No change
v3: Collect r-b tag
v2: No change
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 7211beffd59e..a287bf56bd9f 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -156,8 +156,6 @@ struct dw_hdmi {
 		bool enabled;
 	} phy;
 
-	struct drm_display_mode previous_mode;
-
 	struct i2c_adapter *ddc;
 	void __iomem *regs;
 	bool sink_is_hdmi;
@@ -167,7 +165,7 @@ struct dw_hdmi {
 	struct pinctrl_state *default_state;
 	struct pinctrl_state *unwedge_state;
 
-	struct mutex mutex;		/* for state below and previous_mode */
+	struct mutex mutex;		/* for state below */
 	enum drm_connector_force force;	/* mutex-protected force state */
 	struct drm_connector *curr_conn;/* current connector (only valid when !disabled) */
 	bool disabled;			/* DRM has disabled our bridge */
@@ -2928,20 +2926,6 @@ dw_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
 	return mode_status;
 }
 
-static void dw_hdmi_bridge_mode_set(struct drm_bridge *bridge,
-				    const struct drm_display_mode *orig_mode,
-				    const struct drm_display_mode *mode)
-{
-	struct dw_hdmi *hdmi = bridge->driver_private;
-
-	mutex_lock(&hdmi->mutex);
-
-	/* Store the display mode for plugin/DKMS poweron events */
-	drm_mode_copy(&hdmi->previous_mode, mode);
-
-	mutex_unlock(&hdmi->mutex);
-}
-
 static void dw_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
 					  struct drm_atomic_state *state)
 {
@@ -3005,7 +2989,6 @@ static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
 	.atomic_get_input_bus_fmts = dw_hdmi_bridge_atomic_get_input_bus_fmts,
 	.atomic_enable = dw_hdmi_bridge_atomic_enable,
 	.atomic_disable = dw_hdmi_bridge_atomic_disable,
-	.mode_set = dw_hdmi_bridge_mode_set,
 	.mode_valid = dw_hdmi_bridge_mode_valid,
 	.detect = dw_hdmi_bridge_detect,
 	.edid_read = dw_hdmi_bridge_edid_read,
-- 
2.54.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
