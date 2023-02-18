Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 160D0C61DA4
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Feb 2023 21:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ivz51xKdr/PII0w/e9yysMxc2AzfYS6fB/8nWlQ748=; b=blLjZFjcnlD59H
	Va4lZYNA40b5nZJ9c8qf6/cpk/5bTa7C5WN9Mi6RUCDpbFDDBkGFTcowK3ygsWg12FgeompE5SX95
	6QMcwLV/XpOH3Ieu4elwhf99bnzUkVw1964GR5YOz+ue18/V9LQLJihkZ46jKq3+cdhPL+jZWUF/L
	ZGjoTzmKJDel7DrOrxyIE4m+tOeE4fmQB2w+vvVtVCz5T6bE+OhgTJBShPjNG+ILmQk8kSUj0KXHH
	lPI+iDIarBPp+4IotizhRGGOBjRnxHCnIl/WShBn2g9dJEOFGQQXXXgr7Bqh0nesiWJKeFp58JjzK
	7oT4UD9JJbwj2hAEU1hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTUJe-0006P1-Qd; Sat, 18 Feb 2023 21:00:18 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTUIu-00068w-Hd; Sat, 18 Feb 2023 20:59:33 +0000
Received: by mail-ed1-x52e.google.com with SMTP id k5so6386371edo.3;
        Sat, 18 Feb 2023 12:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5/WDNEbgisYy7HKbKtg3x5sM5lSnk3f53fWjIWsdioM=;
        b=Y5gt30hgLmyK/3disDGoNv7X5srdEOUlDiSjD/3a48VwOFAiYNikZNzBVmseWIQhc8
         wmvRaOKgWbilnzKnxSlytLpkd6KzKJsiKCs5+q7xHD+eKN8kEQisu/hE0KiDbbqM0cFb
         n8vcdXIsovnFq0a8/68NvPOMDA39RCIuJfGy4fvcKRKD5zFwvtQmFoB4LT/zV8KB1qFH
         flHf1ONOnMquhWR1LE+59FNbM1msej2cg85DdtkUbl4LBz7z73l521/1eoGY0jjpxAId
         +swPpoZFN9EnsJt2paeQsP7Ufukg4c+eKVMcz+ZDSjakeyNohtIZcc9p2MhAW6l67PEh
         X9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5/WDNEbgisYy7HKbKtg3x5sM5lSnk3f53fWjIWsdioM=;
        b=tFNaF9U5Sc4hzgiHCKJKEO11S0sOmkOxeQ/i4kB6sD7t67Ylgwp8Ebtbod1T6QpzAT
         EkAOnY4irGGx/NVEqg0tcylviq13m8XfM5IcLgpFpZKYpQY1O4S5tWjfbC54iE1EgDuz
         jsudsXR6iAXb1vBy4fXSp48iiaGGNBmlpK+C+Z+z1hTcCQuILvaGKlu1RBY7MMMPgM0e
         vHwTdK1tsnIRh458cGGJjulXIxrVYxTM9QTziUHl59X3ARzjaowe/yvyqBbyVQcBBXd5
         A3g2Zp6dXI01IUgZtF5161yLu81Dcdeqsn+I6XgjLJRBK37yYtPbIBHVCRynZYz6XesY
         ApnQ==
X-Gm-Message-State: AO0yUKWYw4yQ8RJ/X926k5+XtFaU1c/SRi7sqPQ287XRW3qVL0fKZJ6e
	g4Q2uaMKFOywNpBo/mGXTe8=
X-Google-Smtp-Source: AK7set+1fXie4wFZicnTmT6HJm5KRsiKzoOl5iHtScvxq3/fscAEsLtL00IXPlWW+dYOolN6W6DI8w==
X-Received: by 2002:a17:906:aad6:b0:8b1:3b95:cf3f with SMTP id kt22-20020a170906aad600b008b13b95cf3fmr4095079ejb.70.1676753971103;
        Sat, 18 Feb 2023 12:59:31 -0800 (PST)
Received: from ?IPV6:2a01:c22:7b82:af00:2955:cfd1:cf55:9ea? (dynamic-2a01-0c22-7b82-af00-2955-cfd1-cf55-09ea.c22.pool.telefonica.de. [2a01:c22:7b82:af00:2955:cfd1:cf55:9ea])
        by smtp.googlemail.com with ESMTPSA id s21-20020a1709060c1500b00887f6c39ac0sm3762386ejf.98.2023.02.18.12.59.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Feb 2023 12:59:30 -0800 (PST)
Message-ID: <db2112cf-ff3e-e2e6-9eca-1b5956d921fd@gmail.com>
Date: Sat, 18 Feb 2023 21:59:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: [PATCH 5/5] hwrng: meson: remove struct meson_rng_data
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <26216f60-d9b9-f40c-2c2a-95b3fde6c3bc@gmail.com>
In-Reply-To: <26216f60-d9b9-f40c-2c2a-95b3fde6c3bc@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230218_125932_635317_85F02A71 
X-CRM114-Status: GOOD (  11.16  )
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

Because no other members of struct meson_rng_data are left,
we can remove it completely.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/char/hw_random/meson-rng.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/char/hw_random/meson-rng.c b/drivers/char/hw_random/meson-rng.c
index bf7a6e594..633d98b48 100644
--- a/drivers/char/hw_random/meson-rng.c
+++ b/drivers/char/hw_random/meson-rng.c
@@ -16,10 +16,6 @@
 
 #define RNG_DATA 0x00
 
-struct meson_rng_data {
-	struct hwrng rng;
-};
-
 static int meson_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
 {
 	void __iomem *base = (__force void __iomem *)rng->priv;
@@ -32,12 +28,12 @@ static int meson_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
 static int meson_rng_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct meson_rng_data *data;
 	struct clk *core_clk;
 	void __iomem *base;
+	struct hwrng *rng;
 
-	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
-	if (!data)
+	rng = devm_kzalloc(dev, sizeof(*rng), GFP_KERNEL);
+	if (!rng)
 		return -ENOMEM;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
@@ -49,11 +45,11 @@ static int meson_rng_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(core_clk),
 				     "Failed to get core clock\n");
 
-	data->rng.name = pdev->name;
-	data->rng.read = meson_rng_read;
-	data->rng.priv = (__force unsigned long)base;
+	rng->name = pdev->name;
+	rng->read = meson_rng_read;
+	rng->priv = (__force unsigned long)base;
 
-	return devm_hwrng_register(dev, &data->rng);
+	return devm_hwrng_register(dev, rng);
 }
 
 static const struct of_device_id meson_rng_of_match[] = {
-- 
2.39.2



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
