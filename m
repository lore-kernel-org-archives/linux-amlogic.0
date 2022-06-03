Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4015C43334
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Jun 2022 10:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vYCRJ0FaYJFzvByKKMrAxE5RkqK7NK3gs2BHeCJvp5I=; b=hgmc07S7vq4KbE
	rtSV6ich+pmOFRM510P4GhH+hS38cqa6Ujsr4MTAyiXkrEtsnq/Tni4m55+j4eKS2dp9En9ohyUXv
	kwrD8VDTcepoLh6/YXdXFI9Fs59ruyeHLe68A0RQSrpDshCHvyPsxWQJjXh1DrsxQlVKG3WNR8Z0h
	V4EAcrVTTzND+iKQVTDxYJcA8wDAabxmH7htsInKcJ/ZXQfNY8W4xdMDrbllNwFMVrDZImTI+v1bF
	gYNEHWpmI89ggfyDm0Ek4lhh0Xam4L1tru3IlK6SGG032W22p7DBLm9rrmoY5u221grmOyr3udLfy
	u2vnRXMqXflYscePzvGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx46F-006w5I-4f; Fri, 03 Jun 2022 10:00:11 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx46C-006w3J-7D; Fri, 03 Jun 2022 10:00:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654250408; x=1685786408;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lUUAnsz891L4HajB6hTRr1b9rf9F2cTw/OEQJFCSjIs=;
  b=m/Av1MnMajiWmZilW3bBhCkR350AO8ThIgHfnmJFpa+wLdeq1DYcts37
   KYRqla58G5kwaCWnAAinAnBI58MNdclvDU3QB9qfQFt9YynjliXSJhwAi
   NLCT583162Yl6LzpD08gTCztwLxbphVhJ/jaEuvCWCtKIZNGglJbyZZG8
   gJJ35wmsBAkMB2HrODHcolZNaIyoti4AB/XOy2AEKz0+gm0WDK33VPxxt
   /aSSznSpMvi9ZiqNzUi72azJwEpzJ68p/DBmATlqNrm8CppUdA/ktb95q
   ODcDUxDhuMMP11/oxadovMLa1y9A8fgA7q2p2Xsvbb9SNoSX6XQvNIH77
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10366"; a="301588058"
X-IronPort-AV: E=Sophos;i="5.91,274,1647327600"; 
   d="scan'208";a="301588058"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2022 03:00:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,274,1647327600"; 
   d="scan'208";a="668392749"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 03 Jun 2022 03:00:04 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 26C525D3; Fri,  3 Jun 2022 13:00:07 +0300 (EEST)
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
Subject: [PATCH v3 3/6] iio: adc: meson_saradc: Convert to use dev_err_probe()
Date: Fri,  3 Jun 2022 13:00:01 +0300
Message-Id: <20220603100004.70336-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220603100004.70336-1-andriy.shevchenko@linux.intel.com>
References: <20220603100004.70336-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_030008_333217_A985D73F 
X-CRM114-Status: GOOD (  16.87  )
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
v3: rebased on top of previous changes
 drivers/iio/adc/meson_saradc.c | 52 +++++++++++++---------------------
 1 file changed, 19 insertions(+), 33 deletions(-)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index 658047370db0..0d9aef362c5d 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -698,6 +698,7 @@ static int meson_sar_adc_temp_sensor_init(struct iio_dev *indio_dev)
 {
 	struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
 	u8 *buf, trimming_bits, trimming_mask, upper_adc_val;
+	struct device *dev = indio_dev->dev.parent;
 	struct nvmem_cell *temperature_calib;
 	size_t read_len;
 	int ret;
@@ -714,30 +715,23 @@ static int meson_sar_adc_temp_sensor_init(struct iio_dev *indio_dev)
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
@@ -762,6 +756,7 @@ static int meson_sar_adc_temp_sensor_init(struct iio_dev *indio_dev)
 static int meson_sar_adc_init(struct iio_dev *indio_dev)
 {
 	struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
+	struct device *dev = indio_dev->dev.parent;
 	int regval, i, ret;
 
 	/*
@@ -885,18 +880,12 @@ static int meson_sar_adc_init(struct iio_dev *indio_dev)
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
@@ -1183,24 +1172,21 @@ static int meson_sar_adc_probe(struct platform_device *pdev)
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
