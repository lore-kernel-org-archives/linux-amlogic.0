Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76128C25B74
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 May 2024 15:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xVlIKmLDZIE+els66MaH7ImtNWryk+VMYYbe74arcKU=; b=CQvcBowmJQOD0b
	vc+LnsDpo6cngNzm6EM5DuDjIGm8yPtAnyN9Ej7Ah0TdhWPhcpy0kfvIZXGyP5m+IeqChE5ulfB/z
	T70q15nNniAkUxsOX5SwhW01ygDuwvxtrbc5K/Y8XaK/LihAEG3x57jWkryXr14NZI06MWlaZUFW5
	/1uvxHwZ5MX6I1FLCaT13Mo5jFev5KcL8ykNDtOl5yIGrR+ZzlG+fUyuwp99I9kg5AYQ3ZzA18MKA
	9X7hEyXIyW2huim4sRSYKg6xmKFmwVe7MP3gAMjYo0siLqhibMcRnKOB7XenQbiYwQQjCu2VG8Jn/
	a6C1DtUO8qt31IkXSLKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7cjE-00000005Fv8-2VuJ;
	Thu, 16 May 2024 15:09:08 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7cj0-00000005Fmn-0zVO
	for linux-amlogic@lists.infradead.org;
	Thu, 16 May 2024 15:09:06 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2e271acb015so12135651fa.1
        for <linux-amlogic@lists.infradead.org>; Thu, 16 May 2024 08:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715872132; x=1716476932; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ypBfZt6woLl48yZMYWLwJnxD1n063j94AW3SXRtrghk=;
        b=g1g07MYNF0iJbWMxILTJfB651W5DdorvwUJyuk20w6KJCXfA6KEFssVWgcNuqLDBMm
         XplUvpUJKGRK9CChzuJ3CbNqtElK1t9WHNa7U5khPf5irGAPNRDrQwt1rfaGEJD5hSXS
         4Nv1AqvFK0KozN6qIy2fW+Vo/82M2RD3clDgITD4EKMF2hMliPRBEDNdKSXMVzSWF2X4
         BHrG64UW9klwMd96PWvfLTvSMZwoGBOPgHvthxLGHpT6bqmF2vg1gs3QxvIiuqvgv95V
         vGQc2Sh4yW0e+ySpFHNnaAtigc2nCEYU2dVwutZv8Z9qm5cEeuI2cRTxT1/dxJsbsmy3
         dYzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715872132; x=1716476932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ypBfZt6woLl48yZMYWLwJnxD1n063j94AW3SXRtrghk=;
        b=EwaGWlz8yUzqL9/MlLvLWT0WxmkcJ6ePPQ9hc7ZJk2I27KPefqLvKno2zd4cfItS3Q
         mZ+ykA+iy76dqrfVG39GipygnVlDpI+S4kDDOR8RMq3tpamp2f7Mf9DHuUe43j8xs/xc
         zSdcdGW4cQKpeTzFRExk82TgbGb9SQYqc3GmpQQCTtCaS/EPTgOV2aF16Y3qBVROw711
         jXsyieiAoztbs/LmcLU8g66lipRMcJz1gxRAy1HpfBWFZj/xTqKUhopHw8Yck0/6w1bU
         69k9suAfjBHBre/l5mJ5sRi4nkjZsAU3HkGcELQuDI6W+6kTQEuDrK00AAaWpQf5TYPQ
         Hb5g==
X-Forwarded-Encrypted: i=1; AJvYcCXzDYv0jbvfR7gl2B4CG79AvgsP0AAwKdzm+/JaAG1Qj0NOaG5T894xY7DZo1tsU8sXfcRtbwNZI6TeflPHAbapQ+j4TdR+C3C//16Ynfdfzhw=
X-Gm-Message-State: AOJu0YwbTJ/lbiehjG2EEHeko4MDv0q41bo2gbxgdmaBARDW3MuT3oCk
	3rX6PlrMqdVoKsvEMng9xd0dyQ5aE/era/3l8YVl/lzCGweQIIkZ/LEs8VnFAO0=
X-Google-Smtp-Source: AGHT+IE8U/D0l2CYHxsSjMxEnW9Nswfn86/rBWx05jmcgu+/3vQwWvbBIKiUixNYwUsYF7gN5EXKtA==
X-Received: by 2002:a2e:81c3:0:b0:2df:907e:6de3 with SMTP id 38308e7fff4ca-2e52038a44bmr116578741fa.35.1715872130810;
        Thu, 16 May 2024 08:08:50 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1fce:7e5a:e201:edd5])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-41f87c25459sm309351725e9.18.2024.05.16.08.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 08:08:50 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [RFC PATCH 4/9] reset: amlogic: use reset number instead of register count
Date: Thu, 16 May 2024 17:08:34 +0200
Message-ID: <20240516150842.705844-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240516150842.705844-1-jbrunet@baylibre.com>
References: <20240516150842.705844-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_080854_323988_59FB3044 
X-CRM114-Status: GOOD (  12.14  )
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

The reset driver from audio clock controller may register less
reset than a register can hold. To avoid making any change while
switching to auxiliary support, use the number of reset instead of the
register count to define the bounds of the reset controller.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-meson.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index fec55321b52b..3e0447366ba6 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -17,7 +17,7 @@
 #include <linux/types.h>
 
 struct meson_reset_param {
-	int reg_count;
+	unsigned int reset_num;
 	int reset_offset;
 	int level_offset;
 	bool level_low_reset;
@@ -90,7 +90,6 @@ static const struct reset_control_ops meson_reset_ops = {
 static int meson_reset_probe(struct device *dev, struct regmap *map,
 			     const struct meson_reset_param *param)
 {
-	unsigned int stride = regmap_get_reg_stride(map);
 	struct meson_reset *data;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
@@ -100,8 +99,7 @@ static int meson_reset_probe(struct device *dev, struct regmap *map,
 	data->param = param;
 	data->map = map;
 	data->rcdev.owner = dev->driver->owner;
-	data->rcdev.nr_resets = param->reg_count * BITS_PER_BYTE
-		* stride;
+	data->rcdev.nr_resets = param->reset_num;
 	data->rcdev.ops = &meson_reset_ops;
 	data->rcdev.of_node = dev->of_node;
 
@@ -109,21 +107,21 @@ static int meson_reset_probe(struct device *dev, struct regmap *map,
 }
 
 static const struct meson_reset_param meson8b_param = {
-	.reg_count	= 8,
+	.reset_num	= 256,
 	.reset_offset	= 0x0,
 	.level_offset	= 0x7c,
 	.level_low_reset = true,
 };
 
 static const struct meson_reset_param meson_a1_param = {
-	.reg_count	= 3,
+	.reset_num	= 96,
 	.reset_offset	= 0x0,
 	.level_offset	= 0x40,
 	.level_low_reset = true,
 };
 
 static const struct meson_reset_param meson_s4_param = {
-	.reg_count	= 6,
+	.reset_num	= 192,
 	.reset_offset	= 0x0,
 	.level_offset	= 0x40,
 	.level_low_reset = true,
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
