From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 7 May 2017 20:05:30 +0200
Subject: Testing.
In-Reply-To: <aed4bf63-cba2-cc63-d834-d0acf3da35d3@yandex.ru>
References: <ae3d52d1-1eab-61e3-5943-21761d28d214@yandex.ru>
 <CAFBinCBHWSt36ApkFPYKyF=oOBebWwkK8D3Pa27Ab-KsM+B0_Q@mail.gmail.com>
 <aed4bf63-cba2-cc63-d834-d0acf3da35d3@yandex.ru>
Message-ID: <CAFBinCDC9XwDa1NNiKQKp49GJ-WazS_iZFKkV4TAYo9ZnhPBcg@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Oleg,

On Sun, May 7, 2017 at 7:36 PM, Oleg <balbes-150@yandex.ru> wrote:
>
>> On Tue, May 2, 2017 at 8:37 AM, Oleg <balbes-150@yandex.ru> wrote:
>>>
>>> Hi
>>> I want to help the platform support Amlogic (S8xx\S9xxx) on the new
>>> kernel.
>>> I have a few different model boards with the Amlogic S8xx\S9xxx with a
>>> connected console UART \ SSH.
>>> I can help with testing variants of the kernel on these boards.
>>> In what form can I help the project ?
>>
>> I am currently trying to improve support for the older (32-bit) Meson
>> SoCs.
>> Unfortunately I only have a device with S812 (Meson8m2) - do you have
>> any boards with Meson8 (S802) or Meson8b (S805) SoC? we could team up
>> and add mainline support for your boards
>>
>> current status on my Meson8m2 device is:
>> - USB works (I only tested host mode)
>> - SD card can be read and written
>> - ethernet (my device has 10/100Mbit/s only) works
>>
>>
>> Regards,
>> Martin
>
> Hi Martin.
>
> I have a TV box S812 MXIII_Plus (2\16 eMMC), and the 2 model S805 (1\8
> NAND). I know there are several users with different models s802 s805 s812
> who are willing to participate in testing. Today I tried to use Your kernel
> (branch meson-mx integration-4.12-20170506-5) to build a test image Armbian
> (Ubuntu server). The kernel runs, but the system fully not starts, stops
> without error message. I think this is due to the fact that I use dtb data
> that is not priznachena for my model s812.
is the .dtb (or .dts) of your device available in your github repo [0]?
also please note that you need to change the bootargs in u-boot before
you can boot a mainline kernel (see also [1]): setenv bootargs
"console=ttyAML0,115200" (without this your serial console won't work)


Regards,
Martin

[0] https://github.com/150balbes/Amlogic_s905
[1] http://linux-meson.com/doku.php?id=start#bit_socs_meson8b_s805_or_older
