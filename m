Return-Path: <SRS0=VV3M=FB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EC10C2D0E4
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2020 05:21:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EEFA21D7F
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2020 05:21:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M6N3AIO7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="IAn+C8K3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EEFA21D7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=163.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Pk8VQAkkSVVqSfHzqXfjwW9Nso4Bfa3C7Wp5TisFwfw=; b=M6N3AIO72TrUabgSVqGoL6O5+e
	/DdSGmAadLypuxd+iaMV5V/Umv2WUb50ggpnTArZSpd0w7S3rM3b7nSvBXCT2Px/ricyxUjdDvr5K
	QTgiO2ma8mFlLcyxXApiMJI1BWLfDHmH2DBfnNzwHeKv+g9XLa3F2bCdcQ5RHi+LglemzxpyZp8R8
	PE6X8/7shlawshb34OTDzqbZ0zfHZ1UDUZY10XAncj93e6a1XT2hyv5SMeW5w9jWnN4QfciPar0bC
	0JdHClYDBu/7Ohx2nP01E9zUZZ7DyZ4eFZ7kmq4S81JNxEwC0vV24sUkerUaBS0aBS6RopAzWPpK/
	BlQWCutQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiWBp-0000Tp-EO; Fri, 27 Nov 2020 05:21:01 +0000
Received: from m12-14.163.com ([220.181.12.14])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiWBd-0000P1-UZ; Fri, 27 Nov 2020 05:20:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=lmgddvHtAi5SdHCftt
 KJz4DYN1iYMVB/xgJ/V1LKoCk=; b=IAn+C8K3nZ//qxxcqnBLP5k7vmmjR2OEXL
 UjkFJzI/7GSepnhuooVVYneWUzftEo8xnWmldjuYcCluRcGg11aysMtJlHZjvt/0
 oxmZEw/AbmQ0CdNHgZxkGm81EgKz+F2vR+lcHfIOzdyHtY8u0ziBWUcAZE5FT3qi
 1ow2LnaiY=
Received: from localhost.localdomain (unknown [115.238.52.186])
 by smtp10 (Coremail) with SMTP id DsCowAC37vJijMBfOncJYA--.30588S3;
 Fri, 27 Nov 2020 13:19:45 +0800 (CST)
From: linsheng_111@163.com
To: linus.walleij@linaro.org, khilman@baylibre.com, narmstrong@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 linshenghuan@hangtu-china.com
Subject: [PATCH] add amlogic gpio to irq
Date: Fri, 27 Nov 2020 13:19:27 +0800
Message-Id: <1606454367-3493-1-git-send-email-linsheng_111@163.com>
X-Mailer: git-send-email 2.7.4
Signed-off-by: Lin shenghuan <linshenghuan@hangtu-china.com>
X-CM-TRANSID: DsCowAC37vJijMBfOncJYA--.30588S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxJFy3Zr4xtw47Kr45Kr48WFg_yoW5WF45pF
 43GFyYyr13JF47WryrAanrAFW3K3WxJFW2gay7Ka97uw13GFyDtFy29FW5Zrs8WrW5CF4r
 Jr4rGFWUWr45AFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UHBTrUUUUU=
X-Originating-IP: [115.238.52.186]
X-CM-SenderInfo: polq2x5hqjsiirr6il2tof0z/1tbipBHpOlr7rnYrLgAAsa
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_002051_274133_45AB282D 
X-CRM114-Status: GOOD (  14.27  )
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
