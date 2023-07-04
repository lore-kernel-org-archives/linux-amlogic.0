Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CAF8EB64D9
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jul 2023 14:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0etCd1fOn8GJzXYDGbv4bR3X6yIzcRlOw3m2JBWMgGU=; b=WoydBLo1sFXfCZ
	kSvFXq+s7iRP/GlhACaZ6pOJMkZpvOMCss1D7HARDjCLUsC75V9jq6+lM05e2ctaG2t4X9OQ+lJ6y
	FTVO/HrVMeVAItXTfthN/H+fbOSHmRE4JRAju5pdtCaZtWp4oVB+6nHfRNo9aH1BGhJy6YQ36UBnK
	6inMAqCg3KUYl4MZEjrdbze18Ons38ctQfDkCQgD2qFeeCfiCW9uUkVD+2IYhdgfVfDuykQGDI6Zd
	q6r66RpBCGD/wcHTjFbLZTdnPBiH7vp/1WSk0q6XLJRTtqUysH09OmrjdvGDBAFMmxJpsKoGLAywA
	WrgH7snFteQc6ds83mnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGgZP-00DSMG-1M;
	Tue, 04 Jul 2023 13:59:55 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGgZL-00DSJN-0c;
	Tue, 04 Jul 2023 13:59:53 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 3F940100069;
	Tue,  4 Jul 2023 16:59:45 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 3F940100069
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1688479185;
	bh=EtvSf+vqP9FOlSRxzL4nhak0b5LMcwi8O2nGQTCTz7k=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=J4rBARU+YHzxAYxCtemsaSPS7Qar6wgSlFeS9x+sW9lzyNv+/gfusSvbh8iOIIBB7
	 cp2zHKoeEa83SVYZvdZp62+eOZ04w5pWKhbja1VwV/o6yZC7aM/zA4tt5eDCjNIHWk
	 A70LYMY8abl6YmXHZ1kc4q0Yo7fqep+l8fhlLnNKsUvyXOE9zTJ6ANR01/hUKqglb5
	 yRKdvJReN2SAHui+ETNrl553nLXThajwBG++2nCRRN0sPNWOPOFKdFiJ6T+hahIToT
	 XyxS0khkyAHENfhxVv6nPULaaSyQ3Y0wDzmkk/mCDom31bExyy60MwW707PjMUsT4u
	 VbOVMOKeswFxw==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue,  4 Jul 2023 16:59:45 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Tue, 4 Jul 2023 16:59:34 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<neil.armstrong@linaro.org>, <jbrunet@baylibre.com>, <jirislaby@kernel.org>,
	<khilman@baylibre.com>, <martin.blumenstingl@googlemail.com>
CC: <kelvin.zhang@amlogic.com>, <xianwei.zhao@amlogic.com>,
	<kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-serial@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Dmitry Rokosov
	<ddrokosov@sberdevices.ru>
Subject: [PATCH v1 1/5] tty: serial: meson: use dev_err_probe
Date: Tue, 4 Jul 2023 16:59:32 +0300
Message-ID: <20230704135936.14697-2-ddrokosov@sberdevices.ru>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20230704135936.14697-1-ddrokosov@sberdevices.ru>
References: <20230704135936.14697-1-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178420 [Jul 04 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: DDRokosov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 520 520 ccb018a655251011855942a2571029252d3d69a2, {Tracking_from_domain_doesnt_match_to}, p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;sberdevices.ru:5.0.1,7.1.1, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/04 05:54:00 #21559896
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_065951_944839_383BECE3 
X-CRM114-Status: GOOD (  13.83  )
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

Use dev_err_probe() helper for error checking and standard logging.
It makes the driver's probe() function a little bit shorter.

Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
---
 drivers/tty/serial/meson_uart.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index 2501db5a7aaf..169f028956ae 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -726,8 +726,8 @@ static int meson_uart_probe(struct platform_device *pdev)
 	of_property_read_u32(pdev->dev.of_node, "fifo-size", &fifosize);
 
 	if (meson_ports[pdev->id]) {
-		dev_err(&pdev->dev, "port %d already allocated\n", pdev->id);
-		return -EBUSY;
+		return dev_err_probe(&pdev->dev, -EBUSY,
+			      "port %d already allocated\n", pdev->id);
 	}
 
 	port = devm_kzalloc(&pdev->dev, sizeof(struct uart_port), GFP_KERNEL);
-- 
2.36.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
