Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E24C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Jan 2022 07:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=95GD7WmOj0N9k77j3YLDVcJLO5LOUMBsoFu48t6JCGc=; b=QlQhqaG5+4SMjh
	pbv0NO3re/BqMPPxeK9TDC73vy5L1oLxbD4wHI5DLjY1XBniLF35mRNQZOfet6A+OhXk7PWXNnnkh
	egzCloqqxsMBaGAGxf+ZrB24jj5N46rNciDxcn0Od9swSU3cKVr1ptH/+mRTe02eSx+1sh2jn4ggc
	J3mogm1YjOYUvtPha9WIkP/V7vmXABoR6nIaYBU+KhjlaEwIu7l3WYqhVcmmBW4XTlvMNaULNwc45
	3kFJydWaBXRSEygs4TGfduIs8C/aV+qYgfKjYH39GFFjrafBQpuzm8NjCa5GtWnOcaJHLFa4zz4j1
	ivSvjbp3tloeEHNVL9Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA55Y-0044tL-PV; Wed, 19 Jan 2022 07:09:00 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA54u-0044ZD-1M; Wed, 19 Jan 2022 07:08:21 +0000
Received: from droid09-sz.software.amlogic (10.28.8.19) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.2176.2;
 Wed, 19 Jan 2022 15:08:12 +0800
From: Qianggui Song <qianggui.song@amlogic.com>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
CC: Qianggui Song <qianggui.song@amlogic.com>, Kevin Hilman
 <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>
Subject: [PATCH v2 2/4] irqchip/meson-gpio: support more than 8 channels gpio
 irq line
Date: Wed, 19 Jan 2022 15:08:07 +0800
Message-ID: <20220119070809.15563-3-qianggui.song@amlogic.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220119070809.15563-1-qianggui.song@amlogic.com>
References: <20220119070809.15563-1-qianggui.song@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.8.19]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_230820_126281_68BC9C6D 
X-CRM114-Status: GOOD (  14.35  )
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

Current meson gpio irqchip driver only support 8 channels for gpio irq
line, later chips may have more then 8 channels, so need to modify code
to support more.

Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
---
 drivers/irqchip/irq-meson-gpio.c | 33 +++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpio.c
index d90ff0b92480..eefe15e1b3a6 100644
--- a/drivers/irqchip/irq-meson-gpio.c
+++ b/drivers/irqchip/irq-meson-gpio.c
@@ -16,7 +16,6 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 
-#define NUM_CHANNEL 8
 #define MAX_INPUT_MUX 256
 
 #define REG_EDGE_POL	0x00
@@ -60,6 +59,7 @@ struct irq_ctl_ops {
 
 struct meson_gpio_irq_params {
 	unsigned int nr_hwirq;
+	unsigned int nr_channels;
 	bool support_edge_both;
 	unsigned int edge_both_offset;
 	unsigned int edge_single_offset;
@@ -81,6 +81,7 @@ struct meson_gpio_irq_params {
 	.edge_single_offset = 0,				\
 	.pol_low_offset = 16,					\
 	.pin_sel_mask = 0xff,					\
+	.nr_channels = 8,					\
 
 #define INIT_MESON_A1_COMMON_DATA(irqs)				\
 	INIT_MESON_COMMON(irqs, meson_a1_gpio_irq_init,		\
@@ -90,6 +91,7 @@ struct meson_gpio_irq_params {
 	.edge_single_offset = 8,				\
 	.pol_low_offset = 0,					\
 	.pin_sel_mask = 0x7f,					\
+	.nr_channels = 8,					\
 
 static const struct meson_gpio_irq_params meson8_params = {
 	INIT_MESON8_COMMON_DATA(134)
@@ -136,8 +138,8 @@ static const struct of_device_id meson_irq_gpio_matches[] = {
 struct meson_gpio_irq_controller {
 	const struct meson_gpio_irq_params *params;
 	void __iomem *base;
-	u32 channel_irqs[NUM_CHANNEL];
-	DECLARE_BITMAP(channel_map, NUM_CHANNEL);
+	u32 *channel_irqs;
+	unsigned long *channel_map;
 	spinlock_t lock;
 };
 
@@ -207,8 +209,8 @@ meson_gpio_irq_request_channel(struct meson_gpio_irq_controller *ctl,
 	spin_lock_irqsave(&ctl->lock, flags);
 
 	/* Find a free channel */
-	idx = find_first_zero_bit(ctl->channel_map, NUM_CHANNEL);
-	if (idx >= NUM_CHANNEL) {
+	idx = find_first_zero_bit(ctl->channel_map, ctl->params->nr_channels);
+	if (idx >= ctl->params->nr_channels) {
 		spin_unlock_irqrestore(&ctl->lock, flags);
 		pr_err("No channel available\n");
 		return -ENOSPC;
@@ -447,13 +449,26 @@ static int meson_gpio_irq_parse_dt(struct device_node *node, struct meson_gpio_i
 
 	ctl->params = match->data;
 
+	ctl->channel_irqs = kcalloc(ctl->params->nr_channels, sizeof(*ctl->channel_irqs),
+				    GFP_KERNEL);
+	if (!ctl->channel_irqs)
+		return -ENOMEM;
+
+	ctl->channel_map = bitmap_zalloc(ctl->params->nr_channels, GFP_KERNEL);
+	if (!ctl->channel_map) {
+		kfree(ctl->channel_irqs);
+		return -ENOMEM;
+	}
+
 	ret = of_property_read_variable_u32_array(node,
 						  "amlogic,channel-interrupts",
 						  ctl->channel_irqs,
-						  NUM_CHANNEL,
-						  NUM_CHANNEL);
+						  ctl->params->nr_channels,
+						  ctl->params->nr_channels);
 	if (ret < 0) {
-		pr_err("can't get %d channel interrupts\n", NUM_CHANNEL);
+		pr_err("can't get %d channel interrupts\n", ctl->params->nr_channels);
+		kfree(ctl->channel_map);
+		kfree(ctl->channel_irqs);
 		return ret;
 	}
 
@@ -507,7 +522,7 @@ static int meson_gpio_irq_of_init(struct device_node *node, struct device_node *
 	}
 
 	pr_info("%d to %d gpio interrupt mux initialized\n",
-		ctl->params->nr_hwirq, NUM_CHANNEL);
+		ctl->params->nr_hwirq, ctl->params->nr_channels);
 
 	return 0;
 
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
