Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C4F0C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Feb 2022 12:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nZ13ZiZrARpMWNMLnMuDtCdf8CfLZGFRAkyj54Em8vk=; b=Zq6XBVe1WOoN0B
	gCbvLaMB1Fe0MbwuYTRHa7XIASWOmR/1365N6fkz1DIK87NRKR5EI0BcieCHd+0vS/O/hIN5IRY6s
	0x+af1et0pXC6TyFJABJuPwhTGvlg/hqJ/ilBrNiWDe5ZomWwbDvO/4pcZc5/aHkovnPlmG7no8lx
	ylQVLWwFr0jNNX4YU2Vyy74ZFzy3v63asrBiVsHDi23akykgLn5bf5xxBC998LrdsguC0Vpg7isru
	R35Vudr20Pun7SuhiJvELezOeRHUdMitm2OeUC5DYzkOnECb6/zBR7+mB8FpU1rcA8RKrjQ3jYUud
	53m17A1TxAzBON6GNtYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOejk-00C3EQ-Df; Mon, 28 Feb 2022 12:02:44 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOe7Y-00Bpey-RU
 for linux-amlogic@lists.infradead.org; Mon, 28 Feb 2022 11:23:22 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 bg31-20020a05600c3c9f00b00381590dbb33so1999280wmb.3
 for <linux-amlogic@lists.infradead.org>; Mon, 28 Feb 2022 03:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=I0M73zgTm6fdqFCSX4Mv+soIOBZTm2a5gGNcio24Bk8=;
 b=8KpgDRfWd4FFY6XIkzTwkIrKnjDHFyllXpUF2qr3r/8Yz6muqSJocj1AosxCfJCzM4
 eKRBlKzaTsvaGvhCGppFYVCyV86r0Tl1sNLz7tnguwgI7+poRYYgJr+48hCaooxwZikm
 Si4R1uxQJJJzhIxNQEdHdyo+wpb4uDzoB3oVpzlgEptiqkifxBjKMFltSavqK+bKkq1u
 7hUYoXAd7m+2dOzCMRSgslpnPjTgeGIFrS1vuCEagc2/ZgLBpZ9ebB80rTlCEDTMP/cx
 lgb4WskYOoIIP0h9FDyTj/OLHTHXTYXNa8lfeNUPQih0f8ea+1AI6n/aWneiIzQIXZQp
 g48g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=I0M73zgTm6fdqFCSX4Mv+soIOBZTm2a5gGNcio24Bk8=;
 b=EMqyHonLbxc/dYh4XaDzFpk1r0hLTkV4/c8r1hha89z5C4vONjLvke9aYZfBgiQYh5
 VW64qtXnFkQl9OK2qZbMrayF/agmZGNrEj9MOZO9R+zlgAdZ6rZshHM1lC4DSN3t5Orl
 /Vd79kYKBt8EJ8k9QCaEp6lv3eHo/syV4OiurHTIHckksOKzO+MlE7nvOKMnpsbxd1tY
 u0nMJjjJBgpZmtAmshSCPgQRCL8z1VO4C71tVALntERMG/NJe726wiEi2KtRaC+V9Lgo
 1euZNY71bIoT4IkI6eomKuQbYMeDNWLPyVnnrBdkfpYsjjJiLlklqIB/ziMDpJNKLxhp
 QDqg==
X-Gm-Message-State: AOAM532BwJq+AqFCMWbe+aqVv+R5Gl98IZkan8MJ6bPTXXukkxNluHxp
 cyFFu8AT9D7cqXXgc7MTB1vOnA==
X-Google-Smtp-Source: ABdhPJxlKXYK5UdjvSS5Z7A5mUd4ORlOr+vm7qeM6WOdupvKCpL9vwTi9yjzhVQUU7m1W9jhLUBt1Q==
X-Received: by 2002:a05:600c:a0a:b0:350:564b:d55e with SMTP id
 z10-20020a05600c0a0a00b00350564bd55emr12581037wmp.124.1646047395422; 
 Mon, 28 Feb 2022 03:23:15 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31]) by smtp.gmail.com with ESMTPSA id
 g6-20020a05600c4ec600b0037bf934bca3sm15943128wmq.17.2022.02.28.03.23.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 03:23:14 -0800 (PST)
References: <20220225073922.3947-1-yu.tu@amlogic.com>
 <20220225073922.3947-4-yu.tu@amlogic.com>
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu Tu <yu.tu@amlogic.com>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH V7 3/6] tty: serial: meson: Describes the calculation of
 the UART baud rate clock using a clock frame
Date: Mon, 28 Feb 2022 12:10:36 +0100
In-reply-to: <20220225073922.3947-4-yu.tu@amlogic.com>
Message-ID: <1j4k4jxmji.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_032316_961982_9A8CFA88 
X-CRM114-Status: GOOD (  32.04  )
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


On Fri 25 Feb 2022 at 15:39, Yu Tu <yu.tu@amlogic.com> wrote:

> Using the common Clock code to describe the UART baud rate clock
> makes it easier for the UART driver to be compatible with the
> baud rate requirements of the UART IP on different meson chips.
>
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---
>  drivers/tty/serial/meson_uart.c | 194 +++++++++++++++++++++++---------
>  1 file changed, 142 insertions(+), 52 deletions(-)
>
> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
> index 7570958d010c..4768d51fac70 100644
> --- a/drivers/tty/serial/meson_uart.c
> +++ b/drivers/tty/serial/meson_uart.c
> @@ -6,6 +6,7 @@
>   */
>  
>  #include <linux/clk.h>
> +#include <linux/clk-provider.h>
>  #include <linux/console.h>
>  #include <linux/delay.h>
>  #include <linux/init.h>
> @@ -65,9 +66,7 @@
>  #define AML_UART_RECV_IRQ(c)		((c) & 0xff)
>  
>  /* AML_UART_REG5 bits */
> -#define AML_UART_BAUD_MASK		0x7fffff
>  #define AML_UART_BAUD_USE		BIT(23)
> -#define AML_UART_BAUD_XTAL		BIT(24)
>  
>  #define AML_UART_PORT_NUM		12
>  #define AML_UART_PORT_OFFSET		6
> @@ -76,6 +75,11 @@
>  #define AML_UART_POLL_USEC		5
>  #define AML_UART_TIMEOUT_USEC		10000
>  
> +struct meson_uart_data {
> +	struct clk	*baud_clk;
> +	bool		use_xtal_clk;
> +};
> +
>  static struct uart_driver meson_uart_driver;
>  
>  static struct uart_port *meson_ports[AML_UART_PORT_NUM];
> @@ -293,19 +297,17 @@ static int meson_uart_startup(struct uart_port *port)
>  
>  static void meson_uart_change_speed(struct uart_port *port, unsigned long baud)
>  {
> +	struct meson_uart_data *private_data = port->private_data;
>  	u32 val;
>  
>  	while (!meson_uart_tx_empty(port))
>  		cpu_relax();
>  
> -	if (port->uartclk == 24000000) {
> -		val = ((port->uartclk / 3) / baud) - 1;
> -		val |= AML_UART_BAUD_XTAL;
> -	} else {
> -		val = ((port->uartclk * 10 / (baud * 4) + 5) / 10) - 1;
> -	}
> +	val = readl(port->membase + AML_UART_REG5);
>  	val |= AML_UART_BAUD_USE;
>  	writel(val, port->membase + AML_UART_REG5);
> +
> +	clk_set_rate(private_data->baud_clk, baud);
>  }
>  
>  static void meson_uart_set_termios(struct uart_port *port,
> @@ -395,11 +397,20 @@ static int meson_uart_verify_port(struct uart_port *port,
>  
>  static void meson_uart_release_port(struct uart_port *port)
>  {
> -	/* nothing to do */
> +	struct meson_uart_data *private_data = port->private_data;
> +
> +	clk_disable_unprepare(private_data->baud_clk);
>  }
>  
>  static int meson_uart_request_port(struct uart_port *port)
>  {
> +	struct meson_uart_data *private_data = port->private_data;
> +	int ret;
> +
> +	ret = clk_prepare_enable(private_data->baud_clk);
> +	if (ret)
> +		return ret;
> +

I think we already discussed that. This is yet another behavior change
Previously, enabling the clock was done at probe time.

It's fine to change it, if there is a justification, but not in the same
change as the rework of the divider

>  	return 0;
>  }
>  
> @@ -629,57 +640,106 @@ static struct uart_driver meson_uart_driver = {
>  	.cons		= MESON_SERIAL_CONSOLE,
>  };
>  
> -static inline struct clk *meson_uart_probe_clock(struct device *dev,
> -						 const char *id)
> -{
> -	struct clk *clk = NULL;
> -	int ret;
> -
> -	clk = devm_clk_get(dev, id);
> -	if (IS_ERR(clk))
> -		return clk;
> -
> -	ret = clk_prepare_enable(clk);
> -	if (ret) {
> -		dev_err(dev, "couldn't enable clk\n");
> -		return ERR_PTR(ret);
> -	}
> +static const struct clk_div_table xtal_div_table[] = {
> +	{ 0, 3 },
> +	{ 1, 1 },
> +	{ 2, 2 },
> +	{ 3, 2 },
> +};
>  
> -	devm_add_action_or_reset(dev,
> -			(void(*)(void *))clk_disable_unprepare,
> -			clk);
> +static u32 use_xtal_mux_table;
>  
> -	return clk;
> -}
> -
> -static int meson_uart_probe_clocks(struct platform_device *pdev,
> -				   struct uart_port *port)
> +static int meson_uart_probe_clocks(struct uart_port *port)
>  {
> -	struct clk *clk_xtal = NULL;
> -	struct clk *clk_pclk = NULL;
> -	struct clk *clk_baud = NULL;
> +	struct meson_uart_data *private_data = port->private_data;
> +	struct clk *clk_baud, *clk_xtal;
> +	struct clk_hw *hw, *clk81_div4_hw;
> +	char clk_name[32];
> +	struct clk_parent_data use_xtal_mux_parents;
>  
> -	clk_pclk = meson_uart_probe_clock(&pdev->dev, "pclk");
> -	if (IS_ERR(clk_pclk))
> -		return PTR_ERR(clk_pclk);
> +	clk_baud = devm_clk_get(port->dev, "baud");
> +	if (IS_ERR(clk_baud)) {
> +		dev_err(port->dev, "Failed to get the 'baud' clock\n");
> +		return PTR_ERR(clk_baud);
> +	}

Calling devm_clk_get() would not be necessary if you used "fw_name" in
the parent table. Same bellow

>  
> -	clk_xtal = meson_uart_probe_clock(&pdev->dev, "xtal");
> +	clk_xtal = devm_clk_get(port->dev, "xtal");
>  	if (IS_ERR(clk_xtal))
> -		return PTR_ERR(clk_xtal);
> -
> -	clk_baud = meson_uart_probe_clock(&pdev->dev, "baud");
> -	if (IS_ERR(clk_baud))
> -		return PTR_ERR(clk_baud);
> +		return dev_err_probe(port->dev, PTR_ERR(clk_xtal),
> +				     "Failed to get the 'xtal' clock\n");
> +
> +	snprintf(clk_name, sizeof(clk_name), "%s#%s", dev_name(port->dev),
> +		 "clk81_div4");
> +	clk81_div4_hw = devm_clk_hw_register_fixed_factor(port->dev,
> +							  clk_name,
> +							  __clk_get_name(clk_baud),
> +							  CLK_SET_RATE_NO_REPARENT,
> +							  1, 4);
> +	if (IS_ERR(clk81_div4_hw))
> +		return PTR_ERR(clk81_div4_hw);

So, whatever the chip type - you register a fixed 4 divider ....

> +
> +	snprintf(clk_name, sizeof(clk_name), "%s#%s", dev_name(port->dev),
> +		 "xtal_div");
> +	hw = devm_clk_hw_register_divider_table(port->dev,
> +						clk_name,
> +						__clk_get_name(clk_baud),
> +						CLK_SET_RATE_NO_REPARENT,
> +						port->membase + AML_UART_REG5,
> +						26, 2,
> +						CLK_DIVIDER_READ_ONLY,
> +						xtal_div_table, NULL);
> +	if (IS_ERR(hw))
> +		return PTR_ERR(hw);
> +
> +	if (private_data->use_xtal_clk) {
> +		use_xtal_mux_table = 1;
> +		use_xtal_mux_parents.hw = hw;
> +	} else {
> +		use_xtal_mux_parents.hw = clk81_div4_hw;

... which you may end up not using in the end
This is bad.

> +	}
>  
> -	port->uartclk = clk_get_rate(clk_baud);
> +	snprintf(clk_name, sizeof(clk_name), "%s#%s", dev_name(port->dev),
> +		 "use_xtal");
> +	hw = __devm_clk_hw_register_mux(port->dev, NULL,
> +					clk_name,
> +					1,
> +					NULL, NULL,
> +					&use_xtal_mux_parents,
> +					CLK_SET_RATE_PARENT,
> +					port->membase + AML_UART_REG5,
> +					24, 0x1,
> +					CLK_MUX_READ_ONLY,
> +					&use_xtal_mux_table, NULL);
> +
> +	if (IS_ERR(hw))
> +		return PTR_ERR(hw);
> +
> +	port->uartclk = clk_hw_get_rate(hw);
> +
> +	snprintf(clk_name, sizeof(clk_name), "%s#%s", dev_name(port->dev),
> +		 "baud_div");
> +	hw = devm_clk_hw_register_divider(port->dev,
> +					  clk_name,
> +					  clk_hw_get_name(hw),
> +					  CLK_SET_RATE_PARENT,
> +					  port->membase + AML_UART_REG5,
> +					  0, 23,
> +					  CLK_DIVIDER_ROUND_CLOSEST,
> +					  NULL);
> +	if (IS_ERR(hw))
> +		return PTR_ERR(hw);
> +
> +	private_data->baud_clk = hw->clk;
>  
>  	return 0;
>  }
>  
>  static int meson_uart_probe(struct platform_device *pdev)
>  {
> +	struct meson_uart_data *private_data;
>  	struct resource *res_mem;
>  	struct uart_port *port;
> +	struct clk *pclk;
>  	u32 fifosize = 64; /* Default is 64, 128 for EE UART_0 */
>  	int ret = 0;
>  	int irq;
> @@ -705,6 +765,15 @@ static int meson_uart_probe(struct platform_device *pdev)
>  	if (!res_mem)
>  		return -ENODEV;
>  
> +	pclk = devm_clk_get(&pdev->dev, "pclk");
> +	if (IS_ERR(pclk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(pclk),
> +				     "Failed to get the 'pclk' clock\n");
> +
> +	ret = clk_prepare_enable(pclk);
> +	if (ret)
> +		return ret;
> +
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq < 0)
>  		return irq;
> @@ -724,9 +793,13 @@ static int meson_uart_probe(struct platform_device *pdev)
>  	if (IS_ERR(port->membase))
>  		return PTR_ERR(port->membase);
>  
> -	ret = meson_uart_probe_clocks(pdev, port);
> -	if (ret)
> -		return ret;
> +	private_data = devm_kzalloc(&pdev->dev, sizeof(*private_data),
> +				    GFP_KERNEL);
> +	if (!private_data)
> +		return -ENOMEM;
> +
> +	if (device_get_match_data(&pdev->dev))
> +		private_data->use_xtal_clk = true;

As long as the device matches a compatible below, the flag will end up
'true', regardless of values in the the dt_match table.

I don't think this is the intended behavior.
It highlights that proper testing of this series is important.

Being at Amlogic, I'm sure you can test on more than just g12a and s4

>  
>  	port->iotype = UPIO_MEM;
>  	port->mapbase = res_mem->start;
> @@ -740,6 +813,11 @@ static int meson_uart_probe(struct platform_device *pdev)
>  	port->x_char = 0;
>  	port->ops = &meson_uart_ops;
>  	port->fifosize = fifosize;
> +	port->private_data = private_data;
> +
> +	ret = meson_uart_probe_clocks(port);
> +	if (ret)
> +		return ret;
>  
>  	meson_ports[pdev->id] = port;
>  	platform_set_drvdata(pdev, port);
> @@ -766,10 +844,22 @@ static int meson_uart_remove(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id meson_uart_dt_match[] = {
> -	{ .compatible = "amlogic,meson6-uart" },
> -	{ .compatible = "amlogic,meson8-uart" },
> -	{ .compatible = "amlogic,meson8b-uart" },
> -	{ .compatible = "amlogic,meson-gx-uart" },
> +	{
> +		.compatible = "amlogic,meson6-uart",
> +		.data = (void *)false,
> +	},
> +	{
> +		.compatible = "amlogic,meson8-uart",
> +		.data = (void *)false,
> +	},
> +	{
> +		.compatible = "amlogic,meson8b-uart",
> +		.data = (void *)false,
> +	},
> +	{
> +		.compatible = "amlogic,meson-gx-uart",
> +		.data = (void *)true,
> +	},
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, meson_uart_dt_match);


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
