From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 28 Jan 2018 21:27:30 +0100
Subject: [PATCH v2 1/2] ARM: dts: meson8b: extend ethernet controller
 description
In-Reply-To: <62efe8a6912c5d6f2770c0f3b33d4829e9ee2606.1516326105.git.ingrassia@epigenesys.com>
References: <cover.1516326105.git.ingrassia@epigenesys.com>
 <62efe8a6912c5d6f2770c0f3b33d4829e9ee2606.1516326105.git.ingrassia@epigenesys.com>
Message-ID: <CAFBinCDy_3tLrb_AMTkGa9ML+CF+ZwYYH_ODXZ7XO6wYphq3jQ@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Fri, Jan 19, 2018 at 2:48 AM, Emiliano Ingrassia
<ingrassia@epigenesys.com> wrote:
> Enable S805 (aka Meson8b) ethernet pin multiplexing and
> extend the controller description.
> The programmable ethernet (PRG_ETHERNET) register address
> value (0xc1108108), contained in meson.dtsi, is overridden
> according to the value found in S805 SoC manual.
> This also required to switch to "amlogic,meson8b-dwmac" compatible
> to correctly configure that register.
> The two clock sources "clkin0" and "clkin1" are both equals
> to MPLL2 because, as reported in bit 9-7 register description,
> that is the only Meson8b ethernet clock source.
>
> Signed-off-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

> ---
>  arch/arm/boot/dts/meson8b.dtsi | 35 +++++++++++++++++++++++++++++++++--
>  1 file changed, 33 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
> index d75e0ceda8bb..fa5274aa370b 100644
> --- a/arch/arm/boot/dts/meson8b.dtsi
> +++ b/arch/arm/boot/dts/meson8b.dtsi
> @@ -185,6 +185,27 @@
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
> @@ -203,8 +224,18 @@
>  };
>
>  &ethmac {
> -       clocks = <&clkc CLKID_ETH>;
> -       clock-names = "stmmaceth";
> +       compatible = "amlogic,meson8b-dwmac", "snps,dwmac-3.70a", "snps,dwmac";
> +
> +       reg = <0xc9410000 0x10000
> +              0xc1108140 0x4>;
> +
> +       clocks = <&clkc CLKID_ETH>,
> +                <&clkc CLKID_MPLL2>,
> +                <&clkc CLKID_MPLL2>;
> +       clock-names = "stmmaceth", "clkin0", "clkin1";
> +
> +       resets = <&reset RESET_ETHERNET>;
> +       reset-names = "stmmaceth";
>  };
>
>  &gpio_intc {
> --
> 2.15.1
>
