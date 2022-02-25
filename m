Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B8AC433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Feb 2022 05:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D6W2IpHGXdY3yc42UCwac1uTdVAkWz6n+tBGa0ySZ3w=; b=oAcHe0Y3nWHFOJ
	6SWI6G5AhKWFl4yfJj03Z+DTGYUa0d9PJiqxzoXi6uS68oklQdJlPHDxIfDCCzQr4wJsdbK6kQnGS
	nibsgy7BCE7cwvPz4n27OrTjXIHYQNQDaV5SJ8oCw6DNWPwJSf+d83uta4V3Jwza4eMClf2Knnx5l
	9fvHFwe9jPGW1MnYeNjqnaLs/HwnGqxLVcqLzZamS8cVTi27rJtgse31JZ8wo+Qr35eeEw2ObE3Wq
	+DvjEf4XZtGOcdQF0+D3B2NCABbI3JzKofPvoEtYO9S0DkzgeodP16bu+/ebfwbvqJ9nqmpGOEc/x
	+A1mYDKScaO/iq7wRlzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNTXI-003NSJ-0l; Fri, 25 Feb 2022 05:53:00 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNTWd-003NFj-0C; Fri, 25 Feb 2022 05:52:20 +0000
Received: from droid09-sz.software.amlogic (10.28.8.19) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.2176.2;
 Fri, 25 Feb 2022 13:52:09 +0800
From: Qianggui Song <qianggui.song@amlogic.com>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
CC: Qianggui Song <qianggui.song@amlogic.com>, Kevin Hilman
 <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>
Subject: [PATCH v3 3/4] irqchip/meson-gpio: add select trigger type callback
Date: Fri, 25 Feb 2022 13:52:05 +0800
Message-ID: <20220225055207.1048-4-qianggui.song@amlogic.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220225055207.1048-1-qianggui.song@amlogic.com>
References: <20220225055207.1048-1-qianggui.song@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.8.19]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_215219_079747_57914EF4 
X-CRM114-Status: GOOD (  10.54  )
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
a set trigger type call back and add one for old controller.

Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
---
 drivers/irqchip/irq-meson-gpio.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpio.c
index 63841e1578f5..7b5863e36816 100644
--- a/drivers/irqchip/irq-meson-gpio.c
+++ b/drivers/irqchip/irq-meson-gpio.c
@@ -51,11 +51,15 @@ static void meson_a1_gpio_irq_sel_pin(struct meson_gpio_irq_controller *ctl,
 				      unsigned int channel,
 				      unsigned long hwirq);
 static void meson_a1_gpio_irq_init(struct meson_gpio_irq_controller *ctl);
+static int meson8_gpio_irq_set_type(struct meson_gpio_irq_controller *ctl,
+				    unsigned int type, u32 *channel_hwirq);
 
 struct irq_ctl_ops {
 	void (*gpio_irq_sel_pin)(struct meson_gpio_irq_controller *ctl,
 				 unsigned int channel, unsigned long hwirq);
 	void (*gpio_irq_init)(struct meson_gpio_irq_controller *ctl);
+	int (*gpio_irq_set_type)(struct meson_gpio_irq_controller *ctl,
+				 unsigned int type, u32 *channel_hwirq);
 };
 
 struct meson_gpio_irq_params {
@@ -69,16 +73,18 @@ struct meson_gpio_irq_params {
 	struct irq_ctl_ops ops;
 };
 
-#define INIT_MESON_COMMON(irqs, init, sel)			\
+#define INIT_MESON_COMMON(irqs, init, sel, type)		\
 	.nr_hwirq = irqs,					\
 	.ops = {						\
 		.gpio_irq_init = init,				\
 		.gpio_irq_sel_pin = sel,			\
+		.gpio_irq_set_type = type,			\
 	},
 
 #define INIT_MESON8_COMMON_DATA(irqs)				\
 	INIT_MESON_COMMON(irqs, meson_gpio_irq_init_dummy,	\
-			  meson8_gpio_irq_sel_pin)		\
+			  meson8_gpio_irq_sel_pin,		\
+			  meson8_gpio_irq_set_type)		\
 	.edge_single_offset = 0,				\
 	.pol_low_offset = 16,					\
 	.pin_sel_mask = 0xff,					\
@@ -86,7 +92,8 @@ struct meson_gpio_irq_params {
 
 #define INIT_MESON_A1_COMMON_DATA(irqs)				\
 	INIT_MESON_COMMON(irqs, meson_a1_gpio_irq_init,		\
-			  meson_a1_gpio_irq_sel_pin)		\
+			  meson_a1_gpio_irq_sel_pin,		\
+			  meson8_gpio_irq_set_type)		\
 	.support_edge_both = true,				\
 	.edge_both_offset = 16,					\
 	.edge_single_offset = 8,				\
@@ -259,9 +266,8 @@ meson_gpio_irq_release_channel(struct meson_gpio_irq_controller *ctl,
 	clear_bit(idx, ctl->channel_map);
 }
 
-static int meson_gpio_irq_type_setup(struct meson_gpio_irq_controller *ctl,
-				     unsigned int type,
-				     u32 *channel_hwirq)
+static int meson8_gpio_irq_set_type(struct meson_gpio_irq_controller *ctl,
+				    unsigned int type, u32 *channel_hwirq)
 {
 	u32 val = 0;
 	unsigned int idx;
@@ -326,7 +332,7 @@ static int meson_gpio_irq_set_type(struct irq_data *data, unsigned int type)
 	u32 *channel_hwirq = irq_data_get_irq_chip_data(data);
 	int ret;
 
-	ret = meson_gpio_irq_type_setup(ctl, type, channel_hwirq);
+	ret = ctl->params->ops.gpio_irq_set_type(ctl, type, channel_hwirq);
 	if (ret)
 		return ret;
 
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
