Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 773B3C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 May 2022 05:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vNEdVYqBzzfg4taorqQg0zCNx01LIYrEumRi6RZP9nM=; b=rnzE+kcNDRyxh5
	AqdEIl/V+hAMMELLWz5lxsieM44jJSnTu/b5axBCJa4ivy7zvnpNwl6Y2+WL0LEfA2P/jDJ22YAaB
	sPRrKZQ6KBLtOtZsijisLIxpQ07DoSAcqqkYjOkRtvD63grcbhgYNdYTFCxw9UvcVow5coiXHi7wY
	vZ7Ohma4pWuagXl7r+N0Foq3VGDLFRiGsuygW5K4qVXuLfOYbBkJ+BHgaEtmBkb5Dvtdv3p/51xmD
	V1NCoBM9gwb8l4sO49B8S/ELelZ+9RsowNIJ3cvIJVJ5AerL87KOJNxPjwjI2iRJ4WgZfqIPvVftI
	Pxw2CJq27WItw5i4mnAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnwAP-00CYfY-Km; Mon, 09 May 2022 05:42:45 +0000
Received: from mail-wm1-f44.google.com ([209.85.128.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnwAE-00CYdG-H3; Mon, 09 May 2022 05:42:36 +0000
Received: by mail-wm1-f44.google.com with SMTP id
 m2-20020a1ca302000000b003943bc63f98so7604749wme.4; 
 Sun, 08 May 2022 22:42:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PgUJQCGuVuN7RMUt/u/GB2vkYIZJaEjDbMnifyGw+XM=;
 b=wPKjJL75FThjNeWbW2dV9I1xVXkApcJForyaoYw2w3z4xn2ibpWni+s3yoQRPT2M/3
 tdWlVHfAtHts/6IzQfrhkwavZd2qlXbkTEBngpxbbWzt2abuFSoYC5xdrHbj7vkAAB8y
 bupnd//EhNeeZ0fV/2Nw7nrXmJOBFAa0DtuQhuB9NuW4+Eo61Y9riPMjU1oE2IegeDQ5
 5BJpbHsimpRpPPyRHvcoFyhFZ+bziCBt65DxEutpqx2Rtc2XPR/NbBMo9bDMioRXNq8L
 GejgS9iM0vfUvyiq07Y0IPn4PM2Ct12E3au2sDv+YFU9xdWy/QPu3ZHaddJutCEtCxez
 nXhA==
X-Gm-Message-State: AOAM532v6Qc9Gp6frSm7FRxZiLB4cfwliJzuh7DqZV++1LjtmhG3gCXM
 oveBaavmjp7MEymJ6cVcdpk=
X-Google-Smtp-Source: ABdhPJwc4eYBOaGWeOZpzdHrP/EzHMr+8axHRm30/zjzwNtxs/nJxF3qH+zPotS6vDu9D2X/XzPbUQ==
X-Received: by 2002:a05:600c:3b11:b0:394:57eb:c58b with SMTP id
 m17-20020a05600c3b1100b0039457ebc58bmr20723567wms.3.1652074950839; 
 Sun, 08 May 2022 22:42:30 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
 by smtp.gmail.com with ESMTPSA id
 d7-20020adffbc7000000b0020c66310845sm9972919wrs.55.2022.05.08.22.42.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 May 2022 22:42:30 -0700 (PDT)
Message-ID: <c0eac83f-8483-7709-b558-561ff7a382b0@kernel.org>
Date: Mon, 9 May 2022 07:42:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v1] serial: meson: acquire port->lock in startup()
Content-Language: en-US
To: John Ogness <john.ogness@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: Petr Mladek <pmladek@suse.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
References: <20220508103547.626355-1-john.ogness@linutronix.de>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20220508103547.626355-1-john.ogness@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220508_224234_627930_80859618 
X-CRM114-Status: GOOD (  26.68  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 08. 05. 22, 12:35, John Ogness wrote:
> The uart_ops startup() callback is called without interrupts
> disabled and without port->lock locked, relatively late during the
> boot process (from the call path of console_on_rootfs()). If the
> device is a console, it was already previously registered and could
> be actively printing messages.
> 
> Since the startup() callback is reading/writing registers used by
> the console write() callback (AML_UART_CONTROL), its access must
> be synchronized using the port->lock. Currently it is not.
> 
> The startup() callback is the only function that explicitly enables
> interrupts. Without the synchronization, it is possible that
> interrupts become accidentally permanently disabled.
> 
> CPU0                           CPU1
> meson_serial_console_write     meson_uart_startup
> --------------------------     ------------------
> spin_lock(port->lock)
> val = readl(AML_UART_CONTROL)
> uart_console_write()
>                                 writel(INT_EN, AML_UART_CONTROL)
> writel(val, AML_UART_CONTROL)
> spin_unlock(port->lock)
> 
> Add port->lock synchronization to meson_uart_startup() to avoid
> racing with meson_serial_console_write().
> 
> Also add detailed comments to meson_uart_reset() explaining why it
> is *not* using port->lock synchronization.
> 
> Link: https://lore.kernel.org/lkml/2a82eae7-a256-f70c-fd82-4e510750906e@samsung.com
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Makes sense to me.

Reviewed-by: Jiri Slaby <jirislaby@kernel.org>

> ---
>   drivers/tty/serial/meson_uart.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
> index 2bf1c57e0981..39021dac09cc 100644
> --- a/drivers/tty/serial/meson_uart.c
> +++ b/drivers/tty/serial/meson_uart.c
> @@ -253,6 +253,14 @@ static const char *meson_uart_type(struct uart_port *port)
>   	return (port->type == PORT_MESON) ? "meson_uart" : NULL;
>   }
>   
> +/*
> + * This function is called only from probe() using a temporary io mapping
> + * in order to perform a reset before setting up the device. Since the
> + * temporarily mapped region was successfully requested, there can be no
> + * console on this port at this time. Hence it is not necessary for this
> + * function to acquire the port->lock. (Since there is no console on this
> + * port at this time, the port->lock is not initialized yet.)
> + */
>   static void meson_uart_reset(struct uart_port *port)
>   {
>   	u32 val;
> @@ -267,9 +275,12 @@ static void meson_uart_reset(struct uart_port *port)
>   
>   static int meson_uart_startup(struct uart_port *port)
>   {
> +	unsigned long flags;
>   	u32 val;
>   	int ret = 0;
>   
> +	spin_lock_irqsave(&port->lock, flags);
> +
>   	val = readl(port->membase + AML_UART_CONTROL);
>   	val |= AML_UART_CLEAR_ERR;
>   	writel(val, port->membase + AML_UART_CONTROL);
> @@ -285,6 +296,8 @@ static int meson_uart_startup(struct uart_port *port)
>   	val = (AML_UART_RECV_IRQ(1) | AML_UART_XMIT_IRQ(port->fifosize / 2));
>   	writel(val, port->membase + AML_UART_MISC);
>   
> +	spin_unlock_irqrestore(&port->lock, flags);
> +
>   	ret = request_irq(port->irq, meson_uart_interrupt, 0,
>   			  port->name, port);
>   
> 
> base-commit: 672c0c5173427e6b3e2a9bbb7be51ceeec78093a


-- 
js
suse labs

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
