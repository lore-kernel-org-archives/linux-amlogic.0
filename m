Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52764C43334
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Jun 2022 10:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+86STw0mb1b8YJV1e3wLrgplheLVCrsPpFlvpp2SwGg=; b=2wMzSDfV2ToyaE
	ualsgJVfQd0vyq9P2d9KXKTJ5fbAzYpduxatnnZIabau4Z2wqRsteSeN97qT2Nlu+lLY2OKr6n7Q+
	SCPjPkTVsYlP+w27iWeXh/yHAssaTZXq+N+Ixkb6N+cvayoRbQ60TkovFOZxtp/qY/hGrKhEFeUPl
	lecAG2qaa647hvNtP+k7nlj6Q/QlCEvZ6WQbS+MWo/LxG8rMRjEw7r1i5c/89DarIh/L57/kU2w6Z
	XMAMigOE3kX4PHvQVPoSUbBekzSK90JB7/sut7oKYqwssc+TW3v5jPbZMDA5CLOJoFrPuwVfXnUN3
	J/UX4sfCLppGGfo0bSWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx46Q-006wAa-07; Fri, 03 Jun 2022 10:00:22 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx46C-006w3K-H8; Fri, 03 Jun 2022 10:00:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654250408; x=1685786408;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dmizgC/FFx3wjR+UyFpJTMRWLIYX1iNBjHo2LkhU22s=;
  b=HfSlYO3LXpZZu76GkNx7q2aB+ReIVi1Cv5zeVcvlD7LhWBpcCIlGBfI7
   JMbYDwtHqrMvcERDfVZ7jnB5OQsEv4yuY+OvLJ/ZqIlDD7JDS6ZLvDTh9
   75/DAYBWv1w3aOAlj+n0WP27msZLdxGokmkFCoihJf1bVUOwy5UrHJYn/
   DU16qU6KrNd4aODBqK9/L3MsZ03G+CGSJOmHcR6BU2cZuiEX7sd+R1564
   E3LKALyko1TNM0ykafVrHajUsfe2Rol9yGt8G6IPjEmH8MerxOub0rdtH
   eZwldr0D8EnRz035YJn6v2OEzKmk5F454xzWLSupOLe3pNvb7csOd+t2/
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10366"; a="256695933"
X-IronPort-AV: E=Sophos;i="5.91,274,1647327600"; 
   d="scan'208";a="256695933"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2022 03:00:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,274,1647327600"; 
   d="scan'208";a="721691989"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 03 Jun 2022 03:00:04 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 12387F8; Fri,  3 Jun 2022 13:00:06 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v3 1/6] iio: adc: meson_saradc: Don't attach managed resource to IIO device object
Date: Fri,  3 Jun 2022 12:59:59 +0300
Message-Id: <20220603100004.70336-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_030008_618781_0FEC6DC6 
X-CRM114-Status: GOOD (  12.97  )
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

It feels wrong and actually inconsistent to attach managed resources
to the IIO device object, which is child of the physical device object.
The rest of the ->probe() calls do that against physical device.

Resolve this by reassigning managed resources to the physical device object.

Fixes: 3adbf3427330 ("iio: adc: add a driver for the SAR ADC found in Amlogic Meson SoCs")
Suggested-by: Lars-Peter Clausen <lars@metafoo.de>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v3: new fix-patch
 drivers/iio/adc/meson_saradc.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index 62cc6fb0ef85..4fe6b997cd03 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -650,11 +650,11 @@ static int meson_sar_adc_clk_init(struct iio_dev *indio_dev,
 				  void __iomem *base)
 {
 	struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
+	struct device *dev = indio_dev->dev.parent;
 	struct clk_init_data init;
 	const char *clk_parents[1];
 
-	init.name = devm_kasprintf(&indio_dev->dev, GFP_KERNEL, "%s#adc_div",
-				   dev_name(indio_dev->dev.parent));
+	init.name = devm_kasprintf(dev, GFP_KERNEL, "%s#adc_div", dev_name(dev));
 	if (!init.name)
 		return -ENOMEM;
 
@@ -670,13 +670,11 @@ static int meson_sar_adc_clk_init(struct iio_dev *indio_dev,
 	priv->clk_div.hw.init = &init;
 	priv->clk_div.flags = 0;
 
-	priv->adc_div_clk = devm_clk_register(&indio_dev->dev,
-					      &priv->clk_div.hw);
+	priv->adc_div_clk = devm_clk_register(dev, &priv->clk_div.hw);
 	if (WARN_ON(IS_ERR(priv->adc_div_clk)))
 		return PTR_ERR(priv->adc_div_clk);
 
-	init.name = devm_kasprintf(&indio_dev->dev, GFP_KERNEL, "%s#adc_en",
-				   dev_name(indio_dev->dev.parent));
+	init.name = devm_kasprintf(dev, GFP_KERNEL, "%s#adc_en", dev_name(dev));
 	if (!init.name)
 		return -ENOMEM;
 
@@ -690,7 +688,7 @@ static int meson_sar_adc_clk_init(struct iio_dev *indio_dev,
 	priv->clk_gate.bit_idx = __ffs(MESON_SAR_ADC_REG3_CLK_EN);
 	priv->clk_gate.hw.init = &init;
 
-	priv->adc_clk = devm_clk_register(&indio_dev->dev, &priv->clk_gate.hw);
+	priv->adc_clk = devm_clk_register(dev, &priv->clk_gate.hw);
 	if (WARN_ON(IS_ERR(priv->adc_clk)))
 		return PTR_ERR(priv->adc_clk);
 
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
