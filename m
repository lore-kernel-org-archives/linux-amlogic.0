Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C05C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Dec 2021 10:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8NdyVyAHe9wp7cWUFQh9D6dR7q+I/ulCRMmbWx11B90=; b=Fxst4BU8I6yL9Z
	jcyBRPl0stnDP9is1T9oQaVkjjKeEs8jkkearyo/edd4iKzmjsFuzS+3HkyF6SJQrwBFgSpaQ3490
	UjInD7OsTfTKMvwLgD2Npb18LpvsR4EtM6MjDKeLEdjvXPoteMEl2kC+OGORKl1ogSHWm0JmiPPPW
	UdI7rXqweOaHoahK8abscv55n4PZRjFre3tPqFe4Ai+QnB7/IiDaDh+ZfCEsglQWJgRrFzNPyXefB
	C7Zmj7B3aVTbcZnQonZHpdlk3T5Of6uLnCKC4xFejIPNOoW1K+413WAR+grnh5EyDMS8TQ5SkNr6X
	Qo0JZtxn0rFJz3XKQEHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2sZR-004Bfh-HA; Thu, 30 Dec 2021 10:22:05 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2sZ5-004BXP-A6; Thu, 30 Dec 2021 10:21:44 +0000
Received: from droid06.amlogic.com (10.18.11.248) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Thu, 30 Dec 2021
 18:21:40 +0800
From: Yu Tu <yu.tu@amlogic.com>
To: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Vyacheslav
 <adeep@lexina.in>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Yu Tu <yu.tu@amlogic.com>
Subject: [PATCH V3 1/6] tty: serial: meson: Drop the legacy compatible strings
 and clock code
Date: Thu, 30 Dec 2021 18:21:05 +0800
Message-ID: <20211230102110.3861-2-yu.tu@amlogic.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211230102110.3861-1-yu.tu@amlogic.com>
References: <20211230102110.3861-1-yu.tu@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.18.11.248]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211230_022143_361373_012B460D 
X-CRM114-Status: GOOD (  12.49  )
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

All mainline .dts files have been using the stable UART since Linux
4.16. Drop the legacy compatible strings and related clock code.

Signed-off-by: Yu Tu <yu.tu@amlogic.com>
---
 drivers/tty/serial/meson_uart.c | 34 ++-------------------------------
 1 file changed, 2 insertions(+), 32 deletions(-)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index d2c08b760f83..c9a37602ffd0 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -625,10 +625,7 @@ meson_serial_early_console_setup(struct earlycon_device *device, const char *opt
 	device->con->write = meson_serial_early_console_write;
 	return 0;
 }
-/* Legacy bindings, should be removed when no more used */
-OF_EARLYCON_DECLARE(meson, "amlogic,meson-uart",
-		    meson_serial_early_console_setup);
-/* Stable bindings */
+
 OF_EARLYCON_DECLARE(meson, "amlogic,meson-ao-uart",
 		    meson_serial_early_console_setup);
 
@@ -668,25 +665,6 @@ static inline struct clk *meson_uart_probe_clock(struct device *dev,
 	return clk;
 }
 
-/*
- * This function gets clocks in the legacy non-stable DT bindings.
- * This code will be remove once all the platforms switch to the
- * new DT bindings.
- */
-static int meson_uart_probe_clocks_legacy(struct platform_device *pdev,
-					  struct uart_port *port)
-{
-	struct clk *clk = NULL;
-
-	clk = meson_uart_probe_clock(&pdev->dev, NULL);
-	if (IS_ERR(clk))
-		return PTR_ERR(clk);
-
-	port->uartclk = clk_get_rate(clk);
-
-	return 0;
-}
-
 static int meson_uart_probe_clocks(struct platform_device *pdev,
 				   struct uart_port *port)
 {
@@ -750,12 +728,7 @@ static int meson_uart_probe(struct platform_device *pdev)
 	if (!port)
 		return -ENOMEM;
 
-	/* Use legacy way until all platforms switch to new bindings */
-	if (of_device_is_compatible(pdev->dev.of_node, "amlogic,meson-uart"))
-		ret = meson_uart_probe_clocks_legacy(pdev, port);
-	else
-		ret = meson_uart_probe_clocks(pdev, port);
-
+	ret = meson_uart_probe_clocks(pdev, port);
 	if (ret)
 		return ret;
 
@@ -800,9 +773,6 @@ static int meson_uart_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id meson_uart_dt_match[] = {
-	/* Legacy bindings, should be removed when no more used */
-	{ .compatible = "amlogic,meson-uart" },
-	/* Stable bindings */
 	{ .compatible = "amlogic,meson6-uart" },
 	{ .compatible = "amlogic,meson8-uart" },
 	{ .compatible = "amlogic,meson8b-uart" },
-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
