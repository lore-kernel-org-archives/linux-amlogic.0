Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E3EC433EF
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Jun 2022 10:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YcUIM7njzE7OwXVk332CGnqhIUc/+KnpzSfAdfiU/z4=; b=HNI79dKXrf+lmp
	zQaG8zbEU1OxHTaVYe8JE27ni9+82AAZ5g2OeLQlcWsvIRT0Btav17d0Hqf0C46Yu7RjETr6sIQBF
	xE7OkrrOo+HtM+5YuSMBo+2iFaSvfVlpdg7yH27pvPxS5hhJ0x2zqpJysfcyJQNnbDq2CzkDVHUYG
	uNX/cbqwfhmG0GFuI/OFocOal+3p6a1sHdLlFmX67UDGlzddRwybd462hwioXeh0W8uKGlUkGC0uE
	ddtpa1Ai+xVpSvDIxiv/tNJEzxk7atWR94DQ/857r4cj8CK6pz7sJrJ35/udDAUvaGRaIF/5ruEJx
	46D7QzWF5GvlzeoiJ6lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx47H-006wfS-Cq; Fri, 03 Jun 2022 10:01:15 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx46F-006w5z-PI; Fri, 03 Jun 2022 10:00:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654250411; x=1685786411;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T0fsSIU29EuhBbM0LUaUeCq/SxCSD2R+0n5JMdHNevI=;
  b=iAmzbBd2jcC0zu3LPuI1pUAzyZaHn91E6Zs7ZTDlySOJ5HNywUehlsYl
   IOGqvoyau0KEXw4bUA3XZqLUIFimqX4/0hDHe+VvlXYERmCBfbOIp6vAP
   YzN7XizFiTbwYOby5DiB4uHliHrzlm04Kq7njaeIH8M7aCzLOHVYam+FY
   P9cH8tGsEBGb7lCHDa2c0ftwTcfuV2a6pgUMr27I4zYiiWu0WGz2khSJK
   dKuSKe0TaBsvUUCnzy6oacM3NP3sOrnCJE9aypwZf8Uwfb5qiE3aUWUIf
   S4573KqEj4C1BuinltFwHxl8rUD8yqi/vbPDPflNqaQ61MEe7rm4VonfX
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10366"; a="256079840"
X-IronPort-AV: E=Sophos;i="5.91,274,1647327600"; 
   d="scan'208";a="256079840"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2022 03:00:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,274,1647327600"; 
   d="scan'208";a="613215278"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 03 Jun 2022 03:00:08 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 4ACC5D99; Fri,  3 Jun 2022 13:00:07 +0300 (EEST)
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
Subject: [RFC PATCH v3 6/6] iio: adc: meson_saradc: Use regmap_read_poll_timeout() for busy wait
Date: Fri,  3 Jun 2022 13:00:04 +0300
Message-Id: <20220603100004.70336-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220603100004.70336-1-andriy.shevchenko@linux.intel.com>
References: <20220603100004.70336-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_030011_886946_CE43A4AB 
X-CRM114-Status: GOOD (  15.00  )
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

Simplify busy wait stages by using regmap_read_poll_timeout().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v3: new patch, but RFC, not always the read_poll_timeout() can be used, would
    be nice to have it tested.

 drivers/iio/adc/meson_saradc.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index c100f933c12e..c18be3c519af 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -322,22 +322,17 @@ static int meson_sar_adc_calib_val(struct iio_dev *indio_dev, int val)
 static int meson_sar_adc_wait_busy_clear(struct iio_dev *indio_dev)
 {
 	struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
-	int regval, timeout = 10000;
+	int val;
 
 	/*
 	 * NOTE: we need a small delay before reading the status, otherwise
 	 * the sample engine may not have started internally (which would
 	 * seem to us that sampling is already finished).
 	 */
-	do {
-		udelay(1);
-		regmap_read(priv->regmap, MESON_SAR_ADC_REG0, &regval);
-	} while (FIELD_GET(MESON_SAR_ADC_REG0_BUSY_MASK, regval) && timeout--);
-
-	if (timeout < 0)
-		return -ETIMEDOUT;
-
-	return 0;
+	udelay(1);
+	return regmap_read_poll_timeout_atomic(priv->regmap, MESON_SAR_ADC_REG0, val,
+					       !FIELD_GET(MESON_SAR_ADC_REG0_BUSY_MASK, val),
+					       1, 10000);
 }
 
 static int meson_sar_adc_read_raw_sample(struct iio_dev *indio_dev,
@@ -489,7 +484,7 @@ static void meson_sar_adc_stop_sample_engine(struct iio_dev *indio_dev)
 static int meson_sar_adc_lock(struct iio_dev *indio_dev)
 {
 	struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
-	int val, timeout = 10000;
+	int val, ret;
 
 	mutex_lock(&indio_dev->mlock);
 
@@ -499,18 +494,18 @@ static int meson_sar_adc_lock(struct iio_dev *indio_dev)
 				   MESON_SAR_ADC_DELAY_KERNEL_BUSY,
 				   MESON_SAR_ADC_DELAY_KERNEL_BUSY);
 
+		udelay(1);
+
 		/*
 		 * wait until BL30 releases it's lock (so we can use the SAR
 		 * ADC)
 		 */
-		do {
-			udelay(1);
-			regmap_read(priv->regmap, MESON_SAR_ADC_DELAY, &val);
-		} while (val & MESON_SAR_ADC_DELAY_BL30_BUSY && timeout--);
-
-		if (timeout < 0) {
+		ret = regmap_read_poll_timeout_atomic(priv->regmap, MESON_SAR_ADC_DELAY, val,
+						      !(val & MESON_SAR_ADC_DELAY_BL30_BUSY),
+						      1, 10000);
+		if (ret) {
 			mutex_unlock(&indio_dev->mlock);
-			return -ETIMEDOUT;
+			return ret;
 		}
 	}
 
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
