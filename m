From: jbrunet@baylibre.com (Jerome Brunet)
Date: Wed, 25 Apr 2018 18:32:57 +0200
Subject: [PATCH 0/7] clk: meson: axg: add audio clock controller support
Message-ID: <20180425163304.10852-1-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The purpose of this patchset is to add support for the clock controller
dedicated to the audio subsystem found on A113 based SoCs

The series depends on the CLK_MUX_ROUND_CLOSEST fixes [0] and the duty
cycle support [1] making their way into CCF.

First patch is a clean-up of the meson clk Kconfig.
Then, there is 3 clock provider drivers for clocks found in the audio
The last 3 are for the clock controller itself.

[0]: https://lkml.kernel.org/r/152389589448.51482.15489333464741262913 at swboyd.mtv.corp.google.com
[1]: https://lkml.kernel.org/r/20180420211141.28929-1-jbrunet at baylibre.com

Jerome Brunet (7):
  clk: meson: clean-up meson clock configuration
  clk: meson: add clk-phase clock driver
  clk: meson: add triple phase clock driver
  clk: meson: add axg audio sclk divider driver
  clk: meson: axg: export audio clock controller id bindings
  clk: meson: axg: document bindings for the audio clock controller
  clk: meson: axg: add the audio clock controller driver

 .../bindings/clock/amlogic,axg-audio-clkc.txt      |  56 ++
 drivers/clk/meson/Kconfig                          |  25 +-
 drivers/clk/meson/Makefile                         |   3 +
 drivers/clk/meson/axg-audio.c                      | 845 +++++++++++++++++++++
 drivers/clk/meson/axg-audio.h                      | 127 ++++
 drivers/clk/meson/clk-phase.c                      |  63 ++
 drivers/clk/meson/clk-triphase.c                   |  68 ++
 drivers/clk/meson/clkc-audio.h                     |  28 +
 drivers/clk/meson/clkc.h                           |   8 +
 drivers/clk/meson/sclk-div.c                       | 243 ++++++
 include/dt-bindings/clock/axg-audio-clkc.h         |  94 +++
 11 files changed, 1553 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt
 create mode 100644 drivers/clk/meson/axg-audio.c
 create mode 100644 drivers/clk/meson/axg-audio.h
 create mode 100644 drivers/clk/meson/clk-phase.c
 create mode 100644 drivers/clk/meson/clk-triphase.c
 create mode 100644 drivers/clk/meson/clkc-audio.h
 create mode 100644 drivers/clk/meson/sclk-div.c
 create mode 100644 include/dt-bindings/clock/axg-audio-clkc.h

-- 
2.14.3
