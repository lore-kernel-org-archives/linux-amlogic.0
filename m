From: khilman@baylibre.com (Kevin Hilman)
Date: Mon, 27 Nov 2017 15:38:51 -0800
Subject: [PATCH 0/2] ARM: dts: meson: GPIO interrupt fixes for v4.15
In-Reply-To: <1509444126.13838.25.camel@baylibre.com> (Jerome Brunet's message
 of "Tue, 31 Oct 2017 11:02:06 +0100")
References: <20171029231715.13391-1-martin.blumenstingl@googlemail.com>
 <1509444126.13838.25.camel@baylibre.com>
Message-ID: <7h1skje1h0.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> On Mon, 2017-10-30 at 00:17 +0100, Martin Blumenstingl wrote:
>> This provides two small fixes for the GPIO interrupt support on the
>> 32-bit Meson SoCs.
>> 
>> The first change is purely cosmetic - I still decided to include to it
>> because it keeps the sort order consistent. Also it's easier to find
>> the node if you can rely on the sorting to be consistent.
>> 
>> The second patch however is required to make the GPIO interrupt
>> controller functional on Meson8b. Without this the driver simply fails
>> during the of_iomap call - and as a result of that GPIO interrupts are
>> unavailable.
>> 
>
> Acked-by: Jerome Brunet <jbrunet@baylibre.com>
>
> And thanks for catching this early !

Thanks, adding to v4.15/fixes for v4.15-rc,

Kevin
