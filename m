From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Thu, 25 May 2017 17:56:07 +0200
Subject: S805/S812 Device Tree upstreaming
In-Reply-To: <60f432cf-ea24-9158-a5ab-f967f19393ed@yandex.ru>
References: <CAFBinCA__tiW03VrMzbfAFUOkKY1VoZG=OK7BNfZyfm05HOLng@mail.gmail.com>
 <939ef72d-a4e5-7535-2252-d607158bd0fe@yandex.ru>
 <a9179db4-1db6-3c8d-de34-cee4454f07de@yandex.ru>
 <CAFBinCCAxjtreC0EtpWKxrx9=zqJmv6w4fEhg_aZZNT_G3qARg@mail.gmail.com>
 <9b803bac-4ce8-689c-44a8-40532e294dae@yandex.ru>
 <CAFBinCDXx5j_W5WtLSd8q0RDp7TXezCdDNHtXp5mYNnY=jR5wA@mail.gmail.com>
 <fdc29cda-b67d-add9-9c8a-f0a61db537da@yandex.ru>
 <CAFBinCBhVGabCo-2j-sd=5JSPa2xsQ4a1Tn=iMC6QuzxrnSfQQ@mail.gmail.com>
 <60f432cf-ea24-9158-a5ab-f967f19393ed@yandex.ru>
Message-ID: <CAFBinCD0YZchEYxr8Ts1u3PoqY6+0C1kgKsF2Qj2oBZObmQuNg@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Oleg,

On Mon, May 22, 2017 at 2:12 PM, Oleg <balbes-150@yandex.ru> wrote:
> Hi Martin
> 1. Updated the source code to the latest version of meson-mx
> integration-4.12-20170520
> 2. Collected test image with the new kernel. 2. Checked both settings in dtb
> (HIGH and LOW).
> While the result is the same.
> 3. The output from the console log and with the command "md".
> 4 Contents of directories emmc sd sdio (from the working image Armbian with
> kernel 3.14 ,
> which features Wi-Fi and wired network with USB and HDMI)
>
> https://yadi.sk/d/KvSjVEK-3JQF7c .
regarding USB: I don't see a reason why it's reporting this error :(
Kevin's Odroid-C2 board (used by kernelci) reports the same error [0]
- I cannot reproduce this with any of my devices unfortunately (so I'm
a bit lost here)

regarding wifi:
I would like to see this fixed because it would be great to have
someone with Broadcom wifi (to confirm that the MMC driver works
fine).
I'm a bit puzzled though why it doesn't seem to find your SDIO wifi,
even though it's at slot 0 (confirmed by looking at your sdio.tar.gz).
maybe you can enable the debug logs in drivers/mmc/core.c (just add
#define DEBUG at the beginning of the file and prepare for a HUGE
log-spam!)

I also compared your pinmux register dump to see if there's anything
interesting regarding ethernet.
all eth_* related bits are set just like the kernel would do (REG6
bits 5-8 and bits 10-14)
a similar error was reported for another platform [1]
however, I must also say that I am sure that I need to switch from the
"meson6-dwmac" driver to "meson8b-dwmac" - but that will require
additional work in the "meson8b-dwmac" driver.

> Is it possible to transfer the wired network settings of dtb data from s905
> (p200)
>  in the dtb settings for MXIII-Plus or are they not compatible ?
with my current .dts they are not compatible - the goal is to make
them compatible (more work is required for that though)


Regards,
Martin


[0] https://storage.kernelci.org/mainline/master/v4.12-rc1-268-g6fe1de43c5f6/arm64/defconfig+CONFIG_LKDTM=y/lab-baylibre-seattle/boot-meson-gxbb-odroidc2.html
[1] http://lists.infradead.org/pipermail/linux-arm-kernel/2017-March/492508.html
