Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC1EC6FD18
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Apr 2023 13:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jq5f4rrY07qx4OJBQmB7eSTv7tmy3Ro+WtvaOCsHrzY=; b=vOhV0U822I/Y099879SS27bd/W
	iaJxf4ng8Zh8G1sxoWuS9f6DzY80030J5LKIeew8j6znT4WIIs3nPjobpNOxg5VnoELWFlI+eXtBy
	W3yIhsmxs1O3IEdgjkc5/k+vbFM1PgyLgKSQfC6tr7yc7bCMujApOzu2MMHMqwUubJb3obrCqwkXu
	8dJgw46TgYEfh0gqwqTSfUFrdGyQaVOJPMBopppcW0c7O2F4/0gudEdEKDduQipMMpRwJGoj5nN7o
	blIpcDwUH4R5GOWTimONS19ptFqka2o2SsVclx9qCrbEnpSwsKN4H1V8hD0iCIB9TmCDPh7zKWNH3
	nz38vnaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp85m-005Y45-0I;
	Wed, 19 Apr 2023 13:43:26 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp85h-005Y2E-2A
	for linux-amlogic@lists.infradead.org;
	Wed, 19 Apr 2023 13:43:23 +0000
Received: by mail-wm1-x333.google.com with SMTP id he13so22142163wmb.2
        for <linux-amlogic@lists.infradead.org>; Wed, 19 Apr 2023 06:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681911794; x=1684503794;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HZA8xnxtLCau3xeUJDwqvV4qTTmMB91klxm30umz0uQ=;
        b=jJFoqGz86rmujeiO5U607w6Dnd7J3apqwykbvvt5bUCY4kIj8Cif0WANeAuVPGTEuS
         iHZ1aErIZdKRy5GmyLTblFUROizMYYFqlWXffD2cJ4QC7vUItyQOs7Hk/4ZE3i5POF+J
         5njpxQXk9ilntHb+pwHWX+kCqEIuATFOQ+0pIZ9McbSkyDDZp5mgiJ2RaGOYgU6b3Y85
         qAltwKEMXjzU9EIfegNRao6eTkOl/1cJpDHIikjk2whhPiEwe91wSFuGuSKeXtwneJkU
         ATvFEk/sATbg86Kw6v8vq+eTzH8flAlz+GVFG+/4iNyy5YNOg0ADFl+MtNUVojkrN/KC
         yptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681911794; x=1684503794;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HZA8xnxtLCau3xeUJDwqvV4qTTmMB91klxm30umz0uQ=;
        b=awN0R2eQAcuWdn80Pen7kvzQJFTxyMWtzjfor3WT79V6E36ZhRExXMJQjQXOKdNQwt
         kcLRzT+IUdNYdQ3CBYwF5EGdeRfgpPUFg7CsZP94cr3sMoRyUODJvK1zXeM0xAxMikAM
         UwOBDLaPr+lEtP14x14hwIfWtSFp3SbNXvCwCYEY4/VRpUN+OzSgN5uL8d2oJj3Q5N+J
         8vQ8eilNI4AJBW+bOBITDlVsEYB2rW+FVc2pbMXD7fD/ByRZ2cIZQor2a922dOIKBfiu
         H1rk6m6kjNb4RUEEIK4+OD/S9Ti6X8CUm1qSPqu392BN97yyXO0BbYunJh6JySEDitO9
         pxBg==
X-Gm-Message-State: AAQBX9eHWh5EBJnm5OPlklVT1C2tIvgu95Hp2wzuWMtBU7TMZCz+KFn/
	ljGz6sMTD87vc0TESRXgbc60dQ==
X-Google-Smtp-Source: AKy350aCnVr5xUdDLfvotskDQKq4zjir2EkydStBZxfN4WDOoGflyfK+hy5eON1v5GoQ798VpeVv9Q==
X-Received: by 2002:a05:600c:20e:b0:3f1:76d0:8bb0 with SMTP id 14-20020a05600c020e00b003f176d08bb0mr6744673wmi.36.1681911794106;
        Wed, 19 Apr 2023 06:43:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:1360:9fbb:dfd6:2db4? ([2a01:e0a:982:cbb0:1360:9fbb:dfd6:2db4])
        by smtp.gmail.com with ESMTPSA id q1-20020adfcd81000000b002ff77b033b1sm808990wrj.33.2023.04.19.06.43.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 06:43:13 -0700 (PDT)
Message-ID: <661cea17-a4dd-75d1-6a7e-16efa5aea52b@linaro.org>
Date: Wed, 19 Apr 2023 15:43:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [RFC PATCH 1/2] arm64: amlogic: add new ARCH_AMLIPC for IPC SoC
Content-Language: en-US
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>,
 =Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230419073834.972273-1-xianwei.zhao@amlogic.com>
 <20230419073834.972273-2-xianwei.zhao@amlogic.com>
 <20230419131416.cns3xvkbzjeyrnux@CAB-WSD-L081021>
Organization: Linaro Developer Services
In-Reply-To: <20230419131416.cns3xvkbzjeyrnux@CAB-WSD-L081021>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_064321_709327_7B152A68 
X-CRM114-Status: GOOD (  19.39  )
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

On 19/04/2023 15:14, Dmitry Rokosov wrote:
> On Wed, Apr 19, 2023 at 03:38:33PM +0800, =Xianwei Zhao wrote:
>> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>
>> The C series SoCs are designed for smart IP camera
>> applications, which does not belong to Meson series.
>> So, Add ARCH_AMLIPC for the new series.
>>
>> There are now multiple amlogic SoC seies supported, so group them under
>> their own menu. we can easily add new platforms there in the future.
>> Introduce ARCH_AMLOGIC to cover all Amlogic SoC series.
>>
>> No functional changes introduced.
>>
>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> ---
>>   arch/arm64/Kconfig.platforms | 12 ++++++++++++
>>   arch/arm64/configs/defconfig |  2 ++
>>   2 files changed, 14 insertions(+)
>>
>> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
>> index 89a0b13b058d..bfbc817eef8f 100644
>> --- a/arch/arm64/Kconfig.platforms
>> +++ b/arch/arm64/Kconfig.platforms
>> @@ -162,12 +162,24 @@ config ARCH_MEDIATEK
>>   	  This enables support for MediaTek MT27xx, MT65xx, MT76xx
>>   	  & MT81xx ARMv8 SoCs
>>   
>> +menuconfig ARCH_AMLOGIC
>> +	bool "NXP SoC support"
> 
> NXP? Did you mean "Amlogic"?
> 
>> +
>> +if ARCH_AMLOGIC
>> +
>>   config ARCH_MESON
>>   	bool "Amlogic Platforms"
>>   	help
>>   	  This enables support for the arm64 based Amlogic SoCs
>>   	  such as the s905, S905X/D, S912, A113X/D or S905X/D2
>>   
>> +config ARCH_AMLIPC
> 
> Do we really need a different ARCH for Amlogic IPC?
> I can imagine that it's not the Meson architecture at all.
> But maybe a better solution is just to rename ARCH_MESON to ARCH_AMLOGIC?

It should be changed treewide, and is it worth it ?

Neil

> 
>> +	bool "Amlogic IPC Platforms"
>> +	help
>> +	  This enables support for the arm64 based Amlogic IPC SoCs
>> +	  such as the C302X, C308L
>> +endif
>> +
>>   config ARCH_MVEBU
>>   	bool "Marvell EBU SoC Family"
>>   	select ARMADA_AP806_SYSCON
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index 7790ee42c68a..f231bd1723fd 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -46,7 +46,9 @@ CONFIG_ARCH_LG1K=y
>>   CONFIG_ARCH_HISI=y
>>   CONFIG_ARCH_KEEMBAY=y
>>   CONFIG_ARCH_MEDIATEK=y
>> +CONFIG_ARCH_AMLOGIC=y
>>   CONFIG_ARCH_MESON=y
>> +CONFIG_ARCH_AMLIPC=y
>>   CONFIG_ARCH_MVEBU=y
>>   CONFIG_ARCH_NXP=y
>>   CONFIG_ARCH_LAYERSCAPE=y
>> -- 
>> 2.37.1
>>
>>
>> _______________________________________________
>> linux-amlogic mailing list
>> linux-amlogic@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
