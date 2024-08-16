Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3364C3DA4A
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Aug 2024 12:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lCRQo0zK/HYQO0WUeU9nXuIHXB0G5XGwgDl4TWClGDs=; b=3pM6TTwMfoUMui
	GMHOiOGKggbVsrfBWeiZ1BFMtjRvLfBWfHD6b7TF1N3BIKxMMqErk8Ax4OGfy7cf4+UJ4nZVEBEIn
	Fr/AuWn1N4XeF/9W1CXchf/NOK7VBXWZBYcwf8FIgn/0i5DyJX93MrpQjFf0F0HPiuy09OQT/T9Ru
	KkSy7+iphg+l5aqJwMUK6/u4uWlnmzCBonLGwka8OEUkMCRsqsUM1wLPRDw/7TaED7iMd3t99zMg8
	o7CxypTfu0PHs748tHdOeWnvVKG1XZsOJtMQj+xyQSSqKNv7isfo4512cXJDGUpQXxEcXnFrggOsB
	9FRgtq2QqFFTs+Uv66gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sew8P-0000000Cssm-0RzK;
	Fri, 16 Aug 2024 12:32:49 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sew7h-0000000CsdN-37bL
	for linux-amlogic@lists.infradead.org;
	Fri, 16 Aug 2024 12:32:08 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6bf84c3d043so1123566d6.3
        for <linux-amlogic@lists.infradead.org>; Fri, 16 Aug 2024 05:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723811525; x=1724416325; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rfdvYEITLctEiJZFaHWRY9JyibDLYc0ZAVB9q9sxkkI=;
        b=Hv2T0JrzNkzPE32xhkCsFlKFqhQnzZfjXSHWR981Si7Lq88fT/0h3QfJzvfIpABRsm
         g38bc+J4X+ESqm5GFhQxD7JuVieJEmJAMloiKenlbhu7JwsoNjuhQGjjWHI2JbXy9YAU
         rZA7WkAY8QzS5qTnPsxDpomejy3y2xlocFbHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723811525; x=1724416325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rfdvYEITLctEiJZFaHWRY9JyibDLYc0ZAVB9q9sxkkI=;
        b=maMzeEhgNvrDN7n+CVj1psjjAO49F+mSAx4hPd/EbxR5gMrd3qcDbIfO+VzNatBjWx
         2Wc2DqokyGMZbKle8eyt/Q7jAWXos3vGdlB8y6yoDNOI9FvJpt25qx6otPZ8i5a/9vUB
         YO1AxZXGqwZXz5DLITBjCvWBQgs4quLhBWi5YzjV+KADQwXqWJPOe0F5oe8RYKGRqxMY
         ewxD4Jwz52D+LKOK7XfbVAxcCfI9Ue6JGuHO/lnZTiOqRkIoPTFPWgJk1Iys8MAyNzC9
         y3aIralSguG8zcxQK3jB10qDn3QbbFCF8BDDr1FxcraTG21bmvwuNPMphpXaxpLMD2C9
         wUHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTAFOagcBYzCFcr8pMW3PtPbUU8Qku0tn410yvu9wdZbpfTZrqBMnoG4Th8Q6CBf9culP40G9Op/IRPEoz@lists.infradead.org
X-Gm-Message-State: AOJu0YzgAxGGjwubMyFj3QkgEuApyBnnhZbOVhiOYF8gNCePk2IJt9kM
	r5+2AnqIb1ZoO+4glXZL8GX67y5ycbObl+wSV+IClsO2BBkupWc3UY3vbxctZw==
X-Google-Smtp-Source: AGHT+IEykfMYCYnAHIqKejoI5UsxnxEpAhtpapnpWCBE4rLm0ZmyJu5Jr8Cmioy5du0vYTkAoMT82A==
X-Received: by 2002:a05:6214:4520:b0:6b7:ae86:e33e with SMTP id 6a1803df08f44-6bf7ce59f5cmr23889246d6.37.1723811524592;
        Fri, 16 Aug 2024 05:32:04 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fef3107sm16881426d6.121.2024.08.16.05.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 05:32:04 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 16 Aug 2024 12:32:00 +0000
Subject: [PATCH v2 2/6] media: i2c: ov5645: Refactor ov5645_set_power_off()
MIME-Version: 1.0
Message-Id: <20240816-smatch-clock-v2-2-c63105db07e8@chromium.org>
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
X-CRM114-CacheID: sfid-20240816_053205_862080_BA7AF4EE 
X-CRM114-Status: GOOD (  10.81  )
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
2.46.0.184.g6999bdac58-goog


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
