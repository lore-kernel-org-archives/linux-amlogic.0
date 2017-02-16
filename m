From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Thu, 16 Feb 2017 20:38:29 +0100
Subject: [PATCH v2 0/9] mmc: meson-gx: series with smaller improvements
Message-ID: <cf116046-75ff-48ad-6b61-5a67228ce728@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

v2 of the series is limited to smaller refactorings w/o functional changes.

Heiner Kallweit (9):
  mmc: meson-gx: simplify bounce buffer setting in meson_mmc_start_cmd
  mmc: meson-gx: make two functions return void
  mmc: meson-gx: remove unused members irq, ocr_mask from struct meson_host
  mmc: meson-gx: remove unneeded variable in meson_mmc_clk_init
  mmc: meson-gx: remove member parent_mux from struct meson_host
  mmc: meson-gx: remove unneeded meson_mmc_clk_set in meson_mmc_clk_init
  mmc: meson-gx: remove unneeded devm_kstrdup in meson_mmc_clk_init
  mmc: meson-gx: improve initial configuration
  mmc: meson-gx: remove member mrq from struct meson_host

 drivers/mmc/host/meson-gx-mmc.c | 119 +++++++++++++++-------------------------
 1 file changed, 43 insertions(+), 76 deletions(-)

-- 
2.11.1
