From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Fri, 28 Jul 2017 22:38:07 +0200
Subject: [PATCH] ARM: dts: meson: Fixing L2 cache controller node for
 Meson8 and Meson8b
In-Reply-To: <20170728142845.GB31059@ingrassia.epigenesys.com>
References: <20170725152330.GA11792@ingrassia.epigenesys.com>
 <CAFBinCBZ9BWfZ3rewsM=agJaFvpKNT=bADdTfv=+kV5GbnfT6w@mail.gmail.com>
 <20170726095506.GA5985@ingrassia.epigenesys.com>
 <CAFBinCCx_JaKEAN3pSuc5TikCf24ovLO7kY4gtnjcgHWnuXKWg@mail.gmail.com>
 <20170728142845.GB31059@ingrassia.epigenesys.com>
Message-ID: <CAFBinCA9X9ASfxoo3yDACYcU=WNAtAT9bgisOv3WS++9aWUuOQ@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Emiliano,

On Fri, Jul 28, 2017 at 4:28 PM, Emiliano Ingrassia
<ingrassia@epigenesys.com> wrote:
> Hi Martin,
>
> thanks for the review.
>
> On Fri, Jul 28, 2017 at 01:54:39PM +0200, Martin Blumenstingl wrote:
>> Hi Emiliano,
>>
>> many thanks for looking into this (and providing detailed information)!
>>
>> On Wed, Jul 26, 2017 at 11:55 AM, Emiliano Ingrassia
>> <ingrassia@epigenesys.com> wrote:
>> > Hi Martin,
>> >
>> > thank you for the quick response!
>> >
>> > On Tue, Jul 25, 2017 at 08:51:15PM +0200, Martin Blumenstingl wrote:
>> >> Hi Emiliano,
>> >>
>> >> On Tue, Jul 25, 2017 at 5:23 PM, Emiliano Ingrassia
>> >> <ingrassia@epigenesys.com> wrote:
>> >> > Changing address filtering range to support the entire DDR region.
>> >> > The previous range prevents ODROID-C1+ board from booting.
>> >> thanks for the patch!
>> >> could you please explain what issue you are seeing exactly? kernelci
>> >> also has an Odroid-C1 in it's farm and it seems to boot mainline
>> >> (4.13-rc2+) just fine, see: [0]
>> >>
>> >
>> > The issue I'm seeing is simple: I have an ODROID-C1+ board (rev 0.4 20150930)
>> > which does not boot with the L2 cache controller filtering range set to <0x1000000 0xc0000000>.
>> > U-Boot launches the kernel, which decompression complete successfully, but then nothing happens.
>> thank you for explaining this - would you please put this info into
>> the commit message?
>>
>
> Of course, thanks for the suggestion.
>
>> > The S805 manual, chapter 4 (Memory Map), shows that the DDR memory
>> > region start at 0x0 and ends at 0xbfffffff.
>> >
>> > Following the description of the property "arm,filter-ranges" in Documentation/devicetree/bindings/arm/l2c2x0.txt,
>> > which is:
>> >
>> > - arm,filter-ranges : <start length> Starting address and length of window to
>> >   filter. Addresses in the filter window are directed to the M1 port. Other
>> >   addresses will go to the M0 port.
>> >
>> > it seems correct to set the range to <0x0 0xc0000000>, to direct memory accesses
>> > on port M1 and other accesses on port M0.
>> ok, makes sense so far
>>
>> > If I'm wrong, could you please explain why the range used so far is correct ?
>> maybe Carlo (who originally brought up that we are missing this
>> property) can give some more details why the original value was
>> chosen. I think he took it from the Amlogic GPL kernel sources, see
>> [0]
>>
>
> Yes, I think so too.
>
>> > From the memory map, that range covers part of the DDR region
>> > and part of the APB3 CBUS memory region (0x01000000 + 0xc000000).
>> > Is this the intention?
>> indeed, this sounds suspicious
>> maybe you could put this information in the commit message as well
>>
>> I will give your patch a try on a Meson8m2 (very similar to Meson8)
>> and Meson8b device this weekend and let you know.
>>
>
> Ok, I'll prepare a new patch with more detailed informations
> as soon as I receive a feedback from you.
I have just tested this on my Meson8m2 (Akaso M8S) and Meson8b
(EC-100) devices. I have some good and some bad news:
1. it works fine for me with both values (the original one and
arm,filter-ranges = <0x0 0xc0000000>;)
2. I can reproduce a hang under the following conditions:
- disabling SMP support (= removing the "enable-method" property from
all CPU nodes)
- setting arm,filter-ranges = <0x0 0xc0000000>;

it does *not* hang with arm,filter-ranges = <0x100000 0xc0000000>; -
regardless of whether SMP support is enabled or not
(SMP support is something I am working on currently)

could you please try building a kernel with my SMP patches, see [0]?
I'm interested whether enabling SMP support fixes this for you as well

>> >> I would like to understand why it's not working for you
>> >> (I do not have an Odroid-C1 board myself, but my EC-100 also comes
>> >> with a Meson8b SoC and 2GiB RAM and it boots fine there also)
>> >>
>> >> > Signed-off-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
>> >> > ---
>> >> >  arch/arm/boot/dts/meson8b.dtsi | 2 +-
>> >> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> your commit message states that this patch should fix Meson8 and
>> Meson8b - that means you'll also have to apply the same change to
>> meson8.dtsi
>>
>
> Sorry, the patch is only for the S805 SoC (meson8b) and I'll correct
> that information in the new commit.
> I don't know the memory maps of the S802 SoC (meson8) and the S812 SoC (meson8m2)
> and don't have any manual about those SoCs.
> So, I can't guarantee that the same informations can be applied to them.
unfortunately there's basically no public information about Meson8
(S802) or Meson8m2 (S812). however, based on studying Amlogic's GPL
3.10 kernel sources I believe that Meson8 and Meson8m2 only differ in
a few areas - most differences however were taken over from Meson8b
(CPU temperature calibration algorithm for example).
additionally Meson8/Meson8b/Meson8m2 share an almost identical clock
controller and so on.
so we cannot be 100% certain but in my opinion this indicates that
Meson8, Meson8b and Meson8m2 are pretty similar.

>> >> >
>> >> > diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
>> >> > index 72e4f425f190..3f0850cf3403 100644
>> >> > --- a/arch/arm/boot/dts/meson8b.dtsi
>> >> > +++ b/arch/arm/boot/dts/meson8b.dtsi
>> >> > @@ -190,7 +190,7 @@
>> >> >  &L2 {
>> >> >         arm,data-latency = <3 3 3>;
>> >> >         arm,tag-latency = <2 2 2>;
>> >> > -       arm,filter-ranges = <0x100000 0xc0000000>;
>> >> > +       arm,filter-ranges = <0x0 0xc0000000>;
>> >> >  };
>> >> >
>> >> >  &saradc {
>> >> > --
>> >> > 2.13.2
>> >> >
>> >> >
>> >> > _______________________________________________
>> >> > linux-amlogic mailing list
>> >> > linux-amlogic at lists.infradead.org
>> >> > http://lists.infradead.org/mailman/listinfo/linux-amlogic
>> >>
>> >> Regards,
>> >> Martin
>> >>
>> >>
>> >> [0] https://storage.kernelci.org/mainline/master/v4.13-rc2-11-g25f6a53799d6/arm/multi_v7_defconfig/lab-baylibre-seattle/boot-meson8b-odroidc1.html
>> >
>> > Best regards,
>> >
>> > Emiliano
>>
>>
>> Regards,
>> Martin
>>
>> [0] https://github.com/endlessm/linux-meson/blob/c173f4653186870f08dc9131b5d82ef4ab4151e1/arch/arm/boot/dts/meson8b_m201_1G.dts#L44
>
> Regards,
>
> Emiliano

[0] https://github.com/xdarklight/linux/tree/meson-mx-integration-4.13-20170723
