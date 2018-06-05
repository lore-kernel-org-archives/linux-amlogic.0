From: narmstrong@baylibre.com (Neil Armstrong)
Date: Tue, 5 Jun 2018 11:17:03 +0200
Subject: Odroid-C2 solid green screen on "echo c > /proc/sysrq-trigger" on
 Arch 4.16/4.17rc6
In-Reply-To: <176f036c3d2f49a4b5bde68bdee68e6a@wppexc12.purdue.lcl>
References: <84bc747f58f648e1b209bc0005804bc5@wppexc12.purdue.lcl>
 <5d1512ae-51eb-7e05-ad8b-b8e851aee90e@baylibre.com>
 <CAERgokn-JU9JxHibaWF8w9-roz-wVukey2c7RKVNJoSV=Y+Q3g@mail.gmail.com>
 <1a951abcb7be4e93945613afcdcd96f3@wppexc12.purdue.lcl>
 <f9058ba905344938a09e967b039ed857@wppexc12.purdue.lcl>
 <1f8eaec9-e3a2-1b9b-1cef-ed3567a96aa2@baylibre.com>
 <179a8a16-30a9-73fc-7f07-beeab3a981dc@poczta.onet.pl>
 <176f036c3d2f49a4b5bde68bdee68e6a@wppexc12.purdue.lcl>
Message-ID: <6353008e-35a9-bb3e-f52c-97191ddb60a3@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi,

Having the watchdog to reset the board is an exceptional event, why would you bother fixing this ?

Neil

On 04/06/2018 23:22, Swabey, Matthew A wrote:
> Well, as an update.
> 
> Using arch linux for arm, modified their PKGBUILD to build u-boot 2018.05 with no patches at all. Signed and wrote to SD-CARD as per usual. 
> 
> Green screen on echo c > /proc/sysrq-trigger after watchdog reset.
> No green screen on shutdown -r
> 
> Temporary solution for me will be to play a "double reboot" game with a fingerprint file to see if it was shutdown cleanly or not.
> 
> Best,
> 
> Matthew
> 
> Dr. Matthew Swabey - Director?
> Bechtel Innovation Design Center - Purdue University
> room: BIDC 225? ? ? phone: +1-765-494-8655
> 
> -----Original Message-----
> From: Micha? Zegan <webczat_200@poczta.onet.pl> 
> Sent: Saturday, May 26, 2018 4:50 AM
> To: Neil Armstrong <narmstrong@baylibre.com>; Swabey, Matthew A <maswabey@purdue.edu>; Tony McKahan <tonymckahan@gmail.com>
> Cc: linux-amlogic at lists.infradead.org
> Subject: Re: Odroid-C2 solid green screen on "echo c > /proc/sysrq-trigger" on Arch 4.16/4.17rc6
> 
> What about the *kernel* resetting at boot?
> 
> W dniu 26.05.2018 o?10:33, Neil Armstrong pisze:
>> Hi,
>>
>> I'm sorry to disappoint you, but with the HW watchdog, we *can't* execute any code from Linux when the watchdoog resets the system.
>> We could eventually add some code in U-Boot to disable the HDMI output, but U-boot is not the first code executed, you will still see the green screen.
>> You may need to contact Hardkernel to see if they can update the BL* binaries to include such reset.
>>
>> Neil
>>
>> On 26/05/2018 05:49, Swabey, Matthew A wrote:
>>> Can also confirm green screen on watchdog reboot from "echo c > /proc/sysrq-trigger" for Armbian 5.44 with linux-u-boot-odroidc2-next version 2018.03.
>>>
>>> This is in addition to the Armbian bug where shutdown -r now doesn?t reboot the system, just either freezes or powers down. Supposed to be fixed on 2018.03 but not working for me.
>>>
>>> Matthew
>>>
>>> Dr. Matthew Swabey - Director
>>> Bechtel Innovation Design Center - Purdue University
>>> room: BIDC 225? ? ? phone: +1-765-494-8655
>>>
>>> -----Original Message-----
>>> From: linux-amlogic 
>>> [mailto:linux-amlogic-bounces at lists.infradead.org] On Behalf Of 
>>> Swabey, Matthew A
>>> Sent: Friday, May 25, 2018 10:37 PM
>>> To: Tony McKahan <tonymckahan@gmail.com>; Neil Armstrong 
>>> <narmstrong@baylibre.com>
>>> Cc: linux-amlogic at lists.infradead.org
>>> Subject: RE: Odroid-C2 solid green screen on "echo c > 
>>> /proc/sysrq-trigger" on Arch 4.16/4.17rc6
>>>
>>> I just had a look at the Arch linux PKGBUILD for the uboot package I am using, and it is mainline 2017.07. So I am using the mainline uboot, just a bit older.
>>>
>>> I?ll give Armbian a try ? is it the distro wit1h the most development so far? (Other than the 3.14.x releases which I would prefer not to use for now).
>>>
>>> Matthew
>>>
>>> Dr. Matthew Swabey - Director
>>> Bechtel Innovation Design Center - Purdue University
>>> room: BIDC 225? ? ? phone: +1-765-494-8655
>>>
>>> From: Tony McKahan [mailto:tonymckahan at gmail.com]
>>> Sent: Friday, May 25, 2018 3:46 PM
>>> To: Neil Armstrong <narmstrong@baylibre.com>
>>> Cc: Swabey, Matthew A <maswabey@purdue.edu>; 
>>> linux-amlogic at lists.infradead.org
>>> Subject: Re: Odroid-C2 solid green screen on "echo c > 
>>> /proc/sysrq-trigger" on Arch 4.16/4.17rc6
>>>
>>> Hello Neil, Matt,
>>>
>>> Change to 2018.03 is in Armbian's development branch, just waiting to be rolled into the master.? I don't have this particular board for testing, but it should be updated soon.
>>>
>>> On Fri, May 25, 2018, 3:57 AM Neil Armstrong <mailto:narmstrong@baylibre.com> wrote:
>>> Hi,
>>>
>>> On 25/05/2018 04:19, Swabey, Matthew A wrote:
>>>> Odroid-C2 solid green screen on echo c > /proc/sysrq-trigger on Arch 
>>>> Linux mainline 4.16/4.17rc6 Using lightdm on xorg fb. No mali, utgard or odroid specific framebuffers. However it seems to happen on them too.
>>>>
>>>> Steps to reproduce:
>>>> 1. Boot
>>>> 2. Echo c > /proc/sysrq-trigger with watchdog set. Or trigger the watchdog another way, i.e. watchdogd or system.
>>>> 3. Watchdog causes reboot
>>>> 4. Boots with screen solid green, see photo here: 
>>>> https://photos.app.goo.gl/9VyiweNAIMD07VSM2
>>>> ? ? ? ?a. No error messages visible, see attached log file bundles 
>>>> containing dmesg, journalctl, package list, Xorg.0.log
>>>> ? ? ? ?b. Linux-aarch64 is 4.16
>>>> ? ? ? ?c. Linux-aarch64-rc is 4.17rc6 5. Reboot - screen back to 
>>>> normal and working
>>> Well, since screen goes back to normal means there is no bug on the kernel side.
>>>
>>> This is caused by Amlogic's U-Boot.
>>> The HW watchdog does a complete SoC reset, we cannot execute any code from kernel when the watchdog wakes up.
>>>
>>> Please report this to Armbian and ask them to use Mainline U-Boot, this won't happen anymore.
>>>
>>> Neil
>>>
>>>>
>>>> Thought - something about the way to trigger this reset isn't working, or a race condition is present which is being more reliably triggered? Perhaps in the dma controller or the HDMI?
>>>>
>>>> Any help to track this bug down would be very helpful, or someone else who would be interested? I can't figure out where in the stack the problem is occurring, but I guess it is the bootloader.
>>>>
>>>> Thanks,
>>>>
>>>> Matthew
>>>>
>>>>
>>>>
>>>> _______________________________________________
>>>> linux-amlogic mailing list
>>>> mailto:linux-amlogic at lists.infradead.org
>>>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
>>>>
>>>
>>>
>>> _______________________________________________
>>> linux-amlogic mailing list
>>> mailto:linux-amlogic at lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
>>> _______________________________________________
>>> linux-amlogic mailing list
>>> linux-amlogic at lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
>>>
>>
>>
>> _______________________________________________
>> linux-amlogic mailing list
>> linux-amlogic at lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
>>
> 
