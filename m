Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16A0C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 Apr 2022 12:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M6Br2tj+l0CfP3e0G3UG9tNboEChghl/I4vgDHjcqoM=; b=VcaFuUC0uNsj7Z
	g/TXO7IxPlLcEeNTH4KrArfsI/fWEta0MDlgOFsPN+PSMjzK8wB4kRCzjhm69ogOxFPGAydKaUQrA
	5ykYGpc+nVkDFNXwcop50GP36zGH8t3wK6qI8J5LOaIlOryvlSTpJuntOv+ckGypu0g+QSp5L0hXj
	3+l10ylb78F6xJMpD/bkitDb4SRZSn16jINpwbaKaEXUgPHS9OHNDeZAr4mEtcL72fQFMxLzjW0iG
	70I4wSgQlec2JM78zXTpKL+sYt1Ggc7Dez0rvVSROaHvU5qNrUIKOZBVjEmOQ8iPcjTqYgQuj7d69
	HyP9IAuF63w02Rim8cQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhsQe-000P2j-DV; Fri, 22 Apr 2022 12:30:28 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhsQO-000OvR-CE
 for linux-amlogic@lists.infradead.org; Fri, 22 Apr 2022 12:30:15 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 n40-20020a05600c3ba800b0038ff1939b16so5292066wms.2
 for <linux-amlogic@lists.infradead.org>; Fri, 22 Apr 2022 05:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=v7ecTnOqbdsbk7Pw227c6DG9vOtIAPt6MKtYrhXpkiQ=;
 b=VwVPMiD+CefKqOujb+T8az2fLb5De9m+2SHuVfSXI8rwPC3AyUz3yEXjXhB3muH1Yx
 A2XlvIC8M0k593cQ/tEekEYlQgwNyfDYKyl6zd6yLpGnb74/wHAPF2On4IB2y22Y3uC/
 orBwzbK0jKpsYybd545214GpzMCk3VRBioGmOZOoeFDq2dDVyg2jI+J5XCoHtFk8uV9k
 FFZBe7waycOAg9fkM0w4cTIGJIVhadLq1zwhPp7RcH+FY1M1GAET5ag4oC6sXMZIq61t
 b6pOpvMjiPW6KDWftcBNkPnWMjTAeoftFC1NM4beVi7fit/eC3c409yCsQmoTY6swysk
 CmKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=v7ecTnOqbdsbk7Pw227c6DG9vOtIAPt6MKtYrhXpkiQ=;
 b=6xxuVO4LythDYFF883f9d8HFI0tsLi967jripxq9Tz8jJU2AA+8pDUfjck3+bmDW60
 Pg01d7giTZO+Ey/V3p7AoemOOb+w1vp+4whfo1qMUJtTY7y7yKjM9zETgyX295nZvp7v
 uvgA3orRqqmcJi6mKU6Z7KkcrHYaP/CbAJl7LKkPEcgnTaBmbb8ZtFvABz00JCJ+bliu
 PDRDYHUbUImvM/hXeyky2Z+nBda3/3u1akCuJJa0Q0cuQlVhLj6KNxd4Nvm0tH55x0Lj
 MeSNAeKOjSmsIzknNmMzagS4n/kr6MILI6lcfx/W45Fxd7Z8YueG4Fp39M6pnUoy0wi6
 ujZQ==
X-Gm-Message-State: AOAM530vQ01TVDw17DX1VQb6AhG8gUOATuvdEKoasuR/GJDqkm9b9Jy6
 yJ7VbgSpBuUVoEhJdom/EBfWxw==
X-Google-Smtp-Source: ABdhPJyAlAVcFMr1BGoeseZyuFPXHnY5LyfLff3YpdPx7SxnhN6lS408cqrbj01PbjPgGfIF3POBbQ==
X-Received: by 2002:a1c:29c3:0:b0:350:9797:b38f with SMTP id
 p186-20020a1c29c3000000b003509797b38fmr13456690wmp.22.1650630608626; 
 Fri, 22 Apr 2022 05:30:08 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:3ce1:1ed1:5e14:cd49?
 ([2001:861:44c0:66c0:3ce1:1ed1:5e14:cd49])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a5d47ca000000b0020a992ce354sm1930835wrc.76.2022.04.22.05.30.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 05:30:07 -0700 (PDT)
Message-ID: <d4d7e8a1-6eee-ac2d-cf8f-0a71dd4dabd8@baylibre.com>
Date: Fri, 22 Apr 2022 14:30:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V3 1/2] tty: serial: meson: Add a 12MHz internal clock
 rate to calculate baud rate in order to meet the baud rate requirements of
 special BT modules
Content-Language: en-US
To: Yu Tu <yu.tu@amlogic.com>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220422111320.19234-1-yu.tu@amlogic.com>
 <20220422111320.19234-2-yu.tu@amlogic.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220422111320.19234-2-yu.tu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_053012_483123_013F8075 
X-CRM114-Status: GOOD (  19.44  )
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

On 22/04/2022 13:13, Yu Tu wrote:
> A /2 divider over XTAL was introduced since G12A, and is preferred
> to be used over the still present /3 divider since it provides much
> closer frequencies vs the request baudrate. Especially the BT module
> uses 3Mhz baud rate. 8Mhz calculations can lead to baud rate bias,
> causing some problems.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---
>   drivers/tty/serial/meson_uart.c | 17 +++++++++++++++--
>   1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
> index 8e59624935af..58bd2723c004 100644
> --- a/drivers/tty/serial/meson_uart.c
> +++ b/drivers/tty/serial/meson_uart.c
> @@ -68,6 +68,7 @@
>   #define AML_UART_BAUD_MASK		0x7fffff
>   #define AML_UART_BAUD_USE		BIT(23)
>   #define AML_UART_BAUD_XTAL		BIT(24)
> +#define AML_UART_BAUD_XTAL_DIV2		BIT(27)
>   
>   #define AML_UART_PORT_NUM		12
>   #define AML_UART_PORT_OFFSET		6
> @@ -80,6 +81,10 @@ static struct uart_driver meson_uart_driver;
>   
>   static struct uart_port *meson_ports[AML_UART_PORT_NUM];
>   
> +struct meson_uart_data {
> +	bool has_xtal_div2;
> +};
> +
>   static void meson_uart_set_mctrl(struct uart_port *port, unsigned int mctrl)
>   {
>   }
> @@ -293,13 +298,20 @@ static int meson_uart_startup(struct uart_port *port)
>   
>   static void meson_uart_change_speed(struct uart_port *port, unsigned long baud)
>   {
> -	u32 val;
> +	const struct meson_uart_data *private_data = port->private_data;
> +	u32 val = 0;
>   
>   	while (!meson_uart_tx_empty(port))
>   		cpu_relax();
>   
>   	if (port->uartclk == 24000000) {
> -		val = DIV_ROUND_CLOSEST(port->uartclk / 3, baud) - 1;
> +		unsigned int xtal_div = 3;
> +
> +		if (private_data && private_data->has_xtal_div2) {
> +			xtal_div = 2;
> +			val |= AML_UART_BAUD_XTAL_DIV2;
> +		}
> +		val |= DIV_ROUND_CLOSEST(port->uartclk / xtal_div, baud) - 1;
>   		val |= AML_UART_BAUD_XTAL;
>   	} else {
>   		val =  DIV_ROUND_CLOSEST(port->uartclk / 4, baud) - 1;
> @@ -749,6 +761,7 @@ static int meson_uart_probe(struct platform_device *pdev)
>   	port->x_char = 0;
>   	port->ops = &meson_uart_ops;
>   	port->fifosize = fifosize;
> +	port->private_data = (void *)device_get_match_data(&pdev->dev);
>   
>   	meson_ports[pdev->id] = port;
>   	platform_set_drvdata(pdev, port);

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
