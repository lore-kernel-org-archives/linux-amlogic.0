Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B26C5478C
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Feb 2024 07:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uAGHhbuTVnBm+dbclK4DfcXp/AKhn98ubWgSGtQuaxs=; b=QJp7Qeqq+dnl4e
	ZRs1Kglnku6tCXNCfEFfyKnmqwE0YSqGzYRUbT9w66bDtfMkUlLtWNOvin2ctTGx+ypTkWbAkbXpV
	R5P9C9Ba+vMtXkEFr8H2GNYWiIicNu0oo7l3spYQ9Lpx9NWUKIe2fUqonrZ273SqDIZ/1rnBwuFD+
	+oa6aVibADGHrnfzyvoybKubwSGV0j8P8ftIl344djFWrQJhXTTFwzEkbXojsvyktbPGDO06LnzwK
	IWde3Pl2wGgBAjaZettjdLOURMVbX1gH/PEOahLZAd1WCs6Uz9bu2B5GVgO+CTHiq1UB/t7l3awAV
	i/sQ8YROgwLcN4kx9SuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd3nz-00000003s26-2loU;
	Thu, 22 Feb 2024 07:47:43 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd3no-00000003rrj-0x5u;
	Thu, 22 Feb 2024 07:47:34 +0000
Received: from rd02-sz.amlogic.software (10.28.11.83) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.6; Thu, 22 Feb 2024
 15:47:18 +0800
From: Huqiang Qin <huqiang.qin@amlogic.com>
To: <tglx@linutronix.de>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <hkallweit1@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	Huqiang Qin <huqiang.qin@amlogic.com>
Subject: [RESEND PATCH 2/3] irqchip: Add support for Amlogic-T7 SoCs
Date: Thu, 22 Feb 2024 15:46:38 +0800
Message-ID: <20240222074640.1866284-3-huqiang.qin@amlogic.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240222074640.1866284-1-huqiang.qin@amlogic.com>
References: <20240222074640.1866284-1-huqiang.qin@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.11.83]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_234732_451171_2060CE28 
X-CRM114-Status: UNSURE (   7.93  )
X-CRM114-Notice: Please train this message.
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

The Amlogic-T7 SoCs support 12 GPIO IRQ lines compared with previous
serial chips and have something different, details are as below.

IRQ Number:
- 156      1 pin  on bank TESTN
- 155:148  8 pins on bank H
- 147:129 19 pins on bank Y
- 128:115 14 pins on bank M
- 114:91  24 pins on bank T
- 90:77   14 pins on bank Z
- 76:70    7 pins on bank E
- 69:57   13 pins on bank D
- 56:40   17 pins on bank W
- 39:20   20 pins on bank X
- 19:13    7 pins on bank C
- 12:0    13 pins on bank B

Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/irqchip/irq-meson-gpio.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpio.c
index f88df39f4129..9a1791908598 100644
--- a/drivers/irqchip/irq-meson-gpio.c
+++ b/drivers/irqchip/irq-meson-gpio.c
@@ -154,6 +154,10 @@ static const struct meson_gpio_irq_params c3_params = {
 	INIT_MESON_S4_COMMON_DATA(55)
 };
 
+static const struct meson_gpio_irq_params t7_params = {
+	INIT_MESON_S4_COMMON_DATA(157)
+};
+
 static const struct of_device_id meson_irq_gpio_matches[] __maybe_unused = {
 	{ .compatible = "amlogic,meson8-gpio-intc", .data = &meson8_params },
 	{ .compatible = "amlogic,meson8b-gpio-intc", .data = &meson8b_params },
@@ -165,6 +169,7 @@ static const struct of_device_id meson_irq_gpio_matches[] __maybe_unused = {
 	{ .compatible = "amlogic,meson-a1-gpio-intc", .data = &a1_params },
 	{ .compatible = "amlogic,meson-s4-gpio-intc", .data = &s4_params },
 	{ .compatible = "amlogic,c3-gpio-intc", .data = &c3_params },
+	{ .compatible = "amlogic,t7-gpio-intc", .data = &t7_params },
 	{ }
 };
 
-- 
2.42.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
