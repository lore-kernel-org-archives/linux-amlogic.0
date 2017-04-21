From: khilman@baylibre.com (Kevin Hilman)
Date: Fri, 21 Apr 2017 15:03:45 -0700
Subject: [PATCH 1/6] serial: meson: fix setting number of stop bits
In-Reply-To: <cbf6bc87-bea0-01e8-5f20-45734ff054d3@gmail.com> (Heiner
 Kallweit's message of "Mon, 17 Apr 2017 17:54:26 +0200")
References: <d16f695a-42b2-dfc2-0e53-df110f5a8389@gmail.com>
 <d1091d2e-8f6c-618b-556b-400e4b8db3c3@gmail.com>
 <619c093d-0dcc-b771-5cf0-ae31ea723d0d@baylibre.com>
 <cbf6bc87-bea0-01e8-5f20-45734ff054d3@gmail.com>
Message-ID: <m237d15sfy.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Heiner Kallweit <hkallweit1@gmail.com> writes:

> Am 17.04.2017 um 17:24 schrieb Neil Armstrong:
>> On 04/16/2017 10:06 PM, Heiner Kallweit wrote:
>>> The stop bit value as to be or'ed, so far this worked only just by chance
>>> because AML_UART_STOP_BIN_1SB is 0.
>>>
>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>> ---
>>>  drivers/tty/serial/meson_uart.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
>>> index 60f16795..e2e25da1 100644
>>> --- a/drivers/tty/serial/meson_uart.c
>>> +++ b/drivers/tty/serial/meson_uart.c
>>> @@ -355,7 +355,7 @@ static void meson_uart_set_termios(struct uart_port *port,
>>>  	if (cflags & CSTOPB)
>>>  		val |= AML_UART_STOP_BIN_2SB;
>>>  	else
>>> -		val &= ~AML_UART_STOP_BIN_1SB;
>>> +		val |= AML_UART_STOP_BIN_1SB;
>>>  
>>>  	if (cflags & CRTSCTS)
>>>  		val &= ~AML_UART_TWO_WIRE_EN;
>>>
>> 
>> Hi,
>> 
>> in fact you can totally drop the else statement since it's a no-op in both cases.
>> 
> That's right. However I think leaving this in makes the code better understandable.
> And most likely the compiler will remove this no-op anyway.

Agreed.  I like it for readability.

Kevin
