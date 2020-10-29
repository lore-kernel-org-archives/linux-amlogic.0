Return-Path: <SRS0=5ZAx=EE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5984C4363A
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Oct 2020 02:59:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29A75206B6
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Oct 2020 02:59:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RLSKZW5N";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="khg622DL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29A75206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OonC2We2OHom5V/oXGXctb+4s17QInxTTNOF59sSRb0=; b=RLSKZW5NCTGv3ZSJKxCvZ1/zi
	D4x7Spw9YrBC88HVvjHCKw3AfLPMvEszeCjLfWHjXO3FxiyWPguHv5wyXNEPIuCdE1pzAiHQWElXZ
	Nth9EkG0UHwazYXbjFFNzzD5MvcUnW0Nst8H00V8FuXHrtWYIJZOGLf2zwdgA+W4sV+bzdKNrzleJ
	h0jsnnnTpcSSgZpiXvw9c0GC9Q5FwZe4iQA3EmyQZyizCUYriunanV0pH7L0WsFsjc7FV3W1mkyGD
	rN5q7Sq42jf13QsaJ0p29U3stHi3lt0O04JRJTtDOzlH+BwnXqeMIMhNBLh/IeZkkb5zYalRejq/L
	yLD1WM95w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXy9m-0002Tk-8e; Thu, 29 Oct 2020 02:59:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXy9a-0002Ob-8C; Thu, 29 Oct 2020 02:59:07 +0000
X-UUID: a721b07e7f644fa3a193b13dbe260408-20201028
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=QY2jHI900F+g3iEa8I5Mh3xo6vMoLoYCdQN6EhrvxoA=; 
 b=khg622DLXwSYbG66POBvZXZGGjSBxIXmNnzh8CC0V+sRwSbWXmaayOesjkkZv32QFD9bdwswucVT8xohLcBuTXV/A3KSSKIzIoJlX/7LX624nLsuIlJuBzhpJvn5qpSkNgRfOeri9OgSRdkyU4gkN/5pj0xQabrBmkkEzPMTK64=;
X-UUID: a721b07e7f644fa3a193b13dbe260408-20201028
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 527612213; Wed, 28 Oct 2020 18:59:04 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Oct 2020 19:56:05 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Oct 2020 10:55:57 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 29 Oct 2020 10:55:55 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 11/17] phy: phy-ralink-usb: convert to
 devm_platform_ioremap_resource
Date: Thu, 29 Oct 2020 10:54:33 +0800
Message-ID: <1603940079-8131-11-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1603940079-8131-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1603940079-8131-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8D80DE2D4E7C4A622E290E7D8C2A887C8A8912E9D4E1553D094223C2247E28DE2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_225906_454439_BA103CE1 
X-CRM114-Status: GOOD (  12.90  )
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
Cc: Ondrej Jirman <megous@megous.com>, Peter Chen <peter.chen@nxp.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Anil Varughese <aniljoy@cadence.com>,
 Wei Yongjun <weiyongjun1@huawei.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Fabio Estevam <festevam@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Kevin
 Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Chen-Yu Tsai <wens@csie.org>, bcm-kernel-feedback-list@broadcom.com,
 NXP Linux Team <linux-imx@nxp.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Icenowy Zheng <icenowy@aosc.io>, Bharat Gooty <bharat.gooty@broadcom.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Yue Wang <yue.wang@amlogic.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Remi Pommarel <repk@triplefau.lt>,
 linux-mediatek@lists.infradead.org,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Roger
 Quadros <rogerq@ti.com>, Hanjie Lin <hanjie.lin@amlogic.com>,
 Ma Feng <mafeng.ma@huawei.com>, Scott
 Branden <sbranden@broadcom.com>, Randy Dunlap <rdunlap@infradead.org>,
 Jyri Sarha <jsarha@ti.com>, linux-kernel@vger.kernel.org,
 Sanket Parmar <sparmar@cadence.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Joe Perches <joe@perches.com>,
 Colin Ian King <colin.king@canonical.com>, Shawn Guo <shawnguo@kernel.org>,
 Li Jun <jun.li@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Use devm_platform_ioremap_resource to simplify code

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/phy/ralink/phy-ralink-usb.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/phy/ralink/phy-ralink-usb.c b/drivers/phy/ralink/phy-ralink-usb.c
index 95dfa9fd284d..2bd8ad2e76ed 100644
--- a/drivers/phy/ralink/phy-ralink-usb.c
+++ b/drivers/phy/ralink/phy-ralink-usb.c
@@ -170,7 +170,6 @@ MODULE_DEVICE_TABLE(of, ralink_usb_phy_of_match);
 static int ralink_usb_phy_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	struct phy_provider *phy_provider;
 	const struct of_device_id *match;
 	struct ralink_usb_phy *phy;
@@ -194,8 +193,7 @@ static int ralink_usb_phy_probe(struct platform_device *pdev)
 
 	/* The MT7628 and MT7688 require extra setup of PHY registers. */
 	if (of_device_is_compatible(dev->of_node, "mediatek,mt7628-usbphy")) {
-		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-		phy->base = devm_ioremap_resource(&pdev->dev, res);
+		phy->base = devm_platform_ioremap_resource(pdev, 0);
 		if (IS_ERR(phy->base)) {
 			dev_err(dev, "failed to remap register memory\n");
 			return PTR_ERR(phy->base);
-- 
2.18.0
_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
