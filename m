From: khilman@baylibre.com (Kevin Hilman)
Date: Thu, 29 Nov 2018 12:47:33 -0800
Subject: [GIT PULL] Amlogic SoC drivers for v4.21
Message-ID: <7hwoov8vbu.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:

  Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-drivers

for you to fetch changes up to 2b45ebef39a2caad409f70b22b4a2a41df9815b6:

  soc: amlogic: Add Meson Clock Measure driver (2018-11-28 16:55:35 -0800)

----------------------------------------------------------------
Amlogic SoC drivers for v4.21
- new clock measurement driver and bindings
- COMPILE_TEST fix

----------------------------------------------------------------
Maxime Jourdan (1):
      drivers: soc: Allow building the amlogic drivers without ARCH_MESON

Neil Armstrong (2):
      dt-bindings: amlogic: Add Internal Clock Measurer bindings
      soc: amlogic: Add Meson Clock Measure driver

 Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt |  18 ++++++
 drivers/soc/Makefile                                          |   2 +-
 drivers/soc/amlogic/Kconfig                                   |   8 +++
 drivers/soc/amlogic/Makefile                                  |   1 +
 drivers/soc/amlogic/meson-clk-measure.c                       | 350 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 378 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt
 create mode 100644 drivers/soc/amlogic/meson-clk-measure.c
