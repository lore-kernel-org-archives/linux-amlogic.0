From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 28 Oct 2018 12:32:14 +0100
Subject: [PATCH] arm64: dts: meson-gxl: add support for phicomm n1
In-Reply-To: <20181013094502.7563-1-yangxuan8282@gmail.com>
References: <20181013094502.7563-1-yangxuan8282@gmail.com>
Message-ID: <CAFBinCDTmieGS94ihvhUGbZMZjL0PwDJdQVEU8M_5r14x3ayjg@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi,

many thanks for your patch!

On Sat, Oct 13, 2018 at 11:45 AM <yangxuan8282@gmail.com> wrote:
>
> From: He Yangxuan <yangxuan8282@gmail.com>
>
> This patch adds support for the Phicomm N1. This device based on P230 reference design.
> The phy is RTL8211F, need to disable Energy Efficient Ethernet (EEE) to make it stable.
> And this box doesn't have cvbs, so disable related section in device tree.
do you have any hint how to connect the serial console on the PCB?

> Signed-off-by: He Yangxuan <yangxuan8282@gmail.com>
> ---
>  arch/arm64/boot/dts/amlogic/Makefile               |  1 +
>  .../dts/amlogic/meson-gxl-s905d-phicomm-n1.dts     | 32 ++++++++++++++++++++++
>  2 files changed, 33 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts
>
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index a97c0e2d7..ebd96da2c 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -17,6 +17,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-nexbox-a95x.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-p212.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-p230.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-p231.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-phicomm-n1.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s805x-p241.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905w-p281.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905w-tx3-mini.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts
> new file mode 100644
> index 000000000..1daf58df0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2018 He Yangxuan
> + */
> +
> +/dts-v1/;
> +
> +#include "meson-gxl-s905d-p230.dts"
> +
> +/ {
> +       compatible = "phicomm,n1", "amlogic,s905d", "amlogic,meson-gxl";
the "phicomm" vendor-prefix should be documented in
devicetree/bindings/vendor-prefixes.txt (in a separate pach)
additionally "phicomm,n1" should be documented in
Documentation/devicetree/bindings/arm/amlogic.txt (in a separate patch
as well)

> +       model = "Phicomm N1";
> +
> +       cvbs-connector {
> +               status = "disabled";
> +       };
> +};
> +
> +&cvbs_vdac_port {
> +       status = "disabled";
> +};
> +
> +&external_mdio {
> +       external_phy: ethernet-phy at 0 {
> +               compatible = "ethernet-phy-id001c.c916", "ethernet-phy-ieee802.3-c22";
please don't use a "ethernet-phy-id..." compatible
see commit 7630ea4bda18df "Documentation: net: phy: improve
explanation when to specify the PHY ID" for the reason why (when the
documentation was updated we already used "ethernet-phy-id..." for
some boards)

> +               reg = <0>;
> +               eee-broken-1000t;
> +               max-speed = <1000>;
> +               interrupt-parent = <&gpio_intc>;
please add a comment here stating to which GPIO IRQ 29 belongs to (see
meson-gxm-khadas-vim2.dts for an example)

> +               interrupts = <29 IRQ_TYPE_LEVEL_LOW>;
> +       };
> +};
> --
> 2.11.0
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic


Regards
Martin
