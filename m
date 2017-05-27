From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat, 27 May 2017 16:15:25 +0200
Subject: Testing.
In-Reply-To: <743c82c3-52af-bcdb-b45a-d392cda08fb6@o2online.de>
References: <CAFBinCBHWSt36ApkFPYKyF=oOBebWwkK8D3Pa27Ab-KsM+B0_Q@mail.gmail.com>
 <743c82c3-52af-bcdb-b45a-d392cda08fb6@o2online.de>
Message-ID: <CAFBinCANQYUs21WyGmtigZF1tqTZK6yWdwiPXWr+QbjxJ9o6qg@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Tobias,

On Thu, May 25, 2017 at 8:35 PM, Tobias Baumann
<017623705678@o2online.de> wrote:
> hi martin
>
> oleg (balbes150)  from armbian forum told me you could need some help
>
> iam new to linux but i can test images and files for you
>
> my system OTT M8S Clone TVBox with S812 8GBRom 2GB RAM RTL8723BS WIFI BT
> Combo HDMI 2xUSB
>
> ( run as server for USB Printer and Sane server for canon scanner)
>
> at the moment i use the armbian unbuntu rom from oleg with 3.10.99 kernel
> (14 04 2017 ) with working wifi usb and internet also i could run a
> successful test the 4.11 kernel
disclaimer: I cannot really help with Amlogic's 3.10/3.14 kernel

> my project now is to control the front LED
what are you trying to control exactly?

> but there is a problem  oleg send my the dts for led but without gpio .
my m8s.dts doesn't use a GPIO because the LED is connected to
GPIO_TEST_N which can also be controlled by one of the PWM controllers
(this allows dimming the LED to a certain level, but in my case the
LED is a dual-color LED with blue and red: the further you reduce the
brightness of the (blue) LED the more you see of the red one -> if you
turn off the blue LED it turns red)

> maybe you can assist
>
> thanks Tobias
>
> PS: i am from Germany so i am more comfortable and faster in german
>
>
> ---
> Diese E-Mail wurde von Avast Antivirus-Software auf Viren gepr?ft.
> https://www.avast.com/antivirus
>
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
