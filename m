From: raptorsds@googlemail.com (raptorsds)
Date: Sat, 27 May 2017 16:57:12 +0200
Subject: Testing.
In-Reply-To: <CAFBinCANQYUs21WyGmtigZF1tqTZK6yWdwiPXWr+QbjxJ9o6qg@mail.gmail.com>
References: <CAFBinCBHWSt36ApkFPYKyF=oOBebWwkK8D3Pa27Ab-KsM+B0_Q@mail.gmail.com>
 <743c82c3-52af-bcdb-b45a-d392cda08fb6@o2online.de>
 <CAFBinCANQYUs21WyGmtigZF1tqTZK6yWdwiPXWr+QbjxJ9o6qg@mail.gmail.com>
Message-ID: <4ce994ac-9272-ccec-8dd0-6698ce35f289@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Martin

> Hi Tobias,
>
> On Thu, May 25, 2017 at 8:35 PM, Tobias Baumann
> <017623705678@o2online.de> wrote:
>> hi martin
>>
>> oleg (balbes150)  from armbian forum told me you could need some help
>>
>> iam new to linux but i can test images and files for you
>>
>> my system OTT M8S Clone TVBox with S812 8GBRom 2GB RAM RTL8723BS WIFI BT
>> Combo HDMI 2xUSB
>>
>> ( run as server for USB Printer and Sane server for canon scanner)
>>
>> at the moment i use the armbian unbuntu rom from oleg with 3.10.99 kernel
>> (14 04 2017 ) with working wifi usb and internet also i could run a
>> successful test the 4.11 kernel
> disclaimer: I cannot really help with Amlogic's 3.10/3.14 kernel

But  maybe than  i can help by 4.11 kernel test for older devices
>> my project now is to control the front LED
> what are you trying to control exactly?

red = stop
blue = boot/start
red/blue (maybe dimming) = run
blinking = update (maybe)

>
>> but there is a problem  oleg send my the dts for led but without gpio .
> my m8s.dts doesn't use a GPIO because the LED is connected to
> GPIO_TEST_N which can also be controlled by one of the PWM controllers
> (this allows dimming the LED to a certain level, but in my case the
> LED is a dual-color LED with blue and red: the further you reduce the
> brightness of the (blue) LED the more you see of the red one -> if you
> turn off the blue LED it turns red)

I though  " GPIO_TEST_N " was a placeholder .  I havent any trigger at 
/sys/class/leds , how  can i controll PWM for LED
>> maybe you can assist
>>
>> thanks Tobias
>>
>> PS: i am from Germany so i am more comfortable and faster in german
>>
>>
>> ---
>> Diese E-Mail wurde von Avast Antivirus-Software auf Viren gepr?ft.
>> https://www.avast.com/antivirus
>>
>>
>>
>> _______________________________________________
>> linux-amlogic mailing list
>> linux-amlogic at lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
