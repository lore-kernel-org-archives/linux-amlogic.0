From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 21 May 2017 20:17:32 +0200
Subject: S805/S812 Device Tree upstreaming
In-Reply-To: <fdc29cda-b67d-add9-9c8a-f0a61db537da@yandex.ru>
References: <CAFBinCA__tiW03VrMzbfAFUOkKY1VoZG=OK7BNfZyfm05HOLng@mail.gmail.com>
 <939ef72d-a4e5-7535-2252-d607158bd0fe@yandex.ru>
 <a9179db4-1db6-3c8d-de34-cee4454f07de@yandex.ru>
 <CAFBinCCAxjtreC0EtpWKxrx9=zqJmv6w4fEhg_aZZNT_G3qARg@mail.gmail.com>
 <9b803bac-4ce8-689c-44a8-40532e294dae@yandex.ru>
 <CAFBinCDXx5j_W5WtLSd8q0RDp7TXezCdDNHtXp5mYNnY=jR5wA@mail.gmail.com>
 <fdc29cda-b67d-add9-9c8a-f0a61db537da@yandex.ru>
Message-ID: <CAFBinCBhVGabCo-2j-sd=5JSPa2xsQ4a1Tn=iMC6QuzxrnSfQQ@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Oleg,

On Sun, May 21, 2017 at 10:57 AM, Oleg <balbes-150@yandex.ru> wrote:
> Hi Martin
> In Lebreelec I did not find the specified directories.
> in the file ls_debug_lebreelec.txt the contents of the
> directory from Lebreelec.
> Output content Linux in appropriate files.
> https://yadi.sk/d/X-26JMEn3JNFbD
ah, in Amlogic's kernel the directories are probably
/sys/kernel/debug/{emmc,sd,sdio}

> I use this dtb file.
> https://github.com/150balbes/Amlogic_s8xx-kernel/blob/test/arch/arm/boot/dts/meson8m2-mxiii-plus.dts
this looks good to me. so you have tried:
gpio = <&gpio GPIOZ_1 GPIO_ACTIVE_HIGH>;
enable-active-high;

as well as:
gpio = <&gpio GPIOZ_1 GPIO_ACTIVE_LOW>;
// enable-active-high; not set

> Question, wath that me need to add or change data in the dtb, what would I
> have to run a wired network ?
you already have phy-mode = "rgmii"; in your .dts so this looks fine.
maybe the pinctrl driver is missing some bits for rgmii mode, can you
please run "md 0xc11080b0 0x28" in u-boot and paste the output (this
dumps the pinctrl mux mode registers from u-boot, where I assume that
ethernet is working)?
do you see any dwmac/stmmac related errors in your kernel log?


Regards,
Martin
