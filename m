From: jbrunet@baylibre.com (Jerome Brunet)
Date: Tue, 17 Jul 2018 11:56:14 +0200
Subject: [PATCH 0/3] clk: meson: clk-pll driver update
Message-ID: <20180717095617.12240-1-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This patchset is yet another round of update to the amlogic pll driver.

 1) Enable bit is added so we don't rely on the bootloader or the init
    value to enable to pll device.
 2) OD post dividers are removed from the pll driver. This simplify the
    driver and let us provide the clocks which exist between those
    dividera. Some device are actually using these clocks.
 3) The rates hard coded in parameter tables are remove. Instead, we
    only rely on the parent rate and the parameters to calculate the
    output rate, which is a lot better.

This series has been tested on the gxl libretech cc and axg s400.
I did not test it on meson8b yet.

Jerome Brunet (3):
  clk: meson: clk-pll: add enable bit
  clk: meson: clk-pll: remove od parameters
  clk: meson: clk-pll: drop hard-coded rates from pll tables

 drivers/clk/meson/axg.c     | 320 ++++++++++++++++------------
 drivers/clk/meson/axg.h     |   8 +-
 drivers/clk/meson/clk-pll.c | 156 +++++++++-----
 drivers/clk/meson/clkc.h    |  16 +-
 drivers/clk/meson/gxbb.c    | 504 ++++++++++++++++++++++----------------------
 drivers/clk/meson/gxbb.h    |  10 +-
 drivers/clk/meson/meson8b.c | 167 ++++++++-------
 drivers/clk/meson/meson8b.h |   5 +-
 8 files changed, 648 insertions(+), 538 deletions(-)

-- 
2.14.4
