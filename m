Return-Path: <SRS0=94bh=OM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57F91C04EB9
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 06:14:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 093AD20881
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 06:14:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tNYZ8+8a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 093AD20881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5IbU1ApwvWvMEviv3Ous0XRX/wqUYG3IY5+sX6QSQek=; b=tNYZ8+8aw0v7iR
	quGb+k2y+VfPRew23hdEzkGyBbE74C8xy4hKmwoGIMpeFXlDtDIpJJ1NQwnTjR9i9Nn+axFoadjkF
	+tpEHPSw6WI+o+gIPNQMHSegoY05BpaQWiPYWcb9DmixSInXHN702NPZAb377FxOOG88wPQFnUok8
	lomroWHgdl0YNJiXfWVj1HI37rQ4L6UMND/hstDAT2HsIZ5Xzfcqb4XLGaTDN0dO/w1Zkw2czqHxi
	/akykpItoG7rUQmtGPefDFRTmnkCZdZJ8SwbfAlDBNX9+kLYHd36erwOX4sAaXGVKRt8XWHtzpSdw
	VPBIwtbWYuvXJ7Dr21MQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gThV5-0008KS-U4; Mon, 03 Dec 2018 06:14:35 +0000
Received: from mail-sh2.amlogic.com ([58.32.228.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gThUk-0007nW-Jb; Mon, 03 Dec 2018 06:14:25 +0000
Received: from localhost.localdomain (10.28.8.22) by mail-sh2.amlogic.com
 (10.18.11.6) with Microsoft SMTP Server id 15.0.1320.4; Mon, 3 Dec 2018
 14:13:58 +0800
From: Xingyu Chen <xingyu.chen@amlogic.com>
To: Marc Zyngier <marc.zyngier@arm.com>, Jason Cooper <jason@lakedaemon.net>, 
 Thomas Gleixner <tglx@linutronix.de>, Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 2/2] irqchip/meson-gpio: Add support for Meson-G12A SoC
Date: Mon, 3 Dec 2018 14:13:24 +0800
Message-ID: <20181203061324.36248-3-xingyu.chen@amlogic.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181203061324.36248-1-xingyu.chen@amlogic.com>
References: <20181203061324.36248-1-xingyu.chen@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.8.22]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181202_221415_252612_5A02CDD2 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Jianxin Pan <jianxin.pan@amlogic.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>, Xingyu Chen <xingyu.chen@amlogic.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Meson-G12A SoC uses the same GPIO interrupt controller IP block as the
other Meson SoCs, A totle of 100 pins can be spied on, which is the sum of:

- 223:100 undefined (no interrupt)
- 99:97   3 pins on bank GPIOE
- 96:77   20 pins on bank GPIOX
- 76:61   16 pins on bank GPIOA
- 60:53   8 pins on bank GPIOC
- 52:37   16 pins on bank BOOT
- 36:28   9 pins on bank GPIOH
- 27:12   16 pins on bank GPIOZ
- 11:0    12 pins in the AO domain

Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>
Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
---
 drivers/irqchip/irq-meson-gpio.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpio.c
index 7b531fd075b8..971e8dea069a 100644
--- a/drivers/irqchip/irq-meson-gpio.c
+++ b/drivers/irqchip/irq-meson-gpio.c
@@ -67,12 +67,17 @@ static const struct meson_gpio_irq_params axg_params = {
 	.nr_hwirq = 100,
 };
 
+static const struct meson_gpio_irq_params g12a_params = {
+	.nr_hwirq = 100,
+};
+
 static const struct of_device_id meson_irq_gpio_matches[] = {
 	{ .compatible = "amlogic,meson8-gpio-intc", .data = &meson8_params },
 	{ .compatible = "amlogic,meson8b-gpio-intc", .data = &meson8b_params },
 	{ .compatible = "amlogic,meson-gxbb-gpio-intc", .data = &gxbb_params },
 	{ .compatible = "amlogic,meson-gxl-gpio-intc", .data = &gxl_params },
 	{ .compatible = "amlogic,meson-axg-gpio-intc", .data = &axg_params },
+	{ .compatible = "amlogic,meson-g12a-gpio-intc", .data = &g12a_params },
 	{ }
 };
 
-- 
2.19.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
