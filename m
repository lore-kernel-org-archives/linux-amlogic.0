Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F15C6379F
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Feb 2023 21:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bdBT9rwbAUDcOI64B1U9BaWYJr2defVoMFuQVGddIfc=; b=HynzqxjANm33r0
	mjTq73JKADR2RStgYOkvGEWtO89SkHK2wARo0M1V+/pXPEGSBdL6gju0by4e4+HxGLThpQWiiiA5N
	cbyhCDzNXTILyJCnJn9oQRh6ngWG252g9Uo++Z93VUKcgJch7xKRBiTE9+7U45mDBhCPiJP0s8bFi
	o149RIA5+uiXSYq9U4KHxP3z71bUxFXAhnnC8pbM/ekj110tVc2NY7k0d4q+Nuknq4/D+2U3ZSgTk
	RvzTntzKdUEQhY9hYLywGe0TTFp6/spzIe049trA3oTt4uWHcMHHfoYOxlKOyVgiM1ZSlp36cxUTc
	S1W/38RhlqDtpUyTSsVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTUJf-0006PV-M5; Sat, 18 Feb 2023 21:00:19 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTUIu-00068H-Po; Sat, 18 Feb 2023 20:59:34 +0000
Received: by mail-ed1-x534.google.com with SMTP id z10so4913566edc.6;
        Sat, 18 Feb 2023 12:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WdR42IB0NMvV6bLj/h4nCD5zMdmqmCIUqAFbenEs5jY=;
        b=dojBO0MiYR79MdvodHUNO3HcDuVwsneTZzbHkTbRl7v7la1fZAKaAArywlObWLMFzt
         O2FA6+fgDCKzhYC8iS8LVKClgJzXTtTEdPRdu5mB1h2GmuLLuyiv8uHkBayR20Gltt5V
         3d8BEOWpUmBM9/uNxGYFkbXrZMI7oToWwkvlMV5WWrXVhLBPL0gLAEMh49m9HNWe8ffA
         MfYJaz6TXqVxMb9i14oLKeK7rIo2eQFvWAgcaJtjnsffWqT5cwJVk9StbcRfGZR3k5+h
         iRYcvsczzPzQNhdLxeEXrcGUcnsCoyHTUks2kUQgr7qiJJdc5heWGK6oP3lWlEVGZmYH
         I1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WdR42IB0NMvV6bLj/h4nCD5zMdmqmCIUqAFbenEs5jY=;
        b=vkDjAspePDvuTxvK6k7jvnPFZfIM1ECLNk+A9nEQ/QJpBnE/u400sFUU5wqxTS+/4d
         SAAoA1hfDa+3GfHbiAysmABwMengw36GcjrY+PwaHCWLx6vJVqBnKiFGV+EKRUXrMaU1
         l2cStK++vy0Pt770cqqQ9sDP88/nYyXIovN6BHqHhNEuyCAZ+CkZ43Kp0dEpIpi3y3As
         wDw3bWKHHT4tX18E8kBg/rfXWkaEvNgfFZgVi1Aa8jb3JDMoKOnRK8FS5mP4/FZdtIHH
         BK6vSTtCmc7jAnGYVPJaMBp+XH5TA9GrErxBq1eGMzEVOwSEd3UmbIjQcweiOjth+V6/
         4a1g==
X-Gm-Message-State: AO0yUKUrErj3ksQLZ9INizZfoHloQCr+aShKm5YwhLAYtGpm4U/C5ukr
	8PWd0L49StqZs5QSXBxRYho=
X-Google-Smtp-Source: AK7set9cn7AqlwQY14jsDUTgDMEHCJVp98ap0AM9NBu0+EJmF1xUaZbDvmql9CCf4iQ0SRty6XfT/Q==
X-Received: by 2002:a17:907:33cc:b0:895:58be:94a with SMTP id zk12-20020a17090733cc00b0089558be094amr3758894ejb.14.1676753966699;
        Sat, 18 Feb 2023 12:59:26 -0800 (PST)
Received: from ?IPV6:2a01:c22:7b82:af00:2955:cfd1:cf55:9ea? (dynamic-2a01-0c22-7b82-af00-2955-cfd1-cf55-09ea.c22.pool.telefonica.de. [2a01:c22:7b82:af00:2955:cfd1:cf55:9ea])
        by smtp.googlemail.com with ESMTPSA id de24-20020a1709069bd800b008b13c87d951sm3804629ejc.146.2023.02.18.12.59.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Feb 2023 12:59:26 -0800 (PST)
Message-ID: <abd9a2ce-5b9b-c6bd-d3bf-8791d4005231@gmail.com>
Date: Sat, 18 Feb 2023 21:56:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: [PATCH 2/5] hwrng: meson: use devm_clk_get_optional_enabled
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
X-CRM114-CacheID: sfid-20230218_125932_887390_C1E691D2 
X-CRM114-Status: GOOD (  11.10  )
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

Use devm_clk_get_optional_enabled() to simplify the code.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/char/hw_random/meson-rng.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/drivers/char/hw_random/meson-rng.c b/drivers/char/hw_random/meson-rng.c
index e79069b6d..22e3dcc6f 100644
--- a/drivers/char/hw_random/meson-rng.c
+++ b/drivers/char/hw_random/meson-rng.c
@@ -19,7 +19,6 @@
 struct meson_rng_data {
 	void __iomem *base;
 	struct hwrng rng;
-	struct clk *core_clk;
 };
 
 static int meson_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
@@ -32,16 +31,11 @@ static int meson_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
 	return sizeof(u32);
 }
 
-static void meson_rng_clk_disable(void *data)
-{
-	clk_disable_unprepare(data);
-}
-
 static int meson_rng_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct meson_rng_data *data;
-	int ret;
+	struct clk *core_clk;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -51,21 +45,11 @@ static int meson_rng_probe(struct platform_device *pdev)
 	if (IS_ERR(data->base))
 		return PTR_ERR(data->base);
 
-	data->core_clk = devm_clk_get_optional(dev, "core");
-	if (IS_ERR(data->core_clk))
-		return dev_err_probe(dev, PTR_ERR(data->core_clk),
+	core_clk = devm_clk_get_optional_enabled(dev, "core");
+	if (IS_ERR(core_clk))
+		return dev_err_probe(dev, PTR_ERR(core_clk),
 				     "Failed to get core clock\n");
 
-	if (data->core_clk) {
-		ret = clk_prepare_enable(data->core_clk);
-		if (ret)
-			return ret;
-		ret = devm_add_action_or_reset(dev, meson_rng_clk_disable,
-					       data->core_clk);
-		if (ret)
-			return ret;
-	}
-
 	data->rng.name = pdev->name;
 	data->rng.read = meson_rng_read;
 
-- 
2.39.2



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
