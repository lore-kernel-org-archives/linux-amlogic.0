Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75C3ECAAD5
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Sep 2022 19:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3HyH/D3lgp8MVAn9uuJCUc9O4kawJhcu/HoGOsSNC6Q=; b=Jde+eFkFN7IE+3
	3fkBpFjLWPiqFt0DBiYAWIDW9Mj8lQbjsXcvWeiVDO8qe10qnSESoMx4cvfKgfBPQUsqdbsjsBV8O
	3IBRoM6rOqvQNdDjPVSPc+Yt3lQf+XkNBSGS++JD2X1ae2/vBPv1OX3jw8miQwu/M9dJCKFwDBKxv
	//ztQOkt+VKVWpTI3O8iwOc4Pg8vvw7TaI3FcPggxLgfenxYzTXVOc8G0g2Eoy3NcS+lOmpZWVl/Y
	i7slJuN1xORLXj7dFkBL8G3qSUJCQ39aURBPPJRdz0XUBJ1doD+bRURc8o1ME3tz4Id+0YcWIB2ju
	x5T8xQMhWuMmhonWm9xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVHW9-0091lW-1r; Mon, 05 Sep 2022 19:12:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVGOl-0082Dt-Fk; Mon, 05 Sep 2022 18:00:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=7dJzNmEctmiXF01ixncmL2lsN3CZmKMezu7IaD1SNcU=; b=ZfXZ+AqigK8PrA36yf/gycbFmU
	IUwEszDNtwqsVI6LMwo7NW2C0Ud9urJ+INs1Kkcm/qhngt0YxhF+2bOxTR24cMsvsTZgqaE4298mz
	nZ0EOCkZxpOt+B5gqNv9QqxL2zWjdjnWrDbcYh5BKvPNowaVGQtZZkLrHz1vUPWY5vun4RZqjdQoC
	PMIUfPaq5f9h2piPn0BfLXo29CFftpP9K9xXcHUFkk7Ci1/ah5yxJ94zcV1ElEhYlcurzMo0Xuyiz
	fXDfvYzUagtyslZUyF1qqQXRQvCtFZn7ZmyKXYElF1qR3AFfASv63s+1I2+fTku8CNDRBo4iCKNSN
	eRn5uRSA==;
Received: from mga12.intel.com ([192.55.52.136])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVGOc-009tt1-4I; Mon, 05 Sep 2022 18:00:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662400830; x=1693936830;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Eh/xw1+J5xp9FOGQqFCGHq3ic13Sy42VEYyyfiqZmHo=;
  b=Cr5pispcrmZ7oxjBm1X8OWeOEPM4M0z7jysh0ONzSWpW02qQr4sDRGje
   nKZ6EGmzKG26Qst68svpZ+sS31imTaJHaA50z45T0qPUC0dq8qX0mNoHK
   zPac6h0gnAdvY4YGnLbDCV5dajk0Hu1hNLZ34sLGeyKXhAbqkzmyTd4LX
   pRGF+qm2trwBovjfSoxJv6eQe+gNIOKxgjlvB4XjxmRzs14zw1z6UixKM
   fn9af/47XnJTbhCW2J46WUuGYF7Ws7CenVzKRtxQJKJfH7JsnOl1gYoJ/
   LdqDY8GnrNUGP9yxbuzQ5QwXiStQ31aQL7JBSXdysUGqXL1yr49ndGeL+
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10461"; a="276174064"
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; 
   d="scan'208";a="276174064"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2022 11:00:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; 
   d="scan'208";a="590991845"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 05 Sep 2022 11:00:19 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 4E3D0101; Mon,  5 Sep 2022 21:00:35 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 1/1] pinctrl: meson: Switch to use fwnode instead of of_node
Date: Mon,  5 Sep 2022 21:00:34 +0300
Message-Id: <20220905180034.73132-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_190030_807178_A2DF6202 
X-CRM114-Status: GOOD (  11.66  )
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

GPIO library now accepts fwnode as a firmware node, so
switch the driver to use it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 7 +++----
 drivers/pinctrl/meson/pinctrl-meson.h | 4 +++-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index cc2cd73ff8f9..530f3f934e19 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -608,6 +608,7 @@ static int meson_gpiolib_register(struct meson_pinctrl *pc)
 
 	pc->chip.label = pc->data->name;
 	pc->chip.parent = pc->dev;
+	pc->chip.fwnode = pc->fwnode;
 	pc->chip.request = gpiochip_generic_request;
 	pc->chip.free = gpiochip_generic_free;
 	pc->chip.set_config = gpiochip_generic_config;
@@ -619,8 +620,6 @@ static int meson_gpiolib_register(struct meson_pinctrl *pc)
 	pc->chip.base = -1;
 	pc->chip.ngpio = pc->data->num_pins;
 	pc->chip.can_sleep = false;
-	pc->chip.of_node = pc->of_node;
-	pc->chip.of_gpio_n_cells = 2;
 
 	ret = gpiochip_add_data(&pc->chip, pc);
 	if (ret) {
@@ -678,8 +677,8 @@ static int meson_pinctrl_parse_dt(struct meson_pinctrl *pc)
 		return -EINVAL;
 	}
 
-	gpio_np = to_of_node(gpiochip_node_get_first(pc->dev));
-	pc->of_node = gpio_np;
+	pc->fwnode = gpiochip_node_get_first(pc->dev);
+	gpio_np = to_of_node(pc->fwnode);
 
 	pc->reg_mux = meson_map_resource(pc, gpio_np, "mux");
 	if (IS_ERR_OR_NULL(pc->reg_mux)) {
diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
index b197827027bd..34fc4e8612e4 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.h
+++ b/drivers/pinctrl/meson/pinctrl-meson.h
@@ -12,6 +12,8 @@
 #include <linux/types.h>
 #include <linux/module.h>
 
+struct fwnode_handle;
+
 struct meson_pinctrl;
 
 /**
@@ -131,7 +133,7 @@ struct meson_pinctrl {
 	struct regmap *reg_gpio;
 	struct regmap *reg_ds;
 	struct gpio_chip chip;
-	struct device_node *of_node;
+	struct fwnode_handle *fwnode;
 };
 
 #define FUNCTION(fn)							\
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
