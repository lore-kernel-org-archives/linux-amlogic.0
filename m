Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568A8C48BC3
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Feb 2024 10:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T40LNigLfk0Orl7sfbbCkf9PoCy9jaD42eF2xQNm2Ls=; b=QikcLFEsOL9FDweNMxG60JcOUp
	FIN1mFp7ENNq9alTx2KHCXeBtIfNslaXgOPL8cu0dWPtV66+NgPD52csvtcKvpAjmCCnb/7h6B6/o
	NrxkGe5Fc7aTVBhDMPs0V9f4aw5KMxU4kfsMVo2Zrs9p6beLSIiac22//JrX6nNi9R81SSDz2zGFr
	P8HirMhQAdG9rQkTwHidx5Ix+CgwZBOk853Up3FR1Ig9LS79VTtB4grKW1DZ4TrtK8E4ufFacREPS
	UMdThrVwnpydIUSex0EUz+/eJOheLtDq6TdTqadjwG6JP7fdJmPVcf8OOy6Z69mLxEvls8NNV95l5
	3n5nXxqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcjQ4-00000000PgA-2hZ7;
	Wed, 21 Feb 2024 10:01:40 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcjQ1-00000000Pdy-0sng
	for linux-amlogic@lists.infradead.org;
	Wed, 21 Feb 2024 10:01:38 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-33adec41b55so3268237f8f.0
        for <linux-amlogic@lists.infradead.org>; Wed, 21 Feb 2024 02:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708509695; x=1709114495; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fL0mcOobTcwYxXx8b2m98+IfvOzworeTZ6aXI6tNbos=;
        b=kYjrLPP8WBW7tF6aFZLSHanPVWjoPhyBKL7uSoCkat5UtAMyoIzzId0i5Op6xdqNhB
         1PrjF0BPc7hOHDxBIkc3+uAhx+JxikjRjfKkd2lDxKtTI1TrzyxQB/Jw1EQ396Bx/DfE
         TYpsaQo80hBVWvNeZmEcn5x3Wbej+AIXBpK42fE8nEA3Uks52wPM/WHun3Mbdi3vgRZq
         hUW8jii6uG0RCAIf300Qsx7K0BR69m1QOECkM9PnqBj2PAO0imvfRt60joBD9DZRCjOX
         bff0ENKTiGWIH3WQ31cueQowYzgcGhXGjrOOR4fwBTeVUr4AkSn4yfdR+R5TeBrCbMGS
         AVHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708509695; x=1709114495;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fL0mcOobTcwYxXx8b2m98+IfvOzworeTZ6aXI6tNbos=;
        b=HrU+A82j+YA+YIb19uYcJGVtwYVlP4/+x9zfjpqx9bC02vJemIOOfATKvCZotOot8S
         uNaxhpqIcOQQc0ZlHshyp87igmNAfVa9UUyCNdEGRIMqWjzuVORbIB/TsQ4t/vjNLYkV
         t0EiHxZWh6eaZC+62jn26AltfaO/y6l/0P8WK28Rfw0U675BXPVHdbWBGVK9w+YgscXd
         h795FTKTF6m6HnXPe28WNWs4r0Uo1yKm5dfvvbKevrjK/Cp6Qq2GhnHdo7E29AOfVD7p
         ew0WGdNhvloX36L5vkVlJcgyOQ1q9rdbip4r6ashZZALv7M4jNrXudlTNxEoUi/w7oE9
         x4jw==
X-Forwarded-Encrypted: i=1; AJvYcCV/KMVNW3Y4rQuUxzrt5Vm8G/N1CyKojTJBgBAvDds/bAdjdEh1LaMzSd/+x/hRarMC/pGDX9KYT69OZd1Y3O7WAG76i3J2sBrXkqr5FehQJwM=
X-Gm-Message-State: AOJu0YwR3jVKT20myN41jWuFel4tbwuq1NKL5etOuGYKtxHhELdOJWwW
	xsSDRst3pY4g5ErOlUnE61Eyeiny0ztezGqUoZLB19XZXHtB/8XCIJPAzHqq7FE=
X-Google-Smtp-Source: AGHT+IED/rCd+DPuRUaQSmLl0+vSXBMeqV159iQZjp6y9EdpFxVOjdsE2nlCGIofjRmaE51g1JXBgQ==
X-Received: by 2002:a5d:6784:0:b0:33d:3a02:8368 with SMTP id v4-20020a5d6784000000b0033d3a028368mr7178028wru.8.1708509694859;
        Wed, 21 Feb 2024 02:01:34 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:83fc:439c:6f36:ce5c? ([2a01:e0a:982:cbb0:83fc:439c:6f36:ce5c])
        by smtp.gmail.com with ESMTPSA id x11-20020a5d444b000000b0033b7ce8b496sm16405396wrr.108.2024.02.21.02.01.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 02:01:34 -0800 (PST)
Message-ID: <e3e47a72-8a6c-475b-a248-95da5dae24ff@linaro.org>
Date: Wed, 21 Feb 2024 11:01:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 4/4] arm64: dts: amlogic: add fbx8am DT overlays
Content-Language: en-US, fr
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Marc Gonzalez <mgonzalez@freebox.fr>, DT <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Pierre-Hugues Husson <phhusson@freebox.fr>,
 AML <linux-amlogic@lists.infradead.org>
References: <07f7a695-18a0-4211-82e9-b1e2c7166969@freebox.fr>
 <79ba726d-d02c-44b9-b6f6-59b17ba9755c@freebox.fr>
 <54b4e810-754e-481a-bbc8-984f859b116d@linaro.org>
 <15fcafb2-4b4a-40a1-8ef5-ee3aef9b3b9d@freebox.fr>
 <95cafd69-de6d-497f-b3d6-b6d7a8a3b795@linaro.org>
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <95cafd69-de6d-497f-b3d6-b6d7a8a3b795@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_020137_382058_8D919820 
X-CRM114-Status: GOOD (  19.02  )
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

Marc,

On 20/02/2024 11:01, Krzysztof Kozlowski wrote:
> On 19/02/2024 11:32, Marc Gonzalez wrote:
>> On 14/02/2024 10:47, Neil Armstrong wrote:
>>
>>> On 13/02/2024 18:14, Marc Gonzalez wrote:
>>>
>>>> Add support for two variants of the fbx8am board.
>>>>
>>>> Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
>>>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>>>> ---
>>>>    arch/arm64/boot/dts/amlogic/Makefile                       |  6 ++++++
>>>>    arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtso    | 35 ++++++++++++++++++++++++++++++++++
>>>>    arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtso | 25 ++++++++++++++++++++++++
>>>>    3 files changed, 66 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
>>>> index cc8b34bd583d8..1ab160bf928ae 100644
>>>> --- a/arch/arm64/boot/dts/amlogic/Makefile
>>>> +++ b/arch/arm64/boot/dts/amlogic/Makefile
>>>> @@ -8,6 +8,8 @@ dtb-$(CONFIG_ARCH_MESON) += meson-axg-jethome-jethub-j100.dtb
>>>>    dtb-$(CONFIG_ARCH_MESON) += meson-axg-jethome-jethub-j110-rev-2.dtb
>>>>    dtb-$(CONFIG_ARCH_MESON) += meson-axg-jethome-jethub-j110-rev-3.dtb
>>>>    dtb-$(CONFIG_ARCH_MESON) += meson-axg-s400.dtb
>>>> +dtb-$(CONFIG_ARCH_MESON) += meson-g12a-fbx8am-brcm.dtb
>>>> +dtb-$(CONFIG_ARCH_MESON) += meson-g12a-fbx8am-realtek.dtb
>>>>    dtb-$(CONFIG_ARCH_MESON) += meson-g12a-radxa-zero.dtb
>>>>    dtb-$(CONFIG_ARCH_MESON) += meson-g12a-sei510.dtb
>>>>    dtb-$(CONFIG_ARCH_MESON) += meson-g12a-u200.dtb
>>>> @@ -80,3 +82,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-sm1-odroid-hc4.dtb
>>>>    dtb-$(CONFIG_ARCH_MESON) += meson-sm1-sei610.dtb
>>>>    dtb-$(CONFIG_ARCH_MESON) += meson-sm1-x96-air-gbit.dtb
>>>>    dtb-$(CONFIG_ARCH_MESON) += meson-sm1-x96-air.dtb
>>>> +
>>>> +# Overlays
>>>> +meson-g12a-fbx8am-brcm-dtbs	:= meson-g12a-fbx8am.dtb meson-g12a-fbx8am-brcm.dtbo
>>>> +meson-g12a-fbx8am-realtek-dtbs	:= meson-g12a-fbx8am.dtb meson-g12a-fbx8am-realtek.dtbo
>>>> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtso b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtso
>>>> new file mode 100644
>>>> index 0000000000000..ed79809b15859
>>>> --- /dev/null
>>>> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtso
>>>> @@ -0,0 +1,35 @@
>>>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>>>> +// Copyright (c) 2024 Freebox SAS
>>>> +
>>>> +/dts-v1/;
>>>> +/plugin/;
>>>> +
>>>> +#include <dt-bindings/gpio/gpio.h>
>>>> +#include <dt-bindings/gpio/meson-g12a-gpio.h>
>>>> +
>>>> +/ {
>>>> +	compatible = "freebox,fbx8am-brcm", "freebox,fbx8am", "amlogic,g12a";
>>>
>>> This looks fine but I'm unsure if those new compatible should be documented or not,
>>> since they are in an overlay
> 
> All compatibles in entire Linux source code shall be documented, so
> please document any new ones appearing in overlays.

You can either add a follow-up patch to:
- document those new compatibles
- remove those compatibles

As you want, I plan to send the ARM64 DT PR next week.

Neil


> 
>>
>> Rob, Krzysztof, Conor,
>>
>> Just want to make sure this was done "right".
>>
>> Is it acceptable for an overlay (DTSO) to define a more specific compatible prop?
> 
> I think it is fine and some DTSO already do it. User-space might want to
> identify that specific overlay is applied or not. Of course this will
> not work when multiple overlays are applied and each changes compatible,
> thus I would say this is in general specific to particular cases of
> exclusive overlays. In such case, why not making it new board DTS?
> 
> If this is not exclusive overlay, then new compatible looks wrong.
> 
> Best regards,
> Krzysztof
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
