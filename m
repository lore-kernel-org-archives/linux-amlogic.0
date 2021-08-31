Return-Path: <SRS0=FHOR=NW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97244C43216
	for <linux-amlogic@archiver.kernel.org>; Tue, 31 Aug 2021 13:57:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CA0A61041
	for <linux-amlogic@archiver.kernel.org>; Tue, 31 Aug 2021 13:57:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6CA0A61041
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baidu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xb97GVtvShKhVxWX4SNA1wOqmtlyscTqQY+1x2ofPFk=; b=dKOGUTrjQogokS
	WcHNVbYt+3aCTOQ4hXfA4ZVYBi5DDUZyH6yL+e86n/iQgloXsN9HW1bxWM4Gxx026yMXHI6itw+tq
	DVW8o+nRFR0QCwwJzhjPnj5u9LQ0vqKBi/qvtb0FxIaO7DXhGCt1xhP/M/oEMg43rsmO5GGpIxOAV
	CTml1RF462dA+N2FegBGCOe5tHJPpWP065R8DSbE4CH4K76DoGT2/npixslY3dB9lDUaE1YXQov6V
	prLhd4kqeLLuQAB1qLy7/Bz9RudfW5r1FKQH1HpBpPCrTDJN96I3NH/jn+0IoJIBILhIaomLjbXPs
	jF0eEBoJtVz9h8Jq6Wbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mL4G2-002RSu-FZ; Tue, 31 Aug 2021 13:56:58 +0000
Received: from mx21.baidu.com ([220.181.3.85] helo=baidu.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mL4Fw-002RPc-QV; Tue, 31 Aug 2021 13:56:56 +0000
Received: from BC-Mail-Ex10.internal.baidu.com (unknown [172.31.51.50])
 by Forcepoint Email with ESMTPS id E5757B94A732856F2780;
 Tue, 31 Aug 2021 21:56:50 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex10.internal.baidu.com (172.31.51.50) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Tue, 31 Aug 2021 21:56:50 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Tue, 31 Aug 2021 21:56:50 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <caihuoqing@baidu.com>
CC: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 "Jerome Brunet" <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, <dri-devel@lists.freedesktop.org>,
 <linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/meson: Make use of the helper function
 devm_platform_ioremap_resourcexxx()
Date: Tue, 31 Aug 2021 21:56:43 +0800
Message-ID: <20210831135644.4576-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex30.internal.baidu.com (172.31.51.24) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_065653_078260_5FB411C2 
X-CRM114-Status: GOOD (  10.71  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Use the devm_platform_ioremap_resource_byname() helper instead of
calling platform_get_resource_byname() and devm_ioremap_resource()
separately

Use the devm_platform_ioremap_resource() helper instead of
calling platform_get_resource() and devm_ioremap_resource()
separately

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/gpu/drm/meson/meson_drv.c     | 3 +--
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 4 +---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index bc0d60df04ae..7f41a33592c8 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -206,8 +206,7 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 	priv->compat = match->compat;
 	priv->afbcd.ops = match->afbcd_ops;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "vpu");
-	regs = devm_ioremap_resource(dev, res);
+	regs = devm_platform_ioremap_resource_byname(pdev, "vpu");
 	if (IS_ERR(regs)) {
 		ret = PTR_ERR(regs);
 		goto free_drm;
diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 2ed87cfdd735..0afbd1e70bfc 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -978,7 +978,6 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 	struct dw_hdmi_plat_data *dw_plat_data;
 	struct drm_bridge *next_bridge;
 	struct drm_encoder *encoder;
-	struct resource *res;
 	int irq;
 	int ret;
 
@@ -1042,8 +1041,7 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 		return PTR_ERR(meson_dw_hdmi->hdmitx_phy);
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	meson_dw_hdmi->hdmitx = devm_ioremap_resource(dev, res);
+	meson_dw_hdmi->hdmitx = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(meson_dw_hdmi->hdmitx))
 		return PTR_ERR(meson_dw_hdmi->hdmitx);
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
