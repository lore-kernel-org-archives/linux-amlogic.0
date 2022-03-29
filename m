Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B30C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Mar 2022 15:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k+bXcbCtFw5g2Nwim54PzqOPwMNXpOqdU2ZG/0rbT4A=; b=Mkx8oOQedZuA6z
	+szzXq8+JUGVZmuu7GU2Cv6LL3D9SkbtGLveVTj0iH/DMsvWkr5Fxzr7d0WzU680TqyIAvMmTX0Jd
	vAUYuHW82y0cmv9eaU40CypVQmapPNQNifPoxvn74eVkmimO5fNvchQFmdIfnW4fJ63dRbGuxEJzd
	EKvIpnuhBt/HleGdX7+WVvvjhvRxORACRQgTy7jsjNCl82RH0m/NePq3nfj5t7GzNOoew2VEVz8qI
	H88m5/UjzCXYSZfcK1hnXJ0/jieSxAoQoCH+kWpnXpDk9R4eTma6rFhYkj7oyV3M8h7J3LVF71j4h
	QadyF/P8wBqXmZlawjJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZDoN-00CgYl-Pe; Tue, 29 Mar 2022 15:31:11 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZDme-00Cffp-LV; Tue, 29 Mar 2022 15:29:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648567764; x=1680103764;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zth2NPzVb/e4coajK8vBX+xb9WOqFJZLqpzxI+yuerA=;
 b=QfCOBaGQ3e5HxT6mGmzmkcOJvs5gWJRE+QvoteGSlSYQWSc1hghzGaSc
 f36AGilfx5zCF/gNWbO1fs9OSJqoi2kXVW4FTGP0zE80/oRMHyDVuA7w2
 L1413s9AWGlcc4W7a2gvBZQ5EATCHumH+g8Ukr+qQHSxnX1C13pYEEsxN
 GjlwYDTmhJC64fXYGeTuDWNc9/jzMNb7CFVhQ93Ct0JUAO4uDP/q12a/T
 QNi/VVTFZ5sOugPN9Cyb9wo7Hz7cFZfExRtv6JKjs+F+IZpfQ0WO3uTRO
 Ub6tXDZ2uEFdxIahj1/OmpCmvoz3hAfWwKjoM8L/JxD/LJu//ILuqvFjT Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="246767237"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="246767237"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 08:29:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="554297180"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga007.fm.intel.com with ESMTP; 29 Mar 2022 08:29:16 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 512A72FB; Tue, 29 Mar 2022 18:29:29 +0300 (EEST)
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
Subject: [PATCH v2 06/13] pinctrl: renesas: rza1: Replace custom code by
 gpiochip_node_count() call
Date: Tue, 29 Mar 2022 18:29:19 +0300
Message-Id: <20220329152926.50958-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
References: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_082924_853404_CCAFE617 
X-CRM114-Status: GOOD (  12.74  )
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

Since we have generic function to count GPIO controller nodes
under a given device, there is no need to open code it. Replace
custom code by gpiochip_node_count() call.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/renesas/pinctrl-rza1.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rza1.c b/drivers/pinctrl/renesas/pinctrl-rza1.c
index 8bad121d2a4e..5075d5cebe8c 100644
--- a/drivers/pinctrl/renesas/pinctrl-rza1.c
+++ b/drivers/pinctrl/renesas/pinctrl-rza1.c
@@ -1154,21 +1154,6 @@ static const struct pinmux_ops rza1_pinmux_ops = {
  * RZ/A1 pin controller driver operations
  */
 
-static unsigned int rza1_count_gpio_chips(struct device_node *np)
-{
-	struct device_node *child;
-	unsigned int count = 0;
-
-	for_each_child_of_node(np, child) {
-		if (!of_property_read_bool(child, "gpio-controller"))
-			continue;
-
-		count++;
-	}
-
-	return count;
-}
-
 /**
  * rza1_parse_gpiochip() - parse and register a gpio chip and pin range
  *
@@ -1255,7 +1240,7 @@ static int rza1_gpio_register(struct rza1_pinctrl *rza1_pctl)
 	unsigned int i;
 	int ret;
 
-	ngpiochips = rza1_count_gpio_chips(np);
+	ngpiochips = gpiochip_node_count(rza1_pctl->dev);
 	if (ngpiochips == 0) {
 		dev_dbg(rza1_pctl->dev, "No gpiochip registered\n");
 		return 0;
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
