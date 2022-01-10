Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4062BC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jan 2022 09:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ujN9gtZUF/odeyes9lXagD3y4Hefr5T8Qz8fNzrbZAo=; b=Vys2+/eug8GRF0
	mu1pqJ4z9ArV2efbIwyIVndC0aC5XyWnHdfxdcHpJxmDTS11uGmOHgrQbM8fljWrVldXbaqCu8PYs
	OKVWHmNj75rcHDbSzhcBwWyS+z1OhoWuixq0vda8nMfpZCLEFU0GdZomjhv3S5ylS7taxoaVPhyjT
	AGWIyFRGGHKwlhkMYUzt3flvxnpwe09e9VRE0YCnmciew/418KLgh3T5rDuVKeFTkL2eXoYKbEoFP
	9th39f2K4hfgSKesg0606JJSdw0pqRHGz5XoF15eLQRmqXwznsLDR8mclWwza8svnIDvYtePeY/I7
	5WYDAXjhHgkcyoGcMGcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6qiI-00ADY1-FJ; Mon, 10 Jan 2022 09:11:38 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6qSa-00A5KY-G9; Mon, 10 Jan 2022 08:55:25 +0000
Received: from [10.18.29.173] (10.18.29.173) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 10 Jan
 2022 16:55:22 +0800
Message-ID: <936e828c-15e0-5223-7daa-94b2fafc2602@amlogic.com>
Date: Mon, 10 Jan 2022 16:55:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] tty: serial: meson: Request the register region in
 meson_uart_probe()
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
 <20220110082616.13474-5-yu.tu@amlogic.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <20220110082616.13474-5-yu.tu@amlogic.com>
X-Originating-IP: [10.18.29.173]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_005524_608774_3D4D7C8A 
X-CRM114-Status: GOOD (  15.82  )
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
> This simplifies resetting the UART controller during probe and will make
> it easier to integrate the common clock code which will require the
> registers at probe time as well.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---
>   drivers/tty/serial/meson_uart.c | 24 ++++++------------------
>   1 file changed, 6 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
> index c9a37602ffd0..99efe62a1507 100644
> --- a/drivers/tty/serial/meson_uart.c
> +++ b/drivers/tty/serial/meson_uart.c
> @@ -397,24 +397,11 @@ static int meson_uart_verify_port(struct uart_port *port,
>   
>   static void meson_uart_release_port(struct uart_port *port)
>   {
> -	devm_iounmap(port->dev, port->membase);
> -	port->membase = NULL;
> -	devm_release_mem_region(port->dev, port->mapbase, port->mapsize);
> +	/* nothing to do */
>   }
>   
>   static int meson_uart_request_port(struct uart_port *port)
>   {
> -	if (!devm_request_mem_region(port->dev, port->mapbase, port->mapsize,
> -				     dev_name(port->dev))) {
> -		dev_err(port->dev, "Memory region busy\n");
> -		return -EBUSY;
> -	}
> -
> -	port->membase = devm_ioremap(port->dev, port->mapbase,
> -					     port->mapsize);
> -	if (!port->membase)
> -		return -ENOMEM;
> -
>   	return 0;
>   }
>   
> @@ -728,6 +715,10 @@ static int meson_uart_probe(struct platform_device *pdev)
>   	if (!port)
>   		return -ENOMEM;
>   
> +	port->membase = devm_ioremap_resource(&pdev->dev, res_mem);
> +	if (IS_ERR(port->membase))
> +		return PTR_ERR(port->membase);
> +
>   	ret = meson_uart_probe_clocks(pdev, port);
>   	if (ret)
>   		return ret;
> @@ -749,10 +740,7 @@ static int meson_uart_probe(struct platform_device *pdev)
>   	platform_set_drvdata(pdev, port);
>   
>   	/* reset port before registering (and possibly registering console) */
> -	if (meson_uart_request_port(port) >= 0) {
> -		meson_uart_reset(port);
> -		meson_uart_release_port(port);
> -	}
> +	meson_uart_reset(port);
>   
>   	ret = uart_add_one_port(&meson_uart_driver, port);
>   	if (ret)
> 
> base-commit: b3a9e3b9622ae10064826dccb4f7a52bd88c7407
> prerequisite-patch-id: 97a514f3447511cb204179ce03ae99dc1d5902d9

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
