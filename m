From: ingrassia@epigenesys.com (Emiliano Ingrassia)
Date: Wed, 26 Jul 2017 11:55:06 +0200
Subject: [PATCH] ARM: dts: meson: Fixing L2 cache controller node for
 Meson8 and Meson8b
In-Reply-To: <CAFBinCBZ9BWfZ3rewsM=agJaFvpKNT=bADdTfv=+kV5GbnfT6w@mail.gmail.com>
References: <20170725152330.GA11792@ingrassia.epigenesys.com>
 <CAFBinCBZ9BWfZ3rewsM=agJaFvpKNT=bADdTfv=+kV5GbnfT6w@mail.gmail.com>
Message-ID: <20170726095506.GA5985@ingrassia.epigenesys.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Martin,

thank you for the quick response!

On Tue, Jul 25, 2017 at 08:51:15PM +0200, Martin Blumenstingl wrote:
> Hi Emiliano,
> 
> On Tue, Jul 25, 2017 at 5:23 PM, Emiliano Ingrassia
> <ingrassia@epigenesys.com> wrote:
> > Changing address filtering range to support the entire DDR region.
> > The previous range prevents ODROID-C1+ board from booting.
> thanks for the patch!
> could you please explain what issue you are seeing exactly? kernelci
> also has an Odroid-C1 in it's farm and it seems to boot mainline
> (4.13-rc2+) just fine, see: [0]
>

The issue I'm seeing is simple: I have an ODROID-C1+ board (rev 0.4 20150930)
which does not boot with the L2 cache controller filtering range set to <0x1000000 0xc0000000>.
U-Boot launches the kernel, which decompression complete successfully, but then nothing happens.

The S805 manual, chapter 4 (Memory Map), shows that the DDR memory
region start at 0x0 and ends at 0xbfffffff.

Following the description of the property "arm,filter-ranges" in Documentation/devicetree/bindings/arm/l2c2x0.txt,
which is:

- arm,filter-ranges : <start length> Starting address and length of window to
  filter. Addresses in the filter window are directed to the M1 port. Other
  addresses will go to the M0 port.

it seems correct to set the range to <0x0 0xc0000000>, to direct memory accesses
on port M1 and other accesses on port M0.

If I'm wrong, could you please explain why the range used so far is correct ?
>From the memory map, that range covers part of the DDR region
and part of the	APB3 CBUS memory region (0x01000000 + 0xc000000).
Is this the intention?

> I would like to understand why it's not working for you
> (I do not have an Odroid-C1 board myself, but my EC-100 also comes
> with a Meson8b SoC and 2GiB RAM and it boots fine there also)
> 
> > Signed-off-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
> > ---
> >  arch/arm/boot/dts/meson8b.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
> > index 72e4f425f190..3f0850cf3403 100644
> > --- a/arch/arm/boot/dts/meson8b.dtsi
> > +++ b/arch/arm/boot/dts/meson8b.dtsi
> > @@ -190,7 +190,7 @@
> >  &L2 {
> >         arm,data-latency = <3 3 3>;
> >         arm,tag-latency = <2 2 2>;
> > -       arm,filter-ranges = <0x100000 0xc0000000>;
> > +       arm,filter-ranges = <0x0 0xc0000000>;
> >  };
> >
> >  &saradc {
> > --
> > 2.13.2
> >
> >
> > _______________________________________________
> > linux-amlogic mailing list
> > linux-amlogic at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 
> Regards,
> Martin
> 
> 
> [0] https://storage.kernelci.org/mainline/master/v4.13-rc2-11-g25f6a53799d6/arm/multi_v7_defconfig/lab-baylibre-seattle/boot-meson8b-odroidc1.html

Best regards,

Emiliano
