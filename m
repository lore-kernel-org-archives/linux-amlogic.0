From: ingrassia@epigenesys.com (Emiliano Ingrassia)
Date: Tue, 3 Oct 2017 01:47:55 +0200
Subject: [PATCH] ARM: dts: meson8b: add reserved memory zone to fix
 silent freezes
In-Reply-To: <CAFBinCCde249b0o9aKMErEbKznM7UQrg1FzhLQ2whej0x_XLAg@mail.gmail.com>
References: <20171002155903.19511-1-linus.luessing@c0d3.blue>
 <CAFBinCCde249b0o9aKMErEbKznM7UQrg1FzhLQ2whej0x_XLAg@mail.gmail.com>
Message-ID: <20171002234755.GA18646@ingrassia.epigenesys.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Martin, Hi Linus,

I executed the test listed by Linus in [0] on my Odroid-C1+, using a
clean 4.14-rc3 kernel with USB patch only (without the proposed patch).
All tests completed succesfully and I didn't experiment any hang.
Regarding the fault mentioned in [1], I think that it could be related
to a bad rootfs. I experimented something similar and reported it to
Martin the past summer [2].

On Mon, Oct 02, 2017 at 08:39:30PM +0200, Martin Blumenstingl wrote:
> On Mon, Oct 2, 2017 at 5:59 PM, Linus L?ssing <linus.luessing@c0d3.blue> wrote:
> > So far, the stress-ng tool for instance quickly resulted in a silent
> > freeze of the system with no prior notice on a serial console when
> > running its filesystem or memory stressor classes.
> >
> > Even with a panic-on-OOM and reboot-on-panic (vm.panic_on_oom=1,
> > kernel.panic=10) configured, the system would neither reboot nor
> > would the OOM killer get any chance to otherwise do its job.
> >
> > The Amlogic reference source code uses a 2MB PHYS_OFFSET. With these 2MB

Reading the code in [3], it seems to me that the 2MB offset indicates
where the DDR first address is mapped in the CPUs addressing space.
In particular, it seems that DDR address 0 is mapped on CPU physical
address 0x200000 and that memory spans for 1GB (0x40000000).
As you argued, probably the first 2MB serve to address the ROM firmware
in the SoC.

However, the stress-ng tests succesfully completed also using this
patch.

Thank you for your work!

Best regards,

Emiliano

[0] http://lists.infradead.org/pipermail/linux-amlogic/2017-September/004775.html
[1] http://lists.infradead.org/pipermail/linux-amlogic/2017-September/004803.html
[2] http://lists.infradead.org/pipermail/linux-amlogic/2017-July/004468.html
[3] https://github.com/hardkernel/linux/blob/odroidc-3.10.y/drivers/of/fdt.c#L847-L854

> > reserved via DT, stress-ng was able to run on an Odroid C1+ just fine for
> > several hours, the OOM killer was able to kill processes again and if
> > configured would successfully trigger a reboot of the system.
> >
> > Fixes: 4a69fcd3a108 ("ARM: meson: Add DTS for Odroid-C1 and Tronfy MXQ boards")
> > Signed-off-by: Linus L?ssing <linus.luessing@c0d3.blue>
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> 
> >
> > ---
> > The following stress-ng command worked fine now:
> > $ stress-ng -v --sequential 0 -t 120s --exclude sysfs,opcode --metrics
> > (5 hours runtime, tested on an Odroid C1+ with an 4.14-rc1 kernel + SMP
> > + USB DTS patches)
> > ---
> >  arch/arm/boot/dts/meson8b.dtsi | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
> > index bc278da..d75a5b5 100644
> > --- a/arch/arm/boot/dts/meson8b.dtsi
> > +++ b/arch/arm/boot/dts/meson8b.dtsi
> > @@ -83,6 +83,18 @@
> >                 };
> >         };
> >
> > +       reserved-memory {
> > +               #address-cells = <1>;
> > +               #size-cells = <1>;
> > +               ranges;
> > +
> > +               /* 2 MiB reserved for Hardware ROM Firmware? */
> > +               hwrom at 0 {
> > +                       reg = <0x0 0x200000>;
> > +                       no-map;
> > +               };
> > +       };
> > +
> >         scu at c4300000 {
> >                 compatible = "arm,cortex-a5-scu";
> >                 reg = <0xc4300000 0x100>;
> > --
> > 2.1.4
> >
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
