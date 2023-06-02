Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 076D5C7EE29
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Jun 2023 20:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xRDK4AXIv3nK/nEKyKHbrby7/6rVVCZfLvkctx4Byps=; b=JPsmCRL2FQVfpy
	stgWX5fgGQ/SPJgvrftJACdwMitUobOo60Ofx4i7Aq0i68T9oo7K+oO0MWGPZ4IvgmF6wWR/wBbYM
	FLkxExlJKxuIIE+yUHpiFdrgAnkBjnt1vLI7Fe3vOBiT52EThzYfvGf33LUbrpt+8GCGL4YV07vUS
	y5zo+cbd24bop9VNfP1/Zy8mX1vAr0exs4L++P1pbtrWjqfx4Oj6JrRcHXQZ/JD8LzuNJ0a7KE8y9
	GluKQjwce9sYzT4ewGUEhQLawB11QchYaOKitKDVAkl56lm/5BpfeZnp+s5iZpXzmKZi72XzQL7+v
	sRVHclg0MgljSMhUKZwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5BlV-007sLl-2d;
	Fri, 02 Jun 2023 20:52:53 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5BlS-007sKg-36;
	Fri, 02 Jun 2023 20:52:52 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b1b1635661so12531371fa.0;
        Fri, 02 Jun 2023 13:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685739166; x=1688331166;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y7HA5PHTw9F2n8V3VLqOSLter+XfMCtTqmZlHwN6Bdg=;
        b=gj6sXhQvonQVSdIiSB1BGk/IiVLQXeTWM9CwNIhNChBvOUPISH6oe2FYdUdH1rtu4p
         eisBvFgaXNDsikXAef+m2M79c/JDeUd3X1BjhXjvaOcX+Cw5G1mShS8a/JVnTK+/iuNr
         s4mInvlhGV4fa1scX3oBJ6JbjkADzxdw8g3Bxcrd2AlH/YGRFWHNXEmf86a6toDfRAQD
         zn9/6yLyuoTA3ZrmovLT3dANQftYZxwBibb0/CiFMEYGATaLZTgS3ZHsexjHyEZB0W9j
         f77xDJ0QokPXIiysXTfGGxuIeo8X01ggBSTvcqmztL5DkgGcvNskXDiq7m8kSMRQCNln
         /+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685739166; x=1688331166;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7HA5PHTw9F2n8V3VLqOSLter+XfMCtTqmZlHwN6Bdg=;
        b=MIliAxO7ZxMCzSIDRXjMV6gOuH3FVwojH4MMFlN4G+DRW2E+Mx8YKDF2eBqMxkI2ax
         9TCO6IZuRqxTLxb1F03zzrcvQZbP2na/oDptCLjOrGsc1880jmRJDTQQKlDBbjQkXXjO
         510WaQn47YrUGdyXtZvLNIn/ttabOnM4mfTo86F4ygqV/FxYEITi/piO9+Ft9ebGIk45
         7Ne+syOr8RA9wybxLDAoaXfhZ/l9FjKACYH0z60dvZUclsW7eTctNgNwZNmrVMLUCX5V
         QomYzNw4UYmaNXERO8l9YnIHgNp+kBRJOCvrM5mv2FhAQ93whK8QCMAiEM3ScKdyuK0N
         qCNA==
X-Gm-Message-State: AC+VfDzuSj3f45e5DSArqgjrjoicXZR8PtLBJel5LBGAwfhollAZlsdD
	YkhNMgJBlB7x971rLd9RNMQ=
X-Google-Smtp-Source: ACHHUZ6jE2Tl+nrC/l+BVPHNQQ+KXhOBAzQWqPmUuv4iEGF6bf9bbtEa/5m9+UDFagoHm4icoJnWCw==
X-Received: by 2002:a2e:934f:0:b0:2a9:9e99:a508 with SMTP id m15-20020a2e934f000000b002a99e99a508mr651818ljh.53.1685739165706;
        Fri, 02 Jun 2023 13:52:45 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c15b:cc00:2863:962e:5942:4889? (dynamic-2a01-0c23-c15b-cc00-2863-962e-5942-4889.c23.pool.telefonica.de. [2a01:c23:c15b:cc00:2863:962e:5942:4889])
        by smtp.googlemail.com with ESMTPSA id u21-20020aa7d995000000b00514a3c04646sm1042851eds.73.2023.06.02.13.52.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jun 2023 13:52:45 -0700 (PDT)
Message-ID: <bf2d2814-5881-0f42-8b62-89c043b66e22@gmail.com>
Date: Fri, 2 Jun 2023 22:52:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
To: George Stark <gnstark@sberdevices.ru>, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, neil.armstrong@linaro.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 kernel@sberdevices.ru, Dmitry Rokosov <ddrokosov@sberdevices.ru>
References: <20230602103211.2199283-1-gnstark@sberdevices.ru>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH] pwm: meson: compute cnt register value in proper way
In-Reply-To: <20230602103211.2199283-1-gnstark@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_135251_019736_887A8AF5 
X-CRM114-Status: GOOD (  14.83  )
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

On 02.06.2023 12:32, George Stark wrote:
> According to the datasheet, the PWM high and low clock count values
> should be set to at least one. Therefore, setting the clock count
> register to 0 actually means 1 clock count.
> 
> Signed-off-by: George Stark <GNStark@sberdevices.ru>
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> ---
> This patch is based on currently unmerged patch by Heiner Kallweit
> https://lore.kernel.org/linux-amlogic/23fe625e-dc23-4db8-3dce-83167cd3b206@gmail.com
> ---
> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
> index 834acd7..57e7d9c 100644
> --- a/drivers/pwm/pwm-meson.c
> +++ b/drivers/pwm/pwm-meson.c
> @@ -206,6 +206,11 @@
>  		channel->pre_div = pre_div;
>  		channel->hi = duty_cnt;
>  		channel->lo = cnt - duty_cnt;
> +
> +		if (channel->hi)
> +			channel->hi--;
> +		if (channel->lo)
> +			channel->lo--;

I'm not sure whether we should do this. duty_cnt and cnt are results
of an integer division and therefore potentially rounded down.
The chip-internal increment may help to compensate such rounding
errors, so to say. With the proposed change we may end up with the
effective period being shorter than the requested one.
And IIRC this should not happen.

>  	}
>  
>  	return 0;
> @@ -340,7 +345,8 @@
>  	channel->lo = FIELD_GET(PWM_LOW_MASK, value);
>  	channel->hi = FIELD_GET(PWM_HIGH_MASK, value);
>  
> -	state->period = meson_pwm_cnt_to_ns(chip, pwm, channel->lo + channel->hi);
> +	state->period = meson_pwm_cnt_to_ns(chip, pwm,
> +					    channel->lo + 1 + channel->hi + 1);
>  	state->duty_cycle = meson_pwm_cnt_to_ns(chip, pwm, channel->hi);
>  
Doesn't channel->hi have to be incremented here too?

>  	return 0;


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
