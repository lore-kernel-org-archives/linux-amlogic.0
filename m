From: khilman@baylibre.com (Kevin Hilman)
Date: Fri, 24 Jun 2016 11:27:36 -0700
Subject: [RFC] wip: add sysrq support
In-Reply-To: <1466790326-2062-2-git-send-email-ben.dooks@codethink.co.uk> (Ben
 Dooks's message of "Fri, 24 Jun 2016 18:45:26 +0100")
References: <1466790326-2062-1-git-send-email-ben.dooks@codethink.co.uk>
 <1466790326-2062-2-git-send-email-ben.dooks@codethink.co.uk>
Message-ID: <7hh9cibfxj.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Ben Dooks <ben.dooks@codethink.co.uk> writes:

> ---
>  drivers/tty/serial/meson_uart.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
> index 6aea0f4..8581c35 100644
> --- a/drivers/tty/serial/meson_uart.c
> +++ b/drivers/tty/serial/meson_uart.c
> @@ -14,6 +14,8 @@
>   *
>   */
>  
> +#define SUPPORT_SYSRQ
> +
>  #include <linux/clk.h>
>  #include <linux/console.h>
>  #include <linux/delay.h>
> @@ -83,6 +85,8 @@
>  #define AML_UART_PORT_NUM		6
>  #define AML_UART_DEV_NAME		"ttyAML"
>  
> +/* fake flag for handling breaks */
> +#define AML_RX_BREAK			(1 << 31)

Hmm, this flag isn't used anywhere.  ?

>  static struct uart_driver meson_uart_driver;
>  
> @@ -183,12 +187,12 @@ static void meson_receive_chars(struct uart_port *port)
>  {
>  	struct tty_port *tport = &port->state->port;
>  	char flag;
> -	u32 status, ch, mode;
> +	u32 ostatus, status, ch, mode;
>  
>  	do {
>  		flag = TTY_NORMAL;
>  		port->icount.rx++;
> -		status = readl(port->membase + AML_UART_STATUS);
> +		ostatus = status = readl(port->membase + AML_UART_STATUS);
>  
>  		if (status & AML_UART_ERR) {
>  			if (status & AML_UART_TX_FIFO_WERR)
> @@ -216,6 +220,14 @@ static void meson_receive_chars(struct uart_port *port)
>  		ch = readl(port->membase + AML_UART_RFIFO);
>  		ch &= 0xff;
>  
> +		if (ostatus & AML_UART_FRAME_ERR && ch == 0) {
> +			uart_handle_break(port);
> +			continue;
> +		};
> +
> +		if (uart_handle_sysrq_char(port, ch))
> +			continue;
> +
>  		if ((status & port->ignore_status_mask) == 0)
>  			tty_insert_flip_char(tport, ch, flag);
>  
> @@ -284,7 +296,7 @@ static int meson_uart_startup(struct uart_port *port)
>  
>  	val = (AML_UART_RECV_IRQ(1) | AML_UART_XMIT_IRQ(port->fifosize / 2));
>  	writel(val, port->membase + AML_UART_MISC);
> -
> +	
>  	ret = request_irq(port->irq, meson_uart_interrupt, 0,
>  			  meson_uart_type(port), port);
