From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat, 13 May 2017 11:03:41 +0200
Subject: S805/S812 Device Tree upstreaming (was: Testing.)
In-Reply-To: <e2da979a-2797-1cb7-92aa-2e914c6a8923@yandex.ru>
References: <CAFBinCA1ga1NAhU+niQFT9xuDCFkyF7XTWmXokmFkwB_bq3OjQ@mail.gmail.com>
 <e2da979a-2797-1cb7-92aa-2e914c6a8923@yandex.ru>
Message-ID: <CAFBinCDWUEhGF9nxS=NXFK1+tOM3EoBZK-844NR1TuJxv1LpOg@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Oleg,

On Thu, May 11, 2017 at 11:54 AM, Oleg <balbes-150@yandex.ru> wrote:
>
>>> I found dtb to kernel 3.14 the string
>>>
>>> gpio-vbus-power = "GPIOZ_1";
>>>
>>> You can simply copy it to the unit or it needs to change according to
>>> certain rules ?
>>>
>>> &usb0 {
>>>      status = "okay";
>>> };
>>
>> you can have a look at the Vega S95 devicetree [0] which enables
>> GPIODV_24 (instead of GPIOZ_1, but that's easy to replace) for USB
>> VBUS. it then passes the regulator to the phy
>>
>>
>> Regards,
>> Martin
>>
>>
>> [0]
>> https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi#L67
>
>
> Is that about right ?
>
> https://github.com/150balbes/Amlogic_s8xx-kernel/blob/test/arch/arm/boot/dts/meson8m2-mxiii-plus.dts#L80
you have to play around and see whether you need "enable-active-high;"
or not (depends on the original .dts / Amlogic kernel implementation)

Additionally you need to add "phy-supply = <&usb_vbus>;" to the
usb0_phy node - otherwise the PHY does not know that it has to enable
the usb_vbus regulator.


Regards,
Martin
