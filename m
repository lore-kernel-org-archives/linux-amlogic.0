From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu, 26 Jul 2018 15:54:02 +0200
Subject: [PATCH u-boot 0/2] Add the VPU Power Domain support
Message-ID: <1532613244-4585-1-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The Amlogic Meson SoCs embeds a specific Power Domain dedicated to the
Video Processing Unit.
The first patch implements support for this power domain in preparation of the
future support for the Video display support in U-Boot.

The second patch adds changes in the clock driver to handle the setup
of the VPU and VAPB clocks configured from DT using assigned-clocks entries.

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
