Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13741C52D7C
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Aug 2024 12:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EfXkfxTeaAMu8nR8Qa/jUoYY3yEojT2Cj0bPJJBaC6Y=; b=P5gSSTgCfB8MBb
	KF5XzzLoFoEqmhiKkyt2G+MH7hKtEAP0IStpmOOfYvGHZTREaN9tU8qnrO/Q9M8+pRtAth/wz8+2I
	oU4chMrXoj4EcSGqSC98dpvBq5b7Iejd1LhLK/th7i95slQdFGppmKEw72edo6VMfno8S+7nIIirH
	eCum41feouM+wCskww9c01ugUO7yQ+6owlRTFZG3rKxMa8b22GHJ0GlA/K0topS/qUkUDsFsdnQ/m
	slYibqHHZkIyXl6gy2GQDB4Bc40nNX/IRY1adqlheoe2xcKYrJvUc+ce2W+kyE9BxNzNKMuOL18RD
	MQkxijpJjL9SsGalzFrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdqRG-00000003edC-0YvD;
	Tue, 13 Aug 2024 12:15:46 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdqPQ-00000003dy8-1NBU
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Aug 2024 12:13:54 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7a1d5f6c56fso310956685a.0
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Aug 2024 05:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723551231; x=1724156031; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1NN4I3pMa1z6u3JhFybH/YMr+WwEfsG16l3i3ACZ6OI=;
        b=m4CT+x6rZqT/TorFNXeP+l01jIxOsxklij4CODEm97J8cXw4Rxoc+ZodcE2SjGA5Xh
         b59KNVlO22ELQBim+dX15hnnIMwP1BWYgtWvILhInQenIiYvvZTpUb266u6le9xUNb2J
         O6Z6WJx/KxmgEGOjQyYclrnQlfSVSpcPBucbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723551231; x=1724156031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1NN4I3pMa1z6u3JhFybH/YMr+WwEfsG16l3i3ACZ6OI=;
        b=nNyJSNwm93PmNoeokM5VYBvDbKB163g7d/k2diydoy3bBHFkCJwvrSUbAXKwPmeGYt
         sA07WcOt0vavtJwdss8Kv6RrCOHtIqlinEcHHCbUaIQjnYIeaAN1JvSZrNFSLoWelk+C
         wEo1hCrLsPJCZ1qKro5LUT5KDDN/Bw/ooSsbLxDzVsVsAL/4kKwNQbX0do49N3jY2+rr
         qPcq6Pk4ioMPokzBUiDqsTjWzBXO80CYAJ0Z3gr8PVxdHJY/LJnckUmH7bBwLc/eSgxv
         kUTeURU4pM+c/lyyAWK0oHjZL0dT0mrevPyQU76TzX01VcjbyL6hXCeuMnPwRsKH2fGv
         Oetg==
X-Forwarded-Encrypted: i=1; AJvYcCU9ejgYq7Vx8SF9XMak3Mq3KHWBme0C3X5MgY9jbVdsr78VcumPFFm3Ig2VFg+SqKtk875mlbXdRYQfDcHtrJX9ezhoHuEUMpKncj5wyXxsDA0=
X-Gm-Message-State: AOJu0YyzmJA6TA8TfDNbl6Q9BkogyiET7Xu9B0euxk4gRwOiL5ObitjF
	cgwSDGqwjc2n67C9OZgEMKweA655GEPBJxpycgi3Pbl8d+7OFW0w6gX6FvaxQg==
X-Google-Smtp-Source: AGHT+IEbzzCLxiIWDetpY/N6kglqi3rroSN+bG6y6yQxlctkjM/b9mCaiLCXSWS8MVpF1YKtj23MkQ==
X-Received: by 2002:a05:620a:4451:b0:79d:76e5:be76 with SMTP id af79cd13be357-7a4e15afa64mr377756785a.41.1723551231504;
        Tue, 13 Aug 2024 05:13:51 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7d71ca8sm331765485a.50.2024.08.13.05.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:13:51 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 13 Aug 2024 12:13:49 +0000
Subject: [PATCH 2/6] media: i2c: ov5645: Refactor ov5645_set_power_off()
MIME-Version: 1.0
Message-Id: <20240813-smatch-clock-v1-2-664c84295b1c@chromium.org>
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
X-CRM114-CacheID: sfid-20240813_051352_454997_24263BF4 
X-CRM114-Status: GOOD (  10.93  )
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

Factor out all the power off logic, except clk_disable_unprepare(), to a
new function __ov5645_set_power_off().

This allows ov5645_set_power_on() to excplicitly clean-out the clock
during the error-path.

The following smatch warning is fixed:
drivers/media/i2c/ov5645.c:690 ov5645_set_power_on() warn: 'ov5645->xclk' from clk_prepare_enable() not released on lines: 690.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/ov5645.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index 6c2d221f6973..0c32bd2940ec 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -635,7 +635,7 @@ static int ov5645_set_register_array(struct ov5645 *ov5645,
 	return 0;
 }
 
-static int ov5645_set_power_off(struct device *dev)
+static void __ov5645_set_power_off(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct ov5645 *ov5645 = to_ov5645(sd);
@@ -643,8 +643,16 @@ static int ov5645_set_power_off(struct device *dev)
 	ov5645_write_reg(ov5645, OV5645_IO_MIPI_CTRL00, 0x58);
 	gpiod_set_value_cansleep(ov5645->rst_gpio, 1);
 	gpiod_set_value_cansleep(ov5645->enable_gpio, 0);
-	clk_disable_unprepare(ov5645->xclk);
 	regulator_bulk_disable(OV5645_NUM_SUPPLIES, ov5645->supplies);
+}
+
+static int ov5645_set_power_off(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov5645 *ov5645 = to_ov5645(sd);
+
+	__ov5645_set_power_off(dev);
+	clk_disable_unprepare(ov5645->xclk);
 
 	return 0;
 }
@@ -686,7 +694,8 @@ static int ov5645_set_power_on(struct device *dev)
 	return 0;
 
 exit:
-	ov5645_set_power_off(dev);
+	__ov5645_set_power_off(dev);
+	clk_disable_unprepare(ov5645->xclk);
 	return ret;
 }
 

-- 
2.46.0.76.ge559c4bf1a-goog


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
