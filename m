From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Sun, 12 Nov 2017 16:02:00 +0100
Subject: Ethernet stopped working after commit "ARM64: dts: meson-gx: add
 external PHY interrupt on some platforms"
In-Reply-To: <00aba1d0-6230-c368-4fa6-425e8b406c36@gmail.com>
References: <c398c180-e1dc-dea6-36b4-bc385a4c2eb3@gmail.com>
 <00aba1d0-6230-c368-4fa6-425e8b406c36@gmail.com>
Message-ID: <28bf2196-caa0-20c5-0c39-3dcff5740da6@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Am 12.11.2017 um 01:14 schrieb Heiner Kallweit:
> Am 10.11.2017 um 23:30 schrieb Heiner Kallweit:
>> Hi Jerome,
>>
>> after commit b94d22d94ad22 "ARM64: dts: meson-gx: add external PHY
>> interrupt on some platforms" ethernet stopped working on my Odroid-C2.
>>
>> AFAIK you meanwhile also have an Odroid-C2 for testing. Does it work for you?
>>
>> Rgds, Heiner
>>
> After some more checking I found that the RTL8211F INER register doesn't seem
> to accept writes. If I read back the INER register value in
> rtl8211f_config_intr() I always get 0x0000, no matter which values I write to
> the register before.
> If no interrupt is triggered by the chip it's clear that ethernet isn't working.
> 
> I add Shengzhou who submitted the RTL8211F support as I'm curious whether anybody
> ever used the RTL8211F successfully in interrupt mode.
> 
> I have some doubts as the code doesn't enable the interrupt for finished aneg
> (only the one for link change).
> 
> Or may there be chip versions w/o interrupt support?
> 
> Rgds, Heiner
> 
OK, eventually I was able to solve the riddle. Because register INSR is accessed via
page 0xa43 (BTW, didn't find this page documented somewhere), I assumed that register
INER is on a specific page too.
I did a brute force check and checked on which pages register 0x12 can be changed.
This is the case on several pages, however page 0xa42 sounded most reasonable as it
is next to INSR page 0xa43.
And indeed, setting INER on page 0xa42 actually enables the interrupt and now IRQ
mode works. I'll submit a patch for it.
