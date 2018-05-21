From: jbrunet@baylibre.com (Jerome Brunet)
Date: Mon, 21 May 2018 11:33:24 +0200
Subject: [PATCH v2 2/2] clk: meson: axg: let mpll clocks round closest
In-Reply-To: <61fa49ae-e73e-957e-e28a-134102f82194@baylibre.com>
References: <20180515163652.19980-1-jbrunet@baylibre.com>
 <20180515163652.19980-3-jbrunet@baylibre.com>
 <61fa49ae-e73e-957e-e28a-134102f82194@baylibre.com>
Message-ID: <1526895204.2822.4.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue, 2018-05-15 at 18:46 +0200, Neil Armstrong wrote:
> On 15/05/2018 18:36, Jerome Brunet wrote:
> > Let the mpll dividers achieve the closest rate possible, even if
> > it means rounding the requested rate up.
> > 
> > This is done to improve the accuracy of the rates provided by these
> > plls to the audio subsystem
> > 
> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > ---
> > 
[...]
> 
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>

Applied
