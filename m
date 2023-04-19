Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F26C77B73
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Apr 2023 07:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TKAWJhO4PU6uWNs5E0gRTiJ/+DfhBru/DRYxpV7gc8k=; b=xLzAao6+lP4Nko
	KMXf0wypybiFt6R7/xgkx/SLNj7T1qKQWklu1jnPYllF5jOt4tyMcVUdQYUPaxZTxJ4ScHFGu2dmE
	XBsJidFUT3hTWUIxRO3yk+l6HqPlEjuroELe6/iLT1QruJiligns3zgOnL0x22DRIFTvQOj2T6jk2
	Zs8ZLbi+xbGmyNSxddDZrGHJ+ntXzZ+U7PEOI4KoB3faGb+uXvBo9w6u9SJgE4dBemDZpJg5XBQEg
	CLlCg6HonY8HhBVYIDOFVIcPhFcnj90328ZWCTj0q0/bKqDYrR7mhUv040XYtsiF0jBhKeZmGVBtp
	uuNzs8thUFJJvkKVBzVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp2Vk-004Se3-2W;
	Wed, 19 Apr 2023 07:45:52 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp2Vj-004Sd3-0D
	for linux-amlogic@lists.infradead.org;
	Wed, 19 Apr 2023 07:45:52 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-94f7a0818aeso176428166b.2
        for <linux-amlogic@lists.infradead.org>; Wed, 19 Apr 2023 00:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681890346; x=1684482346;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iHFSVmnBHgJzRBucjthBtFRkyCVVu3jxJ7HbaOvsy4E=;
        b=T8rcoi4uc5QP0oaPpPEX3GPlycGGm+btMZffpkKlPXBIHslJgpMyKfjAgSgSkrQuQ9
         i67efb6rK4OtRuL+V7o86Z6wxS2+O1j3qbD+Z4tlBs0vTspsFBN6S5bk3Hk1v0xTWhJw
         p9IoklDJi2wfrflu6v5DMG1Y+oXe990hwU8c5bb6BbVwje7GHM8XaZBLXIJfpTuGMg59
         leb3ztmVa8ZKgT4LKzY9eleB6QnxPYnJ5SeYwT+8s/QJbrS3LRxwLapqOGrmCo6LZwG6
         QNd6ws5PchcUxbifs7rFihHW8bkviUTu4AMJNYEMtWt8n5JEQim7nQq1GwG4h/hYwfun
         zKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681890346; x=1684482346;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iHFSVmnBHgJzRBucjthBtFRkyCVVu3jxJ7HbaOvsy4E=;
        b=kEi4ViqmGmbfhN+fBOq6EPyreEybzT/2hJ5UryrcNTKu6V8ce3pw9CXnt0wxUkq8cC
         kHKK3YKeaq8JTipJ5cHug7rqGuJ8+DEXTvlM27pTsKtkjmnFEys/HDd284leL4SZWyE4
         EB5xOoDuC8mgOPkV9nviNytrqeBlMbYysDGdmj1h1sdMZBtrYHUu6qtlgFUZKQZYLNel
         SxICWgz76aM9sFbZFFAg8AIqDuzMYq25s9ul6nBpKzlPJ7zM6IJyXSe/ea++nfAEJT7x
         D9NN9RFmbR18m0QtP51sFDfvPGbENOklhd6zoff9dy7WZwKhZsKlVylEMO+d/7zzU5W0
         1dKg==
X-Gm-Message-State: AAQBX9cmvUxXZ9cdob8XcCPlqVFTJ3aDG79JNGeD9fcXvS73Q525nFBb
	GOJtUA3t3zqAhXZLmewXLk1kVA==
X-Google-Smtp-Source: AKy350bVuPcsEqrtDM1HSpKOyU4PTGA+UlfcRFz4jC16pTIUyqVFZK3mTqMzBmOidShsowjMkarm/g==
X-Received: by 2002:a50:ff07:0:b0:506:beb5:7b4e with SMTP id a7-20020a50ff07000000b00506beb57b4emr3532896edu.8.1681890345754;
        Wed, 19 Apr 2023 00:45:45 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:62f5:eb43:f726:5fee? ([2a02:810d:15c0:828:62f5:eb43:f726:5fee])
        by smtp.gmail.com with ESMTPSA id l9-20020a056402124900b0050488d1d376sm7937321edw.0.2023.04.19.00.45.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 00:45:45 -0700 (PDT)
Message-ID: <9557633d-efe0-4292-391c-9ae23c53c2dc@linaro.org>
Date: Wed, 19 Apr 2023 09:45:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH 1/2] arm64: amlogic: add new ARCH_AMLIPC for IPC SoC
Content-Language: en-US
To: =Xianwei Zhao <xianwei.zhao@amlogic.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230419073834.972273-1-xianwei.zhao@amlogic.com>
 <20230419073834.972273-2-xianwei.zhao@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230419073834.972273-2-xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_004551_104642_382D1CB6 
X-CRM114-Status: GOOD (  16.28  )
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

On 19/04/2023 09:38, =Xianwei Zhao wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> The C series SoCs are designed for smart IP camera
> applications, which does not belong to Meson series.
> So, Add ARCH_AMLIPC for the new series.
> 
> There are now multiple amlogic SoC seies supported, so group them under
> their own menu. we can easily add new platforms there in the future.
> Introduce ARCH_AMLOGIC to cover all Amlogic SoC series.
> 
> No functional changes introduced.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  arch/arm64/Kconfig.platforms | 12 ++++++++++++
>  arch/arm64/configs/defconfig |  2 ++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 89a0b13b058d..bfbc817eef8f 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -162,12 +162,24 @@ config ARCH_MEDIATEK
>  	  This enables support for MediaTek MT27xx, MT65xx, MT76xx
>  	  & MT81xx ARMv8 SoCs
>  
> +menuconfig ARCH_AMLOGIC
> +	bool "NXP SoC support"

NXP? There is already amlogic anyway.


Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
