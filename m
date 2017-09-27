From: ingrassia@epigenesys.com (Emiliano Ingrassia)
Date: Wed, 27 Sep 2017 12:46:35 +0200
Subject: [PATCH 4/4] net: stmmac: fixing DMA reset sleep and timeout values
In-Reply-To: <cover.1506507688.git.ingrassia@epigenesys.com>
References: <cover.1506507688.git.ingrassia@epigenesys.com>
Message-ID: <b9056c8aa948a95cb21396b6e99a0ac0c40a7787.1506507688.git.ingrassia@epigenesys.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This patch fixes the sleep and timeout values used during
DMA reset, which were inverted in a previous patch.

Fixes: 8a70aeca80c2 ("net: stmmac: Use readl_poll_timeout")

Signed-off-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
index 67af0bdd7f10..7516ca210855 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
@@ -34,7 +34,7 @@ int dwmac_dma_reset(void __iomem *ioaddr)
 
 	err = readl_poll_timeout(ioaddr + DMA_BUS_MODE, value,
 				 !(value & DMA_BUS_MODE_SFT_RESET),
-				 100000, 10000);
+				 10000, 100000);
 	if (err)
 		return -EBUSY;
 
-- 
2.14.1
