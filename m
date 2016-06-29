From: davem@davemloft.net (David Miller)
Date: Wed, 29 Jun 2016 03:58:52 -0400 (EDT)
Subject: [PATCH] net: stmmac: Fix null-function call in ISR on stmmac1000
In-Reply-To: <E5152E61-5896-46FD-BF4A-16CDFB3796F6@bluematt.me>
References: <E5152E61-5896-46FD-BF4A-16CDFB3796F6@bluematt.me>
Message-ID: <20160629.035852.1504883332705515951.davem@davemloft.net>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

From: Matt Corallo <linux@bluematt.me>
Date: Sat, 25 Jun 2016 19:35:03 +0000

> At least on Meson GXBB, the CORE_IRQ_MTL_RX_OVERFLOW interrupt is thrown
> with the stmmac1000 driver, which does not support set_rx_tail_ptr. With
> this patch and the clock fixes, 1G ethernet works on ODROID-C2.
> 
> Signed-off-by: Matt Corallo <git@bluematt.me>

This patch does not apply without rejects to any of my trees.
