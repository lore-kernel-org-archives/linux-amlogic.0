From: ingrassia@epigenesys.com (Emiliano Ingrassia)
Date: Fri, 29 Dec 2017 13:04:24 +0100
Subject: [RFT net-next v3 0/5] dwmac-meson8b: RGMII clock fixes for Meson8b
In-Reply-To: <CAFBinCDVRNKBTG0CHcmV9iJ9gb2VeODCfU6BO+dyRU6bVwkffg@mail.gmail.com>
References: <20171228222128.15215-1-martin.blumenstingl@googlemail.com>
 <20171229013116.GA5446@ingrassia.epigenesys.com>
 <CAFBinCDVRNKBTG0CHcmV9iJ9gb2VeODCfU6BO+dyRU6bVwkffg@mail.gmail.com>
Message-ID: <20171229120424.GA5888@ingrassia.epigenesys.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Martin,

On Fri, Dec 29, 2017 at 08:48:54AM +0100, Martin Blumenstingl wrote:
> Hi Emiliano,
> 
> On Fri, Dec 29, 2017 at 2:31 AM, Emiliano Ingrassia
> <ingrassia@epigenesys.com> wrote:
> > Hi Martin, Hi Dave,
> >
> > On Thu, Dec 28, 2017 at 11:21:23PM +0100, Martin Blumenstingl wrote:
> >> Hi Dave,
> >>
> >> please do not apply this series until it got a Tested-by from Emiliano.
> >>
> >>
> >> Hi Emiliano,
> >>
> >> you reported [0] that you couldn't get dwmac-meson8b to work on your
> >> Odroid-C1. With your findings (register dumps, clk_summary output, etc.)
> >> I think I was able to find a fix: it consists of two patches (which you
> >> find in this series)
> >>
> >> Unfortunately I don't have any Meson8b boards with RGMII PHY so I could
> >> only partially test this (I could only check if the clocks were
> >> calculated correctly when using a dummy 500002394Hz input clock instead
> >> of MPLL2).
> >>
> >> Could you please give this series a try and let me know about the
> >> results?
> >> You obviously still need your two "ARM: dts: meson8b" patches which
> >> - add the amlogic,meson8b-dwmac" compatible to meson8b.dtsi
> >> - enable Ethernet on the Odroid-C1
> >>
> >> When testing on Meson8b this also needs a fix for the MPLL clock driver:
> >> "clk: meson: mpll: use 64-bit maths in params_from_rate", see:
> >> https://patchwork.kernel.org/patch/10131677/
> >>
> >>
> >> I have tested this myself on a Khadas VIM (GXL SoC, internal RMII PHY)
> >> and a Khadas VIM2 (GXM SoC, external RGMII PHY). Both are still working
> >> fine (so let's hope that this also fixes your Meson8b issue :)).
> >>
> >>
> >> changes since v1 at [1]:
> >> - changed the subject of the cover-letter to indicate that this is all
> >>   about the RGMII clock
> >> - added PATCH #1 which ensures that we don't unnecessarily change the
> >>   parent clocks in RMII mode (and also makes the code easier to
> >>   understand)
> >> - changed subject of PATCH #2 (formerly PATCH #1) to state that this
> >>   is about the RGMII clock
> >> - added Jerome's Reviewed-by to PATCH #2 (formerly PATCH #1)
> >> - replaced PATCH #3 (formerly PATCH #2) with one that sets
> >>   CLK_SET_RATE_PARENT on the mux and thus re-configures the MPLL2 clock
> >>   on Meson8b correctly
> >>
> >> changes since v2 at [2]:
> >> - added PATCH #2 to make the following patch easier
> >> - Emiliano reported that there's currently another bug in the
> >>   dwmac-meson8b driver which prevents it from working with RGMII PHYs on
> >>   Meson8b: bit 10 of the PRG_ETH0 register is configures a clock gate
> >>   (instead of a divide by 5 or divide by 10 clock divider). This has not
> >>   been visible on GXBB and later due to the input clock which always led
> >>   to a selection of "divide by 10" (which is done internally in the IP
> >>   block, but the bit actually means "enable RGMII clock output").
> >>   PATCH #3 was added to address this issue.
> >> - the commit message of PATCH #4 and #5 (formerly PATCH #2 and #3) were
> >>   updated and the patch itself rebased because the m25_div clock was
> >>   removed with the new PATCH #3 (so some of the statements were not
> >>   valid anymore)
> >>
> >
> > Here is the clk_summary relative to ethernet on Odroid-C1+
> > with this new series applied:
> >
> > xtal                                1            1    24000000          0 0
> >  sys_pll                            0            0  1200000000          0 0
> >   cpu_clk                           0            0  1200000000          0 0
> >  vid_pll                            0            0   732000000          0 0
> >  fixed_pll                          2            2  2550000000          0 0
> >   mpll2                             1            1   249999701          0 0
> >    c9410000.ethernet#m250_sel       1            1   249999701          0 0
> >     c9410000.ethernet#m250_div      1            1   249999701          0 0
> >      c9410000.ethernet#fixed_div10  1            1    24999970          0 0
> >       c9410000.ethernet#m25_en      1            1    24999970          0 0
> >
> > The ethernet prg0 register is set to 0x74A1 which should be correct with
> > respect to the information contained in the S805 SoC manual.
> > Actually, the ethernet is not yet fully functional.
> > Trying to ping the board, I can see ARP request from host to board using
> > tcpdump. However, the host can't see any response.
> great - we're getting closer!
> 
> > Following the U-Boot value for prg0 register, which is 0x7d21, I also
> > tried to set bit 11. As expected, this did not have any influence.
> it *may* be something outside the PRG_ETH0 register than
> to confirm that: could you temporarily revert the last patch from this
> series ("net: stmmac: dwmac-meson8b: propagate rate changes to the
> parent clock")? this way MPLL2 will stay at ~500MHz and PRG_ETH0
> should be identical to what u-boot sets (apart from bit 11, but that
> is only relevant in RMII mode according to the datasheet)
>

Here is the clk_summary after your suggestion:

xtal                                 1            1    24000000          0 0
 sys_pll                             0            0  1200000000          0 0
  cpu_clk                            0            0  1200000000          0 0
 vid_pll                             0            0   732000000          0 0
 fixed_pll                           2            2  2550000000          0 0
  mpll2                              1            1   500002394          0 0
   c9410000.ethernet#m250_sel        1            1   500002394          0 0
    c9410000.ethernet#m250_div	     1            1   166667465          0 0
     c9410000.ethernet#fixed_div10   1            1    16666746          0 0
      c9410000.ethernet#m25_en       1            1    16666746          0 0

which seems worse. Pinging the board, I still see ARP request/reply via
tcpdump. The host, however, can't see any.

> > Another thing that we should check is the "Ethernet Memory PD" (see S805
> > manual - sec. 5.4) register which bits 3-2 enable/disable ethernet
> > normal operation. However, those bits are already cleared by U-Boot.
> if the peripheral registers itself are configured correctly it's
> typically one of these issues:
> - gate clock not being enabled (can you confirm that you hav the
> "stmmaceth" with CLKID_ETH in the ethmac node?)

- yes, I have;

> - incorrect pinmux settings (as a hack I would remove all ethernet
> pinctrl properties/nodes from meson8b.dtsi and meson8b-odroidc1.dts.
> before booting the mainline kernel you'll need to use Ethernet from
> within u-boot once)

- tried; nothing changed;

> - incorrect TX delay (amlogic,tx-delay-ns = <2> should be defined in
> meson8b-odroidc1.dts, but the driver should auto-select that value if
> it's missing)

- defined as in odroid-c2 dts;

> - IP block being in some undefined state which can be brought back
> into a working state by adding the reset line (RESET_ETHERNET)

- I have it;

> - Ethernet PHY being in some undefined state  can be brought back into
> a working state by adding the reset line (GPIOH_4, see
> meson-gxbb-odroidc2.dts how to use that)

- have it.

> - I have not seen that the power-domains ("Ethernet Memory PD") were a
> problem yet, but you already checked that
> 
> maybe you can share your current .dts patch and a boot-log so others
> can have a look as well?
>

OK, no problem.

> > Thank you for the support.
> thank you for your patience as well, most people would have given up by now
> 
> > Best regards,
> >
> > Emiliano
> >
> >>
> >> [0] http://lists.infradead.org/pipermail/linux-amlogic/2017-December/005596.html
> >> [1] http://lists.infradead.org/pipermail/linux-amlogic/2017-December/005848.html
> >> [2] http://lists.infradead.org/pipermail/linux-amlogic/2017-December/005861.html
> >>
> >>
> >> Martin Blumenstingl (5):
> >>   net: stmmac: dwmac-meson8b: only configure the clocks in RGMII mode
> >>   net: stmmac: dwmac-meson8b: simplify generating the clock names
> >>   net: stmmac: dwmac-meson8b: fix internal RGMII clock configuration
> >>   net: stmmac: dwmac-meson8b: fix setting the RGMII clock on Meson8b
> >>   net: stmmac: dwmac-meson8b: propagate rate changes to the parent clock
> >>
> >>  .../net/ethernet/stmicro/stmmac/dwmac-meson8b.c    | 119 +++++++++++----------
> >>  1 file changed, 63 insertions(+), 56 deletions(-)
> >>
> >> --
> >> 2.15.1
> >>
> 
> 
> Regards
> Martin
> 

Regards,

Emiliano

> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
-------------- next part --------------
/*
 * Copyright 2015 Endless Mobile, Inc.
 * Author: Carlo Caione <carlo@endlessm.com>
 *
 * This file is dual-licensed: you can use it either under the terms
 * of the GPL or the X11 license, at your option. Note that this dual
 * licensing only applies to this file, and not this project as a
 * whole.
 *
 *  a) This library is free software; you can redistribute it and/or
 *     modify it under the terms of the GNU General Public License as
 *     published by the Free Software Foundation; either version 2 of the
 *     License, or (at your option) any later version.
 *
 *     This library is distributed in the hope that it will be useful,
 *     but WITHOUT ANY WARRANTY; without even the implied warranty of
 *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *     GNU General Public License for more details.
 *
 *     You should have received a copy of the GNU General Public License
 *     along with this program. If not, see <http://www.gnu.org/licenses/>.
 *
 * Or, alternatively,
 *
 *  b) Permission is hereby granted, free of charge, to any person
 *     obtaining a copy of this software and associated documentation
 *     files (the "Software"), to deal in the Software without
 *     restriction, including without limitation the rights to use,
 *     copy, modify, merge, publish, distribute, sublicense, and/or
 *     sell copies of the Software, and to permit persons to whom the
 *     Software is furnished to do so, subject to the following
 *     conditions:
 *
 *     The above copyright notice and this permission notice shall be
 *     included in all copies or substantial portions of the Software.
 *
 *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 *     OTHER DEALINGS IN THE SOFTWARE.
 */

#include <dt-bindings/clock/meson8b-clkc.h>
#include <dt-bindings/gpio/meson8b-gpio.h>
#include <dt-bindings/reset/amlogic,meson8b-reset.h>
#include <dt-bindings/reset/amlogic,meson8b-clkc-reset.h>
#include "meson.dtsi"

/ {
	cpus {
		#address-cells = <1>;
		#size-cells = <0>;

		cpu at 200 {
			device_type = "cpu";
			compatible = "arm,cortex-a5";
			next-level-cache = <&L2>;
			reg = <0x200>;
			enable-method = "amlogic,meson8b-smp";
			resets = <&clkc CLKC_RESET_CPU0_SOFT_RESET>;
		};

		cpu at 201 {
			device_type = "cpu";
			compatible = "arm,cortex-a5";
			next-level-cache = <&L2>;
			reg = <0x201>;
			enable-method = "amlogic,meson8b-smp";
			resets = <&clkc CLKC_RESET_CPU1_SOFT_RESET>;
		};

		cpu at 202 {
			device_type = "cpu";
			compatible = "arm,cortex-a5";
			next-level-cache = <&L2>;
			reg = <0x202>;
			enable-method = "amlogic,meson8b-smp";
			resets = <&clkc CLKC_RESET_CPU2_SOFT_RESET>;
		};

		cpu at 203 {
			device_type = "cpu";
			compatible = "arm,cortex-a5";
			next-level-cache = <&L2>;
			reg = <0x203>;
			enable-method = "amlogic,meson8b-smp";
			resets = <&clkc CLKC_RESET_CPU3_SOFT_RESET>;
		};
	};

	reserved-memory {
		#address-cells = <1>;
		#size-cells = <1>;
		ranges;

		/* 2 MiB reserved for Hardware ROM Firmware? */
		hwrom at 0 {
			reg = <0x0 0x200000>;
			no-map;
		};
	};

	scu at c4300000 {
		compatible = "arm,cortex-a5-scu";
		reg = <0xc4300000 0x100>;
	};
}; /* end of / */

&aobus {
	pmu: pmu at e0 {
		compatible = "amlogic,meson8b-pmu", "syscon";
		reg = <0xe0 0x18>;
	};

	pinctrl_aobus: pinctrl at 84 {
		compatible = "amlogic,meson8b-aobus-pinctrl";
		reg = <0x84 0xc>;
		#address-cells = <1>;
		#size-cells = <1>;
		ranges;

		gpio_ao: ao-bank at 14 {
			reg = <0x14 0x4>,
				<0x2c 0x4>,
				<0x24 0x8>;
			reg-names = "mux", "pull", "gpio";
			gpio-controller;
			#gpio-cells = <2>;
			gpio-ranges = <&pinctrl_aobus 0 0 16>;
		};

		uart_ao_a_pins: uart_ao_a {
			mux {
				groups = "uart_tx_ao_a", "uart_rx_ao_a";
				function = "uart_ao";
			};
		};
	};
};

&cbus {
	clkc: clock-controller at 4000 {
		#clock-cells = <1>;
		#reset-cells = <1>;
		compatible = "amlogic,meson8b-clkc";
		reg = <0x8000 0x4>, <0x4000 0x460>;
	};

	reset: reset-controller at 4404 {
		compatible = "amlogic,meson8b-reset";
		reg = <0x4404 0x20>;
		#reset-cells = <1>;
	};

	analog_top: analog-top at 81a8 {
		compatible = "amlogic,meson8b-analog-top", "syscon";
		reg = <0x81a8 0x14>;
	};

	pwm_ef: pwm at 86c0 {
		compatible = "amlogic,meson8b-pwm";
		reg = <0x86c0 0x10>;
		#pwm-cells = <3>;
		status = "disabled";
	};

	pinctrl_cbus: pinctrl at 9880 {
		compatible = "amlogic,meson8b-cbus-pinctrl";
		reg = <0x9880 0x10>;
		#address-cells = <1>;
		#size-cells = <1>;
		ranges;

		gpio: banks at 80b0 {
			reg = <0x80b0 0x28>,
				<0x80e8 0x18>,
				<0x8120 0x18>,
				<0x8030 0x38>;
			reg-names = "mux", "pull", "pull-enable", "gpio";
			gpio-controller;
			#gpio-cells = <2>;
			gpio-ranges = <&pinctrl_cbus 0 0 130>;
		};

		eth_rgmii_pins: eth-rgmii {
			mux {
				groups = "eth_tx_clk",
					 "eth_tx_en",
					 "eth_txd1_0",
					 "eth_txd1_1",
					 "eth_txd0_0",
					 "eth_txd0_1",
					 "eth_rx_clk",
					 "eth_rx_dv",
					 "eth_rxd1",
					 "eth_rxd0",
					 "eth_mdio_en",
					 "eth_mdc",
					 "eth_ref_clk",
					 "eth_txd2",
					 "eth_txd3";
				function = "ethernet";
			};
		};
	};
};

&ahb_sram {
	smp-sram at 1ff80 {
		compatible = "amlogic,meson8b-smp-sram";
		reg = <0x1ff80 0x8>;
	};
};


&efuse {
	compatible = "amlogic,meson8b-efuse";
	clocks = <&clkc CLKID_EFUSE>;
	clock-names = "core";
};

&ethmac {
	compatible = "amlogic,meson8b-dwmac", "snps,dwmac-3.70a", "snps,dwmac";

	reg = <0xc9410000 0x10000
	       0xc1108140 0x4>;

	clocks = <&clkc CLKID_ETH>,
		 <&clkc CLKID_MPLL2>,
		 <&clkc CLKID_MPLL2>;
	clock-names = "stmmaceth", "clkin0", "clkin1";

	resets = <&reset RESET_ETHERNET>;
	reset-names = "stmmaceth";
};

&gpio_intc {
	compatible = "amlogic,meson-gpio-intc",
		     "amlogic,meson8b-gpio-intc";
	status = "okay";
};

&hwrng {
	compatible = "amlogic,meson8b-rng", "amlogic,meson-rng";
	clocks = <&clkc CLKID_RNG0>;
	clock-names = "core";
};

&L2 {
	arm,data-latency = <3 3 3>;
	arm,tag-latency = <2 2 2>;
	arm,filter-ranges = <0x100000 0xc0000000>;
};

&pwm_ab {
	compatible = "amlogic,meson8b-pwm";
};

&pwm_cd {
	compatible = "amlogic,meson8b-pwm";
};

&saradc {
	compatible = "amlogic,meson8b-saradc", "amlogic,meson-saradc";
	clocks = <&clkc CLKID_XTAL>,
		<&clkc CLKID_SAR_ADC>,
		<&clkc CLKID_SANA>;
	clock-names = "clkin", "core", "sana";
};

&sdio {
	compatible = "amlogic,meson8b-sdio", "amlogic,meson-mx-sdio";
	clocks = <&clkc CLKID_SDIO>, <&clkc CLKID_CLK81>;
	clock-names = "core", "clkin";
};

&uart_AO {
	clocks = <&clkc CLKID_CLK81>;
};

&uart_A {
	clocks = <&clkc CLKID_CLK81>;
};

&uart_B {
	clocks = <&clkc CLKID_CLK81>;
};

&uart_C {
	clocks = <&clkc CLKID_CLK81>;
};

&usb0 {
	compatible = "amlogic,meson8b-usb", "snps,dwc2";
	clocks = <&clkc CLKID_USB0_DDR_BRIDGE>;
	clock-names = "otg";
};

&usb1 {
	compatible = "amlogic,meson8b-usb", "snps,dwc2";
	clocks = <&clkc CLKID_USB1_DDR_BRIDGE>;
	clock-names = "otg";
};

&usb0_phy {
	compatible = "amlogic,meson8b-usb2-phy", "amlogic,meson-mx-usb2-phy";
	clocks = <&clkc CLKID_USB>, <&clkc CLKID_USB0>;
	clock-names = "usb_general", "usb";
	resets = <&reset RESET_USB_OTG>;
};

&usb1_phy {
	compatible = "amlogic,meson8b-usb2-phy", "amlogic,meson-mx-usb2-phy";
	clocks = <&clkc CLKID_USB>, <&clkc CLKID_USB1>;
	clock-names = "usb_general", "usb";
	resets = <&reset RESET_USB_OTG>;
};

&wdt {
	compatible = "amlogic,meson8b-wdt";
};
-------------- next part --------------
/*
 * Copyright 2015 Endless Mobile, Inc.
 * Author: Carlo Caione <carlo@endlessm.com>
 *
 * This file is dual-licensed: you can use it either under the terms
 * of the GPL or the X11 license, at your option. Note that this dual
 * licensing only applies to this file, and not this project as a
 * whole.
 *
 *  a) This library is free software; you can redistribute it and/or
 *     modify it under the terms of the GNU General Public License as
 *     published by the Free Software Foundation; either version 2 of the
 *     License, or (at your option) any later version.
 *
 *     This library is distributed in the hope that it will be useful,
 *     but WITHOUT ANY WARRANTY; without even the implied warranty of
 *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *     GNU General Public License for more details.
 *
 *     You should have received a copy of the GNU General Public License
 *     along with this program. If not, see <http://www.gnu.org/licenses/>.
 *
 * Or, alternatively,
 *
 *  b) Permission is hereby granted, free of charge, to any person
 *     obtaining a copy of this software and associated documentation
 *     files (the "Software"), to deal in the Software without
 *     restriction, including without limitation the rights to use,
 *     copy, modify, merge, publish, distribute, sublicense, and/or
 *     sell copies of the Software, and to permit persons to whom the
 *     Software is furnished to do so, subject to the following
 *     conditions:
 *
 *     The above copyright notice and this permission notice shall be
 *     included in all copies or substantial portions of the Software.
 *
 *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 *     OTHER DEALINGS IN THE SOFTWARE.
 */

/dts-v1/;
#include "meson8b.dtsi"
#include <dt-bindings/gpio/gpio.h>

/ {
	model = "Hardkernel ODROID-C1";
	compatible = "hardkernel,odroid-c1", "amlogic,meson8b";

	aliases {
		serial0 = &uart_AO;
	};

	memory {
		reg = <0x40000000 0x40000000>;
	};

	leds {
		compatible = "gpio-leds";
		blue {
			label = "c1:blue:alive";
			gpios = <&gpio_ao GPIOAO_13 GPIO_ACTIVE_LOW>;
			linux,default-trigger = "heartbeat";
			default-state = "off";
		};
	};
};

&uart_AO {
	status = "okay";
	pinctrl-0 = <&uart_ao_a_pins>;
	pinctrl-names = "default";
};

&gpio_ao {
	/*
	 * WARNING: The USB Hub on the Odroid-C1/C1+ needs a reset signal
	 * to be turned high in order to be detected by the USB Controller.
	 * This signal should be handled by a USB specific power sequence
	 * in order to reset the Hub when USB bus is powered down.
	 */
	usb-hub {
		gpio-hog;
		gpios = <GPIOAO_4 GPIO_ACTIVE_HIGH>;
		output-high;
		line-name = "usb-hub-reset";
	};
};

&usb1_phy {
	status = "okay";
};

&usb1 {
	status = "okay";
};

&ethmac {
	status = "okay";

	snps,reset-gpio = <&gpio GPIOH_4 GPIO_ACTIVE_HIGH>;
	snps,reset-active-low;
	snps,reset-delays-us = <0 10000 30000>;

	pinctrl-0 = <&eth_rgmii_pins>;
	pinctrl-names = "default";

	phy-mode = "rgmii";
	phy-handle = <&eth_phy>;
	amlogic,tx-delay-ns = <2>;

	mdio {
		compatible = "snps,dwmac-mdio";
		#address-cells = <1>;
		#size-cells = <0>;

		eth_phy: ethernet-phy at 0 {
			/* ethernet PHY RTL8211F */
			compatible = "ethernet-phy-id001c.c916",
				     "ethernet-phy-ieee802.3-c22";
			reg = <0>;
			max-speed = <1000>;
			eee-broken-1000t;
			interrupt-parent = <&gpio_intc>;
			interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
		};
	};
};
