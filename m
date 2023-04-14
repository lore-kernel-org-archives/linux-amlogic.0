Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA779C77B72
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Apr 2023 15:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PQDSPeKvwy8MP2ptUIOlqplLwrCWlzSxWz/bVBhP+U4=; b=BtguSprUSuyzYt
	BsANaO3LB8ICHYmAln4X7ixLZG6ZwaGFVZLbw5kPfMCSgWbV49EI7O3pm+sM9pfYISWct17A5tHNe
	JR0nV70qG5t5/b7ABMls7dzQE4Uqs01achEt6mbByVO+XA6h/4lEqrGzY4HtcRue8jiX5rp4O35sR
	A7w32c04X6nVBCOADq8kBKw2BK5dcEyWuiW4mkWhEm/7BKCqfised98bjNTot8VChxsaMuDg0taIC
	0uTqjjHI1ubag/lAKVapqvGJBUHGhBFzS2okYdKNYmMHBbXikkUNFTVukM0e60Mhvly2EGijtPgPx
	LTcqX0rY56esjMfSKnYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnLI2-009wjO-1t;
	Fri, 14 Apr 2023 15:24:42 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnLHz-009wdv-2Z;
	Fri, 14 Apr 2023 15:24:41 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 1D0375FD24;
	Fri, 14 Apr 2023 18:24:33 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1681485873;
	bh=tOUyWscI9lZ1BfORK8wKAfGeDsR5jeAkMWXUSzV4nOo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=CFdpljegFDGexcztw33NhE658VcGlcFo5wn3igYeJFqCtORsOzU1iJZtNx5OimR/Y
	 yrWTJo1YWhhrl+k6uGaY0UtI+OpMNNpWiDZoxhjzFUJ/Q5PK+Ra57awx4f5TUZNIzv
	 1ouylhk4YsGKFNyAtBKR2dLW1xkSnUEP9FnyRkFofutwcV4uyDLEZIAAY1l3cWXehw
	 hd6oIkmEoGKt4L2uEmlsUdSK5/mVTzLdzekjD/fDlr7Dit+h1uDMHIYZEoZfb6LqtS
	 ZLcSfn2SSLUPzZ5jCA/DCJi9HoDnbTYfRaukxs5vN3AGDjRiYc7J0mF1jkLj8R2oFx
	 p2KNLorzVL5zQ==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Fri, 14 Apr 2023 18:24:33 +0300 (MSK)
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <mturquette@baylibre.com>,
	<vkoul@kernel.org>, <kishon@kernel.org>, <hminas@synopsys.com>,
	<Thinh.Nguyen@synopsys.com>
CC: <yue.wang@amlogic.com>, <hanjie.lin@amlogic.com>, <kernel@sberdevices.ru>,
	<rockosov@gmail.com>, <linux-usb@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, Dmitry Rokosov <ddrokosov@sberdevices.ru>
Subject: [PATCH v1 1/5] phy: amlogic: during USB PHY clkin obtaining, enable it
Date: Fri, 14 Apr 2023 18:24:19 +0300
Message-ID: <20230414152423.19842-2-ddrokosov@sberdevices.ru>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20230414152423.19842-1-ddrokosov@sberdevices.ru>
References: <20230414152423.19842-1-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/04/14 08:08:00 #21104846
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_082440_033165_E12F9ADA 
X-CRM114-Status: GOOD (  11.76  )
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

Previously, all Amlogic boards used the XTAL clock as the USB PHY input
clock, and it did not need to be enabled as it was the default board
clock. However, in new Amlogic SoCs such as the A1 family, USB PHY uses
a gated clock, so it is necessary to enable this gated clock during
probing.

Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
---
 drivers/phy/amlogic/phy-meson-g12a-usb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/amlogic/phy-meson-g12a-usb2.c b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
index 9d1efa0d9394..26b99fbe1026 100644
--- a/drivers/phy/amlogic/phy-meson-g12a-usb2.c
+++ b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
@@ -315,7 +315,7 @@ static int phy_meson_g12a_usb2_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->regmap))
 		return PTR_ERR(priv->regmap);
 
-	priv->clk = devm_clk_get(dev, "xtal");
+	priv->clk = devm_clk_get_enabled(dev, "xtal");
 	if (IS_ERR(priv->clk))
 		return PTR_ERR(priv->clk);
 
-- 
2.36.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
