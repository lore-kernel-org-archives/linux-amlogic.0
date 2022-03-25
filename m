Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A060EC433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Mar 2022 20:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WTisfVvK8IAfCjVBZFKD926zm9LKHYzDzWYKYb/iwZU=; b=uo5/GDafvG5Skm
	0ntQBhFMsnHscdNjUcMspbLYQ7ZHE75Fh474oVEcWlo0Da7QZReDldwEfHJjKF/UOLGZpa6bPPjdF
	32jE0TqXDE+iK8hDHUqPuJ9CyAP3/mMp8v6QzEv5cNOZJyTHqk6lNGOL27T3fw1EAh1NXXkYrwAq/
	3MrZPva8dmazFlf9qcLNAQN3BSG1/avfj/ruQVScKhgALqOB5qMMk3WLO5Brdc8PT0NgDMVwIyYHa
	2ICsKsduvjRADFF7O2wdDOskILZv1uQ/v0v//qIlDF4QhsxH6+DPSVuLj3lp50eDmoN70GjXWw2cK
	6sFyWJlw7t0Soh9Za32g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXqAp-003B6D-4u; Fri, 25 Mar 2022 20:04:39 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXqAS-003Azh-LM; Fri, 25 Mar 2022 20:04:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648238656; x=1679774656;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KugfsYLZVZCrCzDcruBf/OOyAOySyQSAT5HxYxx99mU=;
 b=Excleh5dMvhLfnv9rZBEZUjtGMsg35R3SPE4z/QpMs9xpNjmVvISFQVA
 FW+UWXvjvSOJ4AoWOQWEHFGOpQSccVlBHO9FwmfjYe0puScDFd9xeMIkr
 tjyww+lyIzs8lpVP3OHBxtFvqtdAAA/+hVekx9YFl3UlGRMITzvNqA8Hv
 xuD4d1/XwG/+Vh9VdBrsfT2kSWRV1eV+xI+hITqekQt1oQ3hamCGSooma
 7ZGTdOBKj2oCsgLQgYMvCnx3BiBSi/0AAgtDe2dzmcn/kegNfByRIXuBo
 Lz4UnDsacWvabmTVEsybo9jplCF07gfS0/DLZhFNE9e0ocifuMr1mlDQe g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10297"; a="319414701"
X-IronPort-AV: E=Sophos;i="5.90,211,1643702400"; d="scan'208";a="319414701"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 13:04:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,211,1643702400"; d="scan'208";a="584576733"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga001.jf.intel.com with ESMTP; 25 Mar 2022 13:04:09 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 80AEB73; Fri, 25 Mar 2022 22:04:30 +0200 (EET)
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
Subject: [PATCH v1 2/5] pinctrl: stm32: Replace custom code by
 gpiochip_count() call
Date: Fri, 25 Mar 2022 22:03:35 +0200
Message-Id: <20220325200338.54270-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220325200338.54270-1-andriy.shevchenko@linux.intel.com>
References: <20220325200338.54270-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_130416_779712_3A683D45 
X-CRM114-Status: GOOD (  12.82  )
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
under given device, there is no need to open code it. Replace
custom code by gpiochip_count() call.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 9ed764731570..d4bbeec82c1f 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -1423,7 +1423,8 @@ int stm32_pctl_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct stm32_pinctrl *pctl;
 	struct pinctrl_pin_desc *pins;
-	int i, ret, hwlock_id, banks = 0;
+	int i, ret, hwlock_id;
+	unsigned int banks;
 
 	if (!np)
 		return -EINVAL;
@@ -1513,10 +1514,7 @@ int stm32_pctl_probe(struct platform_device *pdev)
 		return PTR_ERR(pctl->pctl_dev);
 	}
 
-	for_each_available_child_of_node(np, child)
-		if (of_property_read_bool(child, "gpio-controller"))
-			banks++;
-
+	banks = gpiochip_count(dev);
 	if (!banks) {
 		dev_err(dev, "at least one GPIO bank is required\n");
 		return -EINVAL;
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
