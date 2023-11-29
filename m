Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EAB7C4167B
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Nov 2023 17:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=puZa54MXPZawfYv1VhOKF9NtADQI5AnqxshXKpa1bE8=; b=1IL7GjvCTvbsB3B5F9f1QenPh8
	K44NYOZ1Xe1lJyQsSens1Jw0Z2GoKad9J1v2QgH1/sokeTKYEr/P+wqM89b9QqNWfeLL49g/g05Ne
	gMadpNv9PWm0EppmXoTwH59neJJdzDm+QHj7FeQDZ0rNnQwLG1ZrJE8IJVYCWiUJHFLO8gitcF4o0
	jxkpP81u4MlCfQeSKigoLvijCfIs2OlLSqr20vNLeqGebYMFN44NPjGevMssSJCFIexs5EIPJndVV
	Qqu71VnXQwmcdxvkTBJQq8bL2WlPqHiNURNGqq6/P0sYQ0haPhClGlvAM4e4DnfUxlWMusy/qUNFE
	LOk+f1ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8OdV-0092Y8-2e;
	Wed, 29 Nov 2023 17:46:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Nd1-008vOi-1F
	for linux-amlogic@bombadil.infradead.org;
	Wed, 29 Nov 2023 16:41:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:Reply-To:From:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=dfg7atQN/bLBzM7mE71PtSKnKRCE3/hamOjfFKvk+Ps=; b=Hz/dr28VOlfsttiPvxLxrXfm9Q
	veoIndgokO9Ar1eTaEHZ1SHRA2tiWYQrYEWvtDMPgLl2LLmkl4OfshTtst9+drTpUBpYOfW0G2fLh
	EetepFTWdogjQCKzrgCvRaECRUV28GwI821pH5tLEESXefRtb1U8iWMXbpPV7t3mXVb4fB2PnitHK
	vX68jzdRvmwayIw/ube44De/sNJhXaVOX0zoLism0kDu8WnNEjrTfZGRt+Wvs4e0kQMsKAWNRjbCQ
	tLkW1wqgJVErIv5oI3o8YNcjxwqGlKIkx9AEGVAJVGHlyEYGBinXuPaG6rlQWinFT5fuNOYMekPbV
	PAwY7zZw==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Ncm-000QHZ-1f
	for linux-amlogic@lists.infradead.org;
	Wed, 29 Nov 2023 16:41:33 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40b4734b975so28500525e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 29 Nov 2023 08:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701276069; x=1701880869; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dfg7atQN/bLBzM7mE71PtSKnKRCE3/hamOjfFKvk+Ps=;
        b=vTnBry/hdM9M5NLWO4lSjM+5DBxnygUpR7vJSaceDrl8DlEdbvYcPM+bgQcAkSEeUV
         1pSfjRgTw2Cq+jdob965TNRtknhJuSzjPumF9sQ2VqKPr6GJKjKOectn3BucNZHjfw6+
         QQ1VAdyTUAyKvqYKvqAph52FL8MUORlhDNccbBQ01JhOTjp+OuR/lv/hTekzO9ZK0vCz
         NSIUa67P9ukEgqrMvpctnuPqQghqaIwgo0EAGJGOmxb6YLirRckup02H+MMuZljUeYzZ
         UKqgI43BVpXWFJxksxZzBlfsIkXJ5Th+VP3bZoQc1dOKVd2HKJe7an/IOFg6mz97CW4B
         ycRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701276069; x=1701880869;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dfg7atQN/bLBzM7mE71PtSKnKRCE3/hamOjfFKvk+Ps=;
        b=kw48ITfBQ3YTaGwycgeT5Ta+NwiiXHZqI87o729STLneg6iKezmHE/WlfjqxyEbO4x
         waSKvkALrofvem/N84rOz8O6P9JM+Wkf3rAUFoNylyMfBo4n+pO7g6dVbf8lliPGeNcv
         ZGYa6oe5nXStmaEBAcWaOXqYz+5ivOTmNGQXvvljGQoNSzwkKUh3yFnuPyKNLIXtaYMX
         12Xsf6DTtWTeOsGbIX325YFhh95daTuCkGmoTd+X6X6Ss9hwnGfmhS8HWIV3VVRqJPYY
         DYhGKExBWvysUxJAtR9UZT5VC22Sp32aHVv8bBtpSt0cxI6D4vbqc+RWepVmmw4ZNDeH
         sFEA==
X-Gm-Message-State: AOJu0Yx8WDeRrHNxM/+Bdi76go1DyIjcD87uGx8SKM1Vq1LX+nRmyeeD
	cNDWR3BpP116hN0RhWyPh7k8gg==
X-Google-Smtp-Source: AGHT+IGojnc7iEBSKQz6F3GlFyEvUSOGmmp2QrAEdcHHEVFRSkWi1DK4rH79rgWmbOL/atepa5/2QQ==
X-Received: by 2002:a05:600c:1384:b0:409:19a0:d247 with SMTP id u4-20020a05600c138400b0040919a0d247mr13959356wmf.18.1701276069537;
        Wed, 29 Nov 2023 08:41:09 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:31d3:eea3:8f97:6a2c? ([2a01:e0a:982:cbb0:31d3:eea3:8f97:6a2c])
        by smtp.gmail.com with ESMTPSA id g10-20020a05600c4eca00b0040596352951sm2783806wmq.5.2023.11.29.08.41.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 08:41:09 -0800 (PST)
Message-ID: <11f8d986-3e97-4191-b46c-ad3166ee6dc7@linaro.org>
Date: Wed, 29 Nov 2023 17:41:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 2/4] dt-bindings: pwm: amlogic: add new compatible for
 meson8 pwm type
Content-Language: en-US, fr
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org,
 JunYi Zhao <junyi.zhao@amlogic.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
References: <20231129134004.3642121-1-jbrunet@baylibre.com>
 <20231129134004.3642121-3-jbrunet@baylibre.com>
 <8e78be99-3d4d-4f79-9791-404e60bcb67c@linaro.org>
 <1jfs0ojz1a.fsf@starbuckisacylon.baylibre.com>
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
In-Reply-To: <1jfs0ojz1a.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_164123_463450_03BDB937 
X-CRM114-Status: GOOD (  29.40  )
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

Hi,

On 29/11/2023 17:26, Jerome Brunet wrote:
> 
> On Wed 29 Nov 2023 at 17:20, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> 
>> Hi,
>>
>> On 29/11/2023 14:39, Jerome Brunet wrote:
>>> Add a new compatible for the pwm found in the meson8 to sm1 Amlogic SoCs,
>>> dealing with clocks differently. This does not enable new HW. It is meant
>>> to fix a bad DT ABI for the currently supported HW.
>>> The original clock bindings describe which input the PWM channel
>>> multiplexer should pick among its possible parents, which are
>>> hard-coded in the driver. As such, it is a setting tied to the driver
>>> implementation and does not describe the HW.
>>> The new bindings introduce here describe the clocks input of the PWM
>>> block
>>> as they exist.
>>> The old compatible is deprecated but kept to maintain ABI compatibility.
>>> The SoC specific compatibles introduced match the SoC families supported
>>> by the original bindings.
>>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>>> ---
>>>    .../devicetree/bindings/pwm/pwm-amlogic.yaml  | 52 ++++++++++++++++---
>>>    1 file changed, 46 insertions(+), 6 deletions(-)
>>> diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>>> b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>>> index 387976ed36d5..eece390114a3 100644
>>> --- a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>>> +++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>>> @@ -21,23 +21,35 @@ properties:
>>>              - amlogic,meson-g12a-ee-pwm
>>>              - amlogic,meson-g12a-ao-pwm-ab
>>>              - amlogic,meson-g12a-ao-pwm-cd
>>> -          - amlogic,meson-s4-pwm
>>> +        deprecated: true
>>>          - items:
>>>              - const: amlogic,meson-gx-pwm
>>>              - const: amlogic,meson-gxbb-pwm
>>> +        deprecated: true
>>>          - items:
>>>              - const: amlogic,meson-gx-ao-pwm
>>>              - const: amlogic,meson-gxbb-ao-pwm
>>> +        deprecated: true
>>>          - items:
>>>              - const: amlogic,meson8-pwm
>>>              - const: amlogic,meson8b-pwm
>>> +        deprecated: true
>>
>> I think deprecated should be moved in a third patch
> 
> The complain on v2 was that it was not clear the new binding was making
> the old one obsolete. It looked to me that the deprecation old bindings
> needed to go together with the introduction of the new.
> 
> I don't mind one way or the other
> 
> Is there a rule somewhere about this ?

Not sure about that, I don't think it's a problem to have both valid
at the same time, setting them deprecated afterwards looks cleaner
to avoid mixing too much changes at the same time.

Neil

> 
>>
>>> +      - const: amlogic,meson8-pwm-v2
>>> +      - items:
>>> +          - enum:
>>> +              - amlogic,meson8b-pwm-v2
>>> +              - amlogic,meson-gxbb-pwm-v2
>>> +              - amlogic,meson-axg-pwm-v2
>>> +              - amlogic,meson-g12-pwm-v2
>>> +          - const: amlogic,meson8-pwm-v2
>>> +      - const: amlogic,meson-s4-pwm
>>>        reg:
>>>        maxItems: 1
>>>        clocks:
>>>        minItems: 1
>>> -    maxItems: 2
>>> +    maxItems: 4
>>>        clock-names:
>>>        minItems: 1
>>> @@ -58,7 +70,6 @@ allOf:
>>>            compatible:
>>>              contains:
>>>                enum:
>>> -              - amlogic,meson8-pwm
>>>                  - amlogic,meson8b-pwm
>>>                  - amlogic,meson-gxbb-pwm
>>>                  - amlogic,meson-gxbb-ao-pwm
>>> @@ -67,14 +78,15 @@ allOf:
>>>                  - amlogic,meson-g12a-ee-pwm
>>>                  - amlogic,meson-g12a-ao-pwm-ab
>>>                  - amlogic,meson-g12a-ao-pwm-cd
>>> -              - amlogic,meson-gx-pwm
>>> -              - amlogic,meson-gx-ao-pwm
>>
>> I don't understand why those entries are removed
> 
> It's a mistake. It should not have been added to begin with in
> the first patch. "amlogic,meson-gx-*" must go along with
> "amlogic,meson-gxbb-*" so it matches correctly without it.
> 
> I'll fix it
> 
>>
>>>        then:
>>> -      # Historic bindings tied to the driver implementation
>>> +      # Obsolete historic bindings tied to the driver implementation
>>>          # The clocks provided here are meant to be matched with the input
>>>          # known (hard-coded) in the driver and used to select pwm clock
>>>          # source. Currently, the linux driver ignores this.
>>> +      # This is kept to maintain ABI backward compatibility.
>>
>> Same here, this should go in a third patch
>>
>>>          properties:
>>> +        clocks:
>>> +          maxItems: 2
>>>            clock-names:
>>>              oneOf:
>>>                - items:
>>> @@ -83,6 +95,27 @@ allOf:
>>>                    - const: clkin0
>>>                    - const: clkin1
>>>    +  # Newer binding where clock describe the actual clock inputs of the
>>> pwm
>>> +  # block. These are necessary but some inputs may be grounded.
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            enum:
>>> +              - amlogic,meson8-pwm-v2
>>> +    then:
>>> +      properties:
>>> +        clocks:
>>> +          minItems: 1
>>> +          items:
>>> +            - description: input clock 0 of the pwm block
>>> +            - description: input clock 1 of the pwm block
>>> +            - description: input clock 2 of the pwm block
>>> +            - description: input clock 3 of the pwm block
>>> +        clock-names: false
>>> +      required:
>>> +        - clocks
>>> +
>>>      # Newer IP block take a single input per channel, instead of 4 inputs
>>>      # for both channels
>>>      - if:
>>> @@ -112,6 +145,13 @@ examples:
>>>          clock-names = "clkin0", "clkin1";
>>>          #pwm-cells = <3>;
>>>        };
>>> +  - |
>>> +    pwm@2000 {
>>> +      compatible = "amlogic,meson8-pwm-v2";
>>> +      reg = <0x1000 0x10>;
>>> +      clocks = <&xtal>, <0>, <&fdiv4>, <&fdiv5>;
>>> +      #pwm-cells = <3>;
>>> +    };
>>>      - |
>>>        pwm@1000 {
>>>          compatible = "amlogic,meson-s4-pwm";
>>
>> Neil
> 
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
