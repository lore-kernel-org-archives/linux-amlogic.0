Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FCEC41513
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jul 2024 16:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VMJHHFpxrO3hZdl3wNAdI9B83+fEBWhFpfG4hOCLcMg=; b=J/4+uKDikllW/n
	UsuqhZduZz7fgJzgY+DC/BbCD7pxt87KKWn/hkO292ATz6ut+SwbU5nZ8oatvRGlVQUDDBup55zlL
	h9yw1ir+pH0nq8I0WnJhjp144GWBmRLNYJMFtXG2DFL6xSL545UzX7ibCFJS61YHVV5e45uP4+u+E
	sBtG/In5nllOj+zaVZ/bHPI8wFdiADeDdte/NLyKFFEkLn7tfwuzHoaGl8Q3P+8yGFQ2ulRE2utRB
	a/4t33p3XqCuUuPVgc5FpF9r71cwU0/V4A4WZ7jGcXsAUy4yIfSfI9EqabH3VwuCuAkxeyAHQwEZQ
	Ucb8v2eT1XoXrMjPunCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRa8W-0000000B8gx-0g4a;
	Wed, 10 Jul 2024 16:25:44 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRa8T-0000000B8f3-2RU1
	for linux-amlogic@lists.infradead.org;
	Wed, 10 Jul 2024 16:25:43 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4266f535e82so16033125e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 10 Jul 2024 09:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720628740; x=1721233540; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cy32ICucHSRFg8Zvj0U3F+/oAcafvm3gP5oJRBTbz3s=;
        b=RX6ICOEQzzyARUNGJ3W0rHqrL+z3TNFTnNkCKvmiN/bbznHBFNNmSCus56P2/C44eM
         q+KzsZoYZlMw7El1O004db6bxUGSbKPPtQgWdE3r1tFKXneedK+7pIIYdop8P1LjCyjM
         gPlXWAkALSskX8wY/61JbqpIVdKBE0QRVZy6VQPYvzoeeUos+KH8nd2GzhTASxQJxefm
         bbtME5H58cCcAaoQzMZMFu7Xg2GVyt6CokK7mJek8L3hC0ouzocbLjmWmN/l6TSj+8mI
         1R1CcKV8dhE7qfux06/Y1rQMsaV0sWo/zzOz/AVNk7stqGvy2KPwVbdPwcBVdjSL02UR
         fXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720628740; x=1721233540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cy32ICucHSRFg8Zvj0U3F+/oAcafvm3gP5oJRBTbz3s=;
        b=UGVZ3+1NrTAWegMW1oKKHyX4KdYx9I4T2EteAVXK7/5D0P9d5wODlbtoYM4BLnIjie
         nPyL5NZkYU1q4gv9hvYGJavr8PsOqMGssqaWaEr8rZOz/g4HhTgVrVxcI21ymDEapX9u
         vMZ58mqhpJRuWjB+ywOiQUT5N6OfZ8Bln5YYUDT+TPW36UiucnjuhstpZM1CRjfW1RH/
         YfviXE7IWQPnWP9VS9qRykbiDP5GTni89i1rthqaF/x9gAj7Fo2+lv7zf4EfXI11bURj
         iHNHH0u1Cy2UvaqHZkoJ+ibEyiF3AljY+fvtG4RchE6Fs6mNi9L31jRKvEJ2ei79Yv3S
         w2Cg==
X-Forwarded-Encrypted: i=1; AJvYcCWpx7w7QesnlZ5+EPjkcY6/dm4os3j+ROTy5wD8mdayQ9wCQwdU7n4pDSNfjfrwwllDJ/sXM9iUR0CRBwmmEIPpOvhfJJmw3vCqqVKPvs2EoOw=
X-Gm-Message-State: AOJu0YwV/+qi7kcinHoP9gfdq3EOlZAojVhc4llfUMAgWMAZ2I55KA6t
	E2/QPFwS4iJ3u3iqkdteHpgDaM67RqoSD8LygoKo2jMN2xQCxaP4yvOERh8F2Xo=
X-Google-Smtp-Source: AGHT+IEuVqr7vAPRyxsPi49PFNqWl5DSKnIEvhUozJ1PVrnSPX2EIlRX+Aqw6wjznRQ9Dov91P/Otw==
X-Received: by 2002:a05:600c:896:b0:426:5216:3254 with SMTP id 5b1f17b1804b1-426708f1eebmr46095795e9.32.1720628739886;
        Wed, 10 Jul 2024 09:25:39 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1c99:6356:8466:36cf])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4266f6e09e5sm88693815e9.5.2024.07.10.09.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 09:25:39 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 3/8] reset: amlogic: split the device and platform probe
Date: Wed, 10 Jul 2024 18:25:12 +0200
Message-ID: <20240710162526.2341399-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240710162526.2341399-1-jbrunet@baylibre.com>
References: <20240710162526.2341399-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_092541_688846_75DC1DFD 
X-CRM114-Status: GOOD (  14.90  )
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
out the device probe from the probe of the platform device.

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
