Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC839C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Mar 2022 14:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/tp6toumOjLy6ooFeiBFffYU1VjdGTuIfYJ400cvq4Y=; b=aNW5xBGeiRvtgn
	BZ+C27SSU95FOYTQqnYBStmBkHawLETFmGat1/ZyjlRtRmMRwZs3nP1BPlnRCiXYvMVymE+hp+cdr
	WctuCztnQQp0WX5G6P+iDixrXO+anGbfmqVZs5aFXzpomAR6PaoJW4zpluBlmzGP4YJRmAxx+Z9qn
	xrdVH9aekpCY4DB7AnEgR25+tFAt9BeSZteL7I9Ax4qmqCV2hL3S7sYx9mECjw7mnVsuc18VK2AHo
	RjGteq9S16Yk0cqI+/RGI2yxrayigCL79XX4qd2CzDK01/jTFNoJ/XldZ8Nwea49DCYSlTyYPqcbN
	uaWvKvjdd4U4UZYUgyoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZZfh-00GJ9O-Ut; Wed, 30 Mar 2022 14:51:42 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZZeT-00GIY9-7E; Wed, 30 Mar 2022 14:50:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648651825; x=1680187825;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DFJ8vSWxdkQP5rCMWcqpqf0iMOqCrH1H7hLKYmjSIpU=;
 b=PB1I+vRD3cXxE7aA3W6FmGaCZjtn/NiUJcCjGjGgnOsPkUF+7Phw5gGY
 OPAghVn4Ql8ylAGY2+Uew6v5i44z06cuJaRQ6KFSLYM8haiKur+Yji6Cp
 uR05AZe96GKVo1QWyaBc+FfHjDnegAXsS+/SMYOoITyZV/vi/78t40Jxz
 U632yUHrT1Kl5LZe38IRQ17m6U4FB4hfRP90HwljhFVoDdk9fVcLW7jTg
 MQxcEfA+C+G9eaMPZ3TU94eyau9jJcJqWtA9suduDywcq52GnL1S6JIr1
 7PUNoWKpXkO158mRyuTcb7Hnh4tfOcwCFNV0QtWFgGMtOGqFUwoLKJjy0 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="259533305"
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="259533305"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 07:50:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="618556021"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga004.fm.intel.com with ESMTP; 30 Mar 2022 07:50:11 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 3232C1C3; Wed, 30 Mar 2022 17:50:33 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Qianggui Song <qianggui.song@amlogic.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk@kernel.org>,
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
Subject: [PATCH v3 02/13] gpiolib: Introduce gpiochip_node_count() helper
Date: Wed, 30 Mar 2022 17:50:19 +0300
Message-Id: <20220330145030.1562-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330145030.1562-1-andriy.shevchenko@linux.intel.com>
References: <20220330145030.1562-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_075025_374621_B7F810C8 
X-CRM114-Status: GOOD (  11.82  )
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 include/linux/gpio/driver.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 2142ffc7338c..e38565a5056c 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -752,4 +752,15 @@ static inline void gpiochip_unlock_as_irq(struct gpio_chip *gc,
 	device_for_each_child_node(dev, child)					\
 		if (!fwnode_property_present(child, "gpio-controller")) {} else
 
+static inline unsigned int gpiochip_node_count(struct device *dev)
+{
+	struct fwnode_handle *child;
+	unsigned int count = 0;
+
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
