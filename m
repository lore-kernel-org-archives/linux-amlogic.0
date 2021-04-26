Return-Path: <SRS0=Dvvs=JX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17BE2C433ED
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Apr 2021 18:04:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9509560FEA
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Apr 2021 18:04:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9509560FEA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JiOkx1ma/NdJEl4XmF3hdwHXSvIuG0nF4rmyFkrlPxQ=; b=CKNP7JlgC6v1Hk0hGU32EjMd7
	3BlEoRa/Tv0kcAK8n3vEsMjf+fndg+GLI10u4Dx+drOrozZaxxe81+ts90OyV5mNEcDmyjMtaoc7+
	3lu17LqPvZm2AW1XO4AkBNdloK50/7+hbjdklF2rBNU7+g6qwFiOZt5aHW0pgiC0FV8aENVK27FU/
	++d4hRxA3Oo/YW7wOiELYcN1h0Vq+GZOpXY9v/BJ6EX1+5W7HCZgCP5ALXTiJWTP8V37CZq2OUaaw
	rS2tNQonBC9neWKYsGezhHbu5ID1H9W5Sw+2+RqTPZI4R09jcAsB+H+AKnXsHj/Ske6b0+rwejLkM
	3H4Yvq+Yw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lb5av-008EtB-NV; Mon, 26 Apr 2021 18:04:29 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb5aq-008Err-S3
 for linux-amlogic@lists.infradead.org; Mon, 26 Apr 2021 18:04:27 +0000
Received: by mail-wm1-x332.google.com with SMTP id n84so3239255wma.0
 for <linux-amlogic@lists.infradead.org>; Mon, 26 Apr 2021 11:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sLlK+ON2myao5q9MqC74vluTzzv/E65V2uLXDsbBd8w=;
 b=odSsjA7DE6yWqHSyV1bybw+NBOWM//WiFglqqplSGIZYPc4E6d1EjE7GG5gTaMMBQl
 aDZzrD8DvjkY0PeQaQHmPSmXZx0+b4DERi3LLpX+fbDetMjCV14Np8sv5Is8RynkhV9O
 88KnQQ2hNuG+zXGDbdrWLZBVnmxXHF9MROLGMJpWK3zapYOEsX0FoObt06n04Ik/OmnM
 AEVIUPMaEuVakM1RHFfKq5AZ+xHQcADV9PK8/YQaKEbCcOPNn1MyLWwASODMRkCw7pCh
 Tj4n2Yc7Hu7xEs9JJU/OOYFIUE/m3Ij4dV8ka94Kg/OLcQgYBiOTdEYaLbmBtFCl1WVj
 ciXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=sLlK+ON2myao5q9MqC74vluTzzv/E65V2uLXDsbBd8w=;
 b=ruOoUhsiWZGSthWiGktrZ3ntfuu3GJqaiqFejc0tAfct78oD5IJXto0TNmwkQCACLE
 dEublziSy54ZW8Kw6Wg0W2C7W/7BXvSmZ1VZ69+QRx+RMle+x93DUU7ygIqkHnMjMKwm
 eL5Y2F87V8iGwo7Pcr16SAK3keqs4Y2vAJzJ3dLrFoJ8BPogOqn2g9e7xL9qeliHD98u
 ozkwB4JyJNRdqR/qauLQYRuoUpG3UIRWp3+VHn9uAu+fuTd39DKEvLDh1VNiO+AHohVn
 4mSM7S+byFGdNalhPpmyEuhFJopiRb9VGoXivoBqsOE2iPnYNcqtwuKKqsONhWE/nEVE
 L0dg==
X-Gm-Message-State: AOAM530fgFG28juvOxHWhbUt3dowYynbUl4p58SBkQsyeHIyYn4jXK4T
 6N7eOHTy6wZ/d2cBX2vWarewdw==
X-Google-Smtp-Source: ABdhPJxQ+jECyTT9SugB177/Zfsr9dZJkYoiQJ/ctFv5IJ0sEXY5KRrXUoUmj5l8ddjRhtm4NfLI7Q==
X-Received: by 2002:a05:600c:2cd6:: with SMTP id
 l22mr14452735wmc.160.1619460144138; 
 Mon, 26 Apr 2021 11:02:24 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:b76e:7362:77c0:ddc3?
 ([2a01:e0a:90c:e290:b76e:7362:77c0:ddc3])
 by smtp.gmail.com with ESMTPSA id a9sm265091wmj.1.2021.04.26.11.02.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Apr 2021 11:02:23 -0700 (PDT)
Subject: Re: [PATCH -next] soc: amlogic: meson-clk-measure: remove redundant
 dev_err call in meson_msr_probe()
To: Qiheng Lin <linqiheng@huawei.com>, Kevin Hilman <khilman@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Hulk Robot <hulkci@huawei.com>
References: <20210409110243.41-1-linqiheng@huawei.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <3299a54f-0aeb-3dfa-dedb-d32f87de5ae9@baylibre.com>
Date: Mon, 26 Apr 2021 20:02:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210409110243.41-1-linqiheng@huawei.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_190425_682639_F4194644 
X-CRM114-Status: GOOD (  17.62  )
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

On 09/04/2021 13:02, Qiheng Lin wrote:
> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Qiheng Lin <linqiheng@huawei.com>
> ---
>  drivers/soc/amlogic/meson-clk-measure.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
> index e1957476a006..6dd190270123 100644
> --- a/drivers/soc/amlogic/meson-clk-measure.c
> +++ b/drivers/soc/amlogic/meson-clk-measure.c
> @@ -626,10 +626,8 @@ static int meson_msr_probe(struct platform_device *pdev)
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	base = devm_ioremap_resource(&pdev->dev, res);
> -	if (IS_ERR(base)) {
> -		dev_err(&pdev->dev, "io resource mapping failed\n");
> +	if (IS_ERR(base))
>  		return PTR_ERR(base);
> -	}
>  
>  	priv->regmap = devm_regmap_init_mmio(&pdev->dev, base,
>  					     &meson_clk_msr_regmap_config);
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
