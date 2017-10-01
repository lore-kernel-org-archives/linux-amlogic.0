From: linus.luessing@c0d3.blue (Linus =?utf-8?Q?L=C3=BCssing?=)
Date: Sun, 1 Oct 2017 13:44:34 +0200
Subject: [RFC PATCH] ARM: dts: meson8b: add reserved memory zones
In-Reply-To: <CAFBinCCy-5G=mM+ZsoxY8SrK5OWs7C-bbrj-Ayh7e-3-QiF4TA@mail.gmail.com>
References: <20170929104132.18138-1-linus.luessing@c0d3.blue>
 <CAFBinCCy-5G=mM+ZsoxY8SrK5OWs7C-bbrj-Ayh7e-3-QiF4TA@mail.gmail.com>
Message-ID: <20171001114434.GU6726@otheros>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Fri, Sep 29, 2017 at 08:49:25PM +0200, Martin Blumenstingl wrote:
> maybe you could add a reference to my commit (8a7f0c52e8a0) and state
> that your patch solves the same problem on the Meson8b platform
> with that:
> 
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Ok, will do. Before resubmitting with a Signed-off-by, I'd like to
understand a little more though.


I retested with only the 2MB reservation at the start and that
seems to be enough to fix the silent freezes.

I tried to dig into the Amlogic/Hardkernel source code and found
a PHY_OFFSET define which seems to reserve the 2MB there, if I'm
not mistaken:

https://github.com/hardkernel/linux/blob/odroidc-3.10.y/arch/arm/mach-meson8b/include/mach/memory.h#L26

Unfortunately, there is no comment in there regarding why this
might be needed. It seems that Hardkernel just copied it from the
original Amlogic sources in this commit:

    e647d67 AMLogic's patchset of 'amlogic-20140823'

I'd reference the 2MB reservation in the original Amlogic
source code somehow in the commit message if that makes sense?
Just so people know why 2MB and not xx MB.

I also had a closer look at the S805 datasheet [0]. The Memory Map
(chapter 4) has an extra "Region (boot)" column. The only
difference to the "Region (Normal)" column is the very first
entry: A 16MB region from 0x00000000 to 0x00FFFF.

Which made me wonder whether the memory we'd reserve should maybe
be 16MB instead of 2MB? Or maybe we should tell the S805 somehow
that we would like to switch from "boot" to "normal" mode?
Maybe disable the "ROM BOOT ROM clock" noted in chapter 6.3.2?


Regarding the ARM Power Firmware, any recommended readings? Also,
could I somehow check whether this is used on the Odroid C1+
(maybe some live memory dump while in uboot)?

If this part is needed, I would maybe put it into a separate
patch, as seems unrelated to the silent freezes.

Regards, Linus

[0]: https://dn.odroid.com/S805/Datasheet/S805_Datasheet%20V0.8%2020150126.pdf
