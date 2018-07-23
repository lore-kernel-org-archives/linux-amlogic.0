From: narmstrong@baylibre.com (Neil Armstrong)
Date: Mon, 23 Jul 2018 09:50:15 +0200
Subject: [PATCH 2/2] ARM: dts: meson8b: fix the clock controller register
 size
In-Reply-To: <20180721190553.13940-3-martin.blumenstingl@googlemail.com>
References: <20180721190553.13940-1-martin.blumenstingl@googlemail.com>
 <20180721190553.13940-3-martin.blumenstingl@googlemail.com>
Message-ID: <a4b673c7-175c-a999-5491-5f4a09f5a2c9@baylibre.com>
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
> Fixes: 4a69fcd3a10803 ("ARM: meson: Add DTS for Odroid-C1 and Tronfy MXQ boards")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  arch/arm/boot/dts/meson8b.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
> index 08f7f6be7254..f77e419c1c65 100644
> --- a/arch/arm/boot/dts/meson8b.dtsi
> +++ b/arch/arm/boot/dts/meson8b.dtsi
> @@ -163,7 +163,7 @@
>  		#clock-cells = <1>;
>  		#reset-cells = <1>;
>  		compatible = "amlogic,meson8b-clkc";
> -		reg = <0x8000 0x4>, <0x4000 0x460>;
> +		reg = <0x8000 0x4>, <0x4000 0x400>;
>  	};
>  
>  	reset: reset-controller at 4404 {
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
