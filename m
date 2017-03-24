From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Fri, 24 Mar 2017 23:01:48 +0100
Subject: [PATCH 0/4] mmc: meson-gx: smaller functional extensions
Message-ID: <f6960395-370e-16b0-1a2a-2a1fce720d45@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This series includes the switch to bitfield macros and a few smaller
functional extensions.

Heiner Kallweit (4):
  mmc: meson-gx: use bitfield macros
  mmc: meson-gx: use per port interrupt names
  mmc: meson-gx: switch to dynamic timeout values
  mmc: meson-gx: add CMD23 mode

 drivers/mmc/host/meson-gx-mmc.c | 119 +++++++++++++++++++++++-----------------
 1 file changed, 68 insertions(+), 51 deletions(-)

-- 
2.12.0
