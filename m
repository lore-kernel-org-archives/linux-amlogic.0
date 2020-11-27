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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AF94C2D0E4
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2020 03:53:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C4DB208CA
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2020 03:53:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Kd+H44B7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=qq.com header.i=@qq.com header.b="uq5KGMPX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C4DB208CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=qq.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Subject:To:From:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+kkx+HcI00cJwMq7jjWhj8VL0lrJ6skCB8AXdOC1V7Y=; b=Kd+H44B7YUiXJHi3zjzOFhBqc6
	PC/Sa2LLz2iAtD+Xl+gpe+HEvfPtgJzaz3ktrzh5kXaHezNF6XGF2f+78Z2N0JkVr+4DIYCXBS/zw
	Q20Zq/QZ17mJLjRF34L0sROPp9LD/l539EJMTbF2oy6tHfXIgzJPfbrtKgVxC6LzlhIOevK9UqfBt
	vKbBCPRc+MNueV1kADtiSOp/ZaPNLM43Ujib68dYOPFNk9sDlbpBjteiUiQ5IchtrMxO15SrGJRWu
	Woh+ejwQRHBb5Y9UyBvPlv7d36C28soeI35oY36zERPEYwFnVZprsA4CwKfo+h4UCsCA8n08PgrZX
	9n+x9clw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiUok-0000PV-6o; Fri, 27 Nov 2020 03:53:06 +0000
Received: from out203-205-221-242.mail.qq.com ([203.205.221.242] helo=qq.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiUoW-0000FK-3S; Fri, 27 Nov 2020 03:52:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1606449129; bh=cmUIRKiRCpniorIV6kOGuePdPfrh9Fgr6eJkwXgC6ko=;
 h=From:To:Cc:Subject:Date;
 b=uq5KGMPXWQd/k8ci5FP+SwVEWHjWH94c1+uUSezFhERNHyUfTXKY+FX0x+DfDBm81
 10F55QPRm2KrVqiI0PhghTEg8U/Se/LkqUPmBeTCx6WX2p18Pn5NKlB6NuJaKOf/0c
 DqbandAevelYk3r0bI0pzA61kgX7hytDuBGWzlPw=
Received: from localhost.localdomain ([115.238.52.186])
 by newxmesmtplogicsvrsza8.qq.com (NewEsmtp) with SMTP
 id D0780CEE; Fri, 27 Nov 2020 11:52:07 +0800
X-QQ-mid: xmsmtpt1606449127td1mb3804
Message-ID: <tencent_CF204C2A172AA4207DADEEB243A75474B10A@qq.com>
X-QQ-XMAILINFO: OamAntdBv86i9y6BogR++tZeFtQ1sJF2L3ra99pqujESyblIeFzBTLWPuKcMpJ
 bEPdFueJG58Rtrq26ukqxrQh2nYcBL3fGCGeVf9oiSpa2Fjhc9bf+fRCfj4I084oeqSoRVU5S5QH
 bAf6hm3YAdSA7WspWeUBTGHuH2vCdakOg9SGjY16mCGQtv3AzjBR0dZaPNNAW09ztArgoMkf5G7g
 jz/NH7NJpXdPQ2j2j/gbzRy86/aWkrsNVfDIBW/3vH52XJPuVpsuY6Xw26G1t2gCl1eSTYdRszzQ
 t0HSexHuaIuZnkRn7JKLHHP/d9syPxmC6PW96paBu6n1ADAfwsRUDcDZtHquuY9orxktNaZoeDLa
 2ycnPZIM0d6TFG/kufPpUXU5pb2EtYWFpfvYASGm5PDSQ8ZBn19+On7vsATBvTwCbzAHMmCgT/6N
 dKshIjytJVrtDDdkbAEVuv4EeHw7PY22luhOctHgvNnXKGP80/nMwKseSi4F1tnqmvPzQ2zV+rQ2
 PCfvvqY5rjTUkzERWiUqF+NhMZSU9uFHsEbg2rkC1oInPDoEnHSFx0UCrLqfFkoP2lFxE/EoROAy
 aq+xr1TCmHvkHPi7ogeHN/WxMwaLaYvwEzG8dntg94+5xKGb/TLSTkvTyotk/WgcqrmQQPXlpxHJ
 PpipaLxKNZKpEODvuvW9eyAX6gPeTtvpKKHFS/j6cxgvxffZwWv0iFnNABx/6ZxRh21+glFdoOjd
 LCiG+41FX/WJd7OZn6Q55BO2f3cONiC4E3bsVCcIY9v14=
From: 410860423@qq.com
To: linus.walleij@linaro.org, khilman@baylibre.com, narmstrong@baylibre.co,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com
Subject: [PATCH] add amlogic gpio to irq
Date: Fri, 27 Nov 2020 11:52:05 +0800
X-OQ-MSGID: <1606449125-26630-1-git-send-email-410860423@qq.com>
X-Mailer: git-send-email 2.7.4
Signed-off-by: Lin shenghuan <linshenghuan@hangtu-china.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_225252_926549_89F1E86C 
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
