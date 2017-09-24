From: linus.luessing@c0d3.blue (Linus =?utf-8?Q?L=C3=BCssing?=)
Date: Sun, 24 Sep 2017 06:42:41 +0200
Subject: [PATCH] ARM: dts: meson: fixing USB support on Meson6, Meson8
 and Meson8b
In-Reply-To: <20170924042803.GC2604@otheros>
References: <20170922115708.GA14806@ingrassia.epigenesys.com>
 <20170924042803.GC2604@otheros>
Message-ID: <20170924044241.GD2604@otheros>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

> Or could it be that it freezes
> so silently due to some sort of internal power issues? (I got a
> little paranoid with power stuff since the confirmed,
> hardware related power issues on the Odroid U3)

Although the USB powering seems to work way better with the Odroid
C1+ than with my Odroid U3:

When connecting the HDD via USB directly without the HUB, I can
hear the disk trying to spin up, then audibly failing (while
spin-up with the actively powered HUB works just fine). Even
though the kernel tries to respin it again and again, the system
itself stays stable.

On the Odroid U3, connecting this HDD via USB would make the
Odroid U3 crash or the internal USB hub or ethernet device
(internally wired to the same USB chip, if I understood
correctly?) vanish for me.

(So probably not a power issue on the Odroid C1+?)

Regards, Linus
