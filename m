From: mturquette@baylibre.com (Michael Turquette)
Date: Tue, 14 Jun 2016 18:41:48 -0700
Subject: [PATCH 7/7] arm64: dts: gxbb clock controller
In-Reply-To: <m260tbsigp.fsf@baylibre.com>
References: <1465518774-26924-1-git-send-email-mturquette@baylibre.com>
 <1465518774-26924-8-git-send-email-mturquette@baylibre.com>
 <m260tbsigp.fsf@baylibre.com>
Message-ID: <20160615014148.5467.29763@quark.deferred.io>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Quoting Kevin Hilman (2016-06-14 12:01:26)
> Michael Turquette <mturquette@baylibre.com> writes:
> 
> > Add the clock controller node for the AmLogic GXBB machine.
> >
> > Signed-off-by: Michael Turquette <mturquette@baylibre.com>
> > ---
> >  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> > index 832815d..3badfab 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> > +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> > @@ -174,5 +174,12 @@
> >                       #size-cells = <2>;
> >                       ranges = <0x0 0x0 0x0 0xd0000000 0x0 0x200000>;
> >               };
> > +
> > +             clkc: clock-controller at c883c000 {
> > +                     compatible = "amlogic,gxbb-clkc";
> > +                     #clock-cells = <1>;
> > +                     reg = <0x0 0xc883c000 0x0 0x3db>;
> > +             };
> > +
> >       };
> >  };
> 
> minor nit: could you put this under the (recently added) hibus node (at
> offset 0).  See the DT in my for-next branch for reference:

Ah, I had wondered about that. Will do.

Thanks for reviewing,
Mike

> 
> https://git.kernel.org/cgit/linux/kernel/git/khilman/linux-amlogic.git/log/?h=for-next
> 
> Thanks,
> 
> Kevin
