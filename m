From: linus.walleij@linaro.org (Linus Walleij)
Date: Tue, 20 Jun 2017 11:07:48 +0200
Subject: [PATCH v3 00/10] clk: implement clock rate protection mechanism
In-Reply-To: <20170612194438.12298-1-jbrunet@baylibre.com>
References: <20170612194438.12298-1-jbrunet@baylibre.com>
Message-ID: <CACRpkdaXFS-pW7qhbVLexzefaZwZ50ww3+KTeY4cuHRQUSCWKQ@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Mon, Jun 12, 2017 at 9:44 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:

> The goal of this patchset is to provide a way for consumers to inform the
> system that they depend on the rate of the clock source and can't tolerate
> other consumers changing the rate or causing glitches.

Just for context: chat kind of consumers are these?

i.e. the consumers that can't tolerate a clock rate change?

I understand it if it is a hardware limitation (like the block would
crash if it glitches or changes rate).

On the other hand, in the kernel we have things like in
arch/arm/kernel/smp_twd.c we use a notifier to deal
with a changing clock rate.

Just want to be sure that you're not working around something that
can be dealt with using rate change notifiers.

(OK maybe a stupid question, I assume this is not the case, but anyways,
had to ask.)

Yours,
Linus Walleij
