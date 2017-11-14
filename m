From: davem@davemloft.net (David Miller)
Date: Tue, 14 Nov 2017 21:34:14 +0900 (KST)
Subject: [PATCH] net: phy: realtek: fix RTL8211F interrupt mode
In-Reply-To: <66991733-9d1a-dbd2-9857-bba1ffca1cf8@gmail.com>
References: <66991733-9d1a-dbd2-9857-bba1ffca1cf8@gmail.com>
Message-ID: <20171114.213414.1380323996609297743.davem@davemloft.net>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

From: Heiner Kallweit <hkallweit1@gmail.com>
Date: Sun, 12 Nov 2017 16:16:04 +0100

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

Applied.
