From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Thu, 28 Sep 2017 23:41:48 +0200
Subject: [PATCH 2/4] ARM: dts: meson8b: extending ethernet controller
 description
In-Reply-To: <aecccf76841a035f8dc5cc23dadfad66fbbac03e.1506507688.git.ingrassia@epigenesys.com>
References: <cover.1506507688.git.ingrassia@epigenesys.com>
 <aecccf76841a035f8dc5cc23dadfad66fbbac03e.1506507688.git.ingrassia@epigenesys.com>
Message-ID: <CAFBinCAwn7mz8LWMmF4cvYTWz_v6dDCQBGOu-1iU6+AOd+nbrA@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Emiliano,

On Wed, Sep 27, 2017 at 11:39 PM, Emiliano Ingrassia
<ingrassia@epigenesys.com> wrote:
> This patch adds ethernet controller pin description and extend its
> attributes in the relative node.
>
> Signed-off-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
> ---
>
> This patch corrects the meson8b-dwmac reg attributes updated by the previous
> 2/4 patch (450a483abe07f8d903c6cb74091592743975a8eb).
> The second addresses range, taken from S805 (aka Meson8b) SoC manual,
> was not correct.
>
> Please, apply this patch and discard the previous
> (450a483abe07f8d903c6cb74091592743975a8eb).
>
>  arch/arm/boot/dts/meson8b.dtsi | 40 ++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 38 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
> index bc278da7df0d..816bc9188f44 100644
> --- a/arch/arm/boot/dts/meson8b.dtsi
> +++ b/arch/arm/boot/dts/meson8b.dtsi
> @@ -154,12 +154,48 @@
>                         #gpio-cells = <2>;
>                         gpio-ranges = <&pinctrl_cbus 0 0 130>;
>                 };
> +
> +               eth_rgmii_pins: eth-rgmii {
> +                       mux {
> +                               groups = "eth_tx_clk",
> +                                        "eth_tx_en",
> +                                        "eth_txd1_0",
> +                                        "eth_txd1_1",
> +                                        "eth_txd0_0",
> +                                        "eth_txd0_1",
> +                                        "eth_rx_clk",
> +                                        "eth_rx_dv",
> +                                        "eth_rxd1",
> +                                        "eth_rxd0",
> +                                        "eth_mdio_en",
> +                                        "eth_mdc",
> +                                        "eth_ref_clk",
> +                                        "eth_txd2",
> +                                        "eth_txd3";
> +                               function = "ethernet";
> +                       };
> +               };
>         };
>  };
>
>  &ethmac {
> -       clocks = <&clkc CLKID_ETH>;
> -       clock-names = "stmmaceth";
> +       compatible = "amlogic,meson8b-dwmac", "snps,dwmac-3.70a", "snps,dwmac";
without a reg property this passes 0xc1108108 (as defined in
meson.dtsi) to the meson8b-dwmac driver.
are you sure that this shouldn't be 0xc1108140 (like in your initial patch)?
0xc1108108 translates to 0x2050 (calculation formula: (0xc1108108 -
cbus base addr 0xc1100000) / 4) which is used in Amlogic's u-boot
sources, for example [0]

currently the meson8b-dwmac driver is writing to the old register
location which probably does nothing.
if above statement is true then you are relying on the bootloader to
set up 0xc1108140 correctly.
the reason why I wrote this meson8b-dwmac driver is because I had a
GXBB board with RGMII PHY but u-boot configured the register to RMII
mode -> ethernet wasn't working.
you could verify this by zeroing both (0xc1108108 and 0xc1108140) in
u-boot or at the start of the meson8b-dwmac driver and see if ethernet
still works for you

> +
> +       interrupts = <GIC_SPI 8 IRQ_TYPE_EDGE_RISING>,
> +                    <GIC_SPI 14 IRQ_TYPE_EDGE_RISING>;
> +       interrupt-names = "macirq",
> +                         "eth_lpi";
did you receive one of the eth_lpi interrupts? if it works for you
then we should try to add this to meson-gx.dtsi as well
I also wonder if we should configure it in meson8b.dtsi or meson.dtsi

> +
> +       clock-names = "stmmaceth", "clkin0", "clkin1";
> +       clocks = <&clkc CLKID_ETH>,
> +                <&clkc CLKID_FCLK_DIV2>,
> +                <&clkc CLKID_MPLL2>;
> +
> +       resets = <&reset RESET_ETHERNET>;
> +       reset-names = "stmmaceth";
I'm not sure if this works:
our reset controller implements a reset pulse (write bit, IP block
executes a reset and clears the bit again)
stmmac on the other hand manually asserts and deasserts the reset line
(which is not implemented by our reset driver), see [1]

> +
> +       rx-fifo-depth=<4000>;
> +       tx-fifo-depth=<2000>;
could you please add spaces around "=" and some info to the commit
message why this is necessary and where you got these values from

>  };
>
>  &hwrng {
> --
> 2.14.1
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

looking forward to proper ethernet support on Meson8/Meson8b!


Regards,
Martin


[0] https://github.com/hardkernel/u-boot/blob/odroidc-v2011.03/board/hardkernel/odroidc/odroidc-eth.c#L29
[1] https://github.com/torvalds/linux/blob/master/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c#L4123
