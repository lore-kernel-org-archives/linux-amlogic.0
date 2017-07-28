From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Fri, 28 Jul 2017 13:54:39 +0200
Subject: [PATCH] ARM: dts: meson: Fixing L2 cache controller node for
 Meson8 and Meson8b
In-Reply-To: <20170726095506.GA5985@ingrassia.epigenesys.com>
References: <20170725152330.GA11792@ingrassia.epigenesys.com>
 <CAFBinCBZ9BWfZ3rewsM=agJaFvpKNT=bADdTfv=+kV5GbnfT6w@mail.gmail.com>
 <20170726095506.GA5985@ingrassia.epigenesys.com>
Message-ID: <CAFBinCCx_JaKEAN3pSuc5TikCf24ovLO7kY4gtnjcgHWnuXKWg@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Emiliano,

many thanks for looking into this (and providing detailed information)!

On Wed, Jul 26, 2017 at 11:55 AM, Emiliano Ingrassia
<ingrassia@epigenesys.com> wrote:
> Hi Martin,
>
> thank you for the quick response!
>
> On Tue, Jul 25, 2017 at 08:51:15PM +0200, Martin Blumenstingl wrote:
>> Hi Emiliano,
>>
>> On Tue, Jul 25, 2017 at 5:23 PM, Emiliano Ingrassia
>> <ingrassia@epigenesys.com> wrote:
>> > Changing address filtering range to support the entire DDR region.
>> > The previous range prevents ODROID-C1+ board from booting.
>> thanks for the patch!
>> could you please explain what issue you are seeing exactly? kernelci
>> also has an Odroid-C1 in it's farm and it seems to boot mainline
>> (4.13-rc2+) just fine, see: [0]
>>
>
> The issue I'm seeing is simple: I have an ODROID-C1+ board (rev 0.4 20150930)
> which does not boot with the L2 cache controller filtering range set to <0x1000000 0xc0000000>.
> U-Boot launches the kernel, which decompression complete successfully, but then nothing happens.
thank you for explaining this - would you please put this info into
the commit message?

> The S805 manual, chapter 4 (Memory Map), shows that the DDR memory
> region start at 0x0 and ends at 0xbfffffff.
>
> Following the description of the property "arm,filter-ranges" in Documentation/devicetree/bindings/arm/l2c2x0.txt,
> which is:
>
> - arm,filter-ranges : <start length> Starting address and length of window to
>   filter. Addresses in the filter window are directed to the M1 port. Other
>   addresses will go to the M0 port.
>
> it seems correct to set the range to <0x0 0xc0000000>, to direct memory accesses
> on port M1 and other accesses on port M0.
ok, makes sense so far

> If I'm wrong, could you please explain why the range used so far is correct ?
maybe Carlo (who originally brought up that we are missing this
property) can give some more details why the original value was
chosen. I think he took it from the Amlogic GPL kernel sources, see
[0]

> From the memory map, that range covers part of the DDR region
> and part of the APB3 CBUS memory region (0x01000000 + 0xc000000).
> Is this the intention?
indeed, this sounds suspicious
maybe you could put this information in the commit message as well

I will give your patch a try on a Meson8m2 (very similar to Meson8)
and Meson8b device this weekend and let you know.

>> I would like to understand why it's not working for you
>> (I do not have an Odroid-C1 board myself, but my EC-100 also comes
>> with a Meson8b SoC and 2GiB RAM and it boots fine there also)
>>
>> > Signed-off-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
>> > ---
>> >  arch/arm/boot/dts/meson8b.dtsi | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
your commit message states that this patch should fix Meson8 and
Meson8b - that means you'll also have to apply the same change to
meson8.dtsi

>> >
>> > diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
>> > index 72e4f425f190..3f0850cf3403 100644
>> > --- a/arch/arm/boot/dts/meson8b.dtsi
>> > +++ b/arch/arm/boot/dts/meson8b.dtsi
>> > @@ -190,7 +190,7 @@
>> >  &L2 {
>> >         arm,data-latency = <3 3 3>;
>> >         arm,tag-latency = <2 2 2>;
>> > -       arm,filter-ranges = <0x100000 0xc0000000>;
>> > +       arm,filter-ranges = <0x0 0xc0000000>;
>> >  };
>> >
>> >  &saradc {
>> > --
>> > 2.13.2
>> >
>> >
>> > _______________________________________________
>> > linux-amlogic mailing list
>> > linux-amlogic at lists.infradead.org
>> > http://lists.infradead.org/mailman/listinfo/linux-amlogic
>>
>> Regards,
>> Martin
>>
>>
>> [0] https://storage.kernelci.org/mainline/master/v4.13-rc2-11-g25f6a53799d6/arm/multi_v7_defconfig/lab-baylibre-seattle/boot-meson8b-odroidc1.html
>
> Best regards,
>
> Emiliano


Regards,
Martin

[0] https://github.com/endlessm/linux-meson/blob/c173f4653186870f08dc9131b5d82ef4ab4151e1/arch/arm/boot/dts/meson8b_m201_1G.dts#L44
