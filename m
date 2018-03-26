From: khilman@baylibre.com (Kevin Hilman)
Date: Mon, 26 Mar 2018 13:23:44 -0700
Subject: [PATCH] ARM64: dts: meson: reduce odroid-c2 eMMC maximum rate
In-Reply-To: <20180302134436.18844-1-jbrunet@baylibre.com>
References: <20180302134436.18844-1-jbrunet@baylibre.com>
Message-ID: <CAOi56cUO_sPYb+t2g1GmSEULu5aGA8cKqa2Yan2=T0YCYGOmSA@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Fri, Mar 2, 2018 at 5:44 AM, Jerome Brunet <jbrunet@baylibre.com> wrote:
> Different modules maybe installed by the user on the eMMC connector
> of the odroid-c2. While the red modules are working without an issue,
> it seems some black modules (apparently Samsung based) are having
> issue at 200MHz
>
> While the tuning algorithm introduced in v4.14 enables high speed modes
> on every other tested designs, it seems a problem remains for this
> particular combination of board and eMMC module.
>
> Lowering the maximum frequency of the eMMC on this board until we can
> figure out a better solution.
>
> Fixes: d341ca88eead ("mmc: meson-gx: rework tuning function")
> Suggested-by: Ellie Reeves <ellierevves@gmail.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Now in mainline as commit c04ffa71ff49 upstream.

The mainline patch has "Cc: stable at vger.kernel.org", but it doesn't
seem to have appeared in stable yet, and I've verified that it applies
cleanly to linux-4.15.y and linux-4.14.y.

Kevin


> ---
>  arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> index 73a030a5ecf3..43475139576c 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> @@ -311,7 +311,7 @@
>         pinctrl-names = "default", "clk-gate";
>
>         bus-width = <8>;
> -       max-frequency = <200000000>;
> +       max-frequency = <100000000>;
>         non-removable;
>         disable-wp;
>         cap-mmc-highspeed;
> --
> 2.14.3
>
