Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F05F5C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Jun 2022 10:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oUrzsbyZ8w/bpG++LUqoUb6HuqhjWTv7axodwgNZ51M=; b=CGNEMn+fOPtPIG
	58Txj/5hPy+T99ctivBWDfQH2Pm/SdkeoNggpv4k9UcW3s+U+oXxW3/htkh/um5sMGYp6d4t1xsjT
	A+qhsrIyj1NR2klIJRRAAxuQcnZp2ciQac9tPfsj8xkOUU0gbOmBJYb6f67v0TsbKCyQ8Hj4s/Mlg
	Z/JlD5M7lVfj9MKx5vgMvhCTdT4MueZMdiWMz0AllJFZSe2gORLt2YuiB8XIXd3N3iBR/eDyPt4oX
	mPZOGnAQe0A3NiR2yUWvUpbRSnEIJKR5EH7+W+U6Zepz1AUK1bq1xlZIaJQ0BjIoqEtwTtkJoTgy7
	WOX8TDwBR4Orw7Xuvo4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx46P-006w9r-Bd; Fri, 03 Jun 2022 10:00:21 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx46C-006w3M-Ei; Fri, 03 Jun 2022 10:00:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654250408; x=1685786408;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sJ+n2tYqhmEhzpVzUUn7F7bPvKrA5/Ib2p+26wHyTAo=;
  b=ke4em3JI7pjyuEbZ49UIby7oMke6ppEKsDFwsIJFnfL3AEzVcjUyyrpF
   CowKgJ4Muq1+wzlFPbuYhbBCdqdJGytrLeVwaiUrQG62G1hMYxpzMF65w
   SBQGSK4EzwlwIlW9v8kFCi+VOx+MYKBNi2HPbQIbJ14/qWL2VYJVUYSnF
   jO8gMgtlImksnp9QJyzY7T8MHZQAJtQs6ii3JX3GQt9xyalNVamHDLTQh
   QYttryvnaMmOUY73Rk/NASTGNKl9qXSBLYmgQz+RhgJZ2jlFBTypQCKkT
   wYm+4to3RScKc3cBL6RHZm/kLSc/N+HwTnmvbckEfh80pOPkDIs0OyYDx
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10366"; a="275018231"
X-IronPort-AV: E=Sophos;i="5.91,274,1647327600"; 
   d="scan'208";a="275018231"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2022 03:00:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,274,1647327600"; 
   d="scan'208";a="824667302"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 03 Jun 2022 03:00:04 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 2179DF1; Fri,  3 Jun 2022 13:00:07 +0300 (EEST)
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
Subject: [PATCH v3 2/6] iio: adc: meson_saradc: Align messages to be with physical device prefix
Date: Fri,  3 Jun 2022 13:00:00 +0300
Message-Id: <20220603100004.70336-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220603100004.70336-1-andriy.shevchenko@linux.intel.com>
References: <20220603100004.70336-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_030008_544525_84704C10 
X-CRM114-Status: GOOD (  10.14  )
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

Align messages to be printed with the physical device prefix as it's done
everywhere else in this driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v3: new patch (inspired by previous change)
 drivers/iio/adc/meson_saradc.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index 4fe6b997cd03..658047370db0 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -345,6 +345,7 @@ static int meson_sar_adc_read_raw_sample(struct iio_dev *indio_dev,
 					 int *val)
 {
 	struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
+	struct device *dev = indio_dev->dev.parent;
 	int regval, fifo_chan, fifo_val, count;
 
 	if (!wait_for_completion_timeout(&priv->done,
@@ -353,16 +354,14 @@ static int meson_sar_adc_read_raw_sample(struct iio_dev *indio_dev,
 
 	count = meson_sar_adc_get_fifo_count(indio_dev);
 	if (count != 1) {
-		dev_err(&indio_dev->dev,
-			"ADC FIFO has %d element(s) instead of one\n", count);
+		dev_err(dev, "ADC FIFO has %d element(s) instead of one\n", count);
 		return -EINVAL;
 	}
 
 	regmap_read(priv->regmap, MESON_SAR_ADC_FIFO_RD, &regval);
 	fifo_chan = FIELD_GET(MESON_SAR_ADC_FIFO_RD_CHAN_ID_MASK, regval);
 	if (fifo_chan != chan->address) {
-		dev_err(&indio_dev->dev,
-			"ADC FIFO entry belongs to channel %d instead of %lu\n",
+		dev_err(dev, "ADC FIFO entry belongs to channel %d instead of %lu\n",
 			fifo_chan, chan->address);
 		return -EINVAL;
 	}
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
