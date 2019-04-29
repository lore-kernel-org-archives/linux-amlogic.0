Return-Path: <SRS0=ef8O=S7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48DDDC43219
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2019 07:03:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 167322053B
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2019 07:03:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MFNWn2QX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=haabendal.dk header.i=@haabendal.dk header.b="lBNJsg0T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 167322053B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=haabendal.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aYXS/APkuNCJYUmhvtWetD37+dV5SlUnz0KN5lWaJU8=; b=MFNWn2QXPQ9ZzZ
	NDB4x59+psivJf6WtHs3YWCsGUnbdh5e9n3C9r/tsDlYCNvm9Zlh8JfIjGw3yQM4HPu0nTKOHS5uZ
	kj+xn0Jto+EveqEDYyuw34F0uye00FpTIYk85L2Gcgz99W8mVrENIy6/kenLQFZbeelFcX5AZxAWq
	Q+eNV+UTAlEdAaSeVRmHEO13KlJK8uTUEHjmeKbUkfwfc43VrVaH6czgTbbiNR8/WRy/B2qNcyQMH
	2e0MJD+jIcumqqXBfQ0sueKeCh2p72nGG91UVuo3AoW+WILquDY3XDw0yTzzpgBBG/kcZLW5dKoWv
	9NkChjx/i1LP11ojwn3A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hL0JY-0004PI-PS; Mon, 29 Apr 2019 07:03:00 +0000
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com ([46.30.210.185])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL0EY-0007Ta-Dd
 for linux-amlogic@lists.infradead.org; Mon, 29 Apr 2019 06:57:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=haabendal.dk; s=20140924;
 h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
 to:from:from; bh=6XgGXBZd9XuP2oE4RYwYzog341NRJDxtjWMZBSjiAvQ=;
 b=lBNJsg0TqOZCs9zsmi7OlOlz1wKeTb8FI0J/+yKQeypPoT337WSvpPYP2/pyW3ht3JjaSTybk0hbz
 c0LpDVQOhmRpZB7EFxCcruxLFgSmAMtfq2RxssZSD9SC3JZbOA2dkqsbdOav7qrmogx3ryl8zofC4J
 4WA76c54x5vGgSFE=
X-HalOne-Cookie: ee6e547916cc579600553f0a2d7cd6ab5b054162
X-HalOne-ID: 164fce27-6a4c-11e9-a5a1-d0431ea8bb10
Received: from localhost (unknown [193.163.1.7])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 164fce27-6a4c-11e9-a5a1-d0431ea8bb10;
 Mon, 29 Apr 2019 06:57:43 +0000 (UTC)
From: Esben Haabendal <esben@haabendal.dk>
To: "Enrico Weigelt\, metux IT consult" <info@metux.net>
Subject: Re: [PATCH 40/41] drivers: tty: serial: helper for setting mmio range
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-41-git-send-email-info@metux.net>
Date: Mon, 29 Apr 2019 08:57:43 +0200
In-Reply-To: <1556369542-13247-41-git-send-email-info@metux.net> (Enrico
 Weigelt's message of "Sat, 27 Apr 2019 14:52:21 +0200")
Message-ID: <87muk9z4bc.fsf@haabendal.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190428_235750_614408_59D0AB77 
X-CRM114-Status: GOOD (  13.74  )
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
Cc: linux-ia64@vger.kernel.org, lorenzo.pieralisi@arm.com,
 linux-mips@vger.kernel.org, linux-serial@vger.kernel.org, andrew@aj.id.au,
 gregkh@linuxfoundation.org, sudeep.holla@arm.com, liviu.dudau@arm.com,
 linux-kernel@vger.kernel.org, vz@mleia.com, linux@prisktech.co.nz,
 sparclinux@vger.kernel.org, khilman@baylibre.com, macro@linux-mips.org,
 slemieux.tyco@gmail.com, matthias.bgg@gmail.com, jacmet@sunsite.dk,
 linux-amlogic@lists.infradead.org, andriy.shevchenko@linux.intel.com,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

"Enrico Weigelt, metux IT consult" <info@metux.net> writes:

> @@ -131,7 +133,8 @@ int __init hp300_setup_serial_console(void)
>  		pr_info("Serial console is HP DCA at select code %d\n", scode);
>  
>  		port.uartclk = HPDCA_BAUD_BASE * 16;
> -		port.mapbase = (pa + UART_OFFSET);
> +
> +		uart_memres_set_start_len(&port, (pa + UART_OFFSET));

Missing length argument here.

>  		port.membase = (char *)(port.mapbase + DIO_VIRADDRBASE);
>  		port.regshift = 1;
>  		port.irq = DIO_IPL(pa + DIO_VIRADDRBASE);

> diff --git a/drivers/tty/serial/xilinx_uartps.c b/drivers/tty/serial/xilinx_uartps.c
> index cf8ca66..895c90c 100644
> --- a/drivers/tty/serial/xilinx_uartps.c
> +++ b/drivers/tty/serial/xilinx_uartps.c
> @@ -1626,8 +1626,7 @@ static int cdns_uart_probe(struct platform_device *pdev)
>  	 * This function also registers this device with the tty layer
>  	 * and triggers invocation of the config_port() entry point.
>  	 */
> -	port->mapbase = res->start;
> -	port->mapsize = CDNS_UART_REGISTER_SPACE;
> +	uart_memres_set_start_len(res->start, CDNS_UART_REGISTER_SPACE);

Missing 1st (port) argument here.

>  	port->irq = irq;
>  	port->dev = &pdev->dev;
>  	port->uartclk = clk_get_rate(cdns_uart_data->uartclk);

> diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
> index 5fe2b03..d891c8d 100644
> --- a/include/linux/serial_core.h
> +++ b/include/linux/serial_core.h
> @@ -427,6 +427,46 @@ void uart_console_write(struct uart_port *port, const char *s,
>  int uart_match_port(struct uart_port *port1, struct uart_port *port2);
>  
>  /*
> + * set physical io range from struct resource
> + * if resource is NULL, clear the fields
> + * also set the iotype to UPIO_MEM
> + */
> +static inline void uart_memres_set_res(struct uart_port *port,
> +				       struct resource *res)
> +{
> +	if (!res) {
> +		port->mapsize = 0;
> +		port->mapbase = 0;
> +		port->iobase = 0;
> +		return;
> +	}
> +
> +	if (resource_type(res) == IORESOURCE_IO) {
> +		port->iotype = UPIO_PORT;
> +		port->iobase = resource->start;
> +		return;
> +	}
> +
> +	uart->mapbase = res->start;
> +	uart->mapsize = resource_size(res);
> +	uart->iotype  = UPIO_MEM;

Hardcoding UPIO_MEM like does not work for drivers using other kind of
memory access, like UPIO_MEM16, UPIO_MEM32 and UPIO_MEM32BE.

Why not leave the control of iotype to drivers as before this patch?

> +}
> +
> +/*
> + * set physical io range by start address and length
> + * if resource is NULL, clear the fields
> + * also set the iotype to UPIO_MEM
> + */
> +static inline void uart_memres_set_start_len(struct uart_driver *uart,
> +					     resource_size_t start,
> +					     resource_size_t len)
> +{
> +	uart->mapbase = start;
> +	uart->mapsize = len;
> +	uart->iotype  = UPIO_MEM;

Same here, other iotype values must be possible.

> +}
> +
> +/*
>   * Power Management
>   */
>  int uart_suspend_port(struct uart_driver *reg, struct uart_port *port);

/Esben

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
