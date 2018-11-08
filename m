From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu, 8 Nov 2018 14:30:25 +0100
Subject: [PATCH 3/3] ARM: dts: meson8b: mxq: add the /chosen/stdout-path
 property
In-Reply-To: <20181028140343.1071-4-martin.blumenstingl@googlemail.com>
References: <20181028140343.1071-1-martin.blumenstingl@googlemail.com>
 <20181028140343.1071-4-martin.blumenstingl@googlemail.com>
Message-ID: <3db8e741-ac18-8310-dd96-c0831829c6bf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 28/10/2018 15:03, Martin Blumenstingl wrote:
> Support for this board is currently very limited. To debug any potential
> issues on this board the "earlycon" kernel parameter can be used (without
> any arguments). However, this requires the board to define a
> /chosen/stdout-path property in it's .dts.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  arch/arm/boot/dts/meson8b-mxq.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/meson8b-mxq.dts b/arch/arm/boot/dts/meson8b-mxq.dts
> index c7fdaeabbe7b..5c9b76af8d42 100644
> --- a/arch/arm/boot/dts/meson8b-mxq.dts
> +++ b/arch/arm/boot/dts/meson8b-mxq.dts
> @@ -55,6 +55,10 @@
>  		serial0 = &uart_AO;
>  	};
>  
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
>  	memory {
>  		reg = <0x40000000 0x40000000>;
>  	};
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
