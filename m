From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Wed, 12 Apr 2017 21:26:59 +0200
Subject: [PATCH v2 0/5] media: rc: meson-ir: series with smaller improvements
Message-ID: <d5c18dbb-e86a-6b1c-1410-d6cc92dce711@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This series includes smaller improvements for the meson-ir driver.
Tested on a Odroid C2.

v2:
- minor change to patch 2
- added Reviewed-by to patch 2, 3, 4

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
