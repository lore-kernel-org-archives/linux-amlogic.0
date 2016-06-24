From: narmstrong@baylibre.com (Neil Armstrong)
Date: Fri, 24 Jun 2016 16:26:59 +0200
Subject: [RFC 1/4] rtc: support for amlogic meson rtc
In-Reply-To: <1466713278-24419-2-git-send-email-ben.dooks@codethink.co.uk>
References: <1466713278-24419-1-git-send-email-ben.dooks@codethink.co.uk>
 <1466713278-24419-2-git-send-email-ben.dooks@codethink.co.uk>
Message-ID: <576D4333.8050308@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 06/23/2016 10:21 PM, Ben Dooks wrote:
> Add support for the AMLogic meson8b/meson6 RTC block.
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  drivers/rtc/Kconfig     |  10 ++
>  drivers/rtc/Makefile    |   1 +
>  drivers/rtc/rtc-meson.c | 339 ++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 350 insertions(+)
>  create mode 100644 drivers/rtc/rtc-meson.c
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 9f8b59d..a90634f5 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -1222,6 +1222,16 @@ config RTC_DRV_IMXDI
>  	   This driver can also be built as a module, if so, the module
>  	   will be called "rtc-imxdi".
>  
> +config RTC_DRV_MESON
> +	tristate "AMLogic Meson Real Time Clock"
> +	depends on ARCH_MESON

You can also || COMPILE_TEST here

> +	help
> +	   Support for AMLogic Meson RTC block
> +
> +	   This driver can also be built as a module, if so, the module
> +	   will be called "rtc-meson".
> +
> +
>  config RTC_DRV_OMAP
>  	tristate "TI OMAP Real Time Clock"
>  	depends on ARCH_OMAP || ARCH_DAVINCI || COMPILE_TEST

Neil
