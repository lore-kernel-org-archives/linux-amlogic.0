From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Wed, 15 Mar 2017 20:16:16 +0100
Subject: [PATCH 0/5] mmc: meson-gx: add cmd23 and descriptor chain mode
Message-ID: <f1f8dae2-e976-4d42-99dc-34d08cb3d628@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Apart from three minor improvements this patch series adds support
for CMD23 mode and switches the driver to descriptor chain mode.

On my system with a 128GB eMMC card this increased the read
performance from 10 - 15 MB/s to 140 MB/s.

Successfully tested on a Odroid C2 with custom uboot based on recent
mainline uboot. Behavior might be different with vendor uboot.

Heiner Kallweit (5):
  mmc: meson-gx: switch irq name to DT node name
  mmc: meson-gx: improve response reading
  mmc: meson-gx: use block mode also for just one block
  mmc: meson-gx: add support for CMD23 mode
  mmc: meson-gx: switch to descriptor chain mode

 drivers/mmc/host/meson-gx-mmc.c | 258 ++++++++++++++++++++++------------------
 1 file changed, 142 insertions(+), 116 deletions(-)

-- 
2.12.0
