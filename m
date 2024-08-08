Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A78C7C52D71
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2024 10:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jJdHaHpHg83ec0eqpWsje1gDZpJkowE6En3uSQLPi7M=; b=UEXv2qC9pNInzM
	YbaarbAtPLyYFu1zkPpVJThPciTzG4bTZCCKvhAKRYOgx9gcNJ5W2P6/6XgLhjGx9C4jr5JDDeQKl
	JTwenn3fDGBlghJiMICTBWbzUAwVkjiSmCc3B/j5VEPdjZdrY4jUHX/4JFPHaLleJsU5AAj6PsxlB
	8kcAka0uhFLl/U+rYBHXW29aF0pbSheSFrI+7TFUWdG/cEi/2VdTWS9lFQNYs5fY2p40Au9nYMKzh
	aDsBEOb79/U+3DJgZUmBSuyw8/3amNbWqjXFAnGeuMcgCiJJV7VNZ0zk8KTlgZ5YNC1CQZ6XdUJSz
	aJmDZMLjw9n0AHanOz1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc0NK-00000007tKK-1AVN;
	Thu, 08 Aug 2024 10:28:06 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc0NH-00000007tIs-30P8
	for linux-amlogic@lists.infradead.org;
	Thu, 08 Aug 2024 10:28:05 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4281d812d3eso8030905e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 08 Aug 2024 03:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723112882; x=1723717682; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q3DHNRvZJ0qhVqYezcY5P08/4agts36gA+QW7VdWHFk=;
        b=xeVuSobk52ouAulgjFcG6LOK1rUnQ9r6VBYPUQzZQPOgztqdaLJMKH838dRgBQQURV
         PuPwJ1Tu2GsaVQNs0wrpf24fjTLsaAUVS17iMjzW0pG3gCkmw9Ofd8+uMHyTCBaNxDHv
         0S0dHDIUjZdGEAU+x9PNaNQa3/ZB3SHAxgq4cDG/5MF7JtP5TqgrVfuCy2LLXIMUugwg
         VMoqqfl3Z7xJOwLQSeIbBHaS01QeKfLK5MgWCT2hA8gEENcRolm5uX2nLY2lpNHPW98Q
         06QZG6XVQ4E3ubnYXOXt2FLj7xQKBNvOB06w2rjLT//x6YmTdLgi0S1UH0dX+x1T8VOy
         bnbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723112882; x=1723717682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q3DHNRvZJ0qhVqYezcY5P08/4agts36gA+QW7VdWHFk=;
        b=LNg1bGFiuFGJsr/osiljJ8vaeRa8+gQrkuJOev0dPO2+EQ5nRqt8QEzarxsBx1CXw9
         XA64NTyHnFqUKUAHMidCrdBg5Mde4MCU6GayrkVo2B9Zv+U47ecdg6+QdcYHhzpcaqET
         3YHTDmzSX5eDj7D/Dt+G9z5x3sid/mEDuQukdLAvWAW+irWU4uD3XqfCt7Dtxt6pzesY
         of5fKvFHpXpnymvLd2BPwqUNUnqpUP9PFoQ27dZFW9S3lGcXSkGtgSPo/jqjIrqn6Uvn
         mT9SiR20n4+5u2WGivwf/jEu9uMsH6fzwebMTMEJIeUcsaMjpzpPBBdS2NJ+3LI8o2Ar
         SIog==
X-Forwarded-Encrypted: i=1; AJvYcCVP2fpDi+A7QLaMN2x0yPBrRga27P+ROcT1fodQ3aeI8KQ2T2gHTPrwMpHpDQo1FQjEaYrEd904Il5k5qhUrKOY+6Hh+8FRfzm2Hup2qL6X+ZI=
X-Gm-Message-State: AOJu0YxfDN6RSBZvEjG6DLC/55SGdyNJyTrZ3cmV0uu9su+GpBywptVu
	jHauMm0lWan6Wq4QnU3n8vRGSNL9YrTpm0jl+omeRSL9c3TeTdVg3y5pinrpMCR3bAVWdEtFXqQ
	nCzU=
X-Google-Smtp-Source: AGHT+IGrQMQ9Wgj8GAuLCg2l16C1IOiYtKXoO5s1FPVyD++kkP2maHUyZrFQlTnKv9XjfgZ94mwS6Q==
X-Received: by 2002:adf:a356:0:b0:368:78d0:c240 with SMTP id ffacd0b85a97d-36d2751ce11mr1193495f8f.35.1723112882103;
        Thu, 08 Aug 2024 03:28:02 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:ae7:4e79:8821:15db])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36d27208c98sm1454596f8f.75.2024.08.08.03.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 03:28:01 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 1/9] reset: amlogic: convert driver to regmap
Date: Thu,  8 Aug 2024 12:27:31 +0200
Message-ID: <20240808102742.4095904-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240808102742.4095904-1-jbrunet@baylibre.com>
References: <20240808102742.4095904-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_032803_779258_14FE2B5F 
X-CRM114-Status: GOOD (  16.99  )
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

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-meson.c | 79 ++++++++++++++++++++-----------------
 1 file changed, 43 insertions(+), 36 deletions(-)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index f78be97898bc..b47431a21b86 100644
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
@@ -113,30 +108,42 @@ static const struct of_device_id meson_reset_dt_ids[] = {
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
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
