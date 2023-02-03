Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E55CC05027
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Feb 2023 23:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ftljNggkUM5XQEZf+3j+jcb1ZJPCqQEuJVGS5yL8S/s=; b=zVPfIB+XnUdsmQ
	Ogp3P2J1KUU263QFN1mCKsmSuhQqseNonHO/wPF8n7GsGOBMX23hyvVDlyJ0MmTF0WodCgjHD2Rko
	ymkuO7z4T/oZwL7L3UU80qNRcTggNm14vlSeAS5n7TjKbXiaYp6tuO5dizAs8qhp4Igl7udRiq0za
	X6P3/SLnxC+NaWhPLgE2D/7bAcRajkhRUtNS2EqW1XGTP6twU3ddQSjq+pysi1cf1CPlWJevXxulv
	laZtJIPuIlwDNES4tjK269VVvI2q7zNrY3Sq5vH/q+e4RCfC88/RtJl6RaCMIBIfqQMmaHEqp7z9N
	jLT1Ys6FSusdmZJybJKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO5tl-0043t6-7y; Fri, 03 Feb 2023 23:55:17 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO5ta-0043p5-O2; Fri, 03 Feb 2023 23:55:08 +0000
Received: by mail-ej1-x635.google.com with SMTP id mc11so19614647ejb.10;
        Fri, 03 Feb 2023 15:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B5szyujuXXZvpHfx5ixivTtqq4kbda1YQiNvs6P56sM=;
        b=V/yndW6G5Khi4mY4pY9vfL6FkgwaJ4UMRnSXIJM678O4jSMDXJCLF+txfC3zq0+7ZQ
         TT8Ujb3OIUTL+G7NHMBDlQ1nkFU6jeGyizeMMxVW5/m7SN8MIrMb4SKsw4gx+Ndhssw6
         z/EGjjPppap7hj/nKpRCvgd0C28zAAHqKyikh/3w2Bu+6Qc7vZwIfgXI6DCfXzYTH4l2
         MI0LjYb9WmRy+uvcooR/5ThKtGjX0wnfEjvE1hRxwgefxuMgIGAR5BvoTHmu6kBthmwJ
         GUea+Ul5gbsnPVzHvMEV/D7EuUP61DQQ8k8M8C7ja8xfuyqUBVc9X0svEWv7eEvxqElK
         +Oow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B5szyujuXXZvpHfx5ixivTtqq4kbda1YQiNvs6P56sM=;
        b=HrtQkDy8tvIJHZdlRSS0HJ20+CcmS+dCpHrrHW4OPJoZnUDnXH494enIcmNS68RiMz
         l9HqgmpzM3IeZVGU7oxjwiEJoRypBLmuESZ7P08oIf/ynrqMw68qLUtQG//qEc6wC1nA
         DADbdGRnEx/ntveCk9iszWymjilQfbc3meFtjAo5HHoBAm6KZb9q5OQTEMoElNEJSRaz
         nUmWHU7nbw+eHqCfDb9q6jZ23JMCkmKlnwsZQboppn5jQcUC5xvL1+ZhLgfBneBGiy0W
         Kvz8xaOsKjP/Av39C/bh3au9lbKBl4Us+rX5Cz/c+2PhjZHzidiQDqC+GXfZDyt2j16T
         k+7g==
X-Gm-Message-State: AO0yUKUXm7K4UKKoVsmDzYVwDN6f8cLy7dSBjiE5kEBm2bky0lelBvHP
	JvakO396lNPfqQTYwWxFp2s=
X-Google-Smtp-Source: AK7set+US4/Wmk03TuWdp+ujn1Hpoc7KrqhYQdTBXn8/qmtcZAFC8XTsWlzfbF8uqODk2+pvjHTZsA==
X-Received: by 2002:a17:907:c20c:b0:883:3661:97e5 with SMTP id ti12-20020a170907c20c00b00883366197e5mr11825031ejc.50.1675468500022;
        Fri, 03 Feb 2023 15:55:00 -0800 (PST)
Received: from ?IPV6:2a01:c23:b81c:5800:95fd:ccbf:6c44:23f7? (dynamic-2a01-0c23-b81c-5800-95fd-ccbf-6c44-23f7.c23.pool.telefonica.de. [2a01:c23:b81c:5800:95fd:ccbf:6c44:23f7])
        by smtp.googlemail.com with ESMTPSA id v21-20020a509555000000b004a9cb25d1eesm1139909eda.87.2023.02.03.15.54.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 15:54:59 -0800 (PST)
Message-ID: <728f159b-885f-c78a-1a3d-f55c245250e1@gmail.com>
Date: Sat, 4 Feb 2023 00:54:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: [PATCH 2/2] mmc: meson-gx: use devm_mmc_alloc_host
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <e7880df5-43ab-d6b5-0ac3-440adfb12808@gmail.com>
In-Reply-To: <e7880df5-43ab-d6b5-0ac3-440adfb12808@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_155506_818973_DA2B43AB 
X-CRM114-Status: GOOD (  11.54  )
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

Use new function devm_mmc_alloc_host() to simplify the code.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 52 +++++++++++----------------------
 1 file changed, 17 insertions(+), 35 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index be1a972c2..a2fc25467 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -1185,7 +1185,7 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	struct mmc_host *mmc;
 	int ret;
 
-	mmc = mmc_alloc_host(sizeof(struct meson_host), &pdev->dev);
+	mmc = devm_mmc_alloc_host(&pdev->dev, sizeof(struct meson_host));
 	if (!mmc)
 		return -ENOMEM;
 	host = mmc_priv(mmc);
@@ -1201,46 +1201,33 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	host->vqmmc_enabled = false;
 	ret = mmc_regulator_get_supply(mmc);
 	if (ret)
-		goto free_host;
+		return ret;
 
 	ret = mmc_of_parse(mmc);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_warn(&pdev->dev, "error parsing DT: %d\n", ret);
-		goto free_host;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "error parsing DT\n");
 
 	host->data = (struct meson_mmc_data *)
 		of_device_get_match_data(&pdev->dev);
-	if (!host->data) {
-		ret = -EINVAL;
-		goto free_host;
-	}
+	if (!host->data)
+		return -EINVAL;
 
 	ret = device_reset_optional(&pdev->dev);
-	if (ret) {
-		dev_err_probe(&pdev->dev, ret, "device reset failed\n");
-		goto free_host;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "device reset failed\n");
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	host->regs = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(host->regs)) {
-		ret = PTR_ERR(host->regs);
-		goto free_host;
-	}
+	if (IS_ERR(host->regs))
+		return PTR_ERR(host->regs);
 
 	host->irq = platform_get_irq(pdev, 0);
-	if (host->irq <= 0) {
-		ret = -EINVAL;
-		goto free_host;
-	}
+	if (host->irq <= 0)
+		return -EINVAL;
 
 	host->pinctrl = devm_pinctrl_get(&pdev->dev);
-	if (IS_ERR(host->pinctrl)) {
-		ret = PTR_ERR(host->pinctrl);
-		goto free_host;
-	}
+	if (IS_ERR(host->pinctrl))
+		return PTR_ERR(host->pinctrl);
 
 	host->pins_clk_gate = pinctrl_lookup_state(host->pinctrl,
 						   "clk-gate");
@@ -1251,14 +1238,12 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	}
 
 	host->core_clk = devm_clk_get(&pdev->dev, "core");
-	if (IS_ERR(host->core_clk)) {
-		ret = PTR_ERR(host->core_clk);
-		goto free_host;
-	}
+	if (IS_ERR(host->core_clk))
+		return PTR_ERR(host->core_clk);
 
 	ret = clk_prepare_enable(host->core_clk);
 	if (ret)
-		goto free_host;
+		return ret;
 
 	ret = meson_mmc_clk_init(host);
 	if (ret)
@@ -1353,8 +1338,6 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	clk_disable_unprepare(host->mmc_clk);
 err_core_clk:
 	clk_disable_unprepare(host->core_clk);
-free_host:
-	mmc_free_host(mmc);
 	return ret;
 }
 
@@ -1371,7 +1354,6 @@ static int meson_mmc_remove(struct platform_device *pdev)
 	clk_disable_unprepare(host->mmc_clk);
 	clk_disable_unprepare(host->core_clk);
 
-	mmc_free_host(host->mmc);
 	return 0;
 }
 
-- 
2.39.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
