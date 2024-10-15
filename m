Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B6DCFC276
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Oct 2024 08:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FLFGNSF9f6RdVH6tKxIt4pE6L+TIkzlq0dtOjnHtovw=; b=Y5781ANKk3kys/aG+OFO2+rvxc
	0CmUIgsGWyvvhqnIE1Gzv4neP+bxnoWs4DNbz2FAMchhHurzaT05XdgEvobyJKuMlB9vJYgqBoRAK
	xy45UzfvCGfADmWv6ippjnk9iA+2Zt4fvUTOhnNxdekA/DVrBu+25JjnLDain/oxYfYG2B3zQWJcu
	GCrMTHXaposL8i8796lgHzRXsauqEWg/NXTaTnn8yuEXHsG+y3P/KqPYJs1NzTX/Cz+lNGbTmCSKG
	zdpew9JJ+3c58e3kMNAX1PxnvdNHtpkWtIGKMd2BR2E9SonuiBcBljzdBf/ZVwHBLZA/6Cuvm6LEg
	fKmPB9Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0d2R-00000007X5s-23Jm;
	Tue, 15 Oct 2024 08:36:19 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0d11-00000007WwV-37ZB
	for linux-amlogic@lists.infradead.org;
	Tue, 15 Oct 2024 08:34:53 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43124d1ca5dso27959445e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 15 Oct 2024 01:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728981289; x=1729586089; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oUF7jv5c/y05IM3ShRlS4OQ3zoxaQbhTTM2rs8WpeVc=;
        b=CET3FDZXFwEZuhkw1zltw2HoAKrNAgSClI/Z/yNieEjapUcRaxpX3Rn4EF2/rpaQR0
         VZJtaNkCQrkd3TmeqVa1ZoC98+ISYFVw4KKbuXbC/J1Qrvwap+izghrqZitGKXPJaYsi
         fa6lIatMJ50DUs563ljBVu+XhQCH6AgPt9ga5oUT57jZAFRpMyE92hRgt3aMk0BAIaxO
         pikzWBk0Wlkw1HwwtvHxljj6TwGoJQ1L5JSJVAlqSMQQciR5k73GLCDk6RKRU3G+4jY8
         wjhZUqFysyaUi0x+yoTLv26dK94wFUdbPZKW8sPlloLpiM9KrE3/8flmAAfoDzYWfwkO
         JXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728981289; x=1729586089;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oUF7jv5c/y05IM3ShRlS4OQ3zoxaQbhTTM2rs8WpeVc=;
        b=d2BsVXJoC7HB/MeXVoWGz12GPBhKR8nQeTNvRUszgpFpcZCLRvujragGKwS6SGpixN
         hbJXoSoF8lyoU4ci708aKQ7iaeJ/jrePi4CP4R0+cVLxOwvSwwqumy/YiqPwJ7xWqsTB
         YCZjbf0bshpwTuLjGtZHf1GBB+0WHnA6e+rMCKgJjDe3DWQZqBaj3ngOQtsVfSQ6lNaS
         sRzdh9WJGz/UxglYiM430Ct8yx1aYt7/VI2aWRksjZfzFyxRcGrWH76ZXjH0xdSgkx4t
         IqPY+U5LtUoSMx+tdXiGF6c2EVofrDn4chjWMk7f7Zopfz0oXkolwOrqBviDulLHxwQk
         JExQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOQh93gXXxuC8jzyJpZ1fAPrTWE9XpAwFmem02ifr7K/qtCWazMfb2QfJ36vluPqXd8jSRFPehCPXFQyf6@lists.infradead.org
X-Gm-Message-State: AOJu0YyUOa9xrmTsF+4vh8cDkQGkZttwv86UwpLFMYqBMUhT6APRobCZ
	iGJCyCp2AKAzGLh7/iAWr0u4je2cJhtSyR9LX2KRJN19iiC7Lw0Jrq4WDuC7PbA=
X-Google-Smtp-Source: AGHT+IEE9Bf4HgHbwmOabZF6YFKnn15l5Ozto9RbXwA5IBzSiR97gav6hVgamHDCguQUrt9TO/528Q==
X-Received: by 2002:a5d:43c6:0:b0:37c:cf73:4bf7 with SMTP id ffacd0b85a97d-37d551fca59mr9456233f8f.34.1728981289440;
        Tue, 15 Oct 2024 01:34:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:e686:73e1:36a8:3467? ([2a01:e0a:982:cbb0:e686:73e1:36a8:3467])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa7a06dsm974468f8f.5.2024.10.15.01.34.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 01:34:48 -0700 (PDT)
Message-ID: <43bb5d15-b045-4621-8795-15e7522bc884@linaro.org>
Date: Tue, 15 Oct 2024 10:34:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: mmc: controller: move properties
 common with slot out to mmc-controller-common
To: Rob Herring <robh@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v3-0-ad4eb22c2a8d@linaro.org>
 <20241007-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v3-1-ad4eb22c2a8d@linaro.org>
 <20241007200230.GA2301832-robh@kernel.org>
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
In-Reply-To: <20241007200230.GA2301832-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_013451_822375_476C9130 
X-CRM114-Status: GOOD (  16.11  )
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

On 07/10/2024 22:02, Rob Herring wrote:
> On Mon, Oct 07, 2024 at 04:03:37PM +0200, Neil Armstrong wrote:
>> Move the common MMC "slot" properties because they are shared by the
>> single-slot or multi-slot controllers, and will help defining a simple
>> mmc-slot bindings document with proper slot properties and nodename.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../bindings/mmc/mmc-controller-common.yaml        | 357 +++++++++++++++++++++
>>   .../devicetree/bindings/mmc/mmc-controller.yaml    | 344 +-------------------
>>   2 files changed, 360 insertions(+), 341 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
>> new file mode 100644
>> index 000000000000..e02d3cbcc271
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
>> @@ -0,0 +1,357 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mmc/mmc-controller-common.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MMC Controller & Slots Common Properties
>> +
>> +maintainers:
>> +  - Ulf Hansson <ulf.hansson@linaro.org>
>> +
>> +description: |
>> +  These properties are common to multiple MMC host controllers and the
>> +  possible slots or ports for multi-slot controllers.
>> +
>> +properties:
>> +  "#address-cells":
>> +    const: 1
>> +    description: |
>> +      The cell is the slot ID if a function subnode is used.
> 
> Actually, this comment is wrong. When slot is used, this is still the
> cell size for the mmc bus.

I don't understand, the comment is still valid, MMC slots can have function subnodes
aswell, perhaps the "slot ID" is confusing here ? here it stands for the MMC protocol
slot ID, not the physical slot of the multi-slot MMC controller.

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
