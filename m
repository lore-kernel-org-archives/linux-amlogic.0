From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Mon, 21 May 2018 11:18:28 +0200
Subject: [PATCH v2 1/2] clk: meson: mpll: add round closest support
In-Reply-To: <20180515163652.19980-2-jbrunet@baylibre.com>
References: <20180515163652.19980-1-jbrunet@baylibre.com>
 <20180515163652.19980-2-jbrunet@baylibre.com>
Message-ID: <CAFBinCCdKgFOod=JimSnBVRvQ8Xmggpa0Uok3rgr3ixB7o+fnA@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue, May 15, 2018 at 6:36 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:
> Allow the mpll driver to round the requested rate up if
> CLK_MESON_MPLL_ROUND_CLOSEST is set and it provides a rate closer to the
> requested rate.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Acked-by: Martin Blumenstingl<martin.blumenstingl@googlemail.com>


I gave it a quick spin on Odroid-C1 (which uses an RGMII Ethernet PHY
and the RGMII TX clock is supplied by MPLL2). the clock tree looks
fine and Ethernet is still working:
          mpll2_div                   1        1        0   249999701
        0 0
            mpll2                    1        1        0   249999701
       0 0
               c9410000.ethernet#m250_sel       1        1        0
249999701          0 0
                  c9410000.ethernet#m250_div       1        1        0
  249999701          0 0
                     c9410000.ethernet#fixed_div2       1        1
   0   124999850          0 0
                        c9410000.ethernet#rgmii_tx_en       1        1
       0   124999850          0 0
