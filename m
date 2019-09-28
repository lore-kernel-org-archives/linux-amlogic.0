Return-Path: <SRS0=08rP=XX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAFC4C4360C
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Sep 2019 00:46:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A9FE20863
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Sep 2019 00:46:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SJISGhgg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ucr.edu header.i=@ucr.edu header.b="r4fcNMNe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A9FE20863
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ucr.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=0V2Dt2kMCq2iFv68xnpGKjajBP9LCNVwRA0zQ5EMJzk=; b=SJI
	SGhggXKXrQBv+jYILxHYD3Zq4LU4G2CYOP5dkQ4DRN6Lfz6ryhH3WC3aly9Ti9uhzem2qAdIz54kY
	qpoMILy278j/7m/ySw0RdVRGECOIQs9Pjf9B9/u7X0l5dN4IPtpmr+EW5jX0/xXJcZiuFIbFudZMI
	m5wJHRoEgNrQpWA1OcshRFcCkD050qP13dQ/DV+LXkgN4HrNV6WBgC4JX1OfgovmV4skPIFgbbecr
	4bTovy1Bo758uSwAElbxIG8Zbc5IxbPJuSXPIFxfdJ2WkiP5g4VKX/o8JdhhRP3x3mpWh0xJEtpjd
	H34P21P78+qHQBVL8Jb+82Sx4DCsufA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iE0s7-000370-Vc; Sat, 28 Sep 2019 00:46:03 +0000
Received: from mx2.ucr.edu ([138.23.62.3])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iE0s5-00036R-Ev
 for linux-amlogic@lists.infradead.org; Sat, 28 Sep 2019 00:46:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
 t=1569631561; x=1601167561;
 h=from:to:cc:subject:date:message-id;
 bh=Gyih0+ys/dsZuk6p5tTk9jxHvhG3+TejPRIPLUcLycQ=;
 b=r4fcNMNelVKQz6Ykpc2XLK+N5160eGKs8qfNIHumoGr5+jc8p3Xd0yv3
 BSwq5gjXZw8sgw/ql2L4tWUD4XIFAz64XHct932t/+EPeny0x946YVNCJ
 Obt8GvnRmI06fs9RXoRqakOmS/AWbuxZsODrkfmpN255giprJT1z8/+IL
 NmfGLyyUpZ1fGxoWT8HIjM9SEfI8JBM96XLekB821zM69wooJVZLIQLdQ
 AZBc6elqiYPh38n9iiyDF91xH9GBi2KRxscl1sd0pdwOY8x6VhIGaxuNJ
 AyJV89cML5K17E94xweLfty+OTK+Zjq0N9JMc005F1C5J8dPtoS+3Isj5 A==;
IronPort-SDR: iMivE65R/1VGROgKa9jz07/onH1+xsMD/pTzyiwmm03S/rl6zHle6Vwz8MPdG5DcWIPKumP4R6
 xiXd8/Bhspt+cjnuzbw8+fHZSexLHVYO+SFgffw6CspQ+lU8J/VZcXj8cTva5rU+pt9ngj0EpE
 dW7jKjcI7xLt+tMQV2doGzRj9M21Jtxg59ufSgD79ijHuI1WegBxxz7PtDY0ZyvXWMMxioi4kO
 54r3O0mNFX3mcxXFqQUMjRYUEazUfO8SrZB4RGUZW0YB+uP34D0iqJkR2MteEuTAkNju9qmE2S
 Lpc=
IronPort-PHdr: =?us-ascii?q?9a23=3ABip/YBIL/mDIhbRhTdmcpTZWNBhigK39O0sv0r?=
 =?us-ascii?q?FitYgeKv3xwZ3uMQTl6Ol3ixeRBMOHsqkC0LWd6P2ocFdDyK7JiGoFfp1IWk?=
 =?us-ascii?q?1NouQttCtkPvS4D1bmJuXhdS0wEZcKflZk+3amLRodQ56mNBXdrXKo8DEdBA?=
 =?us-ascii?q?j0OxZrKeTpAI7SiNm82/yv95HJbAhEmTSwbal8IRi0ogncuMkbipZ+J6gszR?=
 =?us-ascii?q?fEvmFGcPlMy2NyIlKTkRf85sOu85Nm7i9dpfEv+dNeXKvjZ6g3QqBWAzogM2?=
 =?us-ascii?q?Au+c3krgLDQheV5nsdSWoZjBxFCBXY4R7gX5fxtiz6tvdh2CSfIMb7Q6w4VS?=
 =?us-ascii?q?ik4qx2UxLjljsJOCAl/2HWksxwjbxUoBS9pxxk3oXYZJiZOOdicq/BeN8XQ2?=
 =?us-ascii?q?9BXsdKVyxaA4O8aYQPBPcfM+hBsoL9qVoOogW6BQaxGejjzjFFimPz0aA8zu?=
 =?us-ascii?q?8vExzJ3BY4EtwOrnrasdv7OqQVX+2u0KXE0S/OY+9M1Dvh9ITFdA0qr/GWXb?=
 =?us-ascii?q?J3dMrc0UsgFwLEj1WQtIzlOC6e2+MNsmma7+pvT+Ovh3I7pwx/uTWv29sjip?=
 =?us-ascii?q?PTio0L11/E6Dx0zYAoLtO7UE52ecCoHIdUui2ANIZ7QtkuT391tCs10LEKpJ?=
 =?us-ascii?q?q2cSoSxJg6xhPSb+aLf5aG7x/jTuqdPzZ1iGhndb+wgRu57FKuxffmVsau1V?=
 =?us-ascii?q?ZHti9Fkt7RuX8TzxHT8c2HSudl/kemxDaPyxjf6uFaLkAwkqrWM5shzaQxlp?=
 =?us-ascii?q?oXqEjDBiv2lFjvgK+Ya0kp/uql5/7oYrXhoZ+cOIt0hR/kPqsyncy/BPw0Mg?=
 =?us-ascii?q?kIX2eF5eSxzKPv8VH9TblQjfA7krPVvI7HKckUvKK1HgtY34Q75xa6FTim0d?=
 =?us-ascii?q?AYnXcdLFJCfRKKl4joOlDOIP/iDPezn0ignTlwyvDbIrLhGI/BIWben7f8Zb?=
 =?us-ascii?q?p98VJTyBIvzdBD4JJZErUBIPP1Wk/su93UFwU2Mwmww+bgB9V9158RVHmLAq?=
 =?us-ascii?q?+YK6PSrUSI6vguI+mKao8VoizyJOU76PH0kHA1g1gdfbOm3chfRmq/G6FXIl?=
 =?us-ascii?q?eZfH2k1sYTEW4L5lJlZPHhkhuPXSMFNCX6ZL41+jxuUNHuNozEXI34xePZ0Q?=
 =?us-ascii?q?=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2FFCgCvrI5dgMXWVdFmHgEGEoFcC4N?=
 =?us-ascii?q?eTBCNHoVzUAMGiyaBCYV6iDGBewEIAQEBDAEBLQIBAYRAgzojNAkOAgMJAQE?=
 =?us-ascii?q?FAQEBAQEFBAEBAhABAQkNCQgnhUKCOimDNQsWFVKBFQEFATUiOYJHAYF2FKE?=
 =?us-ascii?q?xgQM8jCUziHEBCQ2BSAkBCIEihzWEWYEQgQeBEYNQh2OCRASBLwEBAYs/gjG?=
 =?us-ascii?q?HK5ZJAQYCghAUgXiTByeEOYk9iz8BLYoonGoCCgcGDyOBL4IRTSWBbAqBRFA?=
 =?us-ascii?q?QFIFaFxWOLSEzgQiOPQE?=
X-IPAS-Result: =?us-ascii?q?A2FFCgCvrI5dgMXWVdFmHgEGEoFcC4NeTBCNHoVzUAMGi?=
 =?us-ascii?q?yaBCYV6iDGBewEIAQEBDAEBLQIBAYRAgzojNAkOAgMJAQEFAQEBAQEFBAEBA?=
 =?us-ascii?q?hABAQkNCQgnhUKCOimDNQsWFVKBFQEFATUiOYJHAYF2FKExgQM8jCUziHEBC?=
 =?us-ascii?q?Q2BSAkBCIEihzWEWYEQgQeBEYNQh2OCRASBLwEBAYs/gjGHK5ZJAQYCghAUg?=
 =?us-ascii?q?XiTByeEOYk9iz8BLYoonGoCCgcGDyOBL4IRTSWBbAqBRFAQFIFaFxWOLSEzg?=
 =?us-ascii?q?QiOPQE?=
X-IronPort-AV: E=Sophos;i="5.64,557,1559545200"; d="scan'208";a="11257792"
Received: from mail-pl1-f197.google.com ([209.85.214.197])
 by smtp2.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Sep 2019 17:46:00 -0700
Received: by mail-pl1-f197.google.com with SMTP id h11so2623273plt.11
 for <linux-amlogic@lists.infradead.org>; Fri, 27 Sep 2019 17:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=WVXKJFPAYYP31lJ6IlM5/o8x5LjKeBVij0jUlLnOB1Y=;
 b=mqMHAHjPMhchJqu5r2zDIgcoR1iqg9fzZwHfW1WbSRY3skR8tRilSb4cgGd89PWYme
 6wCbzwj42elcPCKj/m04wJ7OTSPegJUxx/+sP/+v84Pi08S+bdukHO3V46uwVAu7/8rX
 xVhJY72ent/RrNdmWL3/Xc46xePPED2QEZivoGwG12tOFkv83l1/wOxl+7vGsxuZV8jc
 8XuMT/2ylDOMTFqWN3HqFf/TJogYnJb0UVmebHAQy4xvHCAMIm8/eJBbe4pMuHm6pT6q
 H3jeSliNj2ej5nUiidqjREa2BDYmjKCkKXzNZLgkR/OK3f+cy0so2gpyFejXYVRZRM9N
 vmOQ==
X-Gm-Message-State: APjAAAVpXdlRWFdfoCQqwrDn9d7aOHYXWoyjqpTRP/yZQzlofm1b7Hbg
 0N+Y+67dipeYPw2PHUeT4/GHprXKpErcSZ/GL/H5bpfyqaEQzhbyKWibVbM8Km+JxSYKSnHEasm
 ILlhCRyYYNbWGzn03zpIe5BuBDd83LWv3
X-Received: by 2002:a17:90a:3301:: with SMTP id
 m1mr13556466pjb.27.1569631560294; 
 Fri, 27 Sep 2019 17:46:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx/7cnNYMLx9aWgtGrOZYcIU8PemYtXquLbvog1tYQtmk61OBe75ni/14YXREFeG7CW3SRlDg==
X-Received: by 2002:a17:90a:3301:: with SMTP id
 m1mr13556446pjb.27.1569631560014; 
 Fri, 27 Sep 2019 17:46:00 -0700 (PDT)
Received: from Yizhuo.cs.ucr.edu (yizhuo.cs.ucr.edu. [169.235.26.74])
 by smtp.googlemail.com with ESMTPSA id r2sm4136689pfq.60.2019.09.27.17.45.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2019 17:45:59 -0700 (PDT)
From: Yizhuo <yzhai003@ucr.edu>
To: 
Subject: [PATCH] iio: adc: meson-saradc: Variables could be uninitalized if
 regmap_read() fails
Date: Fri, 27 Sep 2019 17:46:41 -0700
Message-Id: <20190928004642.28932-1-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190927_174601_528521_A5E00F3C 
X-CRM114-Status: GOOD (  13.24  )
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
 zhiyunq@cs.ucr.edu, linux-kernel@vger.kernel.org, Yizhuo <yzhai003@ucr.edu>,
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
 drivers/iio/adc/meson_saradc.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index 7b28d045d271..c032a64108b4 100644
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
@@ -358,7 +361,11 @@ static int meson_sar_adc_read_raw_sample(struct iio_dev *indio_dev,
 		return -EINVAL;
 	}
 
-	regmap_read(priv->regmap, MESON_SAR_ADC_FIFO_RD, &regval);
+	int ret = regmap_read(priv->regmap, MESON_SAR_ADC_FIFO_RD, &regval);
+
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
+					MESON_SAR_ADC_DELAY, &val);
+			if (ret)
+				return ret;
 		} while (val & MESON_SAR_ADC_DELAY_BL30_BUSY && timeout--);
 
 		if (timeout < 0) {
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
@@ -1014,7 +1028,11 @@ static irqreturn_t meson_sar_adc_irq(int irq, void *data)
 	unsigned int cnt, threshold;
 	u32 regval;
 
-	regmap_read(priv->regmap, MESON_SAR_ADC_REG0, &regval);
+	int ret = regmap_read(priv->regmap, MESON_SAR_ADC_REG0, &regval);
+
+	if (ret)
+		return ret;
+
 	cnt = FIELD_GET(MESON_SAR_ADC_REG0_FIFO_COUNT_MASK, regval);
 	threshold = FIELD_GET(MESON_SAR_ADC_REG0_FIFO_CNT_IRQ_MASK, regval);
 
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
