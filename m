From: jbrunet@baylibre.com (Jerome Brunet)
Date: Mon,  9 Oct 2017 12:17:45 +0200
Subject: [PATCH 0/2] pinctrl: meson: prepare for new SoC
Message-ID: <20171009101747.16940-1-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The goal of this patchset is to prepare meson pinctrl driver to
add a new meson SoC support. This new SoC will share the same pinconf/gpio
registers but the pinmux part will be slightly different.

First patch allows to compile and ship only the necessary pinctrl drivers,
depending on the architecture and configuration needs. This should save
a bit of memory.

Second patch provide a way to deal with a different pinmux scheme, while
reusing most of the meson pinctrl driver.

Linus, this series depends on
* The offset clean-up series you've already merged [0]
* the fixup regarding pin_base [1]

[0]: https://lkml.kernel.org/r/20170920133927.17390-1-jbrunet at baylibre.com
[1]: https://lkml.kernel.org/r/20171006085407.27905-1-jbrunet at baylibre.com

Jerome Brunet (2):
  pinctrl: meson: separate soc drivers
  pinctrl: meson: rework pinmux ops

 drivers/pinctrl/Kconfig                    |  11 +--
 drivers/pinctrl/meson/Kconfig              |  43 +++++++++
 drivers/pinctrl/meson/Makefile             |   9 +-
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c |  28 +++++-
 drivers/pinctrl/meson/pinctrl-meson-gxl.c  |  28 +++++-
 drivers/pinctrl/meson/pinctrl-meson-pmx.c  | 107 +++++++++++++++++++++
 drivers/pinctrl/meson/pinctrl-meson-pmx.h  |  48 ++++++++++
 drivers/pinctrl/meson/pinctrl-meson.c      | 147 ++---------------------------
 drivers/pinctrl/meson/pinctrl-meson.h      |  42 +++------
 drivers/pinctrl/meson/pinctrl-meson8.c     |  28 +++++-
 drivers/pinctrl/meson/pinctrl-meson8b.c    |  28 +++++-
 11 files changed, 333 insertions(+), 186 deletions(-)
 create mode 100644 drivers/pinctrl/meson/Kconfig
 create mode 100644 drivers/pinctrl/meson/pinctrl-meson-pmx.c
 create mode 100644 drivers/pinctrl/meson/pinctrl-meson-pmx.h

-- 
2.13.6
