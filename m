From: balbes-150@yandex.ru (Oleg)
Date: Thu, 11 May 2017 12:54:25 +0300
Subject: S805/S812 Device Tree upstreaming (was: Testing.)
In-Reply-To: <CAFBinCA1ga1NAhU+niQFT9xuDCFkyF7XTWmXokmFkwB_bq3OjQ@mail.gmail.com>
References: <CAFBinCA1ga1NAhU+niQFT9xuDCFkyF7XTWmXokmFkwB_bq3OjQ@mail.gmail.com>
Message-ID: <e2da979a-2797-1cb7-92aa-2e914c6a8923@yandex.ru>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org


>> I found dtb to kernel 3.14 the string
>>
>> gpio-vbus-power = "GPIOZ_1";
>>
>> You can simply copy it to the unit or it needs to change according to
>> certain rules ?
>>
>> &usb0 {
>>      status = "okay";
>> };
> you can have a look at the Vega S95 devicetree [0] which enables
> GPIODV_24 (instead of GPIOZ_1, but that's easy to replace) for USB
> VBUS. it then passes the regulator to the phy
>
>
> Regards,
> Martin
>
>
> [0] https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi#L67

Is that about right ?

https://github.com/150balbes/Amlogic_s8xx-kernel/blob/test/arch/arm/boot/dts/meson8m2-mxiii-plus.dts#L80
