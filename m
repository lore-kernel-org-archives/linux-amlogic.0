Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 926E3C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jan 2022 09:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OQgoBMPYE6IPyRmkls09SiElyVcChXWlro2Xo5W/RfA=; b=HOqMsJt9KwI3HG
	q02wJfgC+HF0P11uVWYgoP82L2rWA0LoheT2dvwJjlsb7ZAgrEzCBd0JjE5CmYZ+Gmg84wGcr9DAH
	0O5/hjXQrFER8Lri37LA8xv0DHu+56WUg6jVanKJ0u3npU1fgFgeW00Kb9fuTY12i+xTzV3Sdxf3a
	LPIxLsDeHbuacXnn9udx9JpIdiK8/WtzfIxeqyOBXRwUMWxlhQ9EErQN8b/P7VH+93cP736ZNRVMn
	ftsi311hWH9nEhSLJJ92C6t2YeZvStnHaN/aRM3kuehsMHLoaWdpSQFfZjGcnhugZf+FHn+wE1JLR
	GiPv9RNfKOhqFuGnktgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6qfd-00AC7M-Dc; Mon, 10 Jan 2022 09:08:53 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6qSC-00A58P-Of; Mon, 10 Jan 2022 08:55:02 +0000
Received: from [10.18.29.173] (10.18.29.173) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 10 Jan
 2022 16:54:58 +0800
Message-ID: <79e4a4d1-eefd-9fa2-d365-192f28f4c9c8@amlogic.com>
Date: Mon, 10 Jan 2022 16:54:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] tty: serial: meson: Change request_irq to
 devm_request_irq and move devm_request_irq to meson_uart_probe()
Content-Language: en-US
To: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Neil Armstrong
 <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
References: <20220110082616.13474-1-yu.tu@amlogic.com>
 <20220110082616.13474-2-yu.tu@amlogic.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <20220110082616.13474-2-yu.tu@amlogic.com>
X-Originating-IP: [10.18.29.173]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_005500_875210_C825AAD6 
X-CRM114-Status: GOOD (  14.38  )
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

Hi All,
	I'm really sorry for sending the wrong specified file. Please ignore 
the email. I will resend V4.

On 2022/1/10 16:26, Yu Tu wrote:
> Because an interrupt error occurs when the user opens /dev/ttyAML* but
> don't close it, and then opens the same port again. This problem is
> encountered in actual projects.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---
>   drivers/tty/serial/meson_uart.c | 16 +++++++++-------
>   1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
> index 45e41f20cba3..0dd3f5b35768 100644
> --- a/drivers/tty/serial/meson_uart.c
> +++ b/drivers/tty/serial/meson_uart.c
> @@ -135,8 +135,6 @@ static void meson_uart_shutdown(struct uart_port *port)
>   	unsigned long flags;
>   	u32 val;
>   
> -	free_irq(port->irq, port);
> -
>   	spin_lock_irqsave(&port->lock, flags);
>   
>   	val = readl(port->membase + AML_UART_CONTROL);
> @@ -284,7 +282,6 @@ static void meson_uart_reset(struct uart_port *port)
>   static int meson_uart_startup(struct uart_port *port)
>   {
>   	u32 val;
> -	int ret;
>   
>   	meson_uart_reset(port);
>   
> @@ -298,10 +295,7 @@ static int meson_uart_startup(struct uart_port *port)
>   	val = (AML_UART_RECV_IRQ(1) | AML_UART_XMIT_IRQ(port->fifosize / 2));
>   	writel(val, port->membase + AML_UART_MISC);
>   
> -	ret = request_irq(port->irq, meson_uart_interrupt, 0,
> -			  port->name, port);
> -
> -	return ret;
> +	return 0;
>   }
>   
>   static void meson_uart_change_speed(struct uart_port *port, unsigned long baud)
> @@ -908,6 +902,14 @@ static int meson_uart_probe(struct platform_device *pdev)
>   	meson_ports[pdev->id] = port;
>   	platform_set_drvdata(pdev, port);
>   
> +	ret = devm_request_irq(&pdev->dev, port->irq, meson_uart_interrupt,
> +			       0, dev_name(&pdev->dev), port);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to request uart irq: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
>   	/* reset port before registering (and possibly registering console) */
>   	meson_uart_reset(port);
>   
> 
> base-commit: b3a9e3b9622ae10064826dccb4f7a52bd88c7407
> prerequisite-patch-id: 97a514f3447511cb204179ce03ae99dc1d5902d9
> prerequisite-patch-id: a2e4756ff85f0df0efe111d7e2cb51b8e26e226f
> prerequisite-patch-id: af9e3acc8f6ff7602d3a68a57c008e5ec362b353
> prerequisite-patch-id: 7af8c81b4c2163240725e96625b1487c280f4f30
> prerequisite-patch-id: 8791f6362b14e7c4ff4f85cce550f06abeb1af7a

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
