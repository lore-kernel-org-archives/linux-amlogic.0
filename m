From: ingrassia@epigenesys.com (Emiliano Ingrassia)
Date: Wed, 27 Sep 2017 12:39:32 +0200
Subject: [PATCH 0/4] meson8b-odroidc1: ethernet support
Message-ID: <cover.1506507688.git.ingrassia@epigenesys.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This patchset enables ethernet support on Odroid-C1/C1+ boards,
improving and extending the ethernet description in the relative
device tree.

In particular:
- the mpll2 clock is enabled to avoid timeout during ethernet DMA reset;
- the Meson8b ethernet controller description is fixed and extended;
- the Odroid-C1/C1+ ethernet PHY description is added;
- the dwmac sleep and timeout values used during DMA reset are fixed.

This patchset has been tested on Odroid-C1+ board.

Emiliano Ingrassia (4):
  clk: meson8b: keep mpll2 clock enabled
  ARM: dts: meson8b: extending ethernet controller description
  ARM: dts: meson8b-odroidc1: enabling ethernet support
  net: stmmac: fixing DMA reset sleep and timeout values

 arch/arm/boot/dts/meson8b-odroidc1.dts          | 30 +++++++++++++++++
 arch/arm/boot/dts/meson8b.dtsi                  | 43 +++++++++++++++++++++++--
 drivers/clk/meson/meson8b.c                     |  1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c |  2 +-
 4 files changed, 73 insertions(+), 3 deletions(-)

-- 
2.14.1
