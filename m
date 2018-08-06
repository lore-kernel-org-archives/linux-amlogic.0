From: narmstrong@baylibre.com (Neil Armstrong)
Date: Mon,  6 Aug 2018 14:49:18 +0200
Subject: [PATCH v2 u-boot 0/2] Add the VPU Power Domain support
Message-ID: <1533559760-32136-1-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The Amlogic Meson SoCs embeds a specific Power Domain dedicated to the
Video Processing Unit.
The first patch implements support for this power domain in preparation of the
future support for the Video display support in U-Boot.

The second patch adds changes in the clock driver to handle the setup
of the VPU and VAPB clocks configured from DT using assigned-clocks entries.

Changes since v1:
- Fixed "format '%d' expects argument of type 'int', but argument 4 has type 'long unsigned int'" in clk_meson.c

Neil Armstrong (2):
  power: domain: Add the VPU Power Domain driver
  clk: clk_meson: Add mux and div support for reparent and rate setting

 drivers/clk/clk_meson.c                  | 533 ++++++++++++++++++++++++++++++-
 drivers/power/domain/Kconfig             |   7 +
 drivers/power/domain/Makefile            |   1 +
 drivers/power/domain/meson-gx-pwrc-vpu.c | 198 ++++++++++++
 4 files changed, 734 insertions(+), 5 deletions(-)
 create mode 100644 drivers/power/domain/meson-gx-pwrc-vpu.c

-- 
2.7.4
