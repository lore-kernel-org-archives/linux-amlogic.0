Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C68CD3436
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 May 2026 19:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VaX6hYl0w1ZDXJSsBdyswIVc07C9eLSijZWEYANWnKQ=; b=YlWoYZJlo8gMl+
	fICpbcvHhZbTNbU+rYPRUfbeRBTDT/vc+UDIPdSSBZY1JMvEd52hgwdBiyJfnaulQwuU4AkWZpmOx
	X2qqPs/uWwuac56ZbFcPE/ZMdDhhgmBI9ZoVmM7EsniGRICjawu4/TOr4ZsR/KjxPgAFoqDtjlKdS
	cHfsNpK7W1V8hzRZEUlJMutrm61T6pPaEz2IZdLumBeC9QFsZYcdd9sC4vYFhz9016wJaJTyvRhBp
	cBuWks/eDgPd6jTg6vS8GsduHCz4zU9yI+EqAPWbua53xAICHEvcGKw2kAW9L8GF9DbgI/Q+byUB2
	XNdz2X6c+Vddx+bQx2fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJyih-0000000E6uY-3jiF;
	Mon, 04 May 2026 19:12:43 +0000
Received: from smtp.forwardemail.net ([121.127.44.66])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJyiM-0000000E6Mo-0OQZ
	for linux-amlogic@lists.infradead.org;
	Mon, 04 May 2026 19:12:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1777921941; bh=Y+1StOusjSb1aRabYMvL/79aSphsLY0CpDZ9HI5qZek=;
 b=ScOyS9pv8joEgu+RFYlxsAwG5VhryclRFhJLGPbW7vRDBF4V973fsC5PQ/rd72MIwe3CTSVWK
 G14Z5x4/bxd8jm84WY0tvzuy5wopT8wXGWiyWayjIk9NyqNHY1LWy+GG5DKy2Guctf6D0I7tDOY
 pdwitTkWevAWVW5eipHclDWuVqrqpRvY5c5CiqgMkmhkNUfkFDY3Kwb6uNbJuh2AXnQ8yVDe0Id
 9CXj/dS/WGu2fImArir+8Z6/sqrpbU9PclrNlhIBVMThgzj7ieAL3nE9k6H1hnvKuATMsO6bYS8
 nxjGJG38++OT3WC0aG136iLPC9e1iCS2guaHil52t7CA==
X-Forward-Email-ID: 69f8ef8d04bb1dff846bb9e7
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
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
	Liu Ying <victor.liu@nxp.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
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
Subject: [PATCH v4 16/17] drm: bridge: dw_hdmi: Remove the empty dw_hdmi_phy_update_hpd()
Date: Mon,  4 May 2026 19:10:53 +0000
Message-ID: <20260504191059.275928-17-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260504191059.275928-1-jonas@kwiboo.se>
References: <20260504191059.275928-1-jonas@kwiboo.se>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_121222_414188_67A4270E 
X-CRM114-Status: GOOD (  10.10  )
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

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
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
index 60b887249eba..c0ed067154c7 100644
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
