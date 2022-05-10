Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D6BC433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 May 2022 09:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QG3okZlkCcvZAm+HaVnB7XlWVYnz2wAc0QDVGp8pP0Y=; b=KqGLbwOffUNqyO
	lsC6E49PVF6pdg/vaK3DmTn3yStfsVTn9FseKjW3YklZXGZX33O8IBeQ0H3Ax15Wy87Hd7ZnG7hvA
	sL8hW4XcUKPXw+Uc/FKKTGFvjWuRGp6QpZAi1DEcHVF+GAud0ue6N5WiSfwZztgd6fh0nFp1JaSqW
	sie4P3/U91Gplp6HI2JAUKuRIFFQq2NrS3qsgq9M6+Bbnqoiwoghw461OKv4ecJN2IBrI0KT3Sosh
	xQtVmevonBZ+2q0vPxQUmOF8zVx51v1yEXGC5xW7nJm/1Pt3HW65NWNtl/MLp3U7S6zhMpWkfic8X
	w4aEfIj7R0GLFEN8eajg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noMV5-000xzO-CI; Tue, 10 May 2022 09:49:51 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noMUz-000xuu-Tx; Tue, 10 May 2022 09:49:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id ADB4BB81C64;
 Tue, 10 May 2022 09:49:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8878C385C6;
 Tue, 10 May 2022 09:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1652176182;
 bh=/gOPBTu3tvTGApNFzFvVy75YBVIr8MiZpBkvRlR3SAg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o2f5tiyUi4srx27bB6MrXZ2j9/2vfTHsYi2d/1SpF8A7Bklyn4VHHkZAr3LjwskgY
 UvS/vZGyFrRig4kYhW6gMzWgPNCk5EiAHqXtgYDg+NCVP+5sVb03xssrYWlBE3oT8k
 USZJGUKmavA4bhxS56T4ippuDkLqhurpwT50/Bo0=
Date: Tue, 10 May 2022 11:49:39 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Petr Mladek <pmladek@suse.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 John Ogness <john.ogness@linutronix.de>,
 Kevin Hilman <khilman@baylibre.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v1] serial: meson: acquire port->lock in startup()
Message-ID: <Yno1MzqCzoITbCjk@kroah.com>
References: <20220508103547.626355-1-john.ogness@linutronix.de>
 <cf593ff3-bf57-ccd3-9a25-b28cc604d6f4@baylibre.com>
 <YnoyU3fydh46e2Sc@alley>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YnoyU3fydh46e2Sc@alley>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_024946_311381_93717C50 
X-CRM114-Status: GOOD (  35.61  )
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

On Tue, May 10, 2022 at 11:37:23AM +0200, Petr Mladek wrote:
> On Mon 2022-05-09 09:36:40, Neil Armstrong wrote:
> > On 08/05/2022 12:35, John Ogness wrote:
> > > The uart_ops startup() callback is called without interrupts
> > > disabled and without port->lock locked, relatively late during the
> > > boot process (from the call path of console_on_rootfs()). If the
> > > device is a console, it was already previously registered and could
> > > be actively printing messages.
> > > 
> > > Since the startup() callback is reading/writing registers used by
> > > the console write() callback (AML_UART_CONTROL), its access must
> > > be synchronized using the port->lock. Currently it is not.
> > > 
> > > The startup() callback is the only function that explicitly enables
> > > interrupts. Without the synchronization, it is possible that
> > > interrupts become accidentally permanently disabled.
> > > 
> > > CPU0                           CPU1
> > > meson_serial_console_write     meson_uart_startup
> > > --------------------------     ------------------
> > > spin_lock(port->lock)
> > > val = readl(AML_UART_CONTROL)
> > > uart_console_write()
> > >                                 writel(INT_EN, AML_UART_CONTROL)
> > > writel(val, AML_UART_CONTROL)
> > > spin_unlock(port->lock)
> > > 
> > > Add port->lock synchronization to meson_uart_startup() to avoid
> > > racing with meson_serial_console_write().
> > > 
> > > Also add detailed comments to meson_uart_reset() explaining why it
> > > is *not* using port->lock synchronization.
> > > 
> > > Link: https://lore.kernel.org/lkml/2a82eae7-a256-f70c-fd82-4e510750906e@samsung.com
> > > Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > > Signed-off-by: John Ogness <john.ogness@linutronix.de>
> > > Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > > ---
> > >   drivers/tty/serial/meson_uart.c | 13 +++++++++++++
> > >   1 file changed, 13 insertions(+)
> > > 
> > > diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
> > > index 2bf1c57e0981..39021dac09cc 100644
> > > --- a/drivers/tty/serial/meson_uart.c
> > > +++ b/drivers/tty/serial/meson_uart.c
> > > @@ -253,6 +253,14 @@ static const char *meson_uart_type(struct uart_port *port)
> > >   	return (port->type == PORT_MESON) ? "meson_uart" : NULL;
> > >   }
> > > +/*
> > > + * This function is called only from probe() using a temporary io mapping
> > > + * in order to perform a reset before setting up the device. Since the
> > > + * temporarily mapped region was successfully requested, there can be no
> > > + * console on this port at this time. Hence it is not necessary for this
> > > + * function to acquire the port->lock. (Since there is no console on this
> > > + * port at this time, the port->lock is not initialized yet.)
> > > + */
> > >   static void meson_uart_reset(struct uart_port *port)
> > >   {
> > >   	u32 val;
> > > @@ -267,9 +275,12 @@ static void meson_uart_reset(struct uart_port *port)
> > >   static int meson_uart_startup(struct uart_port *port)
> > >   {
> > > +	unsigned long flags;
> > >   	u32 val;
> > >   	int ret = 0;
> > > +	spin_lock_irqsave(&port->lock, flags);
> > > +
> > >   	val = readl(port->membase + AML_UART_CONTROL);
> > >   	val |= AML_UART_CLEAR_ERR;
> > >   	writel(val, port->membase + AML_UART_CONTROL);
> > > @@ -285,6 +296,8 @@ static int meson_uart_startup(struct uart_port *port)
> > >   	val = (AML_UART_RECV_IRQ(1) | AML_UART_XMIT_IRQ(port->fifosize / 2));
> > >   	writel(val, port->membase + AML_UART_MISC);
> > > +	spin_unlock_irqrestore(&port->lock, flags);
> > > +
> > >   	ret = request_irq(port->irq, meson_uart_interrupt, 0,
> > >   			  port->name, port);
> > > 
> > > base-commit: 672c0c5173427e6b3e2a9bbb7be51ceeec78093a
> > 
> > Thanks for fixing this, it may also fix an uart apparent lockup I encountered
> > several time while developing on the platform, but the target was still alive
> > so it matches.
> > 
> > So I'll add:
> > Fixes: ff7693d079e5 ("ARM: meson: serial: add MesonX SoC on-chip uart driver")
> > 
> > and
> > 
> > Acked-by: Neil Armstrong <narmstrong@baylibre.com>
> 
> Neil, may I assume that you are going to queue this fix for 5.19, please?

I can take it, thanks.

greg k-h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
