Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D4FCC433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Mar 2022 20:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5nv+6RnfAo3zdVoxt5TqLA1LLnlDFuaTeqD/gYqcFhc=; b=Cau60mG5+uPSm2
	+E1pTh1nk1ksBV4YLo1LB8PRfxJCNBheR+Jgj7sjZnOZFUZGOj+Lc+LvtTtdlCz9EXBZXMMl2qSTd
	XbjsiwOiI+MG+Xd7mOueOmCtwtR/EapUgWq9DAfNXOE8yCblWNgo26cp6RRchTi1OnndbVWWDxp5U
	s2muPDOlEwz+QC5HKqtGBCRd6XCE/fa3C+IeXGEdkhIYWJQSsXxYNhnCT7IfTAdy02V8nIyShpxoD
	O2IzCUAdPVHGKzBbzqrg/aHhgaiarZ9fJ5mKTkKhCNYOX3yPglojRdtbDyZUTtI0Mik2My+uPdX41
	1Bq3eYtOs0GQ71sxSb5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXqAe-003B3V-TW; Fri, 25 Mar 2022 20:04:28 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXqAS-003Azg-Jz; Fri, 25 Mar 2022 20:04:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648238656; x=1679774656;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s157fb9lA4a8XOSEq9n0q0pdUa5Gw9sK4n7L6BfC7jE=;
 b=SPrCOXHxQzgMYwokmPwL6bHmyQZvXg4N83LPvJjUxw6/esn7N9+1XEiN
 J5z6nJk0IGD6cfhxokgZx8SnHUmjA9rGuaRrJdu0RogfEeyJj9+GVD/Jf
 wHhGkaaUYENIWir4KN6Vka2kZI/ofS08zUC1vXvrtFb7vsBi1oxgLk9XJ
 kmZMvLd1oQRcb3bcLo/PkO4MTPVXn3nC/ZV3kqY3/T+E8iOcJ0fIAWiKg
 87Tkt4lfzsIigEq+qsKdxA20MLInthFuFvdkPsi4EAFN6eEeD7QQDsPcJ
 Upg3yzZDIf+t+BGh6E0B8xHykPF94H4sgcvvL91F3XvXf+WZV8NMM24m8 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10297"; a="246195672"
X-IronPort-AV: E=Sophos;i="5.90,211,1643702400"; d="scan'208";a="246195672"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 13:04:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,211,1643702400"; d="scan'208";a="638321942"
Received: from black.fi.intel.com ([10.237.72.28])
 by FMSMGA003.fm.intel.com with ESMTP; 25 Mar 2022 13:04:09 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 8C8E61C8; Fri, 25 Mar 2022 22:04:30 +0200 (EET)
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
Subject: [PATCH v1 3/5] pinctrl: renesas: Replace custom code by
 gpiochip_count() call
Date: Fri, 25 Mar 2022 22:03:36 +0200
Message-Id: <20220325200338.54270-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220325200338.54270-1-andriy.shevchenko@linux.intel.com>
References: <20220325200338.54270-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_130416_721543_394AF047 
X-CRM114-Status: GOOD (  12.95  )
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
 drivers/pinctrl/renesas/pinctrl-rza1.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rza1.c b/drivers/pinctrl/renesas/pinctrl-rza1.c
index c1d6e9512c7a..c66e72e7dd71 100644
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
+	ngpiochips = gpiochip_count(rza1_pctl->dev);
 	if (ngpiochips == 0) {
 		dev_dbg(rza1_pctl->dev, "No gpiochip registered\n");
 		return 0;
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
