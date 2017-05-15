From: balbes-150@yandex.ru (Oleg)
Date: Mon, 15 May 2017 15:12:57 +0300
Subject: S805/S812 Device Tree upstreaming (was: Testing.)
In-Reply-To: <CAFBinCA__tiW03VrMzbfAFUOkKY1VoZG=OK7BNfZyfm05HOLng@mail.gmail.com>
References: <CAFBinCA__tiW03VrMzbfAFUOkKY1VoZG=OK7BNfZyfm05HOLng@mail.gmail.com>
Message-ID: <939ef72d-a4e5-7535-2252-d607158bd0fe@yandex.ru>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org


> get a copy of:
> - dmesg output
> - /sys/kernel/debug/gpio
> - /proc/interrupts
> - /proc/iomem

I received the necessary data from LebreELEC (this system now I have eMMC).
Let me know if you need to receive this data always from Android.

https://yadi.sk/d/deis2Z023JAiyE

>
> I'm using an initrd from Arch Linux ARM (from their ARMv7 multi-platform image).
> however, I found another missing kernel config option yesterday: you
> also need to enable CONFIG_COMMON_CLK_PWM
> once you enable that you should be able to see /dev/mmcblk1p[0-9] with
> all the partitions from your SD card
>
> I was also able to reproduce the kernel crash you reported last week.
> it seems to go away when enabling CONFIG_DEBUG_SPINLOCK in the kernel
> config - but I will create a separate thread about this (as I suspect
> that there may be some memory corruption along with a race condition
> somewhere)
>
>
> Regards,
> Martin
Hi Martin

Good news. Using the sources Your latest kernel (20170513) and amendments
in the config of the kernel I was able to run on Tronsmart MXIII Plus 
(s812).
By the way, in the source for Your kernel I had to make one small change 
to comment
out the in /arch/arm/mach-meson/Makefile a build of platsmp.
Thanks for the support. Now I have the ability
to run basic system on the device and test will be easier.
