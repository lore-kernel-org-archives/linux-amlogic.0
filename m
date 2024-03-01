Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B6FDC5478C
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Mar 2024 13:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t04KVH0um9tYnztWV50gKkHuLFl3hCm84D27JvgLaf0=; b=xg+1N3KUcispOk
	yWmHcOzFRwZX7KHVTpm8XvMIfuTnfYm3CJKkdrBSP9gnYZiCIFmfuB+hA0rszrYsSAa5cRxiO/DRM
	mtXU+CuQrrUKaVUcXt+Mn5sl6YJhu42zqCNqlJA9YKP7VPzROHybYxTDHuuRXV1OCbneI29nyEu40
	zQvX8wbhdmzszjyJu8jiqOSbIW8EWoHalal+VFDdpSDe4BN/92ZeYZNNqGqXNlI1dE1/67f5B8P19
	v2HYzQlsk1SgP+gwEH0fbZ0y/vwSjG2h1NaDAPT2l3nBaw42mN8XXmdVdXyyZGPffKjh+kOnjuUOY
	oTZ4bwhOnru7rRwsSGzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg35U-00000000XMq-2W4G;
	Fri, 01 Mar 2024 13:38:08 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg2xh-00000000Sb0-43D2;
	Fri, 01 Mar 2024 13:30:09 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 9609F1000E0;
	Fri,  1 Mar 2024 16:30:04 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 9609F1000E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1709299804;
	bh=av4IOd2YUJAYKO3Jponq5Bllw9nK4sneiyc0GQaRres=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=dVecjbKnXBnrJ+DXoKNe9Er+vDRWRrwvTnK/G+KrECap2rbCHhY0asdIvvkd48H76
	 2HFwOCWcVf10fljfd1hRJpdYbYBzlDrfFspF04dH5/sb45Z0me+qBG3YQu3DoSbY+K
	 SJUfEHkns6xE6OLsYlbhKjJJne5hZX9FwP7YdNU9mksCWHQsuNosBaldjnuyhL/04e
	 NGRNtSIruaGHtMWsDfEfHRBmL/L2zULT9htzT+2onwsLmspmEm8XlTl3pt401izgKR
	 bl2/wvlklraNnCG423hKZyNoLH9PYKfVGP0GkdzG4VUEKxoZZCJCiBz5KHMq/XqXJ7
	 /ONrq0sFcsqJg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri,  1 Mar 2024 16:30:04 +0300 (MSK)
Received: from user-A520M-DS3H.sigma.sbrf.ru (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 1 Mar 2024 16:30:03 +0300
From: Alexey Romanov <avromanov@salutedevices.com>
To: <neil.armstrong@linaro.org>, <clabbe@baylibre.com>,
	<herbert@gondor.apana.org.au>, <davem@davemloft.net>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <vadim.fedorenko@linux.dev>
CC: <linux-crypto@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <kernel@salutedevices.com>, Alexey
 Romanov <avromanov@salutedevices.com>
Subject: [PATCH v5 03/21] drivers: crypto: meson: make CLK controller optional
Date: Fri, 1 Mar 2024 16:29:18 +0300
Message-ID: <20240301132936.621238-4-avromanov@salutedevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240301132936.621238-1-avromanov@salutedevices.com>
References: <20240301132936.621238-1-avromanov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183875 [Feb 29 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: avromanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_from_domain_doesnt_match_to}, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/02/29 19:21:00 #23899999
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_053006_380334_7F15F1A0 
X-CRM114-Status: GOOD (  12.67  )
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
 drivers/crypto/amlogic/amlogic-gxl-core.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index e9e733ed98e0..a3a69a59f476 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -269,16 +269,11 @@ static int meson_crypto_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "Cannot request MMIO err=%d\n", err);
 		return err;
 	}
-	mc->busclk = devm_clk_get(&pdev->dev, "blkmv");
+
+	mc->busclk = devm_clk_get_optional_enabled(&pdev->dev, "blkmv");
 	if (IS_ERR(mc->busclk)) {
 		err = PTR_ERR(mc->busclk);
-		dev_err(&pdev->dev, "Cannot get core clock err=%d\n", err);
-		return err;
-	}
-
-	err = clk_prepare_enable(mc->busclk);
-	if (err != 0) {
-		dev_err(&pdev->dev, "Cannot prepare_enable busclk\n");
+		dev_err(&pdev->dev, "Cannot get and enable core clock err=%d\n", err);
 		return err;
 	}
 
@@ -306,7 +301,6 @@ static int meson_crypto_probe(struct platform_device *pdev)
 	meson_unregister_algs(mc);
 error_flow:
 	meson_free_chanlist(mc, mc->flow_cnt - 1);
-	clk_disable_unprepare(mc->busclk);
 	return err;
 }
 
@@ -321,8 +315,6 @@ static void meson_crypto_remove(struct platform_device *pdev)
 	meson_unregister_algs(mc);
 
 	meson_free_chanlist(mc, mc->flow_cnt - 1);
-
-	clk_disable_unprepare(mc->busclk);
 }
 
 static const struct meson_pdata meson_gxl_pdata = {
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
