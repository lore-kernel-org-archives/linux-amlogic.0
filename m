Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D209AC61DA4
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Feb 2023 21:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ol82WoHOD0uQXalxBfWPCyKZ22Wv94PF2eOUuyS8q+w=; b=L1MBg8FSinADcR
	mIm+KT4tc7DrF7kyF0+SUS/j65n5nhZWLUirrVyttDLl52MFpMD6kGI6f1+NRqy7qlC1HRZAOu2Sf
	1uvzijz48S+d+lVULXo/4PArFfRWZOlInQAO6lpiJajs3esXMvw0NOOEnVxraVNzDI0Yiz1hzfkRb
	2qs/wjlpApkjvpuK6/EacmLEbxrArvfjS1KYiZdj5Uz/oM67Pjl7vCj1/u4f/y4iqALgCgNDeMlFD
	wyi+vvXJqvq12e/GJmmIDiSRkHLlTaLxWGdxYeh9/kikSVN430VjSx7MxPY2D+HdG+MF85c808M/+
	z3ZSxHbHp28MDD+uU5VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTUJF-0006DL-Et; Sat, 18 Feb 2023 20:59:53 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTUIt-00068T-83; Sat, 18 Feb 2023 20:59:32 +0000
Received: by mail-ed1-x529.google.com with SMTP id cn9so4962200edb.7;
        Sat, 18 Feb 2023 12:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P1ozOXB1+zZ3Q23vSw9o85yMZkUJu05HyoWaZK330OQ=;
        b=o1OS4IpOoma7JtDQozUijuo160vnNSserkItANHAXJnEY+bNqmKGz1eWB0sLn6uT8p
         lkm+b74YtqgbYPPRES3X43AXUvPDfTJ8sU1mfOFlkQQu22lsMtzyrV+E0ilJjzJJt2S0
         onorIRtTdKV/pq8s96rhJj6p5iSKFNKvKGSesT+OKQRPDiz0oBf8c8977UZ1nzRPU4Af
         J1b0WlvwWsi6P1Zlvov0tTeZQcj4COZ/gROZorWOtbyUYXSJw0pehhCwCxcYufTKvU38
         /HbMHlygJxeMKx+j1kLSUdtfOwUPPzwvt6le/1yc0QB+kVc4jv2SOmRNKI88/KrdelqK
         S5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P1ozOXB1+zZ3Q23vSw9o85yMZkUJu05HyoWaZK330OQ=;
        b=ZBBJzaniMcrumDiRKYkGM11Md15b+j54WXT2mtPyPiBK8YUwSdSKzro3g3VRUdO9RB
         /1e+yVm6RXEWrfEcr17kq912SEiHcNYycJx1qZRcUsDVR0j1i7uNuutKCGyE4IzCa2y4
         fq5hNIF28olQVd9uE17Fd5xjROY6uBeg5xXKhH1gAm+UaoYIHohhOPwLY2EsE8TebFvd
         n9wOGYL0a5efk2jPcpyXCnm3ujrnHlCvOmhPNupbgVrdWRDaq/uZGqvtsp6Kq1ItYPxn
         a7LdWUAhtHqsU/hwmrEK2OEpN5yGBpYOrFdy0g0VEs/lbqtAT5sQW10jaXQWhEU3abT+
         Jtpg==
X-Gm-Message-State: AO0yUKUzmz3ooVkQuiGoQ3wAW3fCLYVWSHi+w3cHKXicd2K1ijzTyGx3
	KRza0pbK871Fx0zoDlISLh0=
X-Google-Smtp-Source: AK7set+s82dof//uh76YWzHccMEghPUnl8N5ozBosD4OqaybacZZ7orcJqlrbF76QDPG5PD31rxn3Q==
X-Received: by 2002:a17:906:3b91:b0:8b1:3824:1f58 with SMTP id u17-20020a1709063b9100b008b138241f58mr4478036ejf.21.1676753969676;
        Sat, 18 Feb 2023 12:59:29 -0800 (PST)
Received: from ?IPV6:2a01:c22:7b82:af00:2955:cfd1:cf55:9ea? (dynamic-2a01-0c22-7b82-af00-2955-cfd1-cf55-09ea.c22.pool.telefonica.de. [2a01:c22:7b82:af00:2955:cfd1:cf55:9ea])
        by smtp.googlemail.com with ESMTPSA id q11-20020a50c34b000000b004ad601533a3sm3695961edb.55.2023.02.18.12.59.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Feb 2023 12:59:29 -0800 (PST)
Message-ID: <4dafc70f-be7f-bfdc-8845-bd97b27d1c4c@gmail.com>
Date: Sat, 18 Feb 2023 21:58:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: [PATCH 4/5] hwrng: meson: use struct hw_random priv data
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
X-CRM114-CacheID: sfid-20230218_125931_339953_6DDD0A35 
X-CRM114-Status: GOOD (  12.61  )
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

Use the priv data member of struct hwrng to make the iomem base address
available in meson_rng_read(). This allows for removing struct
meson_rng_data completely in the next step.
__force is used to silence sparse warnings.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/char/hw_random/meson-rng.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/char/hw_random/meson-rng.c b/drivers/char/hw_random/meson-rng.c
index a4eb8e35f..bf7a6e594 100644
--- a/drivers/char/hw_random/meson-rng.c
+++ b/drivers/char/hw_random/meson-rng.c
@@ -17,16 +17,14 @@
 #define RNG_DATA 0x00
 
 struct meson_rng_data {
-	void __iomem *base;
 	struct hwrng rng;
 };
 
 static int meson_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
 {
-	struct meson_rng_data *data =
-			container_of(rng, struct meson_rng_data, rng);
+	void __iomem *base = (__force void __iomem *)rng->priv;
 
-	*(u32 *)buf = readl_relaxed(data->base + RNG_DATA);
+	*(u32 *)buf = readl_relaxed(base + RNG_DATA);
 
 	return sizeof(u32);
 }
@@ -36,14 +34,15 @@ static int meson_rng_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct meson_rng_data *data;
 	struct clk *core_clk;
+	void __iomem *base;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
-	data->base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(data->base))
-		return PTR_ERR(data->base);
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
 
 	core_clk = devm_clk_get_optional_enabled(dev, "core");
 	if (IS_ERR(core_clk))
@@ -52,6 +51,7 @@ static int meson_rng_probe(struct platform_device *pdev)
 
 	data->rng.name = pdev->name;
 	data->rng.read = meson_rng_read;
+	data->rng.priv = (__force unsigned long)base;
 
 	return devm_hwrng_register(dev, &data->rng);
 }
-- 
2.39.2



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
