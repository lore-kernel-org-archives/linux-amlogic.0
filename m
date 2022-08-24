Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE447C00140
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Aug 2022 08:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/cEqBXdeLS8l+pHBjyH7sdd6xQzu/QL86cb65g1N5EM=; b=CNiknFfXNvlGI+
	bF2xNo5YTDGMFkHKW/8Sau8jTpeM3lEQrQMe7Sb0xhdIlpT2L2IYXltSOyAXX667wb11t4XDHKwgz
	0qBLMyaW+TuMrZpBeroP0kNeQJe3renB75czn6DNf4rCjPfp2FAdT1HgdNNFKxuzxMOANYM9hXHIu
	PImI+rsPl4ZszbJt4b2rO7xv2R5k0KpO21oIl3si/hxW3uCZL8/QmhZL9Dq9CQhqmXo2TBV629GN8
	bBMyrULGThC0+Clt2UJN3AtJVOLo4cdHMo9/2i4089X+K+3x6Lt7tgHE/wPIS3ihXVJKb4oqyEvM4
	qeoRzkfdPEF+oKJ6DbqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQlPP-00BNLs-9T; Wed, 24 Aug 2022 08:06:43 +0000
Received: from smtp05.smtpout.orange.fr ([80.12.242.127] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQlPL-00BNGO-Qc
	for linux-amlogic@lists.infradead.org; Wed, 24 Aug 2022 08:06:42 +0000
Received: from pop-os.home ([90.11.190.129])
	by smtp.orange.fr with ESMTPA
	id QlP5oD4V0XaejQlP5oyl50; Wed, 24 Aug 2022 10:06:26 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 24 Aug 2022 10:06:26 +0200
X-ME-IP: 90.11.190.129
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH] tty: serial: meson: Use devm_clk_get_enabled() helper
Date: Wed, 24 Aug 2022 10:06:21 +0200
Message-Id: <3f18638cb3cf08ed8817addca1402ed5e3bd3602.1661328361.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_010640_028550_EB3B1EEA 
X-CRM114-Status: GOOD (  13.68  )
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

The devm_clk_get_enabled() helper:
   - calls devm_clk_get()
   - calls clk_prepare_enable() and registers what is needed in order to
     call clk_disable_unprepare() when needed, as a managed resource.

This simplifies the code, the error handling paths and avoid the need of
a dedicated function used with devm_add_action_or_reset().

That said, meson_uart_probe_clock() is now more or less the same as
devm_clk_get_enabled(), so use this function directly instead.

This also fixes an (unlikely) unchecked devm_add_action_or_reset() error.

Based on my test with allyesconfig, this reduces the .o size from:
   text	   data	    bss	    dec	    hex	filename
   16350	   5016	    128	  21494	   53f6	drivers/tty/serial/meson_uart.o
down to:
   15415	   4784	    128	  20327	   4f67	drivers/tty/serial/meson_uart.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
devm_clk_get_enabled() is new and is part of 6.0-rc1

If the message "couldn't enable clk\n" is of any use, it could be added
in meson_uart_probe_clocks() with a dev_err_probe() call. It wouldn't be
exactly the same meaning, but at least something would be logged.
---
 drivers/tty/serial/meson_uart.c | 29 +++--------------------------
 1 file changed, 3 insertions(+), 26 deletions(-)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index 6c8db19fd572..26de08bf181e 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -667,29 +667,6 @@ static struct uart_driver meson_uart_driver = {
 	.cons		= MESON_SERIAL_CONSOLE,
 };
 
-static inline struct clk *meson_uart_probe_clock(struct device *dev,
-						 const char *id)
-{
-	struct clk *clk = NULL;
-	int ret;
-
-	clk = devm_clk_get(dev, id);
-	if (IS_ERR(clk))
-		return clk;
-
-	ret = clk_prepare_enable(clk);
-	if (ret) {
-		dev_err(dev, "couldn't enable clk\n");
-		return ERR_PTR(ret);
-	}
-
-	devm_add_action_or_reset(dev,
-			(void(*)(void *))clk_disable_unprepare,
-			clk);
-
-	return clk;
-}
-
 static int meson_uart_probe_clocks(struct platform_device *pdev,
 				   struct uart_port *port)
 {
@@ -697,15 +674,15 @@ static int meson_uart_probe_clocks(struct platform_device *pdev,
 	struct clk *clk_pclk = NULL;
 	struct clk *clk_baud = NULL;
 
-	clk_pclk = meson_uart_probe_clock(&pdev->dev, "pclk");
+	clk_pclk = devm_clk_get_enabled(&pdev->dev, "pclk");
 	if (IS_ERR(clk_pclk))
 		return PTR_ERR(clk_pclk);
 
-	clk_xtal = meson_uart_probe_clock(&pdev->dev, "xtal");
+	clk_xtal = devm_clk_get_enabled(&pdev->dev, "xtal");
 	if (IS_ERR(clk_xtal))
 		return PTR_ERR(clk_xtal);
 
-	clk_baud = meson_uart_probe_clock(&pdev->dev, "baud");
+	clk_baud = devm_clk_get_enabled(&pdev->dev, "baud");
 	if (IS_ERR(clk_baud))
 		return PTR_ERR(clk_baud);
 
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
