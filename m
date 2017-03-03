From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Fri, 3 Mar 2017 20:49:33 +0100
Subject: [PATCH v4 0/10] mmc: meson-gx: series with smaller improvements
Message-ID: <62912f3d-2307-cfff-3c69-c8b8ffaeb474@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

New series is limited to smaller refactorings w/o functional changes.

Heiner Kallweit (10):
  mmc: meson-gx: simplify bounce buffer setting in meson_mmc_start_cmd
  mmc: meson-gx: make two functions return void
  mmc: meson-gx: remove unused members irq, ocr_mask from struct meson_host
  mmc: meson-gx: remove unneeded variable in meson_mmc_clk_init
  mmc: meson-gx: remove member parent_mux from struct meson_host
  mmc: meson-gx: remove unneeded meson_mmc_clk_set in meson_mmc_clk_init
  mmc: meson-gx: remove unneeded devm_kstrdup in meson_mmc_clk_init
  mmc: meson-gx: improve initial configuration
  mmc: meson-gx: remove member mrq from struct meson_host
  mmc: meson-gx: replace magic timeout numbers with constants

 drivers/mmc/host/meson-gx-mmc.c | 126 ++++++++++++++++------------------------
 1 file changed, 50 insertions(+), 76 deletions(-)

-- 
2.11.1
