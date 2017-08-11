From: ingrassia@epigenesys.com (Emiliano Ingrassia)
Date: Fri, 11 Aug 2017 16:23:44 +0200
Subject: [PATCH] ARM: dts: meson: Fixing L2 cache controller node for
 Meson8 and Meson8b
In-Reply-To: <CAFBinCA6-boC+UKBXeiuwybq621oWqEAykvy4Ld-3Y_QGro21w@mail.gmail.com>
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
Message-ID: <20170811142344.GA16724@ingrassia.epigenesys.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Martin,

sorry for my late reply. Anyway, good news!

On Fri, Aug 04, 2017 at 10:46:36PM +0200, Martin Blumenstingl wrote:
> Hi Emiliano,
> 
> On Fri, Aug 4, 2017 at 8:26 PM, Emiliano Ingrassia
> <ingrassia@epigenesys.com> wrote:
> > Hi Martin,
> >
> > On Tue, Aug 01, 2017 at 08:49:37PM +0200, Martin Blumenstingl wrote:
> >> Hi Emiliano,
> >>
> >> On Sat, Jul 29, 2017 at 6:32 PM, Emiliano Ingrassia
> >> <ingrassia@epigenesys.com> wrote:
> >> > Hi Martin,
> >> >
> >> > On Fri, Jul 28, 2017 at 10:38:07PM +0200, Martin Blumenstingl wrote:
> >> >> Hi Emiliano,
> >> >>
> >> >> On Fri, Jul 28, 2017 at 4:28 PM, Emiliano Ingrassia
> >> >> <ingrassia@epigenesys.com> wrote:
> >> >> > Hi Martin,
> >> >> >
> >> >> > thanks for the review.
> >> >> >
> >> >> > On Fri, Jul 28, 2017 at 01:54:39PM +0200, Martin Blumenstingl wrote:
> >> >> >> Hi Emiliano,
> >> >> >>
> >> >> >> many thanks for looking into this (and providing detailed information)!
> >> >> >>
> >> >> >> On Wed, Jul 26, 2017 at 11:55 AM, Emiliano Ingrassia
> >> >> >> <ingrassia@epigenesys.com> wrote:
> >> >> >> > Hi Martin,
> >> >> >> >
> >> >> >> > thank you for the quick response!
> >> >> >> >
> >> >> >> > On Tue, Jul 25, 2017 at 08:51:15PM +0200, Martin Blumenstingl wrote:
> >> >> >> >> Hi Emiliano,
> >> >> >> >>
> >> >> >> >> On Tue, Jul 25, 2017 at 5:23 PM, Emiliano Ingrassia
> >> >> >> >> <ingrassia@epigenesys.com> wrote:
> >> >> >> >> > Changing address filtering range to support the entire DDR region.
> >> >> >> >> > The previous range prevents ODROID-C1+ board from booting.
> >> >> >> >> thanks for the patch!
> >> >> >> >> could you please explain what issue you are seeing exactly? kernelci
> >> >> >> >> also has an Odroid-C1 in it's farm and it seems to boot mainline
> >> >> >> >> (4.13-rc2+) just fine, see: [0]
> >> >> >> >>
> >> >> >> >
> >> >> >> > The issue I'm seeing is simple: I have an ODROID-C1+ board (rev 0.4 20150930)
> >> >> >> > which does not boot with the L2 cache controller filtering range set to <0x1000000 0xc0000000>.
> >> >> >> > U-Boot launches the kernel, which decompression complete successfully, but then nothing happens.
> >> >> >> thank you for explaining this - would you please put this info into
> >> >> >> the commit message?
> >> >> >>
> >> >> >
> >> >> > Of course, thanks for the suggestion.
> >> >> >
> >> >> >> > The S805 manual, chapter 4 (Memory Map), shows that the DDR memory
> >> >> >> > region start at 0x0 and ends at 0xbfffffff.
> >> >> >> >
> >> >> >> > Following the description of the property "arm,filter-ranges" in Documentation/devicetree/bindings/arm/l2c2x0.txt,
> >> >> >> > which is:
> >> >> >> >
> >> >> >> > - arm,filter-ranges : <start length> Starting address and length of window to
> >> >> >> >   filter. Addresses in the filter window are directed to the M1 port. Other
> >> >> >> >   addresses will go to the M0 port.
> >> >> >> >
> >> >> >> > it seems correct to set the range to <0x0 0xc0000000>, to direct memory accesses
> >> >> >> > on port M1 and other accesses on port M0.
> >> >> >> ok, makes sense so far
> >> >> >>
> >> >> >> > If I'm wrong, could you please explain why the range used so far is correct ?
> >> >> >> maybe Carlo (who originally brought up that we are missing this
> >> >> >> property) can give some more details why the original value was
> >> >> >> chosen. I think he took it from the Amlogic GPL kernel sources, see
> >> >> >> [0]
> >> >> >>
> >> >> >
> >> >> > Yes, I think so too.
> >> >> >
> >> >> >> > From the memory map, that range covers part of the DDR region
> >> >> >> > and part of the APB3 CBUS memory region (0x01000000 + 0xc000000).
> >> >> >> > Is this the intention?
> >> >> >> indeed, this sounds suspicious
> >> >> >> maybe you could put this information in the commit message as well
> >> >> >>
> >> >> >> I will give your patch a try on a Meson8m2 (very similar to Meson8)
> >> >> >> and Meson8b device this weekend and let you know.
> >> >> >>
> >> >> >
> >> >> > Ok, I'll prepare a new patch with more detailed informations
> >> >> > as soon as I receive a feedback from you.
> >> >> I have just tested this on my Meson8m2 (Akaso M8S) and Meson8b
> >> >> (EC-100) devices. I have some good and some bad news:
> >> >> 1. it works fine for me with both values (the original one and
> >> >> arm,filter-ranges = <0x0 0xc0000000>;)
> >> >> 2. I can reproduce a hang under the following conditions:
> >> >> - disabling SMP support (= removing the "enable-method" property from
> >> >> all CPU nodes)
> >> >> - setting arm,filter-ranges = <0x0 0xc0000000>;
> >> >>
> >> >> it does *not* hang with arm,filter-ranges = <0x100000 0xc0000000>; -
> >> >> regardless of whether SMP support is enabled or not
> >> >> (SMP support is something I am working on currently)
> >> >>
> >> >> could you please try building a kernel with my SMP patches, see [0]?
> >> >> I'm interested whether enabling SMP support fixes this for you as well
> >> >>
> >> >
> >> > I tried your SMP patch and here are my results.
> >> thank you for testing and reporting back!
> >>
> >> > The kernel correctly boot with filtering range <0x0 0xc0000000>
> >> > with or without enabling SMP. In case of SMP, it tooks about
> >> > 20 s to start after kernel decompression.
> >> I'll give it another try on my boards - I'm not sure how long I
> >> actually waited for some output on the serial console
> >>
> >> > The kernel correctly boot with filtering range <0x00100000 0xc0000000>,
> >> > with or without enabling SMP, but at login I see many exceptions like the followings:
> >> >
> >> > [   15.701234] Unhandled fault: external abort on non-linefetch (0x1008) at 0xc0014004
> >> > ...
> >> > [   16.111141] Unhandled fault: external abort on non-linefetch (0x1008) at 0xc0015004
> >> > ...
> >> > [   16.471772] Unhandled fault: external abort on non-linefetch (0x1008) at 0xc004f006
> >> >
> >> > The interesting part is that the majority are about addresses greater than 0xc0000000.
> >> that is interesting, indeed
> >>
> >
> > It is, indeed. Consider that my rootfs lies on an USB flash drive and those
> > exceptions are shown when init starts executing init scripts.
> ok, that sounds very nasty
> 

The exceptions were due to a broken rootfs. So, now the board boots
correctly with your patch, branch meson-mx-integration-4.13-20170806,
with filterting range 0x100000-0xc0000000, with or without enabling SMP
support.

Anyway, the board still doesn't boot with the upstream kernel which
contains the filtering range patch.

Investigating your SMP patch I found that the problem lies in the
meson8b clock code, drivers/clk/meson/meson8b.c, introduced by the patch
d0b0c5396f4b6cabfc6c72f93dd452c50d83ab67.

In particular, the board does not boot if one removes the
CLKC_RESET_L2_CACHE_SOFT_RESET reset line from the meson8b_clk_reset_bits array,
using the filtering range 0x100000-0xc0000000.

So, I think that you should revert the patch about the filtering range
and re-introduce it with the SMP patch or push the clock/reset patch on
the upstream kernel as soon as possible.


> (off-topic: would you like to submit your patch that enables USB on
> Odroid-C1 upstream?)
>

I'll submit my patch as soon as I can, thank you for the interest.

> >> > I suspect that the problem lies in SCU initialization, which depends on
> >> > bootloader without your patch, and its interaction with the L2 cache.
> >> so it could be either the SCU initialization or the L2 cache
> >> initialization (or both).
> >> I found that Amlogic sets quite a few L2 cache flags, see [0]
> >> This should map to the following values on an upstream kernel:
> >>   prefetch-data = <1>;
> >>   prefetch-instr = <1>;
> >>   arm,shared-override;
> >>   arm,double-linefill = <1>;
> >>   arm,prefetch-drop = <1>;
> >>   arm,prefetch-offset = <7>;
> >> (potentially more flags, those were the ones that I could easily translate)
> >> have you tried experimenting with these yet?
> >>
> >
> > I tried the following flags with no success:
> >
> > arm,double-linefill = <1>;
> > arm,prefetch-drop = <1>;
> > arm,prefetch-offset = <7>;
> > prefetch-data = <1>;
> > prefetch-instr = <1>;
> > arm,shared-override;
> > cache-unified;
> > cache-level = <2>;
> the last two are inherited from meson.dtsi
> 
> thanks for testing - too bad this didn't help :/
> 
> >> > In particular, looking at the image at page 15 of S805 SoC manual, I saw
> >> > that the SCU has two ports: one which directly connects it to the bus and
> >> > one which connects it to the L2 cache memory.
> >> >
> >> > Is it possible that those are the M0 and M1 ports of the SCU and that
> >> > the filtering range causes cached accesses only on the filtered range ?
> >> I must admit that I don't know much about how this all works.
> >> maybe someone else here on the list can help explaining this (I would
> >> also like to understand all this). we might also include the linux-arm
> >> list, since I'm sure that someone can explain this to us
> >>
> >
> > It seems that those ports were used to implement Trusted Execution Environment.
> > Check the function pl310_of_setup() in [0].
> these CONFIG_MESON_TRUSTZONE #ifdefs are used because with trustzone
> enabled access to critical system registers (L2 cache controller) is
> forbidden (I guess to prevent someone from reading data from L2 cache
> which is not meant to be seen by "non trusted code")
> 
> > Other interesting thing: a read of SCU filtering start and end address
> > registers, before initialization by kernel, returns 0x1 and 0xc0000000 values.
> > The first is simple the oring of 0x0 with 1, which indicates that address filtering
> > is enabled [1].
> OK, I verified this on my Meson8m2 device:
> #md 0xc4200c00 2
> c4200c00: 00000001 c0000000    ........
> 
> > I'm using hardkernel U-boot as bootloader [2].
> I am also using the bootloader that was shipped with the device
> 
> with the comments from your last email I gave it another go on my
> Meson8m2 device:
> - as you said it boots fine with both filter-ranges
> - with filter start address 0x100000 it boots immediately and the
> secondary CPU cores (1-3) are started successfully
> - with filter start address 0x0 booting is delayed (probably because)
> and the secondary CPU cores (1-3) do NOT come up successfully ()
> - I do not see any "Unhandled fault: external abort on non-linefetch"
> messages regardless of the filter start address (I am booting from a
> class 10 SD card)
> 
> it is also interesting that hardkernel's meson8b_odroidc.dts also uses
> start-address 0x100000, see [0]
> 
> do you have an SD card or another USB stick which you could use as rootfs?
> I would like to rule out a corrupted rootfs (for example due to a bad
> USB thumb drive)
> 
> it is also suspicious that SMP only works with filter start address 0x100000
> you can confirm this by running "lscpu | grep CPU" - broken SMP (with
> filter start address 0x0) will lead to the following output:
> CPU(s):                4
> On-line CPU(s) list:   0
> Off-line CPU(s) list:  1-3
> (while you should see 0-3 being online if SMP worked)
> 
> >> >
> >> >> >> >> I would like to understand why it's not working for you
> >> >> >> >> (I do not have an Odroid-C1 board myself, but my EC-100 also comes
> >> >> >> >> with a Meson8b SoC and 2GiB RAM and it boots fine there also)
> >> >> >> >>
> >> >> >> >> > Signed-off-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
> >> >> >> >> > ---
> >> >> >> >> >  arch/arm/boot/dts/meson8b.dtsi | 2 +-
> >> >> >> >> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >> >> >> your commit message states that this patch should fix Meson8 and
> >> >> >> Meson8b - that means you'll also have to apply the same change to
> >> >> >> meson8.dtsi
> >> >> >>
> >> >> >
> >> >> > Sorry, the patch is only for the S805 SoC (meson8b) and I'll correct
> >> >> > that information in the new commit.
> >> >> > I don't know the memory maps of the S802 SoC (meson8) and the S812 SoC (meson8m2)
> >> >> > and don't have any manual about those SoCs.
> >> >> > So, I can't guarantee that the same informations can be applied to them.
> >> >> unfortunately there's basically no public information about Meson8
> >> >> (S802) or Meson8m2 (S812). however, based on studying Amlogic's GPL
> >> >> 3.10 kernel sources I believe that Meson8 and Meson8m2 only differ in
> >> >> a few areas - most differences however were taken over from Meson8b
> >> >> (CPU temperature calibration algorithm for example).
> >> >> additionally Meson8/Meson8b/Meson8m2 share an almost identical clock
> >> >> controller and so on.
> >> >> so we cannot be 100% certain but in my opinion this indicates that
> >> >> Meson8, Meson8b and Meson8m2 are pretty similar.
> >> >>
> >> >> >> >> >
> >> >> >> >> > diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
> >> >> >> >> > index 72e4f425f190..3f0850cf3403 100644
> >> >> >> >> > --- a/arch/arm/boot/dts/meson8b.dtsi
> >> >> >> >> > +++ b/arch/arm/boot/dts/meson8b.dtsi
> >> >> >> >> > @@ -190,7 +190,7 @@
> >> >> >> >> >  &L2 {
> >> >> >> >> >         arm,data-latency = <3 3 3>;
> >> >> >> >> >         arm,tag-latency = <2 2 2>;
> >> >> >> >> > -       arm,filter-ranges = <0x100000 0xc0000000>;
> >> >> >> >> > +       arm,filter-ranges = <0x0 0xc0000000>;
> >> >> >> >> >  };
> >> >> >> >> >
> >> >> >> >> >  &saradc {
> >> >> >> >> > --
> >> >> >> >> > 2.13.2
> >> >> >> >> >
> >> >> >> >> >
> >> >> >> >> > _______________________________________________
> >> >> >> >> > linux-amlogic mailing list
> >> >> >> >> > linux-amlogic at lists.infradead.org
> >> >> >> >> > http://lists.infradead.org/mailman/listinfo/linux-amlogic
> >> >> >> >>
> >> >> >> >> Regards,
> >> >> >> >> Martin
> >> >> >> >>
> >> >> >> >>
> >> >> >> >> [0] https://storage.kernelci.org/mainline/master/v4.13-rc2-11-g25f6a53799d6/arm/multi_v7_defconfig/lab-baylibre-seattle/boot-meson8b-odroidc1.html
> >> >> >> >
> >> >> >> > Best regards,
> >> >> >> >
> >> >> >> > Emiliano
> >> >> >>
> >> >> >>
> >> >> >> Regards,
> >> >> >> Martin
> >> >> >>
> >> >> >> [0] https://github.com/endlessm/linux-meson/blob/c173f4653186870f08dc9131b5d82ef4ab4151e1/arch/arm/boot/dts/meson8b_m201_1G.dts#L44
> >> >> >
> >> >> > Regards,
> >> >> >
> >> >> > Emiliano
> >> >>
> >> >> [0] https://github.com/xdarklight/linux/tree/meson-mx-integration-4.13-20170723
> >> >
> >> > Thanks,
> >> >
> >> > Emiliano
> >>
> >> Regards,
> >> Martin
> >>
> >>
> >> [0] https://github.com/hardkernel/linux/blob/odroidc-3.10.y/arch/arm/boot/dts/meson8b_odroidc.dts#L34
> >
> > [0] https://github.com/hardkernel/linux/blob/odroidc-3.10.y/arch/arm/mm/cache-l2x0.c
> > [1] http://infocenter.arm.com/help/topic/com.arm.doc.ddi0246a/DDI0246A_l2cc_pl310_r0p0_trm.pdf
> > [2] https://github.com/hardkernel/u-boot/tree/odroidc-v2011.03
> >
> > Best regards,
> >
> > Emiliano
> 
> 
> Regards,
> Martin
> 
> 
> [0] https://github.com/hardkernel/linux/blob/odroidc-3.10.y/arch/arm/boot/dts/meson8b_odroidc.dts#L34

Regards,

Emiliano
