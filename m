From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat, 23 Sep 2017 15:15:23 +0200
Subject: [PATCH] ARM: dts: meson: fixing USB support on Meson6,
 Meson8 and Meson8b
In-Reply-To: <20170922115708.GA14806@ingrassia.epigenesys.com>
References: <20170922115708.GA14806@ingrassia.epigenesys.com>
Message-ID: <CAFBinCCDZjzCacPHLh6kMkoQ3Ygd6+HSnSHHz5cDpp65+FW6KQ@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Fri, Sep 22, 2017 at 1:57 PM, Emiliano Ingrassia
<ingrassia@epigenesys.com> wrote:
> This patch fixes the Meson6, Meson8 and Meson8b USB controllers dts nodes
> which interrupts are level type instead of edge type.
> This avoids errors like "usb 1-1-port1: cannot reset (err = -110)" and
> similars on Odroid-C1+ board.
>
> Fixes: e29b1cf87473 ("ARM: dts: meson: add USB support on Meson8 and Meson8b")
>
> Signed-off-by: Emiliano Ingrassia <ingrassia@epigenesys.com>

USB on my Meson8 (Meson8m2 to be exact) board still works fine (just
like before - maybe that was a fluke though...), confirmed by reading
a USB thumb drive to /dev/null:

Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

as well as (me being the one who originally didn't do this right):

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

> ---
>  arch/arm/boot/dts/meson.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
> index cd6ad072e72c..bf270806a688 100644
> --- a/arch/arm/boot/dts/meson.dtsi
> +++ b/arch/arm/boot/dts/meson.dtsi
> @@ -217,7 +217,7 @@
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                         reg = <0xc9040000 0x40000>;
> -                       interrupts = <GIC_SPI 30 IRQ_TYPE_EDGE_RISING>;
> +                       interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
>                         phys = <&usb0_phy>;
>                         phy-names = "usb2-phy";
>                         dr_mode = "host";
> @@ -229,7 +229,7 @@
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                         reg = <0xc90c0000 0x40000>;
> -                       interrupts = <GIC_SPI 31 IRQ_TYPE_EDGE_RISING>;
> +                       interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
>                         phys = <&usb1_phy>;
>                         phy-names = "usb2-phy";
>                         dr_mode = "host";
> --
> 2.14.1
>
