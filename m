From: balbes-150@yandex.ru (Oleg)
Date: Tue, 9 May 2017 16:14:34 +0300
Subject: S805/S812 Device Tree upstreaming (was: Testing.)
In-Reply-To: <CAFBinCA1ga1NAhU+niQFT9xuDCFkyF7XTWmXokmFkwB_bq3OjQ@mail.gmail.com>
References: <CAFBinCA1ga1NAhU+niQFT9xuDCFkyF7XTWmXokmFkwB_bq3OjQ@mail.gmail.com>
Message-ID: <7b8efe3d-864e-f160-7dbf-81c2b6fa9607@yandex.ru>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org


> strange, I've not seen this crash before.
> I can try building a kernel myself with your config next weekend - if
> it works for me then I suspect that it's a GCC issue (you're using the
> Linaro GCC 4.9.4 - while I'm using standard GCC 6.3.1
> (arm-none-eabi-gcc from Arch Linux' community repo)
1. Collected the version of the kernel with gcc linaro 6.3.1 . The 
result is the same crash.
2. Gathered option without the option CONFIG_PWM_MESON no longer drop core.

> you can have a look at the Vega S95 devicetree [0] which enables
> GPIODV_24 (instead of GPIOZ_1, but that's easy to replace) for USB
> VBUS. it then passes the regulator to the phy
>
>
> Regards,
> Martin
>
>
> [0] https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi#L67
Thanks for the info, soon I will check this option.
