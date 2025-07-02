Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 437F3C83F04
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Jul 2025 16:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eCyRB6nQwVgkAZFPtj57sa8FfVMIdjLtN92xxMXYkzU=; b=KKDkG5O+ZRSrkz
	rK5m15TQLmKyLejHTkHPqCxkSzhNbNz93KqOgC/JqEfket2Qc9+8kwbY9mf5tqjhsp9MmHY0NyhJp
	ABttbkCnPA8d6XJyFIvgmde5lTzENSvHRkJWcTb5nxi/kv1tjz5RTE0VdPDhCbQogSeGoCSIpaJVZ
	rZhNih3BpLscdwv+Nnc3ZQRW6+rbjgjcHFWtmcuiLmaBEHwOg0nGgtyzbpT7ZVj4xi8SyGAyBBMqL
	BWi2d9CmKDuhsoSuj5ibmUqac3M1PNE5owJ7JwySgE3GTVoMva2Up/nsX46RqMWEfTh8ochHN9mEt
	iX7dv/KSL0EQkpZvN6iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0VD-00000008zKv-2sXY;
	Wed, 02 Jul 2025 16:40:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzN0-00000008mxk-2VUA
	for linux-amlogic@bombadil.infradead.org;
	Wed, 02 Jul 2025 15:27:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=YIzTaynUnodwii+be4z9ccfRn5hxHLnj1WR8qQ5jqUg=; b=eeMUg6L5R2NBhRQ8+gsHVIqTZX
	tYvSHUnOb5NVVPFaJWL+H9Kxw0mq+K7xQ1jCDbh+EXXEbQQ8HYUG62DB/LdnyPDTEDSS8H+NqNQ1g
	lu+Zs2Ly9EkXZ55kh3zax9yUZUAVE6uIlr5pq8IjQF+AO9+D89MPWyxqxbPL4t3h3g+fyFWSvuxwi
	iA3ZBgCmM/Uq6nZ5G6fxJArLnjHWOQuHMx926dnIx+RwzoF2+EawHNSapjVYlQXmqiE7zu15mdDR4
	AQNU+C2CSJj+gbLVGuw5nzVGXEE/0agBANho+6acKYuTL7Md7+bcH0ylTHVWpTqmYu31VdUcaKeq5
	auVSkuQA==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzMx-00000007Tpy-2zfM
	for linux-amlogic@lists.infradead.org;
	Wed, 02 Jul 2025 15:27:33 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3a53359dea5so2643883f8f.0
        for <linux-amlogic@lists.infradead.org>; Wed, 02 Jul 2025 08:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751470050; x=1752074850; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YIzTaynUnodwii+be4z9ccfRn5hxHLnj1WR8qQ5jqUg=;
        b=jokFaD+/2DLv0rIm7PYzvST6l779opi4WLY2KrBSGxaCsqzQB/Xse/rDUuHzVWw0es
         Ojkq0/EPYDtfuw643VcI57yGW26JPOeHlSWzub9tRihIv7xUoqXv0AUfIZHYDrwTMzx8
         lPc565/OCU69tEW4HysgrXhlceCWheH7ICEJqJCugEsvUPq1fat5blqFzttfhTb5TsiX
         pCEbQ8fRFZgNZHI9MuVficKOes2FC455Ybn2O5oe/db29nBuGuiIiI42lV56PdeYJLXG
         UeZKVWV3wAaWRMshEvNLk1VmT0GcIxV1a5vey036lnuoynSCb+o0skTpjEqPBeYM06x9
         NBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470050; x=1752074850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YIzTaynUnodwii+be4z9ccfRn5hxHLnj1WR8qQ5jqUg=;
        b=aRCfBvu8kEz1XQEeij01LTtxPxRRqKCZIt0DUOzYDNHPZx5UYm6FXBmMXwSN7xnUhy
         8jiyZFBln4P4jpYzP46f32jFtWwgRD9o6c5fmizGu2DMuZ7NMr+NBxLvsjj5iAi7b02m
         DAvJmHqqxzQ4WKP95XCD22Z47/WU70vwdrpYpcMo55b1W6FuyGNuXg/3O5ME1VED+mJy
         8vKJWCHO2qfqDlYCwRGdKm4peV3K61BW+on+EeXtidbbcpPa2hWb60eLlY9llSn4TaLp
         EbGcbO94n5AzkZAD5byMbIXsrRBbUPE1cnGktc6rkrQNRrper3CkHwBJHPuvsvXnQX4P
         iUAA==
X-Gm-Message-State: AOJu0YwkRMJX8p501vd+Xa8l+mzEu7tPJrpKGwDLNtmjQnad6ponQjfq
	Aeqpz+p0DNfxuT1gOJrzXrrpKDYeK0d6nadMfyu52e72fJ9rxB+VkL/nT1kgtP2u5ugewaD+tig
	1GTzW
X-Gm-Gg: ASbGnctr4CGUEA8crunNe06Wwxf7pw1gLw+95e9bMGxN1fyZkY6qCtjkfeGeY2Nwtz+
	WQ/MaTWPGtMBmZ6I/RYc90dwujYuKmZ0zsYkSjkA30yaBaIgVHr79Bx3fnsq7KfIQPaj11yQntY
	3P+hHVG3GVzjceY04/HXOjphGfsjjD3ywgrwA1EVvdbDUMc2gg/Gdcy2Cq0YRlFnEUUv3p5ekQd
	mkGT9Fd+O7VxpU19n9yMEXcUPcq1Y7PwP1ktj1ZPThwXZ+8oWMNiAc/0TY+igfVSE7wNXVsPVhT
	zm/ZQs/i3dw7xtE4emHsHvzxcsk3qqmllYX6ZmB4Jr/b5Ctrcamma+9wa3Hz3omfi3EZLshHwIC
	+
X-Google-Smtp-Source: AGHT+IETEiGm3zFOOgtdRLN+7QC4k4+28PEvFEfcFcVpqekr/FapI6qrJoqscH+sAz/rFycKlggxuw==
X-Received: by 2002:a05:6000:42c8:b0:3a5:8a68:b81b with SMTP id ffacd0b85a97d-3b20110d6eemr1991784f8f.44.1751470050024;
        Wed, 02 Jul 2025 08:27:30 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:5542:4bad:e07b:9489])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454a9bcf35csm869205e9.20.2025.07.02.08.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 08:27:29 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 02 Jul 2025 17:26:14 +0200
Subject: [PATCH 16/26] clk: amlogic: add probe helper for mmio based
 controllers
MIME-Version: 1.0
Message-Id: <20250702-meson-clk-cleanup-24-v1-16-e163c9a1fc21@baylibre.com>
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3664; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=ZNrs19WXbXf3c8BcGFBvvWk7485+N0i0pb3qke0AdCY=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoZU/F0jD3XQaHm0ZVzgbudKf7GhQakFUk9ZREZ
 5+1cgLPWdWJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaGVPxQAKCRDm/A8cN/La
 hbskD/9n3QwiKqzIuzwoX+mGeWr9i/7T99ISAljw5mLqk+sbhjj0PBiKsw1v9hrxu9U8Kh+CEPI
 B+aT6v3yqH2/a+LDzyx+To3+3btNqMtZ3WsrM1R6jVk3E4KMrCgnIJ+t7QCxQ+mhwETim28ENqr
 WJgtQl1TK1sNpWjULaGf4DP5GgLQ5Hi3Axx9LFOzwexGDYjUYIhiBGzpqv8/DmjeRA1kwzgaD+b
 rj/AxWOjJxGtPgSoOI4utu11ObaVXLUwr9nx+Euey11fGoJ4JXZzD1McmS0iwwfotbhYsnIIsSV
 Oziu+GGNBzC01E8vgvorN/20PLUbZCu/wTSMgeplnNvBx2224Jg5sfhrYDA/6sZUYINhAYsShHA
 lndkR8ZDv45SIQsuJz6R9S8inujqCzOEoJmORsojjiqJOaMvbitvjs7LbFqj29fE9R44phlCBTr
 ogWr7KsSHJ+vpEtPL2BvR/PH0xxM2MX0utTfpyvkqqp/Ugj6X9QiuHUNDOcqdPqOVbwem+8rwCD
 lgo13neGmTaR+DDF4Oszz132sCTSH1PzpR50Bf7+BQTOXWpa07b9sbIudV3sQwH56/SzGKQpmpE
 loZ8zoZLDVQ+6hyg+nsByhPJbbHlGnGNJFV6NcpG1tImAHISToLyhq9GOM4QGOm/Sar56/uP0Is
 KsnYM0es4dlW+qQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_162731_874825_7D744912 
X-CRM114-Status: GOOD (  14.81  )
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

Add a 2nd probe function helper for mmio based controllers, which
are getting the memory region from a resource instead of a syscon.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/meson-clkc-utils.c | 65 ++++++++++++++++++++++++++++--------
 drivers/clk/meson/meson-clkc-utils.h |  1 +
 2 files changed, 53 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/meson/meson-clkc-utils.c b/drivers/clk/meson/meson-clkc-utils.c
index 49f562d0f203b9a7d15b5119100216564c10cb21..272b2dd8c95e73e6c021cbf8852dd64733fa00e0 100644
--- a/drivers/clk/meson/meson-clkc-utils.c
+++ b/drivers/clk/meson/meson-clkc-utils.c
@@ -26,12 +26,9 @@ struct clk_hw *meson_clk_hw_get(struct of_phandle_args *clkspec, void *clk_hw_da
 }
 EXPORT_SYMBOL_NS_GPL(meson_clk_hw_get, "CLK_MESON");
 
-int meson_clkc_syscon_probe(struct platform_device *pdev)
+static int meson_clkc_init(struct device *dev, struct regmap *map)
 {
 	const struct meson_clkc_data *data;
-	struct device *dev = &pdev->dev;
-	struct device_node *np;
-	struct regmap *map;
 	struct clk_hw *hw;
 	int ret, i;
 
@@ -39,15 +36,6 @@ int meson_clkc_syscon_probe(struct platform_device *pdev)
 	if (!data)
 		return -EINVAL;
 
-	np = of_get_parent(dev->of_node);
-	map = syscon_node_to_regmap(np);
-	of_node_put(np);
-	if (IS_ERR(map)) {
-		dev_err(dev,
-			"failed to get parent syscon regmap\n");
-		return PTR_ERR(map);
-	}
-
 	if (data->init_count)
 		regmap_multi_reg_write(map, data->init_regs, data->init_count);
 
@@ -68,8 +56,59 @@ int meson_clkc_syscon_probe(struct platform_device *pdev)
 
 	return devm_of_clk_add_hw_provider(dev, meson_clk_hw_get, (void *)&data->hw_clks);
 }
+
+int meson_clkc_syscon_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np;
+	struct regmap *map;
+
+	np = of_get_parent(dev->of_node);
+	map = syscon_node_to_regmap(np);
+	of_node_put(np);
+	if (IS_ERR(map)) {
+		dev_err(dev, "failed to get parent syscon regmap\n");
+		return PTR_ERR(map);
+	}
+
+	return meson_clkc_init(dev, map);
+}
 EXPORT_SYMBOL_NS_GPL(meson_clkc_syscon_probe, "CLK_MESON");
 
+static const struct regmap_config base_clkc_regmap_cfg = {
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+};
+
+int meson_clkc_mmio_probe(struct platform_device *pdev)
+{
+	const struct meson_clkc_data *data;
+	struct device *dev = &pdev->dev;
+	struct regmap_config regmap_cfg;
+	struct resource *res;
+	void __iomem *base;
+	struct regmap *map;
+
+	data = of_device_get_match_data(dev);
+	if (!data)
+		return -EINVAL;
+
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	memcpy(&regmap_cfg, &base_clkc_regmap_cfg, sizeof(regmap_cfg));
+	regmap_cfg.max_register = resource_size(res) - 4;
+
+	map = devm_regmap_init_mmio(dev, base, &regmap_cfg);
+	if (IS_ERR(map))
+		return PTR_ERR(map);
+
+	return meson_clkc_init(dev, map);
+}
+EXPORT_SYMBOL_NS_GPL(meson_clkc_mmio_probe, "CLK_MESON");
+
 MODULE_DESCRIPTION("Amlogic Clock Controller Utilities");
 MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS("CLK_MESON");
diff --git a/drivers/clk/meson/meson-clkc-utils.h b/drivers/clk/meson/meson-clkc-utils.h
index 26cd47544302b28ca1a342e178956559a84b152a..b45f85f630d7190fb6509b088f05f17ca91fa1c8 100644
--- a/drivers/clk/meson/meson-clkc-utils.h
+++ b/drivers/clk/meson/meson-clkc-utils.h
@@ -25,5 +25,6 @@ struct meson_clkc_data {
 };
 
 int meson_clkc_syscon_probe(struct platform_device *pdev);
+int meson_clkc_mmio_probe(struct platform_device *pdev);
 
 #endif

-- 
2.47.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
