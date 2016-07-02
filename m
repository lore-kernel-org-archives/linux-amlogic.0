From: davem@davemloft.net (David Miller)
Date: Sat, 02 Jul 2016 14:36:44 -0400 (EDT)
Subject: [PATCH] net: stmmac: Fix null-function call in ISR on stmmac1000
In-Reply-To: <4B218985-EF8E-47C0-A682-A3E41BE90003@bluematt.me>
References: <4B218985-EF8E-47C0-A682-A3E41BE90003@bluematt.me>
Message-ID: <20160702.143644.1206479755314521348.davem@davemloft.net>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

From: Matt Corallo <linux@bluematt.me>
Date: Thu, 30 Jun 2016 19:46:16 +0000

> (resent due to overhelpful mail client corrupting patch)
> 
> At least on Meson GXBB, the CORE_IRQ_MTL_RX_OVERFLOW interrupt is thrown
> with the stmmac1000 driver, which does not support set_rx_tail_ptr. With
> this patch and the clock fixes, 1G ethernet works on ODROID-C2.
> 
> Signed-off-by: Matt Corallo <git@bluematt.me>

Applied.
