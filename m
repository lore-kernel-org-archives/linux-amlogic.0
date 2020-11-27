Return-Path: <SRS0=VV3M=FB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9E79C2D0E4
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2020 05:23:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BEFD21D7F
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2020 05:23:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ELPZJJP7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="EXx2O1Zq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="R8BM8/vl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BEFD21D7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=163.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Pk8VQAkkSVVqSfHzqXfjwW9Nso4Bfa3C7Wp5TisFwfw=; b=ELPZJJP7Na0gqkTEKcKpfWKZaM
	vYhB+SOw0lYbDNNsIYr0XpX9pM2pxvJqKo9LMcuJoH0gWFGq5BqlEeJqgaAnhq3Cjg6ieSfTDWFRK
	UBLyMxBDFOfWsL+0i24ogATelB9q6bHCgBTTbR0USyfGS/RthjjY5fwqsCi8LyAoFQa9wUn9ZSu84
	68KTcK7uq6nxbnUSCstPUQv9xXujia3kMCH3jFZPBrQV7JX9jvKQbFPP73z0NDTRN9X3f/YtUfHK6
	vZdZaKNxP0Luu+sUofoUk0cXoiXpanq1Da18xDh7rQkNT92FjkkTwtbFFNf8pS8bqkeRA5Hnyh3xt
	OMWOT+5g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiWDi-0000rZ-RE; Fri, 27 Nov 2020 05:22:58 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiWDc-0000qY-JE; Fri, 27 Nov 2020 05:22:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=lmgddvHtAi5SdHCfttKJz4DYN1iYMVB/xgJ/V1LKoCk=; b=EXx2O1ZqdQdjZUZBupCuQBCNsK
 ZOS4eJAmxYrL2ovz2NCGXqY9SIjiPjbZLutXdTGJ03mO7o6MIeWCAa2zWfHuWsxvyYZUgB4DzCkP0
 P9vUdQ3sdM3ufCCMxrrF07i5Ncpi/kmUsEagF94Xqv90+k7ws+BPow8MT7L2xiK6fQbHML5qEzUwn
 MWWPGsyql6iGpa/WtpLZkJk13pjhr3lEiR0e5fiNl87NlIrFJS3sU5Be9+Fo3WiEkfNGJ9SXJ54Vt
 hzXaTiwQfsyi0PjeU1GCcHLeeYg979Z7y23PVmaOrIRYcgCuE4T8Y+1fHkZLD/uonHl4KwnkloiQN
 sWQD/k6w==;
Received: from m12-18.163.com ([220.181.12.18])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiWDX-0005B7-BS; Fri, 27 Nov 2020 05:22:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=lmgddvHtAi5SdHCftt
 KJz4DYN1iYMVB/xgJ/V1LKoCk=; b=R8BM8/vlkT+tsLpWQrvFzKdF3WjF4n60Kv
 pDgJ4rg4HksCHlmGz8fJ7C/bgSmTepjx3bwZj1nEG9u6gNF3Hy71w4dTVRkszhn6
 0xo7UAdPGgqokb1yuOKk27LwSOdEzi5qu8A4LuHMlbBpfRozMPvF5EaNWACTnUyv
 myQwGWsTA=
Received: from localhost.localdomain (unknown [115.238.52.186])
 by smtp14 (Coremail) with SMTP id EsCowAB3t_6_jMBfeM8wGg--.52279S3;
 Fri, 27 Nov 2020 13:21:04 +0800 (CST)
From: linsheng_111@163.com
To: linus.walleij@linaro.org, khilman@baylibre.com, narmstrong@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 linshenghuan@hangtu-china.com
Subject: [PATCH] add amlogic gpio to irq
Date: Fri, 27 Nov 2020 13:21:02 +0800
Message-Id: <1606454462-3826-1-git-send-email-linsheng_111@163.com>
X-Mailer: git-send-email 2.7.4
Signed-off-by: Lin shenghuan <linshenghuan@hangtu-china.com>
X-CM-TRANSID: EsCowAB3t_6_jMBfeM8wGg--.52279S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxJFy3Zr4xtw47Kr45Kr48WFg_yoW5WF45pF
 43GFyYyr13JF47WryrAanrAFW3K3WxJFW2gay7Ka97uw13GFyDtFy29FW5Zrs8WrW5CF4r
 Jr4rGFWUWr45AFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UlPfLUUUUU=
X-Originating-IP: [115.238.52.186]
X-CM-SenderInfo: polq2x5hqjsiirr6il2tof0z/1tbipADpOlr7rnYvbQAAsM
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_052248_376285_1FE1C7EF 
X-CRM114-Status: GOOD (  11.87  )
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
