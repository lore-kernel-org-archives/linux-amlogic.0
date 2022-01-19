Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07C4C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Jan 2022 07:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZvYb5C3zqfCbIK4PfQh5RDf7jNYZKN8zMAYwNtDVVy8=; b=pdA70fsVD+UVK6
	6D8kgozA99OPV5KcHpkj0BebQFesBHYHDnuPU2npdSyKMJQTbHYEmyyaFoIdkKzRu8RoLJMkV3jix
	MuiDj4OrMZVlmTaPShiWjvgCaLzxIyYWmpV0Ucwc8U9SCUY/ni4t2XD6FVrlDPoB/tQN/AJcfX3KF
	hUj9kOziqoYX5pxmPWp1fFY1VLP1BsaFjsIhT44wdfOu5RdpaDkbUmaYIijeBChYu/7eLmIMwlX4K
	2HkdPUu0dwwcOdUNWarwyr8jnuhwYh+tJfQp6/CRBET3ppBSMere+qFBVH0d97n+mcAqONccwihRS
	VWcfj8lcwWNmgLRMC01A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA55s-00455V-Go; Wed, 19 Jan 2022 07:09:20 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA54v-0044ZD-RW; Wed, 19 Jan 2022 07:08:23 +0000
Received: from droid09-sz.software.amlogic (10.28.8.19) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.2176.2;
 Wed, 19 Jan 2022 15:08:13 +0800
From: Qianggui Song <qianggui.song@amlogic.com>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
CC: Qianggui Song <qianggui.song@amlogic.com>, Kevin Hilman
 <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>
Subject: [PATCH v2 3/4] irqchip/meson-gpio: add select trigger type callback
Date: Wed, 19 Jan 2022 15:08:08 +0800
Message-ID: <20220119070809.15563-4-qianggui.song@amlogic.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220119070809.15563-1-qianggui.song@amlogic.com>
References: <20220119070809.15563-1-qianggui.song@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.8.19]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_230821_927971_23FC7E43 
X-CRM114-Status: GOOD (  10.18  )
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
 drivers/irqchip/irq-meson-gpio.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpio.c
index eefe15e1b3a6..b511f9532adc 100644
--- a/drivers/irqchip/irq-meson-gpio.c
+++ b/drivers/irqchip/irq-meson-gpio.c
@@ -55,6 +55,8 @@ struct irq_ctl_ops {
 	void (*gpio_irq_sel_pin)(struct meson_gpio_irq_controller *ctl,
 				 unsigned int channel, unsigned long hwirq);
 	void (*gpio_irq_init)(struct meson_gpio_irq_controller *ctl);
+	void (*gpio_irq_sel_type)(struct meson_gpio_irq_controller *ctl,
+				  unsigned int idx, u32 val);
 };
 
 struct meson_gpio_irq_params {
@@ -278,6 +280,12 @@ static int meson_gpio_irq_type_setup(struct meson_gpio_irq_controller *ctl,
 	 */
 	type &= IRQ_TYPE_SENSE_MASK;
 
+	/* Some controllers may have different calculation method*/
+	if (params->ops.gpio_irq_sel_type) {
+		params->ops.gpio_irq_sel_type(ctl, idx, type);
+		return 0;
+	}
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
