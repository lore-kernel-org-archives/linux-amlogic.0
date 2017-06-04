From: crow@linux.org.ba (crow)
Date: Sun, 4 Jun 2017 22:07:04 +0200
Subject: call trace on Khadas VIM Pro with AP6255 WiFi
In-Reply-To: <cfde91da-9697-ac6c-7614-d56c6c49d459@gmail.com>
References: <CAG_g8w439G_exFOPtO3sNTdW5KBYJqA5-swL6NsLiGW1qAo2DQ@mail.gmail.com>
 <cfde91da-9697-ac6c-7614-d56c6c49d459@gmail.com>
Message-ID: <CAG_g8w4gV5TZBaGtsbZaEP0bjgr8WbWn83FvcbjcPWVby1cieg@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sun, Jun 4, 2017 at 9:11 PM, Heiner Kallweit <hkallweit1@gmail.com> wrote:
> Am 04.06.2017 um 17:59 schrieb crow:
>> Hi,
>> Posting to list as requested. I get call trace when using WiFi on Khadas VIM Pro, which comes with an AP6255. Firstly i wrote about this directly to Martin Blumenstingl, and he pointed me for this to post here.
>> This looks like a bug in the meson-gx-mmc.c (SD/SDIO/eMMC) driver [1]. Martin last successful test was with kernel 2.11.
>>
>> How to reproduce this:
>> mainline kernel 4.12.0-rc3 (using ArchLinuxARM arm8v generic rootfs)
>> Khadas VIM Pro nvram file [2]
> I have been in contact with others using AP6255-based SDIO WiFi with this driver. After the recent version of the driver
> was released I didn't hear back from them so I assume WiFi is working fine for them.
>
> The firmware image you use seems to be for Android. Not sure which firmware the others are using.
> This might be a potential reason for the issue.
I did not find any other firmware to check. If you same some links can
you please share.

>> Enable WiFI (connected to 5GHZ AP)
>> just do an SSH to Khadas VIM Pro device and you will get these call trace [3] , eventually you get login prompt but it is very slow login.
> The log shows that first HW reports a failed write transfer (status 0x0100) and then an unexpected interrupt occurs (host->cmd being NULL).
> Apart from the firmware the failed transfer might also be caused by e.g. a too high frequency.
Too high frequency of what? I am testing this on an 5GHz AP, i could
test it with 2,4GHz to, but need to find that box.

> Would be interesting to hear what's the latest kernel version (or even better: a bisect) working for you.
Well this could be an problem, as Khadas VIM support was added in
4.12, and I actually don't have any kernel working before, and this
was first try with WiFi.
I used same firmware which Martin did in his patch in patchwork [4].
Maybe not related to WiFi firmware but Khadas support uses same
android source for BT on ubuntu see [5].

> I'm using a Odroid-C2 where SDIO isn't available, so I'm not able to test.
>
>>
>> [1] https://github.com/torvalds/linux/commits/master/drivers/mmc/host/meson-gx-mmc.c
>> [2] https://github.com/khadas/android_hardware_amlogic_wifi/tree/Vim/bcm_ampak/config/6255
>> [3] https://defuse.ca/b/7htlAdOO
>>
>

[4] https://patchwork.kernel.org/patch/9517201/
[5] http://forum.khadas.com/t/add-bluetooth-support-for-ubuntu/593
