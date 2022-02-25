Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C70C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Feb 2022 05:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tCEmh6L1lBrVSB0X1qufjAe96RUOff5uAPudjIWrNks=; b=pm49c0/SAvQzJ3
	301vqSQT1sbjDkPbw5iTPQ6bzNA1e/tGyfiAJrYyrbznVhxs17kIq7cUahT3bZiISi5mW5uGzVJgd
	dVauOeZBQzb1GMjrLIWKJPY0dnrSEXKlqBSMAYFktKKOK91W5koMoLU9HN5IfS+gMulfAE5jxsbND
	dw5TwjKzTJRRYbXk+VPf4GCYRvdwOdbmOOFHadMQY14N/mFIKxjM9XV2O47CEPtAau/XL92BCprzt
	ja/6OtLLWZIN3gWO7IKE7FCcF035jhIW7pNHAtK0Rf3fUyBjaLOICgXmlgWQeBSid6jPKVGSVC5i6
	CpX8gZ0Kke0B/tmh7CLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNTXT-003NZH-U7; Fri, 25 Feb 2022 05:53:12 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNTWe-003NFj-MV; Fri, 25 Feb 2022 05:52:22 +0000
Received: from droid09-sz.software.amlogic (10.28.8.19) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.2176.2;
 Fri, 25 Feb 2022 13:52:10 +0800
From: Qianggui Song <qianggui.song@amlogic.com>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
CC: Qianggui Song <qianggui.song@amlogic.com>, Kevin Hilman
 <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>
Subject: [PATCH v3 4/4] irqchip/meson-gpio: Add support for meson s4 SoCs
Date: Fri, 25 Feb 2022 13:52:06 +0800
Message-ID: <20220225055207.1048-5-qianggui.song@amlogic.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220225055207.1048-1-qianggui.song@amlogic.com>
References: <20220225055207.1048-1-qianggui.song@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.8.19]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_215220_758008_85DB419C 
X-CRM114-Status: GOOD (  15.80  )
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

Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
---
 drivers/irqchip/irq-meson-gpio.c | 67 ++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpio.c
index 7b5863e36816..a7ddbcac9772 100644
--- a/drivers/irqchip/irq-meson-gpio.c
+++ b/drivers/irqchip/irq-meson-gpio.c
@@ -26,6 +26,8 @@
 
 /* use for A1 like chips */
 #define REG_PIN_A1_SEL	0x04
+/* Used for s4 chips */
+#define REG_EDGE_POL_S4	0x1c
 
 /*
  * Note: The S905X3 datasheet reports that BOTH_EDGE is controlled by
@@ -53,6 +55,8 @@ static void meson_a1_gpio_irq_sel_pin(struct meson_gpio_irq_controller *ctl,
 static void meson_a1_gpio_irq_init(struct meson_gpio_irq_controller *ctl);
 static int meson8_gpio_irq_set_type(struct meson_gpio_irq_controller *ctl,
 				    unsigned int type, u32 *channel_hwirq);
+static int meson_s4_gpio_irq_set_type(struct meson_gpio_irq_controller *ctl,
+				      unsigned int type, u32 *channel_hwirq);
 
 struct irq_ctl_ops {
 	void (*gpio_irq_sel_pin)(struct meson_gpio_irq_controller *ctl,
@@ -101,6 +105,17 @@ struct meson_gpio_irq_params {
 	.pin_sel_mask = 0x7f,					\
 	.nr_channels = 8,					\
 
+#define INIT_MESON_S4_COMMON_DATA(irqs)				\
+	INIT_MESON_COMMON(irqs, meson_a1_gpio_irq_init,		\
+			  meson_a1_gpio_irq_sel_pin,		\
+			  meson_s4_gpio_irq_set_type)		\
+	.support_edge_both = true,				\
+	.edge_both_offset = 0,					\
+	.edge_single_offset = 12,				\
+	.pol_low_offset = 0,					\
+	.pin_sel_mask = 0xff,					\
+	.nr_channels = 12,					\
+
 static const struct meson_gpio_irq_params meson8_params = {
 	INIT_MESON8_COMMON_DATA(134)
 };
@@ -131,6 +146,10 @@ static const struct meson_gpio_irq_params a1_params = {
 	INIT_MESON_A1_COMMON_DATA(62)
 };
 
+static const struct meson_gpio_irq_params s4_params = {
+	INIT_MESON_S4_COMMON_DATA(82)
+};
+
 static const struct of_device_id meson_irq_gpio_matches[] = {
 	{ .compatible = "amlogic,meson8-gpio-intc", .data = &meson8_params },
 	{ .compatible = "amlogic,meson8b-gpio-intc", .data = &meson8b_params },
@@ -140,6 +159,7 @@ static const struct of_device_id meson_irq_gpio_matches[] = {
 	{ .compatible = "amlogic,meson-g12a-gpio-intc", .data = &axg_params },
 	{ .compatible = "amlogic,meson-sm1-gpio-intc", .data = &sm1_params },
 	{ .compatible = "amlogic,meson-a1-gpio-intc", .data = &a1_params },
+	{ .compatible = "amlogic,meson-s4-gpio-intc", .data = &s4_params },
 	{ }
 };
 
@@ -308,6 +328,53 @@ static int meson8_gpio_irq_set_type(struct meson_gpio_irq_controller *ctl,
 	return 0;
 }
 
+/*
+ * gpio irq relative registers for s4
+ * -PADCTRL_GPIO_IRQ_CTRL0
+ * bit[31]:    enable/disable all the irq lines
+ * bit[12-23]: single edge trigger
+ * bit[0-11]:  polarity trigger
+ *
+ * -PADCTRL_GPIO_IRQ_CTRL[X]
+ * bit[0-16]: 7 bits to choose gpio source for irq line 2*[X] - 2
+ * bit[16-22]:7 bits to choose gpio source for irq line 2*[X] - 1
+ * where X = 1-6
+ *
+ * -PADCTRL_GPIO_IRQ_CTRL[7]
+ * bit[0-11]: both edge trigger
+ */
+static int meson_s4_gpio_irq_set_type(struct meson_gpio_irq_controller *ctl,
+				      unsigned int type, u32 *channel_hwirq)
+{
+	u32 val = 0;
+	unsigned int idx;
+	const struct meson_gpio_irq_params *params;
+
+	params = ctl->params;
+	idx = meson_gpio_irq_get_channel_idx(ctl, channel_hwirq);
+
+	type &= IRQ_TYPE_SENSE_MASK;
+
+	meson_gpio_irq_update_bits(ctl, REG_EDGE_POL_S4, BIT(idx), 0);
+
+	if (type == IRQ_TYPE_EDGE_BOTH) {
+		val |= BIT(ctl->params->edge_both_offset + idx);
+		meson_gpio_irq_update_bits(ctl, REG_EDGE_POL_S4,
+					   BIT(ctl->params->edge_both_offset + idx), val);
+		return 0;
+	}
+
+	if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_EDGE_FALLING))
+		val |= BIT(ctl->params->pol_low_offset + idx);
+
+	if (type & (IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING))
+		val |= BIT(ctl->params->edge_single_offset + idx);
+
+	meson_gpio_irq_update_bits(ctl, REG_EDGE_POL,
+				   BIT(idx) | BIT(12 + idx), val);
+	return 0;
+};
+
 static unsigned int meson_gpio_irq_type_output(unsigned int type)
 {
 	unsigned int sense = type & IRQ_TYPE_SENSE_MASK;
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
