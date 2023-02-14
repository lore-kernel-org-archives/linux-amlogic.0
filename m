Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4412C05027
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Feb 2023 21:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Tli7VnWQkDu8vKdRNr/bMPaIJGegDXx/XJC76Q0vlM=; b=qhRXd1+C6ar7ly
	ntwHT8DjBYPwB4HfG+wbL6v16y09DUs172Zbbee8h81gXEwxiifAneHkl8giel07cNJKkrS+vowGH
	Bqm6a4SNFHzK1pKxzkDcfhHs+jHcf1RP8rc7RHSGO3KQRgQnApANa+PiJMsEmk+kYEcwMcSwi28eU
	4yc7ljKKy2cQBPkceoFiZcNbMOVxrA7hWaiS9ue86oPd1RG81O6WVHAvOBkI1HINsKvlCRlVTmpq4
	g97mxJ3FceGOd2L157Roj1I18cKgj1Her9Yy4xcH0HEUxmRxdU0zMvmYLxdkzNqlLZkN5+40EFG8T
	gYdHDNfa7OmZVUFj9ARw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS38D-003fF3-84; Tue, 14 Feb 2023 21:46:33 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS363-003ePO-Hw; Tue, 14 Feb 2023 21:44:20 +0000
Received: by mail-ej1-x631.google.com with SMTP id ml19so43650387ejb.0;
        Tue, 14 Feb 2023 13:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9LqJXdxxFstKfYubhTeoAWTHHu54RXhCthHqvhTdxVw=;
        b=qPz+gKBIC/R8A6gtUZ8ceyazI706kmMBJgDlbAJ55QeqC9llqy5M4oPP92aAhOMmdL
         LWY84jGU18KQFjObsGNOtO9LD3yECwJaNZ9tntFSoQxhfFbKthtGafSoJ8Vc/tRRAuVw
         C+OnZB1r39zbuG4pRsxyCwgqSqpMe8icb2wC+5xnMYb7fYePk7BmGXqDqPJQ+1CqdVti
         IcB3RdfDuHOg078AU//wVFbsi6L5L4YJROes2Dpqxn2wB3PK8QE2aZKEUR2/K3QeG6jL
         /19hR3kD4Ey35+eK9Y+E3iMXIoN1TmWkJ2f8Ukuf8veCGBcwsDD0h6i+zgrobOOPxWIs
         MX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9LqJXdxxFstKfYubhTeoAWTHHu54RXhCthHqvhTdxVw=;
        b=lSVMNJvkng0u7ZOwsZj+vceu7gK+rPmDljpQt1P6ZReiHSZqG9vHtDxtOD9J+puf+e
         vHm9AqmNTImPTMuS1jpmlTSIyR+QNs08S03FaLMCyhIE7Ei4cbEfQvTJBjllpejSgXqt
         EPtSuDF/U3X0Vc7mOdJr7fqCNExWdw+PH7LUcrtZ9YWqxS59yXGTxa3dhVAJBkrz1bsk
         eGXqUPUbGZZpVDSlGT5oljdHMQkGcY+AdHyFtQzs0OAJwkDzumTYsaQpJ+Qj7lDhVFlp
         hbNnLrMVA39teI50dSYidttOBFdhpHfbHe33xEZhwE9XrWNJTxpXK4v3qF/hQR+CFprf
         xWGQ==
X-Gm-Message-State: AO0yUKUU7MtgJsWlP9kuHWv9bk1hzx0b+y0pLSlIS2Fg6rFO5fQjU32h
	G9bb7b72WOYGJByOdiyXOjM=
X-Google-Smtp-Source: AK7set/az3JscyAMvJVE9MKuOV/yeIlPmFr6p9Be9W8jefOVLPXcDrovvENpnkqW2DXiWXUtMV9sPA==
X-Received: by 2002:a17:906:850e:b0:7c1:765:9cfc with SMTP id i14-20020a170906850e00b007c107659cfcmr328840ejx.34.1676411056936;
        Tue, 14 Feb 2023 13:44:16 -0800 (PST)
Received: from ?IPV6:2a01:c22:7234:f800:b56b:f43d:948c:eede? (dynamic-2a01-0c22-7234-f800-b56b-f43d-948c-eede.c22.pool.telefonica.de. [2a01:c22:7234:f800:b56b:f43d:948c:eede])
        by smtp.googlemail.com with ESMTPSA id j9-20020a1709066dc900b008b1294f7f63sm1669820ejt.221.2023.02.14.13.44.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 13:44:16 -0800 (PST)
Message-ID: <2bb70611-5dea-1144-51bd-93c46b455392@gmail.com>
Date: Tue, 14 Feb 2023 22:44:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: [PATCH v2 3/3] mmc: meson-gx: support platform interrupt as card
 detect interrupt
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <15df9ef0-9b73-ca5a-d3cf-0585cd135bc5@gmail.com>
In-Reply-To: <15df9ef0-9b73-ca5a-d3cf-0585cd135bc5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_134419_646164_B41E8CD9 
X-CRM114-Status: GOOD (  12.74  )
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

Use a new mmc core feature and support specifying the card detect
gpio interrupt in device tree.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- adopt the changed way to pass the cd interrupt number
---
 drivers/mmc/host/meson-gx-mmc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index f4b50793e..079c52dbe 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -1166,7 +1166,7 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct meson_host *host;
 	struct mmc_host *mmc;
-	int ret;
+	int cd_irq, ret;
 
 	mmc = devm_mmc_alloc_host(&pdev->dev, sizeof(struct meson_host));
 	if (!mmc)
@@ -1213,6 +1213,9 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	if (host->irq <= 0)
 		return -EINVAL;
 
+	cd_irq = platform_get_irq_optional(pdev, 1);
+	mmc_gpio_set_cd_irq(mmc, cd_irq);
+
 	host->pinctrl = devm_pinctrl_get(&pdev->dev);
 	if (IS_ERR(host->pinctrl))
 		return PTR_ERR(host->pinctrl);
-- 
2.39.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
