From: neolynx@gmail.com (=?UTF-8?B?QW5kcsOp?= Roth)
Date: Sun, 13 Nov 2016 20:13:39 +0100
Subject: stmmac/RTL8211F/Meson GXBB: TX throughput problems
In-Reply-To: <1478192276.6632.34.camel@baylibre.com>
References: <CAFBinCALSL_-izJ2tEsAjevAw90kGNTrQ3na3D1YV8f1dS1=Xg@mail.gmail.com>
 <ce15ad26-2d07-655d-b813-947ad86696ac@st.com>
 <CAFBinCC0HiEXx5mELztH6jYfUq2f1u0Tb+pSzAvwQSu9vYydGQ@mail.gmail.com>
 <20161031112524.4c4ee8f8@gmail.com>
 <1478192276.6632.34.camel@baylibre.com>
Message-ID: <20161113201339.667ac1f7@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org


> Andre, the 3.14 kernel you are talking, is it this one ? :?
> https://github.com/hardkernel/linux/tree/odroidc2-3.14.y

yes
 
> Because in drivers/net/phy/realtek.c, they disable EEE, but
> also?1000Base-T Full Duplex advertisement ?
> 
> +	/* disable 1000m adv*/
> +	val = phy_read(phydev, 0x9);
> +	phy_write(phydev, 0x9, val&(~(1<<9)));
> 
> If this is the kernel you are running, you should not be able to have
> ethernet at 1000MB/s ? Or is it in half duplex mode ?

ethtool shows 1000Mb/s Full-Duplex and the bandwith is around 300Mb/s
(as measured by scp). kernel version: 3.14.65-73
