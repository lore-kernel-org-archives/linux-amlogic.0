From: davem@davemloft.net (David Miller)
Date: Tue, 24 Jan 2017 13:36:13 -0500 (EST)
Subject: [PATCH net-next v5 0/2] stmmac: dwmac-meson8b: configurable
 RGMII TX delay
In-Reply-To: <20170122220246.13602-1-martin.blumenstingl@googlemail.com>
References: <20161217182119.4037-1-martin.blumenstingl@googlemail.com>
 <20170122220246.13602-1-martin.blumenstingl@googlemail.com>
Message-ID: <20170124.133613.1355073769005063451.davem@davemloft.net>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 22 Jan 2017 23:02:44 +0100

> Currently the dwmac-meson8b stmmac glue driver uses a hardcoded 1/4
> cycle (= 2ns) TX clock delay. This seems to work fine for many boards
> (for example Odroid-C2 or Amlogic's reference boards) but there are
> some others where TX traffic is simply broken.
> There are probably multiple reasons why it's working on some boards
> while it's broken on others:
> - some of Amlogic's reference boards are using a Micrel PHY
> - hardware circuit design
> - maybe more...
> 
> iperf3 results on my Mecool BB2 board (Meson GXM, RTL8211F PHY) with
> TX clock delay disabled on the MAC (as it's enabled in the PHY driver).
> TX throughput was virtually zero before:
 ...
> I get similar TX throughput on my Meson GXBB "MXQ Pro+" board when I
> disable the PHY's TX-delay and configure a 4ms TX-delay on the MAC.
> So changes to at least the RTL8211F PHY driver are needed to get it
> working properly in all situations.

Series applied, thanks.
