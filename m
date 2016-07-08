From: afaerber@suse.de (=?UTF-8?Q?Andreas_F=c3=a4rber?=)
Date: Fri, 8 Jul 2016 03:09:10 +0200
Subject: [PATCH 1/3] ARM64: dts: amlogic: enable ethernet on all Tronsmart
 Vega S95 devices
In-Reply-To: <20160625163446.7245-2-martin.blumenstingl@googlemail.com>
References: <20160625163446.7245-1-martin.blumenstingl@googlemail.com>
 <20160625163446.7245-2-martin.blumenstingl@googlemail.com>
Message-ID: <577EFD36.4030601@suse.de>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Am 25.06.2016 um 18:34 schrieb Martin Blumenstingl:
> All of these have a Realtek Gbit RGMII PHY.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
> index 54bb7c7..e36b509 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
> @@ -60,3 +60,9 @@
>  	pinctrl-names = "default";
>  
>  };
> +
> +&ethmac {
> +	status = "okay";
> +	pinctrl-0 = <&eth_pins>;
> +	pinctrl-names = "default";
> +};

Detected okay on Vega S95 Telos,

Tested-by: Andreas F?rber <afaerber@suse.de>

Thanks,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N?rnberg, Germany
GF: Felix Imend?rffer, Jane Smithard, Graham Norton
HRB 21284 (AG N?rnberg)
