Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E41FC4828D
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Feb 2024 15:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4iHt3YCdaJg9FYqOfayo/vMLKUNW/ad4IqzENH2vijs=; b=K1xYgneQEkG1Kh
	Sbw/5GAKGC8iYaexY+0WtCtp3RqbRsDqOGUs9hc+/Iipsf7Bj0oTcXWy+cl9gI5iLb9ggiiTxa/BC
	JaEDx5M2A9hsIWen2CvECGU8WoB9TYMBK48MPZgb4L0sTQmh7wDVHWmMno15tNv9y8KmVDR8QPd2h
	nvxgAPwiIrYoMUm3VUgdFtiid36jJtPOQ8nycZUvvGjQ78EB6pcFu/RFJFOxUs3dzx5Lbb/ezUV/L
	MVPmVsw+dZecJf1MRLoUDIm2ViHtFBVhnlbKf6ypvBruk9sGC2ibW9xcXL8d7XYTFIrBCOyPW+zy1
	b2cvPZVJ3KM+d/p6k69w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX1KV-00000003szA-2LT4;
	Mon, 05 Feb 2024 15:56:19 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX1Jw-00000003sek-2XLf;
	Mon, 05 Feb 2024 15:55:46 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id B524612000B;
	Mon,  5 Feb 2024 18:55:40 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru B524612000B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1707148540;
	bh=JRDgg7o64zkG8+972kncfw3X0h+nBkIPPG5PA2GVm7g=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=XfjB6+wjAmD/BhJWzU4WgwyT53xfE4YgeZa50j0fRqvfkzR+bQRsrbdq3DDSCoFYT
	 y3k3Gli4+7dFqvvBGWv31yDKk9pQgsi37J/nRm/kJYHLsnSF6H4QHkWyUNmJE8YRDK
	 1swMLt8WIKZa2gQEPNmu6TYlKHfO6O7Xg9DLHrDIBNBqM+dQxSyxdc0ZZeuqh5oyqe
	 fAD2lg8vy4a5WkO2Oms+5QYWyi0kwo7HmV4GHgOKfc9QRRMZvG+DRv1uuD5C0yLA2i
	 cxiUK9dEgeR4hhSnzPLapBcRtpXHeDEc6yWNC4MaY4kIC77b62hMDKsu71HWbGlKNN
	 OZwzuL41TSf9g==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon,  5 Feb 2024 18:55:40 +0300 (MSK)
Received: from user-A520M-DS3H.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 5 Feb 2024 18:55:39 +0300
From: Alexey Romanov <avromanov@salutedevices.com>
To: <neil.armstrong@linaro.org>, <clabbe@baylibre.com>,
	<herbert@gondor.apana.org.au>, <davem@davemloft.net>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <linux-crypto@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <kernel@salutedevices.com>, Alexey
 Romanov <avromanov@salutedevices.com>
Subject: [PATCH v3 03/20] drivers: crypto: meson: make CLK controller optional
Date: Mon, 5 Feb 2024 18:55:04 +0300
Message-ID: <20240205155521.1795552-4-avromanov@salutedevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240205155521.1795552-1-avromanov@salutedevices.com>
References: <20240205155521.1795552-1-avromanov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183204 [Feb 05 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: avromanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;100.64.160.123:7.1.2;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/02/05 10:19:00 #23362212
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_075545_042428_D2DBC71C 
X-CRM114-Status: GOOD (  15.55  )
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

Amlogic crypto IP doesn't take a clock input on some
SoCs: AXG / A1 / S4 / G12. So make it optional.

Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
---
 drivers/crypto/amlogic/amlogic-gxl-core.c | 21 ++++++++-------------
 drivers/crypto/amlogic/amlogic-gxl.h      |  2 ++
 2 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 4d1b1d5b7a54..54113c524ec5 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -250,6 +250,7 @@ static void meson_unregister_algs(struct meson_dev *mc)
 static const struct meson_pdata meson_gxl_pdata = {
 	.descs_reg = 0x0,
 	.status_reg = 0x4,
+	.need_clk = true,
 };
 
 static const struct of_device_id meson_crypto_of_match_table[] = {
@@ -285,17 +286,14 @@ static int meson_crypto_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "Cannot request MMIO err=%d\n", err);
 		return err;
 	}
-	mc->busclk = devm_clk_get(&pdev->dev, "blkmv");
-	if (IS_ERR(mc->busclk)) {
-		err = PTR_ERR(mc->busclk);
-		dev_err(&pdev->dev, "Cannot get core clock err=%d\n", err);
-		return err;
-	}
 
-	err = clk_prepare_enable(mc->busclk);
-	if (err != 0) {
-		dev_err(&pdev->dev, "Cannot prepare_enable busclk\n");
-		return err;
+	if (mc->pdata->need_clk) {
+		mc->busclk = devm_clk_get_enabled(&pdev->dev, "blkmv");
+		if (IS_ERR(mc->busclk)) {
+			err = PTR_ERR(mc->busclk);
+			dev_err(&pdev->dev, "Cannot get and enable core clock err=%d\n", err);
+			return err;
+		}
 	}
 
 	err = meson_allocate_chanlist(mc);
@@ -322,7 +320,6 @@ static int meson_crypto_probe(struct platform_device *pdev)
 	meson_unregister_algs(mc);
 error_flow:
 	meson_free_chanlist(mc, mc->flow_cnt - 1);
-	clk_disable_unprepare(mc->busclk);
 	return err;
 }
 
@@ -337,8 +334,6 @@ static void meson_crypto_remove(struct platform_device *pdev)
 	meson_unregister_algs(mc);
 
 	meson_free_chanlist(mc, mc->flow_cnt - 1);
-
-	clk_disable_unprepare(mc->busclk);
 }
 
 static struct platform_driver meson_crypto_driver = {
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index 9ad75da214ff..a36b9bac63a0 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -82,10 +82,12 @@ struct meson_flow {
  * struct meson_pdata - SoC series dependent data.
  * @reg_descs:	offset to descriptors register
  * @reg_status:	offset to status register
+ * @need_clk:	clock input is needed
  */
 struct meson_pdata {
 	u32 descs_reg;
 	u32 status_reg;
+	bool need_clk;
 };
 
 /*
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
