Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85067C6FD1D
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Mar 2023 15:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZK70T+N5sH7cBC8LjHA7bvc4K8Pwjd+dBtm6S6EJm0w=; b=lfp9wtW9/5YsV3jcNnIk4dvtBq
	DtWAN2JWp4sTeYVTb/ZIfAGwfNlcG6gjYlh345AsnVxa1tJY9jTQNLhdJMJIMohHHjIofQ3/2q92H
	OIrqshdCiH0v8Ir1ZIZSb9bCPqqCyvs8bJZ7+x9WEljC0MDq4fL19g1x2zbJQwGVebmtm3gLnkiMZ
	IG1WXbeA95mPdKdCfmi/ed5r0dCnMsofk9Sj4B68I3K0z6Y8Z1eQq7hROmZnoGLBL1NbSTpb6iBpo
	827Q83Qqi6hfmBUNd7q3x2wJiyE8NLr86Q6WFeAdCN643YQUvLKh08erfWY6moMs/iFW8jynFVzer
	kIHQt4CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc6fA-00AcQx-29;
	Tue, 14 Mar 2023 15:34:08 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc6f7-00AcQC-1q
	for linux-amlogic@lists.infradead.org;
	Tue, 14 Mar 2023 15:34:07 +0000
Received: by mail-wm1-x32e.google.com with SMTP id ay8so5370260wmb.1
        for <linux-amlogic@lists.infradead.org>; Tue, 14 Mar 2023 08:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678808042;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cUjs6NviTytRdWImr2LdV+yP+PAoWGINkzdtBEGmEbo=;
        b=OjcQ9AjKlyPRrknauxw5Ik5B+cujDatFrpV7pUnlZ7liUdI2elJAGFnLecGZ0QYUCd
         iwhDxnPCPTdFz2VbBmnLQz93+ZH3M8LG9EDLoFnFaeFAerk3jBRjyejiY5F2gcUdzxmo
         u0Z0fPn+n6aEp4Qprl63J3A5oThLFdcy5U/8o17YOBjDvUi9YLZwmZ40ZJbxSTfcHr2D
         TeD+Pn3PXs+aXQ3c2SvGU4MvhN7ra6HPXcpuwaFWDcznxE8fQrqN6QSmapuRkjw893R7
         mUKCP7S7u0DuNw9FQrxSayF3Qh2adRd9ZFbOaid2MkxsbqYvk4oVVCNgGYKiARZS1aw3
         uJ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678808042;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cUjs6NviTytRdWImr2LdV+yP+PAoWGINkzdtBEGmEbo=;
        b=CW50r9XAxb7K9I+/rr5ojgsIqAwfSQwKZJJG4nlnB4QzaaTlt3Ckwv1e2Tndi0Q2ni
         fxvoDkXFxA7FufwdyZCkm4gdTC0+R11ZKqCn6idhjIat5RCixNvmHfLQ5fHjMgyIvYjz
         3vThWQt1QSMX7TK2zbh5EoDJN7kmIFX6tSwXKP+0YdFt1hKxks+zfZjKE6D7//4UXmZS
         wHf015CmKf+YyWjHaFNBVu1ACAiVWhstsWJP8ueF+O2Yz32XXsHDLV3iE7fInVt0ZmuQ
         CVpmLxmiuNkUjez6B9z7fmtETnCrs687OJeWAO7T28FOKi81V/RZy/+DCDn0KOWCuFOx
         oTxw==
X-Gm-Message-State: AO0yUKXZ8pXfHZZ8O6KcPu2pTtMexYh8DX8evdpZkclZQ7HLZsf31CCR
	0T7lstfEVF7Ru35dQnoNmmoB9A==
X-Google-Smtp-Source: AK7set+opZ/oLe2qEwrmqbnw6+/2Ubn1r0GXttqg3AYw7OCBnJYLnOJKGMtbzfih7muqNbDNx5Ux0A==
X-Received: by 2002:a05:600c:4f01:b0:3ea:f6c4:3060 with SMTP id l1-20020a05600c4f0100b003eaf6c43060mr14821352wmq.18.1678808040282;
        Tue, 14 Mar 2023 08:34:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:11c3:d4e5:ef75:8eb9? ([2a01:e0a:982:cbb0:11c3:d4e5:ef75:8eb9])
        by smtp.gmail.com with ESMTPSA id s16-20020a05600c45d000b003ed29899dfdsm3381407wmo.21.2023.03.14.08.33.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 08:33:59 -0700 (PDT)
Message-ID: <c8fecf94-2581-6cc9-955c-324efdc7c70a@linaro.org>
Date: Tue, 14 Mar 2023 16:33:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v10 3/5] dt-bindings: clock: meson: add A1 PLL and
 Peripherals clkcs bindings
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: jbrunet@baylibre.com, mturquette@baylibre.com, sboyd@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, jian.hu@amlogic.com,
 kernel@sberdevices.ru, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230313201259.19998-1-ddrokosov@sberdevices.ru>
 <20230313201259.19998-4-ddrokosov@sberdevices.ru>
 <ffebef1d-8447-181b-1890-3e638d399c62@linaro.org>
 <20230314114825.yiv4vcszr6b7m45w@CAB-WSD-L081021>
 <2d9297e9-dab7-9615-3859-79b3b2980d9a@linaro.org>
 <20230314150107.mwcglcu2jv4ixy3r@CAB-WSD-L081021>
 <9d176288-cd7c-7107-e180-761e372a2b6e@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <9d176288-cd7c-7107-e180-761e372a2b6e@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_083405_616596_31B75E51 
X-CRM114-Status: GOOD (  22.02  )
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

On 14/03/2023 16:19, Krzysztof Kozlowski wrote:
> On 14/03/2023 16:01, Dmitry Rokosov wrote:
>> On Tue, Mar 14, 2023 at 03:05:48PM +0100, Krzysztof Kozlowski wrote:
>>> On 14/03/2023 12:48, Dmitry Rokosov wrote:
>>>> On Tue, Mar 14, 2023 at 12:28:40PM +0100, Krzysztof Kozlowski wrote:
>>>>> On 13/03/2023 21:12, Dmitry Rokosov wrote:

<snip>

>>>>>> +/*
>>>>>> + * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
>>>>>> + * Author: Jian Hu <jian.hu@amlogic.com>
>>>>>> + *
>>>>>> + * Copyright (c) 2023, SberDevices. All Rights Reserved.
>>>>>> + * Author: Dmitry Rokosov <ddrokosov@sberdevices.ru>
>>>>>> + */
>>>>>> +
>>>>>> +#ifndef __A1_PLL_CLKC_H
>>>>>> +#define __A1_PLL_CLKC_H
>>>>>> +
>>>>>> +#define CLKID_FIXED_PLL		1
>>>>>> +#define CLKID_FCLK_DIV2		6
>>>>>> +#define CLKID_FCLK_DIV3		7
>>>>>> +#define CLKID_FCLK_DIV5		8
>>>>>> +#define CLKID_FCLK_DIV7		9
>>>>>> +#define CLKID_HIFI_PLL		10
>>>>>
>>>>>
>>>>> Probably I asked about this... why indices are not continuous? You know
>>>>> that consumers are allowed to use number 2 and it will be your ABI, even
>>>>> though you did not write it in the binding? That's a tricky and
>>>>> confusing pattern for no real gains.
>>>>
>>>> Actually, indices are continuou but splitted into two parts: public and
>>>> private. The public part is located in the dt bindings and can be included
>>>> from device tree sources. The private part is in the drivers/clk/meson
>>>> folder, and only clk drivers can use it.
>>>> I know, there is some trick when the user just inserts a digit value and
>>>> doesn't use constants.
>>>
>>> This is not a trick. This is how DTS works. You have only indices/numbers.
>>>
>>>> But I'm starting from the assumption that such
>>>> dts changes will not be approved by maintainers. In other words, the user
>>>> *must* apply defined ABI constants from dt bindings; it's a strong
>>>> restriction.
>>>
>>> But it is not correct assumption. Defines are very important, but they
>>> are just helpers. Otherwise without defines you could not use any clock?
>>> We pretty often use IDs - for DTS to allow merging via different trees,
>>> for DT binding examples to not rely on headers.
>>>
>>> Your driver implements the ABI and the driver exposes for example clock
>>> ID=2, even if it is not in the header.
>>>
>>> These IDs are unfortunately undocumented ABI and you if you change them,
>>> users are allowed to complain.
>>>
>>> Solution: don't do this. Have all exposed clock IDs and clocks in sync
>>> (and continuous).
>>
>> I see. But I don't understand how I can restrict access to private
>> clock objects. I don't want to open ability to change system clocks
>> parents, for example. Or it's under device tree developer responsibility?
>> I would appreciate any assistance in determining the best path.
> 
> There are many ways - depend on your driver. For example like this:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/samsung/clk-exynos5420.c#n975
> 
> The first argument is the clock ID (or ignore).
> 
> BTW, quite likely the problem is generic to all Meson clock drivers.

This issue about "public" non-continuous defined was already discussed at https://lore.kernel.org/all/c088e01c-0714-82be-8347-6140daf56640@linaro.org/

I don't see what's different with this one.

Neil

> 
> Best regards,
> Krzysztof
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
