From: jbrunet@baylibre.com (Jerome Brunet)
Date: Thu, 18 Jan 2018 19:45:23 +0100
Subject: [PATCH 0/9] clk: meson: pll fixes
Message-ID: <20180118184532.6856-1-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This changeset is collection of fixes and clean-up around the pll clock
provider. This has been triggered by the discussion around the ethernet
clock on the axg [0].

On the axg the rate reported by the fixed_pll was off by 8Mhz,
which led the internal mux of the ethernet driver to pick an mpll2
instead of the fdiv4.

With this series applied, the fixed_pll of the axg now reports
1999998046 Hz, which is coherent with measurements (~2GHz)

While debugging this, we uncovered quite a mess around the hdmi_pll
of the gxbb and gxl family. This is also fixed by this series.

Last, the parameters table provided to the read-only sys_plls have
been removed, saving a bit of memory

There is still work to be done on this clock provider. Someday,
I hope to see the parameter tables go away completely. This pll
is just a (quite complex) fractional divider, we sould be able to
figure something out at runtime.

Jerome Brunet (9):
  clk: meson: check pll rate param table before using it
  clk: meson: remove useless pll rate param tables
  clk: meson: remove unnecessary rounding in the pll clock
  clk: meson: use frac parameter width instead of a constant
  clk: meson: add od3 to the pll driver
  clk: meson: add gxl hdmi pll
  clk: meson: fix pll with fractional part calculation
  clk: meson: gxbb: add the fractional part of the fixed_pll
  clk: meson: axg: add the fractional part of the fixed_pll

 drivers/clk/meson/axg.c     |  99 ++------------------------
 drivers/clk/meson/clk-pll.c |  40 ++++++++---
 drivers/clk/meson/clkc.h    |   2 +
 drivers/clk/meson/gxbb.c    | 166 +++++++++++++++++++-------------------------
 drivers/clk/meson/gxbb.h    |   3 +-
 5 files changed, 110 insertions(+), 200 deletions(-)

-- 
2.14.3
