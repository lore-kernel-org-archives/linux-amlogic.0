From: jbrunet@baylibre.com (Jerome Brunet)
Date: Wed, 15 Mar 2017 08:50:35 +0100
Subject: Status of Meson GPIO IRQ support
In-Reply-To: <ff88c0a2-1c2f-e421-e2f8-473d4a801b63@gmail.com>
References: <ff88c0a2-1c2f-e421-e2f8-473d4a801b63@gmail.com>
Message-ID: <1489564235.25254.5.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue, 2017-03-14 at 21:41 +0100, Heiner Kallweit wrote:
> Jerome,
> 
> when working on Meson I2C driver I was testing with a device where I wanted
> to use a GPIO as interrupt source.
> This isn't supported yet and when checking I found that end of last year
> you submitted related patches. After some intense discussions I found no
> further update.
> Was this topic put on-hold due to bigger technical issues?
> 

Well, the proposed code does work but, as you have probaly seen for yourself,
the maintainers of irqchip and gpio raised valid concerns, mainly about the way
the mapping is created in the gpio driver. Ideally, the mapping should be
created at probe time but, with a hierarchic interrupt domain, that means
allocating the parent irq. We only have 8 of those for 100+ gpios.?

I'm still not sure how to address the problem to be honest: Is there a way to
create mapping in hierarchy domain and allocate the parent only when the irq is
actually requested ? Or should we simply not use a hierarchy domain for this
controller (which seems to make sense) ?

I still hope to be able to do something on this topic but probably not tomorrow
:( Of course, If you have some spare time and want to contribute on this topic,
you are welcome to do so.

> Rgds, Heiner

Cheers

Jerome
