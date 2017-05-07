From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 7 May 2017 18:38:51 +0200
Subject: Testing.
In-Reply-To: <ae3d52d1-1eab-61e3-5943-21761d28d214@yandex.ru>
References: <ae3d52d1-1eab-61e3-5943-21761d28d214@yandex.ru>
Message-ID: <CAFBinCBHWSt36ApkFPYKyF=oOBebWwkK8D3Pa27Ab-KsM+B0_Q@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Oleg,

On Tue, May 2, 2017 at 8:37 AM, Oleg <balbes-150@yandex.ru> wrote:
> Hi
> I want to help the platform support Amlogic (S8xx\S9xxx) on the new kernel.
> I have a few different model boards with the Amlogic S8xx\S9xxx with a
> connected console UART \ SSH.
> I can help with testing variants of the kernel on these boards.
> In what form can I help the project ?
I am currently trying to improve support for the older (32-bit) Meson SoCs.
Unfortunately I only have a device with S812 (Meson8m2) - do you have
any boards with Meson8 (S802) or Meson8b (S805) SoC? we could team up
and add mainline support for your boards

current status on my Meson8m2 device is:
- USB works (I only tested host mode)
- SD card can be read and written
- ethernet (my device has 10/100Mbit/s only) works


Regards,
Martin
