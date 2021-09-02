Return-Path: <SRS0=tLoi=NY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C517C4320A
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Sep 2021 13:49:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7898610A0
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Sep 2021 13:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E7898610A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wtNl1pOM4OujyFMIhYSASRuiJAnM8S4DLPyQnJYsyac=; b=4ZvTAHo+Gx86D1
	iAY2ajbE+hE7HGF+37kQnZP8oVEyygZwWXuFPjC6nSSzY7VLk850HQNIjLTIhL00Lc67LTrdpupBr
	rCAJFIozCaYdc8Th28UlTat/req5IOOkbbw/Q5TX4NU3NOS2sCTqOcRyUF01Y8+D/y0VQXeRnBvo9
	QbFHQAVjNLUVKIXLHCVVKMykLjk02ttB9+J2HWQ/PixeBJFnguv+zZg/djPnVZVLsNDThib/FuLF4
	zv1gzj1I34CZZsGG8rUo48cTpx64oQhd31CWNWLqupAjUZ5DknG7DGfwRmfJBGxI0MroEEdL8EvPi
	VkfWMtfnWzx/eeYv8tJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLn62-009l7z-95; Thu, 02 Sep 2021 13:49:38 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLn5m-009l36-JI
 for linux-amlogic@lists.infradead.org; Thu, 02 Sep 2021 13:49:25 +0000
Received: by mail-wm1-x334.google.com with SMTP id u15so1336457wmj.1
 for <linux-amlogic@lists.infradead.org>; Thu, 02 Sep 2021 06:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XLgmGyyZR687J/+pz/15jDHEgQqNwXfrE8ZnHHXlyc0=;
 b=s/U4La0DHAO72mHstEVJYZkY+Sl7woZBWu2/XEKvQA/h0/NyZQgtqAVy6YFkciWELy
 BLlhmx6zU1FiaNui3lrD1MLthJ8gPlntghpwessbkeNeF02j6jAZco7aiwdOY+re/1P9
 Zvs3VLsRQ/MKY0yClEmoWHtJccGvCEf0gWcRYLsytWyeQkv9RfWkWuFTbKHAhw/JxL5t
 lYyrt4ehVxO2eVgLlPoGkivtvl2rTkXFZZy+jWG22na1torgU09GjAn9IRvkUFvsbgh5
 k6fFVhoDIR6f3tWrxK+4tLCodN362fO3zo/8SeA034wovZFaN6oLP6LdjMvmGUqyKc4Q
 lcTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XLgmGyyZR687J/+pz/15jDHEgQqNwXfrE8ZnHHXlyc0=;
 b=IZveLQFfsYUpmd7g+oa7RWfWCLFlpuozF5QoKBHicrjo9OVHVwu9AsnNg+W8d6Zwpg
 IQRRKNKMEV5Whbfij+6DtYStyo02EMkZlZcVgPVTUGyKzJe0kAweprDcSNqPO+kJxIdX
 gIYGYzS4RJ//Wnd0y1hFnf/l9+vOofu7wq3ZpxpOcyZOqc8zByImUWVH46FPyyEny/Z7
 X6vMSwrqQzOix21odhxpiXXN8CmX+Zv+uaR8kSOuuF5zI38fIBBrxDzsHCoo8yOUvHod
 vBs/j3VtYm+z05AmH4HJejaxdmVrFFQfZvH5a1B2iZSeoxvm6/hThBoWXLnOzz9Y8CCt
 nn3A==
X-Gm-Message-State: AOAM530h9r42vt/fuZdwHLcFT1Vi/4/AVAvDTfSW3RONqp3w6pLCcdiD
 tyzEG9SrC081fyhTAHci18F2pmdfCqgwjRwL
X-Google-Smtp-Source: ABdhPJzt3cDjV8c6FsOPHuS6R6atUfcX4eT5ztczkK88Xo6Hhj+gjFztXP1dtqAHQ9FlK6uHq+1DJQ==
X-Received: by 2002:a1c:9a0e:: with SMTP id c14mr3253429wme.119.1630590561228; 
 Thu, 02 Sep 2021 06:49:21 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:98:6312:3c8:6531])
 by smtp.gmail.com with ESMTPSA id z5sm1710162wmp.26.2021.09.02.06.49.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 06:49:20 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: maz@kernel.org,
	tglx@linutronix.de,
	jbrunet@baylibre.com
Cc: khilman@baylibre.com, lee.jones@linaro.org, saravanak@google.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 1/2] irqchip: irq-meson-gpio: make it possible to build as a
 module
Date: Thu,  2 Sep 2021 15:49:13 +0200
Message-Id: <20210902134914.176986-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210902134914.176986-1-narmstrong@baylibre.com>
References: <20210902134914.176986-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2555; h=from:subject;
 bh=84C30OvZzmPYpljG1TMZKcBdjvYorCKoYX9ui2Be7/U=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhMNYUtoMMkoyUcXF9ZYgQAUMkwbshVYcbc9z33DvL
 HzLDCBeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYTDWFAAKCRB33NvayMhJ0SBJEA
 Ck48q8CPr4aBcPjUICsyNAEYVrQI8VMWI6rCkmXiIP6mEkUvAk4azsLGvQiVFU0nQu5S34ZxRS9L+2
 pqmC9QBvoKKzCsmzg6taPKqCCv2VcDlvqzXp0MtWhFFE3iVH5vol79Ba5hbd0tAStFJFlOaYUSfM3N
 d0vrgVgIZ3vWkzW7zYhhd4Eai3WB6XoBqe1/B28HgBIlqlVwjTaXvezSxSlPFJ9alFrDLgZki+cemM
 72ZdH86HUo/shgPXmMxFXrrLgG+YIAHLiUPjpwNJlVyu5Pbm8dZsZd9LFXUZ5k33Vml9aUGhVgEKLS
 4siWzn/Zr/nYsdl50dJ7vhiU9qeCigqZXMleg8wgy0Rdq5OENMySo5VEqUu3UOCdFu4LaGDCIKkXPT
 dyZ5S/XSIeaXarvSa1R70NVKwL2zapZZ+nbqwtK5bXByDn9Mj6c7BhSGga+io0me9vvvG7uVD0DJyK
 hLFB+ZPS3TWeXTQ2QrKUca32yJejtoruckCGqhf3hqAXUwVM5i1iVlsslMN+nXJ8LQV06llssmtmgi
 ywJjwUF2RdWLXpTv1J7ZMwY9aq3NH5KQmlO6U9n3h4AL6Ex62hyQqjXGzgm7BsuCeSLzNlBUdSoJ7k
 iEbmAnzegWBfjT6YQrZHG/V9MAx1kf9wPmKPkgBaa4QHoFTGoEEqN5dIcnLw==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210902_064922_676472_26EE40D0 
X-CRM114-Status: GOOD (  13.83  )
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

In order to reduce the kernel Image size on multi-platform distributions,
make it possible to build the Amlogic GPIO IRQ controller as a module
by switching it to a platform driver.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/irqchip/Kconfig          |  5 +++--
 drivers/irqchip/irq-meson-gpio.c | 15 +++++++++------
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 4d5924e9f766..2aba485025fd 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -400,8 +400,9 @@ config IRQ_UNIPHIER_AIDET
 	  Support for the UniPhier AIDET (ARM Interrupt Detector).
 
 config MESON_IRQ_GPIO
-       bool "Meson GPIO Interrupt Multiplexer"
-       depends on ARCH_MESON
+       tristate "Meson GPIO Interrupt Multiplexer"
+       depends on ARCH_MESON || COMPILE_TEST
+       default ARCH_MESON
        select IRQ_DOMAIN_HIERARCHY
        help
          Support Meson SoC Family GPIO Interrupt Multiplexer
diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpio.c
index e50676ce2ec8..d90ff0b92480 100644
--- a/drivers/irqchip/irq-meson-gpio.c
+++ b/drivers/irqchip/irq-meson-gpio.c
@@ -436,8 +436,7 @@ static const struct irq_domain_ops meson_gpio_irq_domain_ops = {
 	.translate	= meson_gpio_irq_domain_translate,
 };
 
-static int __init meson_gpio_irq_parse_dt(struct device_node *node,
-					  struct meson_gpio_irq_controller *ctl)
+static int meson_gpio_irq_parse_dt(struct device_node *node, struct meson_gpio_irq_controller *ctl)
 {
 	const struct of_device_id *match;
 	int ret;
@@ -463,8 +462,7 @@ static int __init meson_gpio_irq_parse_dt(struct device_node *node,
 	return 0;
 }
 
-static int __init meson_gpio_irq_of_init(struct device_node *node,
-					 struct device_node *parent)
+static int meson_gpio_irq_of_init(struct device_node *node, struct device_node *parent)
 {
 	struct irq_domain *domain, *parent_domain;
 	struct meson_gpio_irq_controller *ctl;
@@ -521,5 +519,10 @@ static int __init meson_gpio_irq_of_init(struct device_node *node,
 	return ret;
 }
 
-IRQCHIP_DECLARE(meson_gpio_intc, "amlogic,meson-gpio-intc",
-		meson_gpio_irq_of_init);
+IRQCHIP_PLATFORM_DRIVER_BEGIN(meson_gpio_intc)
+IRQCHIP_MATCH("amlogic,meson-gpio-intc", meson_gpio_irq_of_init)
+IRQCHIP_PLATFORM_DRIVER_END(meson_gpio_intc)
+
+MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:meson-gpio-intc");
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
