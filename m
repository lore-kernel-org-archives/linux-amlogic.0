From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu, 8 Nov 2018 14:30:17 +0100
Subject: [PATCH 2/3] ARM: dts: meson8: minix-neo-x8: add the
 /chosen/stdout-path property
In-Reply-To: <20181028140343.1071-3-martin.blumenstingl@googlemail.com>
References: <20181028140343.1071-1-martin.blumenstingl@googlemail.com>
 <20181028140343.1071-3-martin.blumenstingl@googlemail.com>
Message-ID: <770019ac-ac99-81bc-cff8-4f00d6b847d3@baylibre.com>
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
>  arch/arm/boot/dts/meson8-minix-neo-x8.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/meson8-minix-neo-x8.dts b/arch/arm/boot/dts/meson8-minix-neo-x8.dts
> index 8bceb8d343f6..55fb090a40ef 100644
> --- a/arch/arm/boot/dts/meson8-minix-neo-x8.dts
> +++ b/arch/arm/boot/dts/meson8-minix-neo-x8.dts
> @@ -52,6 +52,10 @@
>  		serial0 = &uart_AO;
>  	};
>  
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
>  	memory {
>  		reg = <0x40000000 0x80000000>;
>  	};
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
