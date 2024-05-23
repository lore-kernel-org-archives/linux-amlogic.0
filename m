Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A02C25B75
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 May 2024 07:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uqASVPNqUIWRjBjHSqw+NsV7Ir9qJTMcMJtMiU09HQY=; b=wjJ5vxlMte8tBuxurZC4Y+gnUq
	PTpNEpis3rDp4n1HCy22oIbjH+Z6OuyTX9vvarysTUbjpMzb/kZYzKR/jlXGx+mbe9ELrG5F7uELF
	P9xShEIvQLY7o2u876FCCXXac3g5XziPKFq7fsI4YPJdtxe80Y319PiOmDFP/Aej/EdFmEtfJgGd2
	2fEe9X8Ljd+aH+Ma0iWiAoCBostLGXUezv6CrOlsoiSrnV0m+61ZakMuPvQbbMsfjYvw3R1Zo6jRW
	WE8KLanb4T3nnQVy7wABPaaTZs98zRJ56XwqO9TY2vP4ZWYe//7bypeTxDncWg6g8bu5GxeieTRsa
	fruKVj0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA2m9-00000005JyP-35Fv;
	Thu, 23 May 2024 07:22:09 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA2m6-00000005JxN-23YQ
	for linux-amlogic@lists.infradead.org;
	Thu, 23 May 2024 07:22:08 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a599c55055dso1053668366b.0
        for <linux-amlogic@lists.infradead.org>; Thu, 23 May 2024 00:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716448923; x=1717053723; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B1eaJa9pGQU7S2YJvtO3vDk5kdB4Sw7kAba4zxjrsUs=;
        b=DgASqyMRiotZ6wo0CUOh5pAI+OrAqQXSnqRTfPf5UdLQe/v85At+a4F9uUX5PFMHHg
         DfGGPKT8OzsrZyBXbktPCNXXekiES/PjmAtQ8ZZzse/KZSe3A6lHoZsbH9gTvFeB6Exn
         J0PZd8fKuRi7e1csBPOHHcxuZyMVmc0gPNHd6YhlN0eMS2AG0gmEwTQ0EuZWVmreow3X
         Std+dE8NDlUvSY4QazXyzGNFPu3M2/cHzbpGBl98tI/G9KF3Y7gbRO62zNX55GxX7FWh
         Df5VTRvEO7KRdshpEAjFrulY1Lq6ceDDLl4WBilrV4j6ScObSEQpF7MJUKgZZ8SGLGiR
         D41Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716448923; x=1717053723;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B1eaJa9pGQU7S2YJvtO3vDk5kdB4Sw7kAba4zxjrsUs=;
        b=XTfzstAfjLzWieTljQHjCxWctBoDROalmiNGNPG2MQAgDyWblUFNqXSq03GH8cToSx
         3VPXRDyAeiYVcQENuJb2knP1xqmRaAGM4YP8+v9zqOuhEN5d0MDuP/UMytiuMUzBUwEX
         JvrUEoChLlnucpRbceo1+WYnL0gjFFrAFw7ftGPo6lE8Gf+5ue6TWL6a7XBq3uqBxwWg
         pOeac5dcG7eUvVnsxJ6OBOU0zF12Do0Pt5ESfoPN0o5G4X8kJJrLLzf4EFQDoKZBv0ZI
         CW0rpAVqR6/g45cxHJSJHFbQYEg0JnMqLE2F4Ss52JHdVN5Ee5GyIap5v/ns1ApALiJg
         iAmw==
X-Forwarded-Encrypted: i=1; AJvYcCVCFGCySryVy0d2/0BjI6nveD+Dh/USXc/dzTaJUnsHu6PSnaLU4FnNss1+LJMVvy36mVL902rKmkdQatgbka8bIvtqablxq0C4kHLbwsBtoTI=
X-Gm-Message-State: AOJu0Yz1jfj/0VXIxNmAvc+QUizw+iapjEVDe6BuCWlMMaxFBQW1Hf8A
	bgqPv2UJJfDWQOR3w6aHf50OS33y754fOMhxvF23qm6GQIZkVwh949mL5en5C2A=
X-Google-Smtp-Source: AGHT+IGHQ70hXNp/B9UnuQ8B827LgRin78upYW/dgAxokP5RsjGBSWMTlvzsJQDwo9+u9Uqen+AA/w==
X-Received: by 2002:a17:906:c799:b0:a59:d2ac:3858 with SMTP id a640c23a62f3a-a622806b89amr255766266b.11.1716448923186;
        Thu, 23 May 2024 00:22:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:825d:600a:c16:a973? ([2a01:e0a:982:cbb0:825d:600a:c16:a973])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1781cdb5sm1885070766b.29.2024.05.23.00.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 May 2024 00:22:02 -0700 (PDT)
Message-ID: <53c97dc2-8c2b-4765-ade7-6c9d0b2084ef@linaro.org>
Date: Thu, 23 May 2024 09:22:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/3] Introduce initial support of Amlogic AC200 board
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>,
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Lucas Tanure <tanure@linux.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org
References: <20240521222155.28094-1-jan.dakinevich@salutedevices.com>
 <171638551693.3169786.7201121718393921307.robh@kernel.org>
 <edc6241b-195f-4188-b802-24706ebc9541@salutedevices.com>
Content-Language: en-US, fr
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
Organization: Linaro
In-Reply-To: <edc6241b-195f-4188-b802-24706ebc9541@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_002206_548250_07AB95FF 
X-CRM114-Status: GOOD (  14.01  )
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

On 22/05/2024 19:40, Jan Dakinevich wrote:
> On 5/22/24 16:46, Rob Herring (Arm) wrote:
>>
>> On Wed, 22 May 2024 01:21:52 +0300, Jan Dakinevich wrote:
>>>   - Make some cosmetics in existing device tree files;
>>>
>>>   - Add the board.
>>>
>>> Jan Dakinevich (3):
>>>    arch/arm64: dts: ac2xx: make common the sound card
>>>    dt-bindings: arm: amlogic: document AC200 support
>>>    arch/arm64: dts: ac200: introduce initial support of the board
>>>
>>>   .../devicetree/bindings/arm/amlogic.yaml      |  1 +
>>>   .../dts/amlogic/meson-sm1-a95xf3-air-gbit.dts | 87 -------------------
>>>   .../boot/dts/amlogic/meson-sm1-a95xf3-air.dts | 87 -------------------
>>>   .../boot/dts/amlogic/meson-sm1-ac200.dts      | 22 +++++
>>>   .../boot/dts/amlogic/meson-sm1-ac2xx.dtsi     | 87 +++++++++++++++++++
>>>   .../boot/dts/amlogic/meson-sm1-h96-max.dts    | 87 -------------------
>>>   .../dts/amlogic/meson-sm1-x96-air-gbit.dts    | 87 -------------------
>>>   .../boot/dts/amlogic/meson-sm1-x96-air.dts    | 87 -------------------
>>>   8 files changed, 110 insertions(+), 435 deletions(-)
>>>   create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dts
>>>
>>> --
>>> 2.34.1
>>>
>>>
>>>
>>
>>
>> My bot found new DTB warnings on the .dts files added or changed in this
>> series.
>>
>> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
>> are fixed by another series. Ultimately, it is up to the platform
>> maintainer whether these warnings are acceptable or not. No need to reply
>> unless the platform maintainer has comments.
>>
>> If you already ran DT checks and didn't see these error(s), then
>> make sure dt-schema is up to date:
>>
>>    pip3 install dtschema --upgrade
>>
>>
>> New warnings running 'make CHECK_DTBS=y amlogic/meson-sm1-a95xf3-air-gbit.dtb amlogic/meson-sm1-a95xf3-air.dtb amlogic/meson-sm1-ac200.dtb amlogic/meson-sm1-h96-max.dtb amlogic/meson-sm1-x96-air-gbit.dtb amlogic/meson-sm1-x96-air.dtb' for 20240521222155.28094-1-jan.dakinevich@salutedevices.com:
>>
>> arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dtb: audio-controller@380: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
>> 	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: /soc/bus@ff600000/bus@60000/clock-controller@0: failed to match any schema with compatible: ['amlogic,sm1-audio-clkc']
>> arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: audio-controller@300: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
>> 	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: audio-controller@340: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
>> 	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: audio-controller@380: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
>> 	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: audio-controller@3c0: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
>> 	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: /soc/bus@ff600000/bus@60000/audio-controller@744: failed to match any schema with compatible: ['amlogic,sm1-tohdmitx', 'amlogic,g12a-tohdmitx']
>> arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: /soc/bus@ff600000/bus@60000/audio-controller@744: failed to match any schema with compatible: ['amlogic,sm1-tohdmitx', 'amlogic,g12a-tohdmitx']
>> arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: sys-ctrl@0: '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
>> 	from schema $id: http://devicetree.org/schemas/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: audio-controller-0: clock-names:0: 'sclk' was expected
>> 	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: audio-controller-0: clock-names:1: 'lrclk' was expected
>> 	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: audio-controller-0: clock-names:2: 'mclk' was expected
>> 	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: audio-controller-1: clock-names:0: 'sclk' was expected
>> 	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: audio-controller-1: clock-names:1: 'lrclk' was expected
>> 	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: audio-controller-1: clock-names:2: 'mclk' was expected
>> 	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: audio-controller-1: Unevaluated properties are not allowed ('clock-names' was unexpected)
>> 	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: audio-controller-2: clock-names:0: 'sclk' was expected
>> 	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: audio-controller-2: clock-names:1: 'lrclk' was expected
>> 	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: audio-controller-2: clock-names:2: 'mclk' was expected
>> 	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: sound: 'anyOf' conditional failed, one must be fixed:
>> 	'clocks' is a required property
>> 	'#clock-cells' is a required property
>> 	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
>>
>>
>>
>>
>>
> 
> These errors were here before my modifications, and they require extra
> efforts to rework generic 'meson-sm1.dtsi' etc. But it is not the goal
> of this series. Should I do anything about this right now?

No just make sure you don't introduce new errors.

Thanks,
Neil

> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
