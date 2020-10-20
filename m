Return-Path: <SRS0=scox=D3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BC2CC433E7
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 07:25:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB7B12224B
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 07:25:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vKqgtZR6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="NSkbzTZO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB7B12224B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+yhDrVYq/i/tCP5B+DSCA9iQ+7uGoaS+x0eQFuB4tQU=; b=vKqgtZR6wRxOWc6VQC2vfrPPB
	d+9vKt9/3yTbXaMATXxrm6GW1GN9p6lr/HPIpspiyb/Pg1S82oUxLnTMuMw1T1F3Y/tonfCFx8E4i
	Y8fIqhySvvuZIGo3WafNtYuO46jNEYJoX+/aDjiMJrDVxf3Ujz2AbCIt0Lmblo2atfVuj0F7KuciJ
	nMcgFZEYH8pJVGw/7qNlUI2mWzIHxL3LQr5RH3b43j8rsUp0leCNbMETXx13YjIMZB5joGOgvRv7B
	7pvz1zdtvW/sH0d/whG4l4JP1LA9uW/c7SCAsGgEaY7r3g3yltA+xuj9/PQiqIoA4TRKBxSIRh5ev
	FAZ9jRvGA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUm1l-00081r-Ae; Tue, 20 Oct 2020 07:25:49 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUm1b-0007xk-6y
 for linux-amlogic@lists.infradead.org; Tue, 20 Oct 2020 07:25:40 +0000
Received: by mail-wr1-x441.google.com with SMTP id h7so811067wre.4
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Oct 2020 00:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5VVp9f2mNGJBAPSam5WAwT9+D2hhOYou5JVDpyV+vTE=;
 b=NSkbzTZOOWvKxO+K8beU0TuLtC+EhYTVh4cLRQfh07M7CeXj01rirwDHwhv03iukUI
 6Eham2e0OYUeeGdLnLS05txGs1E4dJjEecyYBFchFd8kpidB8TwFBAGBSLN9evwx/LrH
 IyU0ZlNbzKhWzmzJbRXUEHb5fYP5iE7ESljMWz5NxJqaPcbo23B3xiRx/7FRtvcNxbPU
 9K0yBkRb/EvtSSFv10okNilxl2YR6nrQUgCQb0btTeHy/TvrqJxTPV+ZG7oWTD7U60WH
 WV2FwUtCcv5udgwZB9LZ7eEDsGVIGskjNYfv+vnPGBoOIOuF7ZgtsQfljv4jY99wNI8h
 EupA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5VVp9f2mNGJBAPSam5WAwT9+D2hhOYou5JVDpyV+vTE=;
 b=A0KMRjQMYaT7TKHTZywZXLCTRz7Ass3Bvwu411VSf4VFhX4hk1G8saz6iKtlGcW7lu
 nkJd+l+2RfRdjfBAt1JEn2KJEW5MSyExZ0GXlWqI0CdTzoxnsWC4dX7F4iiO9AIcvwTz
 lot5CkdISMn2G3gjt+T6AOuB3ZRxHvvJIZdxQaO4Ewxxr4z+/FQkKASxrVCsS9zpSI0Q
 BWDIT9v8vydn6Wucp7nAhe3dfe9nKyu6onazrYlrbVkMprK/v3gRb4NIBDA/YcBh9WjX
 QNZt1YMtNxU+to4GE9wpNaX2GP/z6sXc1NgJEGJ9uGT45ifBLy//VIsw2RYgIF5f8YpA
 hAyQ==
X-Gm-Message-State: AOAM531rlVI4wA9DeWfX7BUfCnJF1/b6AniGR4SSwQmKA2dJecDGx3VR
 xj8P3lCnOYPVHHqWG/qjoYvM9A==
X-Google-Smtp-Source: ABdhPJyORIB9h8Z8aEJH+MxJnEe9wdeWTY1kS1pNnj75OXxGJTFJmRZev/Gi14x7t/L+Uewe1kfpyg==
X-Received: by 2002:a5d:63cb:: with SMTP id c11mr1706150wrw.243.1603178738057; 
 Tue, 20 Oct 2020 00:25:38 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:3c62:4f82:8f5f:de74])
 by smtp.gmail.com with ESMTPSA id j5sm1487325wrx.88.2020.10.20.00.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 00:25:37 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: maz@kernel.org
Subject: [PATCH 1/2] irqchip: irq-meson-gpio: make it possible to build as a
 module
Date: Tue, 20 Oct 2020 09:25:31 +0200
Message-Id: <20201020072532.949137-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201020072532.949137-1-narmstrong@baylibre.com>
References: <20201020072532.949137-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_032539_383054_DB698F19 
X-CRM114-Status: GOOD (  21.53  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

In order to reduce the kernel Image size on multi-platform distributions,
make it possible to build the Amlogic GPIO IRQ controller as a module
by switching it to a platform driver.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/irqchip/Kconfig          |  5 +-
 drivers/irqchip/irq-meson-gpio.c | 89 ++++++++++++++++++++------------
 2 files changed, 59 insertions(+), 35 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index bfc9719dbcdc..04fbae99a429 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -410,8 +410,9 @@ config IRQ_UNIPHIER_AIDET
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
index bc7aebcc96e9..e3b462bd3981 100644
--- a/drivers/irqchip/irq-meson-gpio.c
+++ b/drivers/irqchip/irq-meson-gpio.c
@@ -15,6 +15,7 @@
 #include <linux/irqchip.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_irq.h>
 
 #define NUM_CHANNEL 8
 #define MAX_INPUT_MUX 256
@@ -136,6 +137,7 @@ static const struct of_device_id meson_irq_gpio_matches[] = {
 struct meson_gpio_irq_controller {
 	const struct meson_gpio_irq_params *params;
 	void __iomem *base;
+	struct irq_domain *domain;
 	u32 channel_irqs[NUM_CHANNEL];
 	DECLARE_BITMAP(channel_map, NUM_CHANNEL);
 	spinlock_t lock;
@@ -436,8 +438,8 @@ static const struct irq_domain_ops meson_gpio_irq_domain_ops = {
 	.translate	= meson_gpio_irq_domain_translate,
 };
 
-static int __init meson_gpio_irq_parse_dt(struct device_node *node,
-					  struct meson_gpio_irq_controller *ctl)
+static int meson_gpio_irq_parse_dt(struct device_node *node,
+				   struct meson_gpio_irq_controller *ctl)
 {
 	const struct of_device_id *match;
 	int ret;
@@ -463,63 +465,84 @@ static int __init meson_gpio_irq_parse_dt(struct device_node *node,
 	return 0;
 }
 
-static int __init meson_gpio_irq_of_init(struct device_node *node,
-					 struct device_node *parent)
+static int meson_gpio_intc_probe(struct platform_device *pdev)
 {
-	struct irq_domain *domain, *parent_domain;
+	struct device_node *node = pdev->dev.of_node, *parent;
 	struct meson_gpio_irq_controller *ctl;
+	struct irq_domain *parent_domain;
+	struct resource *res;
 	int ret;
 
+	parent = of_irq_find_parent(node);
 	if (!parent) {
-		pr_err("missing parent interrupt node\n");
+		dev_err(&pdev->dev, "missing parent interrupt node\n");
 		return -ENODEV;
 	}
 
 	parent_domain = irq_find_host(parent);
 	if (!parent_domain) {
-		pr_err("unable to obtain parent domain\n");
+		dev_err(&pdev->dev, "unable to obtain parent domain\n");
 		return -ENXIO;
 	}
 
-	ctl = kzalloc(sizeof(*ctl), GFP_KERNEL);
+	ctl = devm_kzalloc(&pdev->dev, sizeof(*ctl), GFP_KERNEL);
 	if (!ctl)
 		return -ENOMEM;
 
 	spin_lock_init(&ctl->lock);
 
-	ctl->base = of_iomap(node, 0);
-	if (!ctl->base) {
-		ret = -ENOMEM;
-		goto free_ctl;
-	}
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	ctl->base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(ctl->base))
+		return PTR_ERR(ctl->base);
 
 	ret = meson_gpio_irq_parse_dt(node, ctl);
 	if (ret)
-		goto free_channel_irqs;
-
-	domain = irq_domain_create_hierarchy(parent_domain, 0,
-					     ctl->params->nr_hwirq,
-					     of_node_to_fwnode(node),
-					     &meson_gpio_irq_domain_ops,
-					     ctl);
-	if (!domain) {
-		pr_err("failed to add domain\n");
-		ret = -ENODEV;
-		goto free_channel_irqs;
+		return ret;
+
+	ctl->domain = irq_domain_create_hierarchy(parent_domain, 0,
+						  ctl->params->nr_hwirq,
+						  of_node_to_fwnode(node),
+						  &meson_gpio_irq_domain_ops,
+						  ctl);
+	if (!ctl->domain) {
+		dev_err(&pdev->dev, "failed to add domain\n");
+		return -ENODEV;
 	}
 
-	pr_info("%d to %d gpio interrupt mux initialized\n",
-		ctl->params->nr_hwirq, NUM_CHANNEL);
+	platform_set_drvdata(pdev, ctl);
+
+	dev_info(&pdev->dev, "%d to %d gpio interrupt mux initialized\n",
+		 ctl->params->nr_hwirq, NUM_CHANNEL);
 
 	return 0;
+}
 
-free_channel_irqs:
-	iounmap(ctl->base);
-free_ctl:
-	kfree(ctl);
+static int meson_gpio_intc_remove(struct platform_device *pdev)
+{
+	struct meson_gpio_irq_controller *ctl = platform_get_drvdata(pdev);
 
-	return ret;
+	irq_domain_remove(ctl->domain);
+
+	return 0;
 }
 
-IRQCHIP_DECLARE(meson_gpio_intc, "amlogic,meson-gpio-intc",
-		meson_gpio_irq_of_init);
+static const struct of_device_id meson_gpio_intc_of_match[] = {
+	{ .compatible = "amlogic,meson-gpio-intc", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, meson_gpio_intc_of_match);
+
+static struct platform_driver meson_gpio_intc_driver = {
+	.probe  = meson_gpio_intc_probe,
+	.remove = meson_gpio_intc_remove,
+	.driver = {
+		.name = "meson-gpio-intc",
+		.of_match_table = meson_gpio_intc_of_match,
+	},
+};
+module_platform_driver(meson_gpio_intc_driver);
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
