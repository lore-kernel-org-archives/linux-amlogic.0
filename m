Return-Path: <SRS0=gjj1=XY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D86D0C4360C
	for <linux-amlogic@archiver.kernel.org>; Sun, 29 Sep 2019 16:48:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A78F821835
	for <linux-amlogic@archiver.kernel.org>; Sun, 29 Sep 2019 16:48:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F6EEQb4D";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ucr.edu header.i=@ucr.edu header.b="r7yN2/UK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A78F821835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ucr.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=EqQAzMaxS9TnphycvBofhqRgcmp5f1YExo1RJd6H2TI=; b=F6E
	EQb4DBVRFVPiPFjUH+fvUa2pMXs77j3zi7hV0Ae8ro4uqpLP103BByG5LZBjI/h7DR3ce3cFpVU0e
	ruA0oRATKL6G/GsyZFu2gqOyc+AFRxqrT/g5RECAohb89gAaQKzy9EH9+ZZlNOJAR85vg0ME2NVsE
	btnNVZcXi+B5/OszwcdOXVLVj4LLI4CGOm3pzsNdkNIGFCAnph19AZnMPSdK6ma2iBpjim5xWt5MM
	5nPDbipFrAGWxnAEXfJ5BcJ3KXanU7RjEfV5R9hSyf22lGwpDKW7kXxTq2I1mvDIc/Bxu8UkDaWH4
	9UyWcXXdFitHwcHX9YQV6iKKo2eCRQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iEcN5-0007W9-4c; Sun, 29 Sep 2019 16:48:31 +0000
Received: from mx1.ucr.edu ([138.23.248.2])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iEcN1-0007V7-Gh
 for linux-amlogic@lists.infradead.org; Sun, 29 Sep 2019 16:48:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
 t=1569775709; x=1601311709;
 h=from:to:cc:subject:date:message-id;
 bh=UNKIGMa4Eg+l+IVQcMpLQFIdcsa8oCD4s9qyVCpjIUE=;
 b=r7yN2/UKzsTxLc0oYieweRj75azVtGXdPRKXsp+rtUNVEnHO8ue8r2XT
 zAPeDQEM4RThP+l3NRXCDg+RhPgjRgke7F47x6vf7SGxjGd70sSWDPo7B
 TDCePgct4oo8AQdrnErrRp3+SSUkOLKZWJBRUiw9mMJYVp8qal9ztbCwV
 kTqFSeZ4QU2a3/QApwuFOW4sSkH6XQyvgVGHITatlJz687VPHTK9xeSFU
 u/RsCi4/ITZhnGq4vCormj/5sMx4aqNJ0kvhGe36W1rbwS7J//RsJ7sIb
 gnqo1A4Z2qYnQjFEruj/uiUh2ghu/4IIr3kSbsK6nZngFBYJjGGpaDODH g==;
IronPort-SDR: No5L5xzrDtQLmLvNyFXU5qRI2Qd8aWrhHuvV1zWbqNX5qgmgK8T13OcsPNklBwsZ7AtWRSFy8d
 dt01ETfUuxe0O5f2Gt1IVE0+1Nj9Tx4CxseQVctJUp5iZ43Pf8mQ3d6ThtC/cNNnnHjcRoEXMU
 YXdVoxiV3kf54kOY65Oe8qFWxJitcsxpfo4208ZNKDxLgdatClxuvAn9gsUjppOWNfV3WJxE7E
 YcS0tvwwqO3Jts67ZtSiDkM9acjWCQnAmGu4zLhtbAmYjb5N1O+5hXr06DJgztuqE4GS8rJ12U
 um4=
IronPort-PHdr: =?us-ascii?q?9a23=3ATUrishemXZOY2dnDa3fzad/6lGMj4u6mDksu8p?=
 =?us-ascii?q?Mizoh2WeGdxcS6YB7h7PlgxGXEQZ/co6odzbaP6Oa8ASdZucnJmUtBWaQEbw?=
 =?us-ascii?q?UCh8QSkl5oK+++Imq/EsTXaTcnFt9JTl5v8iLzG0FUHMHjew+a+SXqvnYdFR?=
 =?us-ascii?q?rlKAV6OPn+FJLMgMSrzeCy/IDYbxlViDanbr5+MRu7oR/eu8UKjoduN7o9xx?=
 =?us-ascii?q?nUqXZUZupawn9lK0iOlBjm/Mew+5Bj8yVUu/0/8sNLTLv3caclQ7FGFToqK2?=
 =?us-ascii?q?866tHluhnFVguP+2ATUn4KnRpSAgjK9w/1U5HsuSbnrOV92S2aPcrrTbAoXD?=
 =?us-ascii?q?mp8qlmRAP0hCoBKjU063/chNBug61HoRKhvx1/zJDSYIGJL/p1Y6fRccoHSW?=
 =?us-ascii?q?ZdQspdUipMAoa9b4sUFOoBPOBYr4bgrFUQtBW1GAesBOLxxT9Mm3D9wKk23u?=
 =?us-ascii?q?o9HQ3D2gErAtAAv2nOrNjtNKkcT/27wqfLwzvEdP5axSvx5ZLUfh07vf2AQb?=
 =?us-ascii?q?R9etfRx0k1EAPFi02dpo7kPzKU1uQNrm+b5PdnWOOvim8nqxt+ojmzysswhI?=
 =?us-ascii?q?TEnZ8VxUze9Slj3ok6OMC4RVd9bNW5E5VQrzmXO5VqTs4mWW1luyY3xqcYtZ?=
 =?us-ascii?q?KmYCQG0okryhrdZvCfboSF4xbuWPyPLTp2hH9pYqyziheo/UWixeDxUNS/3k?=
 =?us-ascii?q?xQoSpfiNbMs2gA1xnU6seaVPRw5lyh2TOT1wDL7eFEPFw0mbLbK5E/xr4wkY?=
 =?us-ascii?q?IesUHZES/3nEX6lbeWdks59uSx5eTrf7Hrq52GO497jQH+NasumsihDugiLg?=
 =?us-ascii?q?cOWG2b9fy91L3l40L5XK1HguMqnqTdqpzXJsQWqrSnDwNIzoov8QuzAjOk3d?=
 =?us-ascii?q?gAmHkINlNFeBaJj4jzPFHOJej1DPe+glSsijhrxuzKMqHvD5jWM3jMjK3hca?=
 =?us-ascii?q?xj5EFB1Qo/1cpf6I5MCrEdPPLzXVf8tNjZDh8/Lgy1zP/rB8941oMaXmKPDa?=
 =?us-ascii?q?6ZP7/JvF+M5+IvOPWMZJQPtDb8Lfgl6eTugmUkllADZ6amwIEbaHeiHvRpcA?=
 =?us-ascii?q?23e33p1+YAA2cXuUJqXf7qgVzaCWV7en2oGa8w+2doW8qdEY7fS9X10/S61y?=
 =?us-ascii?q?ChE8gTOThL?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2EZBQAI4JBdgMXSVdFmHgEGEoFcC4N?=
 =?us-ascii?q?eTBCNHoVyUQEBBosmgQmFeogxgXsBCAEBAQwBAS0CAQGEQIM6IzQJDgIDCQE?=
 =?us-ascii?q?BBQEBAQEBBQQBAQIQAQEJDQkIJ4VCgjopgzULFhVSgRUBBQE1IjmCRwGBdhS?=
 =?us-ascii?q?fPYEDPIwlM4hqAQkNgUgJAQiBIoc1hFmBEIEHgRGDUIdjgkQEgS8BAQGLP4I?=
 =?us-ascii?q?xhyuWSQEGAoIQFIF4kwcnhDmJPYs/AS2KKJxrAgoHBg8jgS+CEU0lgWwKgUR?=
 =?us-ascii?q?QEBSBWhcVji0hM4EIkA8B?=
X-IPAS-Result: =?us-ascii?q?A2EZBQAI4JBdgMXSVdFmHgEGEoFcC4NeTBCNHoVyUQEBB?=
 =?us-ascii?q?osmgQmFeogxgXsBCAEBAQwBAS0CAQGEQIM6IzQJDgIDCQEBBQEBAQEBBQQBA?=
 =?us-ascii?q?QIQAQEJDQkIJ4VCgjopgzULFhVSgRUBBQE1IjmCRwGBdhSfPYEDPIwlM4hqA?=
 =?us-ascii?q?QkNgUgJAQiBIoc1hFmBEIEHgRGDUIdjgkQEgS8BAQGLP4IxhyuWSQEGAoIQF?=
 =?us-ascii?q?IF4kwcnhDmJPYs/AS2KKJxrAgoHBg8jgS+CEU0lgWwKgURQEBSBWhcVji0hM?=
 =?us-ascii?q?4EIkA8B?=
X-IronPort-AV: E=Sophos;i="5.64,563,1559545200"; d="scan'208";a="10866398"
Received: from mail-pf1-f197.google.com ([209.85.210.197])
 by smtp1.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Sep 2019 09:48:09 -0700
Received: by mail-pf1-f197.google.com with SMTP id a1so6022643pfn.1
 for <linux-amlogic@lists.infradead.org>; Sun, 29 Sep 2019 09:48:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=utdaQ4jWHTttFql8WKqbnsQdQq9GY1vzrMBpLN2a9NQ=;
 b=NODwk3YxP10rDrrFAADwgZEZQIGq+8+BE8UiajSi0jn7fbecQ3oJZvzhds4C88P+OR
 ErcpKTvkQttxqHVXjqcmlYQOCfShBKIJJmmJdRhZiu1oaS14Rshi8S31nMcysNnBidqy
 m7TbDV29Jj+OiSmRq+JgcVK5PJXLiWtuePKi/5u4cLPZg3PmvYTe8e1TmwCPeiMaTstK
 g7gYpfJWmslmCl13KLddrLZmJ2SDasHlztkyy9BbgoRhxGtSWwiX0pJqkzG9KgaV+sYk
 ugpfGjHb3tuyWgLJ4AQ41vV/8Xe4Ou5BER2EsLNskvDFtLV4Hjvl98eOdpcav4OGlzeS
 Uwag==
X-Gm-Message-State: APjAAAXu8P97pEgqiCwwz1nwE7kGX8XnU98RiVBfdH30FpVQNIQ7VNOJ
 Bu2zOzLZ+kfpt2GD8SyXTfz5moOYE9wDUNPGD0he0Wa3L9cX/AHsTswqj4FvmQA2Q6w6EyFG2+j
 FpZzV8r7JgXXdoHPW1NstKQBSPy1GXO9+
X-Received: by 2002:a17:90a:3090:: with SMTP id
 h16mr22224050pjb.46.1569775687368; 
 Sun, 29 Sep 2019 09:48:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxJjjuQpguiCEE+oT8FZ21bOrlaI5ek77fAN6CJVVTks05KOo47tYsfxvPiCR9IDOpmjYNCew==
X-Received: by 2002:a17:90a:3090:: with SMTP id
 h16mr22224024pjb.46.1569775687030; 
 Sun, 29 Sep 2019 09:48:07 -0700 (PDT)
Received: from Yizhuo.cs.ucr.edu (yizhuo.cs.ucr.edu. [169.235.26.74])
 by smtp.googlemail.com with ESMTPSA id ep10sm26814605pjb.2.2019.09.29.09.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Sep 2019 09:48:05 -0700 (PDT)
From: Yizhuo <yzhai003@ucr.edu>
To: 
Subject: [PATCH] iio: adc: meson-saradc: Variables could be uninitalized if
 regmap_read() fails
Date: Sun, 29 Sep 2019 09:48:43 -0700
Message-Id: <20190929164848.13930-1-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190929_094827_591517_7054BBA8 
X-CRM114-Status: GOOD (  13.54  )
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
Cc: csong@cs.ucr.edu, Lars-Peter Clausen <lars@metafoo.de>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Nicholas Mc Guire <hofrat@osadl.org>,
 zhiyunq@cs.ucr.edu, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Yizhuo <yzhai003@ucr.edu>,
 linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Hartmut Knaack <knaack.h@gmx.de>,
 linux-amlogic@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Jonathan Cameron <jic23@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Several functions in this file are trying to use regmap_read() to
initialize the specific variable, however, if regmap_read() fails,
the variable could be uninitialized but used directly, which is
potentially unsafe. The return value of regmap_read() should be
checked and handled.

Signed-off-by: Yizhuo <yzhai003@ucr.edu>
---
 drivers/iio/adc/meson_saradc.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index 7b28d045d271..4b6c2983ef39 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -323,6 +323,7 @@ static int meson_sar_adc_wait_busy_clear(struct iio_dev *indio_dev)
 {
 	struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
 	int regval, timeout = 10000;
+	int ret;
 
 	/*
 	 * NOTE: we need a small delay before reading the status, otherwise
@@ -331,7 +332,9 @@ static int meson_sar_adc_wait_busy_clear(struct iio_dev *indio_dev)
 	 */
 	do {
 		udelay(1);
-		regmap_read(priv->regmap, MESON_SAR_ADC_REG0, &regval);
+		ret = regmap_read(priv->regmap, MESON_SAR_ADC_REG0, &regval);
+		if (ret)
+			return ret;
 	} while (FIELD_GET(MESON_SAR_ADC_REG0_BUSY_MASK, regval) && timeout--);
 
 	if (timeout < 0)
@@ -346,6 +349,7 @@ static int meson_sar_adc_read_raw_sample(struct iio_dev *indio_dev,
 {
 	struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
 	int regval, fifo_chan, fifo_val, count;
+	int ret;
 
 	if(!wait_for_completion_timeout(&priv->done,
 				msecs_to_jiffies(MESON_SAR_ADC_TIMEOUT)))
@@ -358,7 +362,10 @@ static int meson_sar_adc_read_raw_sample(struct iio_dev *indio_dev,
 		return -EINVAL;
 	}
 
-	regmap_read(priv->regmap, MESON_SAR_ADC_FIFO_RD, &regval);
+	ret = regmap_read(priv->regmap, MESON_SAR_ADC_FIFO_RD, &regval);
+	if (ret)
+		return ret;
+
 	fifo_chan = FIELD_GET(MESON_SAR_ADC_FIFO_RD_CHAN_ID_MASK, regval);
 	if (fifo_chan != chan->address) {
 		dev_err(&indio_dev->dev,
@@ -491,6 +498,7 @@ static int meson_sar_adc_lock(struct iio_dev *indio_dev)
 {
 	struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
 	int val, timeout = 10000;
+	int ret;
 
 	mutex_lock(&indio_dev->mlock);
 
@@ -506,7 +514,10 @@ static int meson_sar_adc_lock(struct iio_dev *indio_dev)
 		 */
 		do {
 			udelay(1);
-			regmap_read(priv->regmap, MESON_SAR_ADC_DELAY, &val);
+			ret = regmap_read(priv->regmap,
+						MESON_SAR_ADC_DELAY, &val);
+			if (ret)
+				return ret;
 		} while (val & MESON_SAR_ADC_DELAY_BL30_BUSY && timeout--);
 
 		if (timeout < 0) {
@@ -771,7 +782,7 @@ static int meson_sar_adc_init(struct iio_dev *indio_dev)
 {
 	struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
 	int regval, i, ret;
-
+	int ret;
 	/*
 	 * make sure we start at CH7 input since the other muxes are only used
 	 * for internal calibration.
@@ -784,7 +795,10 @@ static int meson_sar_adc_init(struct iio_dev *indio_dev)
 		 * BL30 to make sure BL30 gets the values it expects when
 		 * reading the temperature sensor.
 		 */
-		regmap_read(priv->regmap, MESON_SAR_ADC_REG3, &regval);
+		ret = regmap_read(priv->regmap, MESON_SAR_ADC_REG3, &regval);
+		if (ret)
+			return ret;
+
 		if (regval & MESON_SAR_ADC_REG3_BL30_INITIALIZED)
 			return 0;
 	}
@@ -1013,8 +1027,12 @@ static irqreturn_t meson_sar_adc_irq(int irq, void *data)
 	struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
 	unsigned int cnt, threshold;
 	u32 regval;
+	int ret;
+
+	ret = regmap_read(priv->regmap, MESON_SAR_ADC_REG0, &regval);
+	if (ret)
+		return ret;
 
-	regmap_read(priv->regmap, MESON_SAR_ADC_REG0, &regval);
 	cnt = FIELD_GET(MESON_SAR_ADC_REG0_FIFO_COUNT_MASK, regval);
 	threshold = FIELD_GET(MESON_SAR_ADC_REG0_FIFO_CNT_IRQ_MASK, regval);
 
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
