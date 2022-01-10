Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C91C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jan 2022 12:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+aNW6emFcwM+vG305XQtPj7BinAn4SinDZN3J+FE4yY=; b=O2JibAxTeKApQ4
	3XK+0dOf7wouMnxmEiPsJJmcYBpniJrTZqjqdALrr3zaTb3pk2H/UO2xIu+vduF2mlKaJbKDIaOBA
	e6vEm4sdfgL4GpJFTBXqeS9u+3qM9mt387TrukoztNITd5ESsdWOXC7RLrB8O7wTOs6p/GUBQlJMP
	eGdHabjWiUFqTPZdfytbWJ1tm3szSWtupc/ltB+ALq5OpYjy2YJF81W8zm9VmSEX/fr9hXjL/4eVy
	X+JrLL9dtoVzYHo47nCvtUvlUwh0NXxZKP8a6mgJaCh4YMhDAlKwnTeahFNqvYmsZSO9pQ3eFfrH4
	qniQjDoU5BAYE2M2auxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6tWw-00BIH3-J0; Mon, 10 Jan 2022 12:12:06 +0000
Received: from mail-ed1-f47.google.com ([209.85.208.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6tWj-00BICs-FB; Mon, 10 Jan 2022 12:11:55 +0000
Received: by mail-ed1-f47.google.com with SMTP id k15so52533037edk.13;
 Mon, 10 Jan 2022 04:11:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=T+iudPL3VsSt2x3iV93K9ZbDpXljZOLz6OJ0OF++B6M=;
 b=sU9hlETLvKPbPNkFjzAxZxWYOkT6SMFMJjVLGrXpBg+B1GucEuDizjCsmtmk8GAbS5
 PGBahrkoVPuWjkQr1BSeHQTTCFhRLZPMujXLl3+5mlNg6FOG97kviDDFYLmTCTjPZDg+
 V+EFVBrp11woF54qqR9W/YHELK0ZB5IeNefDB/zLxuG06zInRi7pnlTepPxy93JFqJmM
 T+nSlWlAcgZpWyKBt6nUpzHKwkqb89o5pG+G3XWxUki5IP18oLfBhMqs86eGtYvv64X1
 0R/Woq+6IkcHIrkZvZxbMfIHH8rJ+g7vNU5qp7QjxLaAsuCPfkHodrhiKBGtH8NMx03P
 l8Ig==
X-Gm-Message-State: AOAM532YPVx4d9V5730TMMR43fkD8wSKXoO4eJVw1bd2dojYO9bj0/Gq
 eyUxVdMcLUke26cCttXrgfk=
X-Google-Smtp-Source: ABdhPJzif/Q6w3VWyChKykI+EyyNWMu2HjoCoAm9Z3a7c06y9baypapeH1oO72ya4VqWTG2OIpc8YA==
X-Received: by 2002:a17:906:f01:: with SMTP id
 z1mr29711599eji.346.1641816712256; 
 Mon, 10 Jan 2022 04:11:52 -0800 (PST)
Received: from ?IPV6:2a0b:e7c0:0:107::49? ([2a0b:e7c0:0:107::49])
 by smtp.gmail.com with ESMTPSA id d9sm3436280edy.55.2022.01.10.04.11.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 04:11:51 -0800 (PST)
Message-ID: <327f985f-bbf1-00ba-d203-cc9d5bbd955c@kernel.org>
Date: Mon, 10 Jan 2022 13:11:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH V5 3/5] tty: serial: meson: Using the common clock code
 describe.
Content-Language: en-US
To: Yu Tu <yu.tu@amlogic.com>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220110104214.25321-1-yu.tu@amlogic.com>
 <20220110104214.25321-4-yu.tu@amlogic.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20220110104214.25321-4-yu.tu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_041153_558208_A36A2605 
X-CRM114-Status: GOOD (  29.42  )
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

Hi,

"Subject: Using the common clock code describe."

Please reformulate that ^^^ -- I cannot make any sense of it. And avoid 
adding a period to the subject. PLease see others' commit logs.

On 10. 01. 22, 11:42, Yu Tu wrote:
> Using the common Clock code to describe the UART baud rate clock
> makes it easier for the UART driver to be compatible with the
> baud rate requirements of the UART IP on different meson chips.



> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---
>   drivers/tty/serial/meson_uart.c | 224 +++++++++++++++++++++++---------
>   1 file changed, 163 insertions(+), 61 deletions(-)
> 
> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
> index 7570958d010c..1004fd0b0c9e 100644
> --- a/drivers/tty/serial/meson_uart.c
> +++ b/drivers/tty/serial/meson_uart.c
> @@ -6,6 +6,7 @@
>    */
>   
>   #include <linux/clk.h>
> +#include <linux/clk-provider.h>
>   #include <linux/console.h>
>   #include <linux/delay.h>
>   #include <linux/init.h>
> @@ -65,9 +66,7 @@
>   #define AML_UART_RECV_IRQ(c)		((c) & 0xff)
>   
>   /* AML_UART_REG5 bits */
> -#define AML_UART_BAUD_MASK		0x7fffff
>   #define AML_UART_BAUD_USE		BIT(23)
> -#define AML_UART_BAUD_XTAL		BIT(24)
>   
>   #define AML_UART_PORT_NUM		12
>   #define AML_UART_PORT_OFFSET		6
> @@ -76,6 +75,13 @@
>   #define AML_UART_POLL_USEC		5
>   #define AML_UART_TIMEOUT_USEC		10000
>   
> +struct meson_uart_data {
> +	struct uart_port	port;
> +	struct clk		*pclk;
> +	struct clk		*baud_clk;
> +	bool			use_xtal_clk;
> +};
> +
>   static struct uart_driver meson_uart_driver;
>   
>   static struct uart_port *meson_ports[AML_UART_PORT_NUM];
> @@ -268,14 +274,11 @@ static void meson_uart_reset(struct uart_port *port)
>   static int meson_uart_startup(struct uart_port *port)
>   {
>   	u32 val;
> -	int ret = 0;
> +	int ret;
>   
> -	val = readl(port->membase + AML_UART_CONTROL);
> -	val |= AML_UART_CLEAR_ERR;
> -	writel(val, port->membase + AML_UART_CONTROL);
> -	val &= ~AML_UART_CLEAR_ERR;
> -	writel(val, port->membase + AML_UART_CONTROL);
> +	meson_uart_reset(port);

Why is this OK? We didn't use to reset it.

And why is this not done in a separate patch?


> +	val = readl(port->membase + AML_UART_CONTROL);
>   	val |= (AML_UART_RX_EN | AML_UART_TX_EN);
>   	writel(val, port->membase + AML_UART_CONTROL);
>   
> @@ -293,19 +296,17 @@ static int meson_uart_startup(struct uart_port *port)
>   
>   static void meson_uart_change_speed(struct uart_port *port, unsigned long baud)
>   {
> +	struct meson_uart_data *private_data = port->private_data;
>   	u32 val;
>   
>   	while (!meson_uart_tx_empty(port))
>   		cpu_relax();
>   
> -	if (port->uartclk == 24000000) {
> -		val = ((port->uartclk / 3) / baud) - 1;
> -		val |= AML_UART_BAUD_XTAL;
> -	} else {
> -		val = ((port->uartclk * 10 / (baud * 4) + 5) / 10) - 1;
> -	}
> +	val = readl(port->membase + AML_UART_REG5);
>   	val |= AML_UART_BAUD_USE;
>   	writel(val, port->membase + AML_UART_REG5);
> +
> +	clk_set_rate(private_data->baud_clk, baud);
>   }
>   
>   static void meson_uart_set_termios(struct uart_port *port,
> @@ -395,11 +396,27 @@ static int meson_uart_verify_port(struct uart_port *port,
>   
>   static void meson_uart_release_port(struct uart_port *port)
>   {
> -	/* nothing to do */
> +	struct meson_uart_data *private_data = port->private_data;
> +
> +	clk_disable_unprepare(private_data->baud_clk);
> +	clk_disable_unprepare(private_data->pclk);
>   }
>   
>   static int meson_uart_request_port(struct uart_port *port)
>   {
> +	struct meson_uart_data *private_data = port->private_data;
> +	int ret;
> +
> +	ret = clk_prepare_enable(private_data->pclk);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_prepare_enable(private_data->baud_clk);
> +	if (ret) {
> +		clk_disable_unprepare(private_data->pclk);
> +		return ret;
> +	}
> +
>   	return 0;
>   }
>   
> @@ -629,55 +646,105 @@ static struct uart_driver meson_uart_driver = {
>   	.cons		= MESON_SERIAL_CONSOLE,
>   };
>   
> -static inline struct clk *meson_uart_probe_clock(struct device *dev,
> -						 const char *id)
> +#define CLK_NAME(name) \
> +({\
> +	char clk_name[32];\
> +	snprintf(clk_name, sizeof(clk_name), "%s#%s", dev_name(port->dev), #name);\
> +	clk_name;\
> +})

This is cryptic and duplicates the variable on the stack. Why not expand 
the macro and delete it then?

> +
> +static struct clk_div_table xtal_div_table[] = {
> +	{ 0, 3  },

An extra space here and there:

> +	{ 1, 1  },
> +	{ 2, 2  },
> +	{ 3, 2  },
> +};
> +
> +static int meson_uart_probe_clocks(struct uart_port *port)
>   {
> -	struct clk *clk = NULL;
> -	int ret;
> +	struct meson_uart_data *private_data = port->private_data;
> +	struct clk *clk_baud, *clk_xtal;
> +	struct clk_hw *hw;
> +	struct clk_parent_data use_xtal_mux_parents[2] = {
> +		{ .index = -1, },
> +		{ .index = -1, },
> +	};
>   
> -	clk = devm_clk_get(dev, id);
> -	if (IS_ERR(clk))
> -		return clk;
> +	private_data->pclk = devm_clk_get(port->dev, "pclk");
> +	if (IS_ERR(private_data->pclk))
> +		return dev_err_probe(port->dev, PTR_ERR(private_data->pclk),
> +				     "Failed to get the 'pclk' clock\n");
>   
> -	ret = clk_prepare_enable(clk);
> -	if (ret) {
> -		dev_err(dev, "couldn't enable clk\n");
> -		return ERR_PTR(ret);
> +	clk_baud = devm_clk_get(port->dev, "baud");
> +	if (IS_ERR(clk_baud)) {
> +		dev_err(port->dev, "Failed to get the 'baud' clock\n");
> +		return PTR_ERR(clk_baud);
>   	}
>   
> -	devm_add_action_or_reset(dev,
> -			(void(*)(void *))clk_disable_unprepare,
> -			clk);
> -
> -	return clk;
> -}
> -
> -static int meson_uart_probe_clocks(struct platform_device *pdev,
> -				   struct uart_port *port)
> -{
> -	struct clk *clk_xtal = NULL;
> -	struct clk *clk_pclk = NULL;
> -	struct clk *clk_baud = NULL;
> -
> -	clk_pclk = meson_uart_probe_clock(&pdev->dev, "pclk");
> -	if (IS_ERR(clk_pclk))
> -		return PTR_ERR(clk_pclk);
> -
> -	clk_xtal = meson_uart_probe_clock(&pdev->dev, "xtal");
> +	clk_xtal = devm_clk_get(port->dev, "xtal");
>   	if (IS_ERR(clk_xtal))
> -		return PTR_ERR(clk_xtal);
> -
> -	clk_baud = meson_uart_probe_clock(&pdev->dev, "baud");
> -	if (IS_ERR(clk_baud))
> -		return PTR_ERR(clk_baud);
> +		return dev_err_probe(port->dev, PTR_ERR(clk_xtal),
> +				     "Failed to get the 'xtal' clock\n");
> +
> +	if (private_data->use_xtal_clk) {
> +		hw = devm_clk_hw_register_divider_table(port->dev,
> +							CLK_NAME(xtal_div),
> +							__clk_get_name(clk_baud),
> +							CLK_SET_RATE_NO_REPARENT,
> +							port->membase + AML_UART_REG5,
> +							26, 2,
> +							CLK_DIVIDER_READ_ONLY,
> +							xtal_div_table, NULL);
> +		if (IS_ERR(hw))
> +			return PTR_ERR(hw);
> +
> +		use_xtal_mux_parents[1].hw = hw;
> +	} else {
> +		hw = devm_clk_hw_register_fixed_factor(port->dev,
> +						       CLK_NAME(clk81_div4),
> +						       __clk_get_name(clk_baud),
> +						       CLK_SET_RATE_NO_REPARENT,
> +						       1, 4);
> +		if (IS_ERR(hw))
> +			return PTR_ERR(hw);
> +
> +		use_xtal_mux_parents[0].hw = hw;
> +	}
>   
> -	port->uartclk = clk_get_rate(clk_baud);
> +	hw = __devm_clk_hw_register_mux(port->dev, NULL,
> +					CLK_NAME(use_xtal),
> +					ARRAY_SIZE(use_xtal_mux_parents),
> +					NULL, NULL,
> +					use_xtal_mux_parents,
> +					CLK_SET_RATE_PARENT,
> +					port->membase + AML_UART_REG5,
> +					24, 0x1,
> +					CLK_MUX_READ_ONLY,
> +					NULL, NULL);
> +	if (IS_ERR(hw))
> +		return PTR_ERR(hw);
> +
> +	port->uartclk = clk_hw_get_rate(hw);
> +
> +	hw = devm_clk_hw_register_divider(port->dev,
> +					  CLK_NAME(baud_div),
> +					  clk_hw_get_name(hw),
> +					  CLK_SET_RATE_PARENT,
> +					  port->membase + AML_UART_REG5,
> +					  0, 23,
> +					  CLK_DIVIDER_ROUND_CLOSEST,
> +					  NULL);
> +	if (IS_ERR(hw))
> +		return PTR_ERR(hw);
> +
> +	private_data->baud_clk = clk_hw_get_clk(hw, "baud_rate");
>   
>   	return 0;
>   }



-- 
js
suse labs

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
