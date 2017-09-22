From: ingrassia@epigenesys.com (Emiliano Ingrassia)
Date: Fri, 22 Sep 2017 14:08:44 +0200
Subject: ARM: dts: meson: fixing USB support on Meson8b
In-Reply-To: <CAFBinCCT2xoPELb7h34MqgcvDjYXOLqPM8cyf2faLD-j86-1Hw@mail.gmail.com>
References: <20170920143855.GA27243@ingrassia.epigenesys.com>
 <CAFBinCCT2xoPELb7h34MqgcvDjYXOLqPM8cyf2faLD-j86-1Hw@mail.gmail.com>
Message-ID: <20170922120844.GA28169@ingrassia.epigenesys.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Fri, Sep 22, 2017 at 08:59:42AM +0200, Martin Blumenstingl wrote:

Hi Martin,

> Hi Emiliano,
> 
> On Wed, Sep 20, 2017 at 4:38 PM, Emiliano Ingrassia
> <ingrassia@epigenesys.com> wrote:
> > This patch fixes the Meson8b USB1 dts node, changing the IRQ type
> > from edge rising to level high.
> > This avoids errors like "usb 1-1-port1: cannot reset (err = -110)" on
> > Odroid-C1+ board.
> many thanks for investigating and even fixing this!
> 
> > The patch also improves the same node adding the description of the digital
> > and analog regulators found in DWC2 USB controller.
> I could not find any other board that passes fixed regulators here.

Actually there are some exynos boards which have those properties in their USB
controllers dts nodes.

> are you trying to fix a separate problem here?
>

Nothing in particular, just trying to avoid the messages:
"Looking up vusb_d-supply property in node /soc/usb at c90c0000 failed" and
"Looking up vusb_a-supply property in node /soc/usb at c90c0000 failed".

The voltage values were taken from a comment regarding the dwc2_hstog_supply_names
array, in drivers/usb/dwc2/core.h.

Do you think that should be in a separate patch or require a better investigation?

> can you add the following line before your Signed-off-by please:
> Fixes: e29b1cf87473 ("ARM: dts: meson: add USB support on Meson8 and Meson8b")
>

Of course.

> > Signed-off-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
> > ---
> >  arch/arm/boot/dts/meson8b.dtsi | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
> > index bc278da7df0d..3306bff3d44d 100644
> > --- a/arch/arm/boot/dts/meson8b.dtsi
> > +++ b/arch/arm/boot/dts/meson8b.dtsi
> > @@ -87,6 +87,22 @@
> >                 compatible = "arm,cortex-a5-scu";
> >                 reg = <0xc4300000 0x100>;
> >         };
> > +
> > +       soc {
> > +               vusb_d: regulator-vusb_d {
> > +                       compatible = "regulator-fixed";
> > +                       regulator-name = "vusb_d";
> > +                       regulator-min-microvolt = <1200000>;
> > +                       regulator-max-microvolt = <1200000>;
> > +               };
> > +
> > +               vusb_a: regulator-vusb_a {
> > +                       compatible = "regulator-fixed";
> > +                       regulator-name = "vusb_a";
> > +                       regulator-min-microvolt = <1100000>;
> > +                       regulator-max-microvolt = <1100000>;
> > +               };
> > +       };
> >  }; /* end of / */
> >
> >  &aobus {
> > @@ -214,6 +230,9 @@
> >
> >  &usb1 {
> >         compatible = "amlogic,meson8b-usb", "snps,dwc2";
> > +       interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
> I checked Amlogic's code: even Meson6 uses IRQ_TYPE_LEVEL_HIGH
> (drivers/amlogic/usb/dwc_otg/310/dwc_otg_pcd_linux.c in Amlogic's 3.10
> kernel sources)
> can you please update meson.dtsi (instead of just updating
> meson8b.dtsi) and do the same for the usb0 node?
>

Ok, I just submitted a new patch with the suggested corrections.

> > +       vusb_d-supply = <&vusb_d>;
> > +       vusb_a-supply = <&vusb_a>;
> >         clocks = <&clkc CLKID_USB1_DDR_BRIDGE>;
> >         clock-names = "otg";
> >  };
> > --
> > 2.14.1
> >
> >
> > _______________________________________________
> > linux-amlogic mailing list
> > linux-amlogic at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 
> 
> Regards,
> Martin

Regards,

Emiliano
