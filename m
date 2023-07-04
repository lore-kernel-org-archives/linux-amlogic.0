Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB27EB64D9
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jul 2023 14:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IlZiDoXy6ahOGNskYpTm9GrU9SsuwY/Kzff9tFeqcUA=; b=Fy0mlzy/cXR9bs
	1B2ziMjpzumwJInFeauQmHMVpEtgC1XRrY3gF3LKb6jAWZ3Ay7cCX306Cj1LTlobUQTmwdCOuDSXt
	z2JMjpxxDcaJdUSkutN+42Tb5bFIyG5QFuQbdN12ioIcDzimgeKsMPnQm1HkIm9T/pltvzkJ/gviT
	fSpZjVj7cNHE7GT2KdK2/VD7aSFH+lshjdb+rwjjgrtq7/BXx34+gaKlRhQVT1hHc4cCBkoh4kUUh
	FdYwRrER/1IQ4yCpVUurS6v6dfyFFDxEMSdaTCgnqjmzLVc8GzxWj1fKps50vD4glyXRfUWZEUFV4
	rX/A8xBdJ0UUwsK+RAdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGgZT-00DSOy-11;
	Tue, 04 Jul 2023 13:59:59 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGgZL-00DSJX-0c;
	Tue, 04 Jul 2023 13:59:55 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id E3802100073;
	Tue,  4 Jul 2023 16:59:46 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru E3802100073
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1688479186;
	bh=GqJ6v9rct7JIpD7/9y+mD3WCzkd0bTZ9Ye0iVwHILeo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=N9VJ12llQT5RpBSAc88lGVNKEk2wT1IkruyT6FVw6om14zJEWsAs6Vr/UlcLnrQMN
	 YfzmQ5e7xOWTIwMsmfs1eAfC+9ZeCMkECYUOFDbxdOs50hsFkNb56RXU00PLOI5VF2
	 5WwaEkuY2f9FihDnwI/DpzJdwqColZOohyVhrZNRsNQmWX6YbsRhs678taYiZQoRFv
	 VTyndBzDrF+II1feGs5G9ZvbKjeFfCRylj/ml1S72VzV78vVtDX+oowgKQPJtqRpPr
	 CTiUB/gRRFLoH/pUnwtt/5jWHUmZp9/VOaMB524WO/NNKesqlsS7W369hoMcQMKLb4
	 kC6zVLWSjip8w==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue,  4 Jul 2023 16:59:46 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Tue, 4 Jul 2023 16:59:36 +0300
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
Subject: [PATCH v1 3/5] tty: serial: meson: apply ttyS devname instead of ttyAML for new SoCs
Date: Tue, 4 Jul 2023 16:59:34 +0300
Message-ID: <20230704135936.14697-4-ddrokosov@sberdevices.ru>
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
X-KSMG-AntiSpam-Info: LuaCore: 520 520 ccb018a655251011855942a2571029252d3d69a2, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, libera.irclog.whitequark.org:7.1.1;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;sberdevices.ru:5.0.1,7.1.1, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2023/07/04 08:48:00
X-KSMG-LinksScanning: Clean, bases: 2023/07/04 08:48:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/04 05:54:00 #21559896
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_065951_945243_A456CC57 
X-CRM114-Status: GOOD (  20.74  )
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
avoid any potential conflicts on lower or upper software levels. In
addition, modify the meson_uart_dt match data for g12a, a1, and s4 to
their appropriate values to ensure proper devname values and
functionality.

For more information please refer to IRC discussion at [1].

Links:
    [1]: https://libera.irclog.whitequark.org/linux-amlogic/2023-07-03

Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
---
 drivers/tty/serial/meson_uart.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index 87c0eb5f2dba..361f9326b527 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -82,6 +82,7 @@ static struct uart_driver meson_uart_driver;
 static struct uart_port *meson_ports[AML_UART_PORT_NUM];
 
 struct meson_uart_data {
+	const char *dev_name;
 	bool has_xtal_div2;
 };
 
@@ -683,6 +684,7 @@ static int meson_uart_probe_clocks(struct platform_device *pdev,
 
 static int meson_uart_probe(struct platform_device *pdev)
 {
+	const struct meson_uart_data *priv_data;
 	struct resource *res_mem;
 	struct uart_port *port;
 	u32 fifosize = 64; /* Default is 64, 128 for EE UART_0 */
@@ -729,6 +731,18 @@ static int meson_uart_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	priv_data = device_get_match_data(&pdev->dev);
+
+	if (priv_data) {
+		struct console *cons = meson_uart_driver.cons;
+
+		meson_uart_driver.dev_name = priv_data->dev_name;
+
+		if (cons)
+			strscpy(cons->name, priv_data->dev_name,
+				sizeof(cons->name));
+	}
+
 	if (!meson_uart_driver.state) {
 		ret = uart_register_driver(&meson_uart_driver);
 		if (ret)
@@ -748,7 +762,7 @@ static int meson_uart_probe(struct platform_device *pdev)
 	port->x_char = 0;
 	port->ops = &meson_uart_ops;
 	port->fifosize = fifosize;
-	port->private_data = (void *)device_get_match_data(&pdev->dev);
+	port->private_data = (void *)priv_data;
 
 	meson_ports[pdev->id] = port;
 	platform_set_drvdata(pdev, port);
@@ -780,6 +794,17 @@ static int meson_uart_remove(struct platform_device *pdev)
 }
 
 static struct meson_uart_data meson_g12a_uart_data = {
+	.dev_name = "ttyAML",
+	.has_xtal_div2 = true,
+};
+
+static struct meson_uart_data meson_a1_uart_data = {
+	.dev_name = "ttyS",
+	.has_xtal_div2 = false,
+};
+
+static struct meson_uart_data meson_s4_uart_data = {
+	.dev_name = "ttyS",
 	.has_xtal_div2 = true,
 };
 
@@ -794,7 +819,11 @@ static const struct of_device_id meson_uart_dt_match[] = {
 	},
 	{
 		.compatible = "amlogic,meson-s4-uart",
-		.data = (void *)&meson_g12a_uart_data,
+		.data = (void *)&meson_s4_uart_data,
+	},
+	{
+		.compatible = "amlogic,meson-a1-uart",
+		.data = (void *)&meson_a1_uart_data,
 	},
 	{ /* sentinel */ },
 };
-- 
2.36.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
