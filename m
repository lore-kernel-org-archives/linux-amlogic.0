From: andrew@lunn.ch (Andrew Lunn)
Date: Sun, 12 Nov 2017 21:06:08 +0100
Subject: [PATCH] net: phy: realtek: fix RTL8211F interrupt mode
In-Reply-To: <1510511808.3550.182.camel@baylibre.com>
References: <66991733-9d1a-dbd2-9857-bba1ffca1cf8@gmail.com>
 <20171112182521.GH30830@lunn.ch>
 <1510511808.3550.182.camel@baylibre.com>
Message-ID: <20171112200608.GA16892@lunn.ch>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sun, Nov 12, 2017 at 07:36:48PM +0100, Jerome Brunet wrote:
> On Sun, 2017-11-12 at 19:25 +0100, Andrew Lunn wrote:
> > On Sun, Nov 12, 2017 at 04:16:04PM +0100, Heiner Kallweit wrote:
> > > After commit b94d22d94ad22 "ARM64: dts: meson-gx: add external PHY
> > > interrupt on some platforms" ethernet stopped working on my Odroid-C2
> > > which has a RTL8211F phy.
> > 
> > Hi Jerome
> > 
> > Please could you test this. I Just want to be sure we don't introduce
> > a regression by breaking the boards you tested on.
> 
> Sure I'll try it tomorrow.
> 
> When I tested this, I was more focused on the SoC side of it (the interrupt
> controller itself) and whether the interrupt worked or not. The board (p200) I
> tested on used a micrel PHY and worked well ...

Hi Jerome

Ah, O.K. Do you have a board with a RTL8211? If all your boards use a
different PHY, there is no chance of a regression for you.

Thanks
	Andrew
