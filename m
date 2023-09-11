Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B744EE57DF
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Sep 2023 15:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oI8k85Hq5p/+KnOQ0hieEncZIAvMRdFrFU+0DSvloOw=; b=Ol2S8jQrx77T0vbXtg4D5StYLa
	8Wpbro8YV1JYGuR5pfvy+QyAVZTYgHh5oycZXPtJPAuyjY27V5V49ZA/rODIT75qZNlgapJpTengr
	RnhksbA5Husx19HjbAhZQQGRgnron04hk/gZHjIsZXsEcrAEbG05+ybX5Fk1pi6mbstYIglLeMB+J
	BsMp7UnwiZI3KhgFQKXveqHY/4lp7V5s7xwmWKN/yltOoAAAucA+kcpurF3jsU2cDTvOAeUTNcEHz
	3xI2OuDYYntTnHoAqJXTGQXpPc+PzL3R+rhx8122+HrAUHEBxFxOjZFMKwp8e+iiuO8jaLxyk7CaD
	gLABjbjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfiSd-000oDy-0L;
	Mon, 11 Sep 2023 15:04:23 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfiSZ-000oBu-2L
	for linux-amlogic@lists.infradead.org;
	Mon, 11 Sep 2023 15:04:21 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-401b393df02so53392895e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 11 Sep 2023 08:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694444656; x=1695049456; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CBeRh4UL/KjS7sOnQvt2RLKcnJLFWHs8He3ceHHUyU0=;
        b=AIau0nZ8Br35mkO4HZxUrziBjIGKn1PoHlS0t5AbGIbONAyEnzVpNLxRFs6kyjaubw
         vubw9+58IY4WY2zUwHyERXv/pkA31fTo4t+LFrRamxzgUYFKJ6aTCzKJNzweed8vg3aY
         DKPD20A6CTg7Bhkvem5+n6v26G4OJjFn1BrOKCtSSeDr+7kcgQ9Qlyp5YVhlxWiafe4S
         HFKRjhxFFWo1B5dhl77BzhvEGl2ihrJixlQMAkv5SnpezxjPN0r6WfgfW8aiuD8dRraU
         Cz6kmK0wFCilTmFJDzPbSyX7kIIlu1Ay4Ah3CNdfApxE6aZEL0QoGcIqFRqb2fzDqEyM
         iUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694444656; x=1695049456;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CBeRh4UL/KjS7sOnQvt2RLKcnJLFWHs8He3ceHHUyU0=;
        b=WAvlBcnjy+eZcWXlsmmC70kakVm1BBbt0487W6nQzAlRL0bj8qOJCH9RbMfx3L71u5
         kvbTigpKywBsvT2T/OGEXzhzWZ4hf+gMNkNue/yVvTZNAX3mHoMwhE9f2zg0RHVicvdO
         OY5uzfYs80599RuIpV6eDAWuY1/uLByRuBpMraF+ee0i1FTP0dVijXVqNsyXNLEYX/Wh
         7uiUZwUt01atg5MmnDy++CYNrJTQ19+9RBiTECDXbYfTd8BuFh5cZ+2WTjoKti4l/9lZ
         9EwELTiIm4AI4RjvfWAqLuh7fPs9zOdYbYSsEONGBant9L0+6gMcufc1ctpJczleM7e1
         CKGg==
X-Gm-Message-State: AOJu0YxltgrVNkwq4kUSt9dLOcscXWbhCv2UhyNGiZ0h9WxRjwY4efPY
	uNdKQYzx+J2f4XNCmQ1q+ss9EQ==
X-Google-Smtp-Source: AGHT+IGzf5knanit7yknaBtEN0yONkhWmeBMadtWqyiRi3ZNLweDWoCrSEkgQfEZQMEz4SIdHEfD0w==
X-Received: by 2002:adf:ce0b:0:b0:319:68ce:2c53 with SMTP id p11-20020adfce0b000000b0031968ce2c53mr9380153wrn.25.1694444655591;
        Mon, 11 Sep 2023 08:04:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:daaa:8bc3:eeb7:ce8? ([2a01:e0a:982:cbb0:daaa:8bc3:eeb7:ce8])
        by smtp.gmail.com with ESMTPSA id l9-20020a5d4809000000b0031c6e1ea4c7sm10249933wrq.90.2023.09.11.08.04.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 08:04:14 -0700 (PDT)
Message-ID: <d4db98ca-85b7-4e3a-a40c-43c37e1de6e0@linaro.org>
Date: Mon, 11 Sep 2023 17:04:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH V3 RESEND 0/6] Power: T7: add power domain driver
Content-Language: en-US, fr
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>
References: <20230911025223.3433776-1-xianwei.zhao@amlogic.com>
 <CAPDyKFqTs=mRnBRREbT+WFj_4qTLd8LTKigY_1TAZOqGGUKk3A@mail.gmail.com>
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
In-Reply-To: <CAPDyKFqTs=mRnBRREbT+WFj_4qTLd8LTKigY_1TAZOqGGUKk3A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_080419_763679_40223A22 
X-CRM114-Status: GOOD (  13.93  )
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

On 11/09/2023 16:30, Ulf Hansson wrote:
> On Mon, 11 Sept 2023 at 04:52, Xianwei Zhao <xianwei.zhao@amlogic.com> wrote:
>>
>> First patch is that remove C3 some power domain ALWAYS_ON property.
>> Second patch is that add driver to support power parent node.
>> Third patch is that turn on power if initial power domain with
>> "AWAY_ON" property state is off.
>>
>> Other patchs adds power controller driver support for Amlogic T7 SoC.
>>
>> Changes Since v2:
>>   -Modify subject.
>>   -Define PWRC_NO_PARENT UINT_MAX
>>   -Remove modification that transform is_off into 1 or 0 using !!
>>
>> Changes Since v1:
>>   -Fix license from "GPL-2.0-only OR .*" to "GPL-2.0-only OR MIT".
>>   -Modify T7_NIC flag  "ALWAYS_ON"
>>
>> xianwei.zhao (6):
>>    genpd: amlogic: modify some power domains property
>>    genpd: amlogic: add driver to support power parent node
>>    genpd: amlogic: init power domain state
>>    dt-bindings: power: add Amlogic T7 power domains
>>    genpd: amlogic: Add support for T7 power domains controller
>>    arm64: dts: amlogic: t7: add power domain controller node
>>
>>   .../power/amlogic,meson-sec-pwrc.yaml         |   3 +-
>>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   |   6 +
>>   drivers/genpd/amlogic/meson-secure-pwrc.c     | 127 ++++++++++++++++--
>>   include/dt-bindings/power/amlogic,t7-pwrc.h   |  63 +++++++++
>>   4 files changed, 185 insertions(+), 14 deletions(-)
>>   create mode 100644 include/dt-bindings/power/amlogic,t7-pwrc.h
>>
>>
>> base-commit: 413f5c02929bb33042bbc4ee233166550a5fca70
>> --
>> 2.37.1
>>
> 
> Patch 1 to 5, applied for next!
> 
> The DT patch (patch4), is available on an immutable branch "genpd_dt" too.
> 
>  From now on, I will continue to put changes for genpd DT bindings on
> the above branch, to allow SoC maintainers to pull it in to manage
> potential dependent updates to DTS files.

Thanks, let's see how it works :-)

Neil

> 
> Kind regards
> Uffe


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
