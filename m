Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22285C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Apr 2022 19:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lUV+cnb1ciYiDIXcpcwnBcDSbznJW2YNJ68zIZyHsCM=; b=O4lnyq7nvvT0LO
	KFEP9Nfs4M6HK4yxMWgoMWgZFreh5AUD8/T/UUp5UbHHJJPhYHK0gHFluWzjYZ0qmttNQEgImvozI
	mmd2LyCOx1F4X4jRfEWyvKYMIIVhP51VizXNbTxGo86iVTy6VsWV0s4tjGX9uBo2qicV5/UWfB7R4
	nRHpMBNVZix1+P3giPTPls0IAO0d+ee5GgvkXZkqHhauUjwtTytTbukRu4VRpy1VhLEx4r4nXPKr9
	Guso1EOx4NFo9Nn8VnXa/SZWVOSN3n8ty2FUxYRRiRHA4NA3c1ukToSU0Ix9HesHRT35MpyIH8JMp
	/Ys7b3T3Z9Mh+eR1GSkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf4kD-006xhl-8n; Thu, 14 Apr 2022 19:03:05 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf4k0-006xZf-Hn; Thu, 14 Apr 2022 19:02:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649962972; x=1681498972;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ESMOhfAIzHVEWWSaUAwTLXvAmE92GhwSV4ExM0OTanc=;
 b=YvYJcMGYnLtRarHMaSGF5NLgJq0bKhucgAQrayMfFZWlfSaYfZ2ydt76
 s4SbtJAFs274jJZr6mD+8VnK47m5dWRhgpKZTuGV4dMyJC2P7zUegNasX
 O80okfmuv/TExrYf8k/16m6koUBJi6xPWn/xtXzMSd1i7MO1qAuFUoh9G
 wQLHcM5Q2/w0FA2oRhzLNrtMgYdZm8vwKClP0uwJG03Qiu/XGcpUs6HgR
 u4dmFzk6+5RaIEv2LJQJ4PQFSpKRWLokQFLJePrDq16ZSaJVV8BWJSc2q
 tlDwu4SwXDN+yDvdlFqYWAcyfFYde4LtRMULTItIbwnbFwRuXgS+0dg1a w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="244896039"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="244896039"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 12:02:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="527515393"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga006.jf.intel.com with ESMTP; 14 Apr 2022 12:02:43 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 579E7D1; Thu, 14 Apr 2022 22:02:43 +0300 (EEST)
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
Subject: [PATCH v5 0/6] gpiolib: more helpers and fwnode conversion
Date: Thu, 14 Apr 2022 22:02:36 +0300
Message-Id: <20220414190242.22178-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_120252_701370_60C590E2 
X-CRM114-Status: GOOD (  15.71  )
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

This is a spin-off (*) of the previous work of switching GPIO library
to use fwnode instead of of_node. Here we introduce a couple of
a new macro helpers, which allows to switch some of the drivers
to use fwnode and partially fwnode APIs. As a result of this cleanup
a few drivers switched to use GPIO fwnode instead of of_node.

*) it's subset of it with a new (patch 1) helper.

Marek, Martin, can you give this a try?
This requires at least two patches for GPIO library to be applied.

Bart, Linus, I can take it thru my tree with an immutable branch if
it's the way you prefer, otherwise please suggest on how to proceed.

Changelog v5:
- dropped tested patches (this series based on them, though)
- introduced a new helper (thanks Marek and Martin for reporting an issue)
- redone Armada and Meson code using newly introduced helper

Changelog v4:
- fixed compilation of the Samsung pin control drivers (LKP)
- explained in the commit message why namespacing is good for meson defs
- added tag to one of meson patches (Neil)

Changelog v3:
- moved count initialization to the definition in patch 2 (Geert)
- replaced of_args by args, used %pfwP in patch 7 (Geert)
- fixed kernel doc warning in patch 7
- added tags to patches 1, 2, 6, and 7 (Geert)
- added tag to patch 4 (Fabien)
- renamed MREG to MESON_REG in patch 9 (Neil)
- added tag to patch 10 (Neil)
- used --base for cover-letter

Changelog v2:
- properly based, so kbuild bot may test it (LKP)
- fixed typo in the macro (Geert)
- split to two macro helpers and rename the gpiochip_count()
- tagged one of stm32 and one of meson patches (Fabien, Neil)
- unified previously standalone armada patch
- due to above rewrote the armada patch from v1 completely (Sergey)
- added a lot of a new patches
- compile tested all of them on x86

Andy Shevchenko (6):
  gpiolib: Introduce a helper to get first GPIO controller node
  pinctrl: armada-37xx: Switch to use fwnode instead of of_node
  pinctrl: armada-37xx: Reuse GPIO fwnode in
    armada_37xx_irqchip_register()
  pinctrl: meson: Rename REG_* to MESON_REG_*
  pinctrl: meson: Enable COMPILE_TEST
  pinctrl: meson: Replace custom code by gpiochip_node_count() call

 drivers/pinctrl/meson/Kconfig               |  2 +-
 drivers/pinctrl/meson/pinctrl-meson.c       | 52 ++++++++++-----------
 drivers/pinctrl/meson/pinctrl-meson.h       | 28 +++++------
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 34 ++++----------
 include/linux/gpio/driver.h                 | 10 ++++
 5 files changed, 59 insertions(+), 67 deletions(-)

-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
