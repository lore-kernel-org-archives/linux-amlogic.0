From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Wed, 4 Jul 2018 19:34:53 +0200
Subject: [PATCH 1/3] clk: meson: gxbb: remove HHI_GEN_CLK_CTNL duplicate
 definition
In-Reply-To: <20180704165458.24149-2-jbrunet@baylibre.com>
References: <20180704165458.24149-1-jbrunet@baylibre.com>
 <20180704165458.24149-2-jbrunet@baylibre.com>
Message-ID: <CAFBinCCJPf5EhAu1gcToiXWsCpTYfHrE6XH0FGe1NVFv96WVXA@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Wed, Jul 4, 2018 at 6:55 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> HHI_GEN_CLK_CTNL is defined twice, just remove the duplicate definition
>
> Fixes: 738f66d3211d ("clk: gxbb: add AmLogic GXBB clk controller driver")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

good catch Jerome!
