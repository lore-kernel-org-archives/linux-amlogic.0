From: linus.walleij@linaro.org (Linus Walleij)
Date: Tue, 20 Jun 2017 17:29:09 +0200
Subject: [PATCH v3 00/10] clk: implement clock rate protection mechanism
In-Reply-To: <1497961950.7387.7.camel@baylibre.com>
References: <20170612194438.12298-1-jbrunet@baylibre.com>
 <CACRpkdaXFS-pW7qhbVLexzefaZwZ50ww3+KTeY4cuHRQUSCWKQ@mail.gmail.com>
 <1497955822.7387.3.camel@baylibre.com>
 <CACRpkdacB3HKgewSciQWB0c8v2KCF7u+eT0A_RSC0+z_KrQzhA@mail.gmail.com>
 <1497961950.7387.7.camel@baylibre.com>
Message-ID: <CACRpkdbQQv02t63ywH8HDMdooTVbQ9MPTHkqi7ufNGqxsD4pXQ@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue, Jun 20, 2017 at 2:32 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:

> To build confidence that this won't be causing regression, I'd like to check
> that platform using this flag are no relying on the broken behavior.
>
> I've included the clock maintainers of at91, qcom, and ux500 (you) in this
> thread because they are the heaviest users of this flag, so the more likely to
> report a problem.

OK I'm pretty sure this will not impact the ux500 in a negative way,
we don't play around much with the clocks in that way.

Acked-by: Linus Walleij <linus.walleij@linaro.org>

for the entire series.

Yours,
Linus Walleij
