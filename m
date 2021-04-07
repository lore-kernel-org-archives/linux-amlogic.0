Return-Path: <SRS0=M/XH=JE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E86C433B4
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Apr 2021 08:51:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C79C61177
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Apr 2021 08:51:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C79C61177
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HQox57hm8hBa8VVAjajRhBL32J+NGUse8MqS4uhY+xQ=; b=hUc5RZgPEfoQsEyJt9vpz+YTp
	3/xgQe9Ju54xweO302dXaOH6jW7zYqBNZemg7uCUO1D0q9rx1Eka8YDfqkQWwxZmBl8yBhENldxnp
	f2i6MsTsjKCU+HrLvEunXYZlabL15+V0600wK81qOYN9SfhUYodTY3KLHpVcLEgVLfsoF5pUGwzJV
	Safaghcvyu77hgRckx3jostuixhFam9n3M7bHKxf5kkf2oPJkLtvmUjaL31BzSOcOUodhEtuoCcLI
	rppsWEj1OuGi2flr2h6RrLgX6KNsqDpqRK2+8YjMEHww8mn553NGBpGROYV7TDXvZRR/jIrpUyEGO
	hCS9PZqcQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU3uV-004X6P-Jx; Wed, 07 Apr 2021 08:51:40 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU3uP-004X5f-DS
 for linux-amlogic@lists.infradead.org; Wed, 07 Apr 2021 08:51:36 +0000
Received: by mail-wr1-x42d.google.com with SMTP id u11so4598347wrp.4
 for <linux-amlogic@lists.infradead.org>; Wed, 07 Apr 2021 01:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q7UIS5BzGY0LxafWxdkJk0JUpBxwtTMj3dF4rm14v6Y=;
 b=IN8He/6oHXi1vchgVEOBGinoJSH+M8cjhNw3IRJDcUCoKDMVsD9WiCHDZf6TCtUgI1
 jEHZch/6NAbMUG+SJisSN6JPKSHcU6hcLP0dR8PBfLaZ481NgYKvEv1h5QJ4j1dl0ZTV
 htoDecW4ebV/7Q7QRvPQuQT5+i9sAIsIMgVVbfl8hB/evGjna5m9tGSOtpmx8iMCGF2e
 YQ+KntNbI1TqBj0XfnA1eOuOJXypMDLUFGQjDgdJXcvc2Hob4l4tL3m83071ACbQENkI
 bSj31I8OBMutoAomsOtv5lTPp9cSo+B/CbO9c79jAXb9hWfOHarseGmJO2ccpegKFCUU
 saXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=q7UIS5BzGY0LxafWxdkJk0JUpBxwtTMj3dF4rm14v6Y=;
 b=icQOzZ4R1vSfHzc0EhmkS8UELzBS7fg6iqNEq34W8Eb38UaxJscUWnnPelhClnu/Hq
 ltpbo5n0QgeqJkYzSIn2GCWmyutzUIEu8pfxWsP8llOAFtPNQ8WhWza5FfBcpq9vlNj/
 YKBhy0/g7HC6v72k1sdVy1OmB04l+CLy4vbtLKLeFBmCDw9kvBkXJ1jgWIHV2MlonfqP
 v0bQ6OqiIQYx+3adDRNqhfhuGkfzyJAbnjk+DZRvVPdxxaWVwhnN1rnYIsWNy63eHulr
 UZnVb4wv+cpwuwdcMm3skMePv7mAVhHignescNSIHWqVKrNbXs0kudy8RAzQ05tdaE7O
 uNKw==
X-Gm-Message-State: AOAM531FO5g9PRolopYLcaWDg8Mj7d7+iRjgYxsgMQwxUFTzkSNDt3Re
 tdeGL9kVsjXM7qcJpSRJY8Uwsg==
X-Google-Smtp-Source: ABdhPJx6a0J9G+t37xv0QGQfKUYzMxMoFRYyeFK+8ZZvkuCruFAeLva91ShU7lSmDbGiMgDAd3BH8A==
X-Received: by 2002:adf:ff84:: with SMTP id j4mr2966319wrr.271.1617785492760; 
 Wed, 07 Apr 2021 01:51:32 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:1202:4b29:31f6:551c?
 ([2a01:e0a:90c:e290:1202:4b29:31f6:551c])
 by smtp.gmail.com with ESMTPSA id g35sm6619081wmp.42.2021.04.07.01.51.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 01:51:32 -0700 (PDT)
Subject: Re: [PATCH] thermal: amlogic: Omit superfluous error message in
 amlogic_thermal_probe()
To: Tang Bin <tangbin@cmss.chinamobile.com>, glaroque@baylibre.com,
 rui.zhang@intel.com, daniel.lezcano@linaro.org, amitk@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <20210222061105.6008-1-tangbin@cmss.chinamobile.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <d1740a66-455e-4b13-e524-8be0049620cd@baylibre.com>
Date: Wed, 7 Apr 2021 10:51:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210222061105.6008-1-tangbin@cmss.chinamobile.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_095133_940273_5B3B89D8 
X-CRM114-Status: GOOD (  16.02  )
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

On 22/02/2021 07:11, Tang Bin wrote:
> The function devm_platform_ioremap_resource has already contains error
> message, so remove the redundant dev_err here.
> 
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> ---
>  drivers/thermal/amlogic_thermal.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/thermal/amlogic_thermal.c b/drivers/thermal/amlogic_thermal.c
> index ccb1fe18e..bba9f3b14 100644
> --- a/drivers/thermal/amlogic_thermal.c
> +++ b/drivers/thermal/amlogic_thermal.c
> @@ -253,10 +253,8 @@ static int amlogic_thermal_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, pdata);
>  
>  	base = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(base)) {
> -		dev_err(dev, "failed to get io address\n");
> +	if (IS_ERR(base))
>  		return PTR_ERR(base);
> -	}
>  
>  	pdata->regmap = devm_regmap_init_mmio(dev, base,
>  					      pdata->data->regmap_config);
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
