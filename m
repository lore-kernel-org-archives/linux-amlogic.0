From: jbrunet@baylibre.com (Jerome Brunet)
Date: Mon, 21 May 2018 11:32:50 +0200
Subject: [PATCH v2 1/2] clk: meson: mpll: add round closest support
In-Reply-To: <CAFBinCCdKgFOod=JimSnBVRvQ8Xmggpa0Uok3rgr3ixB7o+fnA@mail.gmail.com>
References: <20180515163652.19980-1-jbrunet@baylibre.com>
 <20180515163652.19980-2-jbrunet@baylibre.com>
 <CAFBinCCdKgFOod=JimSnBVRvQ8Xmggpa0Uok3rgr3ixB7o+fnA@mail.gmail.com>
Message-ID: <1526895170.2822.3.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Mon, 2018-05-21 at 11:18 +0200, Martin Blumenstingl wrote:
> On Tue, May 15, 2018 at 6:36 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:
> > Allow the mpll driver to round the requested rate up if
> > CLK_MESON_MPLL_ROUND_CLOSEST is set and it provides a rate closer to the
> > requested rate.
> > 
> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> 
> Acked-by: Martin Blumenstingl<martin.blumenstingl@googlemail.com>

Thx for the feedback Martin.
Applied.
