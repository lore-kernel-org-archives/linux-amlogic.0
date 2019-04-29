Return-Path: <SRS0=ef8O=S7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34CE4C43219
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2019 07:06:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05EF52087B
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2019 07:06:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zpd7S9gf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=haabendal.dk header.i=@haabendal.dk header.b="J72ulJHK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05EF52087B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=haabendal.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K3dT11HPPJV87Mj4TV+oX8EHGyRUsJ7yGunJjsmNYfM=; b=Zpd7S9gf72D2ft
	PiFQT4AZbQx9fO64/tH7h0Qybg95dFpAWMEG4CZpLwPK1VS+AIk2/XovpcXKnvvKV/OOOyes+4LgS
	xR+mdHD6hmBp6g3gqIuIGWFD6KYO2hMhwdVRrm6JGPB1tQ8nyFJOaLRlrH7CIbWA2Y4VAmE++H8vV
	ASsLRWelieOYXOgor28UIK/+kTapkF8Z7q2s6Utf/s3+Qzy5b5/Nj+8+iw9XGzXvXAYRLyEJgG3La
	SCs3+ie0CBK96aICrKXtFwtgT8UysVsFQaNiGPOfXT9cND0lAp9LuisKAQGNaGwocyCXQQ7cMKgIb
	gXDI5Fw4BsEvoZIHDiyg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hL0NF-00077H-Kd; Mon, 29 Apr 2019 07:06:49 +0000
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com ([46.30.210.182])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL0ND-00076y-2u
 for linux-amlogic@lists.infradead.org; Mon, 29 Apr 2019 07:06:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=haabendal.dk; s=20140924;
 h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
 to:from:from; bh=Rf8sJx3ur2QK6RYa5XV2vgfxSi64pRoBLm32TUjXvQ4=;
 b=J72ulJHKQ5eRR7B3qrSTNdLv9fhmdBLHYdplxN71Kgqcrdgo5MySuk4ZXn9V8yxr3eOg/6LQPGt9z
 tne8BVs+PM5pe6qif7+qjVZFmLlWRRmRD5cd/6UVv5y2i2zaREWePHqki8KPN48Pg0BL/QXjGGbA2X
 p2Q/6XzJRGrQkj7U=
X-HalOne-Cookie: c9f683bd629857cf1aa4cd2256f9c542bd663e00
X-HalOne-ID: 58b9dc8e-6a4d-11e9-b614-d0431ea8a283
Received: from localhost (unknown [193.163.1.7])
 by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 58b9dc8e-6a4d-11e9-b614-d0431ea8a283;
 Mon, 29 Apr 2019 07:06:44 +0000 (UTC)
From: Esben Haabendal <esben@haabendal.dk>
To: "Enrico Weigelt\, metux IT consult" <info@metux.net>
Subject: Re: [PATCH 35/41] drivers: tty: serial: 8250: add mapsize to platform
 data
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-36-git-send-email-info@metux.net>
Date: Mon, 29 Apr 2019 09:06:44 +0200
In-Reply-To: <1556369542-13247-36-git-send-email-info@metux.net> (Enrico
 Weigelt's message of "Sat, 27 Apr 2019 14:52:16 +0200")
Message-ID: <87wojdxpbv.fsf@haabendal.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_000647_286828_DD5C07AC 
X-CRM114-Status: GOOD (  15.78  )
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

> Adding a mapsize field for the 8250 port platform data struct,
> so we can now set the resource size (eg. *1) and don't need
> funny runtime detections like serial8250_port_size() anymore.
>
> For now, serial8250_port_size() is called everytime we need
> the io resource size. That function checks which chip we
> actually have and returns the appropriate size. This approach
> is a bit clumpsy and not entirely easy to understand, and
> it's a violation of layers :p
>
> Obviously, that information cannot change after the driver init,
> so we can safely do that probing once on driver init and just
> use the stored value later.
>
> *1) arch/mips/alchemy/common/platform.c
>
> Signed-off-by: Enrico Weigelt <info@metux.net>
> ---
>  drivers/tty/serial/8250/8250_core.c | 1 +
>  include/linux/serial_8250.h         | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/drivers/tty/serial/8250/8250_core.c b/drivers/tty/serial/8250/8250_core.c
> index e441221..71a398b 100644
> --- a/drivers/tty/serial/8250/8250_core.c
> +++ b/drivers/tty/serial/8250/8250_core.c
> @@ -814,6 +814,7 @@ static int serial8250_probe(struct platform_device *dev)
>  		uart.port.iotype	= p->iotype;
>  		uart.port.flags		= p->flags;
>  		uart.port.mapbase	= p->mapbase;
> +		uart.port.mapsize	= p->mapsize;
>  		uart.port.hub6		= p->hub6;
>  		uart.port.private_data	= p->private_data;
>  		uart.port.type		= p->type;
> diff --git a/include/linux/serial_8250.h b/include/linux/serial_8250.h
> index 5a655ba..8b8183a 100644
> --- a/include/linux/serial_8250.h
> +++ b/include/linux/serial_8250.h
> @@ -22,6 +22,7 @@ struct plat_serial8250_port {
>  	unsigned long	iobase;		/* io base address */
>  	void __iomem	*membase;	/* ioremap cookie or NULL */
>  	resource_size_t	mapbase;	/* resource base */
> +	resource_size_t	mapsize;	/* resource size */
>  	unsigned int	irq;		/* interrupt number */
>  	unsigned long	irqflags;	/* request_irq flags */
>  	unsigned int	uartclk;	/* UART clock rate */

Or replace iobase, mapbase and mapsize with a struct resource value?

/Esben

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
