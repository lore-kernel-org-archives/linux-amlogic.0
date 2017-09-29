From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Fri, 29 Sep 2017 20:49:25 +0200
Subject: [RFC PATCH] ARM: dts: meson8b: add reserved memory zones
In-Reply-To: <20170929104132.18138-1-linus.luessing@c0d3.blue>
References: <20170929104132.18138-1-linus.luessing@c0d3.blue>
Message-ID: <CAFBinCCy-5G=mM+ZsoxY8SrK5OWs7C-bbrj-Ayh7e-3-QiF4TA@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Linus,

On Fri, Sep 29, 2017 at 12:41 PM, Linus L?ssing
<linus.luessing@c0d3.blue> wrote:
> So far, the stress-ng tool for instance quickly resulted in a silent
> freeze of the system with no prior notice on a serial console when
> running its filesystem or memory stressor classes.
>
> Even with a panic-on-OOM and reboot-on-panic (vm.panic_on_oom=1,
> kernel.panic=10) configured, the system would neither reboot nor
> would the OOM killer get any chance to otherwise do its job.
>
> By copying the reserved memory sections used for meson8 already,
> stress-ng was able to run on an Odroid C1+ just fine for several hours,
> the OOM killer was able to do kill processes again and if configured
> would successfully trigger a reboot of the system.
>
> Reported-by: Linus L?ssing <linus.luessing@c0d3.blue>
maybe you could add a reference to my commit (8a7f0c52e8a0) and state
that your patch solves the same problem on the Meson8b platform
with that:

Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

>
> ---
> The following stress-ng command worked fine now:
> $ stress-ng -v --sequential 0 -t 120s --exclude sysfs,opcode --metrics
> (5 hours runtime, tested on an Odroid C1+ with an 4.14-rc1 kernel + SMP
> + USB DTS patches)
great to hear that this works for you!

>
> I do not know why these memory regions would need to be reserved, I
> copied them blindly from mesno8.dtsi. Furthermore I'm a little confused
> because the Hardkernel sources seem to reserver a totally different
> memory region (16MB from the region at 80MB to 96MB):
>
> https://github.com/hardkernel/linux/blob/odroidc-3.10.y/arch/arm/boot/dts/meson8b_odroidc.dts#L58
I think that specific region is used for the video hardware, see [0]
we might need that as soon as we have a HDMI driver

>
> If anyone more experienced and knowledege in this would like to claim
> authorship and responsibility for this patch or would like to suggest
> an alternative one then please feel free to do so.
> ---
>  arch/arm/boot/dts/meson8b.dtsi | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
> index b9b6600..aa5c79c 100644
> --- a/arch/arm/boot/dts/meson8b.dtsi
> +++ b/arch/arm/boot/dts/meson8b.dtsi
> @@ -92,6 +92,33 @@
>                 };
>         };
>
> +       reserved-memory {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges;
> +
> +               /* 2 MiB reserved for Hardware ROM Firmware? */
> +               hwrom at 0 {
> +                       reg = <0x0 0x200000>;
> +                       no-map;
> +               };
> +
> +               /*
> +                * 1 MiB reserved for the "ARM Power Firmware": this is ARM
> +                * code which is responsible for system suspend. It loads a
> +                * piece of ARC code ("arc_power" in the vendor u-boot tree)
> +                * into SRAM, executes that and shuts down the (last) ARM core.
> +                * The arc_power firmware then checks various wakeup sources
> +                * (IR remote receiver, HDMI CEC, WIFI and Bluetooth wakeup or
> +                * simply the power key) and re-starts the ARM core once it
> +                * detects a wakeup request.
> +                */
> +               power-firmware at 4f00000 {
> +                       reg = <0x4f00000 0x100000>;
> +                       no-map;
> +               };
> +       };
> +
>         scu at c4300000 {
>                 compatible = "arm,cortex-a5-scu";
>                 reg = <0xc4300000 0x100>;
> --
> 2.1.4
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic


[0] https://github.com/endlessm/linux-meson/blob/c173f4653186870f08dc9131b5d82ef4ab4151e1/arch/arm/kernel/devtree.c#L253
