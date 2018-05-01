From: robh@kernel.org (Rob Herring)
Date: Tue, 1 May 2018 09:43:58 -0500
Subject: [PATCH] mmc: meson-gx: add device reset
In-Reply-To: <20180426103817.12675-1-jbrunet@baylibre.com>
References: <20180426103817.12675-1-jbrunet@baylibre.com>
Message-ID: <20180501144358.GA31556@rob-hp-laptop>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Thu, Apr 26, 2018 at 12:38:17PM +0200, Jerome Brunet wrote:
> Trigger the reset line of the mmc controller while probing, if available
> The reset should be optional for now, at least until all related DT node
> have the reset property
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  Documentation/devicetree/bindings/mmc/amlogic,meson-gx.txt | 2 ++
>  drivers/mmc/host/meson-gx-mmc.c                            | 6 ++++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx.txt b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx.txt
> index 5add8d7d855f..ba434375e7f2 100644
> --- a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx.txt
> +++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx.txt
> @@ -20,6 +20,7 @@ Required properties:
>  	"clkin1" - Other parent clock of internal mux
>    The driver has an internal mux clock which switches between clkin0 and clkin1 depending on the
>    clock rate requested by the MMC core.
> +- reset      : phandle of the internal reset line

resets

>  
>  Example:
>  
> @@ -30,4 +31,5 @@ Example:
>  		clocks = <&clkc CLKID_SD_EMMC_A>, <&xtal>, <&clkc CLKID_FCLK_DIV2>;
>  		clock-names = "core", "clkin0", "clkin1";
>  		pinctrl-0 = <&emmc_pins>;
> +		resets = <&reset RESET_SD_EMMC_A>;
>  	};
