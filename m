Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9130AC6FD1C
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Mar 2023 10:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=he2IkKl9IMELysoZQI1y6vDGp7kBLTLA10qB6AqK3z0=; b=RgkTeUSfQ9/ZPMIdpC4Q8MQW2I
	Hae1pwHjm7KFV90P5G1/o7nNGPQ7aaIhIVrOgnHnE1GMLV0E3J3Hb/AqFjhqUzkLmrR2pAVpuw82k
	xF8bJb2Am9izrpb+Ru6GkuP0fTYb10zr2JOJDOJZ8crxC6SbNhtyZeJGLeBdmFnibL+bBKXwZQjOi
	hXzDNXSHIDPVG8hHonRxG8tPeA3LO4nvYkXdcFNI8yWzw2ZPjLxPy2gZx4jqZckY7AhqxvvOTQb9X
	ge+R3TcdgUE+pw+bloPbPqj1f5LixtocBrsJgiu+xLXS2DtiC1oDHOxE4eGSai2cP+wSb+ZWClQzJ
	BrSq40ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pevjD-00FdwN-1g;
	Wed, 22 Mar 2023 10:29:59 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pevj9-00FdvZ-2V
	for linux-amlogic@lists.infradead.org;
	Wed, 22 Mar 2023 10:29:57 +0000
Received: by mail-wr1-x430.google.com with SMTP id d17so8019447wrb.11
        for <linux-amlogic@lists.infradead.org>; Wed, 22 Mar 2023 03:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679480994;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2CSmXLvmqA7bxkhpjhNVaNEFLz0F3Dx2g9G5u+pqBpg=;
        b=ZqiLsknkgIBNaxJkvEc5gQ5p3e6L7VkoIH3hOVUO4wpZpX7v1KlevxVGbF9dfOPumU
         GJJBZS5ltwSZpcKxRr7vXY4Gr/3wiOCkn0osCwQZHoWNaHvhFk554Py2UwiYswOQgQmP
         ylDnv1p1gzUiRtZbgyPJAJZiOoFd00Qh2z5tXOzapFJWphOTB7uD456aUKQZkO+s/yD7
         ESea801EmePRyqnMFb3Eni1REHSi0H1//7LJYSvFYFinSonaFHWscU04whOXdtbrmgdF
         YOR3hA1ZgKnvso9QcESwH56Q61KVFQlTDUI5izXAPalkSgt1NBRyp7QObcU4gaEu9JbG
         /RTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679480994;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2CSmXLvmqA7bxkhpjhNVaNEFLz0F3Dx2g9G5u+pqBpg=;
        b=39gCf80FdBScoxc02gQqEiy8/YoMe3JL/GsxvrYHtg6YpjU5A0+X7MQyRPG1IG8wI7
         6YegB5yQHizncyX7UN2nM+elzzaRv5F0eEYNXJFmEC5eDgW14/3j83Ylw262ht17O0hI
         LhaPyyZ5U/PtRMhksqfR0uzQIEWakc3A+43A222tMbuCxcXkCxXw7yWbgfKXqK9HQ2cD
         eBA9VMpjHDGeM25Ao77L3GvUs2TL8PZjPccP1qsVowgtlqd0hZey4vS6HXvVLVgytwre
         ADBDvKNwGLcf9Av3Hz/XJt6b8cozeye20z/Ah90xBWZxKDheFkKEel0o1Q6IijDJMOAd
         hIfw==
X-Gm-Message-State: AO0yUKWOiCZtmGomesT56CBDTW4PCfz31ay/AimiImMpGyFpgmn9Na2K
	4OfuBhBEDNyrlAz5ZXW/qP1UxnMllcYvQz2plK3/Ww==
X-Google-Smtp-Source: AK7set9+8osMG3uRRHQbdIbgNIu2F4He+sRHTNEKyF0j4GgomIyJJPIrOJ0Q6uQ4enlL/0jZjPoSiQ==
X-Received: by 2002:adf:f48e:0:b0:2ce:a7df:c115 with SMTP id l14-20020adff48e000000b002cea7dfc115mr5087430wro.41.1679480993756;
        Wed, 22 Mar 2023 03:29:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:3606:a601:f273:994a? ([2a01:e0a:982:cbb0:3606:a601:f273:994a])
        by smtp.gmail.com with ESMTPSA id z9-20020a05600c0a0900b003ede04deb14sm10600709wmp.48.2023.03.22.03.29.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 03:29:53 -0700 (PDT)
Message-ID: <c7e41662-ce98-62c1-18d7-22402faf8322@linaro.org>
Date: Wed, 22 Mar 2023 11:29:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 1/3] ARM: dts: meson8: add the xtal_32k_out pin
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230321171213.2808460-1-martin.blumenstingl@googlemail.com>
 <20230321171213.2808460-2-martin.blumenstingl@googlemail.com>
Organization: Linaro Developer Services
In-Reply-To: <20230321171213.2808460-2-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_032955_819898_994930FE 
X-CRM114-Status: GOOD (  14.20  )
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

On 21/03/2023 18:12, Martin Blumenstingl wrote:
> GPIOX_10 can generate a 32768Hz signal when enabling the "xtal_32k_out"
> group with the xtal function. This is typically used as LPO clock for
> the SDIO wifi chips.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   arch/arm/boot/dts/meson8.dtsi | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
> index 21eb59041a7d..4d18bb4e3c33 100644
> --- a/arch/arm/boot/dts/meson8.dtsi
> +++ b/arch/arm/boot/dts/meson8.dtsi
> @@ -568,6 +568,14 @@ mux {
>   				bias-disable;
>   			};
>   		};
> +
> +		xtal_32k_out_pins: xtal-32k-out {
> +			mux {
> +				groups = "xtal_32k_out";
> +				function = "xtal";
> +				bias-disable;
> +			};
> +		};
>   	};
>   };
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
