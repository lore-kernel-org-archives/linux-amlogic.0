Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC139C35FEB
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Sep 2024 07:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lCuqpDVwQ/OnbIc1WcToHXakSDxHmMus3BjaQXEfueA=; b=0NDlLXuiWyQce+NIWYM05AW8wS
	nAxHBjSvKLoQP1kl5/31J8KbC3KGlCOhlwA5ytB/cJRbrBcfWosrgS/2WFNJioFaepyNRrKDcPkU0
	pNeyLFOXqVAUhNL37k3JQdJhfpdoS5x94s4rBSptdTnEQkZMUxiShxSPx8Ii4YKFecg40PDmyaARW
	ll7MAwIJbwd6y4Z/4ArioCzpHNgw5X+jjwMgSzY+bmczJz5Dy+eXArCjklESWPWpXT3K8+qt9lWmm
	YA9pjg3PFrifqqsqL47ESi0BcP8MOujzrG0kuJBzzuu4vkho/XuaJLt7SbfNhx7yBxuy4cg+sfB7g
	PfJfI32g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqSQX-00000005ZFN-3RRC;
	Tue, 17 Sep 2024 07:15:09 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqSOm-00000005Yyp-3ilX
	for linux-amlogic@lists.infradead.org;
	Tue, 17 Sep 2024 07:13:22 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-374ba78f192so3970913f8f.3
        for <linux-amlogic@lists.infradead.org>; Tue, 17 Sep 2024 00:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726557199; x=1727161999; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C+HBEKsxJcqP81WkAW4sAI0iZg0KYU8heYcnB9a8jAU=;
        b=sCdUZ1emrTqQVH8SUnmTszXzNvVvtQzVV8DDOn/rgwffXO4Clgnvmtk/z9Fa+5gaZ2
         knVLSlsDH1OAw9DNse29PJ+vZhZY6/JGkkNRmUzkoosSOAL+bll2ThmJUv4Ho1ZsAdnd
         p7wtMI5cVNppaNmzDzmXfctvgWYQmNRjeOJatQKQCpWQ6vEU/HnOuEfiWuEwH61tSMI5
         O4fswh8puhcVrplUDQXL+8OVf/fXRxdUvaOlEltI2FoaAK/jhDHk5WXOjqXP8s6m0JmC
         3YqQIHb4XJMMclVR8+MgH88kAbjpZls1Ww45r/+MBFn4Em7LUJQgk8zqB1jV3OLHs+Xw
         A9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726557199; x=1727161999;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C+HBEKsxJcqP81WkAW4sAI0iZg0KYU8heYcnB9a8jAU=;
        b=iRnVsqrL6RAZiocSn+3MVDqXkqmDRA1sKQG8M+j6PhGTfox3guTYiPXKQSYSwlzt9x
         w5TeIGC2TZdDYxpKeQ45AxogvTJcIbqX3cz9YvCDJMp8Gk5GVFHH8YNrX4DaFxrjKgOp
         CTznW7X06qPFIsg+gz+dO2F+INMOiXne9GDbJVoBgRIMm80wFRYGcJu9eXf/jY9a1FeW
         bvN9v254Lw1DS0T0ikzz7jsxNPyejq6U4/WRGBwiMEyRecC1B6bYDROmagkmkGzG3W8v
         CMGEMZFByPZZc4rgp9aGRtE7coYSK0T5AQPWPngLE4bXwGHSEr5N/Rv0ndQPC+3wIPuN
         6wfA==
X-Forwarded-Encrypted: i=1; AJvYcCV/7AKU8Uhiw+8Af+/fjwgJZgKGo96mxmFpdyY3HVl23QZMXizqbn0xa2S8UMLyvYxZ5GTvn2Rkg3J8aIyU@lists.infradead.org
X-Gm-Message-State: AOJu0YzeBM4r8yBT4mkxpBmLZeIvz+7Cj/WotefXdRRK+KNAURwN2sQy
	C6WOx4RS2sgoksuy83HKi4s2/yUCvrn/NPq5njgdZ9jRrnjS3ddgsTyaQPyJWoM=
X-Google-Smtp-Source: AGHT+IFGpq/+J4ssPTXSy5MwONJpkzTKPo1IEOJH30s3xB5j9inEc2DszWR139tQAfWBSHi5+GrDYQ==
X-Received: by 2002:adf:efc9:0:b0:371:8a91:9e72 with SMTP id ffacd0b85a97d-378c2d119f7mr11727570f8f.30.1726557198613;
        Tue, 17 Sep 2024 00:13:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:e5df:ee06:f22e:a8cf? ([2a01:e0a:982:cbb0:e5df:ee06:f22e:a8cf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42d9b193f2dsm128955935e9.39.2024.09.17.00.13.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Sep 2024 00:13:17 -0700 (PDT)
Message-ID: <9394d785-5954-4d44-8ad0-9b57fbecde25@linaro.org>
Date: Tue, 17 Sep 2024 09:13:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] dt-bindings: mmc: convert amlogic,meson-mx-sdio.txt to
 dtschema
To: Rob Herring <robh@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v1-1-b7bfae886211@linaro.org>
 <20240916174030.GA835203-robh@kernel.org>
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
In-Reply-To: <20240916174030.GA835203-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_001320_980594_8FFD33AA 
X-CRM114-Status: GOOD (  28.94  )
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

Hi Rob,

On 16/09/2024 19:40, Rob Herring wrote:
> On Wed, Sep 11, 2024 at 05:20:47PM +0200, Neil Armstrong wrote:
>> Convert the Amlogic Meson6, Meson8 and Meson8b SDIO/MMC controller
>> bindings to dt-schema.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../bindings/mmc/amlogic,meson-mx-sdio.txt         |  54 -----------
>>   .../bindings/mmc/amlogic,meson-mx-sdio.yaml        | 101 +++++++++++++++++++++
>>   2 files changed, 101 insertions(+), 54 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.txt b/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.txt
>> deleted file mode 100644
>> index 8765c605e6bc..000000000000
>> --- a/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.txt
>> +++ /dev/null
>> @@ -1,54 +0,0 @@
>> -* Amlogic Meson6, Meson8 and Meson8b SDIO/MMC controller
>> -
>> -The highspeed MMC host controller on Amlogic SoCs provides an interface
>> -for MMC, SD, SDIO and SDHC types of memory cards.
>> -
>> -Supported maximum speeds are the ones of the eMMC standard 4.41 as well
>> -as the speed of SD standard 2.0.
>> -
>> -The hardware provides an internal "mux" which allows up to three slots
>> -to be controlled. Only one slot can be accessed at a time.
>> -
>> -Required properties:
>> - - compatible : must be one of
>> -	- "amlogic,meson8-sdio"
>> -	- "amlogic,meson8b-sdio"
>> -	along with the generic "amlogic,meson-mx-sdio"
>> - - reg : mmc controller base registers
>> - - interrupts : mmc controller interrupt
>> - - #address-cells : must be 1
>> - - size-cells : must be 0
>> - - clocks : phandle to clock providers
>> - - clock-names : must contain "core" and "clkin"
>> -
>> -Required child nodes:
>> -A node for each slot provided by the MMC controller is required.
>> -NOTE: due to a driver limitation currently only one slot (= child node)
>> -      is supported!
>> -
>> -Required properties on each child node (= slot):
>> - - compatible : must be "mmc-slot" (see mmc.txt within this directory)
>> - - reg : the slot (or "port") ID
>> -
>> -Optional properties on each child node (= slot):
>> - - bus-width : must be 1 or 4 (8-bit bus is not supported)
>> - - for cd and all other additional generic mmc parameters
>> -   please refer to mmc.txt within this directory
>> -
>> -Examples:
>> -	mmc@c1108c20 {
>> -		compatible = "amlogic,meson8-sdio", "amlogic,meson-mx-sdio";
>> -		reg = <0xc1108c20 0x20>;
>> -		interrupts = <0 28 1>;
>> -		#address-cells = <1>;
>> -		#size-cells = <0>;
>> -		clocks = <&clkc CLKID_SDIO>, <&clkc CLKID_CLK81>;
>> -		clock-names = "core", "clkin";
>> -
>> -		slot@1 {
>> -			compatible = "mmc-slot";
>> -			reg = <1>;
>> -
>> -			bus-width = <4>;
>> -		};
>> -	};
>> diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.yaml b/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.yaml
>> new file mode 100644
>> index 000000000000..4d1142d2ff02
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.yaml
>> @@ -0,0 +1,101 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mmc/amlogic,meson-mx-sdio.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Amlogic Meson6, Meson8 and Meson8b SDIO/MMC controller
>> +
>> +description:
>> +  The highspeed MMC host controller on Amlogic SoCs provides an interface
>> +  for MMC, SD, SDIO and SDHC types of memory cards.
>> +  Supported maximum speeds are the ones of the eMMC standard 4.41 as well
>> +  as the speed of SD standard 2.0.
>> +  The hardware provides an internal "mux" which allows up to three slots
>> +  to be controlled. Only one slot can be accessed at a time.
> 
> You need '|' or this is treated as 1 paragraph. If it is 1 paragraph,
> then format it that way.
> 
> But really if you want 3 paragraphs, then you should use '>' and put 2
> CR's between each paragraph.

Ack

> 
>> +
>> +maintainers:
>> +  - Neil Armstrong <neil.armstrong@linaro.org>
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - amlogic,meson8-sdio
>> +          - amlogic,meson8b-sdio
>> +      - const: amlogic,meson-mx-sdio
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 2
>> +
>> +  clock-names:
>> +    items:
>> +      - const: core
>> +      - const: clkin
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 0
>> +
>> +
>> +patternProperties:
>> +  "slot@[a-f0-9]+$":
> 
> Are you going to add 'slot' to nodename in mmc-controller.yaml?


Hmm, well slot should not be a valid nodename for a direct mmc-controller,
so how to solve that ?

> 
>> +    $ref: mmc-controller.yaml#
>> +    description:
>> +      A node for each slot provided by the MMC controller
> 
> blank line
> 
>> +    properties:
>> +      compatible:
>> +        const: mmc-slot
> 
> This is also used by the Cavium controller. Should be common.

Right but the cavium one isn't in dtschema, is it worth doing a
common yaml for that ?

> 
>> +
>> +      reg:
>> +        description:
>> +          the slot (or "port") ID
>> +        maxItems: 1
> 
> Aren't there limits in the number of slots the h/w can support?

Good question, let me check

> 
>> +
>> +      bus-width:
>> +        enum: [1, 4]
>> +
>> +    required:
>> +      - compatible
>> +      - reg
>> +
>> +    unevaluatedProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +  - clock-names
>> +  - "#address-cells"
>> +  - "#size-cells"
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    mmc@c1108c20 {
>> +        compatible = "amlogic,meson8-sdio", "amlogic,meson-mx-sdio";
>> +        reg = <0xc1108c20 0x20>;
>> +        interrupts = <GIC_SPI 28 IRQ_TYPE_EDGE_RISING>;
>> +        clocks = <&clk_core>, <&clk_in>;
>> +        clock-names = "core", "clkin";
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        slot@1 {
>> +            compatible = "mmc-slot";
>> +            reg = <1>;
>> +            bus-width = <4>;
>> +        };
>> +    };
>>
>> ---
>> base-commit: 47ac09b91befbb6a235ab620c32af719f8208399
>> change-id: 20240911-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-6fa70546ebb8
>>
>> Best regards,
>> -- 
>> Neil Armstrong <neil.armstrong@linaro.org>
>>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
