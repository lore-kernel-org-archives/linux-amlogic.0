Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A30EC6FD20
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Mar 2023 14:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lxqakmPvk6k1dsAACbuyNl494Z1Pu1gOuBCLLOk3qzc=; b=LZnMb7LENjFGkhF2cPrhuy+h3Y
	jtVkflTKLCf9v7ww+LZAUxi/o0QuL/Zt8VKK0tyddPP5RZT0WvnXc+ciCexBLIj+hXhT6qi7w/JBv
	4brbgd4lZOYyF9YsyMHfGWYRDbOK96bBpVOgix81rMJWMYuhQeAbsnM51Wa9Mn9hZe2GbxmnUFxY/
	W8NFhgUd4rJ6Y0sUqCTHgAgYyCsqmuED71IFROskI3tW8dAEhMDYZxIQHBjWUkG6H5ToINlAgTQcy
	Q+AiZynzVKMlj1m4B8jt9OXDv+5VPDMxzpqko/FtiAb8/I6xj7GjR9vPvqA5Rb/ScNQSUBEIIvAFX
	qiEGXa1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfi3N-004aPF-2R;
	Fri, 24 Mar 2023 14:06:01 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfi3K-004aO8-39
	for linux-amlogic@lists.infradead.org;
	Fri, 24 Mar 2023 14:06:00 +0000
Received: by mail-wm1-x333.google.com with SMTP id o24-20020a05600c511800b003ef59905f26so1052650wms.2
        for <linux-amlogic@lists.infradead.org>; Fri, 24 Mar 2023 07:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679666755;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WG6gphWl27lAGqIb66Yn+gMHDN2FKDd0CjkaAmh1aqs=;
        b=hx9HF8DLfkyh4bxrj1FkrTEKV2pEkXm+b+DeeofWFl8I9fo5obHKFa5TXVoKr8v22O
         uBz4NaeiaOu/3+CruH2yfScKi8TZV5HEezj4T2Y0zyVH3Lq5I/Cf0T8YMcmEVbrk5rYr
         kvJDgFJ59O7Fh0dWR/Ac38WfqYsSrZ5lJ3pEy/gWaP5ukPJPFGX+OngIdtOcKa53GJa3
         sPVP8Enc0e7eqvC5asKWtqxIGBcX/v0Zpkfize9JzmAKkZBUSsurHejXZQcmVHfDEHu9
         FtvnHisaIIKk+7kt1jOF5DpPs9WDmUqfMH0q9saOqr766l/7gu82aQqJ2f1P4H4YJqNP
         Jacw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679666755;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WG6gphWl27lAGqIb66Yn+gMHDN2FKDd0CjkaAmh1aqs=;
        b=jxbcdyYy8fTBsAUNiop8BrEa84VhRLULzj+jumojhOJQpokYLVPy5bxLCGPI4xWsk3
         ba8eogaqy+eFS8WkxubnQAHY02SGYcAKQ3OjcG3NZ/m1UhzMlzI6eqdzr3ANA1DIgyJm
         H073YZIs4L3/ZVcDRG2+hfQaiJblIT5xFj8x7Js9peuE2IRkyoK26fih7zxTvE4InuVX
         cUZf6fwGg3sRg37oM/Hgo0o1Vn8bR4eDoTGErgAi9E2sbaivxtRSiJiP3hhBLns1YcFH
         vWaITGhEhpcwCKmelKflG1GhzdRtqBmshp/4d2xDJ+Jn25xzBM8dme8moFdkKGFbV1wF
         L6yw==
X-Gm-Message-State: AO0yUKVvDeP1ul5XHtfI7Ae4SBZw2unHXvRJ76+qOTO32aZcefNziiY7
	jUlE/qpYo1h3U4OSY4L3uUuV/w==
X-Google-Smtp-Source: AK7set/uKpNVbtBBd4lUVSBuF+3iaCY52KMHAaXgmlQVPGEuXOp9zixUhtUEm4rvwQ9j3FbsKvcREg==
X-Received: by 2002:a05:600c:209:b0:3ee:282d:1016 with SMTP id 9-20020a05600c020900b003ee282d1016mr2422277wmi.25.1679666755220;
        Fri, 24 Mar 2023 07:05:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:213f:a579:70af:e4a0? ([2a01:e0a:982:cbb0:213f:a579:70af:e4a0])
        by smtp.gmail.com with ESMTPSA id h20-20020a05600c351400b003eddf20ed5bsm5195872wmq.18.2023.03.24.07.05.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Mar 2023 07:05:54 -0700 (PDT)
Message-ID: <f1088121-02c7-86da-d603-7c2015030b0e@linaro.org>
Date: Fri, 24 Mar 2023 15:05:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2] firmware: meson_sm: populate platform devices from sm
 device tree data
Content-Language: en-US
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>,
 krzysztof.kozlowski@linaro.org, robh@kernel.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 jianxin.pan@amlogic.com
Cc: kernel@sberdevices.ru, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, rockosov@gmail.com
References: <20230324140141.6743-1-ddrokosov@sberdevices.ru>
Organization: Linaro Developer Services
In-Reply-To: <20230324140141.6743-1-ddrokosov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_070559_012642_BA390175 
X-CRM114-Status: GOOD (  16.29  )
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

On 24/03/2023 15:01, Dmitry Rokosov wrote:
> In some meson boards, secure monitor device has children, for example,
> power secure controller. By default, secure monitor isn't the bus in terms
> of device tree subsystem, so the of_platform initialization code doesn't
> populate its device tree data. As a result, secure monitor's children
> aren't probed at all.
> 
> Run the 'of_platform_populate()' routine manually to resolve such issues.
> 
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> ---
>   drivers/firmware/meson/meson_sm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
> index 77aa5c6398aa..b79d0e316cb1 100644
> --- a/drivers/firmware/meson/meson_sm.c
> +++ b/drivers/firmware/meson/meson_sm.c
> @@ -316,7 +316,7 @@ static int __init meson_sm_probe(struct platform_device *pdev)
>   	if (sysfs_create_group(&pdev->dev.kobj, &meson_sm_sysfs_attr_group))
>   		goto out_in_base;
>   
> -	return 0;
> +	return devm_of_platform_populate(dev);

You should check return and jump to out_in_base on error instead.

Neil

>   
>   out_in_base:
>   	iounmap(fw->sm_shmem_in_base);


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
