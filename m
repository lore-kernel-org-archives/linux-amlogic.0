Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 721FCEB64D9
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jul 2023 14:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8LQZbN/+JSoc60g6xqEf1bEC0JR+od6lDXQzln5EmN8=; b=lEIBbPdWNVlqc+
	j2fnzSi7F4jM9JAKXCKFX6byhEzpOVFfPpgGMiK/l7pFDs6bLvSl+WTQ7ykSRYnMrgcaOM7m+9yOn
	PuDG99LqfOUBudETJNl9QB8UolMHdLXkdSq3Sk2V34ztmPHCCrCwPhM2RybE9arWWM2jiLI5tb4XG
	w/ay3/yXJi9TWJR6dPWLELB2zkLaJjMLaOKT8XG7blD2KLU3JWz++QeKjy2fBlUiNRE/uVZlnWEoH
	uutAALndmJq2k8FbRs4vP4krEFwrMCr0/SiKdwuRLNMHK0UMtx0dq7IfHyy1lOot4qyCXGTVTipeL
	3Hneo3wifbuFW63IwIgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGgZR-00DSNX-12;
	Tue, 04 Jul 2023 13:59:57 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGgZL-00DSJS-0c;
	Tue, 04 Jul 2023 13:59:55 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 1C595120056;
	Tue,  4 Jul 2023 16:59:46 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 1C595120056
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1688479186;
	bh=jyNhnxKH/UkER4UD50pKQEq3o+4wK8IJLUssC80nzYw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=UTq3Amm3cVwxraek/UFhC9YTJANjYGkb52Ov4xtwFSfn1nSEZTg0TKDfNfoPPDPyf
	 4FlyItqYgp7zNo4IhecNpDExGfeTU+iziwCGY+2OYIX38VuC/LEA9uSS/9ZnR7DR6F
	 qcfgxxzz8tGxdC7mThxBzUylcfqpoZiLrTdxcJjnjgZBlqRk+BpgBdHUUhNSGfYOAG
	 let0sVMfHu/NnUzSf/paxLiYpvgEAkFVNR0ZzNkehlXrqu62jt2Tm07lEiiuTIGcpR
	 ixHBxDDxuQYSkAqMVBmjkdcIXHy5Pcr3qDRp3LYtAhT92+iDAonnVmdNX2/NPD+AJB
	 OWos1QKEfSN2g==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue,  4 Jul 2023 16:59:45 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Tue, 4 Jul 2023 16:59:35 +0300
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
Subject: [PATCH v1 2/5] tty: serial: meson: redesign the module to platform_driver
Date: Tue, 4 Jul 2023 16:59:33 +0300
Message-ID: <20230704135936.14697-3-ddrokosov@sberdevices.ru>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20230704135936.14697-1-ddrokosov@sberdevices.ru>
References: <20230704135936.14697-1-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178421 [Jul 04 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: DDRokosov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 520 520 ccb018a655251011855942a2571029252d3d69a2, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2;127.0.0.199:7.1.2;sberdevices.ru:5.0.1,7.1.1, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/04 05:54:00 #21559896
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_065951_948779_671FD893 
X-CRM114-Status: GOOD (  18.68  )
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

Actually, the meson_uart module is already a platform_driver, but it is
currently registered manually and the uart core registration is run
outside the probe() scope, which results in some restrictions. For
instance, it is not possible to communicate with the OF subsystem
because it requires an initialized device object.

To address this issue, apply module_platform_driver() instead of direct
module init/exit routines. Additionally, move uart_register_driver() to
the driver probe(), and destroy manual console registration because it's
already run in the uart_register_driver() flow.

Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
---
 drivers/tty/serial/meson_uart.c | 46 +++++++--------------------------
 1 file changed, 10 insertions(+), 36 deletions(-)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index 169f028956ae..87c0eb5f2dba 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -621,12 +621,6 @@ static struct console meson_serial_console = {
 	.data		= &meson_uart_driver,
 };
 
-static int __init meson_serial_console_init(void)
-{
-	register_console(&meson_serial_console);
-	return 0;
-}
-
 static void meson_serial_early_console_write(struct console *co,
 					     const char *s,
 					     u_int count)
@@ -652,9 +646,6 @@ OF_EARLYCON_DECLARE(meson, "amlogic,meson-ao-uart",
 
 #define MESON_SERIAL_CONSOLE	(&meson_serial_console)
 #else
-static int __init meson_serial_console_init(void) {
-	return 0;
-}
 #define MESON_SERIAL_CONSOLE	NULL
 #endif
 
@@ -738,6 +729,13 @@ static int meson_uart_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	if (!meson_uart_driver.state) {
+		ret = uart_register_driver(&meson_uart_driver);
+		if (ret)
+			return dev_err_probe(&pdev->dev, ret,
+				      "failed to register meson-uart driver\n");
+	}
+
 	port->iotype = UPIO_MEM;
 	port->mapbase = res_mem->start;
 	port->mapsize = resource_size(res_mem);
@@ -776,6 +774,8 @@ static int meson_uart_remove(struct platform_device *pdev)
 	uart_remove_one_port(&meson_uart_driver, port);
 	meson_ports[pdev->id] = NULL;
 
+	uart_unregister_driver(&meson_uart_driver);
+
 	return 0;
 }
 
@@ -809,33 +809,7 @@ static  struct platform_driver meson_uart_platform_driver = {
 	},
 };
 
-static int __init meson_uart_init(void)
-{
-	int ret;
-
-	ret = meson_serial_console_init();
-	if (ret)
-		return ret;
-	
-	ret = uart_register_driver(&meson_uart_driver);
-	if (ret)
-		return ret;
-
-	ret = platform_driver_register(&meson_uart_platform_driver);
-	if (ret)
-		uart_unregister_driver(&meson_uart_driver);
-
-	return ret;
-}
-
-static void __exit meson_uart_exit(void)
-{
-	platform_driver_unregister(&meson_uart_platform_driver);
-	uart_unregister_driver(&meson_uart_driver);
-}
-
-module_init(meson_uart_init);
-module_exit(meson_uart_exit);
+module_platform_driver(meson_uart_platform_driver);
 
 MODULE_AUTHOR("Carlo Caione <carlo@caione.org>");
 MODULE_DESCRIPTION("Amlogic Meson serial port driver");
-- 
2.36.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
