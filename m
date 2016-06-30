From: linux@bluematt.me (Matt Corallo)
Date: Thu, 30 Jun 2016 19:48:04 +0000
Subject: [PATCH] net: stmmac: Fix null-function call in ISR on stmmac1000
In-Reply-To: <20160629.035852.1504883332705515951.davem@davemloft.net>
References: <E5152E61-5896-46FD-BF4A-16CDFB3796F6@bluematt.me>
 <20160629.035852.1504883332705515951.davem@davemloft.net>
Message-ID: <57757774.80300@bluematt.me>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Damn mail clients and their helpful corruption of patches...
Resent w/o the extran \n in the diff header.

On 06/29/16 07:58, David Miller wrote:
> From: Matt Corallo <linux@bluematt.me>
> Date: Sat, 25 Jun 2016 19:35:03 +0000
> 
>> At least on Meson GXBB, the CORE_IRQ_MTL_RX_OVERFLOW interrupt is thrown
>> with the stmmac1000 driver, which does not support set_rx_tail_ptr. With
>> this patch and the clock fixes, 1G ethernet works on ODROID-C2.
>>
>> Signed-off-by: Matt Corallo <git@bluematt.me>
> 
> This patch does not apply without rejects to any of my trees.
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 
