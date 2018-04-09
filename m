From: jbrunet@baylibre.com (Jerome Brunet)
Date: Mon,  9 Apr 2018 15:59:19 +0200
Subject: [PATCH 0/2] clk: honor CLK_MUX_ROUND_CLOSEST in mux
Message-ID: <20180409135921.5617-1-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

CLK_MUX_ROUND_CLOSEST is part of clk_mux and meson's clk_regmap
documentation, so it should be honored by the determine_rate() callback.

It is note the case ATM. The series fixes this problem.

Jerome Brunet (2):
  clk: honor CLK_MUX_ROUND_CLOSEST in generic clk mux
  clk: meson: honor CLK_MUX_ROUND_CLOSEST in clk_regmap

 drivers/clk/clk-mux.c          | 10 +++++++++-
 drivers/clk/clk.c              |  7 ++++---
 drivers/clk/meson/clk-regmap.c | 11 ++++++++++-
 include/linux/clk-provider.h   |  3 +++
 4 files changed, 26 insertions(+), 5 deletions(-)

-- 
2.14.3
