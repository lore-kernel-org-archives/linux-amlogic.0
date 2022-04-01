Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF963C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Apr 2022 10:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K7NBtV8kfHjRseX101lQmFDRXy9OTz8wWC8mM+9yIpQ=; b=NXdWqUkpfKViYq
	E48s0GFlzAtZpgg3m8gG+cr+8wpHdUS4P0tZXluYdRHc2dJxlaZiLLDCUO1z5Ma4YTmhkGbYi286y
	snZoGlS8zM45t8Ai7QC/vcIPP1jUNVJKX3aMrYrUU/ao92VFc9cBqb1sr0d15sR9fvosizVRWOwtH
	mVTM9EmokGZWHNsf9acB0HiQFCGM8HaAoK+F44FKkdCK9Ma/6DvQtH+NSF1dmloUoSVaADo3hkvIC
	VUFH7sHRVXRNAEJ7NiYVmHnMCJKq4Bz2S0aOUVocwXYIK+a1yNLcl9Fp8Vv33PiDYr4kxmN5nel5w
	1n02Sm+R2CLFArd1Ozsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naEh9-005F0J-CR; Fri, 01 Apr 2022 10:39:55 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naEdh-005Cqn-CD; Fri, 01 Apr 2022 10:36:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648809381; x=1680345381;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Mokh5NeYfH0tCFWB5WUbjJ/CRT9R2RJiXuGQoGrRwY8=;
 b=j1qawV3Y324rOuPSFcT0rldkAlI6S3bSgmy5BlIhDXa1/d+EHo1kkWX1
 AnzcB87X+IMn6gWBNNQXYunCtqDpT6d+xnB/D9fEpp9Hn6GdYCNhIU4+0
 rFVS9Z0tZ09/wAZIvAprc2UPTGP7KebN7+xZMZJvQ2MB83Wede0V79394
 fm+5jAf0Fe8BeGHG2daRBxVCFTL9gEFzqmY4wFeIlYdvfn2dXrTFDJzV/
 ThXONSoAccVjc/U9Xa36O5F+0w2Exi3kuwTZkpqhV9MvAsYRUYdtfVDrc
 PpX60KpVR82reN2dR5Hvx4TLdBifr+bWJgVBwjBelWVmDZipd9brlYv56 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10303"; a="258932082"
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="258932082"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 03:35:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="522726475"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga006.jf.intel.com with ESMTP; 01 Apr 2022 03:35:44 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 9A77681; Fri,  1 Apr 2022 13:36:05 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Qianggui Song <qianggui.song@amlogic.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v4 01/13] gpiolib: Introduce for_each_gpiochip_node() loop
 helper
Date: Fri,  1 Apr 2022 13:35:52 +0300
Message-Id: <20220401103604.8705-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
References: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_033621_497600_52331DA1 
X-CRM114-Status: GOOD (  11.28  )
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 include/linux/gpio/driver.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 98c93510640e..bfc91f122d5f 100644
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
 struct of_phandle_args;
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
