Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D684CE7B0D
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2024 13:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0v7BMUCMRZeBAOHdSAmB0mwWwkln/JTZLqWnmOURzs8=; b=YJtW6vMFjLO0pB
	gC3kswjUwOuqzQMDq+mFH6gv/MbgC7TrUElvMzzEUA/KiZb+zmn+abTlGfsnj+VMh5H7aADIxd2QC
	r5AuIGHVRoLl3NnVHOLFdH8bE8FskBPlsn+0Eh2ZuF5i0SX10NH98yzMDjRb/aG/YTg/nZG3WLxFg
	rsc2u5/6mMKyCoG5ZEiqEjsv3pyX2ApGXqQEExNzk3HKki6yH93bITn7nsPP/Hj/+vCPpinO7NWVb
	YZawYPRVHCVyoaMQpncd7klgvLVymPEYXu5jHxblJT3PYfKrC6+sfQe6Ve37Z+BDshM6NINJyvmip
	ywt7ns0I02DJVKTeNeXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smZ8D-0000000CMQ7-35DV;
	Fri, 06 Sep 2024 13:36:09 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smZ7S-0000000CMAO-3nQe
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Sep 2024 13:35:24 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-374c326c638so1383435f8f.2
        for <linux-amlogic@lists.infradead.org>; Fri, 06 Sep 2024 06:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725629721; x=1726234521; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/k8Vw9s8c3vx1FzrrsUK66X+N4rd9Tj8aDo0ScuGc6U=;
        b=YaCl0Y++HiVK7k20fbiC01uv8/tdsoaGvx8Fg5I6WxhIpplemyloENz+1nWYa79SWe
         2E6lvpadcriZSA7wU+MpUX7PC9l7nrzGbDKCbak6k6W4I2/qQCwKYPN1u3+AeTI6GHig
         FALxm5XSNutAcNL1ncGQ7DfqLDQxxNF3YaukICpycPqjXhfNn4A4JYk4HANWnUHM2IYi
         LuWPzvJNJh/WkukWnHjdY6yZAkMOlzCIsmcdWnO0EGPFSG7ICPEAABf9xPdjAW7mdTVJ
         l5ubxowiDe6CzaOXgQ4PqtRzgJQZJqaTsmGcfM5LE5gnxylbWPJOR83TAKJC3fs9DgJy
         vVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725629721; x=1726234521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/k8Vw9s8c3vx1FzrrsUK66X+N4rd9Tj8aDo0ScuGc6U=;
        b=kzCSWQDpuOJYVrw4/fb9m8IN2vG40fu3cakn3qBZMTlDn9Fj6ZvKGL40uiHbQCja40
         u8+hkPtV3k9I5yIzR86XKv9+FszyJs9BUdh2lhjtkShkgu1DuhHBrp7jCzcuscHiCKdO
         rbW/D8Wumts16JGyCfbtD1Roy4cpFfPAqFYXu+b54XgFx4AjJqoIRI9H4GhHKnF2vgMf
         TM6S6+vxfxwcftGtKBJJLvtxZEN0LlSdLiI6ZJcddH6mFUvmutjFed1njjCEY5UQfBBu
         Y/PJ05Oj/CoUTMeA0Oc1HJrXBLbLGOxp6aD/R+It/H+IjveAHEjtgcdZb2jHbe5hfTf4
         EF1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVWYVUTUplfmiV6DwgGWjerwyQYyywcJC6zYveySpxi+H1TVOVIeLAwby3KGG+E0CXmnBdxOOIVXZkYVIHz@lists.infradead.org
X-Gm-Message-State: AOJu0YwfQ1xugSQ2b1JFYl6aux0iuHsNjF+ja32rhv6KjR23Hzn3zI4j
	lP8Cv0e29pRGsZkTz0kaI6W0JOdndwsdfwpKWycwbtqCdfJaaHIvYkmEpMhK2GXHkf4C97HF4uF
	3
X-Google-Smtp-Source: AGHT+IG6zGp+EGPyl2G/sbXQM+iPf9ynjtzmZ9+oRa6GrrDLZwIH2kFh1EK96Z7tR1FuVnxf2OaClA==
X-Received: by 2002:adf:f610:0:b0:371:82ec:206f with SMTP id ffacd0b85a97d-378895c71b8mr1873113f8f.16.1725629720180;
        Fri, 06 Sep 2024 06:35:20 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:b0ad:b504:10d4:481d])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3749eea60e2sm21684597f8f.62.2024.09.06.06.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 06:35:19 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 06 Sep 2024 15:34:46 +0200
Subject: [PATCH v4 1/9] reset: amlogic: convert driver to regmap
MIME-Version: 1.0
Message-Id: <20240906-meson-rst-aux-v4-1-08824c3d108b@baylibre.com>
References: <20240906-meson-rst-aux-v4-0-08824c3d108b@baylibre.com>
In-Reply-To: <20240906-meson-rst-aux-v4-0-08824c3d108b@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jiucheng Xu <jiucheng.xu@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4710; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=nr6iNBU9QPCIvnO9/MQUvPA1RIWVyVRjkH+HH1AHiQI=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm2wUOaSvOFexQNmqHkSGVtcoiU+q5cdE3wWeos
 pGVbRanLvKJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZtsFDgAKCRDm/A8cN/La
 hYXbD/9xqasTIEVkwp3pKd+o2zGkOPC0wgIxIRtlVKClkbYJ6Obm8DdMqe3C080mzvx3aQdj3BQ
 E+sGkfcg0+gFc0bEz7G5fv2HxkMiWOPO8HtxjlMInf4ncihnVGxWXnzDQujH1Xvnv2D1yz5wY+U
 S3wmUEo0Uh362C8F5+uMhaunHxEYVMPw6p2cQiRJdBy+1QGlS3uKMJ17dxG+SnNhfYvOsahsKoR
 XfmQg8tbZUs19uPqswVBmNZAowF548LF7Y+zPxtve0oGSCHyA22sGxuSFol2osUbAk5cnQl1Z5v
 DNoM7nQm6MHspbLdY89r3SXEyTvBLw+XSzd6vAwvTfjgQZ/ZwJ/Id+XL1RDGpmylvhMs3Tf4uA2
 ZQjloABTRZJ4DiW1rJbAePnOUnjNmtGDFV+Y2FmmgRBqc8VTj2DAVKEJs+e71PfrmEGhUhjvrwZ
 JWG/54oT8NXUfkrhickGdU0iI3YTvYfSgnowcCCiaPzXn9P/7J585vtGXiPMUM/EMIGCRplVsjY
 /WzuRwoOOsQbyvij3SFUrhEYaX0K9o0VZ2puNlAlwrHGjN4OuAlbKOPy1cteyErWbRPItw4xn40
 tUCpjnZIQyMk9nbMbErpi7dxJ1OK0WL3Ti4NeFfWFV7C2UzBn4Orrmn4Ra+tqJIrrJ22eMkbloN
 YQFDPL/27gC1EUA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_063523_110272_B05B69C6 
X-CRM114-Status: GOOD (  16.63  )
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
 drivers/reset/reset-meson.c | 79 ++++++++++++++++++++++++---------------------
 1 file changed, 43 insertions(+), 36 deletions(-)

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
