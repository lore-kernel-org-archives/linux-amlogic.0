Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ADDBD0E6C1
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Oct 2024 07:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Evf+inGRV3fnuxUGPLVSpojw+M0qdgZdDJUORIfzh0=; b=ANw4EYw5KdBC1NX21YuAQsuRUm
	I2wFnRaS+hDdhNu2hi20UKrq3ymW/53yYZSWR1qRFbM2WUfIGLTbWpLHq3wEaf67/WEhUTPX1L7QK
	NuKlaD223AqbDVtrquZeIB6RxxQ9G+m+4EKtoETfSyhn32/chJgDxoHdl/u/hnC81aktk5AHC7vKM
	s5q2EhigQfFYd+dvcNgbNf32SAm66Dai9i31i9zvOO2C67eCH7OM99a/Zc+4pkhp5sg0iT5/KkuPe
	RZPOwD8gWVe7B81M/vmpa5c4Aje0OJdt0jFeZStXqXoZm+jCqqygQEkz4a/nropUnsQjUlSAioFh0
	BbBX3EMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2n7F-00000006QzW-2Ue5;
	Mon, 21 Oct 2024 07:46:13 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2n03-00000006Own-2U4m
	for linux-amlogic@lists.infradead.org;
	Mon, 21 Oct 2024 07:38:49 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-37d41894a32so2642962f8f.1
        for <linux-amlogic@lists.infradead.org>; Mon, 21 Oct 2024 00:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729496325; x=1730101125; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TxYXh/V+6IatSJ291SsvHWPxINcrTow+PNqrMmvAYgI=;
        b=ylhSbFaLi0KRAxaIUPqpzTs1GnKBj2xRJjLcEgV2HV5c25ja99BKEKfV0g7uKVJS26
         PPhIVrfOZGbzs8h4N03lne8Q4JJQRKb8UYe0q8r3H2YhQ3+quzYJNfcKzz5udsYTrh8j
         yKoqZ2mH+De/pVS7TdO7/pqPPY6dVC5cwj98F7U9lFj7RxTQnPdZTOgTSKRKC/JeKfko
         x6//HIXsoRX+2ms55uZGsTGnXBOQaZzzM8QJNHnjG/bIOBq9J/vvI5H32mWm+0dpIS1c
         GfGx3Tnt5CUbURGfDosFla9enXVrBA1+ZW3tU2Egxq71mqz5F63XA8OvNL581fNXj15i
         N/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729496325; x=1730101125;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TxYXh/V+6IatSJ291SsvHWPxINcrTow+PNqrMmvAYgI=;
        b=Fj+FQjVhJQseHPdX8IgGVTXH9B9XuHcy3ADiBNGt9W91uic63GeV+6NyKlLRKYbQcX
         eKxkM0gMLhCEnwhsFwlkNGE5MIU0d+489+wa+t94jPuopfu/AMGAHQifFRV2P+8BcKOR
         GtN8aXH7GyRVrZLZ0w/rgpN+YL84qVpymtmAQH8F8PP55E6BIeREGmERjseyCNDIbIIW
         i8NW8UojNB312+BJmESV+RlsGGNFBdJgVfVZRtBjKMCmTH9a/zsvrgXVaLXUVUExef45
         iwI8lD9oBY+a0fUjs+eLUpAS1oJSFevwQ5zEf0lE+HbHXxRtQ4OM2Zgidh/UNKr1b3mH
         RtOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTkToF9dgJWsrzIH6+mLJQ94Wo+vFgAhs/BU54kqZZOfb40udTGh30lrJ+3NcutVRIZljkjB2AsDLJWYsh@lists.infradead.org
X-Gm-Message-State: AOJu0YwYyA48TucDb6XVwBX7jhqw5mg0cq38Q4SQoVNA1BKMakgQ5SmV
	zy8B39tdvQfprq4aG3o9J2gad/ZgCQ+nQA2o+QnWFFAsSMcaSvHRxjIn1DbPcoQ=
X-Google-Smtp-Source: AGHT+IFtLjIEg8RRnj8c2wcjVt5rOHjraFaFABXFVMuRh8JhTW4RU0amqd3QeH7gBtqewoWIpaMXqw==
X-Received: by 2002:adf:e3d1:0:b0:37d:4706:f721 with SMTP id ffacd0b85a97d-37ecf086383mr6426593f8f.27.1729496325397;
        Mon, 21 Oct 2024 00:38:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:3908:dea6:2ddd:be97? ([2a01:e0a:982:cbb0:3908:dea6:2ddd:be97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a37bb5sm3593696f8f.7.2024.10.21.00.38.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 00:38:45 -0700 (PDT)
Message-ID: <fdb4d0eb-a5e5-4061-b3cc-14958473baf3@linaro.org>
Date: Mon, 21 Oct 2024 09:38:44 +0200
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
In-Reply-To: <e6cd13b5-2f7a-4ab1-899c-5867bc0ea64f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_003847_720213_DF33AF05 
X-CRM114-Status: GOOD (  20.28  )
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

On 18/10/2024 17:31, Krzysztof Kozlowski wrote:
> On 18/10/2024 14:31, Neil Armstrong wrote:
>> On 18/10/2024 12:13, Krzysztof Kozlowski wrote:
>>> On 18/10/2024 11:20, Jerome Brunet wrote:
>>>> On Fri 18 Oct 2024 at 17:01, Xianwei Zhao <xianwei.zhao@amlogic.com> wrote:
>>>>
>>>>> Hi Jerome,
>>>>>      Thanks for your reply.
>>>>>
>>>>> On 2024/10/18 16:39, Jerome Brunet wrote:
>>>>>> [ EXTERNAL EMAIL ]
>>>>>> On Fri 18 Oct 2024 at 10:28, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>>>
>>>>>>> On 18/10/2024 10:10, Xianwei Zhao via B4 Relay wrote:
>>>>>>>> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>>>>>>>
>>>>>>>> Add the new compatible name for Amlogic A4 pin controller, and add
>>>>>>>> a new dt-binding header file which document the detail pin names.
>>>>>> the change does not do what is described here. At least the description
>>>>>> needs updating.
>>>>>>
>>>>>
>>>>> Will do.
>>>>>
>>>>>> So if the pin definition is now in the driver, does it mean that pins have
>>>>>> to be referenced in DT directly using the made up numbers that are
>>>>>> created in pinctrl-amlogic-a4.c at the beginning of patch #2 ?
>>>>>>
>>>>>
>>>>> Yes.
>>>>>
>>>>>> If that's case, it does not look very easy a read.
>>>>>>
>>>>>
>>>>> It does happen. The pin definition does not fall under the category of
>>>>> binding.
>>>>>
>>>>> https://lore.kernel.org/all/106f4321-59e8-49b9-bad3-eeb57627c921@amlogic.com/
>>>>
>>>> So the expectation is that people will write something like:
>>>>
>>>>    reset-gpios = <&gpio 42 GPIO_ACTIVE_LOW>;
>>>>
>>>> And others will go in the driver to see that is maps to GPIOX_10 ? the number
>>>> being completly made up, with no link to anything HW/Datasheet
>>>> whatsoever ?
>>>>
>>>> This is how things should be done now ?
>>>
>>> Why would you need to do this? Why it cannot be <&gpio 10
>>> GPIO_ACTIVE_LOW>, assuming it is GPIO 10?
>>>
>>> Bindings have absolutely nothing to do with it. You have GPIO 10, not
>>> 42, right?
>>
>> There's no 1:1 mapping between the number and the pin on Amlogic platforms,
>> so either a supplementary gpio phandle cell is needed to encode the gpio pin
>> group or some bindings header is needed to map those to well known identifiers.
> 
> So I assume this is not linear mapping (simple offset)? If so, this fits
> the binding header with identifiers, but I have impression these were
> not really used in earlier versions of this patchset. Instead some offsets:
> https://lore.kernel.org/all/20241014-a4_pinctrl-v2-1-3e74a65c285e@amlogic.com/
> 
> and pre-proccessor.
> 
> These looked almost good:
> https://lore.kernel.org/all/20240613170816.GA2020944-robh@kernel.org/
> 
> but then 0 -> 0
> 1 -> 1
> so where is this need for IDs?

???

Of courses the first pins maps to linear values...

> 
> See also last comment from Rob in above email.

OK so I looked and v2 was in fact correct:
https://lore.kernel.org/all/20241014-a4_pinctrl-v2-1-3e74a65c285e@amlogic.com/

====><=================
+/* Standard port */
+#define GPIOB_START	0
+#define GPIOB_NUM	14
+
+#define GPIOD_START	(GPIOB_START + GPIOB_NUM)
+#define GPIOD_NUM	16
+
+#define GPIOE_START	(GPIOD_START + GPIOD_NUM)
+#define GPIOE_NUM	2
+
+#define GPIOT_START	(GPIOE_START + GPIOE_NUM)
+#define GPIOT_NUM	23
+
+#define GPIOX_START	(GPIOT_START + GPIOT_NUM)
+#define GPIOX_NUM	18
+
+#define PERIPHS_PIN_NUM	(GPIOX_START + GPIOX_NUM)
+
+/* Aobus port */
+#define GPIOAO_START	0
+#define GPIOAO_NUM	7
+
+/* It's a special definition, put at the end, just 1 num */
+#define	GPIO_TEST_N	(GPIOAO_START +  GPIOAO_NUM)
+#define	AOBUS_PIN_NUM	(GPIO_TEST_N + 1)
+
+#define AMLOGIC_GPIO(port, offset)	(port##_START + (offset))
====><=================

is exactly what rob asked for, and you nacked it.

Neil


> 
> Best regards,
> Krzysztof
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
