From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Sat, 10 Jun 2017 00:30:14 +0200
Subject: [PATCH v6 2/9] irqchip: add Amlogic Meson GPIO irqchip driver
In-Reply-To: <m2vao46ewu.fsf@baylibre.com>
References: <04378047-4194-bb0f-3da3-e1d62345a86b@gmail.com>
 <89d02a38-7386-fcdc-4dce-ea7e531c90b4@gmail.com>
 <1496999266.3552.61.camel@baylibre.com> <m2vao46ewu.fsf@baylibre.com>
Message-ID: <702e4608-8592-41fe-b79c-fef985c49be7@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Am 09.06.2017 um 23:15 schrieb Kevin Hilman:
> Jerome Brunet <jbrunet@baylibre.com> writes:
> 
>> On Thu, 2017-06-08 at 21:38 +0200, Heiner Kallweit wrote:
>>> Add a driver supporting the GPIO interrupt controller on certain
>>> Amlogic meson SoC's.
>>>
>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> 
> [...]
> 
>>> +static unsigned int meson_irq_startup(struct irq_data *data)
>>> +{
>>> +	irq_chip_unmask_parent(data);
>>> +	/*
>>> +	 * An extra bit was added to allow having the same gpio hwirq twice
>>> +	 * for handling IRQ_TYPE_EDGE_BOTH. Remove this bit to get the
>>> +	 * gpio hwirq.
>>> +	 */
>>> +	meson_irq_set_hwirq(data, data->hwirq >> 1);
>>
>> Please keep in mind that any device can use this controller as irq parent.
>> It has to make sense, even when not serving the gpio driver.
>>
>> This hack means that, in DT, we'd have to multiply by 2 the values given under
>> section "22.3 GPIO interrupts" of the datasheet. This is an example Linux
>> specific stuff in DT.
>> It also means that the controller declares a lot more lines that it really has
>> ... 
>>
>> This is all to accommodate your hack around IRQ_TYPE_BOTH and creating the
>> mapping from the irq_set_type callback of the GPIO driver, which is still think
>> should be dropped at this point.
> 
> +1
> 
> Please drop the hack for IRQ_TYPE_BOTH so we can reach agreement on the
> basic design and functionality.  The gymnastics required to support this
> hack (due to broken hardware) are getting in the way of getting basic
> functionality merged.
> 
I haven't heard any feedback on the other proposal yet:
Always reserve two parent irq's in the request_resources callback,
then set_type is easy. How about this one?

Having max. 4 gpio irq's should be a fair price for a cleaner design.

Rgds, Heiner

> Also, we already know from previous discussions between Jerome and the
> IRQ maintainers that hacks for IRQ_TYPE_BOTH like this have been very
> thoroughly rejected.  So while the IRQ maintainers haven't chimed in on
> this series, we have a very good idea what they will say when they do.
> 
> So please, pretty please, let's avoid giving the IRQ maintainers a fun
> reason to NAK, and drop the IRQ_TYPE_BOTH stuff until we have an agreed
> upon way to support the hardware that actually works.
> 
> Thanks,
> 
> Kevin
> 
