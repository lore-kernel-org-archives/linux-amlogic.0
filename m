Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA9AC3DA61
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jul 2024 13:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TmQ39zTa9/KM1rHUpWGhUl5HMqEWos2IsgTNvCkQIvk=; b=JCovmAj/5V8YKY
	+NN3ew55UOBuThcLSdqnaKPVdRxjXc5rVVYMl64/iXgagiyX3sKTE7sHk0/AWQfy9JERNVNKaRQcA
	9ZzI2e39pnVhdLV22FZfeNHZbbiSU4qa7DKc8vMU92R3AS6gdyi/apT5enJlFO8YNid06lBQjMiFs
	JsdrwADVLYvZgJyitvStt9G82YvW1QPPovjnUopnH3CVmFrHnHTTSES7R5dCUuoa34p62D9RO/iUU
	RdashhJFXo4agxeQSdlNeOtkTlBeic5YQcxly78R7vSz61UbFdR7vb+UJJXsuLMlciiJAsURoeLJf
	DuwQQl+JBcRKWbaPx/aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYQTF-0000000BRGD-3HSJ;
	Mon, 29 Jul 2024 13:31:25 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYQTD-0000000BRDk-09bH;
	Mon, 29 Jul 2024 13:31:24 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 5D029100013;
	Mon, 29 Jul 2024 16:31:21 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 5D029100013
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1722259881;
	bh=BYVT1rFLX1cYHtKDW2gIL3X2JpU9xqBzDkqXKw5MMTI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=Gsp8CAk9wueH60dKP1JPySUEVKXV6tP1sZFOZ9X5WiJKyeOGHXpPlUJPYn7FLeHjS
	 aKaToYfUgBDQLbO6KMHwK3W9kVOZiYb2B+i+xniXHn3tJVWbP+b5VD5YcHdqAiA7VZ
	 oHdj4Fbw3xR28WxlZ+ickq/IHUBB9Ifawbd0f0Eb6+zh9dAGc4nEvY4GVfrG5WKqMh
	 lpxUtdDMq8MpaMJdMa70Y5SvnxfX+7W+fXJCi47VMdVun6AFSSYHt8WHObgHDcs7q0
	 tbFCZqo5dqMu5M6SKj2/wayRgCyZ2VOqW0MU7K9H4ZEqZ471gJpFHyvcY4HTty8LVk
	 QhySj+k64NA4g==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon, 29 Jul 2024 16:31:21 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 29 Jul 2024 16:31:20 +0300
From: Arseniy Krasnov <avkrasnov@salutedevices.com>
To: Thomas Gleixner <tglx@linutronix.de>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>
CC: <kernel@sberdevices.ru>, <oxffffaa@gmail.com>,
	<avkrasnov@salutedevices.com>
Subject: [PATCH v1] irqchip/meson-gpio: replace 'spinlock_t' with 'raw_spinlock_t'
Date: Mon, 29 Jul 2024 16:18:50 +0300
Message-ID: <20240729131850.3015508-1-avkrasnov@salutedevices.com>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 186773 [Jul 29 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: avkrasnov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 24 0.3.24 186c4d603b899ccfd4883d230c53f273b80e467f, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;salutedevices.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/07/29 12:26:00 #26174422
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_063123_431992_6B1768CB 
X-CRM114-Status: GOOD (  13.88  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This lock is acquired under 'lock' of 'struct irq_desc' which has
type 'raw_spinlock_t'. When PREEMPT_RT is enabled, 'spinlock_t'
become preemptible, so we will lock preemptible lock under raw
spinlock. Found by lockdep:

[] =============================
[] [ BUG: Invalid wait context ]
[] 6.9.9-sdkernel #1 Not tainted
[] -----------------------------
[] swapper/0/1 is trying to lock:
[] ffff0000008fed30 (&ctl->lock){....}-{3:3}, at: meson_gpio_irq_update_bits0
[] other info that might help us debug this:
[] context-{5:5}
[] 3 locks held by swapper/0/1:
[]  #0: ffff0000003cd0f8 (&dev->mutex){....}-{4:4}, at: __driver_attach+0x90c
[]  #1: ffff000004714650 (&desc->request_mutex){+.+.}-{4:4}, at: __setup_irq0
[]  #2: ffff0000047144c8 (&irq_desc_lock_class){-.-.}-{2:2}, at: __setup_irq0
[] stack backtrace:
[] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 6.9.9-sdkernel #1
[] Call trace:
[]  dump_backtrace+0x98/0xf0
[]  show_stack+0x18/0x24
[]  dump_stack_lvl+0x90/0xd0
[]  dump_stack+0x18/0x24
[]  __lock_acquire+0x9dc/0x1f10
[]  lock_acquire.part.0+0xe8/0x228
[]  lock_acquire+0x68/0x84
[]  _raw_spin_lock_irqsave+0x60/0x88
[]  meson_gpio_irq_update_bits+0x34/0x70
[]  meson8_gpio_irq_set_type+0x78/0xc4
[]  meson_gpio_irq_set_type+0x30/0x60
[]  __irq_set_trigger+0x60/0x180
[]  __setup_irq+0x30c/0x6e0
[]  request_threaded_irq+0xec/0x1a4
[]  request_any_context_irq+0x64/0xc4
[]  devm_request_any_context_irq+0x78/0x110
[]  gpio_keys_probe+0x374/0xa6c
[]  platform_probe+0x68/0xc0
[]  really_probe+0xbc/0x2a4
[]  __driver_probe_device+0x78/0x12c
[]  driver_probe_device+0xd8/0x160
[]  __driver_attach+0x9c/0x1ac
[]  bus_for_each_dev+0x78/0xd8
[]  driver_attach+0x24/0x30
[]  bus_add_driver+0xe4/0x208
[]  driver_register+0x60/0x128
[]  __platform_driver_register+0x28/0x34
[]  gpio_keys_init+0x1c/0x28
[]  do_one_initcall+0x88/0x34c
[]  kernel_init_freeable+0x240/0x334
[]  kernel_init+0x20/0x1d8
[]  ret_from_fork+0x10/0x20

Signed-off-by: Arseniy Krasnov <avkrasnov@salutedevices.com>
---
 drivers/irqchip/irq-meson-gpio.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpio.c
index 9a1791908598d..a4c3b57098ba0 100644
--- a/drivers/irqchip/irq-meson-gpio.c
+++ b/drivers/irqchip/irq-meson-gpio.c
@@ -178,7 +178,7 @@ struct meson_gpio_irq_controller {
 	void __iomem *base;
 	u32 channel_irqs[MAX_NUM_CHANNEL];
 	DECLARE_BITMAP(channel_map, MAX_NUM_CHANNEL);
-	spinlock_t lock;
+	raw_spinlock_t lock;
 };
 
 static void meson_gpio_irq_update_bits(struct meson_gpio_irq_controller *ctl,
@@ -187,14 +187,14 @@ static void meson_gpio_irq_update_bits(struct meson_gpio_irq_controller *ctl,
 	unsigned long flags;
 	u32 tmp;
 
-	spin_lock_irqsave(&ctl->lock, flags);
+	raw_spin_lock_irqsave(&ctl->lock, flags);
 
 	tmp = readl_relaxed(ctl->base + reg);
 	tmp &= ~mask;
 	tmp |= val;
 	writel_relaxed(tmp, ctl->base + reg);
 
-	spin_unlock_irqrestore(&ctl->lock, flags);
+	raw_spin_unlock_irqrestore(&ctl->lock, flags);
 }
 
 static void meson_gpio_irq_init_dummy(struct meson_gpio_irq_controller *ctl)
@@ -244,12 +244,12 @@ meson_gpio_irq_request_channel(struct meson_gpio_irq_controller *ctl,
 	unsigned long flags;
 	unsigned int idx;
 
-	spin_lock_irqsave(&ctl->lock, flags);
+	raw_spin_lock_irqsave(&ctl->lock, flags);
 
 	/* Find a free channel */
 	idx = find_first_zero_bit(ctl->channel_map, ctl->params->nr_channels);
 	if (idx >= ctl->params->nr_channels) {
-		spin_unlock_irqrestore(&ctl->lock, flags);
+		raw_spin_unlock_irqrestore(&ctl->lock, flags);
 		pr_err("No channel available\n");
 		return -ENOSPC;
 	}
@@ -257,7 +257,7 @@ meson_gpio_irq_request_channel(struct meson_gpio_irq_controller *ctl,
 	/* Mark the channel as used */
 	set_bit(idx, ctl->channel_map);
 
-	spin_unlock_irqrestore(&ctl->lock, flags);
+	raw_spin_unlock_irqrestore(&ctl->lock, flags);
 
 	/*
 	 * Setup the mux of the channel to route the signal of the pad
@@ -567,7 +567,7 @@ static int meson_gpio_irq_of_init(struct device_node *node, struct device_node *
 	if (!ctl)
 		return -ENOMEM;
 
-	spin_lock_init(&ctl->lock);
+	raw_spin_lock_init(&ctl->lock);
 
 	ctl->base = of_iomap(node, 0);
 	if (!ctl->base) {
-- 
2.30.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
