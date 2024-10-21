Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2EE4D0E6F1
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Oct 2024 10:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FLAFmpxe9SGqGib+mjFjTfk96oE/encgzDOFjgF3YTE=; b=i1K8guYmAm/nfqxdLNjNSJPufR
	tiSyZmUZF+4YG6Ok7ZSyheXL8Du8/kYyQXeq5GDYj8epTrkNP6H/nHVjcvuGRpKWhJXNROXCEhKrB
	uzFgT5AGl2aeBIOx+I6Fegj+SiULNGTGo614wqbSMTzGuf8SR7AQbZ274gDsXzj6rjrk3N/bW7oKO
	9sthN+RWxIEHXt+qPUvlF4M1a5IyhB+z9cuI4O2/eJ5s57WYPXs603QqI2cNQOxxYTV3Y3FWgZOH7
	Z7K33O9XgmO+yo6val1hxwtNmUDvQMwUw3Wg46e8DVyCylkgk2S/VDZNzB1tKd/RhbPBb5eLK93d5
	1zDa1Aiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2pth-00000006vvG-3qtJ;
	Mon, 21 Oct 2024 10:44:25 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2poC-00000006ulc-1sQQ
	for linux-amlogic@lists.infradead.org;
	Mon, 21 Oct 2024 10:38:46 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4315e9e9642so34652775e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 21 Oct 2024 03:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729507122; x=1730111922; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ySuw8D8jWEN/9YhfbV0Sya+B2jTWI3nM02ykj7+cy8=;
        b=Y/+IkQ1nvpDUAzs3TkO4jyusGt/5vbguM4KBDxCSXT77ihe2xx2c0xvzQDpVc+R+YT
         /BdcfRZj1TRLQGoXKeCvWRNdk8Y/uPZTrrNn40nqGersuyuZGZL5NQ5Tuq2devZvzKF0
         vaqFQ+hIRaJaZC19LpoqKTCFiCFI3mYlKmJuWk6cLORTL+1LW6edPnA4PuqJK6Ui20Dn
         n5vM3lfnhwVuQqbEYz8SQBPOxpFHuBDXdDXE0W7oRj5mXK2AsIPrs6kDrkel7i8/uTSR
         4GTFt3m7xPwyxTfIY3kx+CJhKWqiB6YxIxsLz6yRAKByIG5zmPDyQx4FN5AuSuA+zkqD
         rCvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729507122; x=1730111922;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2ySuw8D8jWEN/9YhfbV0Sya+B2jTWI3nM02ykj7+cy8=;
        b=ChAey8ZX4G/GjnJ4q5eZe6CurUVBPrworPMEGxgQQ5CcD8aNqeTu/jTAoJrK9CYaIj
         KEE8wnDnTRfgreZ0Wp+AQvy2X2y00oTDajd8FNzclt1h0ai48MDfBWAFkvzagcQNBe4S
         ZO6gENZU6SNAhI/EA83KR2xwjSlM2cMmOCM2v0nfv3AectGXGpWv6E0DHeiZ6Y9nLunm
         GFka6t99xV7vYDQMtfmv88to8weqLXBJf6wkaS+UP6rqPy7WgvUPnb0u4i3ICMT4iJgO
         +kdGJRB3YwGj9Aw985wNtst71xIlHKkyIOe6LOWxLs36GWpoz/PRRM/AZ/MgIVf5NAu1
         ms5g==
X-Forwarded-Encrypted: i=1; AJvYcCVD+LJkFZE/u6o80kRw2hM7CJdX0mGMQJIQfm3u4yJEMiaA3MILfpPlAvVC/RUBdB4edrHsnXENCa00Nial@lists.infradead.org
X-Gm-Message-State: AOJu0YwtnWG+j0lcAKQ9AmgXAyfLMaWB8MMuv92ukn72YHqnWfc9xU2O
	XFLyfdAd+ZDH0O9F6Qa7fFgsSRZ3QRMxDEMhzkJgH0ZLcjUHrNB1ks95SHQtg9E=
X-Google-Smtp-Source: AGHT+IEdepbcnTwYewoqxOwDr6bbpP0LoiIrLZO/s1iPNW7F3xJuePF3p6zuXgXPdml/hpNXA/PR6g==
X-Received: by 2002:a05:600c:35d3:b0:431:5f9e:3f76 with SMTP id 5b1f17b1804b1-43161669464mr96932435e9.16.1729507122510;
        Mon, 21 Oct 2024 03:38:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:3908:dea6:2ddd:be97? ([2a01:e0a:982:cbb0:3908:dea6:2ddd:be97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f5c3497sm52743365e9.29.2024.10.21.03.38.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 03:38:42 -0700 (PDT)
Message-ID: <f6c4cee8-dd22-4b30-a3b2-aee48e2c3611@linaro.org>
Date: Mon, 21 Oct 2024 12:38:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: Add support for Amlogic A4
 SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241018-a4_pinctrl-v3-0-e76fd1cf01d7@amlogic.com>
 <20241018-a4_pinctrl-v3-1-e76fd1cf01d7@amlogic.com>
 <4a79f996-9d82-48b2-8a93-d7917413ed8c@kernel.org>
 <1jttd9rein.fsf@starbuckisacylon.baylibre.com>
 <4127b448-a914-4c69-b938-29512995326f@amlogic.com>
 <1jmsj1rclh.fsf@starbuckisacylon.baylibre.com>
 <d654d2b2-977b-44c0-8b01-b26f5eb0a3fe@kernel.org>
 <5ad8f396-84a5-486d-b90d-98fbf8882d1b@linaro.org>
 <e6cd13b5-2f7a-4ab1-899c-5867bc0ea64f@kernel.org>
 <fdb4d0eb-a5e5-4061-b3cc-14958473baf3@linaro.org>
 <c8a03fa6-9ac5-434f-ba13-78e47ad341b8@kernel.org>
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
In-Reply-To: <c8a03fa6-9ac5-434f-ba13-78e47ad341b8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_033844_535997_47DADBF3 
X-CRM114-Status: GOOD (  27.69  )
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

On 21/10/2024 11:56, Krzysztof Kozlowski wrote:
> On 21/10/2024 09:38, neil.armstrong@linaro.org wrote:
>> On 18/10/2024 17:31, Krzysztof Kozlowski wrote:
>>> On 18/10/2024 14:31, Neil Armstrong wrote:
>>>> On 18/10/2024 12:13, Krzysztof Kozlowski wrote:
>>>>> On 18/10/2024 11:20, Jerome Brunet wrote:
>>>>>> On Fri 18 Oct 2024 at 17:01, Xianwei Zhao <xianwei.zhao@amlogic.com> wrote:
>>>>>>
>>>>>>> Hi Jerome,
>>>>>>>       Thanks for your reply.
>>>>>>>
>>>>>>> On 2024/10/18 16:39, Jerome Brunet wrote:
>>>>>>>> [ EXTERNAL EMAIL ]
>>>>>>>> On Fri 18 Oct 2024 at 10:28, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>>>>>
>>>>>>>>> On 18/10/2024 10:10, Xianwei Zhao via B4 Relay wrote:
>>>>>>>>>> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>>>>>>>>>
>>>>>>>>>> Add the new compatible name for Amlogic A4 pin controller, and add
>>>>>>>>>> a new dt-binding header file which document the detail pin names.
>>>>>>>> the change does not do what is described here. At least the description
>>>>>>>> needs updating.
>>>>>>>>
>>>>>>>
>>>>>>> Will do.
>>>>>>>
>>>>>>>> So if the pin definition is now in the driver, does it mean that pins have
>>>>>>>> to be referenced in DT directly using the made up numbers that are
>>>>>>>> created in pinctrl-amlogic-a4.c at the beginning of patch #2 ?
>>>>>>>>
>>>>>>>
>>>>>>> Yes.
>>>>>>>
>>>>>>>> If that's case, it does not look very easy a read.
>>>>>>>>
>>>>>>>
>>>>>>> It does happen. The pin definition does not fall under the category of
>>>>>>> binding.
>>>>>>>
>>>>>>> https://lore.kernel.org/all/106f4321-59e8-49b9-bad3-eeb57627c921@amlogic.com/
>>>>>>
>>>>>> So the expectation is that people will write something like:
>>>>>>
>>>>>>     reset-gpios = <&gpio 42 GPIO_ACTIVE_LOW>;
>>>>>>
>>>>>> And others will go in the driver to see that is maps to GPIOX_10 ? the number
>>>>>> being completly made up, with no link to anything HW/Datasheet
>>>>>> whatsoever ?
>>>>>>
>>>>>> This is how things should be done now ?
>>>>>
>>>>> Why would you need to do this? Why it cannot be <&gpio 10
>>>>> GPIO_ACTIVE_LOW>, assuming it is GPIO 10?
>>>>>
>>>>> Bindings have absolutely nothing to do with it. You have GPIO 10, not
>>>>> 42, right?
>>>>
>>>> There's no 1:1 mapping between the number and the pin on Amlogic platforms,
>>>> so either a supplementary gpio phandle cell is needed to encode the gpio pin
>>>> group or some bindings header is needed to map those to well known identifiers.
>>>
>>> So I assume this is not linear mapping (simple offset)? If so, this fits
>>> the binding header with identifiers, but I have impression these were
>>> not really used in earlier versions of this patchset. Instead some offsets:
>>> https://lore.kernel.org/all/20241014-a4_pinctrl-v2-1-3e74a65c285e@amlogic.com/
>>>
>>> and pre-proccessor.
>>>
>>> These looked almost good:
>>> https://lore.kernel.org/all/20240613170816.GA2020944-robh@kernel.org/
>>>
>>> but then 0 -> 0
>>> 1 -> 1
>>> so where is this need for IDs?
>>
>> ???
>>
>> Of courses the first pins maps to linear values...
>>
>>>
>>> See also last comment from Rob in above email.
>>
>> OK so I looked and v2 was in fact correct:
>> https://lore.kernel.org/all/20241014-a4_pinctrl-v2-1-3e74a65c285e@amlogic.com/
>>
>> ====><=================
>> +/* Standard port */
>> +#define GPIOB_START	0
>> +#define GPIOB_NUM	14
>> +
>> +#define GPIOD_START	(GPIOB_START + GPIOB_NUM)
>> +#define GPIOD_NUM	16
>> +
>> +#define GPIOE_START	(GPIOD_START + GPIOD_NUM)
>> +#define GPIOE_NUM	2
>> +
>> +#define GPIOT_START	(GPIOE_START + GPIOE_NUM)
>> +#define GPIOT_NUM	23
>> +
>> +#define GPIOX_START	(GPIOT_START + GPIOT_NUM)
>> +#define GPIOX_NUM	18
>> +
>> +#define PERIPHS_PIN_NUM	(GPIOX_START + GPIOX_NUM)
>> +
>> +/* Aobus port */
>> +#define GPIOAO_START	0
>> +#define GPIOAO_NUM	7
>> +
>> +/* It's a special definition, put at the end, just 1 num */
>> +#define	GPIO_TEST_N	(GPIOAO_START +  GPIOAO_NUM)
>> +#define	AOBUS_PIN_NUM	(GPIO_TEST_N + 1)
>> +
>> +#define AMLOGIC_GPIO(port, offset)	(port##_START + (offset))
>> ====><=================
>>
>> is exactly what rob asked for, and you nacked it.
> 
> No, this is not what was asked, at least according to my understanding.
> Number of GPIOs is not an ABI. Neither is their relationship, where one
> starts and other ends.

I confirm this need some work, but it moved the per-pin define to start
and ranges, so what did rob expect ?

> 
> Maybe I missed something, but I could not find any users of these in the
> DTS. Look:
> 
> https://lore.kernel.org/all/20241014-a4_pinctrl-v2-3-3e74a65c285e@amlogic.com/

So you want consumers before the bindings ? strange argument

> 
> Where is any of above defines?
> 
> Maybe they will be visible in the consumer code, but I did not imagine
> such use. You expect:
> reset-gpios = <&ctrl GPIOAO_START 1>???

No I expect:
reset-gpios = <&ctrl AMLOGIC_GPIO(B, 0) 1>;

but the macro should go along the dts like we did for the reset defines,
so perhaps this is the solution ?

> 
> How this is anyway close to what we have for Aspeed or Tegra? I
> understand that there was no consumer DTS, but you have also cover
> letter which could bring some answers in case reviewer is confused. What
> did cover letter say? Let me quote:
> 
> "Add pinctrl driver support for Amloigc A4 SoC"

Well he didn't expect a such sudden radical change in maintainers
requirements! Neither did I.

Neil

> 
> 
> 
> 
> Best regards,
> Krzysztof
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
