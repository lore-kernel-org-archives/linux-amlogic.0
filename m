From: narmstrong@baylibre.com (Neil Armstrong)
Date: Wed, 19 Apr 2017 10:39:08 +0200
Subject: [PATCH 3/6] serial: meson: remove unneeded variable assignment in
 meson_serial_port_write
In-Reply-To: <0dca2d13-2ea0-40cd-9087-3159713e399a@suse.de>
References: <d16f695a-42b2-dfc2-0e53-df110f5a8389@gmail.com>
 <c1371fc8-ebc2-0d14-e409-02e2fbf3ba94@gmail.com>
 <a9179fc6-9ca6-c153-0b60-db1365cfb18c@codethink.co.uk>
 <369dac4f-7c48-3e64-fef5-72e6aa28b0f0@baylibre.com>
 <0dca2d13-2ea0-40cd-9087-3159713e399a@suse.de>
Message-ID: <ce0c8b90-2d64-361c-dc05-2c034857a327@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 04/17/2017 05:37 PM, Andreas F?rber wrote:
> Am 17.04.2017 um 17:27 schrieb Neil Armstrong:
>> On 04/17/2017 03:58 PM, Ben Dooks wrote:
>>> On 16/04/17 21:13, Heiner Kallweit wrote:
>>>> AML_UART_TX_EN is set in meson_uart_startup and there's no place in
>>>> the driver where it gets cleared. Therefore we don't have to set it
>>>> here.
>>>
>>> I think this is a leftover of the patches I did when trying to fix
>>> the UART driver when using debian/systemd and having strange console
>>> problems.
>>>
>>> The only comment is it might be worth leaving this in as it isn't
>>> a high cost to the driver and it is possible someone might accidentally
>>> clear it later.
>>>
>>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>>> ---
>>>>  drivers/tty/serial/meson_uart.c | 1 -
>>>>  1 file changed, 1 deletion(-)
>>>>
>>>> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
>>>> index 22857f1e..714b29ad 100644
>>>> --- a/drivers/tty/serial/meson_uart.c
>>>> +++ b/drivers/tty/serial/meson_uart.c
>>>> @@ -497,7 +497,6 @@ static void meson_serial_port_write(struct uart_port *port, const char *s,
>>>>      }
>>>>
>>>>      val = readl(port->membase + AML_UART_CONTROL);
>>>> -    val |= AML_UART_TX_EN;
>>>>      tmp = val & ~(AML_UART_TX_INT_EN | AML_UART_RX_INT_EN);
>>>>      writel(tmp, port->membase + AML_UART_CONTROL);
>>>>
>>>>
>>>
>>>
>>
>> I'm ok to remove it, having it in uart_startup is enough.
>>
>> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> 
> Have you checked the earlycon code paths? That does not run through the
> standard setup function, so it is dependent on what the firmware set
> last. I believe I am calling into this function through some wrapper.
> 
> Since we're writing the register anyway, it shouldn't hurt to leave this in.
> 
> Regards,
> Andreas
> 

Indeed, it's on the earlycon path, but it's a hack and should be moved inside meson_serial_early_console_setup() and meson_serial_console_setup() instead.

Writing TX_EN at each meson_serial_port_write() is really unnecessary...

Neil
