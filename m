From: narmstrong@baylibre.com (Neil Armstrong)
Date: Mon, 19 Mar 2018 14:11:47 +0100
Subject: [PATCH 3/3] arm64: dts: meson-gxl-s905x-libretech-cc: add
 cec-disable
In-Reply-To: <20180319114345.29837-4-hverkuil@xs4all.nl>
References: <20180319114345.29837-1-hverkuil@xs4all.nl>
 <20180319114345.29837-4-hverkuil@xs4all.nl>
Message-ID: <e74c5b99-760e-fad5-a1f2-a3a7ccfc1391@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 19/03/2018 12:43, Hans Verkuil wrote:
> From: Hans Verkuil <hans.verkuil@cisco.com>
> 
> This board has two CEC controllers: the DesignWare controller and
> a meson-specific controller. Disable the DW controller since the
> CEC line is hooked up to the meson controller.
> 
> Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
> index 9671f1e3c74a..271bd486fd65 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
> @@ -155,6 +155,7 @@
>  	status = "okay";
>  	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
>  	pinctrl-names = "default";
> +	cec-disable;
>  };
>  
>  &hdmi_tx_tmds_port {
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
