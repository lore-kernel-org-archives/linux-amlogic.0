From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Wed, 22 Mar 2017 22:16:40 +0100
Subject: [PATCH 0/6] mmc: meson-gx: further smaller refactorings
Message-ID: <8bf58a83-d8d7-615c-c89b-87a62a3c9c40@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Before we come to the functional changes here one more series with
smaller refactorings.

Heiner Kallweit (6):
  mmc: meson-gx: remove unneeded configuration bit resets
  mmc: meson-gx: replace cmd->data in meson_mmc_start_cmd
  mmc: meson-gx: improve variable usage in meson_mmc_start_cmd
  mmc: meson-gx: improve response reading
  mmc: meson-gx: improve setting data->bytes_xfered
  mmc: meson-gx: simplify setting timeout configuration parameters

 drivers/mmc/host/meson-gx-mmc.c | 104 ++++++++++++++++++----------------------
 1 file changed, 47 insertions(+), 57 deletions(-)

-- 
2.12.0
