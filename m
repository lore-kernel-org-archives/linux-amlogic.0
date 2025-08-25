Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0847FCA0FEE
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Aug 2025 15:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mYZXhfV6Obcxt7g9JiPUNoQcHM8ItUyWUp2jyEbPx3g=; b=Wf9TS/5gmZjbUk
	nrvogGg70ZnBJHJJYHVLkMqevd7Nmll1YTFHmT6mmlxO5XU8iiXNrEoXWZO8qXOZHTQYMonYjpUl3
	AFKVUdHkDQIiCbHlq24JyARvctePe4fY3iz/IKsbUURE6E4pwimkVZ3sTsrO99LIGfZ0NQtC7WvM7
	sjXwFmLYv2YVe7DpLrYRCc0ewQ/gZYMLyhYXeY3np/GnA3Hoknxtlf0KtUjX11xD2Od0M8sqoSd5G
	SnViixNKYpL11oEJQFBychcy+CQCz8l58H1qSmqAqsKauEDnrfIZxrte6TwfHDaOZRWCJUboHN0X5
	ViaXLPMcjJmvJBTi/paw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZ9N-00000008WAW-06vi;
	Mon, 25 Aug 2025 15:30:25 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYA9-00000008Fg6-0noa
	for linux-amlogic@lists.infradead.org;
	Mon, 25 Aug 2025 14:27:10 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45b60fd5a1dso8308245e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 25 Aug 2025 07:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1756132028; x=1756736828; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3E0OX3l7hSZpbmIvG6p8r2X61gE3s0wO+uAxqyQVEXs=;
        b=Wz4HdLaAbFty6hUbX+K8yJB2rJi94Ohj2ecXO1c5QYGb8mphsJMDIp6qzmbRemqzzc
         xU/+31BiggDX5DJAQPoy0v/a2CCW/QLHr33A8L28zX+BgjW8KeqJf4dRN/bWwwRVUzLY
         aMIBITkmyDi7YM0KP9i0BOzwS9hgS1EAbP3J+jDwMIs7XYOxI6D48t29qxcpiWTYPTeE
         lw3pGXT7r2mHYg4PLvpQCvTEWAobx5mdqbw4U3HrHV1h31trFdC9NDX5foGeUOiANVQS
         OtKyN1R/4HIcMWl45h3mvAm0UmTNiseecBMGhtmJpVorHSJ8LH92ObYObGkZhPJ7h2o5
         Y5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756132028; x=1756736828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3E0OX3l7hSZpbmIvG6p8r2X61gE3s0wO+uAxqyQVEXs=;
        b=Ajc2mUQCiHXqBqMnC8gXxnXsAoJgOOq3hRKPeMZNGLMJkdqb+ZlZLyt3GfRhCphKeG
         pU8I9rXXW01rf6naPtnA3gHzXpBI6RmEk2J9pBjBUFFYGAjYpqnb13HwAqmMwkBYlZN8
         ymmEV2xXtA8xJzyvInpv5k1JRyuJDQoOhjFehoel95KR6JtkY138JGuCWWZEGPV9X9wc
         ggCNRKPuVeKB4Y93+/Wo2Qk9pvK4Bm9r+c+ub5N4LNobtxeUrACyM5HsF3f3eWqBDBwq
         Pj9aL4H0EyBqSYBSI4eqOgNlx7EXKhbLcm3cNEbCMJKpxuO9BxutgBdYj82D2Fl8jl44
         Oq3g==
X-Gm-Message-State: AOJu0YzMg91ZpEDqHxhaM+b22xNHG1AIYkBIvwzyaabBx9mWpOD0Uad5
	hmB8+GSFXv9LvBt8UAiVJ07+WdS3r/Y+Va5u8UJwMd/66pvAqPL7BRCLzSKh3TL6Ldg=
X-Gm-Gg: ASbGncv6LSjX4DD6OWs7Htg1pa55HZuWwKF8t14CaOd48OcaRGig3QC4M2z8SfWTUun
	O2bYetrXhA3xjSUkXtnKJcPuyj4qZduIeGf0wQ5tMg4WNEty0/H+anEGOd16237FI9Y+XzMd999
	LADUIj7geH+sl0+0iSwDbdYJl09l5WLuIXQsAPiOfeRC4jRgdr+hB+0tjUSXgHY1Lkd3r8FC3Zo
	BafLSyW7h01+94rygJAgYKPckSYTCqoiX/gAsUezXic+FmJJZqDgal5qSHddoC6SFk/Ew73uwQ6
	4jHV+maVAWcftz1cBviYU5L5TnIxvV+oQkkscFxG98AjR9nWW5/bhOpjxVrOLtP1Fc678NKoLre
	xRXgNlhavmL1WJgAAF0tOQaThOeLvwYpsHo6T
X-Google-Smtp-Source: AGHT+IG97/qISA8MqcZl/mFg7nS0dUGfrxzbGW4TGxFceOnmVdStCa+f8SnHWO66tjzhKARbGRvgHg==
X-Received: by 2002:a05:600c:3b2a:b0:453:2066:4a26 with SMTP id 5b1f17b1804b1-45b5179f3d1mr151618155e9.16.1756132027543;
        Mon, 25 Aug 2025 07:27:07 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:b261:baab:ed3d:3cb6])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3c70e4b9e1fsm12634462f8f.14.2025.08.25.07.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:27:07 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 25 Aug 2025 16:26:27 +0200
Subject: [PATCH v2 02/12] clk: amlogic: add probe helper for mmio based
 controllers
MIME-Version: 1.0
Message-Id: <20250825-meson-clk-cleanup-24-v2-2-0f402f01e117@baylibre.com>
References: <20250825-meson-clk-cleanup-24-v2-0-0f402f01e117@baylibre.com>
In-Reply-To: <20250825-meson-clk-cleanup-24-v2-0-0f402f01e117@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3563; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=+HNEh7kwqO29/XBYa7Ua9Z9/DByHKmxsSbqdzoDcKd4=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBorHKvxaowyPgU9EztKNOZEz2aQx91OrxuPgs8m
 8sKoQw4BwGJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaKxyrwAKCRDm/A8cN/La
 hVQXD/0aAjUtx5KRzTTrPI2utKSOITXpjIpBAvWOFFJyhdNjV05yalKeYTT73MxL9ZEsqMnajIw
 66jChhvqaYDcHddLUwTzMsX+EOJd/rhwUgqlIYEVXlGwmzg8dEQcp/qwJS1ECewk0Kta4JoYH+z
 OuD1oz4bbhp4xJLOSckzAKW43qHjy/5yjl7RjjVo5E29EmcE5mnRs9TKaN9K8f7/3SmDmyHMQfs
 2DDziIS0L6j3BsURuw/oplHoooSN7de9FN5MgPQprrKdLvSxj6DKVMGYW5bUZOgXCAwXFkCRPyO
 1qtBA5VYOXA6UfvPxHCu5t/r7rFYBj4Wr+GwEe5x7MODMm5ExB4daArLYtuD3d91rQPdyfk+IG3
 yKIynnIKuC2W5CwvRJu/sfWruBp9yMhyV247opoYmx9vnqrmwBxB8ZyumqxcMarcmuEm5kdCXgI
 ORY2mdkUfYE2JgN1jDDzvzIg5rBrmITtlmAYpO6Jdsc2ixMYYsPKIjXTVHLhPxoXQdFm8kevemX
 4foheR30XhsMspEdnJgRnoh82yVeVG+/fPUpFqqp4NTg+kTPGGvdY+QedZWsrzwfndqOE+EB2e/
 IMlMcWjAKop3gFKJpRO4RIaKkm8sTCXYql/1QQ9DUB/im7pDrh3QPOWj3Y5zPeKZcFzYIIcH2rw
 4zBO2MbxH7HjyhQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_072709_267782_ED6E7E77 
X-CRM114-Status: GOOD (  15.20  )
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

Add a 2nd probe function helper for mmio based controllers, which
are getting the memory region from a resource instead of a syscon.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/meson-clkc-utils.c | 62 ++++++++++++++++++++++++++++--------
 drivers/clk/meson/meson-clkc-utils.h |  1 +
 2 files changed, 50 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/meson/meson-clkc-utils.c b/drivers/clk/meson/meson-clkc-utils.c
index 49f562d0f203b9a7d15b5119100216564c10cb21..870f50548e26841130dd4267f5a79c8bcd188c70 100644
--- a/drivers/clk/meson/meson-clkc-utils.c
+++ b/drivers/clk/meson/meson-clkc-utils.c
@@ -26,12 +26,9 @@ struct clk_hw *meson_clk_hw_get(struct of_phandle_args *clkspec, void *clk_hw_da
 }
 EXPORT_SYMBOL_NS_GPL(meson_clk_hw_get, "CLK_MESON");
 
-int meson_clkc_syscon_probe(struct platform_device *pdev)
+static int meson_clkc_init(struct device *dev, struct regmap *map)
 {
 	const struct meson_clkc_data *data;
-	struct device *dev = &pdev->dev;
-	struct device_node *np;
-	struct regmap *map;
 	struct clk_hw *hw;
 	int ret, i;
 
@@ -39,15 +36,6 @@ int meson_clkc_syscon_probe(struct platform_device *pdev)
 	if (!data)
 		return -EINVAL;
 
-	np = of_get_parent(dev->of_node);
-	map = syscon_node_to_regmap(np);
-	of_node_put(np);
-	if (IS_ERR(map)) {
-		dev_err(dev,
-			"failed to get parent syscon regmap\n");
-		return PTR_ERR(map);
-	}
-
 	if (data->init_count)
 		regmap_multi_reg_write(map, data->init_regs, data->init_count);
 
@@ -68,8 +56,56 @@ int meson_clkc_syscon_probe(struct platform_device *pdev)
 
 	return devm_of_clk_add_hw_provider(dev, meson_clk_hw_get, (void *)&data->hw_clks);
 }
+
+int meson_clkc_syscon_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np;
+	struct regmap *map;
+
+	np = of_get_parent(dev->of_node);
+	map = syscon_node_to_regmap(np);
+	of_node_put(np);
+	if (IS_ERR(map)) {
+		dev_err(dev, "failed to get parent syscon regmap\n");
+		return PTR_ERR(map);
+	}
+
+	return meson_clkc_init(dev, map);
+}
 EXPORT_SYMBOL_NS_GPL(meson_clkc_syscon_probe, "CLK_MESON");
 
+int meson_clkc_mmio_probe(struct platform_device *pdev)
+{
+	const struct meson_clkc_data *data;
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	void __iomem *base;
+	struct regmap *map;
+	struct regmap_config regmap_cfg = {
+			.reg_bits	= 32,
+			.val_bits	= 32,
+			.reg_stride	= 4,
+	};
+
+	data = of_device_get_match_data(dev);
+	if (!data)
+		return -EINVAL;
+
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	regmap_cfg.max_register = resource_size(res) - regmap_cfg.reg_stride;
+
+	map = devm_regmap_init_mmio(dev, base, &regmap_cfg);
+	if (IS_ERR(map))
+		return PTR_ERR(map);
+
+	return meson_clkc_init(dev, map);
+}
+EXPORT_SYMBOL_NS_GPL(meson_clkc_mmio_probe, "CLK_MESON");
+
 MODULE_DESCRIPTION("Amlogic Clock Controller Utilities");
 MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS("CLK_MESON");
diff --git a/drivers/clk/meson/meson-clkc-utils.h b/drivers/clk/meson/meson-clkc-utils.h
index 26cd47544302b28ca1a342e178956559a84b152a..b45f85f630d7190fb6509b088f05f17ca91fa1c8 100644
--- a/drivers/clk/meson/meson-clkc-utils.h
+++ b/drivers/clk/meson/meson-clkc-utils.h
@@ -25,5 +25,6 @@ struct meson_clkc_data {
 };
 
 int meson_clkc_syscon_probe(struct platform_device *pdev);
+int meson_clkc_mmio_probe(struct platform_device *pdev);
 
 #endif

-- 
2.47.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
