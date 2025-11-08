Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A08FCD1292
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Nov 2025 23:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gfzR/zsi3ilibdQFYi7+IoRofwO+mtUQn8BAFQtYQUM=; b=uBcYCppAQOhvUq
	eLhPPJt/4feyiiuNM8vqUYoNmNB/0IzTjgRjMWzQGopiIsn4DV0rhCo2epJ/+iLvrl9/b015uA8Ll
	Fkov2AN/qGxYzTdvGuuV6+9Zukt+PCwQiLg/yT+d/1dKQxaFt0HBx5R/PCFm1ctv9E09svxQvwgkj
	1cYCvNVEEICncRUEefSghBVdXyWvqXlzY5SVtc7aD/KyQ/DrZwhZF2bc1GppRHR2TAgmUW69/1DzI
	0MUhRJfPjVKvQHs8x5xiflXPFTr3m+KM+u4QcSbQlOooZuQZfQnu2dCuyQx5lb6tVAqrsqqhrWl7b
	zHnuzxzy1u8YDMzQSjtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHs7c-00000003YXy-01EA;
	Sat, 08 Nov 2025 23:13:28 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHs7Z-00000003YTj-3GHB
	for linux-amlogic@lists.infradead.org;
	Sat, 08 Nov 2025 23:13:26 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-640ca678745so3503913a12.2
        for <linux-amlogic@lists.infradead.org>; Sat, 08 Nov 2025 15:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1762643604; x=1763248404; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=72U297d2NX6RO9yoD7XU9KTbdxctb0+CTvTsi0z9044=;
        b=FoQ0MZa6cgQEcICwt1GipqCB6ET+mjdMgz6oZVFT91J8IYuMBk+1XcOusdYFGADmRX
         H0vfyDZoMCcoeDOVXmE417vOUHLkWbmCukffSqhNwKqd89EUMMqOxhf1K45/MUC1Ied5
         NJ/CbCsE0KrIyDz72YbvKA6CgrOlS971KVNFR3MGf5+95SM+7LT2ZmU0vr0XiNz2QiRk
         P47J6vvRCTl6KcFWrny5vTitvjrXpRPkx4ujWDttjYSVcHoQtNF/W9tO0vZjebRey2AK
         Jp/K7miH0F8G6xxrz9sIOjoN+qxHlDZShwKmQv7loGRkmBmTHM23DaYMxs5BhiL7CV5e
         R24w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762643604; x=1763248404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=72U297d2NX6RO9yoD7XU9KTbdxctb0+CTvTsi0z9044=;
        b=WoTl1lLXSqmaKK2MjYMci61xV6TFLT6xQsJ68JHMWwz5GNicOgnkqiA/dhQ4KWmlZf
         TyFy5LGPO4zFLBuz2rOZAx/B9QWH8GE+Y8b9jHU4zx1PN1J08DJT+zS5hQVCl9O0fl7z
         A8Es4/BxzrP7S9gXQWT2IbmNwIjIzgHXEhasU8115MEd91yPRd+hxZUzaukavNjx13ET
         cPBrES/yElI08fKk1b1yxjIBnwZ3wbvpr+YCN6qp50y1227wvI2/8SNDcl4FmNY5ud7v
         AMwjVbYbfQMGfyQklZs30lG+/O7pabA2U4ascMj+tcZTHKnmeU/UzieLL1UAOLXcF3sD
         KksA==
X-Gm-Message-State: AOJu0YyBiTLXLFzoucLsHa4SU71UpcLTNfko1uJnGuOZBN3Hf2Z7Wp/b
	L9MPqKs63C6BezyJNoq/8WfZzdTBoYYS8bwfu+0Sart3+pkpApjislruvUqwHg==
X-Gm-Gg: ASbGncvllMvSe1fs26bEJi6hB98W7U24TIIHRLTOGyPyZMStaWTxK/iQjrsubGj9nE7
	6sPaG3t14ZKd4P6IBhHzMq8ANT/m5LAx5Ju0GTr8jz034QEjAPufbVYTo9oW2kymRew9JIcKH3C
	somxY2KBMnukwm1ZkS5EkN8klFBl0wOu42T3EkgwFGkhM3oA+MtOWme5itASjaQGe4RkDoI7OfP
	wOrMPdbjRq7jEcTXkJrkhp56M2/CVKA0iOpyIsLR8yuR2SKUFZXdiYJ9+2Byplnh6L6BId9+Q6o
	QZuBQZ+98cbBswCzwlvYuPCe+dNN2ebhu8hWGBYAfD2UYnWac94j6PUdzivEBrShMvZyLv2XlY2
	Ddt3PKwPSyfjQgBoMrYOE4/NY88AT3MA9/efsC48tsnkL7Mp7NR9molAtE8NwEGMpi2lQ7IO9Yn
	HKlHodAfFT85About0kOe3B8eXHivD//GXDMYTg+dgbKpckEEcx+tJWC8+3QuQTnum2n9smhXUY
	6OMKz5tKtvrilcy6xNaHBP37AcLJWmnLqG094beZ9A=
X-Google-Smtp-Source: AGHT+IHbNQTEVG2cKof3S4FeUIgLFrT/DVsyswwXVAtJnkg7b3F2iGq4VQNvhnBsPlTOOJ7clsnvPQ==
X-Received: by 2002:a05:6402:270c:b0:640:d0d9:71d3 with SMTP id 4fb4d7f45d1cf-6415dc2ea5fmr2873707a12.6.1762643603577;
        Sat, 08 Nov 2025 15:13:23 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-a9b3-6600-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:a9b3:6600:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6411f814164sm7642807a12.13.2025.11.08.15.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 15:13:22 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	linux-mmc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ulf.hansson@linaro.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 3/7] mmc: meson-mx-sdio: Refactor internal clock initialization
Date: Sun,  9 Nov 2025 00:12:49 +0100
Message-ID: <20251108231253.1641927-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251108231253.1641927-1-martin.blumenstingl@googlemail.com>
References: <20251108231253.1641927-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_151325_857645_0FB784FF 
X-CRM114-Status: GOOD (  18.51  )
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

Use modern common clock framework helpers for simplifying the clock
controller management:
- switch to struct clk_hw for internal clocks and only get the
  "cfg_div_clk" (which has to be managed at runtime) as struct clk
  using devm_clk_hw_get_clk() which is then the only clock used by
  struct meson_mx_mmc_host.
- use CLK_HW_INIT_FW_NAME and CLK_HW_INIT_HW helper macros for simpler
  init data initialization
- keep the clock controller memory allocation separate to prevent a
  potential use-after-free because struct meson_mx_mmc_host_clkc is
  free'd before controller_dev

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/mmc/host/meson-mx-sdio.c | 119 ++++++++++++++++---------------
 1 file changed, 61 insertions(+), 58 deletions(-)

diff --git a/drivers/mmc/host/meson-mx-sdio.c b/drivers/mmc/host/meson-mx-sdio.c
index 1159cc911359..ce1828d915da 100644
--- a/drivers/mmc/host/meson-mx-sdio.c
+++ b/drivers/mmc/host/meson-mx-sdio.c
@@ -99,15 +99,15 @@
 #define MESON_MX_SDIO_RESPONSE_CRC16_BITS			(16 - 1)
 #define MESON_MX_SDIO_MAX_SLOTS					3
 
+struct meson_mx_mmc_host_clkc {
+	struct clk_divider		cfg_div;
+	struct clk_fixed_factor		fixed_div2;
+};
+
 struct meson_mx_mmc_host {
 	struct device			*controller_dev;
 
-	struct clk			*parent_clk;
-	struct clk_divider		cfg_div;
 	struct clk			*cfg_div_clk;
-	struct clk_fixed_factor		fixed_factor;
-	struct clk			*fixed_factor_clk;
-
 	struct regmap			*regmap;
 	int				irq;
 	spinlock_t			irq_lock;
@@ -548,8 +548,7 @@ static int meson_mx_mmc_add_host(struct meson_mx_mmc_host *host)
 
 	/* Get the min and max supported clock rates */
 	mmc->f_min = clk_round_rate(host->cfg_div_clk, 1);
-	mmc->f_max = clk_round_rate(host->cfg_div_clk,
-				    clk_get_rate(host->parent_clk));
+	mmc->f_max = clk_round_rate(host->cfg_div_clk, ULONG_MAX);
 
 	mmc->caps |= MMC_CAP_CMD23 | MMC_CAP_WAIT_WHILE_BUSY;
 	mmc->ops = &meson_mx_mmc_ops;
@@ -565,54 +564,62 @@ static int meson_mx_mmc_add_host(struct meson_mx_mmc_host *host)
 	return 0;
 }
 
-static int meson_mx_mmc_register_clks(struct meson_mx_mmc_host *host,
-				      void __iomem *base)
+static struct clk *meson_mx_mmc_register_clk(struct device *dev,
+					     void __iomem *base)
 {
-	struct clk_init_data init;
-	const char *clk_div_parent, *clk_fixed_factor_parent;
-
-	clk_fixed_factor_parent = __clk_get_name(host->parent_clk);
-	init.name = devm_kasprintf(host->controller_dev, GFP_KERNEL,
-				   "%s#fixed_factor",
-				   dev_name(host->controller_dev));
-	if (!init.name)
-		return -ENOMEM;
+	const char *fixed_div2_name, *cfg_div_name;
+	struct meson_mx_mmc_host_clkc *host_clkc;
+	struct clk *clk;
+	int ret;
 
-	init.ops = &clk_fixed_factor_ops;
-	init.flags = 0;
-	init.parent_names = &clk_fixed_factor_parent;
-	init.num_parents = 1;
-	host->fixed_factor.div = 2;
-	host->fixed_factor.mult = 1;
-	host->fixed_factor.hw.init = &init;
-
-	host->fixed_factor_clk = devm_clk_register(host->controller_dev,
-						 &host->fixed_factor.hw);
-	if (WARN_ON(IS_ERR(host->fixed_factor_clk)))
-		return PTR_ERR(host->fixed_factor_clk);
-
-	clk_div_parent = __clk_get_name(host->fixed_factor_clk);
-	init.name = devm_kasprintf(host->controller_dev, GFP_KERNEL,
-				   "%s#div", dev_name(host->controller_dev));
-	if (!init.name)
-		return -ENOMEM;
+	/* use a dedicated memory allocation for the clock controller to
+	 * prevent use-after-free as meson_mx_mmc_host is free'd before
+	 * dev (controller dev, not mmc_host->dev) is free'd.
+	 */
+	host_clkc = devm_kzalloc(dev, sizeof(*host_clkc), GFP_KERNEL);
+	if (!host_clkc)
+		return ERR_PTR(-ENOMEM);
+
+	fixed_div2_name = devm_kasprintf(dev, GFP_KERNEL, "%s#fixed_div2",
+					 dev_name(dev));
+	if (!fixed_div2_name)
+		return ERR_PTR(-ENOMEM);
+
+	host_clkc->fixed_div2.div = 2;
+	host_clkc->fixed_div2.mult = 1;
+	host_clkc->fixed_div2.hw.init = CLK_HW_INIT_FW_NAME(fixed_div2_name,
+							    "clkin",
+							    &clk_fixed_factor_ops,
+							    0);
+	ret = devm_clk_hw_register(dev, &host_clkc->fixed_div2.hw);
+	if (ret)
+		return dev_err_ptr_probe(dev, ret,
+					 "Failed to register %s clock\n",
+					 fixed_div2_name);
+
+	cfg_div_name = devm_kasprintf(dev, GFP_KERNEL, "%s#div", dev_name(dev));
+	if (!cfg_div_name)
+		return ERR_PTR(-ENOMEM);
+
+	host_clkc->cfg_div.reg = base + MESON_MX_SDIO_CONF;
+	host_clkc->cfg_div.shift = MESON_MX_SDIO_CONF_CMD_CLK_DIV_SHIFT;
+	host_clkc->cfg_div.width = MESON_MX_SDIO_CONF_CMD_CLK_DIV_WIDTH;
+	host_clkc->cfg_div.hw.init = CLK_HW_INIT_HW(cfg_div_name,
+						    &host_clkc->fixed_div2.hw,
+						    &clk_divider_ops,
+						    CLK_DIVIDER_ALLOW_ZERO);
+	ret = devm_clk_hw_register(dev, &host_clkc->cfg_div.hw);
+	if (ret)
+		return dev_err_ptr_probe(dev, ret,
+					 "Failed to register %s clock\n",
+					 cfg_div_name);
 
-	init.ops = &clk_divider_ops;
-	init.flags = CLK_SET_RATE_PARENT;
-	init.parent_names = &clk_div_parent;
-	init.num_parents = 1;
-	host->cfg_div.reg = base + MESON_MX_SDIO_CONF;
-	host->cfg_div.shift = MESON_MX_SDIO_CONF_CMD_CLK_DIV_SHIFT;
-	host->cfg_div.width = MESON_MX_SDIO_CONF_CMD_CLK_DIV_WIDTH;
-	host->cfg_div.hw.init = &init;
-	host->cfg_div.flags = CLK_DIVIDER_ALLOW_ZERO;
-
-	host->cfg_div_clk = devm_clk_register(host->controller_dev,
-					      &host->cfg_div.hw);
-	if (WARN_ON(IS_ERR(host->cfg_div_clk)))
-		return PTR_ERR(host->cfg_div_clk);
+	clk = devm_clk_hw_get_clk(dev, &host_clkc->cfg_div.hw, "cfg_div_clk");
+	if (IS_ERR(clk))
+		return dev_err_ptr_probe(dev, PTR_ERR(clk),
+					 "Failed to get the cfg_div clock\n");
 
-	return 0;
+	return clk;
 }
 
 static int meson_mx_mmc_probe(struct platform_device *pdev)
@@ -682,16 +689,12 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
 		goto error_free_mmc;
 	}
 
-	host->parent_clk = devm_clk_get(host->controller_dev, "clkin");
-	if (IS_ERR(host->parent_clk)) {
-		ret = PTR_ERR(host->parent_clk);
+	host->cfg_div_clk = meson_mx_mmc_register_clk(&pdev->dev, base);
+	if (IS_ERR(host->cfg_div_clk)) {
+		ret = PTR_ERR(host->cfg_div_clk);
 		goto error_free_mmc;
 	}
 
-	ret = meson_mx_mmc_register_clks(host, base);
-	if (ret)
-		goto error_free_mmc;
-
 	ret = clk_prepare_enable(host->cfg_div_clk);
 	if (ret) {
 		dev_err(host->controller_dev, "Failed to enable MMC clock\n");
-- 
2.51.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
