Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89512C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Dec 2021 12:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9tJsR341rw2x8udM/BODClH/+FxG5Iomrx5054dYriI=; b=zxnxiMGxVj1Mtn
	qLrYjNFNV4FzE6V3htR1CS7LO7AHRMjb705+8+I+eJkjqWtQqbjTNDX5GDJ5D6L7WxPKqY65kQwG3
	PaR23yQcONYMLlBkptIuMv2jtWzxSZfrlBzIWBXBW/7EO3MitwmemAtCE2khQs/JzySv5lp6RVxhg
	KiAWqe31WowuV/uBgRO/4Xr/sQyWEkP96BbNC/xNbQQh7fWLJS008SiAJXePG9SicAUukgktoKV2G
	/BNN637fIqB/83wjH2MurVGk/zcl7kDE5n80uoIcOVektitcV0W3Q5cCgtm8I/vUQmj4g57mwkmYG
	RdnKYmh8gdCcOECNYeCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2uYc-004Mcr-J2; Thu, 30 Dec 2021 12:29:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2uYZ-004Mbh-UW; Thu, 30 Dec 2021 12:29:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 81C13616A3;
 Thu, 30 Dec 2021 12:29:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57A54C36AEA;
 Thu, 30 Dec 2021 12:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1640867358;
 bh=3RiH11t6VVvu4zL04o+ytwebu6tBXHYIvfKR8bgCLPM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iKWLO9C0M7oZ6xbISXwb4i5h5PnGuaCF8XfLQerQ9sc5Kj/HdSP2+/rn0Pfb9aYtq
 csMmj4L19HghZ1EZhuh4lISEUy5wqnjZzyoaKJdi/Dz0K825XFxYTXzWfi164qU/5l
 XEj34/jXVFrOMPVF8G0JuSN4TDMDAUIlNnXVkQjQ=
Date: Thu, 30 Dec 2021 13:29:16 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Yu Tu <yu.tu@amlogic.com>
Cc: linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Vyacheslav <adeep@lexina.in>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH V3 2/6] tty: serial: meson: Request the register region
 in meson_uart_probe()
Message-ID: <Yc2mHOT4WwgUrrhG@kroah.com>
References: <20211230102110.3861-1-yu.tu@amlogic.com>
 <20211230102110.3861-3-yu.tu@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211230102110.3861-3-yu.tu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211230_042920_052750_469B2AE2 
X-CRM114-Status: GOOD (  18.47  )
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

On Thu, Dec 30, 2021 at 06:21:06PM +0800, Yu Tu wrote:
> This simplifies resetting the UART controller during probe and will make
> it easier to integrate the common clock code which will require the
> registers at probe time as well.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---
>  drivers/tty/serial/meson_uart.c | 24 ++++++------------------
>  1 file changed, 6 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
> index c9a37602ffd0..99efe62a1507 100644
> --- a/drivers/tty/serial/meson_uart.c
> +++ b/drivers/tty/serial/meson_uart.c
> @@ -397,24 +397,11 @@ static int meson_uart_verify_port(struct uart_port *port,
>  
>  static void meson_uart_release_port(struct uart_port *port)
>  {
> -	devm_iounmap(port->dev, port->membase);
> -	port->membase = NULL;
> -	devm_release_mem_region(port->dev, port->mapbase, port->mapsize);
> +	/* nothing to do */
>  }

Are you sure a release call like this can be "empty"?  That goes against
the normal way the driver model works.  If it is empty, why have it at
all?

thanks,

greg k-h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
