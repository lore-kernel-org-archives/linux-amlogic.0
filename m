From: jbrunet@baylibre.com (Jerome Brunet)
Date: Tue, 15 May 2018 18:36:50 +0200
Subject: [PATCH v2 0/2] clk: meson: mpll: add round closest support
Message-ID: <20180515163652.19980-1-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

ATM, the mpll driver can only round the requested rate down, even if
rounding up would have provided a better approximation of the requested
rate.

This patchset adds a flag to enable rounding to the closest rate possible,
even if it means rounding up.

The flag is then enabled on the axg platform to improve the rates provided
to the audio subsystem.

Changes since v1: [0]
 * Fix an error in calculation while rounding the rate down
   (Thanks Martin for reporting it)

[0]: https://lkml.kernel.org/r/20180420095603.29964-1-jbrunet at baylibre.com

Jerome Brunet (2):
  clk: meson: mpll: add round closest support
  clk: meson: axg: let mpll clocks round closest

 drivers/clk/meson/axg.c      |  4 ++++
 drivers/clk/meson/clk-mpll.c | 24 +++++++++++++++++++-----
 drivers/clk/meson/clkc.h     |  3 +++
 3 files changed, 26 insertions(+), 5 deletions(-)

-- 
2.14.3
