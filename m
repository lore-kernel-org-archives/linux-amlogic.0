Return-Path: <SRS0=mq8D=S5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77841C4321B
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:53:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48A5B21530
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:53:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b7cEpToW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48A5B21530
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=IXcjSEB1RIYMEeUKwhZJjwT1UGVtPT6Wc11fLtsgO+4=; b=b7cEpToWTrUX16UAPcZBBQtopt
	tiX8Om2u8eFc4CVCsvdXwyDrYvlMyLTIb5JfvlsFw3APvSX1UDCknnWGkS7nHR++tZ3JQLANNFBUG
	jotcFzSxzESkurpVZhbUkHtbL5R69SRFpcs9Hq/+DxNtL+1QYRgr644MKMxtwVcr2n4Tud6xxgan/
	qf8wL2KmJ6VZ8xzb1xlviGNf8uI0/3yRDJWq9cfSn15dWIxXAFOAO22HSgns2EC4HtOdQEtqinuyP
	mYlxQF+DwrAZBiuL1wkqUkzyes0rX2P1rOguGEhOrVFGZMCrrO9XNpWuo5cCzsb4ZyvqLSdm44Px8
	37Ulwj4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKMpm-0001Pq-2z; Sat, 27 Apr 2019 12:53:38 +0000
Received: from mout.kundenserver.de ([212.227.126.187])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKMpE-0000fT-Mv
 for linux-amlogic@lists.infradead.org; Sat, 27 Apr 2019 12:53:10 +0000
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MQ5nE-1h75AP44I4-00M2Ff; Sat, 27 Apr 2019 14:52:50 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 19/41] drivers: tty: serial: apbuart: fix code formatting
Date: Sat, 27 Apr 2019 14:52:00 +0200
Message-Id: <1556369542-13247-20-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:pjIAjAgne4QqCMX+FIhXRp8twk2qiMY/VorT1FzzAauzfUv0f0K
 SouwmsHqH8JyEbDuRqNFwbEIDs+EyWcnB64N7nh/mWQM9zuPT5456futLRKhnzo2DzzmTAO
 S02Mck6t77pqC6132Z833rEpWkrhCHTZd9aBV6r93jE4Lyyveee4Vx4PENyVvPDGn5fzADC
 T1cnBnEc7a4HKVi45SoRA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hEOSQVkrBtY=:E2i1fxkjmB++cF1pgysgSC
 8hsAb0Aq860XW0owLqBwUm2y5DJXO+V/Is8mFh4c9ru3QfeD9ojJIKExeE/gQMx2UOQEJgGRb
 nvrMAXOkXd1qYP1gKihMwQy9DHsjWbR3wxj+hp709JVyhiYnLw9UAD3t+5PPNn6ETAr98RQP2
 gHqDm/XUrKMU6kMIkWzlIgqfxdvTEA7d7CYJRA9+zsUFW6w+/kxNsRVEd2YH5fKzEWDZTB6mG
 AA1v18dy6/1w/Ta8+c1Z5r88c2mCOFG/kzIKZoFOpF02Re1cfPJiHtMPLpESpqBGkPJuT0pan
 wj5zbHmx+ec2NOcEAFhVUHZLEz20D89Udi/Cyt1T8qV0CmOeHhNQKA82G64fYOI5+TUIzx7QC
 obIBCK9wl1bRvMCTV4E/U6sBvRSiFWt5BcFHib/PhsHSUGo1Qoyf0VIUK6oReuSkCDZLub+8G
 Ob+eIhsXiwLKrxHAPOJ3mKdJEWu46k9EuJVL6xT+/FJe8XJTXXYFVmn8//sRTXHE9xnvp8m1O
 1hpfUx4oFrpuxlBsYSu4W9shD60EHF2Zw/7FCtDHNOWT3igcd4Kn+PwMo93U88O8Llhwj4qEi
 0CfcgMV9NBLuRd7LB5vp6/0Y+IfZe9HXOS6bEacBXOvat8PAAolbzxQuW8puvfRpBKG0XLB8X
 ofUclwTQPMphcmiPqlFXZf2nDhQxa57xuFpm3v4alrdRoOJx+GnGdJbV+E65VwyS+7GmnAy5B
 A0stBq2sqAbOn5qtmttutC8+4NSushVi0gD3aA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190427_055305_302357_196A1432 
X-CRM114-Status: GOOD (  10.63  )
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
Cc: lorenzo.pieralisi@arm.com, linux-ia64@vger.kernel.org,
 linux-serial@vger.kernel.org, andrew@aj.id.au, gregkh@linuxfoundation.org,
 sudeep.holla@arm.com, liviu.dudau@arm.com, linux-mips@vger.kernel.org,
 vz@mleia.com, linux@prisktech.co.nz, sparclinux@vger.kernel.org,
 khilman@baylibre.com, macro@linux-mips.org, slemieux.tyco@gmail.com,
 matthias.bgg@gmail.com, jacmet@sunsite.dk, linux-amlogic@lists.infradead.org,
 andriy.shevchenko@linux.intel.com, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Fix checkpatch warnings:

    WARNING: line over 80 characters
    #9: FILE: drivers/tty/serial/apbuart.c:9:
    + *  Copyright (C) 2006 Daniel Hellstrom <daniel@gaisler.com>, Aeroflex Gaisler AB

    WARNING: line over 80 characters
    #11: FILE: drivers/tty/serial/apbuart.c:11:
    + *  Copyright (C) 2009 Kristoffer Glembo <kristoffer@gaisler.com>, Aeroflex Gaisler AB

    WARNING: line over 80 characters
    #16: FILE: drivers/tty/serial/apbuart.c:16:
    +#if defined(CONFIG_SERIAL_GRLIB_GAISLER_APBUART_CONSOLE) && defined(CONFIG_MAGIC_SYSRQ)

    WARNING: labels should not be indented
    #122: FILE: drivers/tty/serial/apbuart.c:122:
    +	      ignore_char:

    WARNING: Missing a blank line after declarations
    #186: FILE: drivers/tty/serial/apbuart.c:186:
    +	unsigned int status = UART_GET_STATUS(port);
    +	return status & UART_STATUS_THE ? TIOCSER_TEMT : 0;

    WARNING: Missing a blank line after declarations
    #322: FILE: drivers/tty/serial/apbuart.c:322:
    +	int ret = 0;
    +	if (ser->type != PORT_UNKNOWN && ser->type != PORT_APBUART)

    WARNING: Missing a blank line after declarations
    #427: FILE: drivers/tty/serial/apbuart.c:427:
    +	unsigned int status;
    +	do {

    WARNING: Missing a blank line after declarations
    #463: FILE: drivers/tty/serial/apbuart.c:463:
    +		unsigned int quot, status;
    +		status = UART_GET_STATUS(port);

    WARNING: line over 80 characters
    #627: FILE: drivers/tty/serial/apbuart.c:627:
    +		port->membase = ioremap(addr, sizeof(struct grlib_apbuart_regs_map));

    WARNING: line over 80 characters
    #634: FILE: drivers/tty/serial/apbuart.c:634:
    +		port->fifosize = apbuart_scan_fifo_size((struct uart_port *) port, line);

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/apbuart.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/tty/serial/apbuart.c b/drivers/tty/serial/apbuart.c
index 89e19b6..515a562 100644
--- a/drivers/tty/serial/apbuart.c
+++ b/drivers/tty/serial/apbuart.c
@@ -6,12 +6,15 @@
  *
  *  Copyright (C) 2000 Deep Blue Solutions Ltd.
  *  Copyright (C) 2003 Konrad Eisele <eiselekd@web.de>
- *  Copyright (C) 2006 Daniel Hellstrom <daniel@gaisler.com>, Aeroflex Gaisler AB
+ *  Copyright (C) 2006 Daniel Hellstrom <daniel@gaisler.com>,
+ *                     Aeroflex Gaisler AB
  *  Copyright (C) 2008 Gilead Kutnick <kutnickg@zin-tech.com>
- *  Copyright (C) 2009 Kristoffer Glembo <kristoffer@gaisler.com>, Aeroflex Gaisler AB
+ *  Copyright (C) 2009 Kristoffer Glembo <kristoffer@gaisler.com>,
+ *                     Aeroflex Gaisler AB
  */
 
-#if defined(CONFIG_SERIAL_GRLIB_GAISLER_APBUART_CONSOLE) && defined(CONFIG_MAGIC_SYSRQ)
+#if defined(CONFIG_SERIAL_GRLIB_GAISLER_APBUART_CONSOLE) \
+	&& defined(CONFIG_MAGIC_SYSRQ)
 #define SUPPORT_SYSRQ
 #endif
 
@@ -116,8 +119,7 @@ static void apbuart_rx_chars(struct uart_port *port)
 
 		uart_insert_char(port, rsr, UART_STATUS_OE, ch, flag);
 
-
-	      ignore_char:
+ignore_char:
 		status = UART_GET_STATUS(port);
 	}
 
@@ -181,6 +183,7 @@ static irqreturn_t apbuart_int(int irq, void *dev_id)
 static unsigned int apbuart_tx_empty(struct uart_port *port)
 {
 	unsigned int status = UART_GET_STATUS(port);
+
 	return status & UART_STATUS_THE ? TIOCSER_TEMT : 0;
 }
 
@@ -317,6 +320,7 @@ static int apbuart_verify_port(struct uart_port *port,
 			       struct serial_struct *ser)
 {
 	int ret = 0;
+
 	if (ser->type != PORT_UNKNOWN && ser->type != PORT_APBUART)
 		ret = -EINVAL;
 	if (ser->irq < 0 || ser->irq >= NR_IRQS)
@@ -422,6 +426,7 @@ static void apbuart_flush_fifo(struct uart_port *port)
 static void apbuart_console_putchar(struct uart_port *port, int ch)
 {
 	unsigned int status;
+
 	do {
 		status = UART_GET_STATUS(port);
 	} while (!UART_TX_READY(status));
@@ -458,6 +463,7 @@ static void apbuart_console_putchar(struct uart_port *port, int ch)
 	if (UART_GET_CTRL(port) & (UART_CTRL_RE | UART_CTRL_TE)) {
 
 		unsigned int quot, status;
+
 		status = UART_GET_STATUS(port);
 
 		*parity = 'n';
@@ -622,14 +628,16 @@ static int __init grlib_apbuart_configure(void)
 		port = &grlib_apbuart_ports[line];
 
 		port->mapbase = addr;
-		port->membase = ioremap(addr, sizeof(struct grlib_apbuart_regs_map));
+		port->membase = ioremap(addr,
+			sizeof(struct grlib_apbuart_regs_map));
 		port->irq = 0;
 		port->iotype = UPIO_MEM;
 		port->ops = &grlib_apbuart_ops;
 		port->flags = UPF_BOOT_AUTOCONF;
 		port->line = line;
 		port->uartclk = *freq_hz;
-		port->fifosize = apbuart_scan_fifo_size((struct uart_port *) port, line);
+		port->fifosize = apbuart_scan_fifo_size(
+			(struct uart_port *) port, line);
 		line++;
 
 		/* We support maximum UART_NR uarts ... */
-- 
1.9.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
