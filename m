From: linus.walleij@linaro.org (Linus Walleij)
Date: Tue, 20 Jun 2017 18:37:17 +0200
Subject: [RFC] gpio: about the need to manage irq mapping dynamically.
In-Reply-To: <1497954416.7387.1.camel@baylibre.com>
References: <1497543642.3086.35.camel@baylibre.com>
 <CACRpkdZWw_-joPT4CJ-RAJ31s4BxuE6vusjg5YnZWaHtkRg5+w@mail.gmail.com>
 <1497954416.7387.1.camel@baylibre.com>
Message-ID: <CACRpkdZu74aAsu8hggxsfffQPMk0nqihCSfuMaMbf+-4EFSYYA@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue, Jun 20, 2017 at 12:26 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:

So I finally understood that what you want is to handle those cases
where gpio_to_irq() is currently in use, and not expand the use of that
function. And that is good.

> On Tue, 2017-06-20 at 10:39 +0200, Linus Walleij wrote:

>> > The fact that 26 gpio drivers [3] create mapping in the
>> > gpio_to_irq callback shows that the problem of managing the irq mapping is
>> > not
>> > specific to Amlogic and that an evolution might be useful.
>>
>> Calling irq_create_mapping() in gpio_to_irq() is not a problem if
>> the mapping is free:ed elsewhere. But yeah, there are lots of old
>> drivers with old and erroneous solutions to this problem.
>
> A lot of these drivers are old indeed, and dealing with all this history must be
> quite a challenge ;)
> However, some are fairly recent.

Unfortunately the API has merits. Like for keys: OK there is a key
for an GPIO line, and then it asks "can I have an IRQ for that"?
There are cases where the IRQ is really optional, not a required
feature.

> So there is 2 use cases:
> * What you described above: This is indeed completely orthogonal to gpio
> framework. It will be using the irqchip callbacks only. In this particular case,
> it is the device tree platform code which will handle the mapping creation for
> us.

OK

So the problem is really to use drivers that cannot do all their
mappings at probe
time with drivers that use gpio_to_irq(), right?

So, if the idea is to patch *ALL* drivers using gpio_to_irq(), I think
for each case
it should be investigated whether that should really be using gpio_to_irq()
but I suspect they are all pretty solid.

Well you're probably right, the API has to change for the case where the number
of IRQs are limited and cannot just be handled out to the left and right, but we
should really replace *ALL* occurences of gpio_to_irq() with a pair of
gpio_irq_prepare() that also returns the valid IRQ if found, and
gpio_irq_unprepare()
that removes it.

For the transitional period, gpio_to_irq() should *FAIL* if gpio_irq_prepare()
was called first for the same GPIO line.

Eventually gpio_to_irq() should be DELETED and replaced in full with
the prepare/unprepare calls.

And I would like strong confidence that the change will be carried all the way
through, not half-done and left to me to complete. I already have too many
problems of that type.

Yours,
Linus Walleij
