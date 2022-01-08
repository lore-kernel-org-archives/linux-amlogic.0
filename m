Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7CD9C433EF
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Jan 2022 08:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DSr8IsYrc7fdhW+ZIzwB0fKSu/OdCNn7K6x4bICOlGg=; b=Sjp0/ClPP/9T6P
	swdeps1RNgNF7NT+WuDbwapkLGCXwhhTNgRVwMMUPwU8pPQ2VjgMfDRrvqxlXabYHvH9Np3eQGvwC
	Ti6hZqEWaXe8R4+92Cdp5iBTH3DVD60nn2Ay39fALo3tJYPygshvHO76Go5LfvVu+ZSdvxVE47Nx2
	TURDhv7HAD3i9sC1voq7DPDsSk0+J2EQN/Y7NmWP02XS8CgQ5VQCm9bNjZzYcIHctSnjCi8WPWfDb
	NSVn7EkC6YIX2r+uWw91t9wK2c+Ik4eqNwV4vLEZaRc7pz6qOqDC/6uqjFeNIozussyy3ijzGqYSL
	TyR1sSoMWQYyi5OnHT3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n67Jo-0068wM-Gn; Sat, 08 Jan 2022 08:43:20 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n67J2-0068c3-Pb; Sat, 08 Jan 2022 08:42:34 +0000
Received: from droid09-sz.software.amlogic (10.28.8.19) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.2176.2;
 Sat, 8 Jan 2022 16:42:21 +0800
From: Qianggui Song <qianggui.song@amlogic.com>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
CC: Qianggui Song <qianggui.song@amlogic.com>, Kevin Hilman
 <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>
Subject: [PATCH 4/4] irqchip/meson-gpio: Add support for meson s4 SoCs
Date: Sat, 8 Jan 2022 16:42:18 +0800
Message-ID: <20220108084218.31877-5-qianggui.song@amlogic.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220108084218.31877-1-qianggui.song@amlogic.com>
References: <20220108084218.31877-1-qianggui.song@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.8.19]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220108_004232_859732_9B0411E3 
X-CRM114-Status: GOOD (  13.70  )
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

The meson s4 SoCs support 12 gpio irq lines compared with previous
serial chips and have something different, details are as below.

IRQ Number:
- 80:68 13 pins on bank Z
- 67:48 20 pins on bank X
- 47:36 12 pins on bank H
- 35:24 12 pins on bank D
- 23:22 2  pins on bank E
- 21:14 8  pins on bank C
- 13:0  13 pins on bank B

- PADCTRL_GPIO_IRQ_CTRL0
  bit[31]:    enable/disable the whole irq lines
  bit[12-23]: single edge trigger
  bit[0-11]:  poll trigger

- PADCTRL_GPIO_IRQ_CTRL[X]
- bit[0-16]: 7 bits to chooge gpio source for irq line 2*[X] - 2
- bit[16-22]:7 bits to chooge gpio source for irq line 2*[X] - 1
  where X = 1-6

- PADCTRL_GPIO_IRQ_CTRL[7]
  bit[0-11]: both edge trigger

Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
---
 drivers/irqchip/irq-meson-gpio.c | 51 ++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpio.c
index 98419428fcbd..c5d20a866c37 100644
--- a/drivers/irqchip/irq-meson-gpio.c
+++ b/drivers/irqchip/irq-meson-gpio.c
@@ -42,6 +42,11 @@
 #define REG_PIN_SEL_SHIFT(x)	(((x) % 4) * 8)
 #define REG_FILTER_SEL_SHIFT(x)	((x) * 4)
 
+/* use for s4 chips */
+#define REG_EDGE_POL_S4	0x1c
+#define REG_EDGE_POL_MASK_S4(x)				\
+	({typeof(x) _x = (x); BIT(_x) | BIT(12 + (_x)); })
+
 struct meson_gpio_irq_controller;
 static void meson8_gpio_irq_sel_pin(struct meson_gpio_irq_controller *ctl,
 				    unsigned int channel, unsigned long hwirq);
@@ -50,6 +55,9 @@ static void meson_a1_gpio_irq_sel_pin(struct meson_gpio_irq_controller *ctl,
 				      unsigned int channel,
 				      unsigned long hwirq);
 static void meson_a1_gpio_irq_init(struct meson_gpio_irq_controller *ctl);
+static unsigned int
+meson_s4_gpio_irq_sel_type(struct meson_gpio_irq_controller *ctl,
+			   unsigned int idx, u32 val);
 
 struct irq_ctl_ops {
 	void (*gpio_irq_sel_pin)(struct meson_gpio_irq_controller *ctl,
@@ -96,6 +104,17 @@ struct meson_gpio_irq_params {
 	.pin_sel_mask = 0x7f,					\
 	.channel_num = 8,					\
 
+#define INIT_MESON_S4_COMMON_DATA(irqs)                         \
+	INIT_MESON_COMMON(irqs, meson_a1_gpio_irq_init,         \
+			  meson_a1_gpio_irq_sel_pin,            \
+			  meson_s4_gpio_irq_sel_type)           \
+	.support_edge_both = true,				\
+	.edge_both_offset = 0,					\
+	.edge_single_offset = 12,				\
+	.pol_low_offset = 0,					\
+	.pin_sel_mask = 0xff,					\
+	.channel_num = 12,					\
+
 static const struct meson_gpio_irq_params meson8_params = {
 	INIT_MESON8_COMMON_DATA(134)
 };
@@ -126,6 +145,10 @@ static const struct meson_gpio_irq_params a1_params = {
 	INIT_MESON_A1_COMMON_DATA(62)
 };
 
+static const struct meson_gpio_irq_params s4_params = {
+	INIT_MESON_S4_COMMON_DATA(82)
+};
+
 static const struct of_device_id meson_irq_gpio_matches[] = {
 	{ .compatible = "amlogic,meson8-gpio-intc", .data = &meson8_params },
 	{ .compatible = "amlogic,meson8b-gpio-intc", .data = &meson8b_params },
@@ -135,6 +158,7 @@ static const struct of_device_id meson_irq_gpio_matches[] = {
 	{ .compatible = "amlogic,meson-g12a-gpio-intc", .data = &axg_params },
 	{ .compatible = "amlogic,meson-sm1-gpio-intc", .data = &sm1_params },
 	{ .compatible = "amlogic,meson-a1-gpio-intc", .data = &a1_params },
+	{ .compatible = "amlogic,meson-s4-gpio-intc", .data = &s4_params },
 	{ }
 };
 
@@ -202,6 +226,33 @@ static void meson_a1_gpio_irq_init(struct meson_gpio_irq_controller *ctl)
 	meson_gpio_irq_update_bits(ctl, REG_EDGE_POL, BIT(31), BIT(31));
 }
 
+static unsigned int
+meson_s4_gpio_irq_sel_type(struct meson_gpio_irq_controller *ctl,
+			   unsigned int idx, unsigned int type)
+{
+	unsigned int val = 0;
+
+	meson_gpio_irq_update_bits(ctl, REG_EDGE_POL_S4, BIT(0 + (idx)), 0);
+
+	if (type == IRQ_TYPE_EDGE_BOTH) {
+		val |= BIT(ctl->params->edge_both_offset + (idx));
+		meson_gpio_irq_update_bits(ctl, REG_EDGE_POL_S4,
+					   BIT(ctl->params->edge_both_offset + (idx)), val);
+		return 0;
+	}
+
+	if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_EDGE_FALLING))
+		val |= BIT(ctl->params->pol_low_offset + (idx));
+
+	if (type & (IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING))
+		val |= BIT(ctl->params->edge_single_offset  + (idx));
+
+	meson_gpio_irq_update_bits(ctl, REG_EDGE_POL,
+				   REG_EDGE_POL_MASK_S4(idx), val);
+
+	return 0;
+};
+
 static int
 meson_gpio_irq_request_channel(struct meson_gpio_irq_controller *ctl,
 			       unsigned long  hwirq,
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
