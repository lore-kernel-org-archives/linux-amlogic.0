From: jbrunet@baylibre.com (Jerome Brunet)
Date: Tue, 30 Oct 2018 11:22:27 +0100
Subject: [PATCH 0/4] nvmem: meson: efuse updates
Message-ID: <20181030102231.4851-1-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The first change of this patchset just adds add error message in case
of failure. If there is problem with the secure monitor, the
SM_EFUSE_USER_MAX call will be first one to fail so it is better if it
give us a clue to help debugging, instead af silently failing.

Next this series adds the peripheral clock missing in this driver.
Like many other device in amlogic's SoC, the efuse requires a
peripheral clock to operate. ATM, the clock controller has
CLK_IGNORE_UNUSED on this clock and we have been lucky enough that the
bootloader left the clock enabled

At some point, we would like to remove those CLK_IGNORE_UNUSED, so if a
driver needs a clock, it needs to properly claim it.

Srinivas, Kevin,
The dts change needs to land before the actual driver change, to avoid
breaking the efuse on our users. If there an agreement on this series,
Kevin could you provide a tag to Srinivas ?

Cheers
Jerome

Jerome Brunet (4):
  nvmem: meson-efuse: add error message on user_max failure.
  nvmem: meson-efuse: bindings: add peripheral clock
  arm64: dts: meson-gx: add efuse pclk
  nvmem: meson-efuse: add peripheral clock

 .../bindings/nvmem/amlogic-efuse.txt          |  3 ++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi   |  4 +++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi    |  4 +++
 drivers/nvmem/meson-efuse.c                   | 29 ++++++++++++++++++-
 4 files changed, 39 insertions(+), 1 deletion(-)

-- 
2.17.2
