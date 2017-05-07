From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 7 May 2017 22:46:55 +0200
Subject: Testing.
In-Reply-To: <dd90255e-0073-9988-de70-7e2d2bb0c00c@yandex.ru>
References: <ae3d52d1-1eab-61e3-5943-21761d28d214@yandex.ru>
 <CAFBinCBHWSt36ApkFPYKyF=oOBebWwkK8D3Pa27Ab-KsM+B0_Q@mail.gmail.com>
 <aed4bf63-cba2-cc63-d834-d0acf3da35d3@yandex.ru>
 <CAFBinCDC9XwDa1NNiKQKp49GJ-WazS_iZFKkV4TAYo9ZnhPBcg@mail.gmail.com>
 <e7eb7d12-8fa8-5507-5d7b-53ef9ce3e300@yandex.ru>
 <CAFBinCDk+fFhTd=wx2k7mzr4Xh8NPQ15TTh+edbSdgtfLRwOEw@mail.gmail.com>
 <dd2f16b1-a9a1-4bc5-a694-1f64907d4669@yandex.ru>
 <CAFBinCA1A5K372F7_BuwNnZFvK+RwbQyWp4yYVomhW7Edu7HJA@mail.gmail.com>
 <dd90255e-0073-9988-de70-7e2d2bb0c00c@yandex.ru>
Message-ID: <CAFBinCAyqip30C=6J35OGfyiMcXRXNefNtOLT0gkKYCRMxWa3Q@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sun, May 7, 2017 at 10:44 PM, Oleg <balbes-150@yandex.ru> wrote:
>
>> perfect, thank you already for testing this!
>> please note that (typically) I have limited time during the week - so
>> I may not reply before next weekend
>>
>> good luck with testing!
>
> Assembled a new test image with the meson
> branch-mx-integration-4.12-20170507 ,
> included in the config file the option CONFIG_MMC_MESON_MX_SDIO=y and
> CONFIG_PHY_MESON8B_USB2=y .
> Tried to run from SD card new version, yet the result is the same as before.
so the kernel output is still the same? can you please share your .config then?

> What compiler is better to use 4.9.4 or 6.3.1 ?
personally I'm using arm-none-eabi-gcc 6.3.1 (from Arch Linux' community repo)
