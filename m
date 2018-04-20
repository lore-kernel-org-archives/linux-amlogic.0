From: jbrunet@baylibre.com (Jerome Brunet)
Date: Fri, 20 Apr 2018 11:56:01 +0200
Subject: [PATCH 0/2] clk: meson: mpll: add round closest support
Message-ID: <20180420095603.29964-1-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

ATM, the mpll driver can only round the requested rate down, even if
rounding up would have provided a better approximation of the requested
rate.

This patchset adds a flag to enable rounding to the closest rate possible,
even if it means rounding up.

The flag is then enabled on the axg platform to improve the rates provided
to the audio subsystem.

Jerome Brunet (2):
  clk: meson: mpll: add round closest support
  clk: meson: axg: let mpll clocks round closest

 drivers/clk/meson/axg.c      |  4 ++++
 drivers/clk/meson/clk-mpll.c | 25 ++++++++++++++++++++-----
 drivers/clk/meson/clkc.h     |  3 +++
 3 files changed, 27 insertions(+), 5 deletions(-)

-- 
2.14.3
