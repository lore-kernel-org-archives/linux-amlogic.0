Return-Path: <SRS0=EwLr=QI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07B77C282DA
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Feb 2019 10:00:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB7DA21872
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Feb 2019 09:59:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rZbP9Lov";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="WFxTxX2h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB7DA21872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Iel4cbeD0heiH3sMguI+E5fHEJzSfA+iQYXlKV2oRis=; b=rZb
	P9LovakaZTaeLDeS7QF4hndk400a/w0ilSChON8Nuu2UzF5U98VUuaO/5HXUwYU/fVRE5fjyUY1E7
	/+0qVUyrRPZtkdS0kHD5AG23JYjhV+izSKUgld2H+MoJMO20Y0tB0gb3RLcs0E95TOx/B6n9DxUox
	RjX6Kasiq++0O74O7ZqG6jqY/MzwK1h59jnNrYKxLw2JLCiKd0hzPbmxgdAy3U7DMZNtS4mhlCL4k
	mcnfU2JU/pjxvB6U3EpO2IE9uXPGkDwjL162NmTHx8Q5D0TE8IcsqLARViGM7M2qh0BeK2y9Wmnzp
	KNhQ+yKfHYoJ9dMS7vuFWTGr1PWKtjQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gpVc1-0005uz-1H; Fri, 01 Feb 2019 09:59:53 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpVbw-0005u0-PQ
 for linux-amlogic@lists.infradead.org; Fri, 01 Feb 2019 09:59:50 +0000
Received: by mail-wm1-x343.google.com with SMTP id m1so5429216wml.2
 for <linux-amlogic@lists.infradead.org>; Fri, 01 Feb 2019 01:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=FiRsK6Rkv+MGMGuc5WsI9lDR8qk6mP1jDsr/R3+Ts38=;
 b=WFxTxX2htHocA7ziAHT44X9GHyroRFZDjWeGl1wJQP5WgZTAdioUYL7AwLlxRa+9oi
 AXnG5d/9Ow3QsJ8GuJY9qOKf+TmSSaJ0R9sfV4DP7GGMJRm7qShUFKai2LHQ5YSxrQuM
 CsBE1upw4E+gsy0xlCjinyoGDI5qjRqtztdCg8WdbIvUg74jgu0jiQeOP0N3dtxEc2VU
 CQbYzv6c4KMLK4X3cpmMDs2je/nlYTURMtGg9hVt8F8CX4J/YAbVr69VFk+gwYG9etE0
 ze9YmdPz43NLDBeEdn59w+RspCFrmgiVVItaF9nUEJn85ndX5hKDu50u/gQUbYYMc9G3
 pj1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=FiRsK6Rkv+MGMGuc5WsI9lDR8qk6mP1jDsr/R3+Ts38=;
 b=Sl84TE8EhbLgLGFXV//Dq+jvcvKUPO8uiENOJ6Pgaht/KqUcenTNznEZMBKV7eMyWF
 cDNhU3XJ454CyKey00i6BRD6tUzuCcLfK8XohtwKx7NzjgY4wHL2NbDWP0WCzNtT5nS/
 u1j+RQvXM1Ec48wXvJATMwcfjGDT7y/jep4a6rzw72f0V8bhQj9koZXYsnoRMXKRPuZU
 G/bSfQuTzFtgB/14EnjYUqaYwyA2tknhWRXuT+wAEh2SnOyUw4e4Z2Sq+cbysQMwUjtl
 IlYNQsxWe+IX2OWgvNDyPAcPyPVUFzUvgQ6r2+boIgtXrSBSZf+A5vkxGJrg1s1Jxaej
 OT1Q==
X-Gm-Message-State: AHQUAuZaWIYYsdpbkGXOzMvAHive/ZJat3tBc8sfyd5KiFpH0Qwk8i+y
 aASHJ+epcOBwXfsKf5F5cdGwzg==
X-Google-Smtp-Source: AHgI3IZgN68Dd4TBWQgMN1xSpOyT80n1YWlSjhqNutRu+Ll1aJ8L4L4uKbHKRMLLEoQS8bP4SueW6w==
X-Received: by 2002:a1c:7fca:: with SMTP id a193mr1724626wmd.36.1549015186690; 
 Fri, 01 Feb 2019 01:59:46 -0800 (PST)
Received: from julienm-ubuntu-20JES0UQ00.home
 ([2a01:cb1d:333:ad00:9812:3ac:b5fb:9a4e])
 by smtp.gmail.com with ESMTPSA id 129sm4086575wmd.18.2019.02.01.01.59.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 01 Feb 2019 01:59:45 -0800 (PST)
From: Julien Masson <jmasson@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH] tty: serial: meson_uart: Add support for kernel debugger
Date: Fri,  1 Feb 2019 10:59:22 +0100
Message-Id: <1549015162-17418-1-git-send-email-jmasson@baylibre.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190201_015948_918169_6872516B 
X-CRM114-Status: GOOD (  11.48  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Julien Masson <jmasson@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The kgdb invokes the poll_put_char and poll_get_char when communicating
with the host. This patch implement the serial polling hooks for the
meson_uart to be used for KGDB debugging over serial line.

Signed-off-by: Julien Masson <jmasson@baylibre.com>
---
It has been tested on "Le Potato" board:
https://libre.computer/products/boards/aml-s905x-cc/

Kernel command line arguments:
kgdboc=ttyAML0,115200 kgdbretry=4 nokaslr kgdbcon

Kernel modules:
CONFIG_DEBUG_INFO=y
CONFIG_DEBUG_KERNEL=y
CONFIG_FRAME_POINTER=y
CONFIG_KGDB=y
CONFIG_KGDB_SERIAL_CONSOLE=y

Warning: for single step instruction I had to apply this patch:
https://lore.kernel.org/patchwork/patch/562423/

 drivers/tty/serial/meson_uart.c | 46 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index 8a84259..49b20da 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -426,6 +426,48 @@ static void meson_uart_config_port(struct uart_port *port, int flags)
 	}
 }
 
+#ifdef CONFIG_CONSOLE_POLL
+/*
+ * Console polling routines for writing and reading from the uart while
+ * in an interrupt or debug context (i.e. kgdb).
+ */
+
+static int meson_uart_poll_get_char(struct uart_port *port)
+{
+	u32 c;
+	unsigned long flags;
+
+	spin_lock_irqsave(&port->lock, flags);
+
+	if (readl(port->membase + AML_UART_STATUS) & AML_UART_RX_EMPTY)
+		c = NO_POLL_CHAR;
+	else
+		c = readl(port->membase + AML_UART_RFIFO);
+
+	spin_unlock_irqrestore(&port->lock, flags);
+
+	return c;
+}
+
+static void meson_uart_poll_put_char(struct uart_port *port, unsigned char c)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&port->lock, flags);
+
+	while (!(readl(port->membase + AML_UART_STATUS) & AML_UART_TX_EMPTY))
+		cpu_relax();
+
+	writel(c, port->membase + AML_UART_WFIFO);
+
+	while (!(readl(port->membase + AML_UART_STATUS) & AML_UART_TX_EMPTY))
+		cpu_relax();
+
+	spin_unlock_irqrestore(&port->lock, flags);
+}
+
+#endif /* CONFIG_CONSOLE_POLL */
+
 static const struct uart_ops meson_uart_ops = {
 	.set_mctrl      = meson_uart_set_mctrl,
 	.get_mctrl      = meson_uart_get_mctrl,
@@ -441,6 +483,10 @@ static const struct uart_ops meson_uart_ops = {
 	.request_port	= meson_uart_request_port,
 	.release_port	= meson_uart_release_port,
 	.verify_port	= meson_uart_verify_port,
+#ifdef CONFIG_CONSOLE_POLL
+	.poll_get_char	= meson_uart_poll_get_char,
+	.poll_put_char	= meson_uart_poll_put_char,
+#endif
 };
 
 #ifdef CONFIG_SERIAL_MESON_CONSOLE
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
