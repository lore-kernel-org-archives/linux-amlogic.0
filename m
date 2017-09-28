From: linus.luessing@c0d3.blue (Linus =?utf-8?Q?L=C3=BCssing?=)
Date: Thu, 28 Sep 2017 16:51:41 +0200
Subject: [PATCH] ARM: dts: meson: fixing USB support on Meson6, Meson8
 and Meson8b
In-Reply-To: <20170925224802.GA31386@ingrassia.epigenesys.com>
References: <20170922115708.GA14806@ingrassia.epigenesys.com>
 <20170924042803.GC2604@otheros>
 <20170925224802.GA31386@ingrassia.epigenesys.com>
Message-ID: <20170928145141.GG6726@otheros>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue, Sep 26, 2017 at 12:48:02AM +0200, Emiliano Ingrassia wrote:
> Could you list all the kernels you have tried (included versions and patches) ?

I tried your two patches with:

A) a clean multi_v7_defconfig and no extra patches on:
* 4.13.2
* 4.13.3

B) a multi_v7_defconfig excluding CONFIG_DRM_TEGRA
(causes build errors):
* 4.14.0-rc1, no extra patches
* 4.14.0-rc2, no extra patches
* 4.14.0-rc1, with SMP patches [0]

All these kernels hung for me for the mentioned stress-ng tests
almost immediately.

I was also lucky to at least get a glimpse at a kernel crash
output during a chdir test once. Unfortunately still cut very early:

~~~
[   97.499390] Unhandled fault: external abort on non-linefetch (0x1008) at 0
~~~

Regards, Linus


[0]:
81d519f ARM: dts: meson8b: add support for booting the secondary CPU cores
85ded56 ARM: dts: meson8: add support for booting the secondary CPU cores
c70daa9 ARM: meson: Add SMP bringup code for Meson8 and Meson8b
a39342c ARM: smp_scu: allow the platform code to read the SCU CPU status
0b1863d ARM: smp_scu: add a helper for powering on a specific CPU 
27efddb dt-bindings: Amlogic: Add Meson8 and Meson8b SMP related documentation
