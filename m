From: jbrunet@baylibre.com (Jerome Brunet)
Date: Wed, 21 Mar 2018 10:31:30 +0100
Subject: [PATCH v2 1/1] clk: meson: meson8b: add support for the NAND
 clocks
In-Reply-To: <CAFBinCAVZcws9-r9EET8o7TXWnGJmcTA517WTn0srXAMHtMHWw@mail.gmail.com>
References: <20180101210139.29808-1-martin.blumenstingl@googlemail.com>
 <20180101210139.29808-2-martin.blumenstingl@googlemail.com>
 <152121876042.70929.5606827507365233258@swboyd.mtv.corp.google.com>
 <1521219591.6569.82.camel@baylibre.com>
 <CAFBinCAVZcws9-r9EET8o7TXWnGJmcTA517WTn0srXAMHtMHWw@mail.gmail.com>
Message-ID: <1521624690.3753.0.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sun, 2018-03-18 at 23:54 +0100, Martin Blumenstingl wrote:
> > Hi Stephen,
> > 
> > I guess we missed it after new year's day :(
> > 
> > The patch looks fine to me but, following the rework of meson clocks, we'll need
> > to migrate the clocks inserted to our clk_regmap and change the IDs (96-98 are
> > used now)
> > 
> > Martin, I can do this rebase if you want ? As you prefer
> 
> Jerome, if you have time to rebase it then feel free
> otherwise I'll do it once v4.17-rc1 is out (no need to hurry with
> these clocks, they are unused until the mainline NAND driver is
> finished - which will probably not happen anytime soon)
> 

Ok, no rush. Let's leave this for the next cycle
Thanks Martin

> 
> Regards
> Martin
