Return-Path: <SRS0=ok2G=7I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 601C3C433DF
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 May 2020 01:16:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 379A82068D
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 May 2020 01:16:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MYONQPME";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vUn+ZjvF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 379A82068D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xMsnWX9zMriobja6KsL8/l/oOWeSs32vh7iIfcStxW0=; b=MYONQPMEC3ZfgF
	Xn+TXi1XmKMWIwJbSd2uf7HUwtjNKWcx3DSSSFYYxQD8VsDdd9ctPwCD9KVOoCOzNDmTayE98TOIS
	rTun6GppuxgFJf4X9Kr1NKaPLtRO5JLo951MUhX+EFoTyRgByIRn83HtuVyjvPJ0mye4gecvtdzqG
	JA0Z3pRlFW4iKCV9aKfb0nd5bjEEPVqwyK51tcbgbiZaxhVGNIx3wQesNo6AsDMI1ECV9fSpOzthR
	PiwvObSgoHxyqMcRSpti1qukKV2TT0dRD9s5aFyXUjpOyzmaQzqtwP9pN3N9P5pY+Ji8uJF4cySKX
	VAhoyVPV/qd8lyRAyg3A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdOC6-0007uS-CN; Tue, 26 May 2020 01:15:50 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdOC2-0007rr-3W
 for linux-amlogic@lists.infradead.org; Tue, 26 May 2020 01:15:47 +0000
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 09AA81C63;
 Tue, 26 May 2020 03:15:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1590455740;
 bh=ItM32SvgQDcRmdwFE6OKK4+lXyHhqG0Vvzv5CWs4AlI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vUn+ZjvFyPH6hR6AJmJ8XJoFAeMkcozS25iSEI4foC64vTiU+cy6bmXOW1Phn+T5Y
 ezLL8dQzxS6R3rspcv9Q4DhZOIUq7TKZnYlBwx4xb9+8nLL1CX57bSlcgDIUo/z6O4
 nHp0wmUv0OOqz3vdtqql67JK4XDp9LfR5M3dRvRo=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 14/27] drm: meson: dw-hdmi: Use dw_hdmi context to replace hack
Date: Tue, 26 May 2020 04:14:52 +0300
Message-Id: <20200526011505.31884-15-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200525_181546_294228_ADFA0423 
X-CRM114-Status: UNSURE (   9.26  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
 linux-amlogic@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The meson-dw-hdmi driver needs to access its own context from the
.mode_valid() operation. It currently gets it from the dev_private field
of the drm_device retrieved from the connector, which is a hack. Use the
private data passed to the .mode_valid() operation instead.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 5cc311c1b8e0..34ba94922605 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -634,7 +634,8 @@ dw_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
 		   struct drm_connector *connector,
 		   const struct drm_display_mode *mode)
 {
-	struct meson_drm *priv = connector->dev->dev_private;
+	struct meson_dw_hdmi *dw_hdmi = data;
+	struct meson_drm *priv = dw_hdmi->priv;
 	bool is_hdmi2_sink = connector->display_info.hdmi.scdc.supported;
 	unsigned int phy_freq;
 	unsigned int vclk_freq;
@@ -693,7 +694,7 @@ dw_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
 	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
 		venc_freq /= 2;
 
-	dev_dbg(connector->dev->dev, "%s: vclk:%d phy=%d venc=%d hdmi=%d\n",
+	dev_dbg(dw_hdmi->dev, "%s: vclk:%d phy=%d venc=%d hdmi=%d\n",
 		__func__, phy_freq, vclk_freq, venc_freq, hdmi_freq);
 
 	return meson_vclk_vic_supported_freq(priv, phy_freq, vclk_freq);
@@ -1068,6 +1069,7 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 
 	/* Bridge / Connector */
 
+	dw_plat_data->priv_data = meson_dw_hdmi;
 	dw_plat_data->mode_valid = dw_hdmi_mode_valid;
 	dw_plat_data->phy_ops = &meson_dw_hdmi_phy_ops;
 	dw_plat_data->phy_name = "meson_dw_hdmi_phy";
-- 
Regards,

Laurent Pinchart


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
