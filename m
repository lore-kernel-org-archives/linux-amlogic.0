From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Mon, 5 Jun 2017 23:56:40 +0200
Subject: call trace on Khadas VIM Pro with AP6255 WiFi
In-Reply-To: <CAFBinCBzkeGeA8M3WPb57QxFsi9TWfDEiJYH-KPKw5WPY3D+dQ@mail.gmail.com>
References: <CAG_g8w439G_exFOPtO3sNTdW5KBYJqA5-swL6NsLiGW1qAo2DQ@mail.gmail.com>
 <cfde91da-9697-ac6c-7614-d56c6c49d459@gmail.com>
 <CAFBinCDoTmLTu8EhgS+DHhoR-Or9iyvL=NpU59Eo21S15r5BqQ@mail.gmail.com>
 <87e73ab4-fbc5-4884-eede-5c4a24607732@gmail.com>
 <CAFBinCBzkeGeA8M3WPb57QxFsi9TWfDEiJYH-KPKw5WPY3D+dQ@mail.gmail.com>
Message-ID: <0f0e023b-34dd-acf2-26b7-e308ee6e694a@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Am 05.06.2017 um 20:18 schrieb Martin Blumenstingl:
> Hi Heiner,
> 
> On Mon, Jun 5, 2017 at 6:12 PM, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>> Am 05.06.2017 um 01:03 schrieb Martin Blumenstingl:
>>> Hi Heiner,
>>>
>>> On Sun, Jun 4, 2017 at 9:11 PM, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>>>> Am 04.06.2017 um 17:59 schrieb crow:
>>>>> Hi,
>>>>> Posting to list as requested. I get call trace when using WiFi on Khadas VIM Pro, which comes with an AP6255. Firstly i wrote about this directly to Martin Blumenstingl, and he pointed me for this to post here.
>>>>> This looks like a bug in the meson-gx-mmc.c (SD/SDIO/eMMC) driver [1]. Martin last successful test was with kernel 2.11.
>>>>>
>>>>> How to reproduce this:
>>>>> mainline kernel 4.12.0-rc3 (using ArchLinuxARM arm8v generic rootfs)
>>>>> Khadas VIM Pro nvram file [2]
>>>> I have been in contact with others using AP6255-based SDIO WiFi with this driver. After the recent version of the driver
>>>> was released I didn't hear back from them so I assume WiFi is working fine for them.
>>> I've also seen the errors with older version of your patches where
>>> SDIO wifi would fail to initialize (or load the firmware).
>>> I just tried it myself on a Khadas VIM Pro (= the one with AP6255):
>>> - wifi firmware loads fine
>>> - as soon as I put traffic on the wireless interface (iperf3 -c <ip of
>>> server>) I hit the same WARN_ON as crow (it happens almost instantly
>>> after I start iperf3)
>>>
>>>> The firmware image you use seems to be for Android. Not sure which firmware the others are using.
>>>> This might be a potential reason for the issue.
>>>>
>>>>> Enable WiFI (connected to 5GHZ AP)
>>>>> just do an SSH to Khadas VIM Pro device and you will get these call trace [3] , eventually you get login prompt but it is very slow login.
>>>> The log shows that first HW reports a failed write transfer (status 0x0100) and then an unexpected interrupt occurs (host->cmd being NULL).
>>>> Apart from the firmware the failed transfer might also be caused by e.g. a too high frequency.
>>> # cat /sys/kernel/debug/mmc2/ios
>>> clock:          50000000 Hz
>>> actual clock:   50000000 Hz
>>> vdd:            21 (3.3 ~ 3.4 V)
>>> bus mode:       2 (push-pull)
>>> chip select:    0 (don't care)
>>> power mode:     2 (on)
>>> bus width:      2 (4 bits)
>>> timing spec:    2 (sd high-speed)
>>> signal voltage: 0 (3.30 V)
>>> driver type:    0 (driver type B)
>>>
>>> The .dts from Khadas (based on the Amlogic kernel) uses f_max 200000000
>>>
>>>> Would be interesting to hear what's the latest kernel version (or even better: a bisect) working for you.
>>> I don't really remember what the last actual working version was, but
>>> I can try to bisect it tomorrow
>>
>> This would be great.
> 79ed05e329c34c68ab2a87f729e666fcf208fdad is the first bad commit
> commit 79ed05e329c34c68ab2a87f729e666fcf208fdad
> Author: Heiner Kallweit <hkallweit1@gmail.com>
> Date:   Fri Apr 7 21:22:44 2017 +0200
> 
>     mmc: meson-gx: add support for descriptor chain mode
> 
>     So far a bounce buffer is used to serialize the scatterlist(s).
>     This overhead can be avoided by switching to descriptor chain mode.
>     As result the performance is drastically improved. On a Odroid-C2 with
>     a 128 GB eMMC module raw reads reach 140 MB/s.
> 
>     Prerequisite for descriptor chain mode is that all scatterlist buffers
>     are 8 byte aligned for 64-bit DMA. That's not always the case, at least
>     the brcmfmac SDIO WiFi driver is known to cause problems.
> 
>     Therefore, for each request, check upfront whether all scatterlist
>     buffers are 8 byte aligned and fall back to bounce buffer mode if
>     that's not the case.
> 
>     Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>     Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> 
> :040000 040000 c9771e14cfc70fa36ab67b6f4e246d714ff0e40d
> a5b816917ce3c7e0d7f2975ae116a94ef5b6db99 M      drivers
> 
> $ git bisect log
> git bisect start
> # bad: [3c2993b8c6143d8a5793746a54eba8f86f95240f] Linux 4.12-rc4
> git bisect bad 3c2993b8c6143d8a5793746a54eba8f86f95240f
> # good: [94d765bbfb1910ef8db5699d19907a0756a99d03] mmc: meson-gx:
> simplify bounce buffer setting in meson_mmc_start_cmd
> git bisect good 94d765bbfb1910ef8db5699d19907a0756a99d03
> # bad: [16a12fa9aed176444fc795b09e796be41902bb08] Merge branch
> 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input
> git bisect bad 16a12fa9aed176444fc795b09e796be41902bb08
> # good: [8d65b08debc7e62b2c6032d7fe7389d895b92cbc] Merge
> git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next
> git bisect good 8d65b08debc7e62b2c6032d7fe7389d895b92cbc
> # good: [8d65b08debc7e62b2c6032d7fe7389d895b92cbc] Merge
> git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next
> git bisect good 8d65b08debc7e62b2c6032d7fe7389d895b92cbc
> # good: [b769fefb68cd70385d68220ae341e5a10723fbc0] Backmerge tag
> 'v4.11-rc6' into drm-next
> git bisect good b769fefb68cd70385d68220ae341e5a10723fbc0
> # bad: [2f34c1231bfc9f2550f934acb268ac7315fb3837] Merge tag
> 'drm-for-v4.12' of git://people.freedesktop.org/~airlied/linux
> git bisect bad 2f34c1231bfc9f2550f934acb268ac7315fb3837
> # bad: [0302e28dee643932ee7b3c112ebccdbb9f8ec32c] Merge branch 'next'
> of git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/linux-security
> git bisect bad 0302e28dee643932ee7b3c112ebccdbb9f8ec32c
> # bad: [68fed41e0ff6c0332520a0d70ac05be2a7d9130e] Merge tag
> 'pinctrl-v4.12-1' of
> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl
> git bisect bad 68fed41e0ff6c0332520a0d70ac05be2a7d9130e
> # good: [ec5ab8933772c87f24ad62a4a602fe8949f423c2] mmc: host:
> omap_hsmmc: checking for NULL instead of IS_ERR()
> git bisect good ec5ab8933772c87f24ad62a4a602fe8949f423c2
> # skip: [8d4264d86c1a31d7e0efd3e4c3e08bc91dbdb48c] Merge tag
> 'samsung-pinctrl-4.12' of
> git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung into
> devel
> git bisect skip 8d4264d86c1a31d7e0efd3e4c3e08bc91dbdb48c
> # bad: [e145ac451eb68b51e0ede4c131bd5a539fb675b6] mmc: sdhci-of-esdhc:
> poll ESDHC_CLOCK_STABLE bit with udelay
> git bisect bad e145ac451eb68b51e0ede4c131bd5a539fb675b6
> # bad: [83b600b8de0e83661a8f40091a7966fac052a21b] mmc: sdhci: Control
> the delay between tuning commands
> git bisect bad 83b600b8de0e83661a8f40091a7966fac052a21b
> # bad: [c34d1579de4665d9613691bc37aebb7ca86d535d] mmc: cavium: Remove
> redundant pointer check
> git bisect bad c34d1579de4665d9613691bc37aebb7ca86d535d
> # good: [c08bcb6c90068d8eacffdb8b5f77916de5481a72] mmc: meson-gx:
> introduce struct meson_tuning_params
> git bisect good c08bcb6c90068d8eacffdb8b5f77916de5481a72
> # good: [0b6ed71c3e95abf6cd1dbfc53919defdce3449f5] mmc: meson-gx: add
> basic tuning for rx clock phase
> git bisect good 0b6ed71c3e95abf6cd1dbfc53919defdce3449f5
> # bad: [79ed05e329c34c68ab2a87f729e666fcf208fdad] mmc: meson-gx: add
> support for descriptor chain mode
> git bisect bad 79ed05e329c34c68ab2a87f729e666fcf208fdad
> # first bad commit: [79ed05e329c34c68ab2a87f729e666fcf208fdad] mmc:
> meson-gx: add support for descriptor chain mode
> 
> I manually applied [0] in all steps, otherwise there was an infinite
> stream of "brcmfmac: brcmf_sdio_rxglom: sublen 84 not multiple of 8"
> messages
> 
> testing steps:
> - ifconfig eth0 down
> - <start wifi>
> - iperf3 -c <server ip>
> - iperf3 -c <server ip> -R
> 
>>>
>>>> I'm using a Odroid-C2 where SDIO isn't available, so I'm not able to test.
>>> are you from Germany? I can give you a Khadas VIM so you can test this
>>> yourself for a few weeks if you want
>>>
>>> what just caught my eye though is the max_req_size calculation: [0]
>>> Amlogic's kernel uses max_req_size = <0x20000>; /**128KB*/ for the SD
>>> and SDIO controllers, but max_req_size = <0x20000>; /**256KB*/ for the
>>> eMMC controller
>>> it caught my eye because (some time ago) I found out that there are
>>> two different hardware buffer sizes for the UART FIFO buffer (see page
>>> 309 of the public S905 datasheet, UART0 has a 128 byte buffer, while
>>> all other UARTs only have a 64 byte buffer)
>>>
>> In the logs provided by crow the issue happened with small writes
>> (just one or two blocks), so most likely the problem here has a
>> different nature.
>>
>> In general I'm wondering whether the mainline Meson GX mmc driver ever
>> fully supported SDIO. For example SDIO interrupts aren't supported.
> actually I think SDIO interrupts are the only "SDIO specific" feature
> that is missing
> but it's not as important as one thinks, since we could even simulate
> this with yours (and Jerome's and Carlo's) GPIO interrupts instead
> 
> I don't see anything wrong with SDIO wifi support "before" the broken commit:
> Accepted connection from <Khadas VIM IP>, port 34078
> [  5] local <server IP> port 5201 connected to <Khadas VIM IP> port 34080
> [ ID] Interval           Transfer     Bandwidth
> [  5]   0.00-1.00   sec  3.34 MBytes  28.0 Mbits/sec
> [  5]   1.00-2.00   sec  5.20 MBytes  43.6 Mbits/sec
> [  5]   2.00-3.00   sec  5.13 MBytes  43.1 Mbits/sec
> [  5]   3.00-4.00   sec  7.32 MBytes  61.4 Mbits/sec
> [  5]   4.00-5.00   sec  3.99 MBytes  33.5 Mbits/sec
> [  5]   5.00-6.00   sec  7.27 MBytes  60.9 Mbits/sec
> [  5]   6.00-7.00   sec  3.62 MBytes  30.3 Mbits/sec
> [  5]   7.00-8.00   sec  6.00 MBytes  50.3 Mbits/sec
> [  5]   8.00-9.00   sec  4.48 MBytes  37.6 Mbits/sec
> [  5]   9.00-10.00  sec  4.41 MBytes  37.0 Mbits/sec
> [  5]  10.00-10.05  sec   390 KBytes  69.8 Mbits/sec
> - - - - - - - - - - - - - - - - - - - - - - - - -
> [ ID] Interval           Transfer     Bandwidth
> [  5]   0.00-10.05  sec  0.00 Bytes  0.00 bits/sec                  sender
> [  5]   0.00-10.05  sec  51.1 MBytes  42.7 Mbits/sec                  receiver
> -----------------------------------------------------------
> Server listening on 5201
> -----------------------------------------------------------
> Accepted connection from <Khadas VIM IP>, port 34082
> [  5] local <server IP> port 5201 connected to <Khadas VIM IP> port 34084
> [ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
> [  5]   0.00-1.00   sec  6.03 MBytes  50.5 Mbits/sec   22    180 KBytes
> [  5]   1.00-2.00   sec  3.29 MBytes  27.6 Mbits/sec   47    189 KBytes
> [  5]   2.00-3.00   sec  5.59 MBytes  46.9 Mbits/sec   26    204 KBytes
> [  5]   3.00-4.00   sec  4.54 MBytes  38.1 Mbits/sec    0    219 KBytes
> [  5]   4.00-5.00   sec  5.84 MBytes  49.0 Mbits/sec   22    229 KBytes
> [  5]   5.00-6.00   sec  5.03 MBytes  42.2 Mbits/sec   18    239 KBytes
> [  5]   6.00-7.00   sec  5.97 MBytes  50.0 Mbits/sec    1    256 KBytes
> [  5]   7.00-8.00   sec  6.15 MBytes  51.6 Mbits/sec    0    274 KBytes
> [  5]   8.00-9.00   sec  4.54 MBytes  38.1 Mbits/sec   12    269 KBytes
> [  5]   9.00-10.00  sec  6.77 MBytes  56.8 Mbits/sec    4    296 KBytes
> [  5]  10.00-10.07  sec   636 KBytes  74.2 Mbits/sec    0    297 KBytes
> - - - - - - - - - - - - - - - - - - - - - - - - -
> [ ID] Interval           Transfer     Bandwidth       Retr
> [  5]   0.00-10.07  sec  54.4 MBytes  45.3 Mbits/sec  152             sender
> [  5]   0.00-10.07  sec  0.00 Bytes  0.00 bits/sec                  receiver
> 
Thanks a lot for the analysis!

Somewhat strange that descriptor chain mode works fine with SD/eMMC but causes
issues with SDIO. Sounds like the controller might have a problem.
The vendor SDIO driver includes at least one quirk:
https://github.com/hardkernel/linux/blob/odroidc2-3.14.y/drivers/amlogic/mmc/aml_sdio.c#L157
But this doesn't seem to be the problem here.

The Meson GX mmc driver allows already to fall back to bounce buffer mode,
so far this is used in case of a unaligned sg dma buffer. As a possible
workaround we could try the same fallback if command opcode is SD_IO_RW_EXTENDED.
(as crow's log shows issues with this comamnd only)

Could you please check whether the following fixes SDIO?

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 1842ed34..c51c37ea 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -210,6 +210,9 @@ static void meson_mmc_get_transfer_mode(struct mmc_host *mmc,
        int i;
        bool use_desc_chain_mode = true;

+       if (mrq->cmd->opcode == SD_IO_RW_EXTENDED)
+               return;
+
        for_each_sg(data->sg, sg, data->sg_len, i)
                /* check for 8 byte alignment */
                if (sg->offset & 7) {

Rgds, Heiner

> 
>> Kevin:
>> Before submitting the initial version of the driver, did you test also
>> SDIO or just SD/eMMC?
>>
>>>
>>> Regards,
>>> Martin
>>>
>>> [0] https://github.com/torvalds/linux/blob/master/drivers/mmc/host/meson-gx-mmc.c#L971
>>>
>>
> 
> [0] https://patchwork.kernel.org/patch/9725563/
> 
