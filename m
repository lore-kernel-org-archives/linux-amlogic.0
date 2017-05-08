From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Mon, 8 May 2017 22:10:19 +0200
Subject: S805/S812 Device Tree upstreaming (was: Testing.)
Message-ID: <CAFBinCA1ga1NAhU+niQFT9xuDCFkyF7XTWmXokmFkwB_bq3OjQ@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Mon, May 8, 2017 at 11:42 AM, Oleg <balbes-150@yandex.ru> wrote:
>
>> adding the configuration should be enough - Neil did a good job with
>> the actual driver code (it's working fine for me :))
>
> I added to config this variable. This kernel changed the behavior.
> Now there is a reaction to change :)
>
> https://yadi.sk/i/rzF14Hx03HqeRh
strange, I've not seen this crash before.
I can try building a kernel myself with your config next weekend - if
it works for me then I suspect that it's a GCC issue (you're using the
Linaro GCC 4.9.4 - while I'm using standard GCC 6.3.1
(arm-none-eabi-gcc from Arch Linux' community repo)

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
>
> I found dtb to kernel 3.14 the string
>
> gpio-vbus-power = "GPIOZ_1";
>
> You can simply copy it to the unit or it needs to change according to
> certain rules ?
>
> &usb0 {
>     status = "okay";
> };
you can have a look at the Vega S95 devicetree [0] which enables
GPIODV_24 (instead of GPIOZ_1, but that's easy to replace) for USB
VBUS. it then passes the regulator to the phy


Regards,
Martin


[0] https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi#L67
