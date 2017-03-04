From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Sat, 4 Mar 2017 13:17:55 +0100
Subject: [PATCH v5 0/10] mmc: meson-gx: series with smaller improvements
Message-ID: <a76c3483-2c86-85c1-446e-f2522bd28aa8@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

New series is limited to smaller refactorings w/o functional changes.

v5:
- fix a hang caused by patch "improve initial configuration"

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

 drivers/mmc/host/meson-gx-mmc.c | 120 ++++++++++++++++------------------------
 1 file changed, 47 insertions(+), 73 deletions(-)

-- 
2.12.0
