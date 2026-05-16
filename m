Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C391DCD4F48
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 May 2026 18:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZeWMbgpMNOYiXdjUmMWXMG6BSVwwDqCJEfxqC/rmPcE=; b=2ELMuMLZnxwk1c
	J6FnUZABlRNDvfba5Vkiaw6lQhnPZA8GE6tluHG7cz/EjrVuJ/NPjOB/AnCkXlzOXjucbyHo6kJeq
	FxS3DN5rEiAV0DHyHckYGn3S1BGIs8A77cR9IvRNre0MdjPN/6H4cQ8jbDLTecup8ABQfnGGrrItQ
	QZDDL2iE3o1YGw8Z++4/8VnxxFwinnfNISbV6LNErKm09Ugkc2p2PNtihnUD2GbiUPeRYcEGJxtcV
	TjKzH4Q8hvbfDQG9V/VfZaj6hLzu6wUgf21yIk+REV13RVuNspe7Ghx2KRj9Dj+8BLV3yNRH2eb7G
	iyUCGrHkgKimIa8BCGuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOJyD-0000000BHth-2Jn9;
	Sat, 16 May 2026 18:42:41 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOJyA-0000000BHrS-1YV8
	for linux-amlogic@lists.infradead.org;
	Sat, 16 May 2026 18:42:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1778956923; bh=CMbmb6BqufwrFcXTmw0fRixNzPtrB0QWtRrlp+vXgq8=;
 b=FLm7Nb1PHkHZlkTiDOBATj0XduHo9irQtDNBvUn55FhyYY/8WBDD/Z5/nAP+mVapQj3NkBl01
 /aE7KsEgiI7nDQ0AIZnrMFJBN/3CtSk6fby0U+eSS+Q6qRmcyaAVs6m+u832sdSk5gAGMXcHlWT
 ku4+L769vAyuIavl3My4ZIJrhg+lOnWKbZHKgoQOwtBSfXz58rw0eDDN07PYCgJJia79PfW21sV
 F4WxJL4VBxSDIU2GqDVT2klI50ZzUUQA+P9nRiTCkYog3kufJPZEsAyyeJwheWgJrnSaYyie4Zy
 prbEUHi+lV1vIsJBESj5VafzmSSQL3bOCL7TW9wSv9sQ==
X-Forward-Email-ID: 6a08b9e879c7625f20eeee51
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
Subject: [PATCH v6 12/22] drm: bridge: dw_hdmi: Use dw_hdmi_connector_status_update()
Date: Sat, 16 May 2026 18:38:22 +0000
Message-ID: <20260516183838.2024991-13-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260516183838.2024991-1-jonas@kwiboo.se>
References: <20260516183838.2024991-1-jonas@kwiboo.se>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_114238_432631_CB9F9220 
X-CRM114-Status: GOOD (  10.76  )
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

Update connector EDID and CEC phys addr from detect and force funcs to
ensure that userspace always have access to latest read EDID after a
sink use a HPD low voltage pulse to indicate that EDID has changed.

With EDID being updated in detect and force funcs, there should no
longer be a need to re-read EDID in get_modes funcs, so drop it.

This change make the dw-hdmi connector work more closely like the bridge
connector does with a hdmi bridge.

Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # Rock64, RockPro64, Quartz64-B
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v6: Pass struct dw_hdmi as a parameter,
    Collect t-b tag
v5: No change
v4: Move last_connector_result assign in force ops to this patch,
    Collect r-b tag
v3: Reworked 'Update EDID during hotplug processing' patch
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 28 ++++++++++++-----------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index a056e147731b..a4ecf830103d 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2473,36 +2473,36 @@ dw_hdmi_connector_status_update(struct dw_hdmi *hdmi,
 {
 	const struct drm_edid *drm_edid;
 
+	if (status == connector_status_disconnected) {
+		drm_edid_connector_update(connector, NULL);
+		cec_notifier_phys_addr_invalidate(hdmi->cec_notifier);
+		return;
+	}
+
 	drm_edid = dw_hdmi_edid_read(hdmi, connector);
 	drm_edid_connector_update(connector, drm_edid);
 	drm_edid_free(drm_edid);
 
-	cec_notifier_set_phys_addr(hdmi->cec_notifier,
-				   connector->display_info.source_physical_address);
+	if (status == connector_status_connected)
+		cec_notifier_set_phys_addr(hdmi->cec_notifier,
+				connector->display_info.source_physical_address);
 }
 
 static enum drm_connector_status
 dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
 {
-	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi,
-					     connector);
+	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi, connector);
 	enum drm_connector_status status;
 
 	status = dw_hdmi_detect(hdmi);
 
-	if (status == connector_status_disconnected)
-		cec_notifier_phys_addr_invalidate(hdmi->cec_notifier);
+	dw_hdmi_connector_status_update(hdmi, connector, status);
 
 	return status;
 }
 
 static int dw_hdmi_connector_get_modes(struct drm_connector *connector)
 {
-	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi,
-					     connector);
-
-	dw_hdmi_connector_status_update(hdmi, connector, connector->status);
-
 	return drm_edid_connector_add_modes(connector);
 }
 
@@ -2532,13 +2532,15 @@ static int dw_hdmi_connector_atomic_check(struct drm_connector *connector,
 
 static void dw_hdmi_connector_force(struct drm_connector *connector)
 {
-	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi,
-					     connector);
+	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi, connector);
 
 	mutex_lock(&hdmi->mutex);
 	hdmi->force = connector->force;
+	hdmi->last_connector_result = connector->status;
 	dw_hdmi_update_phy_mask(hdmi);
 	mutex_unlock(&hdmi->mutex);
+
+	dw_hdmi_connector_status_update(hdmi, connector, connector->status);
 }
 
 static void dw_hdmi_connector_destroy(struct drm_connector *connector)
-- 
2.54.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
