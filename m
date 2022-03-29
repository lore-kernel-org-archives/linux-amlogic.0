Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D4AC433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Mar 2022 15:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=215nG6ONQm7KWVVOVb/KoEZCFTcb1mglElo2FGmnRIA=; b=2GIrbhsxGygp8x
	cnHrVJmCAfeh7MECtyMAfCr+i7tvqXF5IrTcc78b22qwG2Wq2fglBwoAiqI5ZeOxBkUfujKhyqYwL
	m6pFYgXjfsjY8r//SIxS4jhhF0V/uGFK/FtJFoBqaGg5xExmya/LlHp5VNaDEWXIgddbY7Aabr/ml
	2peVbPt9vy1+rnIgjHxFU3dDuHTfaegFbioUJG6L0zqLlRc8dajFQUC9XRYyWmAUS90MHui5/BDAa
	A904zNldyH5VQZktIaZ81axZk8XF7T1ZiRJfJPk1595S5iU7wYIZEPzMzbXziE8EsaReBm21Zm2Bj
	O071fpjmajapzRtKPAHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZDmc-00Cfiq-Pw; Tue, 29 Mar 2022 15:29:22 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZDmW-00Cffp-U4; Tue, 29 Mar 2022 15:29:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648567756; x=1680103756;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fCKfKSD0iyV78apRqDWQhujTsUEBgiS/rWxFJUbLX2w=;
 b=JYETm3ewTbChAu60nzmVqY64uYM2q4Qt7ZXICT58LGvzF5cAfzTpmCOh
 M9jeNIU/T0hqg5xDmNNtn7w3D7wOUJjnwsql8ecgksFuof4yqGnrsF6GN
 IiDD7gQLg1Iq3V1dO0tKZxDvY6fs4Q8MH4o6RBQicdXp9WruiOY6++Czl
 4YSmX+sXXS9VnxDos2JYIUJiS+yoxX6R4ls6017JbZlGLtsgBnFv3WgJH
 qV0Vvit/mkYLQwaHTnRdn2HODPVHTkwyoK2TdAt2Exrgt2VbNxmNJ4ciV
 wqMQJGMkFakoG91DHJAOixjmNhlTgvrILK/koQg5MtA01MTSJLrzm7e9j g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="246767216"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="246767216"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 08:29:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="521478476"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga006.jf.intel.com with ESMTP; 29 Mar 2022 08:29:08 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 259551DD; Tue, 29 Mar 2022 18:29:29 +0300 (EEST)
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
Subject: [PATCH v2 03/13] pinctrl: stm32: Replace custom code by
 gpiochip_node_count() call
Date: Tue, 29 Mar 2022 18:29:16 +0300
Message-Id: <20220329152926.50958-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
References: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_082917_080752_683BDB12 
X-CRM114-Status: GOOD (  13.49  )
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
Reviewed-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 92348e09af28..4043a44211f0 100644
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
+	banks = gpiochip_node_count(dev);
 	if (!banks) {
 		dev_err(dev, "at least one GPIO bank is required\n");
 		return -EINVAL;
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
