From: balbes-150@yandex.ru (Oleg)
Date: Fri, 26 May 2017 10:29:21 +0300
Subject: S805/S812 Device Tree upstreaming
In-Reply-To: <CAFBinCD0YZchEYxr8Ts1u3PoqY6+0C1kgKsF2Qj2oBZObmQuNg@mail.gmail.com>
References: <CAFBinCA__tiW03VrMzbfAFUOkKY1VoZG=OK7BNfZyfm05HOLng@mail.gmail.com>
 <939ef72d-a4e5-7535-2252-d607158bd0fe@yandex.ru>
 <a9179db4-1db6-3c8d-de34-cee4454f07de@yandex.ru>
 <CAFBinCCAxjtreC0EtpWKxrx9=zqJmv6w4fEhg_aZZNT_G3qARg@mail.gmail.com>
 <9b803bac-4ce8-689c-44a8-40532e294dae@yandex.ru>
 <CAFBinCDXx5j_W5WtLSd8q0RDp7TXezCdDNHtXp5mYNnY=jR5wA@mail.gmail.com>
 <fdc29cda-b67d-add9-9c8a-f0a61db537da@yandex.ru>
 <CAFBinCBhVGabCo-2j-sd=5JSPa2xsQ4a1Tn=iMC6QuzxrnSfQQ@mail.gmail.com>
 <60f432cf-ea24-9158-a5ab-f967f19393ed@yandex.ru>
 <CAFBinCD0YZchEYxr8Ts1u3PoqY6+0C1kgKsF2Qj2oBZObmQuNg@mail.gmail.com>
Message-ID: <e4b11e51-3a6e-0f73-5e84-6ee613aa534f@yandex.ru>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Martin
> regarding USB: I don't see a reason why it's reporting this error:(
> Kevin's Odroid-C2 board (used by kernelci) reports the same error [0]
> - I cannot reproduce this with any of my devices unfortunately (so I'm
> a bit lost here)
I will try to perform a number of tests and changes in the dtb.
When I have results, I'll let You know. Thanks for the support.

> regarding wifi:
> I would like to see this fixed because it would be great to have
> someone with Broadcom wifi (to confirm that the MMC driver works
> fine).
> I'm a bit puzzled though why it doesn't seem to find your SDIO wifi,
> even though it's at slot 0 (confirmed by looking at your sdio.tar.gz).
> maybe you can enable the debug logs in drivers/mmc/core.c (just add
> #define DEBUG at the beginning of the file and prepare for a HUGE
> log-spam!)
I will try to obtain this data in the coming days.

> a similar error was reported for another platform [1]
> however, I must also say that I am sure that I need to switch from the
> "meson6-dwmac" driver to "meson8b-dwmac" - but that will require
> additional work in the "meson8b-dwmac" driver.
I'll wait for Your results. I'm not in a hurry  :) .
