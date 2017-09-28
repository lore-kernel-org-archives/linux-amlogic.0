From: linus.luessing@c0d3.blue (Linus =?utf-8?Q?L=C3=BCssing?=)
Date: Thu, 28 Sep 2017 18:44:24 +0200
Subject: ARM: dts: meson: enabling the USB Host controller on
 Odroid-C1/C1+ board
In-Reply-To: <20170920144009.GA27374@ingrassia.epigenesys.com>
Message-ID: <20170928164424.GJ6726@otheros>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

> This patch enables the USB Host controller (USB1) and the relative USB2 PHY
> on Odroid-C1/C1+ board.
> 
> Signed-off-by: Emiliano Ingrassia <ingrassia@epigenesys.com>

As the freezes seems to be caused by something else and stress-ng works
fine for me now on an Odroid C1+ (at least with the reserved
memory regions):

Tested-by: Linus L?ssing <linus.luessing@c0d3.blue>

Cheers
