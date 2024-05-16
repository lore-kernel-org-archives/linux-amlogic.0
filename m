Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A53C25B77
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 May 2024 15:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iofhkf40duATzvgTSspYabpYCydyo/98mEeXcsbsCiU=; b=GJhNqP16mf2Kqm
	aVBQrsHdfmOi5MbxrsRAj4TpLtfm23XTMqgsMvtKunI2O/FM3Ek58F36wNv3TE1JUHAu1vLaGMRYo
	N9H3+bY2xAu/ak+DR/ddN1RNU/PvDLrUrtE+s7y5CkVYnMNC/9QK5SsMP0Ct9sOL6cWjgK7MOHYRR
	DwUO7+oP4Jtb0g+DXdILRIeYWIgjhv1TObhKl1RlzAWLc+orRdQmynmxjc4q1/Be+Z9+APqDGbhMy
	OfzJrVA3uSDAlCJRokVZ/3AjRc5RTF0vm+V5+RdRt2NLRTNKo8R0BEEY1VONYH5qsZUKSnMPdqlz8
	H3u63TIwSddbwdiMp8pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7cjB-00000005FsI-0IZO;
	Thu, 16 May 2024 15:09:05 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7ciy-00000005FlF-0JLA
	for linux-amlogic@lists.infradead.org;
	Thu, 16 May 2024 15:08:54 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2e43c481b53so10198101fa.2
        for <linux-amlogic@lists.infradead.org>; Thu, 16 May 2024 08:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715872130; x=1716476930; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zlq2XgSsulaEdUEoiNJy3+0ETTvrLEFhmOVX/TPKWFg=;
        b=VN4TZlJNCM9/pQVp48v+pLj76vLGIHocNXox1aSqFVd//sfeX8kzmFGN7tAJFm6Bq/
         Syx1YgfM4yGtJYd2eFRpIfnSYC1pdllJQ5e8Ui0H/nyIocLkn9FQUXj/LkkNK8QSSAAT
         5RctPTk8cRjh2dCGC1WKUnxbBJYjnxnr8nE9DOI9ISGKmV8u9GI4F6t//wa35mQSMMmu
         e7Iw45Q5ZBEjL16E3ue2eJNRseYOTk7zhhJFM2tTQLJhRXtiYVmpp7tQO7VwNnY0qDaE
         M447+H+QxpJA0FEoUsumWwJgCt37GF98Zc76KJmccDqY3XYa7QnDZhwrvZIoBH3OoY+H
         n8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715872130; x=1716476930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zlq2XgSsulaEdUEoiNJy3+0ETTvrLEFhmOVX/TPKWFg=;
        b=GV05nkOECeFx6OAd9a9CeFtHoWX8MG2Kir8gcCVN587Fs+E+C6mSlgc/YA6gclqFNo
         JvC7hZROCOobf4wTBUT4HUjicCPenlJ08QOxIxhYCE387omkYXQspyORUs3VHUQ9MG7y
         fkv6hVcJ9HirMnz3OnC3M3dz0eJq7yrnkb2WY7U5F6EE+XnSJUXVK0sDDiWIdcxHKR+n
         ol/pjoOcVVdm4HW+JrRo20dL7heEfhWbRQG5UcE9fQMP6Pa9fU35cFGQtuQKPavXZkvW
         Du1k4gSSTWyCtI2Xpd58jSeYMjXjKvA8KxNoNB6HGRK2o1Xoas3T5F/yNGyHJQGfb0up
         3pAA==
X-Forwarded-Encrypted: i=1; AJvYcCXZc5mPz3pQOYjJYhh1w1wCNVHDvVNCQhI6QiKWpJVTsF7EXHLUzrETqam8Nn4uJvxJUBpizmHbjASCiZ6UZjjWwPmohoE8NDkY6Cp5MlaXI+Y=
X-Gm-Message-State: AOJu0YyaVVaOqf+JLecGWdA3z3903JEBlZF1VNf/+2E2H+00yHbwtgVv
	6dIw28VVItVeJlUFKGx3yLKOEpU52S4JSKnAzcXYutl3CJXqQA1UW0x/q/hqadE=
X-Google-Smtp-Source: AGHT+IHr28udNSRatyT+2G5LNG1+hGVEMFrX9RhYuqKy2yHAm390/4kDGgRKQKwjLoGX9pVtnsJ34g==
X-Received: by 2002:a2e:5112:0:b0:2e6:d2bc:1d18 with SMTP id 38308e7fff4ca-2e6d2bc24e5mr52015521fa.22.1715872129966;
        Thu, 16 May 2024 08:08:49 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1fce:7e5a:e201:edd5])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-41f87c25459sm309351725e9.18.2024.05.16.08.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 08:08:49 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [RFC PATCH 3/9] reset: amlogic: split the device and platform probe
Date: Thu, 16 May 2024 17:08:33 +0200
Message-ID: <20240516150842.705844-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240516150842.705844-1-jbrunet@baylibre.com>
References: <20240516150842.705844-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_080852_442044_6E3F5A74 
X-CRM114-Status: GOOD (  14.76  )
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

To prepare the addition of the auxiliary device support, split
the device probe from the probe of the platform device.

The device probe will be common to both the platform and auxiliary
driver.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-meson.c | 55 +++++++++++++++++++++++--------------
 1 file changed, 34 insertions(+), 21 deletions(-)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index 59126c9f194a..fec55321b52b 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -87,6 +87,27 @@ static const struct reset_control_ops meson_reset_ops = {
 	.deassert	= meson_reset_deassert,
 };
 
+static int meson_reset_probe(struct device *dev, struct regmap *map,
+			     const struct meson_reset_param *param)
+{
+	unsigned int stride = regmap_get_reg_stride(map);
+	struct meson_reset *data;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->param = param;
+	data->map = map;
+	data->rcdev.owner = dev->driver->owner;
+	data->rcdev.nr_resets = param->reg_count * BITS_PER_BYTE
+		* stride;
+	data->rcdev.ops = &meson_reset_ops;
+	data->rcdev.of_node = dev->of_node;
+
+	return devm_reset_controller_register(dev, &data->rcdev);
+}
+
 static const struct meson_reset_param meson8b_param = {
 	.reg_count	= 8,
 	.reset_offset	= 0x0,
@@ -125,46 +146,38 @@ static const struct regmap_config regmap_config = {
 	.reg_stride = 4,
 };
 
-static int meson_reset_probe(struct platform_device *pdev)
+static int meson_reset_pltf_probe(struct platform_device *pdev)
 {
+
+	const struct meson_reset_param *param;
 	struct device *dev = &pdev->dev;
-	struct meson_reset *data;
+	struct regmap *map;
 	void __iomem *base;
 
-	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
-
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	data->param = of_device_get_match_data(dev);
-	if (!data->param)
+	param = of_device_get_match_data(dev);
+	if (!param)
 		return -ENODEV;
 
-	data->map = devm_regmap_init_mmio(dev, base, &regmap_config);
-	if (IS_ERR(data->map))
-		return dev_err_probe(dev, PTR_ERR(data->map),
+	map = devm_regmap_init_mmio(dev, base, &regmap_config);
+	if (IS_ERR(map))
+		return dev_err_probe(dev, PTR_ERR(map),
 				     "can't init regmap mmio region\n");
 
-	data->rcdev.owner = THIS_MODULE;
-	data->rcdev.nr_resets = data->param->reg_count * BITS_PER_BYTE
-		* regmap_config.reg_stride;
-	data->rcdev.ops = &meson_reset_ops;
-	data->rcdev.of_node = dev->of_node;
-
-	return devm_reset_controller_register(dev, &data->rcdev);
+	return meson_reset_probe(dev, map, param);
 }
 
-static struct platform_driver meson_reset_driver = {
-	.probe	= meson_reset_probe,
+static struct platform_driver meson_reset_pltf_driver = {
+	.probe	= meson_reset_pltf_probe,
 	.driver = {
 		.name		= "meson_reset",
 		.of_match_table	= meson_reset_dt_ids,
 	},
 };
-module_platform_driver(meson_reset_driver);
+module_platform_driver(meson_reset_pltf_driver);
 
 MODULE_DESCRIPTION("Amlogic Meson Reset Controller driver");
 MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
