From: dlan@gentoo.org (Yixun Lan)
Date: Thu, 27 Apr 2017 14:13:07 +0800
Subject: [PATCH v2 6/6] serial: meson: change interrupt description to
 tty name
In-Reply-To: <e2b3ef2d-dfe4-de91-c8e1-4046fc2ebdb5@gmail.com>
References: <4abafe6e-3c7c-049f-d450-ab27e2c7acfd@gmail.com>
 <e2b3ef2d-dfe4-de91-c8e1-4046fc2ebdb5@gmail.com>
Message-ID: <20170427061307.GA1416@cubie>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 22:18 Wed 19 Apr     , Heiner Kallweit wrote:
> Change interrupt description from driver name to tty name
> (e.g. ttyAML0). If multiple serial ports are enabled this
> allows to determine which interrupt belongs to which port
> in /proc/interrupts.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - use new port->name instead of of node name
> ---
>  drivers/tty/serial/meson_uart.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
> index 171eb673..082e038e 100644
> --- a/drivers/tty/serial/meson_uart.c
> +++ b/drivers/tty/serial/meson_uart.c
> @@ -295,7 +295,7 @@ static int meson_uart_startup(struct uart_port *port)
>  	writel(val, port->membase + AML_UART_MISC);
>  
>  	ret = request_irq(port->irq, meson_uart_interrupt, 0,
> -			  meson_uart_type(port), port);
> +			  port->name, port);
>  
>  	return ret;
>  }
> -- 
> 2.12.2
> 
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

Hi Heiner Kallweit:

there is no member of 'name' in 'struct uart_port'
or did I miss something obviously?
(btw, I'm applying these patches on top of khilman's tree: branch v4.12/integ)

as I got this error:

drivers/tty/serial/meson_uart.c: In function ?meson_uart_startup?:                
drivers/tty/serial/meson_uart.c:298:10: error: ?struct uart_port? has no
member named ?name?
      port->name, port);                         
          ^~                                                              
make[3]: *** [scripts/Makefile.build:294: drivers/tty/serial/meson_uart.o] Error 1
make[3]: *** Waiting for unfinished jobs....  

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55
