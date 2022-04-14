Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D24C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Apr 2022 19:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bnN3qAxI2NK97UU9Kx0xEHFylRTtboRBRMMAGetqVgI=; b=RO2gTH7GBBjQAf
	Ga8ahoTkI/EzlQUsb8b+TM5OignA75UJ3DKeovjGwDhmhAaLbNhJAr4a8+lkBCvIBl1AIe+KWiHnI
	dclHJXcZWomTr2IGxQxP8TaeeN37fGsOijWOwEZgw5tp9MdD7m/hSq6VNe6Hafq7chxy0A0Gj5Meq
	r6rdNSKarAmEE16zjhJSRTjjawzkOqfhSXmN5YSf/sAf117BIGdc1pcro2bQW56lcxK9JuCtFqCi5
	302sA0e6gVC0zNa93iEjMqk9XYZziW2vZr1I9VfMAc8PRrjQ9qLPQHTzcVHGva2lkqMIUPJ0JTWyB
	+1J/Bk103I8yNIQf/mEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf4kb-006xuv-2I; Thu, 14 Apr 2022 19:03:29 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf4k0-006xZg-HZ; Thu, 14 Apr 2022 19:02:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649962972; x=1681498972;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=abvzvPHtAqKTHl2gIEKqzUhJaatXpwBCLqpsS/ifsxo=;
 b=StB8l5lqtRn6MLx1BUCGXZ3WiqyPRJB2FF8xXwEIUvoTlR/UPNLYs28n
 f85pCJvGHNdcLj9/6fvwWOP5aw6kNbZngMN0HoOtcrGYAcle3KAYETg0I
 RJdT+KEiebYM9pafh92xOWOpLMkYUM/Ob2dtXz+8A/UQhoc+xSZHxkLrU
 kmbY8S8m900pvsrka9rpatKoindKopvQ6dLPtNg4tDG3Dg2bcCv02zQ7v
 /pJnmcwc2Xkm/6I+DhOYFH+yXGT9XXyJ6rb82Ooy384UUpkIXXHLMKWVB
 WLGrlaFyMMzTfNt+RlpgxeHZr02r/BORXjkKSvbTF5INmyYu4Z/77r5qv g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="262454982"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="262454982"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 12:02:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="612440530"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga008.fm.intel.com with ESMTP; 14 Apr 2022 12:02:43 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 63A0D67; Thu, 14 Apr 2022 22:02:43 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v5 1/6] gpiolib: Introduce a helper to get first GPIO
 controller node
Date: Thu, 14 Apr 2022 22:02:37 +0300
Message-Id: <20220414190242.22178-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220414190242.22178-1-andriy.shevchenko@linux.intel.com>
References: <20220414190242.22178-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_120252_721988_BBD88AB4 
X-CRM114-Status: GOOD (  10.04  )
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

Introduce a helper to get first GPIO controller node which drivers
may want to use.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/gpio/driver.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 12de0b22b4ef..83e2d72e51bb 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -766,4 +766,14 @@ static inline unsigned int gpiochip_node_count(struct device *dev)
 	return count;
 }
 
+static inline struct fwnode_handle *gpiochip_node_get_first(struct device *dev)
+{
+	struct fwnode_handle *fwnode;
+
+	for_each_gpiochip_node(dev, fwnode)
+		return fwnode;
+
+	return NULL;
+}
+
 #endif /* __LINUX_GPIO_DRIVER_H */
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
