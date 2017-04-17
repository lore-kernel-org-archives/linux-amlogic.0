From: afaerber@suse.de (=?UTF-8?Q?Andreas_F=c3=a4rber?=)
Date: Mon, 17 Apr 2017 17:54:58 +0200
Subject: [PATCH 2/6] serial: meson: remove dead code in
 meson_uart_change_speed
In-Reply-To: <09381e1d-1b85-7ff9-ec7b-7eecec0fd3b9@baylibre.com>
References: <d16f695a-42b2-dfc2-0e53-df110f5a8389@gmail.com>
 <32194c6b-0c4f-a7f0-1a61-edfaffbc63c7@gmail.com>
 <09381e1d-1b85-7ff9-ec7b-7eecec0fd3b9@baylibre.com>
Message-ID: <57ec8e81-ef9e-2231-1545-586773e9d31f@suse.de>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Am 17.04.2017 um 17:25 schrieb Neil Armstrong:
> On 04/16/2017 10:10 PM, Heiner Kallweit wrote:
>> val is set in both branches of the if clause, therefore the two
>> removed lines are dead code.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  drivers/tty/serial/meson_uart.c | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
>> index e2e25da1..22857f1e 100644
>> --- a/drivers/tty/serial/meson_uart.c
>> +++ b/drivers/tty/serial/meson_uart.c
>> @@ -298,8 +298,6 @@ static void meson_uart_change_speed(struct uart_port *port, unsigned long baud)
>>  	while (!meson_uart_tx_empty(port))
>>  		cpu_relax();
>>  
>> -	val = readl(port->membase + AML_UART_REG5);
>> -	val &= ~AML_UART_BAUD_MASK;
>>  	if (port->uartclk == 24000000) {
>>  		val = ((port->uartclk / 3) / baud) - 1;
>>  		val |= AML_UART_BAUD_XTAL;
>>
> 
> 
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

I've double-checked that this was already done before I added the
GXBB-enabling XTAL case:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/tty/serial/meson_uart.c?id=146f3808e08faabba46ea9574133a66aa4a9468d

Present since the beginning:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/tty/serial/meson_uart.c?id=ff7693d079e58fb62d735b7b8085b53fcfb74528

In general it is worth pointing out that reading a register may
sometimes be required - I hope that BayLibre have checked against the
manuals that this is not the case here? Assuming it is okay,

Reviewed-by: Andreas F?rber <afaerber@suse.de>

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N?rnberg, Germany
GF: Felix Imend?rffer, Jane Smithard, Graham Norton
HRB 21284 (AG N?rnberg)
