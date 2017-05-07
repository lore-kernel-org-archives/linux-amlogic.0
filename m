From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 7 May 2017 23:30:38 +0200
Subject: Testing.
In-Reply-To: <c5c0a942-af07-9298-ac39-f5cecc8f8ff0@yandex.ru>
References: <ae3d52d1-1eab-61e3-5943-21761d28d214@yandex.ru>
 <CAFBinCBHWSt36ApkFPYKyF=oOBebWwkK8D3Pa27Ab-KsM+B0_Q@mail.gmail.com>
 <aed4bf63-cba2-cc63-d834-d0acf3da35d3@yandex.ru>
 <CAFBinCDC9XwDa1NNiKQKp49GJ-WazS_iZFKkV4TAYo9ZnhPBcg@mail.gmail.com>
 <e7eb7d12-8fa8-5507-5d7b-53ef9ce3e300@yandex.ru>
 <CAFBinCDk+fFhTd=wx2k7mzr4Xh8NPQ15TTh+edbSdgtfLRwOEw@mail.gmail.com>
 <dd2f16b1-a9a1-4bc5-a694-1f64907d4669@yandex.ru>
 <CAFBinCA1A5K372F7_BuwNnZFvK+RwbQyWp4yYVomhW7Edu7HJA@mail.gmail.com>
 <dd90255e-0073-9988-de70-7e2d2bb0c00c@yandex.ru>
 <CAFBinCAyqip30C=6J35OGfyiMcXRXNefNtOLT0gkKYCRMxWa3Q@mail.gmail.com>
 <f1cfbf25-08a8-46c1-a6bc-886a850ca8c2@yandex.ru>
 <CAFBinCAktR94_3diH1NqAL4uXbLkL_cThaj7WtXgODe0LMQ88A@mail.gmail.com>
 <c5c0a942-af07-9298-ac39-f5cecc8f8ff0@yandex.ru>
Message-ID: <CAFBinCBUhU8N7bRpF6EsMSe8YARzYEEMgsET+CAc9-7y3RntRw@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sun, May 7, 2017 at 11:23 PM, Oleg <balbes-150@yandex.ru> wrote:
>
>> this sounds innocent at first but actually it's crucial for MMC (at
>> least in the current M8S configuration). PWM_E is used to generate the
>> 32.768 kHz clock for the wifi chip. so without CONFIG_PWM_MESON the
>> pwm_ef node won't get probed, meaning that a dependency of the mmc
>> controller is missing.
>> I'll fix that as well next weekend (it also has to be enabled in
>> multi_v7_defconfig)
>
> I found in the configuration CONFIG_PWM_MESON and put =y.
>  Or you need to add code / patch in the source code ?
adding the configuration should be enough - Neil did a good job with
the actual driver code (it's working fine for me :))

>> this looks suspicious, do you have anything connected to that port?
>> I've seen that when connecting a 2.5" HDD when the PSU doesn't have
>> enough power to spin up the HDD as well.
>
> This TV box have 2 USB port.
> One port is connected to the external hub
> (this hub connecned USB keyboard and mouse from PC).
I am assuming you are testing on the MXIII Plus [0]:
the S812 SoC (just like all other Amlogic SoCs) comes with two USB controllers:
- one for the OTG port
- a second one which only acts in host mode -> this is typically
connected to an internal hub (often through a GL852 USB hub
controller) which then provides more than one port

I had a quick look at the .dts files - on my Akaso M8S GPIOZ_1 is not
connected anywhere (at least toggling the GPIO doesn't change anything
in terms of USB VBUS signal).
however, your board has: gpio-vbus-power = "GPIOZ_1";
it's very likely that the GL852 hub is powered off by default and is
powered on by enabling GPIOZ_1
but since my .dts is not enabling GPIOZ_1 the hub stays powered off
and USB is not working for you
(in other words: this will require additional changes in the .dts to
make it work)


Regards,
Martin

[0] http://www.tronsmart.com/products/tronsmart-mxiii-plus-2g/8g-quad-core-android-tv-box
