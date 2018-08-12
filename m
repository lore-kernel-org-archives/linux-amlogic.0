From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 12 Aug 2018 20:07:14 +0200
Subject: [PATCH 1/2] clk: meson: meson8b: register the clock controller
 early
In-Reply-To: <48cd5097-1567-2af4-55e9-ce9e2a103da1@baylibre.com>
References: <20180721191400.15558-1-martin.blumenstingl@googlemail.com>
 <20180721191400.15558-2-martin.blumenstingl@googlemail.com>
 <48cd5097-1567-2af4-55e9-ce9e2a103da1@baylibre.com>
Message-ID: <CAFBinCCXTW1jVusMET6_v_o8WsDJjEB=EGZ64_4ss3uUfr4aCA@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Neil,

On Mon, Jul 23, 2018 at 9:54 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
[snip]
> >  CLK_OF_DECLARE_DRIVER(meson8_clkc, "amlogic,meson8-clkc",
> > -                   meson8b_clkc_reset_init);
> > +                   meson8b_clkc_init);
> >  CLK_OF_DECLARE_DRIVER(meson8b_clkc, "amlogic,meson8b-clkc",
> > -                   meson8b_clkc_reset_init);
> > +                   meson8b_clkc_init);
> >  CLK_OF_DECLARE_DRIVER(meson8m2_clkc, "amlogic,meson8m2-clkc",
> > -                   meson8b_clkc_reset_init);
> > +                   meson8b_clkc_init);
> >
>
> Hi Martin,
>
> Yes this will register early, but the CCF maintainers want to get rid of this and switch
> new drivers to actual drivers, the solution is to switch to core_initcall/postcore_initcall/subsys_initcall
> depending on when the SRAM and TWD are registered.
the CLK_OF_DECLARE_DRIVER has been there before
I can replace it with core_initcall/postcore_initcall/subsys_initcall
but I would like to do that in a separate patch (which can be part of
this series). would that be OK?


Regards
Martin
