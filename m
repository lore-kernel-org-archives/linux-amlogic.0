From: ingrassia@epigenesys.com (Emiliano Ingrassia)
Date: Wed, 17 Jan 2018 15:30:21 +0100
Subject: [PATCH 2/2] ARM: dts: meson8b-odroidc1: ethernet support
In-Reply-To: <CAFBinCAYWvZ=kK7+_4DbGr0S8cWTJJ=PzJRdaGG9QSQx-bFUHQ@mail.gmail.com>
References: <20180116003443.GA10587@ingrassia.epigenesys.com>
 <CAFBinCAYWvZ=kK7+_4DbGr0S8cWTJJ=PzJRdaGG9QSQx-bFUHQ@mail.gmail.com>
Message-ID: <20180117143021.GB23975@ingrassia.epigenesys.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Martin,

thanks for the review.

On Tue, Jan 16, 2018 at 11:27:07AM +0100, Martin Blumenstingl wrote:
> Hi Emiliano,
> 
> On Tue, Jan 16, 2018 at 1:34 AM, Emiliano Ingrassia
> <ingrassia@epigenesys.com> wrote:
> > The Odroid-C1+ board is equipped with an RTL8211F ethernet PHY
> > which supports 10/100/1000 Mbps ethernet.
> > This patch adds the PHY description to the board DT,
> > setting the maximum speed to 1 Gbps, and enables the ethernet controller.
> >
> > Signed-off-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
> I have two minor change-requests - with these you can add my:
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> 
> > ---
> >  arch/arm/boot/dts/meson8b-odroidc1.dts | 32 ++++++++++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
> > index 9ff6ca4e20d0..3766f6fd1882 100644
> > --- a/arch/arm/boot/dts/meson8b-odroidc1.dts
> > +++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
> > @@ -99,3 +99,35 @@
> >  &usb1 {
> >         status = "okay";
> >  };
> > +
> > +&ethmac {
> > +       status = "okay";
> > +
> > +       snps,reset-gpio = <&gpio GPIOH_4 GPIO_ACTIVE_HIGH>;
> > +       snps,reset-active-low;
> > +       snps,reset-delays-us = <0 10000 30000>;
> > +
> > +       pinctrl-0 = <&eth_rgmii_pins>;
> > +       pinctrl-names = "default";
> > +
> > +       phy-mode = "rgmii";
> > +       phy-handle = <&eth_phy>;
> > +       amlogic,tx-delay-ns = <4>;
> > +
> > +       mdio {
> > +               compatible = "snps,dwmac-mdio";
> > +               #address-cells = <1>;
> > +               #size-cells = <0>;
> > +
> > +               eth_phy: ethernet-phy at 0 {
> > +                       /* ethernet PHY RTL8211F */
> > +                       compatible = "ethernet-phy-id001c.c916",
> > +                                    "ethernet-phy-ieee802.3-c22";
> could you please remove the "ethernet-phy-id001c.c916" compatible?
> the Ethernet PHY documentation [0] states: 'If the PHY reports an
> incorrect ID (or none at all) then the "compatible" list may contain
> an entry with the correct PHY ID'
> I have not seen any Amlogic board where the RTL8211F PHY reported an
> incorrect ID yet

OK, you're correct! I'll test without this and submit a second version.

> 
> On Odroid-C2 we simply add the ID to the comment above:
> /* Realtek RTL8211F (0x001cc916) */
>

Ok.

> the "ethernet-phy-ieee802.3-c22" compatible is fine - but I'm also
> fine if you remove the whole compatible property (like we have it on
> Odroid-C2)

Ok, that is also the default so no need to indicate explicitly.

> 
> > +                       reg = <0>;
> > +                       max-speed = <1000>;
> > +                       eee-broken-1000t;
> > +                       interrupt-parent = <&gpio_intc>;
> could you please add a comment here (which will allow us to specify
> the IRQs by their GPIO #define later on, without having to calculate
> what "17" means in the context of Meson8b, as this calculation depends
> on the SoC) - for example:
> /* GPIOH_3 */
> > +                       interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
> > +               };
> > +       };
> > +};
> > --
> > 2.15.1
> >
>

Ok, sure!

> many thanks for your work!
>

Thanks for your work and support!

> Regards,
> Martin
>
> 
> [0] https://elixir.free-electrons.com/linux/v4.14/source/Documentation/devicetree/bindings/net/phy.txt#L12

Regards,

Emiliano
