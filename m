Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31131C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Apr 2022 08:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uva4L0ptjmjYDVjJ5KCK0NxNwOqdzDH6DMwKFT8lBAc=; b=fDSvhBheMYs+ET
	GcqeFHPauA5zliiO8v682ibe32KTO9qa7JgrhsVey6FOKzbe1u0D6z6OJIq1tBKSsSE1Dp8px55uN
	wVG7Gym1UbsqA2Qd+38iIyAfi/vYXjMZdUZauuX1nfWhtO6UIJIb2xjlJNCGAMCLYsgH8k1gOOk1d
	UZvEZ2yrE5+3uuphuZNKYlZJ4FHT2v9+j76lYyPLkTTG/VK23iipYsng4GcapOy/sbl78kUYAde5A
	ydMyBVvp8r4LZaSO/iwLLQ7JMVlr6FW3rhMY3LxY9Gsj4seIuZhj6sG1GMCj9Kx4CYewyXIn623WE
	798Sxa48BftD15r4IXyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncNm9-00AXjt-J5; Thu, 07 Apr 2022 08:45:57 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncNIg-00AIfm-AF; Thu, 07 Apr 2022 08:15:32 +0000
Received: from droid06.amlogic.com (10.18.11.248) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Thu, 7 Apr 2022
 16:15:26 +0800
From: Yu Tu <yu.tu@amlogic.com>
To: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Neil
 Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Yu Tu <yu.tu@amlogic.com>
Subject: [PATCH 2/3] tty: serial: meson: Added 12Mhz as the clock source for
 calculating baud rate
Date: Thu, 7 Apr 2022 16:13:54 +0800
Message-ID: <20220407081355.13602-3-yu.tu@amlogic.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220407081355.13602-1-yu.tu@amlogic.com>
References: <20220407081355.13602-1-yu.tu@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.18.11.248]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_011530_429519_CE9C4B6E 
X-CRM114-Status: GOOD (  13.57  )
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

Starting with the g12A chip, add a 12Mhz clock to calculate the baud
rate, since the BT module uses 3Mhz baud rate. 8Mhz calculations can
lead to baud rate bias, causing some problems.

Signed-off-by: Yu Tu <yu.tu@amlogic.com>
---
 drivers/tty/serial/meson_uart.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index 8e59624935af..7e77693a1318 100644
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
+	struct meson_uart_data *private_data = port->private_data;
+	u32 val = 0;
 
 	while (!meson_uart_tx_empty(port))
 		cpu_relax();
 
 	if (port->uartclk == 24000000) {
-		val = DIV_ROUND_CLOSEST(port->uartclk / 3, baud) - 1;
+		unsigned int xtal_div = 3;
+
+		if (private_data->has_xtal_div2) {
+			xtal_div = 2;
+			val |= AML_UART_BAUD_XTAL_DIV2;
+		}
+		val |= DIV_ROUND_CLOSEST(port->uartclk / xtal_div, baud) - 1;
 		val |= AML_UART_BAUD_XTAL;
 	} else {
 		val =  DIV_ROUND_CLOSEST(port->uartclk / 4, baud) - 1;
@@ -691,6 +703,7 @@ static int meson_uart_probe_clocks(struct platform_device *pdev,
 
 static int meson_uart_probe(struct platform_device *pdev)
 {
+	struct meson_uart_data *private_data;
 	struct resource *res_mem;
 	struct uart_port *port;
 	u32 fifosize = 64; /* Default is 64, 128 for EE UART_0 */
@@ -733,6 +746,13 @@ static int meson_uart_probe(struct platform_device *pdev)
 	if (!port)
 		return -ENOMEM;
 
+	private_data = devm_kzalloc(&pdev->dev, sizeof(struct meson_uart_data), GFP_KERNEL);
+	if (!private_data)
+		return -ENOMEM;
+
+	if ((bool)device_get_match_data(&pdev->dev))
+		private_data->has_xtal_div2 = true;
+
 	ret = meson_uart_probe_clocks(pdev, port);
 	if (ret)
 		return ret;
@@ -749,6 +769,7 @@ static int meson_uart_probe(struct platform_device *pdev)
 	port->x_char = 0;
 	port->ops = &meson_uart_ops;
 	port->fifosize = fifosize;
+	port->private_data = private_data;
 
 	meson_ports[pdev->id] = port;
 	platform_set_drvdata(pdev, port);
-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
