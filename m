From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Tue, 25 Apr 2017 23:28:30 +0200
Subject: Status of Meson GPIO IRQ support
In-Reply-To: <1489564235.25254.5.camel@baylibre.com>
References: <ff88c0a2-1c2f-e421-e2f8-473d4a801b63@gmail.com>
 <1489564235.25254.5.camel@baylibre.com>
Message-ID: <dbe0c7d8-ddd2-f006-c3b2-1144eee66850@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Am 15.03.2017 um 08:50 schrieb Jerome Brunet:
> On Tue, 2017-03-14 at 21:41 +0100, Heiner Kallweit wrote:
>> Jerome,
>>
>> when working on Meson I2C driver I was testing with a device where I wanted
>> to use a GPIO as interrupt source.
>> This isn't supported yet and when checking I found that end of last year
>> you submitted related patches. After some intense discussions I found no
>> further update.
>> Was this topic put on-hold due to bigger technical issues?
>>
> 
> Well, the proposed code does work but, as you have probaly seen for yourself,
> the maintainers of irqchip and gpio raised valid concerns, mainly about the way
> the mapping is created in the gpio driver. Ideally, the mapping should be
> created at probe time but, with a hierarchic interrupt domain, that means
> allocating the parent irq. We only have 8 of those for 100+ gpios. 
> 
> I'm still not sure how to address the problem to be honest: Is there a way to
> create mapping in hierarchy domain and allocate the parent only when the irq is
> actually requested ? Or should we simply not use a hierarchy domain for this
> controller (which seems to make sense) ?
> 
Meanwhile I became somewhat familiar with the irq subsystem and do some tests
with a GPIO IRQ driver based on GPIOLIB_IRQCHIP (in generic chained mode).

This basically works, however I have a problem with edge detection.
Level changes are not reliably detected. If I connect an input pin (configured
for edge irq generation) to a output pin and change the value of the output pin
no edge is detected. However if I use a cable to connect the input pin to
VCC/GND manually then most of the time edges are detected (not always).
Did you ever come across a similar problem during your tests?

Regards, Heiner

> I still hope to be able to do something on this topic but probably not tomorrow
> :( Of course, If you have some spare time and want to contribute on this topic,
> you are welcome to do so.
> 
>> Rgds, Heiner
> 
> Cheers
> 
> Jerome
> 
