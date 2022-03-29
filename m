Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5FFC433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Mar 2022 15:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2fsoaOfPagkiqovGWuqOxG5ckRbeaqWgC6tEDZqzk2Q=; b=uvAzRHGKjXkg5M
	oaMpp9oF3IF9ManV2DaF2YdArbttRGfb9MyIhXB6oGbiTLuaNGR/1/65KgZcQP94QdvSmxABl9cRw
	I/IDVn0FEsI+vmvn4lWniqNLmXGXED1rOEe2YnV8hMJabM0wygKKDALOtf1nC/OoH7v6VaV5sSm5c
	xMuGofDsqxC7I/Tfb7ZT1nD2kxdcFUFY2fVO/8X0cjpPbkwHmUQ7VsZXmcx6fsjtt6pBV81tCXcpV
	LbL2GXuSvXgP6mipNLOrsn4zFYoXM21wVS/d49RRf8UJcKS2tiC6TFBMTB1+n1Yd5VeqM4o5/SDsQ
	o0J89Ipt+p8SIKJloCuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZDn7-00Cg10-D3; Tue, 29 Mar 2022 15:29:53 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZDmW-00Cffs-VK; Tue, 29 Mar 2022 15:29:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648567756; x=1680103756;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DNunbYDvPM71E+oAn/SOKUWabTWxhBKKB0W3yFW6B0c=;
 b=bjOmGtbIwl5B9iEEPikudLtvoL4m23hYlRzPC5NQwrAs25FMYKbDvQg8
 pujaMaCgQvYfPGK0GXfitvCZLlgbWezZzcFOINmf4NZwVKBp7YHwZsGSt
 9NGnCUrENozqv7tJ7hGSeBp6+HOGhoc7bwcKWC0wJpROFCkoGPJzxOkEf
 bK0+cIZvkBWUDCBJypuWE9lKSm1E76bL2DbXY0MkiM9tR9F90FjaQSUYl
 I2NPsPRrZcHSBX2giaQMSBkZYf0RwpY1LABNsF877CjEtpgJPR8XE1uCa
 pQDJd/7rKXZH56UqcXo1QoNV1C8SNb1lFLktJGsUmgpyJ0j+vLv9neF4s g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="239207791"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="239207791"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 08:29:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="653044837"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga004.jf.intel.com with ESMTP; 29 Mar 2022 08:29:07 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 17FB01A1; Tue, 29 Mar 2022 18:29:29 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Qianggui Song <qianggui.song@amlogic.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v2 02/13] gpiolib: Introduce gpiochip_node_count() helper
Date: Tue, 29 Mar 2022 18:29:15 +0300
Message-Id: <20220329152926.50958-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
References: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_082917_108942_76985C54 
X-CRM114-Status: GOOD (  10.28  )
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

The gpiochip_node_count() helper iterates over the device child nodes that
have the "gpio-controller" property set. It returns the number of such nodes
under a given device.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/gpio/driver.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index e6b9c17614ef..bc2ea9f65022 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -755,4 +755,16 @@ static inline void gpiochip_unlock_as_irq(struct gpio_chip *gc,
 	device_for_each_child_node(dev, child)					\
 		if (!fwnode_property_present(child, "gpio-controller")) {} else
 
+static inline unsigned int gpiochip_node_count(struct device *dev)
+{
+	struct fwnode_handle *child;
+	unsigned int count;
+
+	count = 0;
+	for_each_gpiochip_node(dev, child)
+		count++;
+
+	return count;
+}
+
 #endif /* __LINUX_GPIO_DRIVER_H */
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
