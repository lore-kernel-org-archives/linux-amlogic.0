From: andrew@lunn.ch (Andrew Lunn)
Date: Sun, 12 Nov 2017 19:25:21 +0100
Subject: [PATCH] net: phy: realtek: fix RTL8211F interrupt mode
In-Reply-To: <66991733-9d1a-dbd2-9857-bba1ffca1cf8@gmail.com>
References: <66991733-9d1a-dbd2-9857-bba1ffca1cf8@gmail.com>
Message-ID: <20171112182521.GH30830@lunn.ch>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sun, Nov 12, 2017 at 04:16:04PM +0100, Heiner Kallweit wrote:
> After commit b94d22d94ad22 "ARM64: dts: meson-gx: add external PHY
> interrupt on some platforms" ethernet stopped working on my Odroid-C2
> which has a RTL8211F phy.

Hi Jerome

Please could you test this. I Just want to be sure we don't introduce
a regression by breaking the boards you tested on.

  Thanks
	Andrew
