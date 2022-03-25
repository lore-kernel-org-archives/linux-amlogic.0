Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4002AC433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Mar 2022 20:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jvlJmrNg4szSNHhev39uXVEBxrmQqdVNkM2F+UjtB64=; b=3ooyR3tcpYs/zH
	B7+Ixbukn8UOd8HDDtI9QvkqzdT17aMb7snL1Nm24VQyR7uFwO9i5C5vBm0aDYKZ/rqEkvreBJmLB
	kBcPexUm05AEN53tPi/Uwx/+j4MDfEpRM3aknQ4Y1o3BTWXY8l9m6IiGbWf5Osm8h3pIIIH/nNGGS
	nd0Mn3nzhr29hrG06R3Bk71ytkM0KZLBwR8En1zHTLiTK5MAn0XdYRl1MTywnYAk08l2Nj/DOzdZL
	Jnxp7sYAW0AK5W83N0gpCwd5jMdMDwnz3+z+0D2VFgRsRkuBbMABUNOiDZEXidwK3PC4nqobj7jOF
	pdN4DlScqgIDfvFX/Gag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXqAU-003B0i-NI; Fri, 25 Mar 2022 20:04:18 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXqAS-003Azf-Dr; Fri, 25 Mar 2022 20:04:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648238656; x=1679774656;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=I9qL3XzxipS1lgo6CpdL7eX6zDMQG8eU8y3dPwQxX+Y=;
 b=RnflvfzP4TD30gDb/532e1dlsLDiXB+b8QDrgGZRqZVyX0kau7lnr/77
 9mMbUV0/ZKe9vHtaJoGiDbH446TRZM7aukgw1FyF4m+6yGT+nSNtJbpIR
 C65DMoEZmEZMbEHIy4KSFF708EeSU2oXh7LMokELJ2qdgxXLX11FLT84G
 7mvQn6YugE2ZRZJo9JoRCz5UsqiG/0tKlE4BEcEFv8YM3Ch/igGSpzE9v
 yNTUthWRfczfPd/fESHsZM/rDMSW7xQ51E/pIEsBj8j9YwhjbhKK79ZWb
 2nPtOFchgvBc8xn000VhErXVrHgbNf3JVXRPmfJTY2mHjSyiuz+o73BLd Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10297"; a="258900035"
X-IronPort-AV: E=Sophos;i="5.90,211,1643702400"; d="scan'208";a="258900035"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 13:04:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,211,1643702400"; d="scan'208";a="501886245"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga003.jf.intel.com with ESMTP; 25 Mar 2022 13:04:09 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 75E9F11E; Fri, 25 Mar 2022 22:04:30 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v1 1/5] gpiolib: Introduce gpiochip_count() helper
Date: Fri, 25 Mar 2022 22:03:34 +0200
Message-Id: <20220325200338.54270-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_130416_502660_30470F72 
X-CRM114-Status: GOOD (  11.84  )
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

The gpiochip_count() helper iterates over the device child nodes that have
the "gpio-controller" property set. It returns the number of such nodes
under given device.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/gpio/driver.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 894eab753fdf..52918ef5d288 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -9,6 +9,7 @@
 #include <linux/lockdep.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinconf-generic.h>
+#include <linux/property.h>
 #include <linux/types.h>
 
 struct gpio_desc;
@@ -750,4 +751,17 @@ static inline void gpiochip_unlock_as_irq(struct gpio_chip *gc,
 }
 #endif /* CONFIG_GPIOLIB */
 
+static inline unsigned int gpiochip_count(struct device *dev)
+{
+	struct fwnode_handle *child;
+	unsigned int count = 0;
+
+	device_for_each_child_node(dev, child) {
+		if (device_property_read_bool(child, "gpio-controller"))
+			count++;
+	}
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
