From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Sat, 25 Mar 2017 13:57:00 +0100
Subject: [PATCH v5 00/10] i2c: meson: series with improvements
Message-ID: <645519b8-93e6-57b1-ae8f-7804c6beb9b1@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This patch series includes several improvements for the i2c-meson
driver.

Changes in v2:
- removed patches 8 and 12
- removed one small change in patch 6
- don't print error message in patch 7

Changes in v3:
- changed order of patches 3, 4, 5 what makes the patches more simple
- remove one change from patch 7 to still properly deal with timeouts

Changes in v4:
- update DT binding documentation as part of patch 4

Changes in v5:
- extend commit message for patch 3
- remove unused properties from binding documentation in patch 4
- replace WARN_ON with dev_err in patch 5

Heiner Kallweit (12):
  i2c: meson: use min instead of min_t where min_t isn't needed
  i2c: meson: remove member irq from struct meson_i2c
  i2c: meson: set clock divider in probe instead of setting it for each transfer
  i2c: meson: use i2c core for DT clock-frequency parsing
  i2c: meson: use full 12 bits for clock divider
  i2c: meson: remove variable count from meson_i2c_xfer
  i2c: meson: improve interrupt handler and detect spurious interrupts
  i2c: meson: don't create separate token chain just for the stop command
  i2c: meson: remove meson_i2c_write_tokens
  i2c: meson: improve and simplify interrupt handler

 .../devicetree/bindings/i2c/i2c-meson.txt          |   2 +
 drivers/i2c/busses/i2c-meson.c                     | 135 ++++++++-------------
 2 files changed, 55 insertions(+), 82 deletions(-)

-- 
2.12.0
