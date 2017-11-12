From: jbrunet@baylibre.com (Jerome Brunet)
Date: Sun, 12 Nov 2017 19:39:46 +0100
Subject: [PATCH] net: phy: realtek: fix RTL8211F interrupt mode
In-Reply-To: <3a460dee-e714-e430-ce34-44c55d8a7490@gmail.com>
References: <66991733-9d1a-dbd2-9857-bba1ffca1cf8@gmail.com>
 <3a460dee-e714-e430-ce34-44c55d8a7490@gmail.com>
Message-ID: <1510511986.3550.183.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sun, 2017-11-12 at 10:29 -0800, Florian Fainelli wrote:
> Hi Heiner,
> 
> On 11/12/2017 07:16 AM, Heiner Kallweit wrote:
> > After commit b94d22d94ad22 "ARM64: dts: meson-gx: add external PHY
> > interrupt on some platforms" ethernet stopped working on my Odroid-C2
> > which has a RTL8211F phy.
> > 
> > It turned out that no interrupts were triggered. Further analysis
> > showed the register INER can't be altered on page 0.
> > Because register INSR needs to be accessed via page 0xa43 I assumed
> > that register INER needs to be accessed via some page too.
> > Some brute force check resulted in page 0xa42 being the right one.
> > 
> > With this patch the phy is working properly in interrupt mode.
> 
> What would be the appropriate Fixes: tag for that patch?

Fixes: 3447cf2e9a11 ("net/phy: Add support for Realtek RTL8211F")

Seems appropriate
