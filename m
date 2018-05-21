From: narmstrong@baylibre.com (Neil Armstrong)
Date: Mon, 21 May 2018 16:16:20 +0200
Subject: [PATCH RFC 04/24] arm64/dts: add switch-delay for meson mali
In-Reply-To: <20180518092815.25280-5-yuq825@gmail.com>
References: <20180518092815.25280-1-yuq825@gmail.com>
 <20180518092815.25280-5-yuq825@gmail.com>
Message-ID: <8a449f66-e8f1-45aa-b6fd-153abd41c1eb@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Yuq,

On 18/05/2018 11:27, Qiang Yu wrote:
> From: Andrei Paulau <7134956@gmail.com>
> 
> Meson mali GPU operate in high clock frequency, need
> this value be high to work in a stable state.
> 
> Signed-off-by: Andrei Paulau <7134956@gmail.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> index 562c26a0ba33..00cd2fc1aa95 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> @@ -241,6 +241,7 @@
>  			"pp2", "ppmmu2";
>  		clocks = <&clkc CLKID_CLK81>, <&clkc CLKID_MALI>;
>  		clock-names = "bus", "core";
> +		switch-delay = <0xffff>;
>  
>  		/*
>  		 * Mali clocking is provided by two identical clock paths
> 

Same this one, CC it to : linux-amlogic at lists.infradead.org

Thanks,
Neil
