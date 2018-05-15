From: jbrunet@baylibre.com (Jerome Brunet)
Date: Tue, 15 May 2018 11:57:46 +0200
Subject: [PATCH 0/2] mmc: meson-gx: add device reset
Message-ID: <20180515095748.6794-1-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This patchset adds the optional reset of the meson-gx mmc controller and
the related documentation.

Changes since v1: [0]
 * Correct typo in the documentation
 * Separate code and documentation patches
 * Error on reset failure.

[0]: https://lkml.kernel.org/r/20180426103817.12675-1-jbrunet at baylibre.com

Jerome Brunet (2):
  dt-bindings: mmc: meson-gx: add reset
  mmc: meson-gx: add device reset

 Documentation/devicetree/bindings/mmc/amlogic,meson-gx.txt | 2 ++
 drivers/mmc/host/meson-gx-mmc.c                            | 9 +++++++++
 2 files changed, 11 insertions(+)

-- 
2.14.3
