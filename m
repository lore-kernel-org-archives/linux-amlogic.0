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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 053E8C63777
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2020 03:55:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A26C9208CA
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2020 03:55:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LtNFo4GK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=qq.com header.i=@qq.com header.b="VceigVcI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A26C9208CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=qq.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Subject:To:From:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+kkx+HcI00cJwMq7jjWhj8VL0lrJ6skCB8AXdOC1V7Y=; b=LtNFo4GKVxTLg1j138yUut6WVv
	4IaSpaYa1DN44UcuOQvit3PKlQYt8za9tUC0bhUu09/NQnqfN8/s1THIDGrADzr7MhQoGlbruDpjj
	tpD6iEwP2R3X2NoQa4CAuwJ5nUo++4F1n0+OnCrZkexooXrM1UlHrTYBVoTee4gknGs+vsssNJvm2
	hRvUWhH8HRKWMKzh0YuZKfkLN/fMcZq/byhfZ+IQ7FMAkiFnWmYAP+p8dcbWtQA7drkXBBHKnezbY
	2Pik9hUSZ2i17c8kwwSZuJsD4wByL5x18qsrWbNbHyjoCDHXTxBeZiNPzR2y0+9e9xtUNEp0xjFgz
	o4wkeN4w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiUrH-000176-1B; Fri, 27 Nov 2020 03:55:43 +0000
Received: from out203-205-251-59.mail.qq.com ([203.205.251.59] helo=qq.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiUrB-000149-2g; Fri, 27 Nov 2020 03:55:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1606449324; bh=cmUIRKiRCpniorIV6kOGuePdPfrh9Fgr6eJkwXgC6ko=;
 h=From:To:Cc:Subject:Date;
 b=VceigVcIaSjzlKp+Wfwa4qVjDxyKjZzcWj2Zej8G/lHUlD2maFhVSXYixtXbK/3xQ
 qH0/a74cxKzxdcMHeIaJkLHcXIqn0T3IpFpp/RDB7JKYhJDrODADvWexi3P4hp8Nbk
 dLL5F8jkfj99OqKQg28CpeUHm5cTYhkixT/cXzyc=
Received: from localhost.localdomain ([115.238.52.186])
 by newxmesmtplogicsvrszc5.qq.com (NewEsmtp) with SMTP
 id DD5BC60E; Fri, 27 Nov 2020 11:55:21 +0800
X-QQ-mid: xmsmtpt1606449321ta8k77gbm
Message-ID: <tencent_31A50207D2CC6A1FFB474A5E572C02BB3206@qq.com>
X-QQ-XMAILINFO: NcJQPrdKkKeKuWpMOEo4J94JgXkLGQjKJ6FbKZ2CUCKYKaCZ8TSTc3yp3zMsEC
 Dxg+Y9/S7aQUT8PWK/AYL1UVC1Mc4ywfonmifi1nqt7S52wI6FAJNKguZpIGt5HOOvYWsyRV8HRj
 i8zpREmngQeg7T+kHtZfTSav7bEkLj6GNl1k5nSEhg58SqxwaKpvuk3SAGug03lPo5xQG780owFr
 +dPSwo8XyWTifJRqZ0kLAy037FdOpFA8hLr5L86iXGaw6Mj377SF65Kigj5LzBkJPHYHK/EoBr4a
 jh3eVY4Pj1HdU+e+BLFurmhO7+kdDobMI8KnGwswgHx51ibfASVZLIgE69a0O1IXnfi1mBvQUgwL
 VV+B7DSEkej5ACs7+pEPhUH01pzeoluZ79+2qzBEWNyzEO1ygSJxx6tnbUntAUYfNtDrpYiMk5Lr
 K2iDE0CRHLrsAC8RCzEh150rqxGehyeDLCCc2Xe7dwlQuU71IYZhi6tab4MIRXegZPA097pqvKYH
 m+tUIv5wytM+C/elJ5XCZVqdWRWcHE2c53QWe9m0mumIFXXquFuKb3pDK5sXP7d5lBQvmPCwWZmU
 Mmnmy9KEnokV3yYb3QyEDVOq4JVQ88FCR1A6AiQSh+NNhS8ZJrEkySZeWw5Ahwzq+3oXeojCpDFw
 WMWcCi62Cc0DtsnBK11IWHJ07MZCAOFBQwy5Kd//iX6Lytl9oFGABIIV3HSaIzRZPo1j7AqZ8rXr
 xbPD3hDQZHVLhLIJbVqFGjmT61s3PIQFDuY79dWkuI9OLebQOxYTGVT35PCy0MHMB2KUX61Cfpk3
 6mCCzvxcgXd8aSZ/dhPHPHDNHz7/iYEjA=
From: 410860423@qq.com
To: linus.walleij@linaro.org, khilman@baylibre.com, narmstrong@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 linshenghuan@hangtu-china.com
Subject: [PATCH] add amlogic gpio to irq
Date: Fri, 27 Nov 2020 11:55:20 +0800
X-OQ-MSGID: <1606449320-27384-1-git-send-email-410860423@qq.com>
X-Mailer: git-send-email 2.7.4
Signed-off-by: Lin shenghuan <linshenghuan@hangtu-china.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_225537_613908_98B43E8A 
X-CRM114-Status: GOOD (  14.23  )
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
Cc: linux-gpio@vger.kernel.org, Lin shenghuan <410860423@qq.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Lin shenghuan <410860423@qq.com>

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
