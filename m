Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F433C43334
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jun 2022 11:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Wxy1EddzR1iu1Vkd/dvjWGmdy+AJ7xj7PYmD3en8WPY=; b=A27hflJzr4+psB
	bmyccJga4S+nomHPgvJVu9vCZt0t+HX0JhchJ+VzzoS4oHsTj/eAjl93lw79T8o1P2Jj9CNu8w5WX
	lfwwQ7r84amT236IS0aX11sD/m22AFLOaFjonWapzud7OvAQ/YVnbALhKWCZQasab/H4Pzt+omki1
	wD27DnFgdASP6pYL4Q/+O8yKcPAKlARqy3Abv1Gxh+8tsiPgk+f8k5tdE5nR/yiROOUB5vtL3tfiv
	AKPAV7xFw4iSkMSDeL86wMbLtPCSAzbqJnAij4Z/zS1xg5Agy4kra+8aPPCrxn3VATI9N8Aau5TFU
	ZyWP4bpkdWIOXjvJZYDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwjE0-002yjp-0X; Thu, 02 Jun 2022 11:42:48 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwjDw-002yhu-Oo; Thu, 02 Jun 2022 11:42:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654170164; x=1685706164;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oIz/mvMCV+BGSqUcB6eZa50Ln+1c3te5NV7Zv6a5Yeg=;
  b=mq2TyYXYWct80H1Dns9C9VYH1crn0sjDN6iMg5V1y2Mp7+lSpGGPt5x9
   kyf2L2vKmPOnXmJdHpuWwN6fWd7vTC7d91Zj15bISQNRt+svdIoaTNOcS
   1O/ZuJmj8ks27VERLDtIpSRbRnku/9daF/3yP4aQ1XTEXiTaMC+lnaJ9a
   3YPUhSlqSMJCuvQ2t4u1awdTeOBRj1VZHwX9MEkLhlHDoChjIAcaqRUo7
   8AJtfXIojpbjImnl4KCJ0WmdGA/cteuasVuATH5s/WWpMhIC6vH4l11oY
   FAE/P8zfRonU1e9hNdHQYd+kgyDH0A5JEJE1E9O/roj4K9L4ev/BgE3sI
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="263557930"
X-IronPort-AV: E=Sophos;i="5.91,271,1647327600"; 
   d="scan'208";a="263557930"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2022 04:42:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,271,1647327600"; 
   d="scan'208";a="721269396"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 02 Jun 2022 04:42:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id BEFD8F8; Thu,  2 Jun 2022 14:42:42 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 1/3] iio: adc: meson_saradc: Convert to use dev_err_probe()
Date: Thu,  2 Jun 2022 14:42:39 +0300
Message-Id: <20220602114241.12601-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_044244_931478_47266855 
X-CRM114-Status: GOOD (  16.71  )
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

It's fine to call dev_err_probe() in ->probe() when error code is known.
Convert the driver to use dev_err_probe().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: split long line (Martin)
 drivers/iio/adc/meson_saradc.c | 52 +++++++++++++---------------------
 1 file changed, 19 insertions(+), 33 deletions(-)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index 62cc6fb0ef85..a2e83eca03e8 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -701,6 +701,7 @@ static int meson_sar_adc_temp_sensor_init(struct iio_dev *indio_dev)
 {
 	struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
 	u8 *buf, trimming_bits, trimming_mask, upper_adc_val;
+	struct device *dev = indio_dev->dev.parent;
 	struct nvmem_cell *temperature_calib;
 	size_t read_len;
 	int ret;
@@ -717,30 +718,23 @@ static int meson_sar_adc_temp_sensor_init(struct iio_dev *indio_dev)
 		if (ret == -ENODEV)
 			return 0;
 
-		return dev_err_probe(indio_dev->dev.parent, ret,
-				     "failed to get temperature_calib cell\n");
+		return dev_err_probe(dev, ret, "failed to get temperature_calib cell\n");
 	}
 
 	priv->tsc_regmap =
 		syscon_regmap_lookup_by_phandle(indio_dev->dev.parent->of_node,
 						"amlogic,hhi-sysctrl");
-	if (IS_ERR(priv->tsc_regmap)) {
-		dev_err(indio_dev->dev.parent,
-			"failed to get amlogic,hhi-sysctrl regmap\n");
-		return PTR_ERR(priv->tsc_regmap);
-	}
+	if (IS_ERR(priv->tsc_regmap))
+		return dev_err_probe(dev, PTR_ERR(priv->tsc_regmap),
+				     "failed to get amlogic,hhi-sysctrl regmap\n");
 
 	read_len = MESON_SAR_ADC_EFUSE_BYTES;
 	buf = nvmem_cell_read(temperature_calib, &read_len);
-	if (IS_ERR(buf)) {
-		dev_err(indio_dev->dev.parent,
-			"failed to read temperature_calib cell\n");
-		return PTR_ERR(buf);
-	} else if (read_len != MESON_SAR_ADC_EFUSE_BYTES) {
+	if (IS_ERR(buf))
+		return dev_err_probe(dev, PTR_ERR(buf), "failed to read temperature_calib cell\n");
+	if (read_len != MESON_SAR_ADC_EFUSE_BYTES) {
 		kfree(buf);
-		dev_err(indio_dev->dev.parent,
-			"invalid read size of temperature_calib cell\n");
-		return -EINVAL;
+		return dev_err_probe(dev, -EINVAL, "invalid read size of temperature_calib cell\n");
 	}
 
 	trimming_bits = priv->param->temperature_trimming_bits;
@@ -765,6 +759,7 @@ static int meson_sar_adc_temp_sensor_init(struct iio_dev *indio_dev)
 static int meson_sar_adc_init(struct iio_dev *indio_dev)
 {
 	struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
+	struct device *dev = indio_dev->dev.parent;
 	int regval, i, ret;
 
 	/*
@@ -888,18 +883,12 @@ static int meson_sar_adc_init(struct iio_dev *indio_dev)
 	}
 
 	ret = clk_set_parent(priv->adc_sel_clk, priv->clkin);
-	if (ret) {
-		dev_err(indio_dev->dev.parent,
-			"failed to set adc parent to clkin\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to set adc parent to clkin\n");
 
 	ret = clk_set_rate(priv->adc_clk, priv->param->clock_rate);
-	if (ret) {
-		dev_err(indio_dev->dev.parent,
-			"failed to set adc clock rate\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to set adc clock rate\n");
 
 	return 0;
 }
@@ -1186,24 +1175,21 @@ static int meson_sar_adc_probe(struct platform_device *pdev)
 {
 	const struct meson_sar_adc_data *match_data;
 	struct meson_sar_adc_priv *priv;
+	struct device *dev = &pdev->dev;
 	struct iio_dev *indio_dev;
 	void __iomem *base;
 	int irq, ret;
 
 	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*priv));
-	if (!indio_dev) {
-		dev_err(&pdev->dev, "failed allocating iio device\n");
-		return -ENOMEM;
-	}
+	if (!indio_dev)
+		return dev_err_probe(dev, -ENOMEM, "failed allocating iio device\n");
 
 	priv = iio_priv(indio_dev);
 	init_completion(&priv->done);
 
 	match_data = of_device_get_match_data(&pdev->dev);
-	if (!match_data) {
-		dev_err(&pdev->dev, "failed to get match data\n");
-		return -ENODEV;
-	}
+	if (!match_data)
+		return dev_err_probe(dev, -ENODEV, "failed to get match data\n");
 
 	priv->param = match_data->param;
 
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
