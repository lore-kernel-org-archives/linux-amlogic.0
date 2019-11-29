Return-Path: <SRS0=h6Hi=ZV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7101C432C0
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Nov 2019 14:47:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78E0D21736
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Nov 2019 14:47:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bqu+VbMB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78E0D21736
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+2QmVR6WmfSEDJ46AxkvMLf7Aa0kFrmtLmMSYVlHfKI=; b=bqu+VbMBiMWQsR
	ED1iKzBYLMWoNksy1T6tDHjGY8Cu8KEICsmvLV6tXVOLjwVOW8v/Je4KL7KeR6Jn1WwBZw1It0pQ5
	R83iZKd+PMA2cq7qFNrby48XmLBe/oQbilJESx/jZCwMMAvFKVRVqFYqd6YXhTcFU7+QqPLehFiAj
	yhx/GSMUAN6upMELemeQ4IyktY8BI7IlFQ9wG2joVWujOxCuQzk+NUwkHosACvf6iwGsqldGgc5JX
	oi9dESI5+afTlgBMez4AI8qt1K74FQmoTKWnkRivuXprXqbD4f0my6Z/mM5b62/W9m2db5fC1fhCC
	jWJig6JOFMEiO6OYUO1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iahYM-0004Ub-9N; Fri, 29 Nov 2019 14:47:26 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iahXk-0003gZ-GU; Fri, 29 Nov 2019 14:46:50 +0000
Received: from droid15-sz.amlogic.com (10.28.8.25) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.1591.10; Fri, 29 Nov 2019
 22:46:37 +0800
From: Jian Hu <jian.hu@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>
Subject: [PATCH v3 3/7] clk: meson: eeclk: refactor eeclk common driver to
 support A1
Date: Fri, 29 Nov 2019 22:46:01 +0800
Message-ID: <20191129144605.182774-4-jian.hu@amlogic.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191129144605.182774-1-jian.hu@amlogic.com>
References: <20191129144605.182774-1-jian.hu@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.8.25]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191129_064648_642903_781A1420 
X-CRM114-Status: GOOD (  10.01  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Victor Wan <victor.wan@amlogic.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Jian Hu <jian.hu@amlogic.com>,
 linux-arm-kernel@lists.infradead.org, Qiufang Dai <qiufang.dai@amlogic.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 Chandle Zou <chandle.zou@amlogic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Introduce a common probe function for A1 series, the way to get
regmap is different between A1 series and the previous series.
The register region is only for one clock driver, the function of
meson_eeclkc_probe is not fit for A1, So it is necessary to
introduce a new function.
---
 drivers/clk/meson/meson-eeclk.c | 59 +++++++++++++++++++++++++++------
 drivers/clk/meson/meson-eeclk.h |  2 ++
 2 files changed, 51 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/meson/meson-eeclk.c b/drivers/clk/meson/meson-eeclk.c
index a7cb1e7aedc4..6f9c8ee38c20 100644
--- a/drivers/clk/meson/meson-eeclk.c
+++ b/drivers/clk/meson/meson-eeclk.c
@@ -13,25 +13,37 @@
 #include "clk-regmap.h"
 #include "meson-eeclk.h"
 
-int meson_eeclkc_probe(struct platform_device *pdev)
+static struct regmap_config clkc_regmap_config = {
+	.reg_bits       = 32,
+	.val_bits       = 32,
+	.reg_stride     = 4,
+};
+
+struct regmap *meson_regmap_resource(struct platform_device *pdev)
+{
+	struct resource *res;
+	void __iomem *base;
+	struct device *dev = &pdev->dev;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+
+	base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(base))
+		return ERR_CAST(base);
+
+	return devm_regmap_init_mmio(dev, base, &clkc_regmap_config);
+}
+
+int meson_common_probe(struct platform_device *pdev, struct regmap *map)
 {
 	const struct meson_eeclkc_data *data;
 	struct device *dev = &pdev->dev;
-	struct regmap *map;
 	int ret, i;
 
 	data = of_device_get_match_data(dev);
 	if (!data)
 		return -EINVAL;
 
-	/* Get the hhi system controller node */
-	map = syscon_node_to_regmap(of_get_parent(dev->of_node));
-	if (IS_ERR(map)) {
-		dev_err(dev,
-			"failed to get HHI regmap\n");
-		return PTR_ERR(map);
-	}
-
 	if (data->init_count)
 		regmap_multi_reg_write(map, data->init_regs, data->init_count);
 
@@ -54,3 +66,30 @@ int meson_eeclkc_probe(struct platform_device *pdev)
 	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
 					   data->hw_onecell_data);
 }
+
+int meson_eeclkc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct regmap *map;
+
+	/* Get the hhi system controller node */
+	map = syscon_node_to_regmap(of_get_parent(dev->of_node));
+	if (IS_ERR(map)) {
+		dev_err(dev,
+			"failed to get HHI regmap\n");
+		return PTR_ERR(map);
+	}
+
+	return meson_common_probe(pdev, map);
+}
+
+int meson_clkc_probe(struct platform_device *pdev)
+{
+	struct regmap *map;
+
+	map = meson_regmap_resource(pdev);
+	if (IS_ERR(map))
+		return PTR_ERR(map);
+
+	return meson_common_probe(pdev, map);
+}
diff --git a/drivers/clk/meson/meson-eeclk.h b/drivers/clk/meson/meson-eeclk.h
index 77316207bde1..db0bfba8f6b3 100644
--- a/drivers/clk/meson/meson-eeclk.h
+++ b/drivers/clk/meson/meson-eeclk.h
@@ -20,6 +20,8 @@ struct meson_eeclkc_data {
 	struct clk_hw_onecell_data	*hw_onecell_data;
 };
 
+struct regmap *meson_regmap_resource(struct platform_device *pdev);
 int meson_eeclkc_probe(struct platform_device *pdev);
+int meson_clkc_probe(struct platform_device *pdev);
 
 #endif /* __MESON_CLKC_H */
-- 
2.24.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
