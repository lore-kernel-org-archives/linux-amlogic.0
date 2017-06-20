From: linus.walleij@linaro.org (Linus Walleij)
Date: Tue, 20 Jun 2017 13:54:51 +0200
Subject: [PATCH v3 00/10] clk: implement clock rate protection mechanism
In-Reply-To: <1497955822.7387.3.camel@baylibre.com>
References: <20170612194438.12298-1-jbrunet@baylibre.com>
 <CACRpkdaXFS-pW7qhbVLexzefaZwZ50ww3+KTeY4cuHRQUSCWKQ@mail.gmail.com>
 <1497955822.7387.3.camel@baylibre.com>
Message-ID: <CACRpkdacB3HKgewSciQWB0c8v2KCF7u+eT0A_RSC0+z_KrQzhA@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue, Jun 20, 2017 at 12:50 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:
> On Tue, 2017-06-20 at 11:07 +0200, Linus Walleij wrote:

> When the rate is critical to perform a particular task. My example is the audio
> and i2s output. You can't tolerate glitches during the playback, the end user
> would complain (longer description in the original RFC)

I see. Thanks for your detailed explanation!

> It also fixes the behavior of CLK_SET_RATE_GATE flag, which is why I put you in
> CC.
>
> ux500 uses this flag several time, I'd like make sure people are not relying on
> its broken implementation.

Ux500 audio is broken, but I'm fixing it a little at a time...

Yours,
Linus Walleij
