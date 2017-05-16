From: balbes-150@yandex.ru (Oleg)
Date: Tue, 16 May 2017 12:05:58 +0300
Subject: S805/S812 Device Tree upstreaming (was: Testing.)
In-Reply-To: <CAFBinCCAxjtreC0EtpWKxrx9=zqJmv6w4fEhg_aZZNT_G3qARg@mail.gmail.com>
References: <CAFBinCA__tiW03VrMzbfAFUOkKY1VoZG=OK7BNfZyfm05HOLng@mail.gmail.com>
 <939ef72d-a4e5-7535-2252-d607158bd0fe@yandex.ru>
 <a9179db4-1db6-3c8d-de34-cee4454f07de@yandex.ru>
 <CAFBinCCAxjtreC0EtpWKxrx9=zqJmv6w4fEhg_aZZNT_G3qARg@mail.gmail.com>
Message-ID: <9b803bac-4ce8-689c-44a8-40532e294dae@yandex.ru>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org


> this looks pretty good - the SD card is found!
>
> have you tried enabling the brcmfmac driver (CONFIG_BRCMFMAC and
> CONFIG_BRCMFMAC_SDIO) to see whether your wireless chip is detected as
> well?
> testing if wifi works would help me a lot, since my board comes with a
> RTL8723BS wifi chip and I couldn't get it working on first try (but I
> don't trust the driver there, while I know that the brcmfmac driver
> works fine based on my experience with other boards)
Hi Martin

I added modules to the kernel. Put together a new way s812_wifi.txt.
The result of loading the modules in the application.
I guess I need to add settings in the DTB file ?

https://mega.nz/#F!yw5kVCrR!zNvlE8f6bcpOR2XZbJdCog
