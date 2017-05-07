From: balbes-150@yandex.ru (Oleg)
Date: Sun, 7 May 2017 20:36:12 +0300
Subject: Testing.
In-Reply-To: <CAFBinCBHWSt36ApkFPYKyF=oOBebWwkK8D3Pa27Ab-KsM+B0_Q@mail.gmail.com>
References: <ae3d52d1-1eab-61e3-5943-21761d28d214@yandex.ru>
 <CAFBinCBHWSt36ApkFPYKyF=oOBebWwkK8D3Pa27Ab-KsM+B0_Q@mail.gmail.com>
Message-ID: <aed4bf63-cba2-cc63-d834-d0acf3da35d3@yandex.ru>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org


> On Tue, May 2, 2017 at 8:37 AM, Oleg <balbes-150@yandex.ru> wrote:
>> Hi
>> I want to help the platform support Amlogic (S8xx\S9xxx) on the new kernel.
>> I have a few different model boards with the Amlogic S8xx\S9xxx with a
>> connected console UART \ SSH.
>> I can help with testing variants of the kernel on these boards.
>> In what form can I help the project ?
> I am currently trying to improve support for the older (32-bit) Meson SoCs.
> Unfortunately I only have a device with S812 (Meson8m2) - do you have
> any boards with Meson8 (S802) or Meson8b (S805) SoC? we could team up
> and add mainline support for your boards
>
> current status on my Meson8m2 device is:
> - USB works (I only tested host mode)
> - SD card can be read and written
> - ethernet (my device has 10/100Mbit/s only) works
>
>
> Regards,
> Martin
Hi Martin.

I have a TV box S812 MXIII_Plus (2\16 eMMC), and the 2 model S805 (1\8 
NAND). I know there are several users with different models s802 s805 
s812 who are willing to participate in testing. Today I tried to use 
Your kernel (branch meson-mx integration-4.12-20170506-5) to build a 
test image Armbian (Ubuntu server). The kernel runs, but the system 
fully not starts, stops without error message. I think this is due to 
the fact that I use dtb data that is not priznachena for my model s812. 
I have asked members from the forum Armbian check out this image 
(kernel) on different models s8xxx. I hope that in a short time, you 
should see information from other users about how to start Your kernel 
on different models s8xxx. Soon I'll try to check - another of my 
existing models s805 and will report the results. You can write, and 
what else to check.

https://forum.armbian.com/index.php?/topic/3023-armbian-for-amlogic-s802s812/&do=findComment&comment=31246 
