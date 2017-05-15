From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Mon, 15 May 2017 22:29:47 +0200
Subject: S805/S812 Device Tree upstreaming (was: Testing.)
In-Reply-To: <a9179db4-1db6-3c8d-de34-cee4454f07de@yandex.ru>
References: <CAFBinCA__tiW03VrMzbfAFUOkKY1VoZG=OK7BNfZyfm05HOLng@mail.gmail.com>
 <939ef72d-a4e5-7535-2252-d607158bd0fe@yandex.ru>
 <a9179db4-1db6-3c8d-de34-cee4454f07de@yandex.ru>
Message-ID: <CAFBinCCAxjtreC0EtpWKxrx9=zqJmv6w4fEhg_aZZNT_G3qARg@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Oleg,

On Mon, May 15, 2017 at 4:45 PM, Oleg <balbes-150@yandex.ru> wrote:
> Log system start-up.
>
> https://yadi.sk/i/0kvkEnct3JB7QZ
this looks pretty good - the SD card is found!

have you tried enabling the brcmfmac driver (CONFIG_BRCMFMAC and
CONFIG_BRCMFMAC_SDIO) to see whether your wireless chip is detected as
well?
testing if wifi works would help me a lot, since my board comes with a
RTL8723BS wifi chip and I couldn't get it working on first try (but I
don't trust the driver there, while I know that the brcmfmac driver
works fine based on my experience with other boards)
