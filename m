From: narmstrong@baylibre.com (Neil Armstrong)
Date: Fri, 23 Nov 2018 16:23:33 +0100
Subject: [GIT PULL] clk: meson: updates for v4.21
Message-ID: <8b905b7b-d72a-010f-bb2c-3cadeca603ed@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Dear clock maintainers,

Below is a request to pull updates for Amlogic clocks.

It covers essentially Meson GX Video clocks, Meson8b CPU clocks
and 2 bindings changes.

Thanks,
Neil

The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:

  Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/meson-clk-4.21-1

for you to fetch changes up to a7d19b05ce817d60ae672c4c112e77892978dc3c:

  clk: meson: meson8b: add the CPU clock post divider clocks (2018-11-23 15:11:58 +0100)

----------------------------------------------------------------
Update for meson clocks targeted at v4.21
- Add GX video clocks
- Switch to HHI syscon for meson8b
- Fix meson8b cpu clock
- Add support for meson8b CPU scaling
- Add Meson8b CPU post-dividers clocks

----------------------------------------------------------------
Martin Blumenstingl (14):
      dt-bindings: clock: meson8b: export the CPU post dividers
      dt-bindings: clock: meson8b: use the registers from the HHI syscon
      clk: meson: meson8b: use the HHI syscon if available
      clk: meson: meson8b: fix incorrect divider mapping in cpu_scale_table
      clk: meson: meson8b: fix the width of the cpu_scale_div clock
      clk: meson: clk-pll: check if the clock is already enabled
      clk: meson: meson8b: do not use cpu_div3 for cpu_scale_out_sel
      clk: meson: meson8b: mark the CPU clock as CLK_IS_CRITICAL
      clk: meson: meson8b: add support for more M/N values in sys_pll
      clk: meson: meson8b: run from the XTAL when changing the CPU frequency
      clk: meson: meson8b: allow changing the CPU clock tree
      clk: meson: clk-regmap: add read-only gate ops
      clk: meson: meson8b: rename cpu_div2/cpu_div3 to cpu_in_div2/cpu_in_div3
      clk: meson: meson8b: add the CPU clock post divider clocks

Neil Armstrong (4):
      clk: meson: Add vid_pll divider driver
      clk: meson-gxbb: Fix HDMI PLL for GXL SoCs
      dt-bindings: clk: meson-gxbb: Add Video clock bindings
      clk: meson-gxbb: Add video clocks

 .../bindings/clock/amlogic,meson8b-clkc.txt        |  13 +-
 drivers/clk/meson/Makefile                         |   2 +-
 drivers/clk/meson/clk-pll.c                        |  19 +
 drivers/clk/meson/clk-regmap.c                     |   5 +
 drivers/clk/meson/clk-regmap.h                     |   1 +
 drivers/clk/meson/clkc.h                           |   6 +
 drivers/clk/meson/gxbb.c                           | 773 ++++++++++++++++++++-
 drivers/clk/meson/gxbb.h                           |  26 +-
 drivers/clk/meson/meson8b.c                        | 393 ++++++++++-
 drivers/clk/meson/meson8b.h                        |  17 +-
 drivers/clk/meson/vid-pll-div.c                    |  91 +++
 include/dt-bindings/clock/gxbb-clkc.h              |  18 +
 include/dt-bindings/clock/meson8b-clkc.h           |   4 +
 13 files changed, 1319 insertions(+), 49 deletions(-)
 create mode 100644 drivers/clk/meson/vid-pll-div.c
