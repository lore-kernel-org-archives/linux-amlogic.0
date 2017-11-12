From: jbrunet@baylibre.com (Jerome Brunet)
Date: Sun, 12 Nov 2017 19:36:48 +0100
Subject: [PATCH] net: phy: realtek: fix RTL8211F interrupt mode
In-Reply-To: <20171112182521.GH30830@lunn.ch>
References: <66991733-9d1a-dbd2-9857-bba1ffca1cf8@gmail.com>
 <20171112182521.GH30830@lunn.ch>
Message-ID: <1510511808.3550.182.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sun, 2017-11-12 at 19:25 +0100, Andrew Lunn wrote:
> On Sun, Nov 12, 2017 at 04:16:04PM +0100, Heiner Kallweit wrote:
> > After commit b94d22d94ad22 "ARM64: dts: meson-gx: add external PHY
> > interrupt on some platforms" ethernet stopped working on my Odroid-C2
> > which has a RTL8211F phy.
> 
> Hi Jerome
> 
> Please could you test this. I Just want to be sure we don't introduce
> a regression by breaking the boards you tested on.

Sure I'll try it tomorrow.

When I tested this, I was more focused on the SoC side of it (the interrupt
controller itself) and whether the interrupt worked or not. The board (p200) I
tested on used a micrel PHY and worked well ... I did not really expect that a
problem would come from the phy side. This was clearly a mistake. 


> 
>   Thanks
> 	Andrew
