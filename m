Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7006C77B7A
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 May 2023 08:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZAjv6dtk9zTjHPeatjRc/Qy4QVk8zqkAhP9BSjemCfI=; b=eHf5j/gsqkYY95PzRDbFNf0Tx0
	k1oAUpCpiq5vzI78uaRXo6fffSMfTwDmCls1zN6zwE2ap7kF3QU2tW+dGPwznpjVgcJ6yfTdBeudt
	Wm4XxV+1Rj2tkaY40Ucm8AS+R9Zf4qmlJ5GcCnvtPRmA04HQntK/wDUXT6fVNSUM00lJYe6iMKWYa
	omEVBQGH7WZ922cD8DrM7HWHlFljOFzEJ4bFElvxqgDjwIlXx9XymstU7OC9WxTFPFc+RZZ/UKiAa
	/1wEi2AjUfVMUtt9vl/57OU2DIUbEowgfVUcMdoubDsDOxeWTThOtRvsjZJOBI1+CVm0LOQqU+Ef5
	Twd5x7Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pypxB-004pn6-1I;
	Tue, 16 May 2023 08:22:41 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pypx8-004pko-0X
	for linux-amlogic@lists.infradead.org;
	Tue, 16 May 2023 08:22:39 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f450815d02so46517265e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 16 May 2023 01:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684225355; x=1686817355;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tpLX8Svr1/hDnROP2r+zi8Bzotl7nD1x9jwIltUx3rY=;
        b=V4G/vHUswI8fobflebz4roVsEnsRIW3HmACHq8dZY3Gmmqczsk4xkVgUYCMX9WHi+l
         2L6pSWm6gzDFXupXRvv2/E9bpsWlRPSsBT0FKdE9/jMhPFrIrdWCxd05IgBs1OH1o0Qn
         vHKM7rqYypTrTt0cDnKleQED5uFTCKiOpQL5KWjayyxv+NvF9q4XNQ8igNrUcVaGsTYK
         dBvkSYAeq/8dn8ibWayt3XYtxCxo7JscCWbh6sgJdeFPCG+x1SAUGN434LTNdB/T7DVE
         TUk7OFTMjSUGHyElneiGUcZPvz8EM6pfzuVxcMC+AivQz73rBV50idCqvx+xjTNfP7I3
         ey9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684225355; x=1686817355;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tpLX8Svr1/hDnROP2r+zi8Bzotl7nD1x9jwIltUx3rY=;
        b=Xjb5mvTIlmpWWVRJwJRJbjQ0bPjwVEMa1VPPIIP9fOFg9/0Aw5PGYbKVWjedO0bp5I
         8qYCHSxkfJIdCCtgX5BDEbZsqxmI2LMzeJ+dA7TDO5hZ0SXCSc9Lq9fat8vD1V80vjq/
         YupqTu1nYJNfgdjZMunu/9Xam7v35t65mse/2D/jrkCQ/eIZ1FlSFE736laTyvyEsEqe
         1DP+UyB+122PyJKezq5gvzsDA5o7yJ4MaS12dzs4toRqU18ilehWB9WCQsTVs8Oyj8CL
         q7yETM/1ap9ba58oANPL4ZkYLeAw6EBjMkmRiXfNiEt2ZQ0FPfqbY50X8Mkbih7hM0+p
         5UmA==
X-Gm-Message-State: AC+VfDxkAebLUOT/cS+zMDWj/haIxmu3SgOycCe7JWJsgsvxslc41mUr
	O2Jk1FgORa7E3kG9l7XQqfwu1g==
X-Google-Smtp-Source: ACHHUZ6IEoiK7nz633paQUNUR+x3TKc/LG/U/kEjia8UrYTb0H6tD/jS4ljplGvyWEx2mfWC3K/MNQ==
X-Received: by 2002:a1c:f418:0:b0:3f1:6f52:74d with SMTP id z24-20020a1cf418000000b003f16f52074dmr24392159wma.39.1684225354916;
        Tue, 16 May 2023 01:22:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:86be:97a:a043:77a8? ([2a01:e0a:982:cbb0:86be:97a:a043:77a8])
        by smtp.gmail.com with ESMTPSA id q14-20020adfdfce000000b00304ae802f02sm1709723wrn.66.2023.05.16.01.22.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 01:22:34 -0700 (PDT)
Message-ID: <23cb7112-ce2e-cee6-2213-60fd599c998d@linaro.org>
Date: Tue, 16 May 2023 10:22:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1] meson saradc: fix clock divider mask length
Content-Language: en-US
To: George Stark <gnstark@sberdevices.ru>, jic23@kernel.org, lars@metafoo.de,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, andy.shevchenko@gmail.com,
 nuno.sa@analog.com
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@sberdevices.ru
References: <20230515210545.2100161-1-gnstark@sberdevices.ru>
Organization: Linaro Developer Services
In-Reply-To: <20230515210545.2100161-1-gnstark@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_012238_210131_BCF4A32F 
X-CRM114-Status: GOOD (  13.76  )
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

On 15/05/2023 23:05, George Stark wrote:
> From: George Stark <GNStark@sberdevices.ru>
> 
> According to datasheets of supported meson SOCs
> length of ADC_CLK_DIV field is 6 bits long
> 
> Fixes: 3adbf3427330 ("iio: adc: add a driver for the SAR ADC found in Amlogic Meson SoCs")
> Signed-off-by: George Stark <GNStark@sberdevices.ru>
> ---
>   drivers/iio/adc/meson_saradc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
> index 85b6826cc10c..b93ff42b8c19 100644
> --- a/drivers/iio/adc/meson_saradc.c
> +++ b/drivers/iio/adc/meson_saradc.c
> @@ -72,7 +72,7 @@
>   	#define MESON_SAR_ADC_REG3_PANEL_DETECT_COUNT_MASK	GENMASK(20, 18)
>   	#define MESON_SAR_ADC_REG3_PANEL_DETECT_FILTER_TB_MASK	GENMASK(17, 16)
>   	#define MESON_SAR_ADC_REG3_ADC_CLK_DIV_SHIFT		10
> -	#define MESON_SAR_ADC_REG3_ADC_CLK_DIV_WIDTH		5
> +	#define MESON_SAR_ADC_REG3_ADC_CLK_DIV_WIDTH		6
>   	#define MESON_SAR_ADC_REG3_BLOCK_DLY_SEL_MASK		GENMASK(9, 8)
>   	#define MESON_SAR_ADC_REG3_BLOCK_DLY_MASK		GENMASK(7, 0)
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
