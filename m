From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Fri, 22 Sep 2017 09:01:04 +0200
Subject: [PATCH] ARM: dts: meson: enabling the USB Host controller on
 Odroid-C1/C1+ board
In-Reply-To: <20170920144009.GA27374@ingrassia.epigenesys.com>
References: <20170920144009.GA27374@ingrassia.epigenesys.com>
Message-ID: <CAFBinCD5_5Ftgyr2-Q=Nxf4__h6CMABZ0hbxXpyTa8dyLkG=Cw@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Wed, Sep 20, 2017 at 4:40 PM, Emiliano Ingrassia
<ingrassia@epigenesys.com> wrote:
> This patch enables the USB Host controller (USB1) and the relative USB2 PHY
> on Odroid-C1/C1+ board.
>
> Signed-off-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
I don't have any Odroid hardware to play with, but this looks good to me:

Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

> ---
>  arch/arm/boot/dts/meson8b-odroidc1.dts | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
> index e50f1a1fdbc7..9ff6ca4e20d0 100644
> --- a/arch/arm/boot/dts/meson8b-odroidc1.dts
> +++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
> @@ -76,3 +76,26 @@
>         pinctrl-0 = <&uart_ao_a_pins>;
>         pinctrl-names = "default";
>  };
> +
> +&gpio_ao {
> +       /*
> +        * WARNING: The USB Hub on the Odroid-C1/C1+ needs a reset signal
> +        * to be turned high in order to be detected by the USB Controller.
> +        * This signal should be handled by a USB specific power sequence
> +        * in order to reset the Hub when USB bus is powered down.
> +        */
> +       usb-hub {
> +               gpio-hog;
> +               gpios = <GPIOAO_4 GPIO_ACTIVE_HIGH>;
> +               output-high;
> +               line-name = "usb-hub-reset";
> +       };
> +};
> +
> +&usb1_phy {
> +       status = "okay";
> +};
> +
> +&usb1 {
> +       status = "okay";
> +};
> --
> 2.14.1
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
