Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8079C7EE37
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Jun 2023 07:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vHuP07PHC44jPwV1c4gj+yLVi+AtCXKM47vtfgZxExk=; b=XV9SRBqpMXBbVwj5uBmGqQBNkc
	xH2DccOySwfLPKOVVe637IToIwHKuEFKlpsfdZ80+Rmu5z4A4KkTJrMXgjQGA9TNt2FtwiqmLsGOE
	iX7CZ8QUyVA/YFt4+CijZ/XcUJdqvFzEuQQu/zprKaxS4xSSYKunxvASf2I4RC0ZaR0ZUz5GNEXx7
	HhJDExtK4fSqFCmo4wUUaE4DhwxXRUP1tfaookeu8tF0TdX529s+hFrxhrn1OaFfDUB2H8Ag6d8rg
	t6roRaiERhPDcU2aQnlU+GUnYIpVT7acQ0gJZ3GmWKK6WhttxEJsLtTCfXfPnJBOlpfNuoFCFjhLx
	SSdJertQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7WQg-00C1Np-2U;
	Fri, 09 Jun 2023 07:21:02 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7WQd-00C1MG-1e
	for linux-amlogic@lists.infradead.org;
	Fri, 09 Jun 2023 07:21:01 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-30e4eec95c8so1378012f8f.3
        for <linux-amlogic@lists.infradead.org>; Fri, 09 Jun 2023 00:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686295255; x=1688887255;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qbECCQojym0tki1fcePemFQzOMvKm7eIXy1UhdmS0Os=;
        b=Gq13LllHeyFxZyDi5RA7RqNbZzv4vO7xJUkHSwJazafpjxcY1xBqRcAi7a3bXIrDDy
         ql5iibzEcb1G/pULT95qZFLLn6YU95/u6pqIyeoCDtmIrXc2V75btPpSVVmfcn36+EP3
         U+rvCx/zT2Ww0Jo8sdJppPsU1DnIRANgA+XyjFvfRmkA72SAmHyyoyhzSAqDXT483T/9
         r7Hlpnr6k/pBISeuNsK3OaQY2dKy9TvWSky42iWMYk6ds43CbNprKMX/RmYVDuP4VFr4
         cave3t9HzMIN6YC6sfDPAhUQTWCz2UUrVKjXIMf1vKJNFg03wsH65mcjyeB2uz04BQPX
         zk0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686295255; x=1688887255;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qbECCQojym0tki1fcePemFQzOMvKm7eIXy1UhdmS0Os=;
        b=CfBP8Kys7VETHgL3V8qwRhVJw7Ewf1ja1d9EX5QSeCKhsFnHGi04fRPER+ah/f4k7X
         kdzxMBtFLlN2SE4awyNxIiOKItuPoXEzRN+dSsGGun/kN6jpkDpLesJ8n+ru5oqnA9fH
         KZ9DTujE65tkIePWPLNWzRPDeO7jXqQi8EOT0ugpzgXb4og7xopZy4nwwQNIkHAKcFT8
         gvef54ArK9FGjNyo9m7RBKGdikhCkBMtm4UsGSxCUqUAz01ItrA3CtYEtqgfJDijA0WC
         aEA2nPBe6Ka8u2+ypH4NOHtITarAXEt7SDALMle8bUk5LhSFHSJiK4jPc76sc+41xpoZ
         y4AA==
X-Gm-Message-State: AC+VfDzHNL5J8r/rIXCfRy19btvvynKABiuENpwgMxMjrMtsOistjdqe
	VZ01ogdozIcd6OHnzKKSFO5www==
X-Google-Smtp-Source: ACHHUZ595w+56xOgrh/zB+ULRVC2q70uomUS/Elf7KYJVvyLy9TBLa3xWhmNv03xAjXVV/KvFGCIfA==
X-Received: by 2002:a05:6000:4cf:b0:30e:56d9:d7ad with SMTP id h15-20020a05600004cf00b0030e56d9d7admr363920wri.71.1686295255619;
        Fri, 09 Jun 2023 00:20:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5c40:3a0f:b23:350f? ([2a01:e0a:982:cbb0:5c40:3a0f:b23:350f])
        by smtp.gmail.com with ESMTPSA id q7-20020adff947000000b0030af72bca98sm3583142wrr.103.2023.06.09.00.20.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 00:20:55 -0700 (PDT)
Message-ID: <c0d6c95a-e96c-a258-666d-f81a05a86db8@linaro.org>
Date: Fri, 9 Jun 2023 09:20:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 02/12] mmc: meson-gx: fix deferred probing
Content-Language: en-US
To: Sergey Shtylyov <s.shtylyov@omp.ru>, Ulf Hansson
 <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20230608194519.10665-1-s.shtylyov@omp.ru>
 <20230608194519.10665-3-s.shtylyov@omp.ru>
Organization: Linaro Developer Services
In-Reply-To: <20230608194519.10665-3-s.shtylyov@omp.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_002059_609400_3686BB0A 
X-CRM114-Status: GOOD (  18.30  )
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

On 08/06/2023 21:45, Sergey Shtylyov wrote:
> The driver overrides the error codes and IRQ0 returned by platform_get_irq()
> to -EINVAL, so if it returns -EPROBE_DEFER, the driver will fail the probe
> permanently instead of the deferred probing. Switch to propagating the error
> codes upstream.  IRQ0 is no longer returned by platform_get_irq(), so we now
> can safely ignore it...
> 
> Fixes: cbcaac6d7dd2 ("mmc: meson-gx-mmc: Fix platform_get_irq's error checking")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> ---
> Changes in version 2:
> - updated the fix due to the surrounding code change;
> - refreshed the patch;
> - removed stray newline in the Fixes: tag;
> - slightly reformatted the patch description.
> 
>   drivers/mmc/host/meson-gx-mmc.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index b8514d9d5e73..75f97dce7ef3 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -1192,8 +1192,8 @@ static int meson_mmc_probe(struct platform_device *pdev)
>   		return PTR_ERR(host->regs);
>   
>   	host->irq = platform_get_irq(pdev, 0);
> -	if (host->irq <= 0)
> -		return -EINVAL;
> +	if (host->irq < 0)
> +		return host->irq;
>   
>   	cd_irq = platform_get_irq_optional(pdev, 1);
>   	mmc_gpio_set_cd_irq(mmc, cd_irq);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
