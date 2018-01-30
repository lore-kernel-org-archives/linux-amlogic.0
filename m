From: jbrunet@baylibre.com (Jerome Brunet)
Date: Tue, 30 Jan 2018 20:12:55 +0100
Subject: [PATCH] clk: meson: add axg misc bit to the mpll driver
In-Reply-To: <20180119154236.9797-1-jbrunet@baylibre.com>
References: <20180119154236.9797-1-jbrunet@baylibre.com>
Message-ID: <1517339575.3153.11.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Fri, 2018-01-19 at 16:42 +0100, Jerome Brunet wrote:
> On axg, the rate of the mpll is stuck as if sdm value was 4 and could not
> change (expect for mpll2 strangely). Looking at the vendor kernel, it
> turns out a new magic bit from the undocumented HHI_PLL_TOP_MISC register
> is required.
> 
> Setting this bit solves the problem and the mpll rates are back to normal
> 
> Fixes: 78b4af312f91 ("clk: meson-axg: add clock controller drivers")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Applied to clk-meson next/drivers
