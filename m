Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A98BEDE9A3
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Sep 2024 16:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ys/iH1pdo+yD7zY+TiZtBRyPSodGI3zS82TLE04KFsk=; b=2IeeUaSqIeYnPM
	KKPU93tchqOjm/P4ylsh+c5w80gQlJ3O8rwWv00iuBSb19M+C9y2FNt9MoxzGdqCBg6YdBT4uyfk+
	b/bgczDwDqYQyhowhbMVw3tZSVkLX6wuuC2qZSt6nszynKVAGNCWXXdpITnt//mHGi8YrC0mzZfC0
	Dn4+N0spLto9dUUd2QKZeRSuOW8S6sEmqs0zPs3L1J5Lmegn40AIc1SsSitGygnCn87pSO5ig0gn+
	IAMbSlbdJhTA2Pui11N5oPYyJkZck6MPzLDFzb0axOVpK/Uzpv8zqgS7nk0BMK7gdwTj3neRWdLrC
	Ya8G4gz2ONURyHnrhclQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so3oO-00000006LQU-00gs;
	Tue, 10 Sep 2024 16:33:52 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so3nd-00000006LAx-0ZJn
	for linux-amlogic@lists.infradead.org;
	Tue, 10 Sep 2024 16:33:07 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-374c1963cb6so3615472f8f.3
        for <linux-amlogic@lists.infradead.org>; Tue, 10 Sep 2024 09:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725985983; x=1726590783; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o1hDqtVqiV/aX1h4XvmroKUK+ZQ/3Ms3NrT6oivQF+g=;
        b=aSECQX8t8oozR1EGhigwthXhKPGEZcwOtOrGvxzJ0UpT/thpwxabGlmatoaWP6JsvA
         hkFh8aZGBBcMOXwBUk65iKpdg9ahfpir2RhVQsBySYt+Qo+N9UfVOJfcs13tf/5GZvhI
         7K4yCNxGhFYMppgRAzxY+bPdN1axFhgpZzJL0pifzdZlGOeOtf1xE6wJOZgYgTm3Zg5E
         HGpeQNJW6lH4iWxvxXcmhCtnrYu2/AR+T3LPlE7PwiKAWqbJxQSFM9g8Bmzj4bPw/kxO
         s/PFyDJ/mhaZOCZbwWEXEhhZjjKG3VyqQ5Tsq9ZOeTTpQBF9JMx3hha60tHUGIy67bGJ
         1/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725985983; x=1726590783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o1hDqtVqiV/aX1h4XvmroKUK+ZQ/3Ms3NrT6oivQF+g=;
        b=NNDXZIv3S4nkYOCQbzg7C3+qb8iRAj+TsXnuNBWD6bQjxPkk5jd1Mj697vRRWFeVvw
         iAZ4xW0UDSxrTy7p18ZQMmUnWR5sR32jz0vXFDTssgjrvfm8KAOtC5a09D/CvWkG5QF9
         fxmCTYfvkZZgZeM1TvKPRY4nPvRO6QvXO0+Qwk7gxbGKV3x1lzLy3qw9zacdVisFy6CG
         vStPt389NHr1IMdHX4X8yOrB6HXMo6SFPftHlyaptHWgKLTJzl4mAR3yopbJ9Q6766qW
         6UznB9KEun68a6J2okV7DW3WWwAtFawXFU2/7hdOwi4GXZjMaRTbvfPHGhP7ic6BoxU7
         6yDg==
X-Forwarded-Encrypted: i=1; AJvYcCWo2+tx7K6dc6B+Zz0wUWhNyovNPdEoMN/dwfkuSylk7UMyKR0BeCVST6Px4OzoI6IZ7gwu3Q/V9xs2i5wV@lists.infradead.org
X-Gm-Message-State: AOJu0YywrdRVCFHLB3vy7abPxNj0NcfJvv4uyQjgzr4y7WrgzKY7hih7
	W1D/7U6d/rArryh8x6LfUyyyIQ1fxaNsnay4mbA8osQQD8xyHPiwT14FOyO2ZAc=
X-Google-Smtp-Source: AGHT+IFH59dMtSyNh7I/3WfwlYfHuMIivRRdyOaildtpWKUEoDTns5XbC6x76J50TkiaYXWsITBbmg==
X-Received: by 2002:adf:cf09:0:b0:374:c651:4abf with SMTP id ffacd0b85a97d-3788969feb9mr9056641f8f.52.1725985982855;
        Tue, 10 Sep 2024 09:33:02 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:8ba7:bfe4:fea9:65b])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42cc1375189sm25076025e9.1.2024.09.10.09.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 09:33:02 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 10 Sep 2024 18:32:43 +0200
Subject: [PATCH v5 1/9] reset: amlogic: convert driver to regmap
MIME-Version: 1.0
Message-Id: <20240910-meson-rst-aux-v5-1-60be62635d3e@baylibre.com>
References: <20240910-meson-rst-aux-v5-0-60be62635d3e@baylibre.com>
In-Reply-To: <20240910-meson-rst-aux-v5-0-60be62635d3e@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jiucheng Xu <jiucheng.xu@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5135; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=4VEzXjRyAdc+s0ybDA3IP98hrZK72BhbDpiWxhkjQHY=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm4HS0LOglI0FGds477b9AQjE45jlk1P8b7S9Ch
 gvPHtXspCmJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZuB0tAAKCRDm/A8cN/La
 hcV3D/4gRYU9Uq7kJahPMTbuJSt7Ql6GYfpoar3B0U+Wo8OAw8hZOR10Yc4wuWNRsvrdUXz7TTg
 THwq0hEJtvshHYIqxuD/kSVrTE6Ha0Cyqq5JoEqzmxr+EVBPgIJRayEx8iNlC2y17kldgKTENgg
 msszAvsvo++eV5KIIl3mxQWoQ3eoGrYJqv73DEu3LNAhH3KYjroR7U5dojFH5UVu2H7llzbz1xA
 Re3N4lkfnbvZglOQ+Ur9mr/1sGGQJfsjrQmeGW5CvQlk0wKW8tBi0+on2e/fMk5ejRuuP2XedcN
 8i+Wm+ybn9I0QBZm2fm3OhSiJzzh/ZPTVHIW5PQTsMTMP2jb7/mBRIvfEhH1OM08AN/ZM0SQ4r6
 txAhLskuqHZDsMl0YsxU1qzZX1K/M51hzq/OlBCsf2Ke6eKTwQ01BRQFtwibcGi9hk/aQzbas4M
 4cdpCxLIQyZK+wPSqK6EWU/Eznf5pYnfW4l49Hyh7b544JxTSekXmNv76AID0GXQZl7o2aJ/uRJ
 ++5blmIBwvYS7dQVRIELRqhsdlQbzWHA42y8mYCUibeqLTwo+l8xnMy0JW3SLklGDHZfoofwiWa
 hTMc4l6jqK26IVKH9DGupIht0K8j2cxO7YfJA1Nemy4vvNLO3GuapbAaxr1oGcDjHDsDoyuxnls
 jltoZnT+NliAMcw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_093305_242860_26AE8181 
X-CRM114-Status: GOOD (  18.47  )
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

To allow using the same driver for the main reset controller and the
auxiliary ones embedded in the clock controllers, convert the
the Amlogic reset driver to regmap.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/Kconfig       |  1 +
 drivers/reset/reset-meson.c | 79 ++++++++++++++++++++++++---------------------
 2 files changed, 44 insertions(+), 36 deletions(-)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 5484a65f66b9..c730ba6f678b 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -157,6 +157,7 @@ config RESET_MESON
 	tristate "Meson Reset Driver"
 	depends on ARCH_MESON || COMPILE_TEST
 	default ARCH_MESON
+	select REGMAP_MMIO
 	help
 	  This enables the reset driver for Amlogic Meson SoCs.
 
diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index 1e9fca3e30e8..9dd38cc209e2 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -11,36 +11,43 @@
 #include <linux/of.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/reset-controller.h>
 #include <linux/slab.h>
 #include <linux/types.h>
 
-#define BITS_PER_REG	32
-
 struct meson_reset_param {
 	int reg_count;
 	int level_offset;
 };
 
 struct meson_reset {
-	void __iomem *reg_base;
 	const struct meson_reset_param *param;
 	struct reset_controller_dev rcdev;
-	spinlock_t lock;
+	struct regmap *map;
 };
 
+static void meson_reset_offset_and_bit(struct meson_reset *data,
+				       unsigned long id,
+				       unsigned int *offset,
+				       unsigned int *bit)
+{
+	unsigned int stride = regmap_get_reg_stride(data->map);
+
+	*offset = (id / (stride * BITS_PER_BYTE)) * stride;
+	*bit = id % (stride * BITS_PER_BYTE);
+}
+
 static int meson_reset_reset(struct reset_controller_dev *rcdev,
-			      unsigned long id)
+			     unsigned long id)
 {
 	struct meson_reset *data =
 		container_of(rcdev, struct meson_reset, rcdev);
-	unsigned int bank = id / BITS_PER_REG;
-	unsigned int offset = id % BITS_PER_REG;
-	void __iomem *reg_addr = data->reg_base + (bank << 2);
+	unsigned int offset, bit;
 
-	writel(BIT(offset), reg_addr);
+	meson_reset_offset_and_bit(data, id, &offset, &bit);
 
-	return 0;
+	return regmap_write(data->map, offset, BIT(bit));
 }
 
 static int meson_reset_level(struct reset_controller_dev *rcdev,
@@ -48,25 +55,13 @@ static int meson_reset_level(struct reset_controller_dev *rcdev,
 {
 	struct meson_reset *data =
 		container_of(rcdev, struct meson_reset, rcdev);
-	unsigned int bank = id / BITS_PER_REG;
-	unsigned int offset = id % BITS_PER_REG;
-	void __iomem *reg_addr;
-	unsigned long flags;
-	u32 reg;
+	unsigned int offset, bit;
 
-	reg_addr = data->reg_base + data->param->level_offset + (bank << 2);
+	meson_reset_offset_and_bit(data, id, &offset, &bit);
+	offset += data->param->level_offset;
 
-	spin_lock_irqsave(&data->lock, flags);
-
-	reg = readl(reg_addr);
-	if (assert)
-		writel(reg & ~BIT(offset), reg_addr);
-	else
-		writel(reg | BIT(offset), reg_addr);
-
-	spin_unlock_irqrestore(&data->lock, flags);
-
-	return 0;
+	return regmap_update_bits(data->map, offset,
+				  BIT(bit), assert ? 0 : BIT(bit));
 }
 
 static int meson_reset_assert(struct reset_controller_dev *rcdev,
@@ -119,30 +114,42 @@ static const struct of_device_id meson_reset_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, meson_reset_dt_ids);
 
+static const struct regmap_config regmap_config = {
+	.reg_bits   = 32,
+	.val_bits   = 32,
+	.reg_stride = 4,
+};
+
 static int meson_reset_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct meson_reset *data;
+	void __iomem *base;
 
-	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
-	data->reg_base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(data->reg_base))
-		return PTR_ERR(data->reg_base);
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
 
-	data->param = of_device_get_match_data(&pdev->dev);
+	data->param = of_device_get_match_data(dev);
 	if (!data->param)
 		return -ENODEV;
 
-	spin_lock_init(&data->lock);
+	data->map = devm_regmap_init_mmio(dev, base, &regmap_config);
+	if (IS_ERR(data->map))
+		return dev_err_probe(dev, PTR_ERR(data->map),
+				     "can't init regmap mmio region\n");
 
 	data->rcdev.owner = THIS_MODULE;
-	data->rcdev.nr_resets = data->param->reg_count * BITS_PER_REG;
+	data->rcdev.nr_resets = data->param->reg_count * BITS_PER_BYTE
+		* regmap_config.reg_stride;
 	data->rcdev.ops = &meson_reset_ops;
-	data->rcdev.of_node = pdev->dev.of_node;
+	data->rcdev.of_node = dev->of_node;
 
-	return devm_reset_controller_register(&pdev->dev, &data->rcdev);
+	return devm_reset_controller_register(dev, &data->rcdev);
 }
 
 static struct platform_driver meson_reset_driver = {

-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
