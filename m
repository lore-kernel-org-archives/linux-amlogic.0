From: narmstrong@baylibre.com (Neil Armstrong)
Date: Mon, 11 Jun 2018 13:35:10 +0200
Subject: [BUG] Pinning in pinctrl-meson-gxbb.c for uart_C is wrong
In-Reply-To: <trinity-5eab4708-85af-4a10-911f-86b9afc2c0cc-1528711303734@3c-app-gmx-bs27>
References: <trinity-5eab4708-85af-4a10-911f-86b9afc2c0cc-1528711303734@3c-app-gmx-bs27>
Message-ID: <fc5c1737-fa5c-8eed-2d75-539c9e4efc64@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi, "unknown user",

On 11/06/2018 12:01, st6589 at public-files.de wrote:
> 
> Hello with the actuel Pinning definition in? pinctrl-meson-gxbb.c for the uart_c
> the system crashes when activated. The seams to be a depency with mmc driver for SD cards.
> ?
> according to the comment here: https://forum.odroid.com/viewtopic.php?f=137&t=25373#p177855
> the seams to be an error in the amlogic datasheets regarding uart_c
> ?
> with the attached patch everything works as it should.

Thanks for reporting this ans submitting a fix,
but could you sign with your real name and send patch as inline text only ?

Thanks,
Neil

> ?
> Best regards
> ?
> ?
> ##
> #    https://forum.odroid.com/viewtopic.php?f=137&t=25373#p177855
> #
> --- linux-next-20180608/drivers/pinctrl/meson/pinctrl-meson-gxbb.c.orig 2018-06-09 12:03:58.921540445 +0200
> +++ linux-next-20180608/drivers/pinctrl/meson/pinctrl-meson-gxbb.c      2018-06-10 18:51:52.080665271 +0200
> @@ -198,8 +198,8 @@
>  
>  static const unsigned int uart_tx_c_pins[]     = { GPIOY_13 };
>  static const unsigned int uart_rx_c_pins[]     = { GPIOY_14 };
> -static const unsigned int uart_cts_c_pins[]    = { GPIOX_11 };
> -static const unsigned int uart_rts_c_pins[]    = { GPIOX_12 };
> +static const unsigned int uart_cts_c_pins[]    = { GPIOY_11 };
> +static const unsigned int uart_rts_c_pins[]    = { GPIOY_12 };
>  
>  static const unsigned int i2c_sck_a_pins[]     = { GPIODV_25 };
>  static const unsigned int i2c_sda_a_pins[]     = { GPIODV_24 };
> @@ -443,10 +443,10 @@
>         GROUP(pwm_f_x,          3,      18),
>  
>         /* Bank Y */
> -       GROUP(uart_cts_c,       1,      19),
> -       GROUP(uart_rts_c,       1,      18),
> -       GROUP(uart_tx_c,        1,      17),
> -       GROUP(uart_rx_c,        1,      16),
> +       GROUP(uart_cts_c,       1,      17),
> +       GROUP(uart_rts_c,       1,      16),
> +       GROUP(uart_tx_c,        1,      19),
> +       GROUP(uart_rx_c,        1,      18),
>         GROUP(pwm_a_y,          1,      21),
>         GROUP(pwm_f_y,          1,      20),
>         GROUP(i2s_out_ch23_y,   1,      5),
> 
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 
