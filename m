Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89898C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Feb 2022 07:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y+OxTz1Duj4hlVbQQSWfkMdVdpobiRG2K/j5FvOOXYY=; b=TtPgwkoqZ9G7d8
	LdNHY57jh0iQj/McQmp5Xrp364R8Z/tFu/D0wLpg5fCT5e8FqC71Kzrn4lW2bum6jhxCW/wBlfqZA
	vjcLUtKXxxCXbSurrUuI5/qF0ct8wjHCDWItpRoyQDSZ/CVdfI/9JoFwy6kvA97KKuuJborW6s6T8
	1NiLbovuRDx3F1y5lbu2yFjKHxhT+ysFMxYAMgv0r240rJCM3Luo4Hbgc0/F2eTOPXsISiIFhXID+
	owq0uOL05YPL9KRqoZrnJNcSm+bqnfIy0bV5rhZo/rmTFNDK5b5Xl8hyk7TltJn2KfyeWkCgiyY9+
	7tBafSZrIRJxq97wupUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNVFu-003evf-Ek; Fri, 25 Feb 2022 07:43:10 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNVDw-003dvO-Vu; Fri, 25 Feb 2022 07:41:10 +0000
Received: from droid06.amlogic.com (10.18.11.248) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Fri, 25 Feb 2022
 15:41:05 +0800
From: Yu Tu <yu.tu@amlogic.com>
To: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Yu Tu <yu.tu@amlogic.com>
Subject: [PATCH V7 5/6] tty: serial: meson: The system stuck when you run the
 stty command on the console to change the baud rate
Date: Fri, 25 Feb 2022 15:39:21 +0800
Message-ID: <20220225073922.3947-6-yu.tu@amlogic.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220225073922.3947-1-yu.tu@amlogic.com>
References: <20220225073922.3947-1-yu.tu@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.18.11.248]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_234109_074107_47803DA1 
X-CRM114-Status: UNSURE (   7.87  )
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

Start the console and run the following commands in turn:
stty -F /dev/ttyAML0 115200 and stty -F /dev/ttyAML0 921600. The
system will stuck.

Signed-off-by: Yu Tu <yu.tu@amlogic.com>
---
 drivers/tty/serial/meson_uart.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index ba8dc203b9cb..d19349ead738 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -365,8 +365,13 @@ static void meson_uart_set_termios(struct uart_port *port,
 	writel(val, port->membase + AML_UART_CONTROL);
 
 	baud = uart_get_baud_rate(port, termios, old, 50, 4000000);
+
+	spin_unlock_irqrestore(&port->lock, flags);
+
 	meson_uart_change_speed(port, baud);
 
+	spin_lock_irqsave(&port->lock, flags);
+
 	port->read_status_mask = AML_UART_TX_FIFO_WERR;
 	if (iflags & INPCK)
 		port->read_status_mask |= AML_UART_PARITY_ERR |
-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
