From: webczat@webczatnet.pl (=?UTF-8?q?Micha=C5=82=20Zegan?=)
Date: Thu, 16 Feb 2017 15:52:20 +0100
Subject: [PATCH 0/2] mmc: meson-gx: fix module unloading
Message-ID: <20170216145222.1577-1-webczat@webczatnet.pl>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This patch contains fixes for the meson-gx-mmc driver, that allow the module to be unloaded correctly.
Before trying to unload the module caused kernel warnings.

Micha? Zegan (2):
  mmc: meson-gx: prevent cfg_div_clk from being disabled on init
  mmc: meson-gx: remove mmc host on device removal

 drivers/mmc/host/meson-gx-mmc.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

-- 
2.11.0
