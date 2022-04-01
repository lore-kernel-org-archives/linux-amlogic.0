Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D57EC433EF
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Apr 2022 10:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f+azjvydOYg0KoLLvriyEElObQHa5q69QVnoZd6A+qE=; b=wJ67gJKNnM6dRO
	Cu22m7s1Fhz6sbGMebdnUSwN3haDfjTlv7Yaw+QEs4ohMIPrg0FkUegjFOid+bJNyNibumQwvlcvs
	Pk77kq2H6o4+VaCMTsUZ4VLgb/rJGbazCGoDUuVC7sR9i0DG/2Kx4Ysya27WNwtWvXgSlpmcdKr22
	mPnyT1lr79JcREP7v5prdQMHxCa/w9tSUh6NIk9wJE3/9XxuWQYgveWBLypffgQ28BZFCzukWef42
	rEzElqshYU4yO3bJlVMdIOQ0lfm6H66ZZ4E+7nytfNS+aLo7Ee9RfkTHrjWvZLaAmR5YXHHUtMKKD
	YcsieAenkvEd53vbC+Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naEdI-005Cgv-Nf; Fri, 01 Apr 2022 10:35:56 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naEdF-005CfQ-OJ; Fri, 01 Apr 2022 10:35:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648809353; x=1680345353;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nXk4zlyXR8B57i9BaB9FWZP2fV36YlgrhivlcqXLjKY=;
 b=Y1pGTzWNTEpUUiW0MNcJBsM/Hm/Hejmww2rrtEfzwW5C0yLmYwTVEtWO
 V0rBICtyixf0rMsYhae8GIt/U5iCQVBuRDkf6VnPwGbarPq1oBk8jkj56
 4syL8AxYp4ebCpjm7/nv0Xb5kkXUb0lvDEivwgm+NnLTncG5Ula+jP+3K
 wXS8COkd7QCwJRhyUd+QRIq6e9mlCT/b0NvL0L3mNKHe4MQ6FulVivXlG
 JpZMh4tkQxkQylOnzqAJ16RKjzxiq7Z3CLs23s6NBnr7ym1yd5zWmwmyt
 wDy9DAQ3/J2Mluqgep8FJcTYLasMni9p+mLMCckt6lq2dB0LUyC1JLqKS A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10303"; a="346541338"
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="346541338"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 03:35:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="843133139"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga005.fm.intel.com with ESMTP; 01 Apr 2022 03:35:44 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 92A23179; Fri,  1 Apr 2022 13:36:05 +0300 (EEST)
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
Subject: [PATCH v4 00/13] gpiolib: Two new helpers and way toward fwnode
Date: Fri,  1 Apr 2022 13:35:51 +0300
Message-Id: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_033553_875269_BE68B50E 
X-CRM114-Status: GOOD (  13.60  )
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

This is a spin-off of the previous work of switching GPIO library
to use fwnode instead of of_node. Here we introduce a couple of
a new macro helpers, which allows to switch some of the drivers
to use fwnode and partially fwnode APIs. As a result of this cleanup
a few drivers switched to use GPIO fwnode instead of of_node.

Bart, Linus, I can take it thru my tree with an immutable branch if
it's the way you prefer, otherwise please suggest on how to proceed.

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

Andy Shevchenko (13):
  gpiolib: Introduce for_each_gpiochip_node() loop helper
  gpiolib: Introduce gpiochip_node_count() helper
  pinctrl: stm32: Replace custom code by gpiochip_node_count() call
  pinctrl: stm32: Switch to use for_each_gpiochip_node() helper
  pinctrl: samsung: Switch to use for_each_gpiochip_node() helper
  pinctrl: renesas: rza1: Replace custom code by gpiochip_node_count()
    call
  pinctrl: renesas: rza1: Switch to use for_each_gpiochip_node() helper
  pinctrl: npcm7xx: Switch to use for_each_gpiochip_node() helper
  pinctrl: meson: Rename REG_* to MESON_REG_*
  pinctrl: meson: Enable COMPILE_TEST
  pinctrl: meson: Replace custom code by gpiochip_node_count() call
  pinctrl: armada-37xx: Switch to use fwnode instead of of_node
  pinctrl: armada-37xx: Reuse GPIO fwnode in
    armada_37xx_irqchip_register()

 drivers/pinctrl/meson/Kconfig               |   2 +-
 drivers/pinctrl/meson/pinctrl-meson.c       |  52 ++++---
 drivers/pinctrl/meson/pinctrl-meson.h       |  24 ++--
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c |  34 ++---
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c   | 142 +++++++++-----------
 drivers/pinctrl/renesas/pinctrl-rza1.c      |  47 ++-----
 drivers/pinctrl/samsung/pinctrl-exynos.c    |   8 +-
 drivers/pinctrl/samsung/pinctrl-s3c24xx.c   |   2 +-
 drivers/pinctrl/samsung/pinctrl-s3c64xx.c   |   4 +-
 drivers/pinctrl/samsung/pinctrl-samsung.c   |  30 ++---
 drivers/pinctrl/samsung/pinctrl-samsung.h   |   2 +-
 drivers/pinctrl/stm32/pinctrl-stm32.c       |  80 +++++------
 include/linux/gpio/driver.h                 |  18 ++-
 13 files changed, 198 insertions(+), 247 deletions(-)


base-commit: e5071887cd2296a7704dbcd10c1cedf0f11cdbd5
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
