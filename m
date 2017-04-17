From: narmstrong@baylibre.com (Neil Armstrong)
Date: Mon, 17 Apr 2017 17:25:51 +0200
Subject: [PATCH 2/6] serial: meson: remove dead code in
 meson_uart_change_speed
In-Reply-To: <32194c6b-0c4f-a7f0-1a61-edfaffbc63c7@gmail.com>
References: <d16f695a-42b2-dfc2-0e53-df110f5a8389@gmail.com>
 <32194c6b-0c4f-a7f0-1a61-edfaffbc63c7@gmail.com>
Message-ID: <09381e1d-1b85-7ff9-ec7b-7eecec0fd3b9@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 04/16/2017 10:10 PM, Heiner Kallweit wrote:
> val is set in both branches of the if clause, therefore the two
> removed lines are dead code.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/tty/serial/meson_uart.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
> index e2e25da1..22857f1e 100644
> --- a/drivers/tty/serial/meson_uart.c
> +++ b/drivers/tty/serial/meson_uart.c
> @@ -298,8 +298,6 @@ static void meson_uart_change_speed(struct uart_port *port, unsigned long baud)
>  	while (!meson_uart_tx_empty(port))
>  		cpu_relax();
>  
> -	val = readl(port->membase + AML_UART_REG5);
> -	val &= ~AML_UART_BAUD_MASK;
>  	if (port->uartclk == 24000000) {
>  		val = ((port->uartclk / 3) / baud) - 1;
>  		val |= AML_UART_BAUD_XTAL;
> 


Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
