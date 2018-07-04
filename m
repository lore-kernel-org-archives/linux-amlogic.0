From: jbrunet@baylibre.com (Jerome Brunet)
Date: Wed,  4 Jul 2018 18:54:55 +0200
Subject: [PATCH 0/3] clk: meson: add gen_clk
Message-ID: <20180704165458.24149-1-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This patch adds GEN_CLK, which a very useful clock for debugging.
It allows to output most of the SoC plls through one of the SoC pad.

In the future, we could even use clk_measure with it to access the
vast majority of the SoC clocks.

Jerome Brunet (3):
  clk: meson: gxbb: remove HHI_GEN_CLK_CTNL duplicate definition
  clk: meson: expose GEN_CLK clkid
  clk: meson: add gen_clk

 drivers/clk/meson/axg.c               | 64 ++++++++++++++++++++++++++++++++-
 drivers/clk/meson/axg.h               |  4 ++-
 drivers/clk/meson/gxbb.c              | 66 +++++++++++++++++++++++++++++++++++
 drivers/clk/meson/gxbb.h              |  5 +--
 include/dt-bindings/clock/axg-clkc.h  |  1 +
 include/dt-bindings/clock/gxbb-clkc.h |  1 +
 6 files changed, 137 insertions(+), 4 deletions(-)

-- 
2.14.4
