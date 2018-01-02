From: narmstrong@baylibre.com (Neil Armstrong)
Date: Tue, 2 Jan 2018 13:43:17 +0100
Subject: [PATCH 1/3] ARM: dts: meson8b: grow the reset controller memory
 zone
In-Reply-To: <20171226114345.23905-2-martin.blumenstingl@googlemail.com>
References: <20171226114345.23905-1-martin.blumenstingl@googlemail.com>
 <20171226114345.23905-2-martin.blumenstingl@googlemail.com>
Message-ID: <23835822-91c7-f1ea-c56c-21691a83a614@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 26/12/2017 12:43, Martin Blumenstingl wrote:
> The reset controller in the Meson8b SoCs also supports level resets.
> These use the same defines (from
> dt-bindings/reset/amlogic,meson8b-reset.h) as the reset pulses.
> 
> The reset-meson driver internally handles the difference if a consumer
> requests a reset pulse or a level reset. However, for this to work we
> must extend the memory zone of the reset controller.
> 
> Suggested-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  arch/arm/boot/dts/meson8b.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
> index df21b066c60b..ade602bbe482 100644
> --- a/arch/arm/boot/dts/meson8b.dtsi
> +++ b/arch/arm/boot/dts/meson8b.dtsi
> @@ -257,7 +257,7 @@
>  
>  	reset: reset-controller at 4404 {
>  		compatible = "amlogic,meson8b-reset";
> -		reg = <0x4404 0x20>;
> +		reg = <0x4404 0x9c>;
>  		#reset-cells = <1>;
>  	};
>  
>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
