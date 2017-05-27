From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat, 27 May 2017 20:18:02 +0200
Subject: Testing.
In-Reply-To: <d9abdffc-f9d4-84e7-cc4d-135c2f15c5ae@googlemail.com>
References: <CAFBinCBHWSt36ApkFPYKyF=oOBebWwkK8D3Pa27Ab-KsM+B0_Q@mail.gmail.com>
 <743c82c3-52af-bcdb-b45a-d392cda08fb6@o2online.de>
 <CAFBinCANQYUs21WyGmtigZF1tqTZK6yWdwiPXWr+QbjxJ9o6qg@mail.gmail.com>
 <4ce994ac-9272-ccec-8dd0-6698ce35f289@googlemail.com>
 <CAFBinCD9iJzMLDLF8avyvWF6X9iBGcfdJNuHy9jpfnQ00EZKyg@mail.gmail.com>
 <d9abdffc-f9d4-84e7-cc4d-135c2f15c5ae@googlemail.com>
Message-ID: <CAFBinCAYgHF46BjUm9PxMsR-tb+bROaAqFPpMLFQDmVh7zuz7w@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sat, May 27, 2017 at 8:06 PM, raptorsds <raptorsds@googlemail.com> wrote:
>
>
> Am 27.05.2017 um 18:08 schrieb Martin Blumenstingl:
>>
>> On Sat, May 27, 2017 at 4:57 PM, raptorsds <raptorsds@googlemail.com>
>> wrote:
>>>
>>> Hi Martin
>>>
>>>> Hi Tobias,
>>>>
>>>> On Thu, May 25, 2017 at 8:35 PM, Tobias Baumann
>>>> <017623705678@o2online.de> wrote:
>>>>>
>>>>> hi martin
>>>>>
>>>>> oleg (balbes150)  from armbian forum told me you could need some help
>>>>>
>>>>> iam new to linux but i can test images and files for you
>>>>>
>>>>> my system OTT M8S Clone TVBox with S812 8GBRom 2GB RAM RTL8723BS WIFI
>>>>> BT
>>>>> Combo HDMI 2xUSB
>>>>>
>>>>> ( run as server for USB Printer and Sane server for canon scanner)
>>>>>
>>>>> at the moment i use the armbian unbuntu rom from oleg with 3.10.99
>>>>> kernel
>>>>> (14 04 2017 ) with working wifi usb and internet also i could run a
>>>>> successful test the 4.11 kernel
>>>>
>>>> disclaimer: I cannot really help with Amlogic's 3.10/3.14 kernel
>>>
>>>
>>> But  maybe than  i can help by 4.11 kernel test for older devices
>>
>> you need to be aware of the fact that my kernel patches are experimental.
>> what you get is:
>> - one CPU core at the frequency set by the bootloader
>> - maybe USB (Oleg has problems with it while it works for me)
>> - maybe ethernet (again, Oleg has problems while it works for me)
>> - SD card
>> - front LED
>>
>> basically everything else is broken (wifi, CPU cores 2-4, cpu frequency
>> scaling, etc.). I even managed to corrupt u-boot when I was testing my
>> NAND driver.
>>
>> what "older" devices do you have? and do you have access to the serial
>> console of these devices?
>
>
> Yes Serial console  only my s812 box ,
>>>>>
>>>>> my project now is to control the front LED
>>>>
>>>> what are you trying to control exactly?
>>>
>>>
>>> red = stop
>>> blue = boot/start
>>> red/blue (maybe dimming) = run
>>> blinking = update (maybe)
>>
>> let me explain how where the LED is controlled currently:
>> - red LED turns on automatically (probably because it's wired to VCC)
>> when the device is powered on
>> - u-boot turns on the blue LED
>> - (kernel boots)
>> - the kernel can now control the LED partially (as explained in my
>> previous mail, you can only set the "mix" between red and blue - you
>> can't turn it off)
>>
>> so with another kernel you can only change the LED color from the
>> point on where the kernel is started. you'll have no control over it
>> (without additional work on the u-boot side) for the first seconds
>> after powering on the device.
>
> ok thank you for your explanation , it would be great when after kernelk
> boot (maybe inside rc.local) the LED will have a color change
>
>
>>>>> but there is a problem  oleg send my the dts for led but without gpio .
>>>>
>>>> my m8s.dts doesn't use a GPIO because the LED is connected to
>>>> GPIO_TEST_N which can also be controlled by one of the PWM controllers
>>>> (this allows dimming the LED to a certain level, but in my case the
>>>> LED is a dual-color LED with blue and red: the further you reduce the
>>>> brightness of the (blue) LED the more you see of the red one -> if you
>>>> turn off the blue LED it turns red)
>>>
>>>
>>> I though  " GPIO_TEST_N " was a placeholder .  I havent any trigger at
>>> /sys/class/leds , how  can i controll PWM for LED
>>
>> are you testing this on a 3.10/3.14 kernel or on a kernel with my
>> patches? I think the Amlogic kernel does not use the kernel's LED
>> framework, so the LEDs are not exposed in /sys/class/leds
>> if it's one of my kernels (I think Oleg has compiled some images with
>> them) then please post the kernel log (dmesg)
>
>
> yes i use 3.10.99 kernel from the image from oleg with a dtb files with your
> Led infos about "gpio test n"
like I said in a previous mail, I can't say much about the 3.10/3.14
kernel - it contains a lot of "custom" code which duplicates
functionality that it already provided by various frameworks inside
the Linux kernel. this is also the reason why your LED doesn't show up
in /sys/class/leds

> i also found a older info about system LED
>
> https://lists.freebsd.org/pipermail/freebsd-arm/2015-February/010126.html
>
> there is a info about gpio ao 13
the LED pin is board specific - GPIOAO_13 is correct for the Odroid-C1

> i send you a private mail with my dmesg with oleg dts file with led line
that is a kernel log and dts files from a 3.10 kernel. you can have a
look at the "aml_sysled" code from their 3.10 kernel, see [0]
but I'm a afraid this is all I can do for you here

if you switch to one of Oleg's images with my patches then the LED
will show up in /sys/class/leds, but like I mentioned previously all
this is pretty experimental


Regards,
Martin


[0] https://github.com/endlessm/linux-meson/blob/master/drivers/amlogic/led/aml_sysled.c
