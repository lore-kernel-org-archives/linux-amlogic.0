From: ingrassia@epigenesys.com (Emiliano Ingrassia)
Date: Wed, 17 Jan 2018 15:09:46 +0100
Subject: [PATCH 1/2] ARM: dts: meson8b: extend ethernet controller
 description
In-Reply-To: <1516097873.2608.70.camel@baylibre.com>
References: <20180116003412.GA10581@ingrassia.epigenesys.com>
 <1516097873.2608.70.camel@baylibre.com>
Message-ID: <20180117140946.GA23738@ingrassia.epigenesys.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Jerome,

On Tue, Jan 16, 2018 at 11:17:53AM +0100, Jerome Brunet wrote:
> On Tue, 2018-01-16 at 01:34 +0100, Emiliano Ingrassia wrote:
> > Extend ethernet controller description adding pin multiplexing and
> > setting the needed attributes in ethmac node.
> > As reported in S805 SoC manual, the MAC clock source is MPLL2 only.
> > 
> > Signed-off-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
> > ---
> >  arch/arm/boot/dts/meson8b.dtsi | 35 +++++++++++++++++++++++++++++++++--
> >  1 file changed, 33 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
> > index 7cd03ed3742e..3c66d9bdc3a8 100644
> > --- a/arch/arm/boot/dts/meson8b.dtsi
> > +++ b/arch/arm/boot/dts/meson8b.dtsi
> > @@ -185,6 +185,27 @@
> >  			#gpio-cells = <2>;
> >  			gpio-ranges = <&pinctrl_cbus 0 0 130>;
> >  		};
> > +
> > +		eth_rgmii_pins: eth-rgmii {
> > +			mux {
> > +				groups = "eth_tx_clk",
> > +					 "eth_tx_en",
> > +					 "eth_txd1_0",
> > +					 "eth_txd1_1",
> > +					 "eth_txd0_0",
> > +					 "eth_txd0_1",
> > +					 "eth_rx_clk",
> > +					 "eth_rx_dv",
> > +					 "eth_rxd1",
> > +					 "eth_rxd0",
> > +					 "eth_mdio_en",
> > +					 "eth_mdc",
> > +					 "eth_ref_clk",
> > +					 "eth_txd2",
> > +					 "eth_txd3";
> > +				function = "ethernet";
> > +			};
> > +		};
> >  	};
> >  };
> >  
> > @@ -203,8 +224,18 @@
> >  };
> >  
> >  &ethmac {
> > -	clocks = <&clkc CLKID_ETH>;
> > -	clock-names = "stmmaceth";
> > +	compatible = "amlogic,meson8b-dwmac", "snps,dwmac-3.70a", "snps,dwmac";
> 
> Does meson8 shared the same IP block ? is yes, then this compatible should
> probably be changed one level up, along with the regs
>

I don't have any information about S802 SoC (aka meson8). It seems that
no public informations are available. If you have any, please share.

> If not, it means that ethmac node should not be defined in meson.dtsi but in
> meson8.dtsi and meson8b.dtsi
>

Sounds logic! As I understand, Martin has a plan about this.

> In any case, overloading the node like this really clean, even if it works.
> 
> > +
> > +	reg = <0xc9410000 0x10000
> > +	       0xc1108140 0x4>;
> > +
> > +	clocks = <&clkc CLKID_ETH>,
> > +		 <&clkc CLKID_MPLL2>,
> > +		 <&clkc CLKID_MPLL2>;
> > +	clock-names = "stmmaceth", "clkin0", "clkin1";
> > +
> > +	resets = <&reset RESET_ETHERNET>;
> > +	reset-names = "stmmaceth";
> >  };
> >  
> >  &gpio_intc {
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

Thanks,

Emiliano
