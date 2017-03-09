From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Thu, 9 Mar 2017 07:33:17 +0100
Subject: [PATCH v2 00/10] i2c: meson: series with improvements
Message-ID: <f39c9314-4314-3d98-aef2-3bc3c815e63b@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This patch series includes several improvements for the i2c-meson
driver.

Changes in v2:
- removed patches 8 and 12
- removed one small change in patch 6
- don't print error message in patch 7

Heiner Kallweit (12):
  i2c: meson: use min instead of min_t where min_t isn't needed
  i2c: meson: remove member irq from struct meson_i2c
  i2c: meson: use i2c core for DT clock-frequency parsing
  i2c: meson: use full 12 bits for clock divider
  i2c: meson: set clock divider in probe instead of setting it for each transfer
  i2c: meson: remove variable count from meson_i2c_xfer
  i2c: meson: improve interrupt handler and detect spurious interrupts
  i2c: meson: don't create separate token chain just for the stop command
  i2c: meson: remove meson_i2c_write_tokens
  i2c: meson: improve and simplify interrupt handler

 drivers/i2c/busses/i2c-meson.c | 136 ++++++++++++++++-------------------------
 1 file changed, 51 insertions(+), 85 deletions(-)

-- 
2.12.0
