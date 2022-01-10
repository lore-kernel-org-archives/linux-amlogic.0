Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8939CC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jan 2022 10:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ie21rw+F1MAAvRYK9gOgZ3zpUjGnOFhOjHEPR3SsV8o=; b=i7NBuMN4hKC4pj
	Qtv7E6fcf9k+8sQrkHRrPIWYGFbZf4TrgTJx1pt6RjW+MLdCagA5/7Tnxdb7KfXbqRSgiImUStFwf
	TFdeNrd7b386sqr6xRu/3e0ZBdCF6XHERlOLHNv61poxSGrzZJfFDyMzFRq3LuXlxpt2e4FVSH2GX
	1txJ96WV2yi0HqN/2B21vOMFma/8/1ePSmQcBjx9ASylsN+Wi/uCCAHhtzXxeWTFAvXlPVN7UAmIG
	e3xZUJQ2C5uPCCOy+eHvNLdcXsGFe6SskIzfIm2C5HFYKvt9jCmN2hq6i22zq43i43BMOzZhWA1mB
	N8CpHEdm2gyimiUikwkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6s9p-00AsEa-7K; Mon, 10 Jan 2022 10:44:09 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6s8c-00ArSR-Ql; Mon, 10 Jan 2022 10:42:56 +0000
Received: from droid06.amlogic.com (10.18.11.248) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Mon, 10 Jan 2022
 18:42:51 +0800
From: Yu Tu <yu.tu@amlogic.com>
To: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Neil Armstrong
 <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Yu Tu <yu.tu@amlogic.com>
Subject: [PATCH V5 4/5] tty: serial: meson: Make some bit of the REG5 register
 writable.
Date: Mon, 10 Jan 2022 18:42:13 +0800
Message-ID: <20220110104214.25321-5-yu.tu@amlogic.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110104214.25321-1-yu.tu@amlogic.com>
References: <20220110104214.25321-1-yu.tu@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.18.11.248]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_024254_902991_C36BA4BE 
X-CRM114-Status: UNSURE (   9.07  )
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

The UART_REG5 register defaults to 0. The console port is set in
ROMCODE. But other UART ports default to 0, so make bit24 and
bit[26,27] writable so that the UART can choose a more
appropriate clock.

Signed-off-by: Yu Tu <yu.tu@amlogic.com>
---
 drivers/tty/serial/meson_uart.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index 1004fd0b0c9e..fd128878e91a 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -693,7 +693,7 @@ static int meson_uart_probe_clocks(struct uart_port *port)
 							CLK_SET_RATE_NO_REPARENT,
 							port->membase + AML_UART_REG5,
 							26, 2,
-							CLK_DIVIDER_READ_ONLY,
+							CLK_DIVIDER_ROUND_CLOSEST,
 							xtal_div_table, NULL);
 		if (IS_ERR(hw))
 			return PTR_ERR(hw);
@@ -719,7 +719,7 @@ static int meson_uart_probe_clocks(struct uart_port *port)
 					CLK_SET_RATE_PARENT,
 					port->membase + AML_UART_REG5,
 					24, 0x1,
-					CLK_MUX_READ_ONLY,
+					CLK_MUX_ROUND_CLOSEST,
 					NULL, NULL);
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
