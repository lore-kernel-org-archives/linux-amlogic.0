Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8DE0CD37B6
	for <linux-amlogic@archiver.kernel.org>; Sun, 10 May 2026 12:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=if8ilFfoQTvyaa43eyjomnXRlof4ElEdvyfQW4xgj/c=; b=rjihAv0N2NnWl3
	vt89KNRRIeJECEfYSBvKrTr4uEMmOf93xKadYwsw/JxALC3mc3jQnJLPvuZ2z24pn9Z3S3E3GfiX2
	iLoYlEt+nSN7HSx1k1CT1TbhqWyZE1DsIjMXeO92KMbGGlaLIwMYlUqt25pLGN0QaI6r/JjndNHAg
	5WEfh9bVReCx35MNb0cxG92BIevwY9sfzMF4HI4hy5CLVFl9P9zt7aDJbVWRQImCoKaJTid55dUcc
	791yonwfD+KgwJh+QtknYD/jgL+9KZHnZSqYjysMIMfqedIInhwv4wMztuPdhAHj77GYefObSp0ba
	lHjO+DEIhwcQRTh3VVxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM3UO-0000000Ak9g-1ae6;
	Sun, 10 May 2026 12:42:32 +0000
Received: from smtp.forwardemail.net ([121.127.44.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM3UJ-0000000Ajnz-33IQ
	for linux-amlogic@lists.infradead.org;
	Sun, 10 May 2026 12:42:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1778416939; bh=er0xhzvCLlN0qh9ZkIzd2DuMHrfTOjO1xjORGDDCi3A=;
 b=y8EJzFNW8vuHRd6+Sk+RkWhTRNtnlOnTG6THW7zXEA7Qjq+QO7U4Jrw9BHDOJXvBhEOsgJv3n
 EVbxD2d0va4BdRTm2NAIBrg4tbSyghnZVRCHPR+yrVvKl1wCAvjlIQY7GSqLPumgOM/JnYFaKSx
 7NEIpVXRU7mJz0oyHwA4Q0eh1+i2QjWE8h94SmJSgtA0UrIIefcpFIGd2ytZuyq1Pwn2JjQ1/Ga
 cXhI9jXZ7Qr7fKBI81Uu7WnuYv7aZm9az3VsCGuQCHl9kh/UbCJT9d2wUjYipxpO3MJ7fBjDPfA
 R/R5WpHZJ7H1N0Oyv102hdPkXD1RGGd224tW1WB3VBvw==
X-Forward-Email-ID: 6a007d050d91f03a31a0bb6e
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.8.0
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
Subject: [PATCH v5 05/21] drm: bridge: dw_hdmi: Fold poweron and setup functions
Date: Sun, 10 May 2026 12:40:49 +0000
Message-ID: <20260510124111.1226584-6-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260510124111.1226584-1-jonas@kwiboo.se>
References: <20260510124111.1226584-1-jonas@kwiboo.se>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_054229_076764_A213397E 
X-CRM114-Status: GOOD (  10.95  )
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

Fold the poweron and setup functions into one function and use the
adjusted_mode directly from the new crtc_state to remove the need of
storing previous_mode.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v5: No change, rebase on next-20260508
v4: No change
v3: Collect r-b tag
v2: No change
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index aa12397b3343..607faf4da967 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2254,9 +2254,9 @@ static void hdmi_disable_overflow_interrupts(struct dw_hdmi *hdmi)
 		    HDMI_IH_MUTE_FC_STAT2);
 }
 
-static int dw_hdmi_setup(struct dw_hdmi *hdmi,
-			 const struct drm_connector *connector,
-			 const struct drm_display_mode *mode)
+static int dw_hdmi_poweron(struct dw_hdmi *hdmi,
+			   const struct drm_connector *connector,
+			   const struct drm_display_mode *mode)
 {
 	const struct drm_display_info *display = &connector->display_info;
 	int ret;
@@ -2396,15 +2396,6 @@ static void initialize_hdmi_ih_mutes(struct dw_hdmi *hdmi)
 	hdmi_writeb(hdmi, ih_mute, HDMI_IH_MUTE);
 }
 
-static void dw_hdmi_poweron(struct dw_hdmi *hdmi)
-{
-	/*
-	 * The curr_conn field is guaranteed to be valid here, as this function
-	 * is only be called when !hdmi->disabled.
-	 */
-	dw_hdmi_setup(hdmi, hdmi->curr_conn, &hdmi->previous_mode);
-}
-
 static void dw_hdmi_poweroff(struct dw_hdmi *hdmi)
 {
 	if (hdmi->phy.enabled) {
@@ -2969,15 +2960,19 @@ static void dw_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
 					 struct drm_atomic_commit *state)
 {
 	struct dw_hdmi *hdmi = bridge->driver_private;
+	const struct drm_display_mode *mode;
 	struct drm_connector *connector;
+	struct drm_crtc *crtc;
 
 	connector = drm_atomic_get_new_connector_for_encoder(state,
 							     bridge->encoder);
+	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
+	mode = &drm_atomic_get_new_crtc_state(state, crtc)->adjusted_mode;
 
 	mutex_lock(&hdmi->mutex);
 	hdmi->disabled = false;
 	hdmi->curr_conn = connector;
-	dw_hdmi_poweron(hdmi);
+	dw_hdmi_poweron(hdmi, connector, mode);
 	dw_hdmi_update_phy_mask(hdmi);
 	handle_plugged_change(hdmi, true);
 	mutex_unlock(&hdmi->mutex);
-- 
2.54.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
