From: jbrunet@baylibre.com (Jerome Brunet)
Date: Mon, 14 Nov 2016 11:49:34 +0100
Subject: stmmac/RTL8211F/Meson GXBB: TX throughput problems
In-Reply-To: <20161113201339.667ac1f7@gmail.com>
References: <CAFBinCALSL_-izJ2tEsAjevAw90kGNTrQ3na3D1YV8f1dS1=Xg@mail.gmail.com>
 <ce15ad26-2d07-655d-b813-947ad86696ac@st.com>
 <CAFBinCC0HiEXx5mELztH6jYfUq2f1u0Tb+pSzAvwQSu9vYydGQ@mail.gmail.com>
 <20161031112524.4c4ee8f8@gmail.com> <1478192276.6632.34.camel@baylibre.com>
 <20161113201339.667ac1f7@gmail.com>
Message-ID: <1479120574.29252.29.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sun, 2016-11-13 at 20:13 +0100, Andr? Roth wrote:
> > 
> > Andre, the 3.14 kernel you are talking, is it this one ? :?
> > https://github.com/hardkernel/linux/tree/odroidc2-3.14.y
> 
> yes
> ?
> > 
> > Because in drivers/net/phy/realtek.c, they disable EEE, but
> > also?1000Base-T Full Duplex advertisement ?
> > 
> > +	/* disable 1000m adv*/
> > +	val = phy_read(phydev, 0x9);
> > +	phy_write(phydev, 0x9, val&(~(1<<9)));
> > 
> > If this is the kernel you are running, you should not be able to
> > have
> > ethernet at 1000MB/s ? Or is it in half duplex mode ?
> 
> ethtool shows 1000Mb/s Full-Duplex and the bandwith is around 300Mb/s
> (as measured by scp). kernel version: 3.14.65-73


Andre,

I checked again the kernel at?https://github.com/hardkernel/linux/tree/
odroidc2-3.14.y. The version you mention (3.14.65-73) seems to be:
sha1:?c75d5f4d1516cdd86d90a9d1c565bb0ed9251036
tag: jenkins-deb s905 kernel-73

In this particular version, both realtek drivers:
- drivers/net/phy/realtek.c
- drivers/amlogic/ethernet/phy/am_realtek.c

have the hack to disable 1000M advertisement. I don't understand how it
possible for you to have 1000Base-T Full Duplex with this, maybe I'm
missing something here ?

If you did compile the kernel yourself, could you check the 2 file
mentioned above ? Just to be sure there was no patch applied at the
last minute, which would not show up in the git history of hardkernel ?

Thx

Jerome

> 
> 
