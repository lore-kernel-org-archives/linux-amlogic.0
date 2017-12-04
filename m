From: jbrunet@baylibre.com (Jerome Brunet)
Date: Mon, 04 Dec 2017 10:43:07 +0100
Subject: [PATCH 2/2] ARM64: dts: meson-gxm: add the PHY interrupt line
 on Khadas VIM2
In-Reply-To: <20171202214037.17017-3-martin.blumenstingl@googlemail.com>
References: <20171202214037.17017-1-martin.blumenstingl@googlemail.com>
 <20171202214037.17017-3-martin.blumenstingl@googlemail.com>
Message-ID: <1512380587.2574.37.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sat, 2017-12-02 at 22:40 +0100, Martin Blumenstingl wrote:
> The INTB/PMEB pin of the RTL8211F PHY on the Khadas VIM2 is routed to
> GPIOZ_15. Add the corresponding interrupt using the GPIO interrupt
> controller so the PHY framework doesn't have to poll the PHY for it's
> status.
> 

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
