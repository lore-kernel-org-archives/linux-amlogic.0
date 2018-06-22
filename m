From: jbrunet@baylibre.com (Jerome Brunet)
Date: Fri, 22 Jun 2018 12:42:10 +0200
Subject: [PATCH] clk: meson: remove obsolete register access
In-Reply-To: <0e57617b-0ece-3c6d-f124-6197ef82b1c7@baylibre.com>
References: <20180619160050.26958-1-jbrunet@baylibre.com>
 <0e57617b-0ece-3c6d-f124-6197ef82b1c7@baylibre.com>
Message-ID: <1529664130.2900.5.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Wed, 2018-06-20 at 10:31 +0200, Neil Armstrong wrote:
> On 19/06/2018 18:00, Jerome Brunet wrote:
> > The legacy method to access the hhi register space is not longer used.
> > We can safely drop it now.
> > 
> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > ---
> >  drivers/clk/meson/axg.c  | 37 ++-----------------------------------
> >  drivers/clk/meson/gxbb.c | 36 ++----------------------------------
> >  2 files changed, 4 insertions(+), 69 deletions(-)
> > 
> > 

[...]

> 
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>

Applied for next
