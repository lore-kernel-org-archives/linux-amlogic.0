From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Tue, 25 Jul 2017 20:51:15 +0200
Subject: [PATCH] ARM: dts: meson: Fixing L2 cache controller node for
 Meson8 and Meson8b
In-Reply-To: <20170725152330.GA11792@ingrassia.epigenesys.com>
References: <20170725152330.GA11792@ingrassia.epigenesys.com>
Message-ID: <CAFBinCBZ9BWfZ3rewsM=agJaFvpKNT=bADdTfv=+kV5GbnfT6w@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Emiliano,

On Tue, Jul 25, 2017 at 5:23 PM, Emiliano Ingrassia
<ingrassia@epigenesys.com> wrote:
> Changing address filtering range to support the entire DDR region.
> The previous range prevents ODROID-C1+ board from booting.
thanks for the patch!
could you please explain what issue you are seeing exactly? kernelci
also has an Odroid-C1 in it's farm and it seems to boot mainline
(4.13-rc2+) just fine, see: [0]

I would like to understand why it's not working for you
(I do not have an Odroid-C1 board myself, but my EC-100 also comes
with a Meson8b SoC and 2GiB RAM and it boots fine there also)

> Signed-off-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
> ---
>  arch/arm/boot/dts/meson8b.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
> index 72e4f425f190..3f0850cf3403 100644
> --- a/arch/arm/boot/dts/meson8b.dtsi
> +++ b/arch/arm/boot/dts/meson8b.dtsi
> @@ -190,7 +190,7 @@
>  &L2 {
>         arm,data-latency = <3 3 3>;
>         arm,tag-latency = <2 2 2>;
> -       arm,filter-ranges = <0x100000 0xc0000000>;
> +       arm,filter-ranges = <0x0 0xc0000000>;
>  };
>
>  &saradc {
> --
> 2.13.2
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

Regards,
Martin


[0] https://storage.kernelci.org/mainline/master/v4.13-rc2-11-g25f6a53799d6/arm/multi_v7_defconfig/lab-baylibre-seattle/boot-meson8b-odroidc1.html
