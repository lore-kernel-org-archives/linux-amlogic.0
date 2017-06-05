From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Mon, 5 Jun 2017 18:12:11 +0200
Subject: call trace on Khadas VIM Pro with AP6255 WiFi
In-Reply-To: <CAFBinCDoTmLTu8EhgS+DHhoR-Or9iyvL=NpU59Eo21S15r5BqQ@mail.gmail.com>
References: <CAG_g8w439G_exFOPtO3sNTdW5KBYJqA5-swL6NsLiGW1qAo2DQ@mail.gmail.com>
 <cfde91da-9697-ac6c-7614-d56c6c49d459@gmail.com>
 <CAFBinCDoTmLTu8EhgS+DHhoR-Or9iyvL=NpU59Eo21S15r5BqQ@mail.gmail.com>
Message-ID: <87e73ab4-fbc5-4884-eede-5c4a24607732@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Am 05.06.2017 um 01:03 schrieb Martin Blumenstingl:
> Hi Heiner,
> 
> On Sun, Jun 4, 2017 at 9:11 PM, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>> Am 04.06.2017 um 17:59 schrieb crow:
>>> Hi,
>>> Posting to list as requested. I get call trace when using WiFi on Khadas VIM Pro, which comes with an AP6255. Firstly i wrote about this directly to Martin Blumenstingl, and he pointed me for this to post here.
>>> This looks like a bug in the meson-gx-mmc.c (SD/SDIO/eMMC) driver [1]. Martin last successful test was with kernel 2.11.
>>>
>>> How to reproduce this:
>>> mainline kernel 4.12.0-rc3 (using ArchLinuxARM arm8v generic rootfs)
>>> Khadas VIM Pro nvram file [2]
>> I have been in contact with others using AP6255-based SDIO WiFi with this driver. After the recent version of the driver
>> was released I didn't hear back from them so I assume WiFi is working fine for them.
> I've also seen the errors with older version of your patches where
> SDIO wifi would fail to initialize (or load the firmware).
> I just tried it myself on a Khadas VIM Pro (= the one with AP6255):
> - wifi firmware loads fine
> - as soon as I put traffic on the wireless interface (iperf3 -c <ip of
> server>) I hit the same WARN_ON as crow (it happens almost instantly
> after I start iperf3)
> 
>> The firmware image you use seems to be for Android. Not sure which firmware the others are using.
>> This might be a potential reason for the issue.
>>
>>> Enable WiFI (connected to 5GHZ AP)
>>> just do an SSH to Khadas VIM Pro device and you will get these call trace [3] , eventually you get login prompt but it is very slow login.
>> The log shows that first HW reports a failed write transfer (status 0x0100) and then an unexpected interrupt occurs (host->cmd being NULL).
>> Apart from the firmware the failed transfer might also be caused by e.g. a too high frequency.
> # cat /sys/kernel/debug/mmc2/ios
> clock:          50000000 Hz
> actual clock:   50000000 Hz
> vdd:            21 (3.3 ~ 3.4 V)
> bus mode:       2 (push-pull)
> chip select:    0 (don't care)
> power mode:     2 (on)
> bus width:      2 (4 bits)
> timing spec:    2 (sd high-speed)
> signal voltage: 0 (3.30 V)
> driver type:    0 (driver type B)
> 
> The .dts from Khadas (based on the Amlogic kernel) uses f_max 200000000
> 
>> Would be interesting to hear what's the latest kernel version (or even better: a bisect) working for you.
> I don't really remember what the last actual working version was, but
> I can try to bisect it tomorrow

This would be great.

> 
>> I'm using a Odroid-C2 where SDIO isn't available, so I'm not able to test.
> are you from Germany? I can give you a Khadas VIM so you can test this
> yourself for a few weeks if you want
> 
> what just caught my eye though is the max_req_size calculation: [0]
> Amlogic's kernel uses max_req_size = <0x20000>; /**128KB*/ for the SD
> and SDIO controllers, but max_req_size = <0x20000>; /**256KB*/ for the
> eMMC controller
> it caught my eye because (some time ago) I found out that there are
> two different hardware buffer sizes for the UART FIFO buffer (see page
> 309 of the public S905 datasheet, UART0 has a 128 byte buffer, while
> all other UARTs only have a 64 byte buffer)
> 
In the logs provided by crow the issue happened with small writes
(just one or two blocks), so most likely the problem here has a
different nature.

In general I'm wondering whether the mainline Meson GX mmc driver ever
fully supported SDIO. For example SDIO interrupts aren't supported.

Kevin:
Before submitting the initial version of the driver, did you test also
SDIO or just SD/eMMC?

> 
> Regards,
> Martin
> 
> [0] https://github.com/torvalds/linux/blob/master/drivers/mmc/host/meson-gx-mmc.c#L971
> 
