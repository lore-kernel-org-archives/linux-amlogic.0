From: narmstrong@baylibre.com (Neil Armstrong)
Date: Mon, 23 Jan 2017 09:56:45 +0100
Subject: [PATCH 09/18] ARM64: dts: meson-gxbb-wetek-hub: Reference CVBS
 node by label
In-Reply-To: <20170120222118.21476-10-afaerber@suse.de>
References: <20170120222118.21476-1-afaerber@suse.de>
 <20170120222118.21476-10-afaerber@suse.de>
Message-ID: <8ed34b3c-7cdc-662b-d017-40b282e53d8f@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 01/20/2017 11:21 PM, Andreas F?rber wrote:
> Signed-off-by: Andreas F?rber <afaerber@suse.de>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi     | 2 +-
>  arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
> index 5183c5ce90c6..0d134a85e3a0 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
> @@ -126,7 +126,7 @@
>  		clock-names = "ext_clock";
>  	};
>  
> -	cvbs-connector {
> +	cvbs_connector: cvbs-connector {
>  		compatible = "composite-video-connector";
>  
>  		port {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts
> index 56f855901262..6e35265dc2fc 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts
> @@ -59,8 +59,8 @@
>  			panic-indicator;
>  		};
>  	};
> +};
>  
> -	cvbs-connector {
> -		status = "disabled";
> -	};
> +&cvbs_connector {
> +	status = "disabled";
>  };
> 

Indeed, much cleaner

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
