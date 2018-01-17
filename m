From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Wed, 17 Jan 2018 15:52:10 +0100
Subject: [PATCH 1/2] ARM: dts: meson8b: extend ethernet controller
 description
In-Reply-To: <20180117141336.GA23975@ingrassia.epigenesys.com>
References: <20180116003412.GA10581@ingrassia.epigenesys.com>
 <CAFBinCBdjMVw1d=c4P0fZi395mMPG_uZQ9en1MRq6zfQNxEbiA@mail.gmail.com>
 <20180117141336.GA23975@ingrassia.epigenesys.com>
Message-ID: <CAFBinCC8XgbLnAatLuKC66pSO4bshLnU0saxdNJE5VVNpEM6Kw@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Emiliano,

On Wed, Jan 17, 2018 at 3:13 PM, Emiliano Ingrassia
<ingrassia@epigenesys.com> wrote:
> Hi Martin,
>
> thanks for the feedback!
>
> On Tue, Jan 16, 2018 at 11:14:37AM +0100, Martin Blumenstingl wrote:
>> On Tue, Jan 16, 2018 at 1:34 AM, Emiliano Ingrassia
>> <ingrassia@epigenesys.com> wrote:
>> > Extend ethernet controller description adding pin multiplexing and
>> > setting the needed attributes in ethmac node.
>> > As reported in S805 SoC manual, the MAC clock source is MPLL2 only.
>> >
>> > Signed-off-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
>> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>>
>> I had your patch also in my local tree, where I added the following
>> comments to the patch description (this is nothing final though, I
>> just added them so I don't forget about these facts):
>> Until now we have been using the "amlogic,meson6-dwmac" binding with the
>> register offset (0xc1108108) defined in meson.dtsi.
>> During testing (and by reading Hardkernel's u-boot sources for the
>> Odroid-C1) it turns out that the actual register that should be used is
>> at 0xc1108140. This also requires us to switch to the new
>> "amlogic,meson8b-dwmac" binding, because the dwmac-meson8b driver knows
>> how to configure that register. The old register is a no-op, so using
>> the old "amlogic,meson6-dwmac" binding with the old register meant that
>> we relied on the bootloader to set up the Ethernet clocks etc.
>> correctly.
>>
>
> Ok, I could send a second version of the patch integrating these
> informations in log message.
> What do you think?
if you send a v2 of this series anyways then it would be great if you
could include it (feel free to change it where needed)

>>
>> > ---
>> >  arch/arm/boot/dts/meson8b.dtsi | 35 +++++++++++++++++++++++++++++++++--
>> >  1 file changed, 33 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
>> > index 7cd03ed3742e..3c66d9bdc3a8 100644
>> > --- a/arch/arm/boot/dts/meson8b.dtsi
>> > +++ b/arch/arm/boot/dts/meson8b.dtsi
>> > @@ -185,6 +185,27 @@
>> >                         #gpio-cells = <2>;
>> >                         gpio-ranges = <&pinctrl_cbus 0 0 130>;
>> >                 };
>> > +
>> > +               eth_rgmii_pins: eth-rgmii {
>> > +                       mux {
>> > +                               groups = "eth_tx_clk",
>> > +                                        "eth_tx_en",
>> > +                                        "eth_txd1_0",
>> > +                                        "eth_txd1_1",
>> > +                                        "eth_txd0_0",
>> > +                                        "eth_txd0_1",
>> > +                                        "eth_rx_clk",
>> > +                                        "eth_rx_dv",
>> > +                                        "eth_rxd1",
>> > +                                        "eth_rxd0",
>> > +                                        "eth_mdio_en",
>> > +                                        "eth_mdc",
>> > +                                        "eth_ref_clk",
>> > +                                        "eth_txd2",
>> > +                                        "eth_txd3";
>> > +                               function = "ethernet";
>> > +                       };
>> > +               };
>> >         };
>> >  };
>> >
>> > @@ -203,8 +224,18 @@
>> >  };
>> >
>> >  &ethmac {
>> > -       clocks = <&clkc CLKID_ETH>;
>> > -       clock-names = "stmmaceth";
>> > +       compatible = "amlogic,meson8b-dwmac", "snps,dwmac-3.70a", "snps,dwmac";
>> > +
>> > +       reg = <0xc9410000 0x10000
>> > +              0xc1108140 0x4>;
>> > +
>> > +       clocks = <&clkc CLKID_ETH>,
>> > +                <&clkc CLKID_MPLL2>,
>> > +                <&clkc CLKID_MPLL2>;
>> > +       clock-names = "stmmaceth", "clkin0", "clkin1";
>> > +
>> > +       resets = <&reset RESET_ETHERNET>;
>> > +       reset-names = "stmmaceth";
>> >  };
>> >
>> >  &gpio_intc {
>> > --
>> > 2.15.1
>> >
>
> Regards,
>
> Emiliano

Regards
Martin
