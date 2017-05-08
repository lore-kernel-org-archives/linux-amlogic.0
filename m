From: afaerber@suse.de (=?UTF-8?Q?Andreas_F=c3=a4rber?=)
Date: Mon, 8 May 2017 13:47:19 +0200
Subject: S805/S812 Device Tree upstreaming (was: Testing.)
In-Reply-To: <cdb8ce4a-a3a9-f999-67b1-ddb712df250c@yandex.ru>
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
 <CAFBinCBUhU8N7bRpF6EsMSe8YARzYEEMgsET+CAc9-7y3RntRw@mail.gmail.com>
 <cdb8ce4a-a3a9-f999-67b1-ddb712df250c@yandex.ru>
Message-ID: <26a939cb-ae9c-36ec-fbc7-8735c3826862@suse.de>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi,

Am 08.05.2017 um 11:42 schrieb Oleg:
>> I had a quick look at the .dts files - on my Akaso M8S GPIOZ_1 is not
>> connected anywhere (at least toggling the GPIO doesn't change anything
>> in terms of USB VBUS signal).
>> however, your board has: gpio-vbus-power = "GPIOZ_1";
>> it's very likely that the GL852 hub is powered off by default and is
>> powered on by enabling GPIOZ_1
>> but since my .dts is not enabling GPIOZ_1 the hub stays powered off
>> and USB is not working for you
>> (in other words: this will require additional changes in the .dts to
>> make it work)
> I found dtb to kernel 3.14 the string
> 
> gpio-vbus-power = "GPIOZ_1";
> 
> You can simply copy it to the unit or it needs to change according to
> certain rules ?

You need to read the latest bindings documentation, for example:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N?rnberg, Germany
GF: Felix Imend?rffer, Jane Smithard, Graham Norton
HRB 21284 (AG N?rnberg)
