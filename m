From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu, 23 Mar 2017 08:46:24 +0100
Subject: [PATCH 1/4] meson_uart: expose CLKID_UART0
In-Reply-To: <8bfedbda-5429-400f-c77b-a9bdb793fdaf@gmail.com>
References: <8bfedbda-5429-400f-c77b-a9bdb793fdaf@gmail.com>
Message-ID: <58D37D50.1080401@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Le 22/03/2017 21:45, Helmut Klein a ?crit :
> this patch exposes the CLKID_UART0 to dt-bindings
> 
> diff -Napur a/include/dt-bindings/clock/gxbb-clkc.h b/include/dt-bindings/clock/gxbb-clkc.h
> --- a/include/dt-bindings/clock/gxbb-clkc.h    2017-03-09 21:09:50.000000000 +0100
> +++ b/include/dt-bindings/clock/gxbb-clkc.h    2017-03-22 19:04:32.220233526 +0100
> @@ -15,6 +15,7 @@
>  #define CLKID_SPI        34
>  #define CLKID_I2C        22
>  #define CLKID_SAR_ADC        23
> +#define CLKID_UART0        26
>  #define CLKID_ETH        36
>  #define CLKID_USB0        50
>  #define CLKID_USB1        51
> diff -Napur a/drivers/clk/meson/gxbb.h b/drivers/clk/meson/gxbb.h
> --- a/drivers/clk/meson/gxbb.h    2017-03-09 21:09:41.000000000 +0100
> +++ b/drivers/clk/meson/gxbb.h    2017-03-22 19:05:32.120151735 +0100
> @@ -194,7 +194,7 @@
>  /* #define CLKID_SAR_ADC */
>  #define CLKID_SMART_CARD      24
>  #define CLKID_RNG0          25
> -#define CLKID_UART0          26
> +/* CLKID_UART0 */
>  #define CLKID_SDHC          27
>  #define CLKID_STREAM          28
>  #define CLKID_ASYNC_FIFO      29
> 

This one looks good, but please Cc the linux-arm-kernel (for all arm related), linux-clk (for clk related), devicetree at vger.kernel.org (for all DT related) and linux-kernel at vger.kernel.org
in all your communications.

Neil
