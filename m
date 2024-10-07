Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9931CFB440
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Oct 2024 08:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NefblW+c3992irDGeT8EW8zhrjRW37roIjT8U6RHnaQ=; b=0JUYn/JB/ikPnijFxOcJ1uqVQY
	Msb492BbMWzwDa4gL+JFsw+LdlnjVRSm8P9OahHVt4/9Bo0Xdto45abSc6rBfZBc2YLpTqUjRa/z1
	S7IM5wtyDMVLnCl+ncUohQCZDMxfHYYlLX6T8fggDILQBHMRCNwHFPnZ3F9iGJ7IwMk0DlzFA5L/6
	B/nfOI2E/vdYylkqwRWIy/N36XIgPlfaJuq4tmmLGTeCU6MhZto2JCNBe9EDvzLvcXHQya1dG8Fc5
	xfwWvot+FGuYioJbBUo3twYoRXrqw9h1BCLeIP0rTlhUKpG8XNWs7XbpjsWlLNlmwHXs2p43a0ugv
	Z77rcUaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxjaF-00000001rN8-2fCX;
	Mon, 07 Oct 2024 08:59:15 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxjYx-00000001rE3-1cmq
	for linux-amlogic@lists.infradead.org;
	Mon, 07 Oct 2024 08:57:57 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-37cc84c12c2so2167895f8f.3
        for <linux-amlogic@lists.infradead.org>; Mon, 07 Oct 2024 01:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728291473; x=1728896273; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TGBBMU8rFx26oRjbd1HxpI/xco3E3mGApwngB2hx0UA=;
        b=jSOrqbr9FEJm9o3h6eRJDptnbhx95cz3QQe+ZLhsUey7e/g2w+k7/a9PVoZ3utux1z
         bE4xWlGwqCcjaVjRgMB+9rPN9UVQu6ZzEK3MGIvlJuTO+L/3UJkMxmurVBQ5Q6Clayhq
         vZF88kvLnP4UjANBANROi/jW/gz/MY+dhjzqEMxBmqG5yILO30htJO/N4sr2tvL9ynCo
         do4KWICxVfrZL3UiMsLEMEp+zGCgGAjx2OsX6a7wGfjc58Q954IgGSima70Tes6ZFW9S
         z4WmPK921ZpdwUhcXkf1CV4LsC/LmgLTt/PVHlqrDzFYJfQbjKssqK2uFl8KANRrpawR
         1PyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728291473; x=1728896273;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TGBBMU8rFx26oRjbd1HxpI/xco3E3mGApwngB2hx0UA=;
        b=nJrmh6rvSAmoXcFwdEsKxILV3e8wlmvBUnpm+Omam4MPTkLMzUbuJzt29HXK5BK4ph
         cxMvux6kP8KYejHd75qHKUoPH+4YSLtWsNt2JkXjWBFJ8WhY0c5fckYrvJfdzVpsAScI
         LgMREdXKHsvqd5xzU1jR6WJg7g9ldE/2735SOytMwnh/nJu6Wo8L9GR9Cz+Vt/yT9xO2
         8UNCn5K7JEAIA9iL/15ZVQd31wXbHyx1H3psarP/fG5bUrYRZiAeqJvpxC9vUo725mIN
         o5hfCe2gDeSGTQyiHs8mCRxlcfCZ9ZspCROECIF1xbiQymXoL1uA43B/weVKzoqg40sw
         olTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWo3Hik6MtXOqQWeUsZJwg/8pCW/PodLtQXF6+JLsCZ3lngpgXlHd515yva79UAN0Ug2LT/Y37PS90yuDAj@lists.infradead.org
X-Gm-Message-State: AOJu0YyHCNA05R/jzRv/Trs8E2Yty0Xb2hNmbtu2G9xoah+3AHe+Dq7h
	DrwuvxC/T1/D+WV2bgpc+lSFH+MAKWl5iK9aSTTSTdxAnPcJjl+CDxOOBMpx3qY=
X-Google-Smtp-Source: AGHT+IHb6K+lD/kBzplnC0Ubjz9+HYTIZIIEg6E9T40OzxD0plJXKDgFKpCxd+La0sGXCiOa+xkq+g==
X-Received: by 2002:a05:6000:4008:b0:371:8688:1660 with SMTP id ffacd0b85a97d-37d0e8f730fmr7003939f8f.51.1728291473181;
        Mon, 07 Oct 2024 01:57:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a99f:3c24:fa3b:1e7? ([2a01:e0a:982:cbb0:a99f:3c24:fa3b:1e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1691a55csm5206567f8f.37.2024.10.07.01.57.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 01:57:52 -0700 (PDT)
Message-ID: <f2db1521-0fc4-4cc7-b195-498e2a900191@linaro.org>
Date: Mon, 7 Oct 2024 10:57:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: mmc: document mmc-slot
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240920-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v2-0-5aa8bdfe01af@linaro.org>
 <20240920-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v2-2-5aa8bdfe01af@linaro.org>
 <5o2q5kmchnr3e4opmtp2xq3xqlzkq2hudecd5fszamoav4twhb@o3kcftkoxwzg>
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
In-Reply-To: <5o2q5kmchnr3e4opmtp2xq3xqlzkq2hudecd5fszamoav4twhb@o3kcftkoxwzg>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_015755_476888_D7766AD9 
X-CRM114-Status: GOOD (  16.25  )
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

On 24/09/2024 11:15, Krzysztof Kozlowski wrote:
> On Fri, Sep 20, 2024 at 10:38:04AM +0200, Neil Armstrong wrote:
>> Document the mmc-slot, which is a subnode of a multi-slot
>> MMC controlle, each slot is represented as a full MMC controller,
> 
> typo: controller
> 
>> the top node handling all the shared resources and slot mux.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../devicetree/bindings/mmc/mmc-slot.yaml          | 40 ++++++++++++++++++++++
>>   1 file changed, 40 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mmc/mmc-slot.yaml b/Documentation/devicetree/bindings/mmc/mmc-slot.yaml
>> new file mode 100644
>> index 000000000000..c30eda4fd2a6
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mmc/mmc-slot.yaml
>> @@ -0,0 +1,40 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mmc/mmc-slot.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MMC/SD/SDIO slot of a multi-slot controller
>> +
>> +maintainers:
>> +  - Ulf Hansson <ulf.hansson@linaro.org>
>> +
> 
> description here saying what is the MMC slot, e.g. what you wrote in
> commit msg.

Right will fix the description, bad copy paste

> 
>> +allOf:
>> +  - $ref: mmc-controller.yaml
>> +
> 
> Just to be sure - the slots do not have dedicated resources like clocks,
> resets, power supplies, right? IOW, it is indeed one device which
> exposes multiple controllers?

Yes exact, resources are common to the slots

> 
>> +properties:
>> +  compatible:
>> +    const: mmc-slot
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +unevaluatedProperties: false
> 
> Best regards,
> Krzysztof
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
