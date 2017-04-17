From: narmstrong@baylibre.com (Neil Armstrong)
Date: Mon, 17 Apr 2017 17:28:59 +0200
Subject: [PATCH 5/6] serial: meson: remove use of flag UPF_IOREMAP
In-Reply-To: <61829643-8bc1-c70a-bcd7-4a409351adda@gmail.com>
References: <d16f695a-42b2-dfc2-0e53-df110f5a8389@gmail.com>
 <61829643-8bc1-c70a-bcd7-4a409351adda@gmail.com>
Message-ID: <222625d5-925b-47f9-de98-2b9f47fc92e7@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 04/16/2017 10:21 PM, Heiner Kallweit wrote:
> Flag UPF_IOREMAP is used by the 8250 subsystem only, it's not used
> by the serial core. Therefore I don't see any benefit in using it
> here.
> 
> In addition fix the order of calls in meson_uart_release_port.
> Unmapping needs to be done first, reversing call order in
> meson_uart_request_port.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/tty/serial/meson_uart.c | 22 ++++++++--------------
>  1 file changed, 8 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
> index 8d2e7203..c8b626e3 100644
> --- a/drivers/tty/serial/meson_uart.c
> +++ b/drivers/tty/serial/meson_uart.c
> @@ -395,12 +395,9 @@ static int meson_uart_verify_port(struct uart_port *port,
>  
>  static void meson_uart_release_port(struct uart_port *port)
>  {
> -	if (port->flags & UPF_IOREMAP) {
> -		devm_release_mem_region(port->dev, port->mapbase,
> -					port->mapsize);
> -		devm_iounmap(port->dev, port->membase);
> -		port->membase = NULL;
> -	}
> +	devm_iounmap(port->dev, port->membase);
> +	port->membase = NULL;
> +	devm_release_mem_region(port->dev, port->mapbase, port->mapsize);
>  }
>  
>  static int meson_uart_request_port(struct uart_port *port)
> @@ -411,13 +408,10 @@ static int meson_uart_request_port(struct uart_port *port)
>  		return -EBUSY;
>  	}
>  
> -	if (port->flags & UPF_IOREMAP) {
> -		port->membase = devm_ioremap_nocache(port->dev,
> -						     port->mapbase,
> -						     port->mapsize);
> -		if (port->membase == NULL)
> -			return -ENOMEM;
> -	}
> +	port->membase = devm_ioremap_nocache(port->dev, port->mapbase,
> +					     port->mapsize);
> +	if (!port->membase)
> +		return -ENOMEM;
>  
>  	return 0;
>  }
> @@ -611,7 +605,7 @@ static int meson_uart_probe(struct platform_device *pdev)
>  	port->mapbase = res_mem->start;
>  	port->mapsize = resource_size(res_mem);
>  	port->irq = res_irq->start;
> -	port->flags = UPF_BOOT_AUTOCONF | UPF_IOREMAP | UPF_LOW_LATENCY;
> +	port->flags = UPF_BOOT_AUTOCONF | UPF_LOW_LATENCY;
>  	port->dev = &pdev->dev;
>  	port->line = pdev->id;
>  	port->type = PORT_MESON;
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
