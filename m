From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 13 Aug 2017 20:23:57 +0200
Subject: [PATCH] ARM: dts: meson: Fixing L2 cache controller node for
 Meson8 and Meson8b
In-Reply-To: <20170811142344.GA16724@ingrassia.epigenesys.com>
References: <20170725152330.GA11792@ingrassia.epigenesys.com>
 <CAFBinCBZ9BWfZ3rewsM=agJaFvpKNT=bADdTfv=+kV5GbnfT6w@mail.gmail.com>
 <20170726095506.GA5985@ingrassia.epigenesys.com>
 <CAFBinCCx_JaKEAN3pSuc5TikCf24ovLO7kY4gtnjcgHWnuXKWg@mail.gmail.com>
 <20170728142845.GB31059@ingrassia.epigenesys.com>
 <CAFBinCA9X9ASfxoo3yDACYcU=WNAtAT9bgisOv3WS++9aWUuOQ@mail.gmail.com>
 <20170729163236.GA20706@ingrassia.epigenesys.com>
 <CAFBinCDnOQq_izOy74c29oPrwXZPxs76kSeTDz_YJFO5+3z6nA@mail.gmail.com>
 <20170804182604.GA21480@ingrassia.epigenesys.com>
 <CAFBinCA6-boC+UKBXeiuwybq621oWqEAykvy4Ld-3Y_QGro21w@mail.gmail.com>
 <20170811142344.GA16724@ingrassia.epigenesys.com>
Message-ID: <CAFBinCCfC5HLdKRJD+n2wvip88fXQEO+eREosLPhxGOBNWMk+g@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Emiliano,

On Fri, Aug 11, 2017 at 4:23 PM, Emiliano Ingrassia
<ingrassia@epigenesys.com> wrote:
> Hi Martin,
>
> sorry for my late reply. Anyway, good news!
don't worry - I'm very busy as well (so it sometimes takes a while
until I reply).
great to hear that there are some good news!

>
> On Fri, Aug 04, 2017 at 10:46:36PM +0200, Martin Blumenstingl wrote:
>> Hi Emiliano,
>>
>> On Fri, Aug 4, 2017 at 8:26 PM, Emiliano Ingrassia
>> <ingrassia@epigenesys.com> wrote:
>> > Hi Martin,
>> >
>> > On Tue, Aug 01, 2017 at 08:49:37PM +0200, Martin Blumenstingl wrote:
>> >> Hi Emiliano,
>> >>
>> >> On Sat, Jul 29, 2017 at 6:32 PM, Emiliano Ingrassia
>> >> <ingrassia@epigenesys.com> wrote:
>> >> > Hi Martin,
>> >> >
>> >> > On Fri, Jul 28, 2017 at 10:38:07PM +0200, Martin Blumenstingl wrote:
>> >> >> Hi Emiliano,
>> >> >>
>> >> >> On Fri, Jul 28, 2017 at 4:28 PM, Emiliano Ingrassia
>> >> >> <ingrassia@epigenesys.com> wrote:
>> >> >> > Hi Martin,
>> >> >> >
>> >> >> > thanks for the review.
>> >> >> >
>> >> >> > On Fri, Jul 28, 2017 at 01:54:39PM +0200, Martin Blumenstingl wrote:
>> >> >> >> Hi Emiliano,
>> >> >> >>
>> >> >> >> many thanks for looking into this (and providing detailed information)!
>> >> >> >>
>> >> >> >> On Wed, Jul 26, 2017 at 11:55 AM, Emiliano Ingrassia
>> >> >> >> <ingrassia@epigenesys.com> wrote:
>> >> >> >> > Hi Martin,
>> >> >> >> >
>> >> >> >> > thank you for the quick response!
>> >> >> >> >
>> >> >> >> > On Tue, Jul 25, 2017 at 08:51:15PM +0200, Martin Blumenstingl wrote:
>> >> >> >> >> Hi Emiliano,
>> >> >> >> >>
>> >> >> >> >> On Tue, Jul 25, 2017 at 5:23 PM, Emiliano Ingrassia
>> >> >> >> >> <ingrassia@epigenesys.com> wrote:
>> >> >> >> >> > Changing address filtering range to support the entire DDR region.
>> >> >> >> >> > The previous range prevents ODROID-C1+ board from booting.
>> >> >> >> >> thanks for the patch!
>> >> >> >> >> could you please explain what issue you are seeing exactly? kernelci
>> >> >> >> >> also has an Odroid-C1 in it's farm and it seems to boot mainline
>> >> >> >> >> (4.13-rc2+) just fine, see: [0]
>> >> >> >> >>
>> >> >> >> >
>> >> >> >> > The issue I'm seeing is simple: I have an ODROID-C1+ board (rev 0.4 20150930)
>> >> >> >> > which does not boot with the L2 cache controller filtering range set to <0x1000000 0xc0000000>.
>> >> >> >> > U-Boot launches the kernel, which decompression complete successfully, but then nothing happens.
>> >> >> >> thank you for explaining this - would you please put this info into
>> >> >> >> the commit message?
>> >> >> >>
>> >> >> >
>> >> >> > Of course, thanks for the suggestion.
>> >> >> >
>> >> >> >> > The S805 manual, chapter 4 (Memory Map), shows that the DDR memory
>> >> >> >> > region start at 0x0 and ends at 0xbfffffff.
>> >> >> >> >
>> >> >> >> > Following the description of the property "arm,filter-ranges" in Documentation/devicetree/bindings/arm/l2c2x0.txt,
>> >> >> >> > which is:
>> >> >> >> >
>> >> >> >> > - arm,filter-ranges : <start length> Starting address and length of window to
>> >> >> >> >   filter. Addresses in the filter window are directed to the M1 port. Other
>> >> >> >> >   addresses will go to the M0 port.
>> >> >> >> >
>> >> >> >> > it seems correct to set the range to <0x0 0xc0000000>, to direct memory accesses
>> >> >> >> > on port M1 and other accesses on port M0.
>> >> >> >> ok, makes sense so far
>> >> >> >>
>> >> >> >> > If I'm wrong, could you please explain why the range used so far is correct ?
>> >> >> >> maybe Carlo (who originally brought up that we are missing this
>> >> >> >> property) can give some more details why the original value was
>> >> >> >> chosen. I think he took it from the Amlogic GPL kernel sources, see
>> >> >> >> [0]
>> >> >> >>
>> >> >> >
>> >> >> > Yes, I think so too.
>> >> >> >
>> >> >> >> > From the memory map, that range covers part of the DDR region
>> >> >> >> > and part of the APB3 CBUS memory region (0x01000000 + 0xc000000).
>> >> >> >> > Is this the intention?
>> >> >> >> indeed, this sounds suspicious
>> >> >> >> maybe you could put this information in the commit message as well
>> >> >> >>
>> >> >> >> I will give your patch a try on a Meson8m2 (very similar to Meson8)
>> >> >> >> and Meson8b device this weekend and let you know.
>> >> >> >>
>> >> >> >
>> >> >> > Ok, I'll prepare a new patch with more detailed informations
>> >> >> > as soon as I receive a feedback from you.
>> >> >> I have just tested this on my Meson8m2 (Akaso M8S) and Meson8b
>> >> >> (EC-100) devices. I have some good and some bad news:
>> >> >> 1. it works fine for me with both values (the original one and
>> >> >> arm,filter-ranges = <0x0 0xc0000000>;)
>> >> >> 2. I can reproduce a hang under the following conditions:
>> >> >> - disabling SMP support (= removing the "enable-method" property from
>> >> >> all CPU nodes)
>> >> >> - setting arm,filter-ranges = <0x0 0xc0000000>;
>> >> >>
>> >> >> it does *not* hang with arm,filter-ranges = <0x100000 0xc0000000>; -
>> >> >> regardless of whether SMP support is enabled or not
>> >> >> (SMP support is something I am working on currently)
>> >> >>
>> >> >> could you please try building a kernel with my SMP patches, see [0]?
>> >> >> I'm interested whether enabling SMP support fixes this for you as well
>> >> >>
>> >> >
>> >> > I tried your SMP patch and here are my results.
>> >> thank you for testing and reporting back!
>> >>
>> >> > The kernel correctly boot with filtering range <0x0 0xc0000000>
>> >> > with or without enabling SMP. In case of SMP, it tooks about
>> >> > 20 s to start after kernel decompression.
>> >> I'll give it another try on my boards - I'm not sure how long I
>> >> actually waited for some output on the serial console
>> >>
>> >> > The kernel correctly boot with filtering range <0x00100000 0xc0000000>,
>> >> > with or without enabling SMP, but at login I see many exceptions like the followings:
>> >> >
>> >> > [   15.701234] Unhandled fault: external abort on non-linefetch (0x1008) at 0xc0014004
>> >> > ...
>> >> > [   16.111141] Unhandled fault: external abort on non-linefetch (0x1008) at 0xc0015004
>> >> > ...
>> >> > [   16.471772] Unhandled fault: external abort on non-linefetch (0x1008) at 0xc004f006
>> >> >
>> >> > The interesting part is that the majority are about addresses greater than 0xc0000000.
>> >> that is interesting, indeed
>> >>
>> >
>> > It is, indeed. Consider that my rootfs lies on an USB flash drive and those
>> > exceptions are shown when init starts executing init scripts.
>> ok, that sounds very nasty
>>
>
> The exceptions were due to a broken rootfs. So, now the board boots
> correctly with your patch, branch meson-mx-integration-4.13-20170806,
> with filterting range 0x100000-0xc0000000, with or without enabling SMP
> support.
great that you figured it out! the fact that these errors changed with
the filtering range is also very deceptive...

> Anyway, the board still doesn't boot with the upstream kernel which
> contains the filtering range patch.
>
> Investigating your SMP patch I found that the problem lies in the
> meson8b clock code, drivers/clk/meson/meson8b.c, introduced by the patch
> d0b0c5396f4b6cabfc6c72f93dd452c50d83ab67.
>
> In particular, the board does not boot if one removes the
> CLKC_RESET_L2_CACHE_SOFT_RESET reset line from the meson8b_clk_reset_bits array,
> using the filtering range 0x100000-0xc0000000.
>
> So, I think that you should revert the patch about the filtering range
> and re-introduce it with the SMP patch or push the clock/reset patch on
> the upstream kernel as soon as possible.
the clock/reset patch will be part of v4.14 (if nothing goes horribly
wrong), see the amlogic clock driver updates for v4.14: [0]
maybe you can report back when these changes are part of linux-next (=
one day after these changes are merged into the clk tree), just to
confirm everything is fine then

>> (off-topic: would you like to submit your patch that enables USB on
>> Odroid-C1 upstream?)
>>
>
> I'll submit my patch as soon as I can, thank you for the interest.
great - thanks!


Regards,
Martin


[0] http://lists.infradead.org/pipermail/linux-amlogic/2017-August/004531.html
