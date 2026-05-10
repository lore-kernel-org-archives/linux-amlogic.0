Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C921FCD37BD
	for <linux-amlogic@archiver.kernel.org>; Sun, 10 May 2026 12:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l+6tVO8mmIXCcXjB0mQtoNJRp+/B83D5L+57yqHWXEQ=; b=vgO6wei2jVU5Qb
	UocOlhFd3KJTYSvXCkAuwdJp+yq4QluvXN836siapZJdR1KP2dvGbrF7EHoiO37PZgNx7ikgxQPDF
	muMJMnoNeMcL2F7vZ2Xcf6NxVUt/wBRwQQ7xU6hgC5DNTZXCsHKqQy2meBPL/VjWvouRH+POS+Hro
	zvNZPWoLY2LHJbwtASHyPlr67pY7x9kOWeULb4ZILK39bpPUxAl1wNWIDQPGhJG+oUbgao4D9iDDk
	yteau2Aek/J1seZytdDv5uQCFx1FwE0K6v5BUm3e7X+ogB5GPHcBhpjOINhVbMZ+fOk29/6hju0OR
	8kg7UVFrXyQQ04ERs1Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM3Ui-0000000Akip-0LJZ;
	Sun, 10 May 2026 12:42:52 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM3UW-0000000AkBO-2bQ4
	for linux-amlogic@lists.infradead.org;
	Sun, 10 May 2026 12:42:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1778416954; bh=6bbljhWGbuqdXDsgmGYVzdY0KhxBYB2J1W7cZWHXuxI=;
 b=plDzOflT3OHMpZ1vHebXn4bb/sy61Gh1yMZyGC9ne39P+Ns194EhYzmYIbbVh2YLPALNxBlft
 GmII77/phC0sS0UDWhxmTGMOq3JNURJnXs7C6KimtUJxZRic+QO/MOK2SVqhaYQT5HxfALjTQyP
 KjAx5YmrYBLQNmuOBYgwPmTr6ZSq/rZ63Et7VuA9YY0PnzTt403zC9v5aJG2cFGSuOn3mSf1L+y
 GxqIO+ex+9lNDqoSN44fbaoQjWWbEbIPBF7oVM+hp60DYQq95RmcdtSmuzcxweMUr28UXUMs+6J
 YO9EK73I8AUmQ0RvXnT2OEaSjrOQLLbexcB/2gfRLJsg==
X-Forward-Email-ID: 6a007d330d91f03a31a0bce5
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
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
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v5 15/21] drm: bridge: dw_hdmi: Add common suspend helper
Date: Sun, 10 May 2026 12:40:59 +0000
Message-ID: <20260510124111.1226584-16-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260510124111.1226584-1-jonas@kwiboo.se>
References: <20260510124111.1226584-1-jonas@kwiboo.se>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_054241_971752_5B24094B 
X-CRM114-Status: GOOD (  14.35  )
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, imx@lists.linux.dev, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev, Diederik de Haas <diederik@cknow-tech.com>, linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org, Chen-Yu Tsai <wens@kernel.org>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add a dw_hdmi_suspend() helper as the suspend-side counterpart to
dw_hdmi_resume() and call it from the i.MX8MP, Amlogic and Rockchip
platform PM suspend callbacks.

This is a preparatory change to route suspend handling through common
dw-hdmi code so follow-up changes can add shared suspend cleanup in one
place.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v5: New patch
---
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c |  4 ++++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c   |  5 +++++
 drivers/gpu/drm/meson/meson_dw_hdmi.c       |  2 ++
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 11 ++++++++++-
 include/drm/bridge/dw_hdmi.h                |  1 +
 5 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
index 8e8cfd66f23b..f15b3f8e1dbc 100644
--- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
@@ -176,6 +176,10 @@ static void imx8mp_dw_hdmi_remove(struct platform_device *pdev)
 
 static int imx8mp_dw_hdmi_pm_suspend(struct device *dev)
 {
+	struct imx8mp_hdmi *hdmi = dev_get_drvdata(dev);
+
+	dw_hdmi_suspend(hdmi->dw_hdmi);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index bf893c754539..a6f2702bca83 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -3568,6 +3568,11 @@ void dw_hdmi_unbind(struct dw_hdmi *hdmi)
 }
 EXPORT_SYMBOL_GPL(dw_hdmi_unbind);
 
+void dw_hdmi_suspend(struct dw_hdmi *hdmi)
+{
+}
+EXPORT_SYMBOL_GPL(dw_hdmi_suspend);
+
 void dw_hdmi_resume(struct dw_hdmi *hdmi)
 {
 	dw_hdmi_init_hw(hdmi);
diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index fef1702acb14..9ba83bf4787c 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -809,6 +809,8 @@ static int __maybe_unused meson_dw_hdmi_pm_suspend(struct device *dev)
 	if (!meson_dw_hdmi)
 		return 0;
 
+	dw_hdmi_suspend(meson_dw_hdmi->hdmi);
+
 	/* Reset TOP */
 	meson_dw_hdmi->data->top_write(meson_dw_hdmi,
 				       HDMITX_TOP_SW_RESET, 0);
diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 0dc1eb5d2ae3..9677424075eb 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -651,6 +651,15 @@ static void dw_hdmi_rockchip_remove(struct platform_device *pdev)
 	component_del(&pdev->dev, &dw_hdmi_rockchip_ops);
 }
 
+static int __maybe_unused dw_hdmi_rockchip_suspend(struct device *dev)
+{
+	struct rockchip_hdmi *hdmi = dev_get_drvdata(dev);
+
+	dw_hdmi_suspend(hdmi->hdmi);
+
+	return 0;
+}
+
 static int __maybe_unused dw_hdmi_rockchip_resume(struct device *dev)
 {
 	struct rockchip_hdmi *hdmi = dev_get_drvdata(dev);
@@ -661,7 +670,7 @@ static int __maybe_unused dw_hdmi_rockchip_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops dw_hdmi_rockchip_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(NULL, dw_hdmi_rockchip_resume)
+	SET_SYSTEM_SLEEP_PM_OPS(dw_hdmi_rockchip_suspend, dw_hdmi_rockchip_resume)
 };
 
 struct platform_driver dw_hdmi_rockchip_pltfm_driver = {
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index 8500dd4f99d8..d587c4076a25 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -184,6 +184,7 @@ struct dw_hdmi *dw_hdmi_bind(struct platform_device *pdev,
 			     struct drm_encoder *encoder,
 			     const struct dw_hdmi_plat_data *plat_data);
 
+void dw_hdmi_suspend(struct dw_hdmi *hdmi);
 void dw_hdmi_resume(struct dw_hdmi *hdmi);
 
 void dw_hdmi_setup_rx_sense(struct dw_hdmi *hdmi, bool hpd, bool rx_sense);
-- 
2.54.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
