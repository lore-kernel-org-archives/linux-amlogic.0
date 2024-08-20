Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D855C3DA4A
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2024 14:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GlswqDm09um1lGCQq91xLTHKAbnDz9w9gj0IhlK2dJA=; b=xBY7MbDtq3jD92
	dw98Gh8gRQO//ciSrinA95zt7++sOSbn7fgtBkgvvz2MmTI67qCbaElP40F7sq0oMXuWg0otLtJzW
	FuZ2wDMRUKeJrDb8m0w96p0AxS/5qC4bR4Ml2IwssFuVhPnGCPEastNY5UBdtYEd47+m1oox+Yx1r
	+vWdi63FyGRLExNKUwkl3LvR7o26IMvfhtgVvwGRAenhQeAa6atePhLRuSiVUvFWegO/GAwQe6L/T
	UluZm7BZ+Yp1iFMMuX6ftyK4nz0yJpldIH+wvt/Jp/kKTcl5yG5JF/OnWFRn0WDUcZ2kwA9soivCM
	9ekW8iEhA0/hqBZlZkQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgQIt-00000005fe2-0pyQ;
	Tue, 20 Aug 2024 14:57:47 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgQI6-00000005fI7-1eyH;
	Tue, 20 Aug 2024 14:57:01 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 1169D120015;
	Tue, 20 Aug 2024 17:56:57 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 1169D120015
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1724165817;
	bh=HfV9iF0dvGOWT3RLcCjTwSmOj3751yeXQaYbGDhTmqU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=m9ZJSgJg/ArmU9cvXdn68uQRlfNwQ3G/3FmIKpsavX2sEymDwcYo6p5Eq3PkQDNjt
	 utqUdyezCvFo7SsVjRDGCnOfPeSx2Bil1lYQIcZOjTNTJ1sRtD3wcq2sl9kpVU3Bh2
	 pR0frOeUCvb/I9mRDtglFhBl4iwdqNxVbiQU3rMXVYbJvwpSwNdAEvUdXK4lg/sD1I
	 VKVpN8HFOQVbAYIZ0TdoQ2oDEVXtSY1OJlvmtYsZJkWfvTmCl6PCberPV0TJlL8Mac
	 llGZ0ObcxXuY+fTMbusVai92oIrPS9WrtM5HefjqgnbD3dICc9PARsC+6ZxFzCFFOa
	 NFiQCCh2KJDkg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 20 Aug 2024 17:56:56 +0300 (MSK)
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
Subject: [PATCH v9 03/23] drivers: crypto: meson: remove clock input
Date: Tue, 20 Aug 2024 17:56:03 +0300
Message-ID: <20240820145623.3500864-4-avromanov@salutedevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240820145623.3500864-1-avromanov@salutedevices.com>
References: <20240820145623.3500864-1-avromanov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [84.252.147.252]
X-ClientProxiedBy: p-i-exch-a-m1.sberdevices.ru (172.24.196.116) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 187181 [Aug 20 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: avromanov@s2b.tech
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 27 0.3.27 71302da218a62dcd84ac43314e19b5cc6b38e0b6, {Tracking_smtp_not_equal_from}, {Tracking_from_domain_doesnt_match_to}, s2b.tech:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2;salutedevices.com:7.1.1, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, FromAlignment: n
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/08/20 03:45:00 #26365304
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_075658_850136_B90B3C42 
X-CRM114-Status: GOOD (  11.98  )
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

Amlogic crypto IP, which uses DMA crypto engine,
doesn't take a clock input.

Fixes: 48fe583fe541 ("crypto: amlogic - Add crypto accelerator for amlogic GXL")
Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
---
 drivers/crypto/amlogic/amlogic-gxl-core.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index e9e733ed98e0..9d92115043c3 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -9,7 +9,6 @@
 
 #include <crypto/engine.h>
 #include <crypto/internal/skcipher.h>
-#include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
@@ -269,18 +268,6 @@ static int meson_crypto_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "Cannot request MMIO err=%d\n", err);
 		return err;
 	}
-	mc->busclk = devm_clk_get(&pdev->dev, "blkmv");
-	if (IS_ERR(mc->busclk)) {
-		err = PTR_ERR(mc->busclk);
-		dev_err(&pdev->dev, "Cannot get core clock err=%d\n", err);
-		return err;
-	}
-
-	err = clk_prepare_enable(mc->busclk);
-	if (err != 0) {
-		dev_err(&pdev->dev, "Cannot prepare_enable busclk\n");
-		return err;
-	}
 
 	err = meson_allocate_chanlist(mc);
 	if (err)
@@ -306,7 +293,6 @@ static int meson_crypto_probe(struct platform_device *pdev)
 	meson_unregister_algs(mc);
 error_flow:
 	meson_free_chanlist(mc, mc->flow_cnt - 1);
-	clk_disable_unprepare(mc->busclk);
 	return err;
 }
 
@@ -321,8 +307,6 @@ static void meson_crypto_remove(struct platform_device *pdev)
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
