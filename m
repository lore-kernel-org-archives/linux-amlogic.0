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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 269E5C2D0E4
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2020 03:54:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEB62208CA
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2020 03:54:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rlBh68Jk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=qq.com header.i=@qq.com header.b="s/Za6tb9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEB62208CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=qq.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Subject:To:From:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+kkx+HcI00cJwMq7jjWhj8VL0lrJ6skCB8AXdOC1V7Y=; b=rlBh68JkonKwn6aOqzTkCn22uP
	is6IshZrVXPWTgko1g5MPsifgpozlDuPACnsNZ+VofWhem7bLaxAQGlBeYR2UP5AeM6Qv/2Dkl8Xh
	L2cbGroBMQ2e9K2zZ1ZLww0rVlfudWtUJLSvng/lJT6mS6FNry4rIflUDvNlUwQ6z7ko6Tie6L7Tb
	im/LUszEVmhCIRopPTZt2H0vRnmlZbSZ5ZJwm9K+luChk5+Gj4dRBUiNZ4HjS3xjm1yrwgalAvx7d
	R+FzbNCxFV4N9V1o0qY7E7F1MXAwbSZc5ddpS0dBdkBVPro0N4UzsJrwQTZbRrX06JOnyPkzTTZeO
	f5nOODpA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiUqF-0000lR-Se; Fri, 27 Nov 2020 03:54:40 +0000
Received: from out203-205-221-209.mail.qq.com ([203.205.221.209] helo=qq.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiUpy-0000gB-FR; Fri, 27 Nov 2020 03:54:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1606449244; bh=cmUIRKiRCpniorIV6kOGuePdPfrh9Fgr6eJkwXgC6ko=;
 h=From:To:Cc:Subject:Date;
 b=s/Za6tb9US0j53ukITydjn2yfSLovX+KJ8IJV+H+IUGD/ePfKUDif0CJ2wga88n/w
 JGTzVC5WBHTnc3uppBieuwXxFK9xRSFBrz/Afd7T1RoyjV6GqXmyjA8lKEZXiVfS1v
 cbxM21gYVhALgL8X2oKqNi2CSduVzokDBZokZXJc=
Received: from localhost.localdomain ([115.238.52.186])
 by newxmesmtplogicsvrsza5.qq.com (NewEsmtp) with SMTP
 id D81356EC; Fri, 27 Nov 2020 11:54:01 +0800
X-QQ-mid: xmsmtpt1606449241tcjkkzfx6
Message-ID: <tencent_26D5AA0FBB4C8A49970902A0B29582281206@qq.com>
X-QQ-XMAILINFO: NvLWmUiDNnOAYYp+HAKicFIjUUdEdXNnTbfVmml1THFfXzxVVcxY76QkIZQlJF
 BMYoQeYDIss1uxtqeOue5raPt3rvdg6nKDcPQiTJJq1mSDWEDpdJduPogNTl2GEpKyP6T3Hya0sE
 2Xl88yefzbqaazYKwg9tLtCATOmagyRfZGjO6O6WMhWuAqI1RQ449Qry0jRhw+NKwLbNNH9rZBzy
 8KZZ+JpP8RLbbAYrYel1/t4V38I+YLrH8huq3riV1GqzGYIOaRjfb22pulKHJiML/OH7hh0cplCU
 QnX3Gz4dIMsXjbQ42WXPUuwYJJoV9La65SYDwbC4iTW1Axs+fGRARJsl2isGoJF8TZLjtsLQHB5v
 LAWeJqu62FbNWAjYDFHGZfa8sm4+qWsrxMOzAe2n0GvdRcGjo3Un3lpHXF3wnj5sflOtCRNZzdRD
 /Rkgmk0vYB6F1PQAiedDm/O4OZ7/70P4J6/eVb4eBc3tJkmNC8sUMG/z/BUq1kT1ru0FgaZGEuQH
 XPlKkMhf3ZMVD3/49sLKUmoL1KRNZvBA+nzNV/s6KgAGmeNUu22Ces6ik80BMheMZ4AMZ+IlFOk7
 fg1dAJU2I0CixPufZGVrE4aguPIiJUc5/gKdREEoBMkzR/ZYrj10QrLRFCxv2LJoLT+lrx5LmfEw
 Vh5cRoQVvmOaDGiCNX10UIbgww5sMq6vnDWMaE8r0Df0q0V/a3fhldhefHaS06U6TuuN4KwKeu/Q
 7i0taA/ejWP6zi0/kagS40wNGBZkNtXx5L5cuY6ytzn811emQMBYHMFZ3YZJdTKrWZ7vbJG18nLf
 bVM9GTVF7wJg==
From: 410860423@qq.com
To: linus.walleij@linaro.org, khilman@baylibre.com, narmstrong@baylibre.co,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 linshenghuan@hangtu-china.com
Subject: [PATCH] add amlogic gpio to irq
Date: Fri, 27 Nov 2020 11:53:59 +0800
X-OQ-MSGID: <1606449239-27057-1-git-send-email-410860423@qq.com>
X-Mailer: git-send-email 2.7.4
Signed-off-by: Lin shenghuan <linshenghuan@hangtu-china.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_225423_260029_D5C2B5A1 
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
