Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE88C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Dec 2021 10:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iVgDWK62WZeG2rOjeMNDOz9DQYyiJE+PVAEG98o7qhE=; b=Ju84VHLoH0vUvr
	nISnngUPIX5gAOuejV2hWWRZxeRqW7yXayBEHw2hm3slIq+HlrUTc4sjkXcSRCu3xLKEuFqxAp170
	lu3bwp65lUQiC3vqC2tBOIGbcEpQ/NSu5he96mOMT4Xd+ttojpfAG+GPeQsCOp33BOTMTwDuJLzN3
	IudU+/lVERPiNzf1UMnueJvCOS6p/9qfgySNh11TLDCu98CpaNfOaXAxCWmodlpzXekn63c28Q0Zg
	7P8i14tlasYp35mKTtcV17UEBUt+TEju8Y1AkcmbaLFk5BvExDCBbM/hw/liydwcGVobfAoK4QcxT
	E/1t990M/h/UmjPlosRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muApS-003Fk3-MU; Mon, 06 Dec 2021 10:02:38 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muAp1-003FYR-94; Mon, 06 Dec 2021 10:02:12 +0000
Received: from droid04.amlogic.com (10.18.11.246) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Mon, 6 Dec 2021
 18:02:03 +0800
From: xianwei.zhao <xianwei.zhao@amlogic.com>
To: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, xianwei.zhao
 <xianwei.zhao@amlogic.com>
Subject: [PATCH] serial: meson: make the current driver compatible with S4
Date: Mon, 6 Dec 2021 18:02:00 +0800
Message-ID: <20211206100200.31914-1-xianwei.zhao@amlogic.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Originating-IP: [10.18.11.246]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_020211_396346_722E1926 
X-CRM114-Status: GOOD (  14.08  )
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

Because S4 UART use a different clock source, the baud rate calculation need to be updated.
Reset the UART during initialization to clear previous status.

Signed-off-by: xianwei.zhao <xianwei.zhao@amlogic.com>
---
 drivers/tty/serial/meson_uart.c | 50 +++++++++++++++++++++++++++------
 1 file changed, 42 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index efee3935917f..15a992ee6a28 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -65,9 +65,11 @@
 #define AML_UART_RECV_IRQ(c)		((c) & 0xff)
 
 /* AML_UART_REG5 bits */
-#define AML_UART_BAUD_MASK		0x7fffff
+#define AML_UART_BAUD_MASK		GENMASK(22, 0)
 #define AML_UART_BAUD_USE		BIT(23)
 #define AML_UART_BAUD_XTAL		BIT(24)
+#define AML_UART_BAUD_XTAL_TICK		BIT(26)
+#define AML_UART_BAUD_XTAL_DIV2		BIT(27)
 
 #define AML_UART_PORT_NUM		12
 #define AML_UART_PORT_OFFSET		6
@@ -80,6 +82,14 @@ static struct uart_driver meson_uart_driver;
 
 static struct uart_port *meson_ports[AML_UART_PORT_NUM];
 
+/*
+ * struct aml_uart - device data
+ * @xtal_tick_en: A clock source that calculates baud rates
+ */
+struct aml_uart {
+	unsigned int xtal_tick_en;
+};
+
 static void meson_uart_set_mctrl(struct uart_port *port, unsigned int mctrl)
 {
 }
@@ -103,7 +113,7 @@ static void meson_uart_stop_tx(struct uart_port *port)
 	u32 val;
 
 	val = readl(port->membase + AML_UART_CONTROL);
-	val &= ~AML_UART_TX_INT_EN;
+	val &= ~AML_UART_TX_EN;
 	writel(val, port->membase + AML_UART_CONTROL);
 }
 
@@ -121,12 +131,12 @@ static void meson_uart_shutdown(struct uart_port *port)
 	unsigned long flags;
 	u32 val;
 
-	free_irq(port->irq, port);
+	devm_free_irq(port->dev, port->irq, port);
 
 	spin_lock_irqsave(&port->lock, flags);
 
 	val = readl(port->membase + AML_UART_CONTROL);
-	val &= ~AML_UART_RX_EN;
+	val &= ~(AML_UART_RX_EN | AML_UART_TX_EN);
 	val &= ~(AML_UART_RX_INT_EN | AML_UART_TX_INT_EN);
 	writel(val, port->membase + AML_UART_CONTROL);
 
@@ -270,6 +280,7 @@ static int meson_uart_startup(struct uart_port *port)
 	u32 val;
 	int ret = 0;
 
+	meson_uart_reset(port);
 	val = readl(port->membase + AML_UART_CONTROL);
 	val |= AML_UART_CLEAR_ERR;
 	writel(val, port->membase + AML_UART_CONTROL);
@@ -285,24 +296,37 @@ static int meson_uart_startup(struct uart_port *port)
 	val = (AML_UART_RECV_IRQ(1) | AML_UART_XMIT_IRQ(port->fifosize / 2));
 	writel(val, port->membase + AML_UART_MISC);
 
-	ret = request_irq(port->irq, meson_uart_interrupt, 0,
-			  port->name, port);
+	ret = devm_request_irq(port->dev, port->irq, meson_uart_interrupt,
+			       IRQF_SHARED, port->name, port);
 
 	return ret;
 }
 
 static void meson_uart_change_speed(struct uart_port *port, unsigned long baud)
 {
+	struct aml_uart *aml_uart_data = port->private_data;
 	u32 val;
 
 	while (!meson_uart_tx_empty(port))
 		cpu_relax();
 
+	val = readl_relaxed(port->membase + AML_UART_REG5);
+	val &= ~AML_UART_BAUD_MASK;
+
 	if (port->uartclk == 24000000) {
-		val = ((port->uartclk / 3) / baud) - 1;
-		val |= AML_UART_BAUD_XTAL;
+		if (aml_uart_data->xtal_tick_en) {
+			val = (port->uartclk / 2 + baud / 2) / baud  - 1;
+			val |= (AML_UART_BAUD_XTAL | AML_UART_BAUD_XTAL_DIV2);
+		} else {
+			val = ((port->uartclk / 3) + baud / 2) / baud  - 1;
+			val &= (~(AML_UART_BAUD_XTAL_TICK |
+				AML_UART_BAUD_XTAL_DIV2));
+			val |= AML_UART_BAUD_XTAL;
+		}
 	} else {
 		val = ((port->uartclk * 10 / (baud * 4) + 5) / 10) - 1;
+		val &= (~(AML_UART_BAUD_XTAL | AML_UART_BAUD_XTAL_TICK |
+			AML_UART_BAUD_XTAL_DIV2));
 	}
 	val |= AML_UART_BAUD_USE;
 	writel(val, port->membase + AML_UART_REG5);
@@ -715,6 +739,7 @@ static int meson_uart_probe(struct platform_device *pdev)
 {
 	struct resource *res_mem, *res_irq;
 	struct uart_port *port;
+	struct aml_uart *aml_uart_data;
 	u32 fifosize = 64; /* Default is 64, 128 for EE UART_0 */
 	int ret = 0;
 
@@ -754,6 +779,14 @@ static int meson_uart_probe(struct platform_device *pdev)
 	if (!port)
 		return -ENOMEM;
 
+	aml_uart_data = devm_kzalloc(&pdev->dev, sizeof(struct aml_uart),
+				     GFP_KERNEL);
+	if (!aml_uart_data)
+		return -ENOMEM;
+
+	of_property_read_u32(pdev->dev.of_node, "xtal_tick_en",
+			     &aml_uart_data->xtal_tick_en);
+
 	/* Use legacy way until all platforms switch to new bindings */
 	if (of_device_is_compatible(pdev->dev.of_node, "amlogic,meson-uart"))
 		ret = meson_uart_probe_clocks_legacy(pdev, port);
@@ -775,6 +808,7 @@ static int meson_uart_probe(struct platform_device *pdev)
 	port->x_char = 0;
 	port->ops = &meson_uart_ops;
 	port->fifosize = fifosize;
+	port->private_data = aml_uart_data;
 
 	meson_ports[pdev->id] = port;
 	platform_set_drvdata(pdev, port);

base-commit: 3f19fed8d0daed6e0e04b130d203d4333b757901
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
