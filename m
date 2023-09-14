Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98CEBEEAA63
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Sep 2023 18:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=55IFhVY/eyfahJRw5jMnpQBkNisyL+bH9H+mWoazawg=; b=xjdym+eFyIXaUb
	mo3BzvoQCYQ42U+YGk7Tv0GP/jWTA7+2ihUlxUZ1p27dwqEQR2fwWKdlOplu7EU7WmuFDqByNoF0p
	e/u3Rf1Y8fS8eEk7OoQSGipc32HzUXMryO8ZLywLLfLHACXwceLjysOaybYUO2FfoO3SwuvL9xvR6
	sGO9z6bNqfASNoA/iYEoQoM6le6ZXm/RBBtZNRB2urFblBq8DlNlwq0dmpDvlGo+kiMDgX4fmznaQ
	tLXF/mPTrFIyk4Zd6ln0nhxDWVNAJBo9jtfhdEijl6+GDbDur7R6sfl58DuON2CAIQUjkS5Xdl8st
	kFmoWNUrEsXjyEZPBK8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgrFB-00950y-2o;
	Thu, 14 Sep 2023 18:39:13 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgrEx-0094pH-0q;
	Thu, 14 Sep 2023 18:39:02 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1694716733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZKwcjqONapPvBsW0aTkz2Kp7R2CB0xqS9WOHGi5RTLM=;
	b=Kt9ejYSj4fzpuLKrmdHCO4TSEiJ/k3jgwyUpWk1q1izigsfhXbJNdawsDjEuyb0g7xiudP
	5P2RvYHaXbxxKfeCu924OoVPUzrXS44G8idWC5xpML9kPCUqsyD5UGiR+UZG6NFm3vWCoa
	QmjX2nGB1M0UAQQsaVw27R0+8twOsyJI6MeWECfscxDXNzdugeuSaPjZj1LX0yQvjQJ13Q
	XD1YUOpaGjNWhxrMvqyEVmDAjvLlqXYSfJ5PLuuqBbmc2K/tvD+VhHf8aKGHV1PwPodQ57
	V7JMFdjuZlNdwD2GbKI3Q5POclPeJfHlcOAEoP9k7ru7nC2A8x9Vxxs1X9rQrA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1694716733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZKwcjqONapPvBsW0aTkz2Kp7R2CB0xqS9WOHGi5RTLM=;
	b=80ViDgQop2oPHtXmBSVsvdlF1xYlz0YuXbv4orRbO/DnNLH3DLm6EiwR/cHzJPMivGWEia
	MWrVuUucmyr3kEBw==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	linux-serial@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>,
	Lucas Tanure <tanure@linux.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH tty v1 37/74] serial: meson: Use port lock wrappers
Date: Thu, 14 Sep 2023 20:43:54 +0206
Message-Id: <20230914183831.587273-38-john.ogness@linutronix.de>
In-Reply-To: <20230914183831.587273-1-john.ogness@linutronix.de>
References: <20230914183831.587273-1-john.ogness@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_113859_626718_7F83FFB9 
X-CRM114-Status: GOOD (  16.55  )
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

From: Thomas Gleixner <tglx@linutronix.de>

When a serial port is used for kernel console output, then all
modifications to the UART registers which are done from other contexts,
e.g. getty, termios, are interference points for the kernel console.

So far this has been ignored and the printk output is based on the
principle of hope. The rework of the console infrastructure which aims to
support threaded and atomic consoles, requires to mark sections which
modify the UART registers as unsafe. This allows the atomic write function
to make informed decisions and eventually to restore operational state. It
also allows to prevent the regular UART code from modifying UART registers
while printk output is in progress.

All modifications of UART registers are guarded by the UART port lock,
which provides an obvious synchronization point with the console
infrastructure.

To avoid adding this functionality to all UART drivers, wrap the
spin_[un]lock*() invocations for uart_port::lock into helper functions
which just contain the spin_[un]lock*() invocations for now. In a
subsequent step these helpers will gain the console synchronization
mechanisms.

Converted with coccinelle. No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/tty/serial/meson_uart.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index 790d910dafa5..45cc23e9e399 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -129,14 +129,14 @@ static void meson_uart_shutdown(struct uart_port *port)
 
 	free_irq(port->irq, port);
 
-	spin_lock_irqsave(&port->lock, flags);
+	uart_port_lock_irqsave(port, &flags);
 
 	val = readl(port->membase + AML_UART_CONTROL);
 	val &= ~AML_UART_RX_EN;
 	val &= ~(AML_UART_RX_INT_EN | AML_UART_TX_INT_EN);
 	writel(val, port->membase + AML_UART_CONTROL);
 
-	spin_unlock_irqrestore(&port->lock, flags);
+	uart_port_unlock_irqrestore(port, flags);
 }
 
 static void meson_uart_start_tx(struct uart_port *port)
@@ -238,7 +238,7 @@ static irqreturn_t meson_uart_interrupt(int irq, void *dev_id)
 {
 	struct uart_port *port = (struct uart_port *)dev_id;
 
-	spin_lock(&port->lock);
+	uart_port_lock(port);
 
 	if (!(readl(port->membase + AML_UART_STATUS) & AML_UART_RX_EMPTY))
 		meson_receive_chars(port);
@@ -248,7 +248,7 @@ static irqreturn_t meson_uart_interrupt(int irq, void *dev_id)
 			meson_uart_start_tx(port);
 	}
 
-	spin_unlock(&port->lock);
+	uart_port_unlock(port);
 
 	return IRQ_HANDLED;
 }
@@ -284,7 +284,7 @@ static int meson_uart_startup(struct uart_port *port)
 	u32 val;
 	int ret = 0;
 
-	spin_lock_irqsave(&port->lock, flags);
+	uart_port_lock_irqsave(port, &flags);
 
 	val = readl(port->membase + AML_UART_CONTROL);
 	val |= AML_UART_CLEAR_ERR;
@@ -301,7 +301,7 @@ static int meson_uart_startup(struct uart_port *port)
 	val = (AML_UART_RECV_IRQ(1) | AML_UART_XMIT_IRQ(port->fifosize / 2));
 	writel(val, port->membase + AML_UART_MISC);
 
-	spin_unlock_irqrestore(&port->lock, flags);
+	uart_port_unlock_irqrestore(port, flags);
 
 	ret = request_irq(port->irq, meson_uart_interrupt, 0,
 			  port->name, port);
@@ -341,7 +341,7 @@ static void meson_uart_set_termios(struct uart_port *port,
 	unsigned long flags;
 	u32 val;
 
-	spin_lock_irqsave(&port->lock, flags);
+	uart_port_lock_irqsave(port, &flags);
 
 	cflags = termios->c_cflag;
 	iflags = termios->c_iflag;
@@ -401,7 +401,7 @@ static void meson_uart_set_termios(struct uart_port *port,
 					    AML_UART_FRAME_ERR;
 
 	uart_update_timeout(port, termios->c_cflag, baud);
-	spin_unlock_irqrestore(&port->lock, flags);
+	uart_port_unlock_irqrestore(port, flags);
 }
 
 static int meson_uart_verify_port(struct uart_port *port,
@@ -460,14 +460,14 @@ static int meson_uart_poll_get_char(struct uart_port *port)
 	u32 c;
 	unsigned long flags;
 
-	spin_lock_irqsave(&port->lock, flags);
+	uart_port_lock_irqsave(port, &flags);
 
 	if (readl(port->membase + AML_UART_STATUS) & AML_UART_RX_EMPTY)
 		c = NO_POLL_CHAR;
 	else
 		c = readl(port->membase + AML_UART_RFIFO);
 
-	spin_unlock_irqrestore(&port->lock, flags);
+	uart_port_unlock_irqrestore(port, flags);
 
 	return c;
 }
@@ -478,7 +478,7 @@ static void meson_uart_poll_put_char(struct uart_port *port, unsigned char c)
 	u32 reg;
 	int ret;
 
-	spin_lock_irqsave(&port->lock, flags);
+	uart_port_lock_irqsave(port, &flags);
 
 	/* Wait until FIFO is empty or timeout */
 	ret = readl_poll_timeout_atomic(port->membase + AML_UART_STATUS, reg,
@@ -502,7 +502,7 @@ static void meson_uart_poll_put_char(struct uart_port *port, unsigned char c)
 		dev_err(port->dev, "Timeout waiting for UART TX EMPTY\n");
 
 out:
-	spin_unlock_irqrestore(&port->lock, flags);
+	uart_port_unlock_irqrestore(port, flags);
 }
 
 #endif /* CONFIG_CONSOLE_POLL */
@@ -559,9 +559,9 @@ static void meson_serial_port_write(struct uart_port *port, const char *s,
 	if (port->sysrq) {
 		locked = 0;
 	} else if (oops_in_progress) {
-		locked = spin_trylock(&port->lock);
+		locked = uart_port_trylock(port);
 	} else {
-		spin_lock(&port->lock);
+		uart_port_lock(port);
 		locked = 1;
 	}
 
@@ -573,7 +573,7 @@ static void meson_serial_port_write(struct uart_port *port, const char *s,
 	writel(val, port->membase + AML_UART_CONTROL);
 
 	if (locked)
-		spin_unlock(&port->lock);
+		uart_port_unlock(port);
 	local_irq_restore(flags);
 }
 
-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
