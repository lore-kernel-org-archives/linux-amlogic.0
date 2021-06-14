Return-Path: <SRS0=Jm29=LI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B69F7C48BE6
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jun 2021 13:10:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83BC86128A
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jun 2021 13:10:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83BC86128A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=troSMnyMznsNiek83FqRqj0YM5tvmpj+7/tA81brfVA=; b=zdsfrFdKjBk5nDYgu+PaNpDCKo
	pc7GwnRU2wrB4GVGdgnr73cBnm5mctqwqqSe+zwnmb8xeSqdPWSmGw1aKn3NidUfRBicUxWe5E4Wd
	lIPf4ZITZyxUa0LpZg8dNdHuBqMJguzoLlTaj5xakinzR5fv2VKj09/bEjWRppAg6ksXSXlLhhhHe
	R8WxgbbbX8k2yyy1uI12CrgDXtlr7FJPSOaDRPWiC47uQIYxu53NyVBdVmJ0pal9d+Gz4iSPkgTNT
	qZxUeWcKD9E9kqS6MfI9jj1HbP6hEQNmoBxFrpfbFcl22l6FIz0oiO/vi5gsqhI2bPBZBmigLtHAN
	UuzwND7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsmLk-00EDKk-Mq; Mon, 14 Jun 2021 13:09:56 +0000
Received: from mail-wm1-f42.google.com ([209.85.128.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsmLf-00EDIb-Nz
 for linux-amlogic@lists.infradead.org; Mon, 14 Jun 2021 13:09:55 +0000
Received: by mail-wm1-f42.google.com with SMTP id f17so12111316wmf.2
 for <linux-amlogic@lists.infradead.org>; Mon, 14 Jun 2021 06:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=R81uREkUogO+0I18Z26XftVz6AP1SWmqajE8u/Zgwak=;
 b=ZDzj1DcTYJDDnMMrH9pPIe9zXsQZgj4quciaM6vTD+poAcJu9VFol+t4P61zd3Gvwa
 S/PoI8z72mftg8JnNBgWJfjW6htEKBAy73V/rd7u3SoZpa6bXl+C6CoMmZLk8R5DaTSW
 1FX1CynwJKuNxWVrgKuDMuwS+2wCfoc8GuQEkhqcvZ/52O2EKT2bmYHjEhFXymRBHbzb
 RywDDxyTizGHPB6DDVhLRyaxraMfQiRbx103UDeJRWqLTQ1mX1yxdwhGBVDf1YzJm2mW
 PEtDq4BZMAbQckPrkG3FHnzRLx5B9ghbxaXkp0SOfKLlyIqddKzs9BWPTawJkz006Z5F
 FFrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=R81uREkUogO+0I18Z26XftVz6AP1SWmqajE8u/Zgwak=;
 b=pH9y9ruzm6VLQU+BXhayX/16149SpwnHfLIQaa8tj8kGlFcCQwl4Ds00pqUU2YtC4A
 cYdsCS3rXZ6uiqoHkLgqBd3YZOmFoWInh48UH4+cg2kpO/w5iNAmy4xGgb8pFgWlQFjN
 /k9t+ERXjyU2N/f8ffkqRP1oUprscO4cr24l/oId3TE8kn7JDcANjpq3+I+nCL1EZ+HV
 rghcqS5En4pjlYG4FgIb/RLYqCeha26GZHxTONq4/lf8nCVt7c7wFK7rs7j1KatG1QbB
 o8pH3Jh5pXDIncNZIJwvZZ7cMwbcXvG8qV9Q4Rvq/fSL0CvUqNBakUFqEb+DYgAYB//v
 UTVg==
X-Gm-Message-State: AOAM5321UfSf6jzbwmY2CTVaZq/x8HE1JYqjsnutipTumi1f95JSakxu
 Y2CCHrBOBmGyd2mhQ+EOMuodbQ==
X-Google-Smtp-Source: ABdhPJzvOJIpH5I9fsn1C5b8nZomvpQk/22c28tDkwiaE/NCXB8ERgCGdtQ8w2UsbrpGkGyabOiuOQ==
X-Received: by 2002:a7b:c5cd:: with SMTP id n13mr16341336wmk.97.1623676129021; 
 Mon, 14 Jun 2021 06:08:49 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:f0d4:3c02:f06a:77bb?
 ([2a01:e0a:90c:e290:f0d4:3c02:f06a:77bb])
 by smtp.gmail.com with ESMTPSA id h18sm8957878wrs.64.2021.06.14.06.08.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 06:08:48 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] spi: meson-spicc: fix a wrong goto jump for
 avoiding memory leak.
To: zpershuai <zpershuai@gmail.com>, Mark Brown <broonie@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1623562172-22056-1-git-send-email-zpershuai@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <b3ea2ad6-6341-df56-9d09-e3e832f8f316@baylibre.com>
Date: Mon, 14 Jun 2021 15:08:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1623562172-22056-1-git-send-email-zpershuai@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_060951_850142_338DC27B 
X-CRM114-Status: GOOD (  17.66  )
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

Hi,

On 13/06/2021 07:29, zpershuai wrote:
> In meson_spifc_probe function, when enable the device pclk clock is
> error, it should use clk_disable_unprepare to release the core clock.
> 
> Signed-off-by: zpershuai <zpershuai@gmail.com>
> ---
>  drivers/spi/spi-meson-spicc.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
> index d675334..b2c4621 100644
> --- a/drivers/spi/spi-meson-spicc.c
> +++ b/drivers/spi/spi-meson-spicc.c
> @@ -725,7 +725,7 @@ static int meson_spicc_probe(struct platform_device *pdev)
>  	ret = clk_prepare_enable(spicc->pclk);
>  	if (ret) {
>  		dev_err(&pdev->dev, "pclk clock enable failed\n");
> -		goto out_master;
> +		goto out_core_clk;
>  	}
>  
>  	device_reset_optional(&pdev->dev);
> @@ -764,9 +764,11 @@ static int meson_spicc_probe(struct platform_device *pdev)
>  	return 0;
>  
>  out_clk:
> -	clk_disable_unprepare(spicc->core);
>  	clk_disable_unprepare(spicc->pclk);
>  
> +out_core_clk:
> +	clk_disable_unprepare(spicc->core);
> +
>  out_master:
>  	spi_master_put(master);
>  
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
