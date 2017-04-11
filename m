From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Tue, 11 Apr 2017 07:51:47 +0200
Subject: [PATCH 0/5] media: rc: meson-ir: series with smaller improvements
Message-ID: <f65a1465-14ba-8db2-7726-454dcfbee69d@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This series includes smaller improvements for the meson-ir driver.
Tested on a Odroid C2.

Heiner Kallweit (5):
  media: rc: meson-ir: remove irq from struct meson_ir
  media: rc: meson-ir: make use of the bitfield macros
  media: rc: meson-ir: switch to managed rc device allocation / registration
  media: rc: meson-ir: use readl_relaxed in the interrupt handler
  media: rc: meson-ir: change irq name to to of node name

 drivers/media/rc/meson-ir.c | 64 ++++++++++++++++++---------------------------
 1 file changed, 26 insertions(+), 38 deletions(-)

-- 
2.12.2
