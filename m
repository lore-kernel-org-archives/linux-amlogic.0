Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51CA0C54E76
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Nov 2023 09:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ZLkt07IeDEPNgsdUoDFgK7di5fP/oR97iUgRpBKK3U=; b=fi0Rt3KLxj+x1UbaM7UDdCw6Vi
	woJsBFrTC4AQlBx54Mysf6J0Y/UyPsUe7PztXKTqeUeha8B8CobcY2LWlOw2DJhEYMYuA1r+0WuW9
	vaCoXaiFZnsHCdISVBr4zdwrVDI3TCIqFWL0PsbuhaXD1/CtB68o2Oz1aVRwhbeNKZtAO7gufqceR
	RSaN7EySRorLhJrD78AXQVT7quYW5cusmVMh7SqcOXLL1ynVBiNI+TrrEOTZi+Sgv26Pn5/QuPtsy
	6R0Lg/4zJGQEctbvKF0JP0UAUSonLtjaNPE9XpDNRT9OlaXMcLweB/qUnwpcyyVM6pIgwpQzqhULN
	1N3kr+3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r510T-00BhLv-02;
	Mon, 20 Nov 2023 09:55:53 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r510M-00BhIY-0S
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Nov 2023 09:55:51 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4084b0223ccso14325505e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Nov 2023 01:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700474143; x=1701078943; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z/fgPwc0eJeHKzVZ0LNgK+ADmeLq8vaZ9kNwx7EAjKs=;
        b=k2kSqyzTGBlJ4JvmRlTv4Ytded9Yh0I/rd8/u85reg+FeNDekWbfvdDnGCVWz9DgnG
         vj582iAIkN4VqBaDbcAhH09rsxnizGWHssZ2LOSZjySh6TECFcFkBP1ZckPJNps31zam
         rjLf0beBp9Puoh9DPPrsu0p+B0/4FWT2YO7hqt8XmBurdM117YTzF3ZVNiZ9hntA5UII
         2QBrtXz80C9dSQZQZXAXQ1kxPjgacZ0i4o5gEe/yZ05Ldx85oLKXHJU+sOQcq/WEup/d
         TP92rwtiOZBSoU4iIEX/dvALRK38ILXhVCewpAdm5aiemE+29LTnnbWQgIvscYv6ccBC
         ZYzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700474143; x=1701078943;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=z/fgPwc0eJeHKzVZ0LNgK+ADmeLq8vaZ9kNwx7EAjKs=;
        b=IbTYvEDeLqoVaNZLzdiiCko4ggtwn388tNq1LpdDVwJEkniIds4qNf5ktXNSC+w5/g
         5VEGfvz/y+Ir8A0e+oFdSyMzftfILw5XWn/1TqSKSnZIDdevCRBpKOLwUv8clPhBzbaW
         jN9GnyyYomqwBwC61LK2E/mo0+h43PhnMl97kcUdJlpBFnnY6wMmcsgmTd8ML+DyNeeU
         gTOYIOH89RA+P7nartqUm6p9w8L+nYyTsSMGeadvLt2knIzVv5kWB82EYSlMgGeQ9r2D
         k3kW1AbyEe2fmBCk+9nhfHQgnhkIiR51/pYWH5r83EgsQmKHPKlJe+MeaIfupowwxkB5
         f1wQ==
X-Gm-Message-State: AOJu0YzczHdRV3fs7sOFHEXb7nVIGZ4jrnksvDN7WhjNV/9L6/cMbVYE
	5ZLZK5NUqcAhPjUhI7uZC7T23A==
X-Google-Smtp-Source: AGHT+IFu375tvhXordR9b+2N0jAh7Rh1Ee35XAPBSYiGksbXeGO3wKimM4WedQWg6uHqfyibQIPx1A==
X-Received: by 2002:a05:600c:4507:b0:408:55f8:7de with SMTP id t7-20020a05600c450700b0040855f807demr4971695wmo.28.1700474143458;
        Mon, 20 Nov 2023 01:55:43 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:f04:f84b:d87d:1d06? ([2a01:e0a:982:cbb0:f04:f84b:d87d:1d06])
        by smtp.gmail.com with ESMTPSA id t14-20020a05600c450e00b003fee567235bsm17489914wmo.1.2023.11.20.01.55.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 01:55:43 -0800 (PST)
Message-ID: <2e7a65da-5c1d-4dd4-ac69-7559a53afdf3@linaro.org>
Date: Mon, 20 Nov 2023 10:55:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 2/6] dt-bindings: pwm: amlogic: add new compatible for
 meson8 pwm type
Content-Language: en-US, fr
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, JunYi Zhao <junyi.zhao@amlogic.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20231117125919.1696980-1-jbrunet@baylibre.com>
 <20231117125919.1696980-3-jbrunet@baylibre.com>
 <170040994064.269288.960284011884896046.robh@kernel.org>
 <4608012c-059f-4d6a-914b-e85ad0c32ff0@linaro.org>
 <1j5y1wg3sb.fsf@starbuckisacylon.baylibre.com>
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
In-Reply-To: <1j5y1wg3sb.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_015546_182442_6FB08005 
X-CRM114-Status: GOOD (  28.49  )
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

Hi Jerome,

On 20/11/2023 10:18, Jerome Brunet wrote:
> 
> On Mon 20 Nov 2023 at 09:27, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> 
>> Hi Rob,
>>
>> On 19/11/2023 17:05, Rob Herring wrote:
>>> On Fri, 17 Nov 2023 13:59:12 +0100, Jerome Brunet wrote:
>>>> Add a new compatible for the pwm found in the meson8 to sm1 Amlogic SoCs.
>>>>
>>>> The previous clock bindings for these SoCs described the driver and not the
>>>> HW itself. The clock provided was used to set the parent of the input clock
>>>> mux among the possible parents hard-coded in the driver.
>>>>
>>>> The new bindings allows to describe the actual clock inputs of the PWM in
>>>> DT, like most bindings do, instead of relying of hard-coded data.
>>>>
>>>> The new bindings make the old one deprecated.
>>>>
>>>> There is enough experience on this HW to know that the PWM is exactly the
>>>> same all the supported SoCs. There is no need for a per-SoC compatible.
>>>>
>>>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>>>> ---
>>>>    .../devicetree/bindings/pwm/pwm-amlogic.yaml  | 36 +++++++++++++++++--
>>>>    1 file changed, 34 insertions(+), 2 deletions(-)
>>>>
>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>>
>>
>> I'm puzzled, isn't it recommended to have a per-soc compatible now ?
> 
> I have specifically addressed this matter in the description,
> haven't I ? What good would it do in this case ?

Yes you did but I was asked for the last year+ that all new compatible
should be soc specific (while imprecise, in our care soc family should be ok),
with a possible semi-generic callback with an IP version or a first soc
implementing the IP.

> 
> Plus the definition of a SoC is very vague. One could argue that
> the content of the list bellow are vaguely defined families. Should we
> add meson8b, gxl, gxm, sm1 ? ... or even the actual SoC reference ?
> This list gets huge for no reason.

I think in our case soc family is reasonable since they share same silicon
design.

> 
> We know all existing PWM of this type are the same. We have been using
> them for years. It is not a new support we know nothing about.
> 
>>
>> I thought something like:
>> - items:
>>      - enum:
>>          - amlogic,gxbb-pwm
>>          - amlogic,axg-pwm
>>          - amlogic,g12a-pwm
>>      - const: amlogic,pwm-v1
> 
> I'm not sure I understand what you are suggesting here.
> Adding a "amlogic,pwm-v1" for the obsolete compatible ? No amlogic DT
> has that and I'm working to remove this type, so I don't get the point.
> 
>>
>> should be preferred instead of a single amlogic,meson8-pwm-v2 ?
> 
> This is named after the first SoC supporting the type.
> 
> Naming it amlogic,pwm-v2 would feel weird with the s4 coming after.
> Plus the doc specifically advise against this type of names.

The -v2 refers to a pure software/dt implementation versioning and not
an HW version, so I'm puzzled and I requires DT maintainers advice here.

Yes meson8b is the first "known" platform, even if I'm pretty sure meson6 has
the same pwm architecture, this is why "amlogic,pwm-v1" as fallback seems more
reasonable and s4 and later pwm could use the "amlogic,pwm-v2" fallback.

Neil
> 
>>
>> Neil
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
