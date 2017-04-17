From: ben.dooks@codethink.co.uk (Ben Dooks)
Date: Mon, 17 Apr 2017 14:52:43 +0100
Subject: [PATCH 6/6] serial: meson: change interrupt description to of
 node name
In-Reply-To: <9fedf07e-5502-bcf6-fd97-7699659bf4ac@gmail.com>
References: <d16f695a-42b2-dfc2-0e53-df110f5a8389@gmail.com>
 <9fedf07e-5502-bcf6-fd97-7699659bf4ac@gmail.com>
Message-ID: <c1953813-f161-5c9c-72e6-55d7d7efbe1a@codethink.co.uk>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 16/04/17 21:23, Heiner Kallweit wrote:
> Change interrupt description from driver name to of node name.
> If multiple serial ports are enabled this allows to determine
> which interrupt belongs to which port in /proc/interrupts.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/tty/serial/meson_uart.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
> index c8b626e3..d0682231 100644
> --- a/drivers/tty/serial/meson_uart.c
> +++ b/drivers/tty/serial/meson_uart.c
> @@ -286,7 +286,7 @@ static int meson_uart_startup(struct uart_port *port)
>  	writel(val, port->membase + AML_UART_MISC);
>
>  	ret = request_irq(port->irq, meson_uart_interrupt, 0,
> -			  meson_uart_type(port), port);
> +			  dev_name(port->dev), port);
>
>  	return ret;
>  }

Good idea.


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius
