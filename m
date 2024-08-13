Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D78C52D7C
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Aug 2024 12:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iRiad1OMoS3DfQi3CGHoSnQG0K1+y53dd8Mu3rNDfDw=; b=F7oHCUqlrjNLKb
	+QkC1wafhyyAsapYpeSvgw5LWDwyWDoXyIGTE9Ylt/OVvvNTcYSqFwFEFRCdSXtKnSLhTAf7Kvy0Y
	SkiuO5YwZGdFEwShXsDw6CJjjs9UX2Ng9aw/2QFI91Fni6nAS5GT5mxz2NxKwb5w/9R7+UNUIvvpg
	5UMoq4/49SGKgQyz6Bjd0kla4eOr/kA6m6vn9f/YExrlKEk0Ekf0105Wk/kEKJA8VjbyPtEo0ma42
	kTX7Yo0Z5nztu/zzT+744VMO+gcJ2Be8CabqAK5A0ZczSJGlj07jUy5vNpCsVSbWOeFf5bJF6PsVf
	D2rQ4gCl5tTmjhxAo2NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdqQ5-00000003eE4-03ln;
	Tue, 13 Aug 2024 12:14:33 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdqPP-00000003dxN-3Rzh
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Aug 2024 12:13:53 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-7a1df0a9281so342099085a.1
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Aug 2024 05:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723551231; x=1724156031; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q2YaJNxhLs5F8lLYTx7H4r6rahb3C2THbGnEdQxh/xA=;
        b=NdGNnMmYjXTiQhIqrhDTUQt/Y2RwP3Y1mR+FmneTV/+GR7aXSuWcuUure5XspjwV8i
         ibhhVipNdFf//zW4+CncsBIZ0UjYDkLN1G5ulAVDw02FT1J2VChInCgzHFnXZWu+uqOu
         1JR1hJArFyK6tDuq7Fu1usL+H4IyWcuV9f1/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723551231; x=1724156031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q2YaJNxhLs5F8lLYTx7H4r6rahb3C2THbGnEdQxh/xA=;
        b=AQLu1cyFEuLJuEUPrq92ao9kp3BVZlpMqItS4HbzDrM+y672nkdCq2NcHGGuQDUk42
         et3hh3jjrSNDNoruX+HJoC5PET+L+R48QooC5mxSC8CEPbgw2cXEzZaDWhwM3u+Elnxb
         0Nb6iL8SysuGxmJNiE3Dx+e0VWWxGMX/ODTDMA9nXK6C15SJk9GnBFINHAnBuJt6Jxd4
         DVRG39ZceN49jlKGbDIGVFusYF24aBYo6D6ls29jj871Fk7Dc6YH3fOLyK8kIUILuS7C
         TwzIJv3U0TURH2k9MoigTg02aWPCF6K8goGut9QSMjtzrazjjNMswC9fvwymnvcFTxEK
         N2qQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWyPf8dUMLmFIr3FV8+5wMomUiV3zVnk71Bk+Y+Z6dXiaz0RcgDpQrXpDZY/7lXVVeticU5T4JuxQoqBYRM1YEXP654/yxpi075nxg65a0i98=
X-Gm-Message-State: AOJu0Yxp21hVr+Zm1rtJuSqFtTP8wdsc+HsinVKdXe8d1G+tOcdCnZ4l
	pdcdqiACveSRN9N70jM0pFUf5AbHyo9xmfW3ZCdeEUT696sL9fWvKuX4AfKzw5WhoskTPQQ+hks
	=
X-Google-Smtp-Source: AGHT+IEbPwywblqg1PHmJ6WOVqLAFdQNUuhFh7OmJ87lW/f5GlJN4YVEnCjKh12Gxxs2z0IijZihGw==
X-Received: by 2002:a05:620a:4109:b0:7a1:e2e0:b3c9 with SMTP id af79cd13be357-7a4e151ba74mr391481985a.24.1723551230715;
        Tue, 13 Aug 2024 05:13:50 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7d71ca8sm331765485a.50.2024.08.13.05.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:13:50 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 13 Aug 2024 12:13:48 +0000
Subject: [PATCH 1/6] media: ar0521: Refactor ar0521_power_off()
MIME-Version: 1.0
Message-Id: <20240813-smatch-clock-v1-1-664c84295b1c@chromium.org>
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
X-CRM114-CacheID: sfid-20240813_051351_925837_89264484 
X-CRM114-Status: GOOD (  12.56  )
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

Factor out all the power off logic, except the clk_disable_unprepare(),
to a new function __ar0521_power_off().

This allows ar0521_power_on() to explicitly clean-out the clock during
the error-path.

The following smatch warning is fixed:
drivers/media/i2c/ar0521.c:912 ar0521_power_on() warn: 'sensor->extclk' from clk_prepare_enable() not released on lines: 912.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/ar0521.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
index 09331cf95c62..2c528db31ba6 100644
--- a/drivers/media/i2c/ar0521.c
+++ b/drivers/media/i2c/ar0521.c
@@ -835,7 +835,7 @@ static const struct initial_reg {
 	     be(0x0707)), /* 3F44: couple k factor 2 */
 };
 
-static int ar0521_power_off(struct device *dev)
+static void __ar0521_power_off(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct ar0521_dev *sensor = to_ar0521_dev(sd);
@@ -850,6 +850,16 @@ static int ar0521_power_off(struct device *dev)
 		if (sensor->supplies[i])
 			regulator_disable(sensor->supplies[i]);
 	}
+}
+
+static int ar0521_power_off(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ar0521_dev *sensor = to_ar0521_dev(sd);
+
+	clk_disable_unprepare(sensor->extclk);
+	__ar0521_power_off(dev);
+
 	return 0;
 }
 
@@ -908,7 +918,8 @@ static int ar0521_power_on(struct device *dev)
 
 	return 0;
 off:
-	ar0521_power_off(dev);
+	clk_disable_unprepare(sensor->extclk);
+	__ar0521_power_off(dev);
 	return ret;
 }
 

-- 
2.46.0.76.ge559c4bf1a-goog


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
