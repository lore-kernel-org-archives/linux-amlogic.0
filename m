From: ben.dooks@codethink.co.uk (Ben Dooks)
Date: Fri, 24 Jun 2016 19:32:31 +0100
Subject: [RFC] wip: add sysrq support
In-Reply-To: <7hh9cibfxj.fsf@baylibre.com>
References: <1466790326-2062-1-git-send-email-ben.dooks@codethink.co.uk>
 <1466790326-2062-2-git-send-email-ben.dooks@codethink.co.uk>
 <7hh9cibfxj.fsf@baylibre.com>
Message-ID: <4ed881b0-139a-ff69-3ed1-cd9d7f9ac2aa@codethink.co.uk>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 24/06/16 19:27, Kevin Hilman wrote:
> Ben Dooks <ben.dooks@codethink.co.uk> writes:
> 
>> ---
>>  drivers/tty/serial/meson_uart.c | 18 +++++++++++++++---
>>  1 file changed, 15 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
>> index 6aea0f4..8581c35 100644
>> --- a/drivers/tty/serial/meson_uart.c
>> +++ b/drivers/tty/serial/meson_uart.c
>> @@ -14,6 +14,8 @@
>>   *
>>   */
>>  
>> +#define SUPPORT_SYSRQ
>> +

I think I also need to wrap this in an #ifdef.

>>  #include <linux/clk.h>
>>  #include <linux/console.h>
>>  #include <linux/delay.h>
>> @@ -83,6 +85,8 @@
>>  #define AML_UART_PORT_NUM		6
>>  #define AML_UART_DEV_NAME		"ttyAML"
>>  
>> +/* fake flag for handling breaks */
>> +#define AML_RX_BREAK			(1 << 31)

Ah, must have missed that one when cleaning up.



-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius
