From: narmstrong@baylibre.com (Neil Armstrong)
Date: Mon, 23 Jul 2018 09:50:06 +0200
Subject: [PATCH 1/2] ARM: dts: meson8: fix the clock controller register
 size
In-Reply-To: <20180721190553.13940-2-martin.blumenstingl@googlemail.com>
References: <20180721190553.13940-1-martin.blumenstingl@googlemail.com>
 <20180721190553.13940-2-martin.blumenstingl@googlemail.com>
Message-ID: <2d9481aa-ec60-a5d4-9096-71af017f71b9@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 21/07/2018 21:05, Martin Blumenstingl wrote:
> The clock controller registers are not 0x460 wide because the reset
> controller starts at CBUS 0x4404. This currently overlaps with the
> clock controller (which is at CBUS 0x4000).
> 
> There is no public documentation available on the actual size of the
> clock controller's register area (also called "HHI"). However, in
> Amlogic's GPL kernel sources the last "HHI" register is
> HHI_HDMI_PHY_CNTL2 at CBUS + 0x43a8. 0x400 was chosen because that size
> doesn't seem unlikely.
> 
> Fixes: 2c323c43a3d619 ("ARM: dts: meson8: add and use the real clock controller")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  arch/arm/boot/dts/meson8.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
> index d77dcf890cfc..7162e0ca05b0 100644
> --- a/arch/arm/boot/dts/meson8.dtsi
> +++ b/arch/arm/boot/dts/meson8.dtsi
> @@ -194,7 +194,7 @@
>  		#clock-cells = <1>;
>  		#reset-cells = <1>;
>  		compatible = "amlogic,meson8-clkc";
> -		reg = <0x8000 0x4>, <0x4000 0x460>;
> +		reg = <0x8000 0x4>, <0x4000 0x400>;
>  	};
>  
>  	reset: reset-controller at 4404 {
> 


Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
