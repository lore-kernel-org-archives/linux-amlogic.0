From: balbes-150@yandex.ru (Oleg)
Date: Sun, 7 May 2017 21:55:42 +0300
Subject: Testing.
In-Reply-To: <CAFBinCDC9XwDa1NNiKQKp49GJ-WazS_iZFKkV4TAYo9ZnhPBcg@mail.gmail.com>
References: <ae3d52d1-1eab-61e3-5943-21761d28d214@yandex.ru>
 <CAFBinCBHWSt36ApkFPYKyF=oOBebWwkK8D3Pa27Ab-KsM+B0_Q@mail.gmail.com>
 <aed4bf63-cba2-cc63-d834-d0acf3da35d3@yandex.ru>
 <CAFBinCDC9XwDa1NNiKQKp49GJ-WazS_iZFKkV4TAYo9ZnhPBcg@mail.gmail.com>
Message-ID: <9558d2a8-9f9f-0c65-0bab-aeb06a22a17f@yandex.ru>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org


> is the .dtb (or .dts) of your device available in your github repo [0]?
> also please note that you need to change the bootargs in u-boot before
> you can boot a mainline kernel (see also [1]): setenv bootargs
> "console=ttyAML0,115200" (without this your serial console won't work)
>
>
> Regards,
> Martin
>
> [0] https://github.com/150balbes/Amlogic_s905
> [1] http://linux-meson.com/doku.php?id=start#bit_socs_meson8b_s805_or_older
I use the kernel 3.14.29 these dts .
For my model s812


-------------- next part --------------


meson8m2_n200_2G_1000.dts

https://github.com/150balbes/Amlogic_s8xx-kernel/tree/S812/arch/arm/boot/dts


and s805   2 models.

meson8b_i5.dts
meson8b_hd180.dts

https://github.com/150balbes/Amlogic_s8xx-kernel/tree/S805/arch/arm/boot/dts

This is the source test file, which is obtained when compiling the executable script s805_autoscript (used in multi-boot mode), 
which sets the required variables and performs the automatic startup of the system from removable media when testing. 
Internal firmware remains unchanged, this allows any non-trained user with no risk to test any system.

boot-vegas812_AM.cmd

https://github.com/150balbes/lib/tree/master/config/bootscripts

Perhaps You will be more clear what is happening on the logs from the console UART while trying to start at s812 and s805.

https://yadi.sk/i/rhJQe_qi3HpNQr

https://yadi.sk/i/czHlGCyt3HpNQD
