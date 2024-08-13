Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53E5C52D7B
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Aug 2024 12:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j64uYWcDKUUNKMdkwR2w/5oyxylwNiC82u3uCaXW2IY=; b=dbS5YMEefTMv59
	6qjRjmWvqLHxJDQ0GRyPM6D7CFWs4HBHzrwBnzcePRA/qJyOrzkzeVg2xmibnAYeTyWgfvDtLH9d8
	uWCWLHiQBQXYT0lx4rkFzNQQ6UNOB1fgknXIUc2mzdB/kNKwkVbPa5v4D/BGDVZZ5w0605BC6EopP
	1mZB99IkmKKZBQzahCITeGEowUbB2hWHW6FoNf+XDKfXct1lyjquYOwWBcaQfcwDzSAxKBwmyvMCi
	Zc7GCDR3w2OJ1FCXxWipqGFGCmQyHM0XKpBQIFzQexrtjeP+H+tSacUfo0M9FY9gTnbzR7N3K4yjQ
	UfGUGOlIJ01jzW+zdOew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdqRv-00000003ewm-2HfP;
	Tue, 13 Aug 2024 12:16:27 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdqPT-00000003dzp-0XUa
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Aug 2024 12:13:57 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-7a1d6f4714bso452434785a.1
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Aug 2024 05:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723551234; x=1724156034; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Etl9GyPmdRz22pfGaoR8C42DApQqo8svGDO8wQI1tI=;
        b=atdzlX0faKPxcp23lQW0fu/hpr/18j3+HddgmT0i8uRg2D2K+FphZ8L4+/ke2mIFlH
         lb3QHEcAqIe6q2C659jnSQh1o6qVHWcipNNpDG8GBDfo/o+A7vOJG3dnj/qDq3pUjhWF
         ag2AhEiBHGn3+kWMWrdLgcdhHfKHh+3bk5JZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723551234; x=1724156034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Etl9GyPmdRz22pfGaoR8C42DApQqo8svGDO8wQI1tI=;
        b=Wqkl4bpsHC4CNx6rzPyYAlRAgOeM2KvPFLciUbUcLkY58XUEVkvT4j7J71/VYQcNI4
         80UPGXPD7Q+B8agtx/LeNLzGbOMB26PUpF5DUWmmNbcwg05md6PgOgr0qsNThBPEVQEM
         8kYqGdQG1CCPTNhfkgS3NSLYSfKYuJg02Kar2xQhWgJRwSKfJf+n1bPSiT/oO1wOmWrp
         P7upNvVYA7qYP8biEGwGqotz0Eh0db+A8LiuHYcgJleId2qOWjdVmD0JjEmbdoTY39nu
         t78kRJ3cY5CnUyKtbPkqmf/aebzzvVZta4DpCTO2u6aSKZTHZ6jhOI/31+04mi9OZp+/
         LRyg==
X-Forwarded-Encrypted: i=1; AJvYcCVl0sGZ6ei99Z7AS9fP0mo2XKE0t670YX7McTy9jT07aI8jDFeyMA67odkq01xeKoGKTS28laIqNCvOne5xZ/DLpgAWJxeHCFiaj1eRWELD5II=
X-Gm-Message-State: AOJu0YxQ1bcyZrcu1bfjdlnBErwlq0FxwJtoyeXwCB7UQU2HEb6Dzqms
	uqCB+U8uCbrbTip4gms6MU3qLy6jcUKMtorsugUO1OOBQIHJKKiVUzQmu3GVqw==
X-Google-Smtp-Source: AGHT+IE5trF99pt6yxLy0hVGziVuLU740Yhk23ir8obTxxE56RFdMfq2z26jixLlIL2miIGD5ezz0A==
X-Received: by 2002:a05:620a:d82:b0:7a1:da71:e73a with SMTP id af79cd13be357-7a4e37605b0mr498168385a.2.1723551234290;
        Tue, 13 Aug 2024 05:13:54 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7d71ca8sm331765485a.50.2024.08.13.05.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:13:53 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 13 Aug 2024 12:13:51 +0000
Subject: [PATCH 4/6] media: tc358746: Move clk_prepare to its own function
MIME-Version: 1.0
Message-Id: <20240813-smatch-clock-v1-4-664c84295b1c@chromium.org>
References: <20240813-smatch-clock-v1-0-664c84295b1c@chromium.org>
In-Reply-To: <20240813-smatch-clock-v1-0-664c84295b1c@chromium.org>
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
X-CRM114-CacheID: sfid-20240813_051355_277531_3DF1E915 
X-CRM114-Status: GOOD (  11.91  )
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
2.46.0.76.ge559c4bf1a-goog


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
