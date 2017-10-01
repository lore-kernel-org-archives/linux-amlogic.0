From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 1 Oct 2017 14:12:34 +0200
Subject: [RFC PATCH] ARM: dts: meson8b: add reserved memory zones
In-Reply-To: <20171001114434.GU6726@otheros>
References: <20170929104132.18138-1-linus.luessing@c0d3.blue>
 <CAFBinCCy-5G=mM+ZsoxY8SrK5OWs7C-bbrj-Ayh7e-3-QiF4TA@mail.gmail.com>
 <20171001114434.GU6726@otheros>
Message-ID: <CAFBinCAjEtE8hGnhNKGdkP212pBvvSH_oVtvJJyDVbkUUS7qZQ@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Linus,

On Sun, Oct 1, 2017 at 1:44 PM, Linus L?ssing <linus.luessing@c0d3.blue> wrote:
> On Fri, Sep 29, 2017 at 08:49:25PM +0200, Martin Blumenstingl wrote:
>> maybe you could add a reference to my commit (8a7f0c52e8a0) and state
>> that your patch solves the same problem on the Meson8b platform
>> with that:
>>
>> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
> Ok, will do. Before resubmitting with a Signed-off-by, I'd like to
> understand a little more though.
>
>
> I retested with only the 2MB reservation at the start and that
> seems to be enough to fix the silent freezes.
this matches my observations (looking back at 8a7f0c52e8a0 I think my
description should have been a bit clearer).

> I tried to dig into the Amlogic/Hardkernel source code and found
> a PHY_OFFSET define which seems to reserve the 2MB there, if I'm
> not mistaken:
>
> https://github.com/hardkernel/linux/blob/odroidc-3.10.y/arch/arm/mach-meson8b/include/mach/memory.h#L26
interesting, I can't remember that I've seen that

> Unfortunately, there is no comment in there regarding why this
> might be needed. It seems that Hardkernel just copied it from the
> original Amlogic sources in this commit:
>
>     e647d67 AMLogic's patchset of 'amlogic-20140823'
>
> I'd reference the 2MB reservation in the original Amlogic
> source code somehow in the commit message if that makes sense?
> Just so people know why 2MB and not xx MB.
yes, this is what I typically how I do it: describe why it's needed
and where I found it in the Amlogic GPL kernel sources (if I did find
it)

> I also had a closer look at the S805 datasheet [0]. The Memory Map
> (chapter 4) has an extra "Region (boot)" column. The only
> difference to the "Region (Normal)" column is the very first
> entry: A 16MB region from 0x00000000 to 0x00FFFF.
>
> Which made me wonder whether the memory we'd reserve should maybe
> be 16MB instead of 2MB? Or maybe we should tell the S805 somehow
> that we would like to switch from "boot" to "normal" mode?
> Maybe disable the "ROM BOOT ROM clock" noted in chapter 6.3.2?
I neither know if extending the memory region to cover the first 16MiB
improves anything nor if we need to switch to "normal" mode manually
(or if that's already done by the bootloader)

> Regarding the ARM Power Firmware, any recommended readings? Also,
> could I somehow check whether this is used on the Odroid C1+
> (maybe some live memory dump while in uboot)?
>
> If this part is needed, I would maybe put it into a separate
> patch, as seems unrelated to the silent freezes.
the "ARM Power Firmware" is needed for system suspend, see my Meson8
commit 8a7f0c52e8a0 and [0]


Regards,
Martin


[0] https://www.spinics.net/lists/arm-kernel/msg579950.html
