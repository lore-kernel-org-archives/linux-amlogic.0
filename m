From: linus.luessing@c0d3.blue (Linus =?utf-8?Q?L=C3=BCssing?=)
Date: Thu, 28 Sep 2017 18:35:50 +0200
Subject: [PATCH] ARM: dts: meson: fixing USB support on Meson6, Meson8
 and Meson8b
In-Reply-To: <CAFBinCCDZjzCacPHLh6kMkoQ3Ygd6+HSnSHHz5cDpp65+FW6KQ@mail.gmail.com>
References: <20170922115708.GA14806@ingrassia.epigenesys.com>
 <CAFBinCCDZjzCacPHLh6kMkoQ3Ygd6+HSnSHHz5cDpp65+FW6KQ@mail.gmail.com>
Message-ID: <20170928163550.GI6726@otheros>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sat, Sep 23, 2017 at 03:15:23PM +0200, Martin Blumenstingl wrote:
> > Fixes: e29b1cf87473 ("ARM: dts: meson: add USB support on Meson8 and Meson8b")
> >
> > Signed-off-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
> 
> USB on my Meson8 (Meson8m2 to be exact) board still works fine (just
> like before - maybe that was a fluke though...), confirmed by reading
> a USB thumb drive to /dev/null:
> 
> Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> 
> as well as (me being the one who originally didn't do this right):
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

As the freezes seems to be caused by something else and stress-ng works
fine for me now on an Odroid C1+ (at least with the reserved
memory regions):

Tested-by: Linus L?ssing <linus.luessing@c0d3.blue>

Cheers
