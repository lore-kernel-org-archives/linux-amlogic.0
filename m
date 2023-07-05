Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D689C001DD
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jul 2023 18:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ihvGVCDVrH63TDMfrZSWYTlL49cmqo2CiqktM5H2VDY=; b=JehUYQX7ALHpR2
	zuRLWdgO4buA1y608sSl4zHLfUNTEFJfBfV69eRmDRg3lFoD+hSNZxOJTQxbWAybc0AxywMbqRdhw
	yHGnHxThXvcOeXxLcvFwtbVCXANoio+hc0Y8BW76CWmmJvL9F7BT8/arhh0rj0Oq/meXxY3431LFR
	DtGj+0fJHk5VCMONL0hjYxi1bWvNcf4E8HtmYLGzt8VMgu+GQjQICVWnzfd1EyN8GQgKldbQ6hvIV
	7av6SM632E531qgD8ZOkXRm+Y2UHfKoZ2n1Vk2GA9nrcSwHquZ2V+rkL8InDVIDAHRoUcD46mT/wp
	p+M176kHzs7ZexNApGhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH75g-00GjKz-0N;
	Wed, 05 Jul 2023 18:19:00 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH75U-00GjD1-1V;
	Wed, 05 Jul 2023 18:18:53 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 55F19100088;
	Wed,  5 Jul 2023 21:18:45 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 55F19100088
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1688581125;
	bh=94uluQFPCIUYqZVpJLF+nD32K2aS5ta69HMKmaPydDo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=kwRXq9uCpVKdVoRPcxYiZQFiPbFFtob1yr+QdKoTnhg7KX9HzYLMiU9xUuax4hs7F
	 1m4DbYUvMdYB5L37/js9v+m2O+gU3kPTu+fSUz8EI3eJSTL4Lcn/TF/BaM7TQ10sEI
	 x9mpxb9Gqybtw7Xr8swG0z8asZH4n4uMOvGR47hM2/PqcOhyYaiv9YvjVfIz6yWVgz
	 HtMb5P29CM7LRjmchSfrtLVtipmNenQwGH85sLMMqJbhKd9OceKOzKCgggFxbZ+57w
	 jMFgFTLJNEtjbB9RwSuWO9U/KDhGVwNBJhvIBiJpMQ79KFRk5FOgOF4TQ3HauCl1aU
	 9NHZobsRyig2Q==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed,  5 Jul 2023 21:18:45 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 5 Jul 2023 21:18:42 +0300
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
Subject: [PATCH v2 3/7] tty: serial: meson: apply ttyS devname instead of ttyAML for new SoCs
Date: Wed, 5 Jul 2023 21:18:29 +0300
Message-ID: <20230705181833.16137-4-ddrokosov@sberdevices.ru>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20230705181833.16137-1-ddrokosov@sberdevices.ru>
References: <20230705181833.16137-1-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178461 [Jul 05 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: DDRokosov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 520 520 ccb018a655251011855942a2571029252d3d69a2, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;100.64.160.123:7.1.2;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;libera.irclog.whitequark.org:7.1.1, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2023/07/05 16:50:00
X-KSMG-LinksScanning: Clean, bases: 2023/07/05 16:49:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/05 14:57:00 #21566867
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_111849_245343_1E5F3AE4 
X-CRM114-Status: GOOD (  20.22  )
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

It is worth noting that the devname ttyS is a widely recognized tty name
and is commonly used by many uart device drivers. Given the established
usage and compatibility concerns, it may not be feasible to change the
devname for older SoCs. However, for new definitions, it is acceptable
and even recommended to use a new devname to help ensure clarity and
avoid any potential conflicts on lower or upper software levels.

For more information please refer to IRC discussion at [1].

Links:
    [1]: https://libera.irclog.whitequark.org/linux-amlogic/2023-07-03

Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
---
 drivers/tty/serial/meson_uart.c | 82 ++++++++++++++++++++++-----------
 1 file changed, 56 insertions(+), 26 deletions(-)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index dcf994a11a21..ad0748a10db7 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -72,16 +72,22 @@
 
 #define AML_UART_PORT_NUM		12
 #define AML_UART_PORT_OFFSET		6
-#define AML_UART_DEV_NAME		"ttyAML"
 
 #define AML_UART_POLL_USEC		5
 #define AML_UART_TIMEOUT_USEC		10000
 
-static struct uart_driver meson_uart_driver;
+#define MESON_UART_DRIVER(_devname) meson_uart_driver_##_devname
+
+#define MESON_UART_DRIVER_DECLARE(_devname) \
+	static struct uart_driver MESON_UART_DRIVER(_devname)
+
+MESON_UART_DRIVER_DECLARE(ttyAML);
+MESON_UART_DRIVER_DECLARE(ttyS);
 
 static struct uart_port *meson_ports[AML_UART_PORT_NUM];
 
 struct meson_uart_data {
+	struct uart_driver *uart_driver;
 	bool has_xtal_div2;
 };
 
@@ -611,15 +617,21 @@ static int meson_serial_console_setup(struct console *co, char *options)
 	return uart_set_options(port, co, baud, parity, bits, flow);
 }
 
-static struct console meson_serial_console = {
-	.name		= AML_UART_DEV_NAME,
-	.write		= meson_serial_console_write,
-	.device		= uart_console_device,
-	.setup		= meson_serial_console_setup,
-	.flags		= CON_PRINTBUFFER,
-	.index		= -1,
-	.data		= &meson_uart_driver,
-};
+#define MESON_SERIAL_CONSOLE(_devname) meson_serial_console_##_devname
+
+#define MESON_SERIAL_CONSOLE_DEFINE(_devname)				\
+	static struct console MESON_SERIAL_CONSOLE(_devname) = {	\
+		.name		= __stringify(_devname),		\
+		.write		= meson_serial_console_write,		\
+		.device		= uart_console_device,			\
+		.setup		= meson_serial_console_setup,		\
+		.flags		= CON_PRINTBUFFER,			\
+		.index		= -1,					\
+		.data		= &MESON_UART_DRIVER(_devname),		\
+	}
+
+MESON_SERIAL_CONSOLE_DEFINE(ttyAML);
+MESON_SERIAL_CONSOLE_DEFINE(ttyS);
 
 static void meson_serial_early_console_write(struct console *co,
 					     const char *s,
@@ -644,18 +656,22 @@ meson_serial_early_console_setup(struct earlycon_device *device, const char *opt
 OF_EARLYCON_DECLARE(meson, "amlogic,meson-ao-uart",
 		    meson_serial_early_console_setup);
 
-#define MESON_SERIAL_CONSOLE	(&meson_serial_console)
+#define MESON_SERIAL_CONSOLE_PTR(_devname) (&MESON_SERIAL_CONSOLE(_devname))
 #else
-#define MESON_SERIAL_CONSOLE	NULL
+#define MESON_SERIAL_CONSOLE_PTR(_devname)	(NULL)
 #endif
 
-static struct uart_driver meson_uart_driver = {
-	.owner		= THIS_MODULE,
-	.driver_name	= "meson_uart",
-	.dev_name	= AML_UART_DEV_NAME,
-	.nr		= AML_UART_PORT_NUM,
-	.cons		= MESON_SERIAL_CONSOLE,
-};
+#define MESON_UART_DRIVER_DEFINE(_devname)  \
+	static struct uart_driver MESON_UART_DRIVER(_devname) = {	\
+		.owner		= THIS_MODULE,				\
+		.driver_name	= "meson_uart",				\
+		.dev_name	= __stringify(_devname),		\
+		.nr		= AML_UART_PORT_NUM,			\
+		.cons		= MESON_SERIAL_CONSOLE_PTR(_devname),	\
+	}
+
+MESON_UART_DRIVER_DEFINE(ttyAML);
+MESON_UART_DRIVER_DEFINE(ttyS);
 
 static int meson_uart_probe_clocks(struct platform_device *pdev,
 				   struct uart_port *port)
@@ -681,8 +697,16 @@ static int meson_uart_probe_clocks(struct platform_device *pdev,
 	return 0;
 }
 
+static struct uart_driver *meson_uart_current(const struct meson_uart_data *pd)
+{
+	return (pd && pd->uart_driver) ?
+		pd->uart_driver : &MESON_UART_DRIVER(ttyAML);
+}
+
 static int meson_uart_probe(struct platform_device *pdev)
 {
+	const struct meson_uart_data *priv_data;
+	struct uart_driver *uart_driver;
 	struct resource *res_mem;
 	struct uart_port *port;
 	u32 fifosize = 64; /* Default is 64, 128 for EE UART_0 */
@@ -729,8 +753,12 @@ static int meson_uart_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	if (!meson_uart_driver.state) {
-		ret = uart_register_driver(&meson_uart_driver);
+	priv_data = device_get_match_data(&pdev->dev);
+
+	uart_driver = meson_uart_current(priv_data);
+
+	if (!uart_driver->state) {
+		ret = uart_register_driver(uart_driver);
 		if (ret)
 			return dev_err_probe(&pdev->dev, ret,
 					     "can't register uart driver\n");
@@ -748,7 +776,7 @@ static int meson_uart_probe(struct platform_device *pdev)
 	port->x_char = 0;
 	port->ops = &meson_uart_ops;
 	port->fifosize = fifosize;
-	port->private_data = (void *)device_get_match_data(&pdev->dev);
+	port->private_data = (void *)priv_data;
 
 	meson_ports[pdev->id] = port;
 	platform_set_drvdata(pdev, port);
@@ -759,7 +787,7 @@ static int meson_uart_probe(struct platform_device *pdev)
 		meson_uart_release_port(port);
 	}
 
-	ret = uart_add_one_port(&meson_uart_driver, port);
+	ret = uart_add_one_port(uart_driver, port);
 	if (ret)
 		meson_ports[pdev->id] = NULL;
 
@@ -768,10 +796,12 @@ static int meson_uart_probe(struct platform_device *pdev)
 
 static int meson_uart_remove(struct platform_device *pdev)
 {
+	struct uart_driver *uart_driver;
 	struct uart_port *port;
 
 	port = platform_get_drvdata(pdev);
-	uart_remove_one_port(&meson_uart_driver, port);
+	uart_driver = meson_uart_current(port->private_data);
+	uart_remove_one_port(uart_driver, port);
 	meson_ports[pdev->id] = NULL;
 
 	for (int id = 0; id < AML_UART_PORT_NUM; id++)
@@ -779,7 +809,7 @@ static int meson_uart_remove(struct platform_device *pdev)
 			return 0;
 
 	/* No more available uart ports, unregister uart driver */
-	uart_unregister_driver(&meson_uart_driver);
+	uart_unregister_driver(uart_driver);
 
 	return 0;
 }
-- 
2.36.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
