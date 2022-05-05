Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24AFEC433F5
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 May 2022 22:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ft9hR7ELCrVEZlBe+08+jiNXfTLv0si3sEkQPUcemc=; b=W0vsiZemBDW1r8
	t+gBigtZVc3O84uIt6Uz7+hX3mlG3xDQ0vhdEpC8A7rhoG2DIiLysxnW5lDjdocIJMDHFJqan4N1W
	VpqtlLNK9QlMq8VD7MEfaIJsBQy5+6lCAY/fiXjF6Aa8C9LqS+Y1nGcUl+ZVJxesxeIo3l+iZLECW
	m7Hie71+J7DNvsrwbpyGjqp/KxVPmZ32dLomLYUD8iZdfeKgO+aKZ/jKuxSuOC8dOVP/vD4tr90xD
	Q8MQAsCgNYld8uOEfWjrGmOQsABO2OBcTNZRI1MD4xtCM0gyqE5hcvPe6ffjGNQjxT+3D9VpqVLBx
	mDbx32VUbF9NRpZwSuMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmk2A-000PnH-Qi; Thu, 05 May 2022 22:33:18 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmk28-000PmG-Dg
 for linux-amlogic@lists.infradead.org; Thu, 05 May 2022 22:33:17 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1651789992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ytVIAaWj8JkkieFnBNn80sd5MHBlsGGI9hhLKU4M3Z8=;
 b=VAy6FEbOpeb56a7INHKsrf9wsvUNOSo5OmKF/jizF6zYy9jrDiH+sh+x2Yj4l9T+h5Ft6x
 /M93lCjGJvnbLREe2aIQ7FxJ13ihv+6n7osGG27pl2Hz7864N0h5uhadNiCyRgvb4w2fVZ
 TGMxOIpx/xSoLcMxJqycJLqJTN5jWs6oJ4JUyk0emud05VKgfQBlFPG5jlIEe+p65m5gQx
 yM7LsmQxSFK7q5JroqYTOioAs0FcXFNZEpAHTaPbWtLjbK0xZRhZye7VwJ0vgLxwyvx/x9
 CQuA/7fZ6f4pJxXVIKCa1rgp817C2iZW9MwWNRLHkYQuy12HW1OZiD6MqnQo+g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1651789992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ytVIAaWj8JkkieFnBNn80sd5MHBlsGGI9hhLKU4M3Z8=;
 b=hVuRU6SaPQT/sqsKWRakw4yG0K01vOAxP5l3nObGvb02uuuD99UdKwFPIKbgaPf8A+BIsA
 MH9UFSxf9WdaXYCg==
To: Marek Szyprowski <m.szyprowski@samsung.com>, Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt
 <rostedt@goodmis.org>, Thomas
 Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH printk v5 1/1] printk: extend console_lock for
 per-console locking
In-Reply-To: <87a6bwapij.fsf@jogness.linutronix.de>
References: <Ymfgis0EAw0Oxoa5@alley> <Ymfwk+X0CHq6ex3s@alley>
 <CGME20220427070833eucas1p27a32ce7c41c0da26f05bd52155f0031c@eucas1p2.samsung.com>
 <2a82eae7-a256-f70c-fd82-4e510750906e@samsung.com>
 <Ymjy3rHRenba7r7R@alley>
 <b6c1a8ac-c691-a84d-d3a1-f99984d32f06@samsung.com>
 <87fslyv6y3.fsf@jogness.linutronix.de>
 <51dfc4a0-f6cf-092f-109f-a04eeb240655@samsung.com>
 <87k0b6blz2.fsf@jogness.linutronix.de>
 <32bba8f8-dec7-78aa-f2e5-f62928412eda@samsung.com>
 <Ym/Z7PYPqvWPEjuL@alley>
 <45849b63-d7a8-5cc3-26ad-256a28d09991@samsung.com>
 <87pmktm2a9.fsf@jogness.linutronix.de>
 <87a6bwapij.fsf@jogness.linutronix.de>
Date: Fri, 06 May 2022 00:39:12 +0206
Message-ID: <87zgjvd2zb.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_153316_641005_3029AD21 
X-CRM114-Status: UNSURE (   7.48  )
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

Hi Marek,

On 2022-05-05, John Ogness <john.ogness@linutronix.de> wrote:
> I will go through and check if all access to AML_UART_CONTROL is
> protected by port->lock.

The startup() callback of the uart_ops is not called with the port
locked. I'm having difficulties identifying if the startup() callback
can occur after the console was already registered via meson_uart_init()
and could be actively printing, but I see other serial drivers are
protecting their registers in the startup() callback with the
port->lock.

Could you try booting the meson hardware with the following change? (And
removing any previous debug changes I posted?)

John

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index 2bf1c57e0981..f551b8603817 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -267,9 +267,12 @@ static void meson_uart_reset(struct uart_port *port)
 
 static int meson_uart_startup(struct uart_port *port)
 {
+	unsigned long flags;
 	u32 val;
 	int ret = 0;
 
+	spin_lock_irqsave(&port->lock, flags);
+
 	val = readl(port->membase + AML_UART_CONTROL);
 	val |= AML_UART_CLEAR_ERR;
 	writel(val, port->membase + AML_UART_CONTROL);
@@ -285,6 +288,8 @@ static int meson_uart_startup(struct uart_port *port)
 	val = (AML_UART_RECV_IRQ(1) | AML_UART_XMIT_IRQ(port->fifosize / 2));
 	writel(val, port->membase + AML_UART_MISC);
 
+	spin_unlock_irqrestore(&port->lock, flags);
+
 	ret = request_irq(port->irq, meson_uart_interrupt, 0,
 			  port->name, port);
 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
