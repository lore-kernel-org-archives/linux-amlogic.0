Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B984CC25B74
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 May 2024 15:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jVm0DLf8Oepoe2Q9iW8kXrqziAoLljiLA7dGshiTNsw=; b=JhaQPnEry5PCL4
	qL/XD3Z/w8sCE7GpoopCbWybjDVYE89fKThmZn97vN9GCd8WC18hBm366r3Npct0b6qmTfjcujIBD
	P1RpZDYMos4BWKmmL48IiSpuIptDMh/N4lgxu4xcHbVACR/KZULGUCwsjndzyHtaNFgufyfZiTdhn
	j3hdwILTyeseWlRfYc8lbi2bKtSj2ExSUsgzRIKXh1DKSH/UDq1USIqyvy0NBsc+UhC7DM2WIWExz
	0TVtUGARaJ1gLDR4i41fPOsPpHtZrfAxXLH/PsbUFBBJFCxhf8AhMN+IA2XNygPsutdmdAIwGCXQn
	RznCqMteIqDm0Z46Rrdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7cj1-00000005FoV-0Lek;
	Thu, 16 May 2024 15:08:55 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7ciw-00000005FkB-200m
	for linux-amlogic@lists.infradead.org;
	Thu, 16 May 2024 15:08:53 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4202c1d19d5so5018375e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 16 May 2024 08:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715872128; x=1716476928; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+f/3bReYMesF4TJq9BOi7hv3PG6ArjPAwHRzmWrlWAw=;
        b=n8o2m8dQUTrveEZWez9Rvt9AmCrkqXaglxPkZS661TR0IJe8C8TuDbmsrhWlejVHC7
         mRgqGg5/xAdkmlAIIUdU7q6Wvr3tL8IgoUU7BfdQ2s15Cmv5yov9C9yDYtIar3eZQP3o
         glqAOkl6OgDdeCTK5lw5kqlpNxnEN+xdVuumagy72DQbzFc9qBfNc+HXWDir7dH43p2q
         6+8lJSa9bvjk53/ugdkF4SnZQPoP5OJm50jZBg+o6zkLy1Vrju62XACJ4tlEZ8mAc/sp
         nKlJE6gqb5wDhEgX2fTINB0jqiMRrcMrv5XPSF0DMRfVoWBbVtNVeLvZ/L8BEhCxFanF
         yj1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715872128; x=1716476928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+f/3bReYMesF4TJq9BOi7hv3PG6ArjPAwHRzmWrlWAw=;
        b=olWKkRYWxK6wPc8fblz97Zb25cPp+BHrEb/ysKg4ZQDxxonG0vs/tHL+2xPmpBxF27
         sM1CaGnFdN6JW/1kZhzDXb6uFq8iFegDtmFSXBKcRtIQ4eY7V7oG5K+TohsFrWof41aP
         C7QnOEg60OKcTFZNeUXgsf9sOU+xad9F35O7a8UYxUqj4jq6RNui6nHZjFsbyK1+Xmm7
         56jk6uW4LLm/w/x2xGWi4ozTr4dp/zMIcNMP6+Zszzd17+0CJ6PAGKlhE2PF+fQ2/IsM
         TRfaKbrCbkDbz/KHMcs4RpFFNX9esHe/eXCWPJoddSdpnOTuu+hNSkOs4l8O2EdnYmxe
         CV4A==
X-Forwarded-Encrypted: i=1; AJvYcCVV7ZLZFMtB0ascdT33lvzhJuAFLnAPXGuYiAbpwDK15zpnmxxHmlLNVs6MXGsKqLEFRPS0lG9cMpB15QaSHWgsRQdp/Jmaw3EHob8M69WCpjs=
X-Gm-Message-State: AOJu0YxEcjq2eV/EkIRsKFc3u3BhnwgpcqenSHX5x5YWMalLdp5sBvNy
	eoDu794UE4HYnaIoanCKz8NsK5JcodOBHuX/u3RZ9fIOV+8ukcomapDrPGtpvPA=
X-Google-Smtp-Source: AGHT+IEYZF+5ejklYa8gOutFOpqH9vmFIkmi4oDHndgWrV0jEKKooJucmjXLHzEaKGqSFHUhay2i4Q==
X-Received: by 2002:a05:600c:5008:b0:41f:e7ac:cc72 with SMTP id 5b1f17b1804b1-41fead643a0mr145586765e9.40.1715872128318;
        Thu, 16 May 2024 08:08:48 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1fce:7e5a:e201:edd5])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-41f87c25459sm309351725e9.18.2024.05.16.08.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 08:08:48 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [RFC PATCH 1/9] reset: amlogic: convert driver to regmap
Date: Thu, 16 May 2024 17:08:31 +0200
Message-ID: <20240516150842.705844-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240516150842.705844-1-jbrunet@baylibre.com>
References: <20240516150842.705844-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_080850_557534_4A3A00F3 
X-CRM114-Status: GOOD (  17.14  )
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
