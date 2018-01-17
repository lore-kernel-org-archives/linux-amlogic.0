From: jbrunet@baylibre.com (Jerome Brunet)
Date: Wed, 17 Jan 2018 15:42:48 +0100
Subject: [PATCH 2/2] ARM: dts: meson8b-odroidc1: ethernet support
In-Reply-To: <20180117143932.GA24184@ingrassia.epigenesys.com>
References: <20180116003443.GA10587@ingrassia.epigenesys.com>
 <1516098715.2608.73.camel@baylibre.com>
 <20180117143932.GA24184@ingrassia.epigenesys.com>
Message-ID: <1516200168.2608.99.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Wed, 2018-01-17 at 15:39 +0100, Emiliano Ingrassia wrote:
> Hi Jerome,
> 
> thanks for the review.
> 
> On Tue, Jan 16, 2018 at 11:31:55AM +0100, Jerome Brunet wrote:
> > On Tue, 2018-01-16 at 01:34 +0100, Emiliano Ingrassia wrote:
> > > The Odroid-C1+ board is equipped with an RTL8211F ethernet PHY
> > > which supports 10/100/1000 Mbps ethernet.
> > > This patch adds the PHY description to the board DT,
> > > setting the maximum speed to 1 Gbps, and enables the ethernet controller.
> > > 
> > > Signed-off-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
> > > ---
> > >  arch/arm/boot/dts/meson8b-odroidc1.dts | 32 ++++++++++++++++++++++++++++++++
> > >  1 file changed, 32 insertions(+)
> > > 
> > > diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
> > > index 9ff6ca4e20d0..3766f6fd1882 100644
> > > --- a/arch/arm/boot/dts/meson8b-odroidc1.dts
> > > +++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
> > > @@ -99,3 +99,35 @@
> > >  &usb1 {
> > >  	status = "okay";
> > >  };
> > > +
> > > +&ethmac {
> > > +	status = "okay";
> > > +
> > > +	snps,reset-gpio = <&gpio GPIOH_4 GPIO_ACTIVE_HIGH>;
> > > +	snps,reset-active-low;
> > > +	snps,reset-delays-us = <0 10000 30000>;
> > > +
> > > +	pinctrl-0 = <&eth_rgmii_pins>;
> > > +	pinctrl-names = "default";
> > > +
> > > +	phy-mode = "rgmii";
> > > +	phy-handle = <&eth_phy>;
> > > +	amlogic,tx-delay-ns = <4>;
> > > +
> > > +	mdio {
> > > +		compatible = "snps,dwmac-mdio";
> > > +		#address-cells = <1>;
> > > +		#size-cells = <0>;
> > > +
> > > +		eth_phy: ethernet-phy at 0 {
> > > +			/* ethernet PHY RTL8211F */
> > > +			compatible = "ethernet-phy-id001c.c916",
> > > +				     "ethernet-phy-ieee802.3-c22";
> > > +			reg = <0>;
> > > +			max-speed = <1000>;

Do we really this property ? I might be mistaken, but I think it is only useful
we you to restrict the available speed. It does not look like it here.

> > > +			eee-broken-1000t;
> > 
> > You should test against the issue before adding this flags.
> > Did you have any hang issue while doing iperf test at Gbit speed ? It happens
> > quickly if you are impacted as the c2 is.
> > 
> 
> Of course I tested for this issue. I experiment a high packet loss
> while pinging the board without it.
> Should I report this in message log?

I wouldn't have asked if you did, so yes.
Thx

> 
> > > +			interrupt-parent = <&gpio_intc>;
> > > +			interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
> > > +		};
> > > +	};
> > > +};
