Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28EEC52D7D
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Aug 2024 12:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DFV2R31lDE512a2ldIRq2SQrBg4Qwbo1BVtKeLeL53U=; b=468HrLyi81IiqH
	Fssu9DrDYKpimcWF7PS2yV6GqOx9rmoDr9iDgD190OUkBTMEkdcv0BjgZ6MxFLgxqL2sfeLQBbeWc
	2ciFE3CXHdQLWeJAqI5ePg5iAcnjYNVrHQIGP9eT9VR0rVLhCp4VGraGZHfIS2Ziv39EGsaph9bNJ
	Bk3xLA6TTjv0jSiNMnTjk2WaTpInD1RII0+fY7LvMGh+L9wZ930Mbw4Vc+PCMtkTTuQZwKF0R/3/w
	P3SxgF3+gOf0r4+fWRpFzn7hDBlNaXP/lePkHzqg8yTRKHOYKAvE6S3TFVVux2JOWhtSQo6VWCD6Z
	chgJAXTIJIPUj7Ly/gCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sewBX-0000000Ctb9-1s0C;
	Fri, 16 Aug 2024 12:36:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sew7r-0000000CsjA-1TvU
	for linux-amlogic@bombadil.infradead.org;
	Fri, 16 Aug 2024 12:32:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=mnNFu46JmywYP9gLg0BBlkiX4LJAIV8Vvr47+Nzo0m8=; b=pVwf8chEugQgwjbg8GznAP9D/t
	bHHP8mwA18OfKnTeukAJ6McDmOn8UixkuYkOjn65rv0t34EmChA+QGnrlzEK1jNBnJmFNyQJFGkxR
	KboH/PZFOiJMNQJS6+F8Def8pyzaZCjOOqotiWYfhQT/IJ4pbIP5+UkHeaXKg/iPWJ7bElCCruQRz
	GV486UwCQzcPteFBYwa3CVeAkRk3yMeJmypsjhk3Wr+SwS6PAKMMTDmoex5Z8RVPwDDauKjye6ehh
	vQ6aQ+3H0AYfBD4vBLhcYInk3JvGp2ewx7YeBOhwN6oxjs/FJi8bOiVwexhDaBkFO40oHLhMU/oO1
	teCGXKxg==;
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sew7m-00000008eGr-2D6u
	for linux-amlogic@lists.infradead.org;
	Fri, 16 Aug 2024 12:32:13 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-6bf66fe9d8bso9565516d6.0
        for <linux-amlogic@lists.infradead.org>; Fri, 16 Aug 2024 05:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723811527; x=1724416327; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mnNFu46JmywYP9gLg0BBlkiX4LJAIV8Vvr47+Nzo0m8=;
        b=N26n4DgTqQ5pwzh214O2DcF1o5v9x4tG5VCfh2gEY+XJyJnJN/LKIKi3ISEGWGnFnz
         6nYG1yD4q+KGNrGYZVCKUeNb6ADBk0kEajnSB/x1Ofe/pcl9AE3OHh8/LzxZyRD2ps9y
         cXAYvStUOTtsPbix5IF93GjB/bLYsjvbXV2RA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723811527; x=1724416327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mnNFu46JmywYP9gLg0BBlkiX4LJAIV8Vvr47+Nzo0m8=;
        b=q+awPAliE9z0+l+CtY9oTN5zGj/4Li1BehHiKuoZ5MlJmkReG0leZUnln1udzRZpqY
         W2s6QKH9OrSIQcOe6jgh3yQ5auRg0hqauY5clwFLfDRZE0FJyo5l2Iz4ULHUo3HiqLWS
         CMEw3zPS/QcJW0PcXZg94Mjc+UL1vQ1GACS7DAPkc2jw5orMR3CxW4rJKjR4oKh1UnLc
         BILloIPcAVAz72Xz2SlyaxGimdGMk+1A/WeX85BjjLEtrMKtb4OsDXDstglBKaU5sawX
         SuWSPwKhLUA0T3nPAu+JxzLWL4NgO/N21tWJvqFW3c6ceko7MYCS8z2zAVYQ33hRxXaA
         fx9g==
X-Forwarded-Encrypted: i=1; AJvYcCXsk7cvWlS/8jNIm4p3vdMkUiDDSHdJhTzmkjIbO8NYcaJg20Y3AkMpe2tmn3t4jX0xwXzDrHDJ7+0d3WHyMG8HI2akXKNAaqC/Uf6VeHe/yTA=
X-Gm-Message-State: AOJu0YwmkncizU6xH8UJrV4FAQvj5F81s5AMUmeVY3rXuqprkzYRfXij
	yfkuRak4SboMQz2O+L+sHz7qK6DiwIg7lzRAg8wsddeewXPYBdNdCbOU8BQ1Uw==
X-Google-Smtp-Source: AGHT+IEXSYQZCNIKPB9LFR6rX4AtZ6JNPVrFndATYre1U0wDC52xZRkYWs1UJ+Wy8jMyb2SytEJSUQ==
X-Received: by 2002:a05:6214:a67:b0:6bf:7f5b:1d3 with SMTP id 6a1803df08f44-6bf7f5b0255mr17407566d6.16.1723811526538;
        Fri, 16 Aug 2024 05:32:06 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fef3107sm16881426d6.121.2024.08.16.05.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 05:32:06 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 16 Aug 2024 12:32:02 +0000
Subject: [PATCH v2 4/6] media: tc358746: Move clk_prepare to its own
 function
MIME-Version: 1.0
Message-Id: <20240816-smatch-clock-v2-4-c63105db07e8@chromium.org>
References: <20240816-smatch-clock-v2-0-c63105db07e8@chromium.org>
In-Reply-To: <20240816-smatch-clock-v2-0-c63105db07e8@chromium.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 =?utf-8?q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_133211_033908_5254BD91 
X-CRM114-Status: GOOD (  11.73  )
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

Smatch is very confused by a clk_prepare_enable() being called in an
error-path. Fix this warning by moving the clk_prepare_enable() to its
own function.

drivers/media/i2c/tc358746.c:1631 tc358746_suspend() warn: 'tc358746->refclk' from clk_prepare_enable() not released on lines: 1631.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/tc358746.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/tc358746.c b/drivers/media/i2c/tc358746.c
index edf79107adc5..389582420ba7 100644
--- a/drivers/media/i2c/tc358746.c
+++ b/drivers/media/i2c/tc358746.c
@@ -1616,6 +1616,16 @@ static void tc358746_remove(struct i2c_client *client)
 	pm_runtime_dont_use_autosuspend(sd->dev);
 }
 
+/*
+ * This function has been created just to avoid a smatch warning,
+ * please do not merge it into tc358746_suspend until you have
+ * confirmed that it does not introduce a new warning.
+ */
+static void tc358746_clk_enable(struct tc358746 *tc358746)
+{
+	clk_prepare_enable(tc358746->refclk);
+}
+
 static int tc358746_suspend(struct device *dev)
 {
 	struct tc358746 *tc358746 = dev_get_drvdata(dev);
@@ -1626,7 +1636,7 @@ static int tc358746_suspend(struct device *dev)
 	err = regulator_bulk_disable(ARRAY_SIZE(tc358746_supplies),
 				     tc358746->supplies);
 	if (err)
-		clk_prepare_enable(tc358746->refclk);
+		tc358746_clk_enable(tc358746);
 
 	return err;
 }

-- 
2.46.0.184.g6999bdac58-goog


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
