Return-Path: <SRS0=VV3M=FB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F1B1C2D0E4
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2020 05:37:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C49A206D8
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2020 05:37:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fbdGgZWE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="IzDDCJNu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C49A206D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hangtu-china.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0JtriqbZ2Xij89qOzQPL0DFesuRS2nAmEoA68fv5qIE=; b=fbdGgZWELdmcH/THMZathhTp+Q
	CsMlARjsiB0LG07nmBcB1qMDGQ6E+SkJGS0Ll4huN3JZqW/ghsZcFQC5iuX5JtfO/iqzITeHLMao4
	rP/62xsNCgiBgmoE1n+YTfPgQ1FiYPJQsVK/lp1QbpTg/67kr3C1Mao5BFeNvVhPuVft1oMcgisWI
	sLuPuCMLJr8xTh6hEQS1Ge6t4XGFZeTlBFOaIyzn3X3O8h97opyesVGhFfZH3qrZAeGVWiXsRH9Nh
	xZZwk9PPuHiC7249lWSBUMzren3Bjkjpqbr+M57j9kPUyavr1wRq/gjCxTltJ3Mu7FwOzaChyFiVP
	9U3GfrDA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiWRo-0003T0-Jg; Fri, 27 Nov 2020 05:37:32 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiWRl-0003SV-AC
 for linux-amlogic@merlin.infradead.org; Fri, 27 Nov 2020 05:37:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=lmgddvHtAi5SdHCfttKJz4DYN1iYMVB/xgJ/V1LKoCk=; b=IzDDCJNusTxAaHdnXbgN6EDVz1
 z1NIyFTcJ1v3oBojx5h+tOnOtfQ8Ij2tlnv7Cw4AX8qKQgxiwr3bshvQYGNiYotAqfsaeSl//n6P6
 fS5LldZDhXVkwDz0J1nZhcb1siGNGFKPi4mdP+epCsXquWu10+9NMHfg8aFZ4IVtBykB+P+GAMSqJ
 owsXw3/RD10nWsp5PYpm+8pY3J9+ifdPxRzs/tB1WClTssRHM/7Saj9eGOVH56aMQVZNNaVmtiSM1
 FgTxHax6WTJZCx26yHTKrEO2G9yyYEr7C23xZzcEFEB57K/Z2onCvBsfece+RPsWFTuHOc7WbNU8h
 hzgsRJxg==;
Received: from smtpbg704.qq.com ([203.205.195.105] helo=smtpproxy21.qq.com)
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiWRh-0005gl-RD
 for linux-amlogic@lists.infradead.org; Fri, 27 Nov 2020 05:37:28 +0000
X-QQ-mid: bizesmtp17t1606455382tq2xz4a8
Received: from localhost.localdomain (unknown [115.238.52.186])
 by esmtp6.qq.com (ESMTP) with 
 id ; Fri, 27 Nov 2020 13:36:21 +0800 (CST)
X-QQ-SSF: 0120000000800070B000B00A0000000
X-QQ-FEAT: zN8aTbUO6yNNgGYJ4vOtjrU8x/KUgr9Mba0IGxwhgvtjzXkKwduROXQmvU9iv
 m0Cp1K+6ryqXRSJyJ9qCR7eJYNhsiyKyz9a/qY4rIwi3S2hOH1MAaREoKEKCvuBe6qnlulr
 zRB1XWX95icSf2tqZo9J79f7tdELdhMpGE2txZR84Vd27MTw/hOEBzyTqRrKYtqJcvsJAmC
 DvZljsttQF31S4mTOlph2cdMRTslCPN4r0BlYzoJWN1/zMDqZIfJmt4BffcTeROUmmqPigF
 bXrZe1CSF9sNbey6fI4b2X0avor/68/XRrEzqwGVeSW3OE75i8ow0LXo0=
X-QQ-GoodBg: 0
From: linshenghuan@hangtu-china.com
To: linus.walleij@linaro.org, khilman@baylibre.com, narmstrong@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 linshenghuan@hangtu-china.com
Subject: [PATCH] add amlogic gpio to irq
Date: Fri, 27 Nov 2020 13:36:19 +0800
Message-Id: <1606455379-7236-1-git-send-email-linshenghuan@hangtu-china.com>
X-Mailer: git-send-email 2.7.4
Signed-off-by: Lin shenghuan <linshenghuan@hangtu-china.com>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:hangtu-china.com:qybgforeign:qybgforeign5
X-QQ-Bgrelay: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_053726_359564_885BEC88 
X-CRM114-Status: GOOD (  10.72  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-gpio@vger.kernel.org, Lin shenghuan <linsheng_111@163.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Lin shenghuan <linsheng_111@163.com>

---
 drivers/pinctrl/meson/pinctrl-meson.c | 36 +++++++++++++++++++++++++++++++++++
 drivers/pinctrl/meson/pinctrl-meson.h |  1 +
 2 files changed, 37 insertions(+)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 20683cd..b91ff2c 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -51,6 +51,7 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/seq_file.h>
+#include <linux/of_irq.h>
 
 #include "../core.h"
 #include "../pinctrl-utils.h"
@@ -598,6 +599,34 @@ static int meson_gpio_get(struct gpio_chip *chip, unsigned gpio)
 	return !!(val & BIT(bit));
 }
 
+static int meson_gpio_to_irq(struct gpio_chip *chip, unsigned int gpio)
+{
+	struct meson_pinctrl *pc = gpiochip_get_data(chip);
+	struct meson_bank *bank;
+	struct irq_fwspec fwspec;
+	int hwirq;
+
+	if (meson_get_bank(pc, gpio, &bank))
+		return -EINVAL;
+
+	if (bank->irq_first < 0) {
+		dev_warn(pc->dev, "no support irq for pin[%d]\n", gpio);
+		return -EINVAL;
+	}
+	if (!pc->of_irq) {
+		dev_err(pc->dev, "invalid device node of gpio INTC\n");
+		return -EINVAL;
+	}
+
+	hwirq = gpio - bank->first + bank->irq_first;
+	fwspec.fwnode = of_node_to_fwnode(pc->of_irq);
+	fwspec.param_count = 2;
+	fwspec.param[0] = hwirq;
+	fwspec.param[1] = IRQ_TYPE_NONE;
+
+	return irq_create_fwspec_mapping(&fwspec);
+}
+
 static int meson_gpiolib_register(struct meson_pinctrl *pc)
 {
 	int ret;
@@ -612,6 +641,7 @@ static int meson_gpiolib_register(struct meson_pinctrl *pc)
 	pc->chip.direction_output = meson_gpio_direction_output;
 	pc->chip.get = meson_gpio_get;
 	pc->chip.set = meson_gpio_set;
+	pc->chip.to_irq = meson_gpio_to_irq;
 	pc->chip.base = -1;
 	pc->chip.ngpio = pc->data->num_pins;
 	pc->chip.can_sleep = false;
@@ -682,6 +712,12 @@ static int meson_pinctrl_parse_dt(struct meson_pinctrl *pc,
 
 	pc->of_node = gpio_np;
 
+	pc->of_irq = of_find_compatible_node(NULL,
+			NULL, "amlogic,meson-gpio-intc");
+	if (!pc->of_irq)
+		pc->of_irq = of_find_compatible_node(NULL,
+			NULL, "amlogic,meson-gpio-intc-ext");
+
 	pc->reg_mux = meson_map_resource(pc, gpio_np, "mux");
 	if (IS_ERR_OR_NULL(pc->reg_mux)) {
 		dev_err(pc->dev, "mux registers not found\n");
diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
index f8b0ff9..0f808bb 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.h
+++ b/drivers/pinctrl/meson/pinctrl-meson.h
@@ -131,6 +131,7 @@ struct meson_pinctrl {
 	struct regmap *reg_ds;
 	struct gpio_chip chip;
 	struct device_node *of_node;
+	struct device_node *of_irq;
 };
 
 #define FUNCTION(fn)							\
-- 
2.7.4




_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
