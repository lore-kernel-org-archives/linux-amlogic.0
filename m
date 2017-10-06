From: ingrassia@epigenesys.com (Emiliano Ingrassia)
Date: Fri, 6 Oct 2017 10:10:50 +0200
Subject: [PATCH 0/4] meson8b-odroidc1: ethernet support
In-Reply-To: <20171002195432.GX6726@otheros>
References: <cover.1506507688.git.ingrassia@epigenesys.com>
 <20171002195432.GX6726@otheros>
Message-ID: <20171006081050.GA17290@ingrassia.epigenesys.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Linus,

thanks for the review!

On Mon, Oct 02, 2017 at 09:54:32PM +0200, Linus L?ssing wrote:
> Hi Emiliano,
> 
> On Wed, Sep 27, 2017 at 12:39:32PM +0200, Emiliano Ingrassia wrote:
> > This patchset enables ethernet support on Odroid-C1/C1+ boards,
> > improving and extending the ethernet description in the relative
> > device tree.
> > 
> > In particular:
> > - the mpll2 clock is enabled to avoid timeout during ethernet DMA reset;
> > - the Meson8b ethernet controller description is fixed and extended;
> > - the Odroid-C1/C1+ ethernet PHY description is added;
> > - the dwmac sleep and timeout values used during DMA reset are fixed.
> > 
> > This patchset has been tested on Odroid-C1+ board.
> 
> I tried this patchset on an Odroid C1+ with a v4.14-rc3 kernel
> plus these currently pending patches from this mailing list [0].
> 
> I'm observing the following issue:
> 
> 1) The C1+ successfully gets an IPv6 address from stateless
>    autoconfiguration
> 2) IPv6 pinging from the C1+ to another host X works
>         C1+ -> X => OK
> 3) IPv6 pinging from host X to the C1+ does not work:
>         X -> C1+ => not OK
> 4) While ping'ing from X->C1+ after some seconds / a minute  a
>    parallel C1+->X ping stops working too. After stopping the
>    X->C1+ ping the C1+->X ping quickly recovers within about
>    one or two seconds.
> 
> I tried adding the "eee-broken-1000t;" parameter to
> meson8b-odroidc1.dts similar to meson-gxbb-odroidc2.dts. Did not
> seem to help though.
> 
> Still, this behaviour very much feels like a powersaving issue.
> And/or an incomplete setup of the random MAC address on the C1+,
> for instance a missing notification of the MAC address for the
> ethernet chip, leaving it unable to wake up / create interrupts
> for incoming frames with the destination of the C1+.
> 
> The C1+ and host X are both connected via cable to the same switch
> of a router.
> 
> Can you reproduce this issue on your side, Emiliano?
> 

Ok. Actually I'm working on the dwmac-meson8b glue layer
to obtain a functional ethernet MAC. Infact, as stated
by Martin in [0], the correct PRG_ETHERNET_ADDR0 register address
should be 0xc1108140.

I'll try your tests as soon as I find the correct solution.

> Regards, Linus
> 

Regards,

Emiliano

[0] http://lists.infradead.org/pipermail/linux-amlogic/2017-September/004810.html

> [0]:
> 
> e008445 ARM: multi_v7_defconfig: Add Amlogic Meson MMC support
> a315380 ARM: dts: meson8b: Add MMC nodes
> 90a73b6 mmc: meson-mx-sdio: Add a driver for the Amlogic Meson8 and Meson8b SoCs
> 2f0b808 dt-bindings: mmc: Document the Amlogic Meson8 and Meson8b SDIO bindings
> 31247f2 net: stmmac: fixing DMA reset sleep and timeout values
> 1f43db3 ARM: dts: meson8b-odroidc1: enabling ethernet support
> 8ecc9d3 ARM: dts: meson8b: extending ethernet controller description
> be4a137 clk: meson8b: keep mpll2 clock enabled
> 54b818c ARM: dts: meson8b: add reserved memory zone to fix silent freezes
> 113819d ARM: dts: meson: enabling the USB Host controller on Odroid-C1/C1+ board
> 7240c6d ARM: dts: meson: fixing USB support on Meson8b
> a9153ba ARM: dts: meson8b: add support for booting the secondary CPU cores
> 8529b23 ARM: dts: meson8: add support for booting the secondary CPU cores
> fd053c9 ARM: meson: Add SMP bringup code for Meson8 and Meson8b
> d6b74cd ARM: smp_scu: allow the platform code to read the SCU CPU status
> 822a0d8 ARM: smp_scu: add a helper for powering on a specific CPU
> 7da8338 dt-bindings: Amlogic: Add Meson8 and Meson8b SMP related documentation
