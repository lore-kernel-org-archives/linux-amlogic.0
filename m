Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E35C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Dec 2021 10:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IvhXowHxEEd+tVtCQgmqxs9GFkToIKwHejDB52rxdGo=; b=lt1L7Oz1uiPDx+
	4w3ruMFR3kP8DyuvD1g7DGP5Mwenk5PNg82Tj1JtCkDhPcPDIH/fyajBZjCWAsjXg41DUx59lnJgm
	SwzODWuro+PivIBuYV+9Oy4RgZIGerh0mUK2NlrIxAdtLI11vkbumT0CdDESrITNZUBDw4Es6sQ+m
	Vz8KofdU7Vrx/jwqy3FZNAYmN3G9dQPvs0yRfQ6G0vnO3axfWhrLV2B5MziGv5pWj8O8R4wnYvW6d
	htDlZxe+OAthwsmhibmAcEI6o2zJAvUy1yM5oh2MVY1MujB4qjsXkdN/L5K+bt8XKrerz7xN7wX1d
	k4YOI/RdzkORmYVk224w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2sb1-004Ce7-Dj; Thu, 30 Dec 2021 10:23:43 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2saN-004C9L-Dp; Thu, 30 Dec 2021 10:23:04 +0000
Received: from droid06.amlogic.com (10.18.11.248) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Thu, 30 Dec 2021
 18:22:56 +0800
From: Yu Tu <yu.tu@amlogic.com>
To: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Vyacheslav
 <adeep@lexina.in>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Yu Tu <yu.tu@amlogic.com>
Subject: [PATCH V3 6/6] tty: serial: meson: Change request_irq to
 devm_request_irq and move devm_request_irq to meson_uart_probe()
Date: Thu, 30 Dec 2021 18:21:10 +0800
Message-ID: <20211230102110.3861-7-yu.tu@amlogic.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211230102110.3861-1-yu.tu@amlogic.com>
References: <20211230102110.3861-1-yu.tu@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.18.11.248]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211230_022303_518917_E947554D 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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

Because an interrupt error occurs when the user opens /dev/ttyAML* but
don't close it, and then opens the same port again. This problem is
encountered in actual projects.

Signed-off-by: Yu Tu <yu.tu@amlogic.com>
---
 drivers/tty/serial/meson_uart.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index 45e41f20cba3..0dd3f5b35768 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -135,8 +135,6 @@ static void meson_uart_shutdown(struct uart_port *port)
 	unsigned long flags;
 	u32 val;
 
-	free_irq(port->irq, port);
-
 	spin_lock_irqsave(&port->lock, flags);
 
 	val = readl(port->membase + AML_UART_CONTROL);
@@ -284,7 +282,6 @@ static void meson_uart_reset(struct uart_port *port)
 static int meson_uart_startup(struct uart_port *port)
 {
 	u32 val;
-	int ret;
 
 	meson_uart_reset(port);
 
@@ -298,10 +295,7 @@ static int meson_uart_startup(struct uart_port *port)
 	val = (AML_UART_RECV_IRQ(1) | AML_UART_XMIT_IRQ(port->fifosize / 2));
 	writel(val, port->membase + AML_UART_MISC);
 
-	ret = request_irq(port->irq, meson_uart_interrupt, 0,
-			  port->name, port);
-
-	return ret;
+	return 0;
 }
 
 static void meson_uart_change_speed(struct uart_port *port, unsigned long baud)
@@ -908,6 +902,14 @@ static int meson_uart_probe(struct platform_device *pdev)
 	meson_ports[pdev->id] = port;
 	platform_set_drvdata(pdev, port);
 
+	ret = devm_request_irq(&pdev->dev, port->irq, meson_uart_interrupt,
+			       0, dev_name(&pdev->dev), port);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to request uart irq: %d\n",
+			ret);
+		return ret;
+	}
+
 	/* reset port before registering (and possibly registering console) */
 	meson_uart_reset(port);
 
-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
