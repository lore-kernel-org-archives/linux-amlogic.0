From: jbrunet@baylibre.com (Jerome Brunet)
Date: Thu, 18 Jan 2018 13:08:29 +0100
Subject: [PATCH 0/2] clk: meson: probe clean-ups
Message-ID: <20180118120831.8349-1-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This changeset feature a couple of clean-ups in the probe
function of meson's clock controllers. It is the beginning
of a refactoring of meson's clock controllers

Jerome Brunet (2):
  clk: meson: use dev pointer where possible
  clk: meson: use devm_of_clk_add_hw_provider

 drivers/clk/meson/axg.c     | 12 ++++++------
 drivers/clk/meson/gxbb.c    |  7 ++++---
 drivers/clk/meson/meson8b.c |  4 ++--
 3 files changed, 12 insertions(+), 11 deletions(-)

-- 
2.14.3
