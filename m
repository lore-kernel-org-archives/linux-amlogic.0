Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B77C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jan 2022 09:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xEbQq2pUF1odYrqvYghjL5qYXSTXXvHqXtiU+Lc1w/w=; b=hPYAmYwIlbur5c
	8RU2J53w0qKgiJZthsIhpapF3tDkqpcfxTKtyhHBIQtcDzGBid1ZbrZrM1Erieg5p/afIAmcmSNWR
	j1hSk1tsRsMs164c0Z+rVKCGtSS4pqVwcJ4aYC+762+dZC8JfYpeSM7UsvwBW0Lva+PWhDlQpao7v
	yVu5Y98vlk7+7i0RRJbGd3mdm7UZaqJv+YAWvI+Q1FjrD0J8Pw2QZDADitRvugSTykid6M4ED91YG
	xQLZ9t7FzqwnfHbvWGjBIuNJdWIqheoBig2wnYdn4C4N9YvBCLolPPT5+yYhJW9d0tFiAtDC/H05a
	S0SYHle1SRzRhvB5RfQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6qoT-00AHBN-4W; Mon, 10 Jan 2022 09:18:01 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6qU3-00A64q-Dc; Mon, 10 Jan 2022 08:56:56 +0000
Received: from droid06.amlogic.com (10.18.11.248) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Mon, 10 Jan 2022
 16:56:53 +0800
From: Yu Tu <yu.tu@amlogic.com>
To: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Neil Armstrong
 <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Yu Tu <yu.tu@amlogic.com>
Subject: [PATCH V4 2/5] tty: serial: meson: Request the register
Date: Mon, 10 Jan 2022 16:56:01 +0800
Message-ID: <20220110085604.18042-3-yu.tu@amlogic.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110085604.18042-1-yu.tu@amlogic.com>
References: <20220110085604.18042-1-yu.tu@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.18.11.248]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_005655_504885_0CE861E8 
X-CRM114-Status: GOOD (  10.95  )
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

This simplifies resetting the UART controller during probe and
will make it easier to integrate the common clock code which
will require the registers at probe time as well.

Signed-off-by: Yu Tu <yu.tu@amlogic.com>
---
 drivers/tty/serial/meson_uart.c | 24 ++++++------------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index 45e00d928253..7570958d010c 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -395,24 +395,11 @@ static int meson_uart_verify_port(struct uart_port *port,
 
 static void meson_uart_release_port(struct uart_port *port)
 {
-	devm_iounmap(port->dev, port->membase);
-	port->membase = NULL;
-	devm_release_mem_region(port->dev, port->mapbase, port->mapsize);
+	/* nothing to do */
 }
 
 static int meson_uart_request_port(struct uart_port *port)
 {
-	if (!devm_request_mem_region(port->dev, port->mapbase, port->mapsize,
-				     dev_name(port->dev))) {
-		dev_err(port->dev, "Memory region busy\n");
-		return -EBUSY;
-	}
-
-	port->membase = devm_ioremap(port->dev, port->mapbase,
-					     port->mapsize);
-	if (!port->membase)
-		return -ENOMEM;
-
 	return 0;
 }
 
@@ -733,6 +720,10 @@ static int meson_uart_probe(struct platform_device *pdev)
 	if (!port)
 		return -ENOMEM;
 
+	port->membase = devm_ioremap_resource(&pdev->dev, res_mem);
+	if (IS_ERR(port->membase))
+		return PTR_ERR(port->membase);
+
 	ret = meson_uart_probe_clocks(pdev, port);
 	if (ret)
 		return ret;
@@ -754,10 +745,7 @@ static int meson_uart_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, port);
 
 	/* reset port before registering (and possibly registering console) */
-	if (meson_uart_request_port(port) >= 0) {
-		meson_uart_reset(port);
-		meson_uart_release_port(port);
-	}
+	meson_uart_reset(port);
 
 	ret = uart_add_one_port(&meson_uart_driver, port);
 	if (ret)
-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
