Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E648C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jan 2022 08:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KKH8tTjPzwcZj+WXYPWaou0RvMyLmsBc20mAyyP0WRg=; b=wzXQCMJYIoZAjz
	KLtKbafycfq6wF6kfzP9rfaTVTGXF58oPWn9lryueCIm2gM0sh1l6jCMeIGvSw3HLdkoC0N7FgGMG
	w6QTCp5KlC9nTeemIoUr6k44nXhOyn/ZxsrL3Jmj9Hl4YnIj+5loMnZ46uo8DvCuxnl1A7eRvevVj
	Z6X6qnMhtNgj7SzKcYx7uiI4pkEuGCeVmZWFlp5NAV1IQ7s2H9ZOCf/01siLyEIF5A0p0l+wFcxs6
	nPhC10o4me490Zh7Y7aXYcie0F52CYNBLHc1a7+uQpRq3JVp3VP/HIZkZkUwA3dDHzU2EJy8Vs6PI
	AGWwnqOiQm1K4rejfKbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6q28-009r6C-8q; Mon, 10 Jan 2022 08:28:04 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6q18-009qSs-VE; Mon, 10 Jan 2022 08:27:04 +0000
Received: from droid06.amlogic.com (10.18.11.248) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Mon, 10 Jan 2022
 16:26:48 +0800
From: Yu Tu <yu.tu@amlogic.com>
To: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Neil Armstrong
 <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Yu Tu <yu.tu@amlogic.com>
Subject: [PATCH] tty: serial: meson: Request the register region in
 meson_uart_probe()
Date: Mon, 10 Jan 2022 16:26:13 +0800
Message-ID: <20220110082616.13474-5-yu.tu@amlogic.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110082616.13474-1-yu.tu@amlogic.com>
References: <20220110082616.13474-1-yu.tu@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.18.11.248]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_002703_033351_F54C1FF0 
X-CRM114-Status: GOOD (  10.99  )
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

This simplifies resetting the UART controller during probe and will make
it easier to integrate the common clock code which will require the
registers at probe time as well.

Signed-off-by: Yu Tu <yu.tu@amlogic.com>
---
 drivers/tty/serial/meson_uart.c | 24 ++++++------------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index c9a37602ffd0..99efe62a1507 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -397,24 +397,11 @@ static int meson_uart_verify_port(struct uart_port *port,
 
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
 
@@ -728,6 +715,10 @@ static int meson_uart_probe(struct platform_device *pdev)
 	if (!port)
 		return -ENOMEM;
 
+	port->membase = devm_ioremap_resource(&pdev->dev, res_mem);
+	if (IS_ERR(port->membase))
+		return PTR_ERR(port->membase);
+
 	ret = meson_uart_probe_clocks(pdev, port);
 	if (ret)
 		return ret;
@@ -749,10 +740,7 @@ static int meson_uart_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, port);
 
 	/* reset port before registering (and possibly registering console) */
-	if (meson_uart_request_port(port) >= 0) {
-		meson_uart_reset(port);
-		meson_uart_release_port(port);
-	}
+	meson_uart_reset(port);
 
 	ret = uart_add_one_port(&meson_uart_driver, port);
 	if (ret)

base-commit: b3a9e3b9622ae10064826dccb4f7a52bd88c7407
prerequisite-patch-id: 97a514f3447511cb204179ce03ae99dc1d5902d9
-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
