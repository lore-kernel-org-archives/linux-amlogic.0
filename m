From: jbrunet@baylibre.com (Jerome Brunet)
Date: Mon, 13 Nov 2017 17:36:02 +0100
Subject: [PATCH] net: phy: realtek: fix RTL8211F interrupt mode
In-Reply-To: <66991733-9d1a-dbd2-9857-bba1ffca1cf8@gmail.com>
References: <66991733-9d1a-dbd2-9857-bba1ffca1cf8@gmail.com>
Message-ID: <1510590962.3607.1.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sun, 2017-11-12 at 16:16 +0100, Heiner Kallweit wrote:
> After commit b94d22d94ad22 "ARM64: dts: meson-gx: add external PHY
> interrupt on some platforms" ethernet stopped working on my Odroid-C2
> which has a RTL8211F phy.
> 
> It turned out that no interrupts were triggered. Further analysis
> showed the register INER can't be altered on page 0.
> Because register INSR needs to be accessed via page 0xa43 I assumed
> that register INER needs to be accessed via some page too.
> Some brute force check resulted in page 0xa42 being the right one.
> 
> With this patch the phy is working properly in interrupt mode.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Tested-by: Jerome Brunet <jbrunet@baylibre.com>
