Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DDBCD4F58
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 May 2026 18:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wNqVH8HSMxLR3cUkDSH9Z8BGw4OoKoWkqSkVhFE64wA=; b=4YKHcTJkgON/r8
	bWSzAcYpxqoN2LxSDEHwB+WA1RgpDDdj0zdKk3lLU+yc67sjw4j7tLgVAXVatcws3cF/ArFH17V+a
	XoztWzTq/2YCDsniPtQbb9xWM5HbLyXqkHMvPCj3ZasrNdmmLH2mH9P0Zdg5Z9oI2HwZtoz30a+AN
	+A1sB4GNqORq0w0pg+vjxxdGfmQSGteHu3nCL1hJ55RNten3peRW/ANkezU2kECCHfNkIu9cvLAMJ
	1kchkJFPkjL5ebO5V2FU6FpoGxw8kvYNLIkh7t6ImFHEXIfVxmS1ubPL1YBTl/0/JNK/ssf+WIPSi
	O07UKvIUBU5rVHkHb9LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2UQ-0000000GXEm-29iI;
	Mon, 18 May 2026 18:14:54 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2UO-0000000GXCz-1Ce5
	for linux-amlogic@lists.infradead.org;
	Mon, 18 May 2026 18:14:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1779128091; bh=9uqA4jKYzliYkZko16kXvMFNWZFyXqBx7ysVDcNYMxw=;
 b=rUDJ+a6l4JajA2AGf9yDyWBg8k5Lb/xPT3HkzKwFBcUzy1riQvIan7rW1TfOzhpHGm52i7o/a
 25+LULk3fzVZQ7i979BzizNdIucXLXMGQIga/YFa1H1woglW83R7HBai4QmRdnApRfTFDZk7ia6
 RBpOhShiWnXxPrZiD+NlzUNSl+E8c69Ty2o2MtJhaBY+rPVN9XI8RWAirV/B4liNHAMKbF9maZi
 +8W533jUwY6XNTqR1WXvuP/ArzjtfGULOBQ9ptNDnukd2MhuNXbcGnNCsuJbn4citAgamKTw5IM
 QPxc17mJ6WkbCyA/mgBTaMoeTH5mv9SQ54wF78MetmJw==
X-Forward-Email-ID: 6a0b5485b84dbc72d2274ffb
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
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
	Liu Ying <victor.liu@nxp.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH v7 22/23] drm: bridge: dw_hdmi: Remove the empty dw_hdmi_phy_update_hpd()
Date: Mon, 18 May 2026 18:01:58 +0000
Message-ID: <20260518180206.2480119-23-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518180206.2480119-1-jonas@kwiboo.se>
References: <20260518180206.2480119-1-jonas@kwiboo.se>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_111452_413000_33153169 
X-CRM114-Status: UNSURE (   9.94  )
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, imx@lists.linux.dev, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev, Diederik de Haas <diederik@cknow-tech.com>, linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The dw_hdmi_phy_update_hpd() helper is empty and no longer needed after
recent RXSENSE and HPD rework, remove it.

Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # Rock64, RockPro64, Quartz64-B
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v7: No change
v6: Collect t-b tag
v5: No change
v4: New patch
---
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 1 -
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c   | 7 -------
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 2 --
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c      | 2 --
 include/drm/bridge/dw_hdmi.h                | 4 ----
 5 files changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
index 8e8cfd66f23b..20d389dbfdc5 100644
--- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
@@ -78,7 +78,6 @@ static const struct dw_hdmi_phy_ops imx8mp_hdmi_phy_ops = {
 	.disable	= imx8mp_hdmi_phy_disable,
 	.setup_hpd	= im8mp_hdmi_phy_setup_hpd,
 	.read_hpd	= dw_hdmi_phy_read_hpd,
-	.update_hpd	= dw_hdmi_phy_update_hpd,
 };
 
 static int imx8mp_dw_hdmi_bind(struct device *dev)
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 42d630efb875..c596534510da 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -1687,12 +1687,6 @@ enum drm_connector_status dw_hdmi_phy_read_hpd(struct dw_hdmi *hdmi,
 }
 EXPORT_SYMBOL_GPL(dw_hdmi_phy_read_hpd);
 
-void dw_hdmi_phy_update_hpd(struct dw_hdmi *hdmi, void *data,
-			    bool force, bool disabled, bool rxsense)
-{
-}
-EXPORT_SYMBOL_GPL(dw_hdmi_phy_update_hpd);
-
 void dw_hdmi_phy_setup_hpd(struct dw_hdmi *hdmi, void *data)
 {
 	/*
@@ -1716,7 +1710,6 @@ static const struct dw_hdmi_phy_ops dw_hdmi_synopsys_phy_ops = {
 	.init = dw_hdmi_phy_init,
 	.disable = dw_hdmi_phy_disable,
 	.read_hpd = dw_hdmi_phy_read_hpd,
-	.update_hpd = dw_hdmi_phy_update_hpd,
 	.setup_hpd = dw_hdmi_phy_setup_hpd,
 };
 
diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 0dc1eb5d2ae3..7136e713df2e 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -413,7 +413,6 @@ static const struct dw_hdmi_phy_ops rk3228_hdmi_phy_ops = {
 	.init		= dw_hdmi_rockchip_genphy_init,
 	.disable	= dw_hdmi_rockchip_genphy_disable,
 	.read_hpd	= dw_hdmi_phy_read_hpd,
-	.update_hpd	= dw_hdmi_phy_update_hpd,
 	.setup_hpd	= dw_hdmi_rk3228_setup_hpd,
 };
 
@@ -449,7 +448,6 @@ static const struct dw_hdmi_phy_ops rk3328_hdmi_phy_ops = {
 	.init		= dw_hdmi_rockchip_genphy_init,
 	.disable	= dw_hdmi_rockchip_genphy_disable,
 	.read_hpd	= dw_hdmi_rk3328_read_hpd,
-	.update_hpd	= dw_hdmi_phy_update_hpd,
 	.setup_hpd	= dw_hdmi_rk3328_setup_hpd,
 };
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
index 4fa69c463dc4..2ac99b8ce8c4 100644
--- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
+++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
@@ -221,7 +221,6 @@ static const struct dw_hdmi_phy_ops sun8i_a83t_hdmi_phy_ops = {
 	.init		= sun8i_a83t_hdmi_phy_config,
 	.disable	= sun8i_a83t_hdmi_phy_disable,
 	.read_hpd	= dw_hdmi_phy_read_hpd,
-	.update_hpd	= dw_hdmi_phy_update_hpd,
 	.setup_hpd	= dw_hdmi_phy_setup_hpd,
 };
 
@@ -395,7 +394,6 @@ static const struct dw_hdmi_phy_ops sun8i_h3_hdmi_phy_ops = {
 	.init		= sun8i_h3_hdmi_phy_config,
 	.disable	= sun8i_h3_hdmi_phy_disable,
 	.read_hpd	= dw_hdmi_phy_read_hpd,
-	.update_hpd	= dw_hdmi_phy_update_hpd,
 	.setup_hpd	= dw_hdmi_phy_setup_hpd,
 };
 
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index a612b9fa6dbb..10013b8d3adb 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -118,8 +118,6 @@ struct dw_hdmi_phy_ops {
 		    const struct drm_display_mode *mode);
 	void (*disable)(struct dw_hdmi *hdmi, void *data);
 	enum drm_connector_status (*read_hpd)(struct dw_hdmi *hdmi, void *data);
-	void (*update_hpd)(struct dw_hdmi *hdmi, void *data,
-			   bool force, bool disabled, bool rxsense);
 	void (*setup_hpd)(struct dw_hdmi *hdmi, void *data);
 };
 
@@ -213,8 +211,6 @@ void dw_hdmi_phy_gen2_reset(struct dw_hdmi *hdmi);
 
 enum drm_connector_status dw_hdmi_phy_read_hpd(struct dw_hdmi *hdmi,
 					       void *data);
-void dw_hdmi_phy_update_hpd(struct dw_hdmi *hdmi, void *data,
-			    bool force, bool disabled, bool rxsense);
 void dw_hdmi_phy_setup_hpd(struct dw_hdmi *hdmi, void *data);
 
 bool dw_hdmi_bus_fmt_is_420(struct dw_hdmi *hdmi);
-- 
2.54.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
