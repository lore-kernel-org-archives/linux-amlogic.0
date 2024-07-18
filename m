Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE24C3DA60
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jul 2024 09:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jVm0DLf8Oepoe2Q9iW8kXrqziAoLljiLA7dGshiTNsw=; b=rFASEs0/g+M7Z6
	UT0xz1BWXpSO22OYPHkUaXBMZaf5Gpapg8mBMUfhkuQHul3lwSZAk4bCMNGL5R+G5deYAM+copK1r
	FrKh4C4PyHdX/L4iaGzxQ60MR752SDmjlww2V9peqtYiCm4Y+w+qX+Xgv1bjEDDb0FccchQ8MWT9c
	bqM8aYn8t05+VueIXN37p+89SgKdgokKw+X1u44qa2puNkzUh9LmEgaOWo+xwu3qY7sT/brmqZ/NX
	N2ovDM6Wwk7d0lj/UuVVZ5E+bgUZEOftCtGqAYbn1hMbdPgD8KXGMyB8y1M1Oe74J+d4k+yGZqXZV
	hKrIcTX07j5xoqo9AHdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUNtp-0000000Gd3K-0nOC;
	Thu, 18 Jul 2024 09:58:09 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUNtm-0000000Gd1e-0JUT
	for linux-amlogic@lists.infradead.org;
	Thu, 18 Jul 2024 09:58:07 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3684bea9728so426533f8f.3
        for <linux-amlogic@lists.infradead.org>; Thu, 18 Jul 2024 02:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721296684; x=1721901484; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+f/3bReYMesF4TJq9BOi7hv3PG6ArjPAwHRzmWrlWAw=;
        b=lyY7wpQqpaEY4WK/D+EUJuKA8noUk8ptkTD5ARJacSCq+GJtUV6v4ZUAk51ug1YZ73
         ocETbiE1QLhtUh9sa9ai9egtTxwz7JAgA6rRT+5NIb1Kx5KwPt70000HOBxkdwEDrpfF
         Np13xxv+7vRoMLlb/Qx3SI1aPUSJeh8knzqVSOHj6tqJCW3SIps8t/4jYc0i1FtSuBRY
         faUPsexDdYUfUv/yJXpxMv+Mipq5QR3iMH/EsylOQGOQXBVe6wNrGNN6zauf4Lq1wdZ0
         CZRg58dYqJxQcASzhHAskHea+8WfBc/3bOsGiglT/wmtgy2FmyNtYst8cvN+PASpCueC
         eVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721296684; x=1721901484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+f/3bReYMesF4TJq9BOi7hv3PG6ArjPAwHRzmWrlWAw=;
        b=a0fb9Q+oU67ylcusKEDsKCXSixEetVrOrKHVCbJDxkFKvmc2VmIlZJJmBYIGgHlqUM
         B5WN8BcyL4rHeA20Sg+Vll3dUgA48h5JP2fRXLI9tPR2sXb6LCUjMgEz5RYaneQRqrhx
         exZUIW9l1D9nF1pUVggO357Sj4UlL5+ceFWoM2vYRvrcy3zUza1rREzQSLLvXDRA7/Ji
         WdxWvX/2A+4I3wvdKi7dDbGZ04b6a24NtZVNocCduSYP/UXsinLJp/NdHNrFNCScOaOQ
         uuUmBZ5QVimL6POfzyU7FRjr8tVWs2hXp+WxORqYULMqHvHUSQ3vQWrGgqcXIq68C+Uy
         KMOg==
X-Forwarded-Encrypted: i=1; AJvYcCVYbcWtXXtNP7+bi9RgZ3HwC0I46DeqEcprVLYru4I4+PhiGboJEV7YzCnmZa9owH6Lz94svu+T0E0Jw3CzqL21UoipoMGY75Z+v8Zu4fcyBfg=
X-Gm-Message-State: AOJu0YxdnOdrl5uNlB3dJ9H6OhIIBK3Cv2+btNv4wzqtsAa0dpZOcTbf
	Snvp2/VwUqKn9TIq9VO4bhlZr9z7eWVT1n8cQmi4VL+0JoGs+PI1zTzgXf4wuNw=
X-Google-Smtp-Source: AGHT+IF2wpylHtE0GsGjeKwrPISupVDdqlSWSz7Bc5nyMlVO3EB3+GjMC7UpkG8hkKpJnSbvcphnrQ==
X-Received: by 2002:a5d:540d:0:b0:367:9803:bfe7 with SMTP id ffacd0b85a97d-3683171fe16mr2596315f8f.53.1721296684185;
        Thu, 18 Jul 2024 02:58:04 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:8d37:f44a:c212:e320])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3680dab3be3sm13837155f8f.24.2024.07.18.02.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 02:58:03 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 1/9] reset: amlogic: convert driver to regmap
Date: Thu, 18 Jul 2024 11:57:45 +0200
Message-ID: <20240718095755.3511992-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240718095755.3511992-1-jbrunet@baylibre.com>
References: <20240718095755.3511992-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_025806_137540_C6B1B7DF 
X-CRM114-Status: GOOD (  17.22  )
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
 drivers/reset/reset-meson.c | 80 ++++++++++++++++++++-----------------
 1 file changed, 44 insertions(+), 36 deletions(-)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index f78be97898bc..8f3d6e9df235 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -11,36 +11,44 @@
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
+	return regmap_update_bits(data->map, offset,
+				  BIT(bit), BIT(bit));
 }
 
 static int meson_reset_level(struct reset_controller_dev *rcdev,
@@ -48,25 +56,13 @@ static int meson_reset_level(struct reset_controller_dev *rcdev,
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
@@ -113,30 +109,42 @@ static const struct of_device_id meson_reset_dt_ids[] = {
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
