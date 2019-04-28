Return-Path: <SRS0=4pfR=S6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF953C43219
	for <linux-amlogic@archiver.kernel.org>; Sun, 28 Apr 2019 15:39:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A10F92067C
	for <linux-amlogic@archiver.kernel.org>; Sun, 28 Apr 2019 15:39:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t13R/4I5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A10F92067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kUjOdPXI+y+teqAmdAe23aZwF6riGSFbcjnMkRy92eU=; b=t13R/4I5ZB2xQj
	hKIazZn0op8mkwR4LmYIxDQ51X6DH1uUjGcJyRg/90EGheYOeCHQ5vlrE4SP8iKMjs2OLXKwHpAbY
	jsMwxEMgbqNV7Wlj9npeoUOgR8EeoeGx10rvDXl9qIgUhHEg/djk3/g8wa3/jDvcF3weWmBzzzS7R
	wLVFiUZt8PfI364eWgG9ir/WXEFRtNrIfZp/Y+jtTj+nGS4dGQVAR0/vCLyrHXA6cWDbTPpCtZrBY
	6NYPrLEtXMMwu0RBNdz1sy+stNSV4h20DxfXlcY76oXcQOEJMxn46619iMzcgRWICKg0q2v5BOTY9
	K9ySRwNiIRYxB5JsHKwg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKlti-0001cW-91; Sun, 28 Apr 2019 15:39:22 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKlte-0001bR-PS
 for linux-amlogic@lists.infradead.org; Sun, 28 Apr 2019 15:39:20 +0000
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Apr 2019 08:39:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,406,1549958400"; d="scan'208";a="138181186"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.86])
 by orsmga008.jf.intel.com with ESMTP; 28 Apr 2019 08:39:07 -0700
Received: from andy by smile with local (Exim 4.92)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1hKltR-0005hz-Nc; Sun, 28 Apr 2019 18:39:05 +0300
Date: Sun, 28 Apr 2019 18:39:05 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: Re: [PATCH 40/41] drivers: tty: serial: helper for setting mmio range
Message-ID: <20190428153905.GR9224@smile.fi.intel.com>
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-41-git-send-email-info@metux.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1556369542-13247-41-git-send-email-info@metux.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190428_083918_842378_7029289F 
X-CRM114-Status: GOOD (  19.82  )
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
 sudeep.holla@arm.com, liviu.dudau@arm.com, linux-kernel@vger.kernel.org,
 vz@mleia.com, linux@prisktech.co.nz, sparclinux@vger.kernel.org,
 khilman@baylibre.com, macro@linux-mips.org, slemieux.tyco@gmail.com,
 matthias.bgg@gmail.com, jacmet@sunsite.dk, linux-amlogic@lists.infradead.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, Apr 27, 2019 at 02:52:21PM +0200, Enrico Weigelt, metux IT consult wrote:
> Introduce a little helpers for settings the mmio range from an
> struct resource or start/len parameters with less code.
> (also setting iotype to UPIO_MEM)
> 
> Also converting drivers to use these new helpers as well as
> fetching mapsize field instead of using hardcoded values.
> (the runtime overhead of that should be negligible)
> 
> The idea is moving to a consistent scheme, so later common
> calls like request+ioremap combination can be done by generic
> helpers.

> --- a/drivers/tty/serial/8250/8250_exar.c
> +++ b/drivers/tty/serial/8250/8250_exar.c
> @@ -134,8 +134,10 @@ static int default_setup(struct exar8250 *priv, struct pci_dev *pcidev,
>  	const struct exar8250_board *board = priv->board;
>  	unsigned int bar = 0;
>  
> -	port->port.iotype = UPIO_MEM;
> -	port->port.mapbase = pci_resource_start(pcidev, bar) + offset;
> +	uart_memres_set_start_len(&port->port,
> +				  pci_resource_start(pcidev, bar) + offset,
> +				  pci_resource_len(pcidev, bar));
> +

I don't see how it's better.
Moreover, the size argument seems wrong here.

> +		uart_memres_set_start_len(
> +			&port,
> +			FRODO_BASE + FRODO_APCI_OFFSET(1), 0);

Please, avoid such splitting, first parameter is quite fit above line.

>  		port.uartclk = HPDCA_BAUD_BASE * 16;
> -		port.mapbase = (pa + UART_OFFSET);
> +
> +		uart_memres_set_start_len(&port, (pa + UART_OFFSET));
>  		port.membase = (char *)(port.mapbase + DIO_VIRADDRBASE);
>  		port.regshift = 1;
>  		port.irq = DIO_IPL(pa + DIO_VIRADDRBASE);

Here...

>  	uart.port.flags = UPF_SKIP_TEST | UPF_SHARE_IRQ | UPF_BOOT_AUTOCONF;
>  	uart.port.irq = d->ipl;
>  	uart.port.uartclk = HPDCA_BAUD_BASE * 16;
> -	uart.port.mapbase = (d->resource.start + UART_OFFSET);
> +	uart_memres_set_start_len(&uart.port,
> +				  (d->resource.start + UART_OFFSET),
> +				  resource_size(&d->resource));
>  	uart.port.membase = (char *)(uart.port.mapbase + DIO_VIRADDRBASE);
>  	uart.port.regshift = 1;
>  	uart.port.dev = &d->dev;

...and here, and maybe in other places you split the assignments to the members
in two part. Better to call your function before or after these blocks of
assignments.

> -			uport->mapsize	= ZS_CHAN_IO_SIZE;
> -			uport->mapbase	= dec_kn_slot_base +
> -					  zs_parms.scc[chip] +
> -					  (side ^ ZS_CHAN_B) * ZS_CHAN_IO_SIZE;
> +
> +			uart_memres_set_start_len(dec_kn_slot_base +
> +						    zs_parms.scc[chip] +
> +						    (side ^ ZS_CHAN_B) *
> +							ZS_CHAN_IO_SIZE,
> +						  ZS_CHAN_IO_SIZE);

This looks hard to read. Think of temporary variables and better formatting
style.

>  /*
> + * set physical io range from struct resource
> + * if resource is NULL, clear the fields
> + * also set the iotype to UPIO_MEM

Something wrong with punctuation and style. Please, use proper casing and
sentences split.

> + */

Shouldn't be kernel-doc formatted?

> +static inline void uart_memres_set_res(struct uart_port *port,

Perhaps better name can be found.
Especially taking into account that it handles IO / MMIO here.

> +				       struct resource *res)
> +{
> +	if (!res) {

It should return an error in such case.

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

Only one type? Why type is even set here?

> +}
> +
> +/*
> + * set physical io range by start address and length
> + * if resource is NULL, clear the fields
> + * also set the iotype to UPIO_MEM

Should be fixed as told above.

> + */

> +static inline void uart_memres_set_start_len(struct uart_driver *uart,
> +					     resource_size_t start,
> +					     resource_size_t len)

The comment doesn't tell why this is needed when we have one for struct
resource.

> +{
> +	uart->mapbase = start;
> +	uart->mapsize = len;

> +	uart->iotype  = UPIO_MEM;

Only one type?

> +}
> +
> +/*

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
