From: afaerber@suse.de (=?UTF-8?Q?Andreas_F=c3=a4rber?=)
Date: Sat, 25 Nov 2017 17:04:19 +0100
Subject: [U-Boot] [PATCH u-boot] ARM: arch-meson: build memory banks using
 reported memory from registers
In-Reply-To: <5A193DD7.1050002@baylibre.com>
References: <1511192169-18458-1-git-send-email-narmstrong@baylibre.com>
 <CAPnjgZ2QwOrAEC+nvA+6doG6cKLJKT-4b=P5ry66_SUZyyucGw@mail.gmail.com>
 <5A193DD7.1050002@baylibre.com>
Message-ID: <cc2f305d-1bfb-5ee9-c467-ba205969bc45@suse.de>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Neil,

Am 25.11.2017 um 10:54 schrieb Neil Armstrong:
> Le 24/11/2017 23:35, Simon Glass a ?crit :
>> On 20 November 2017 at 08:36, Neil Armstrong <narmstrong@baylibre.com> wrote:
>>> diff --git a/arch/arm/include/asm/arch-meson/gxbb.h b/arch/arm/include/asm/arch-meson/gxbb.h
>>> index 74d5290..117f796 100644
>>> --- a/arch/arm/include/asm/arch-meson/gxbb.h
>>> +++ b/arch/arm/include/asm/arch-meson/gxbb.h
>>> @@ -7,10 +7,27 @@
>>>  #ifndef __GXBB_H__
>>>  #define __GXBB_H__
>>>
>>> +#define GXBB_FIRMWARE_MEM_SIZE 0x1000000
>>> +
>>> +#define GXBB_AOBUS_BASE                0xc8100000
>>
>> Does this not come from the device tree?
> 
> Yes it could.

FTR I had prepared an even more hardcoded patch for the Vega S95 before
(wanted to avoid three configs for three models):

https://github.com/afaerber/u-boot/commit/93145dda0b9e557393edcce4dcc36774394ddb2a

Please keep me in the loop here.

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N?rnberg, Germany
GF: Felix Imend?rffer, Jane Smithard, Graham Norton
HRB 21284 (AG N?rnberg)
