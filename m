From: khilman@baylibre.com (Kevin Hilman)
Date: Mon, 03 Apr 2017 08:56:28 -0700
Subject: [PATCH] ARM64: dts: meson-gxbb-odroidc2: Enable SARADC node
In-Reply-To: <8bde66d0-4613-7001-9c54-b80681055853@gmail.com> (Heiner
 Kallweit's message of "Sun, 2 Apr 2017 10:13:26 +0200")
References: <c8ffa8db-2bfd-ee28-a210-4fa752b5ff43@gmail.com>
 <m2h93czxdk.fsf@baylibre.com>
 <8bde66d0-4613-7001-9c54-b80681055853@gmail.com>
Message-ID: <m2h925a3ir.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Heiner Kallweit <hkallweit1@gmail.com> writes:

> Am 01.03.2017 um 19:04 schrieb Kevin Hilman:
>> Heiner Kallweit <hkallweit1@gmail.com> writes:
>> 
>>> Now that 3adbf3427330 "iio: adc: add a driver for the SAR ADC found in
>>> Amlogic Meson SoCs" has added support for the ADC, let's enable it
>>> on Odroid C2.
>>>
>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> 
>> Applied to v4.11/dt64
>> 
> Kevin, this didn't show up in mainline yet.
> Has it been lost somewhere?

Hmm, indeed it has fallen through the cracks somehow.  I've applied it
to v4.12/dt64 now.

Kevin
