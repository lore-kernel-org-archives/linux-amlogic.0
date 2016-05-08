From: b.galvani@gmail.com (Beniamino Galvani)
Date: Sun,  8 May 2016 08:30:15 +0200
Subject: [PATCH v7 2/4] net: designware: fix descriptor layout and warnings on
 64-bit archs
In-Reply-To: <1462689017-3160-1-git-send-email-b.galvani@gmail.com>
References: <1462689017-3160-1-git-send-email-b.galvani@gmail.com>
Message-ID: <1462689017-3160-3-git-send-email-b.galvani@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

All members of the DMA descriptor must be 32-bit, even on 64-bit
architectures: change the type to u32 to ensure this. Also, fix
other warnings.

Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
Acked-by: Joe Hershberger <joe.hershberger@ni.com>
---
 drivers/net/designware.c | 59 ++++++++++++++++++++++++++----------------------
 drivers/net/designware.h |  4 ++--
 2 files changed, 34 insertions(+), 29 deletions(-)

diff --git a/drivers/net/designware.c b/drivers/net/designware.c
index ca58f34..2eda461 100644
--- a/drivers/net/designware.c
+++ b/drivers/net/designware.c
@@ -98,8 +98,8 @@ static void tx_descs_init(struct dw_eth_dev *priv)
 
 	for (idx = 0; idx < CONFIG_TX_DESCR_NUM; idx++) {
 		desc_p = &desc_table_p[idx];
-		desc_p->dmamac_addr = &txbuffs[idx * CONFIG_ETH_BUFSIZE];
-		desc_p->dmamac_next = &desc_table_p[idx + 1];
+		desc_p->dmamac_addr = (ulong)&txbuffs[idx * CONFIG_ETH_BUFSIZE];
+		desc_p->dmamac_next = (ulong)&desc_table_p[idx + 1];
 
 #if defined(CONFIG_DW_ALTDESCRIPTOR)
 		desc_p->txrx_status &= ~(DESC_TXSTS_TXINT | DESC_TXSTS_TXLAST |
@@ -117,11 +117,11 @@ static void tx_descs_init(struct dw_eth_dev *priv)
 	}
 
 	/* Correcting the last pointer of the chain */
-	desc_p->dmamac_next = &desc_table_p[0];
+	desc_p->dmamac_next = (ulong)&desc_table_p[0];
 
 	/* Flush all Tx buffer descriptors at once */
-	flush_dcache_range((unsigned int)priv->tx_mac_descrtable,
-			   (unsigned int)priv->tx_mac_descrtable +
+	flush_dcache_range((ulong)priv->tx_mac_descrtable,
+			   (ulong)priv->tx_mac_descrtable +
 			   sizeof(priv->tx_mac_descrtable));
 
 	writel((ulong)&desc_table_p[0], &dma_p->txdesclistaddr);
@@ -142,13 +142,12 @@ static void rx_descs_init(struct dw_eth_dev *priv)
 	 * Otherwise there's a chance to get some of them flushed in RAM when
 	 * GMAC is already pushing data to RAM via DMA. This way incoming from
 	 * GMAC data will be corrupted. */
-	flush_dcache_range((unsigned int)rxbuffs, (unsigned int)rxbuffs +
-			   RX_TOTAL_BUFSIZE);
+	flush_dcache_range((ulong)rxbuffs, (ulong)rxbuffs + RX_TOTAL_BUFSIZE);
 
 	for (idx = 0; idx < CONFIG_RX_DESCR_NUM; idx++) {
 		desc_p = &desc_table_p[idx];
-		desc_p->dmamac_addr = &rxbuffs[idx * CONFIG_ETH_BUFSIZE];
-		desc_p->dmamac_next = &desc_table_p[idx + 1];
+		desc_p->dmamac_addr = (ulong)&rxbuffs[idx * CONFIG_ETH_BUFSIZE];
+		desc_p->dmamac_next = (ulong)&desc_table_p[idx + 1];
 
 		desc_p->dmamac_cntl =
 			(MAC_MAX_FRAME_SZ & DESC_RXCTRL_SIZE1MASK) |
@@ -158,11 +157,11 @@ static void rx_descs_init(struct dw_eth_dev *priv)
 	}
 
 	/* Correcting the last pointer of the chain */
-	desc_p->dmamac_next = &desc_table_p[0];
+	desc_p->dmamac_next = (ulong)&desc_table_p[0];
 
 	/* Flush all Rx buffer descriptors at once */
-	flush_dcache_range((unsigned int)priv->rx_mac_descrtable,
-			   (unsigned int)priv->rx_mac_descrtable +
+	flush_dcache_range((ulong)priv->rx_mac_descrtable,
+			   (ulong)priv->rx_mac_descrtable +
 			   sizeof(priv->rx_mac_descrtable));
 
 	writel((ulong)&desc_table_p[0], &dma_p->rxdesclistaddr);
@@ -290,12 +289,11 @@ static int _dw_eth_send(struct dw_eth_dev *priv, void *packet, int length)
 	struct eth_dma_regs *dma_p = priv->dma_regs_p;
 	u32 desc_num = priv->tx_currdescnum;
 	struct dmamacdescr *desc_p = &priv->tx_mac_descrtable[desc_num];
-	uint32_t desc_start = (uint32_t)desc_p;
-	uint32_t desc_end = desc_start +
+	ulong desc_start = (ulong)desc_p;
+	ulong desc_end = desc_start +
 		roundup(sizeof(*desc_p), ARCH_DMA_MINALIGN);
-	uint32_t data_start = (uint32_t)desc_p->dmamac_addr;
-	uint32_t data_end = data_start +
-		roundup(length, ARCH_DMA_MINALIGN);
+	ulong data_start = desc_p->dmamac_addr;
+	ulong data_end = data_start + roundup(length, ARCH_DMA_MINALIGN);
 	/*
 	 * Strictly we only need to invalidate the "txrx_status" field
 	 * for the following check, but on some platforms we cannot
@@ -312,7 +310,7 @@ static int _dw_eth_send(struct dw_eth_dev *priv, void *packet, int length)
 		return -EPERM;
 	}
 
-	memcpy(desc_p->dmamac_addr, packet, length);
+	memcpy((void *)data_start, packet, length);
 
 	/* Flush data to be sent */
 	flush_dcache_range(data_start, data_end);
@@ -352,11 +350,11 @@ static int _dw_eth_recv(struct dw_eth_dev *priv, uchar **packetp)
 	u32 status, desc_num = priv->rx_currdescnum;
 	struct dmamacdescr *desc_p = &priv->rx_mac_descrtable[desc_num];
 	int length = -EAGAIN;
-	uint32_t desc_start = (uint32_t)desc_p;
-	uint32_t desc_end = desc_start +
+	ulong desc_start = (ulong)desc_p;
+	ulong desc_end = desc_start +
 		roundup(sizeof(*desc_p), ARCH_DMA_MINALIGN);
-	uint32_t data_start = (uint32_t)desc_p->dmamac_addr;
-	uint32_t data_end;
+	ulong data_start = desc_p->dmamac_addr;
+	ulong data_end;
 
 	/* Invalidate entire buffer descriptor */
 	invalidate_dcache_range(desc_start, desc_end);
@@ -372,7 +370,7 @@ static int _dw_eth_recv(struct dw_eth_dev *priv, uchar **packetp)
 		/* Invalidate received data */
 		data_end = data_start + roundup(length, ARCH_DMA_MINALIGN);
 		invalidate_dcache_range(data_start, data_end);
-		*packetp = desc_p->dmamac_addr;
+		*packetp = (uchar *)(ulong)desc_p->dmamac_addr;
 	}
 
 	return length;
@@ -382,8 +380,8 @@ static int _dw_free_pkt(struct dw_eth_dev *priv)
 {
 	u32 desc_num = priv->rx_currdescnum;
 	struct dmamacdescr *desc_p = &priv->rx_mac_descrtable[desc_num];
-	uint32_t desc_start = (uint32_t)desc_p;
-	uint32_t desc_end = desc_start +
+	ulong desc_start = (ulong)desc_p;
+	ulong desc_end = desc_start +
 		roundup(sizeof(*desc_p), ARCH_DMA_MINALIGN);
 
 	/*
@@ -488,6 +486,11 @@ int designware_initialize(ulong base_addr, u32 interface)
 		return -ENOMEM;
 	}
 
+	if ((unsigned long long)priv + sizeof(*priv) > (1ULL << 32)) {
+		printf("designware: buffers are outside DMA memory\n");
+		return -EINVAL;
+	}
+
 	memset(dev, 0, sizeof(struct eth_device));
 	memset(priv, 0, sizeof(struct dw_eth_dev));
 
@@ -583,6 +586,7 @@ static int designware_eth_probe(struct udevice *dev)
 	struct eth_pdata *pdata = dev_get_platdata(dev);
 	struct dw_eth_dev *priv = dev_get_priv(dev);
 	u32 iobase = pdata->iobase;
+	ulong ioaddr;
 	int ret;
 
 #ifdef CONFIG_DM_PCI
@@ -601,8 +605,9 @@ static int designware_eth_probe(struct udevice *dev)
 #endif
 
 	debug("%s, iobase=%x, priv=%p\n", __func__, iobase, priv);
-	priv->mac_regs_p = (struct eth_mac_regs *)iobase;
-	priv->dma_regs_p = (struct eth_dma_regs *)(iobase + DW_DMA_BASE_OFFSET);
+	ioaddr = iobase;
+	priv->mac_regs_p = (struct eth_mac_regs *)ioaddr;
+	priv->dma_regs_p = (struct eth_dma_regs *)(ioaddr + DW_DMA_BASE_OFFSET);
 	priv->interface = pdata->phy_interface;
 	priv->max_speed = pdata->max_speed;
 
diff --git a/drivers/net/designware.h b/drivers/net/designware.h
index ed6344c..d48df7b 100644
--- a/drivers/net/designware.h
+++ b/drivers/net/designware.h
@@ -110,8 +110,8 @@ struct eth_dma_regs {
 struct dmamacdescr {
 	u32 txrx_status;
 	u32 dmamac_cntl;
-	void *dmamac_addr;
-	struct dmamacdescr *dmamac_next;
+	u32 dmamac_addr;
+	u32 dmamac_next;
 } __aligned(ARCH_DMA_MINALIGN);
 
 /*
-- 
2.7.3
