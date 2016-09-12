From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Mon, 12 Sep 2016 23:29:29 +0200
Subject: stmmac/RTL8211F/Meson GXBB: TX throughput problems
In-Reply-To: <216F2694-1C1D-44DA-AC15-57ED15C24BBE@bluematt.me>
References: <CAFBinCALSL_-izJ2tEsAjevAw90kGNTrQ3na3D1YV8f1dS1=Xg@mail.gmail.com>
 <216F2694-1C1D-44DA-AC15-57ED15C24BBE@bluematt.me>
Message-ID: <CAFBinCAHng9JVDeK8SKE0XP79e8pKfHqoq1+0uajPZ_0+k29UA@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Matt,

On Sun, Sep 11, 2016 at 10:57 PM, Matt Corallo <linux@bluematt.me> wrote:
> The general advice is to force it into 100M mode then it seems to work fine.
> There is some issue with the driver seemingly not fully supporting 1G (at
> least on Odroid C2) which needs to be worked out.
thanks for the hint - by "forcing 100M mode" you mean "ethtool ?s eth0
speed 100 duplex full"?
Do you know more about this issue (or do you just know the
workaround)? It'd be interesting to know which "driver" does not
support Gbit speeds (as there are three drivers involved: realtek PHY
driver, stmmac and Meson stmmac glue driver


Regards,
Martin
