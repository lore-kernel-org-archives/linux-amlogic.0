From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Fri, 12 May 2017 19:23:52 +0200
Subject: [PATCH 1/5] pintrl: meson: add interrupts to pinctrl data
In-Reply-To: <CACRpkdajRQNTEYntY+NuG+3vNenzN9ZOw3ukWtS-=5zgDh5wCA@mail.gmail.com>
References: <a4ca587b-d3e8-a22d-4d25-289871d2d095@gmail.com>
 <3b4990ef-bfb4-c62c-f823-431adedc17f1@gmail.com>
 <CACRpkdYx0j4Sjv8MhXRSuiF1TyW2Ht47r0+G1ga8mXW5LC7c=g@mail.gmail.com>
 <1494518886.2375.15.camel@baylibre.com>
 <7ed5a88a-43dd-f7ab-2794-48ceb5a62a93@gmail.com>
 <18ad8094-4e17-3487-7ef2-497d5c7ab9dc@gmail.com>
 <CACRpkdajRQNTEYntY+NuG+3vNenzN9ZOw3ukWtS-=5zgDh5wCA@mail.gmail.com>
Message-ID: <b2db3015-2816-1489-547d-e3f9c6f3ed3a@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Am 12.05.2017 um 11:51 schrieb Linus Walleij:
> On Fri, May 12, 2017 at 8:08 AM, Heiner Kallweit <hkallweit1@gmail.com> wrote:
> 
>> Following Jerome's suggestion I prepared a version making the irq multiplexer
>> an own device. Nice here is that with this approach basically only one line of
>> code needs to be changed in the existing pinctrl driver.
>>
>> As discussion basis I add it here w/o submitting a v2 of patch 5.
> 
> I think this is the right way to go, but would ideally like some feedback from
> the irqchip maintainers.
> 
> Have you looked at drivers/irqchip/irq-crossbar.c for inspiration?
> Also read
> Documentation/devicetree/bindings/arm/omap/crossbar.txt
> 
> It uses an hierarchical domain for a similar cross-connection
> usecase.
> 
When looking at the crassbar driver it seems to be quite similar to Jerome's
Meson GPIO IRQ driver version. Therefore I think we'd face the same challenges.
What is special about the Meson GPIO IRQ hw:
- We have only 8 parent IRQs for 100+ GPIO's.
- If a GPIO requests IRQ_TYPE_EDGE_BOTH (concrete example: mmc sd detection)
  then we have to use two parent IRQs, one for each edge.
- We must be able to dynamically map a GPIO to a parent IRQ, e.g. if a driver
  uses gpiod_to_irq().

These specifics are the reason why I do the mapping magic in the irq_set_type
callback of the irq_chip. Only in this callback I have all the info needed to
do the mapping.

> Under any circumstances I think decoupling the IRQ multiplexer
> and dealing with it in separate is easier for maintainance and
> also for the irq maintainers to review.
> 
Then I'll submit the latest version with the separated device as v2 and we'll
see which further review comments and suggestions for alternative approaches
come in.

Rgds, Heiner

> Yours,
> Linus Walleij
> 
