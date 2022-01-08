Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 306F9C433F5
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Jan 2022 08:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m4ea0ue0Bi9E2JLPquuaMG8zFOWZyO7t2ZjFo+MtiFc=; b=BNS/79166SzRiM
	S7I6ErdBd+Bs0LtL92Q0bO7zNG/0jno8SFMJfxGu5Jvex2gEC4uDqzdrNsZk8WUARij7n5zR41f6u
	s49muNLwwjlR7kGy2I1oI/IaDQyBED1vzPC1sZLZUSeKr2+xCr/kMTKb609xHBnEIZFbH95AptiVL
	Izql6ZaT4uiqvwSXX6aWJDE57l3Scx6tt01OimhqBwRrSUQSx5h7zWWQiIXKwsp1WCXI4kpLtA/95
	efyOcgyq1vIEYjtgqqjhbDKQZi0cervmLUjBoc63zdU5jR43iL3QokPcCYDnm9GgZoBbpNPiKunx9
	spYzeAQQ4oMwYCVIyCag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n67Jc-0068pK-PG; Sat, 08 Jan 2022 08:43:08 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n67J1-0068c3-3S; Sat, 08 Jan 2022 08:42:32 +0000
Received: from droid09-sz.software.amlogic (10.28.8.19) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.2176.2;
 Sat, 8 Jan 2022 16:42:20 +0800
From: Qianggui Song <qianggui.song@amlogic.com>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
CC: Qianggui Song <qianggui.song@amlogic.com>, Kevin Hilman
 <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>
Subject: [PATCH 3/4] irqchip/meson-gpio: add select trigger type callback
Date: Sat, 8 Jan 2022 16:42:17 +0800
Message-ID: <20220108084218.31877-4-qianggui.song@amlogic.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220108084218.31877-1-qianggui.song@amlogic.com>
References: <20220108084218.31877-1-qianggui.song@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.8.19]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220108_004231_180872_14961273 
X-CRM114-Status: GOOD (  10.41  )
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

Due to some chips may use different registers and offset, provide
a set trigger type call back.

Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
---
 drivers/irqchip/irq-meson-gpio.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpio.c
index 6a7b4fb13452..98419428fcbd 100644
--- a/drivers/irqchip/irq-meson-gpio.c
+++ b/drivers/irqchip/irq-meson-gpio.c
@@ -55,6 +55,8 @@ struct irq_ctl_ops {
 	void (*gpio_irq_sel_pin)(struct meson_gpio_irq_controller *ctl,
 				 unsigned int channel, unsigned long hwirq);
 	void (*gpio_irq_init)(struct meson_gpio_irq_controller *ctl);
+	unsigned int (*gpio_irq_sel_type)(struct meson_gpio_irq_controller *ctl,
+					  unsigned int idx, u32 val);
 };
 
 struct meson_gpio_irq_params {
@@ -68,16 +70,17 @@ struct meson_gpio_irq_params {
 	struct irq_ctl_ops ops;
 };
 
-#define INIT_MESON_COMMON(irqs, init, sel)			\
+#define INIT_MESON_COMMON(irqs, init, sel, type)		\
 	.nr_hwirq = irqs,					\
 	.ops = {						\
 		.gpio_irq_init = init,				\
 		.gpio_irq_sel_pin = sel,			\
+		.gpio_irq_sel_type = type,			\
 	},
 
 #define INIT_MESON8_COMMON_DATA(irqs)				\
 	INIT_MESON_COMMON(irqs, meson_gpio_irq_init_dummy,	\
-			  meson8_gpio_irq_sel_pin)		\
+			  meson8_gpio_irq_sel_pin, NULL)	\
 	.edge_single_offset = 0,				\
 	.pol_low_offset = 16,					\
 	.pin_sel_mask = 0xff,					\
@@ -85,7 +88,7 @@ struct meson_gpio_irq_params {
 
 #define INIT_MESON_A1_COMMON_DATA(irqs)				\
 	INIT_MESON_COMMON(irqs, meson_a1_gpio_irq_init,		\
-			  meson_a1_gpio_irq_sel_pin)		\
+			  meson_a1_gpio_irq_sel_pin, NULL)	\
 	.support_edge_both = true,				\
 	.edge_both_offset = 16,					\
 	.edge_single_offset = 8,				\
@@ -279,6 +282,10 @@ static int meson_gpio_irq_type_setup(struct meson_gpio_irq_controller *ctl,
 	 */
 	type &= IRQ_TYPE_SENSE_MASK;
 
+	/* Some controllers may have different calculation method*/
+	if (params->ops.gpio_irq_sel_type)
+		return params->ops.gpio_irq_sel_type(ctl, idx, type);
+
 	/*
 	 * New controller support EDGE_BOTH trigger. This setting takes
 	 * precedence over the other edge/polarity settings
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
