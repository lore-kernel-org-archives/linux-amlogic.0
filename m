From: khilman@baylibre.com (Kevin Hilman)
Date: Fri, 08 Dec 2017 10:48:03 -0800
Subject: [PATCH 0/2] Ethernet PHY interrupt improvements
In-Reply-To: <1512310617.2574.4.camel@baylibre.com> (Jerome Brunet's message
 of "Sun, 03 Dec 2017 15:16:57 +0100")
References: <20171202214037.17017-1-martin.blumenstingl@googlemail.com>
 <1512310617.2574.4.camel@baylibre.com>
Message-ID: <7hvahhm4yk.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> On Sat, 2017-12-02 at 22:40 +0100, Martin Blumenstingl wrote:
>> this small series consists of two patches:
>> #1 documents the GPIO to which the PHY's interrupt line is connected
>>    (the name "MAC_INTR" is used in the schematics of Odroid-C2 and
>>     Khadas VIM2)
>> #2 adds the RTL8211F PHY's interrupt line on Khadas VIM2
>> 
>> I was a bit surprised to see that the GXM Q200 board seems to use
>> GPIOH_3 instead of GPIOZ_15 like all other boards.
>> @Jerome: could you please check if GPIOH_3 is correct or if it's
>> a "copy-and-paste" issue (Q200 is the only GXL/GXM based board.
>> GXL/GXM SoCs have fewer GPIOAO pins than GXBB, so the interrupt
>> offset for the same non-GPIOAO pin is different than on GXBB)
>
> Good catch, I confirm that the interrupt in GPIOZ_15 and certainly not GPIOH_3
>

Series applied to v4.16/dt64 with Jerome's review tags.

Thanks,

Kevin
