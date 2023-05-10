Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A97ACC7EE22
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 May 2023 12:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PrGQfKJfwkYkCgjLUxvi4hAXzqW93EKHOytm4xCcVU0=; b=PaXByfx7kwUafEdsajWDfqQCXK
	TZYuujGckbBGh+v2oPlf5Z81zuqkR5U1iz99TaFiZfzzAm3Qe4xxvVNiNhWQLPCOWDJi22C07oRwG
	9jt3lYzaKhDqxCMLdLwUtxB0PjmEAdl7MK6EZjeTsSffXvFRk4iOA5kvTuOSBfo/b6yxORZUKD2Vn
	+jZf/3Mb9pvFRkZeMLmNe5IKea9pdWx+GbuR4AaKjtz76HTI+zbR+SIPoydk1y2rYub/H+Y9Qusum
	BlAj9wHrHShnL5vcub/JvdplVRxR5M7gx3hVUiJG4xXnR7PwzEmdfh2luJtqEF/2yKaxCDm+HpDP5
	TVPR2g1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwjLH-006BCU-1q;
	Wed, 10 May 2023 12:54:51 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwjLF-006BBW-0b
	for linux-amlogic@lists.infradead.org;
	Wed, 10 May 2023 12:54:50 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3f42d937d61so14548845e9.3
        for <linux-amlogic@lists.infradead.org>; Wed, 10 May 2023 05:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683723285; x=1686315285;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DsPeOMPF8LMsfujWKUmhb5P5Qm+Y5emVq+pEA4n3YfU=;
        b=vgGMtv0Z8dWkBLZETAjMPca0sTA0GXeNY2meKWGf6GZCT+YgiaWWVlfCaaWfGU2MfI
         uSPD6O1g2cz5QDgy/l30Hys/2tjFl+l3EmTVGfIMGTOUphTsN1iMYT+zR+2QPllsjwzo
         gaodANu4pPTAlODyHoNWwH2vR/sKW0hLS+q8q9YYCbE8O2nnuvjdUTlu/oUV/viRFoFI
         EHjWKFDECumotp9kw7ObscpJ+ISLNeHfEoTRibUjp/B5JByatMI49xLqObo2b3UDpR1H
         MUlSx4ViCKjnIaDeeqxYwVybCPFZyd08yhXEmJdBNvtu7nt0thshH3iIGUuHChlzMoBz
         khGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683723285; x=1686315285;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DsPeOMPF8LMsfujWKUmhb5P5Qm+Y5emVq+pEA4n3YfU=;
        b=Cwh8DBFdb9vJtoN0xDNI3U11W9VELg5NxKLDeNNP7b8bn898N9EB4FXJw6tHrWTJv6
         +FGgpqijGHR9FHT0jdBnEbOJhfnCGFOtEoOlPp85207ET3NEz4ZUiEV1/OrzYterqX1l
         X59VfquAerfhANOOrePVbosY+ffpO9uztAsQFisC3W+fFeGfuV0YbHrPy26B5kRJ6HAY
         O/gFxUDK+LWKtMkWQuckqMSLaf0nx6Ei8VbDdVYjhBsew6r0z+OEt+bH1YftENmJ1Hn5
         yOOapVPZcYZURVkgP+XL7njFsBaqvkR1FswiwFCMsHzA5HoUzQI/GazB+2bgvU8pB3TK
         R9jA==
X-Gm-Message-State: AC+VfDzLxm2JUsyVhweXnrm5Y9/MqizsTqPPneU8Tf8kFGvDPW8wq7NB
	9yeM2+uuY9QTIm6uPnuwd1bjig==
X-Google-Smtp-Source: ACHHUZ5fGwpDlDihF+FQJ3nyzntea8nQCmV/QQWHmnUMJ3kkiuW6ZAn09HPIcHOLDS5Do3lkyOg7TQ==
X-Received: by 2002:a05:600c:2313:b0:3f4:2266:8cef with SMTP id 19-20020a05600c231300b003f422668cefmr9445090wmo.31.1683723285344;
        Wed, 10 May 2023 05:54:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:2ee9:7e58:bce6:9219? ([2a01:e0a:982:cbb0:2ee9:7e58:bce6:9219])
        by smtp.gmail.com with ESMTPSA id u5-20020a05600c210500b003f427cba193sm7559862wml.41.2023.05.10.05.54.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 05:54:44 -0700 (PDT)
Message-ID: <4633b31e-6fd3-829a-ceaf-59087edb854e@linaro.org>
Date: Wed, 10 May 2023 14:54:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] mmc: meson-mx-sdhc: Avoid cast to incompatible function
 type
Content-Language: en-US
To: Simon Horman <horms@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, llvm@lists.linux.dev
References: <20230510-mmc-sdhci-msm-function-cast-v1-1-5ae634b24fbd@kernel.org>
Organization: Linaro Developer Services
In-Reply-To: <20230510-mmc-sdhci-msm-function-cast-v1-1-5ae634b24fbd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_055449_276466_CAE38663 
X-CRM114-Status: GOOD (  19.34  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 10/05/2023 14:39, Simon Horman wrote:
> Rather than casting mmc_free_host to an incompatible function type,
> provide a trivial wrapper with the correct signature for the use-case.
> 
> Reported by clang-16 with W=1:
> 
>   .../meson-mx-sdhc-mmc.c:791:38: error: cast from 'void (*)(struct mmc_host *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
>           ret = devm_add_action_or_reset(dev, (void(*)(void *))mmc_free_host,
>                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   ./include/linux/device.h:265:38: note: expanded from macro 'devm_add_action_or_reset'
>           __devm_add_action_or_reset(release, action, data, #action)
>                                              ^~~~~~
> 
> The same approach is taken in litex_mmc.c with the function
> litex_mmc_free_host_wrapper(). There may be scope for consolidation.
> 
> No functional change intended.
> Compile tested only.
> 
> Signed-off-by: Simon Horman <horms@kernel.org>
> ---
>   drivers/mmc/host/meson-mx-sdhc-mmc.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mmc/host/meson-mx-sdhc-mmc.c b/drivers/mmc/host/meson-mx-sdhc-mmc.c
> index da85c2f2acb8..97168cdfa8e9 100644
> --- a/drivers/mmc/host/meson-mx-sdhc-mmc.c
> +++ b/drivers/mmc/host/meson-mx-sdhc-mmc.c
> @@ -776,6 +776,11 @@ static void meson_mx_sdhc_init_hw(struct mmc_host *mmc)
>   	regmap_write(host->regmap, MESON_SDHC_ISTA, MESON_SDHC_ISTA_ALL_IRQS);
>   }
>   
> +static void meason_mx_mmc_free_host(void *data)
> +{
> +       mmc_free_host(data);
> +}
> +
>   static int meson_mx_sdhc_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> @@ -788,8 +793,7 @@ static int meson_mx_sdhc_probe(struct platform_device *pdev)
>   	if (!mmc)
>   		return -ENOMEM;
>   
> -	ret = devm_add_action_or_reset(dev, (void(*)(void *))mmc_free_host,
> -				       mmc);
> +	ret = devm_add_action_or_reset(dev, meason_mx_mmc_free_host, mmc);
>   	if (ret) {
>   		dev_err(dev, "Failed to register mmc_free_host action\n");
>   		return ret;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
