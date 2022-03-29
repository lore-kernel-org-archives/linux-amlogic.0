Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 914FEC433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Mar 2022 15:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YPDbGiyUo6IcPkyH34Dng4kZMijNAUvXG+3tK04t3NA=; b=rDGMwCz3ROjIEj
	UWlTuymggIu0OmXAwd+2rKQoI/BbMRpXv25R12XXR8TJOBZb3kOzfydK4NlVvAoZZg1gV/Ko97D5M
	QM0c13lNZoZjUPuRPJp3sswuOuYCQpMoZTusJDU/dcOSYpA5339by14r9JvX4qSj451WSR+zIWW9B
	EbPvDibq1H3Cu5sMfB9KI8He8LQpVJxVi5lu+6gM/IoXVhh6iNv0gxP4BNOZY8zuOfM3q386POdkL
	4xMSEsMenLVZvMyVP1BVVNcMNHbrBQbAVw6pATfcRHcVn0W0G5qMvUZy9qygDP/Y1d/0eLxnMN0zW
	FkNwnfNY/01WgoYpXCzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZDmb-00Cfhv-Hk; Tue, 29 Mar 2022 15:29:21 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZDmW-00Cffr-Sy; Tue, 29 Mar 2022 15:29:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648567756; x=1680103756;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=of6aC29MFt/gFsErfEks/90Bjvx9npiRIawi0g8JJ7E=;
 b=jLX+WehhGOzHn5TQB0PwsLFr3RHG4NjgoQVkOcEV6U8oK3gBFgwJddT4
 GadjyifjnXhP6U0u+Ua/Z5B9oReNu+LM91fMFY5qx/0CtgdH++uZ/Czw8
 fdAt21zwUOWLhTU3Uz4LR7negzGnER/C0Hm2eHVQuzpw5OI25BG+zAYLQ
 kxmNmgvUytXgAQY+qELtvsZpL3+Xs937vXKuGZK9TcF8h3isO4WWDMxrW
 mdIzhnlTX+DtRvLQvlc810T5Sk3z2uwi8ehEecCCmyHFMx1QRBMoI1jmB
 Tm851g4ieZjU5rsgGq/gzFNP65UYf9nSDgP6qLe/vlxfpVbVESOKBo/X3 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="239873076"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="239873076"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 08:29:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="564710306"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga008.jf.intel.com with ESMTP; 29 Mar 2022 08:29:07 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 02BDB11E; Tue, 29 Mar 2022 18:29:28 +0300 (EEST)
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
Subject: [PATCH v2 01/13] gpiolib: Introduce for_each_gpiochip_node() loop
 helper
Date: Tue, 29 Mar 2022 18:29:14 +0300
Message-Id: <20220329152926.50958-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
References: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_082916_997242_40545F79 
X-CRM114-Status: GOOD (  10.81  )
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

Introduce for_each_gpiochip_node() loop helper which iterates over
the GPIO controller child nodes of a given device.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/gpio/driver.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index be2fc9b15cf3..e6b9c17614ef 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -3,13 +3,14 @@
 #define __LINUX_GPIO_DRIVER_H
 
 #include <linux/device.h>
-#include <linux/types.h>
 #include <linux/irq.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
 #include <linux/lockdep.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinconf-generic.h>
+#include <linux/property.h>
+#include <linux/types.h>
 
 struct gpio_desc;
 struct seq_file;
@@ -750,4 +751,8 @@ static inline void gpiochip_unlock_as_irq(struct gpio_chip *gc,
 }
 #endif /* CONFIG_GPIOLIB */
 
+#define for_each_gpiochip_node(dev, child)					\
+	device_for_each_child_node(dev, child)					\
+		if (!fwnode_property_present(child, "gpio-controller")) {} else
+
 #endif /* __LINUX_GPIO_DRIVER_H */
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
