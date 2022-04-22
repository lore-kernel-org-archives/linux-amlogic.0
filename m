Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C679C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 Apr 2022 11:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UCHpJvtQVE/PtBFsXEqH5koONeZE92rUROVe16EV2Jo=; b=oERmPnhsTsmSlB
	YxGWKDwFw7n5Cdv82eVMBNXsaCO5VZCvZqG6rpzT0/6IXSRl1/KzooYu7u1wG1a3pXypARsOiTIjX
	IBuRDXPS01Nr8hOEYMyZh0fnQ1AIzLD8qiW4IVxw6mcrq2xdRCwW++eL9n5hvDTtcs8qKuhHpMg4X
	HgoAwf4OCbYX/s8obPDla/j68JpmwRzU92Q0i0G5T4rBCtF5fC/jk33ePbdk5Or+BEezr57MZGLd8
	GyyoEnq2yOaXvNhR2NGocQmkEtbvA/Xz/c97/etvVkr2tZuPdYfPL+KWPJ5f531y+3ufDWUiX1UV7
	onj31wy3CLUAqNwE14Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhrFb-0009qJ-N8; Fri, 22 Apr 2022 11:14:59 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhrFJ-0009kY-4S; Fri, 22 Apr 2022 11:14:42 +0000
Received: from droid06.amlogic.com (10.18.11.248) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Fri, 22 Apr 2022
 19:14:39 +0800
From: Yu Tu <yu.tu@amlogic.com>
To: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Neil Armstrong
 <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>
CC: Jiri Slaby <jirislaby@kernel.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Yu Tu <yu.tu@amlogic.com>
Subject: [PATCH V3 1/2] tty: serial: meson: Add a 12MHz internal clock rate to
 calculate baud rate in order to meet the baud rate requirements of special BT
 modules
Date: Fri, 22 Apr 2022 19:13:19 +0800
Message-ID: <20220422111320.19234-2-yu.tu@amlogic.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220422111320.19234-1-yu.tu@amlogic.com>
References: <20220422111320.19234-1-yu.tu@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.18.11.248]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_041441_191385_C9813170 
X-CRM114-Status: GOOD (  11.51  )
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

A /2 divider over XTAL was introduced since G12A, and is preferred
to be used over the still present /3 divider since it provides much
closer frequencies vs the request baudrate. Especially the BT module
uses 3Mhz baud rate. 8Mhz calculations can lead to baud rate bias,
causing some problems.

Signed-off-by: Yu Tu <yu.tu@amlogic.com>
---
 drivers/tty/serial/meson_uart.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index 8e59624935af..58bd2723c004 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -68,6 +68,7 @@
 #define AML_UART_BAUD_MASK		0x7fffff
 #define AML_UART_BAUD_USE		BIT(23)
 #define AML_UART_BAUD_XTAL		BIT(24)
+#define AML_UART_BAUD_XTAL_DIV2		BIT(27)
 
 #define AML_UART_PORT_NUM		12
 #define AML_UART_PORT_OFFSET		6
@@ -80,6 +81,10 @@ static struct uart_driver meson_uart_driver;
 
 static struct uart_port *meson_ports[AML_UART_PORT_NUM];
 
+struct meson_uart_data {
+	bool has_xtal_div2;
+};
+
 static void meson_uart_set_mctrl(struct uart_port *port, unsigned int mctrl)
 {
 }
@@ -293,13 +298,20 @@ static int meson_uart_startup(struct uart_port *port)
 
 static void meson_uart_change_speed(struct uart_port *port, unsigned long baud)
 {
-	u32 val;
+	const struct meson_uart_data *private_data = port->private_data;
+	u32 val = 0;
 
 	while (!meson_uart_tx_empty(port))
 		cpu_relax();
 
 	if (port->uartclk == 24000000) {
-		val = DIV_ROUND_CLOSEST(port->uartclk / 3, baud) - 1;
+		unsigned int xtal_div = 3;
+
+		if (private_data && private_data->has_xtal_div2) {
+			xtal_div = 2;
+			val |= AML_UART_BAUD_XTAL_DIV2;
+		}
+		val |= DIV_ROUND_CLOSEST(port->uartclk / xtal_div, baud) - 1;
 		val |= AML_UART_BAUD_XTAL;
 	} else {
 		val =  DIV_ROUND_CLOSEST(port->uartclk / 4, baud) - 1;
@@ -749,6 +761,7 @@ static int meson_uart_probe(struct platform_device *pdev)
 	port->x_char = 0;
 	port->ops = &meson_uart_ops;
 	port->fifosize = fifosize;
+	port->private_data = (void *)device_get_match_data(&pdev->dev);
 
 	meson_ports[pdev->id] = port;
 	platform_set_drvdata(pdev, port);
-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
