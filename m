Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D0EC4167B
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Nov 2023 09:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CBk3VUtds4DqiDBblyNWtoW7cTzm7IO7oM1YnGIfDcE=; b=vnZwtUc/uyXw3SGI9jnq/Ej3Rn
	bYcVwhWr5y3tsYihVqOTXxtI81H3o01YEc1rRgU9dpXIkELr3rRmHWIO1spWABCbvKBGuEQMnPJIZ
	x2sIp2C9cxU1cLJdZGdTVrP68DaGHbuIi4oZ+e6r4TbHB2SJzhdIscfmjesjn9AqetlaqYdYFYyDI
	iWJ/mLbNTE+D+pYVAp59deCexxgvrhw/RWnXorLLyg7Iav9M4E6JpDlVompzlKEiExAUXyJVwi7aS
	8dW2mQmywswZYMeaBsZTuenTkvZZRG4FbMFQdcPgnfe++Py9A5wg74Csn672vVS4ytDr9zq/EEPJT
	Qqcfr17Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8d6m-00AIaG-2C;
	Thu, 30 Nov 2023 09:13:20 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8d6k-00AIYY-0P
	for linux-amlogic@lists.infradead.org;
	Thu, 30 Nov 2023 09:13:20 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3331752d2b9so483670f8f.3
        for <linux-amlogic@lists.infradead.org>; Thu, 30 Nov 2023 01:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701335594; x=1701940394; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JucOyRuowajl55FaVJkCJ+iCL38xKPC8u2xNBw30DGI=;
        b=dq9AMvBYojYTtn8f11SYmnH14RMNG7F+vHpEVapySxcj6cG665QnF2jFC2HFTS9XGy
         87/OEUcj+vhpxtDWulj2zTeoPG+BSN5NwgEX+BpgDqLi1uAR9asIC0faOnE4YDERLkBs
         D02dr5BmZlFrAGWnjY/CZdQJJrg5qvcutz1RLNcJ8Mc/DJZrrJSkyaNvlXyWB+LVH42U
         8VR8XBGXKr4B+u+jKBoOZzsCWYjiG4GqXZFhdwcK4l24jHIlkLpjKZoRwoErL6qX0VFM
         a7TgIlJ2smh67j//WxqgRA7WC+KcbtIUCQIDyn3CX+eoYGCldUt/rkyR/8bJdCkYZG6W
         DRig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701335594; x=1701940394;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JucOyRuowajl55FaVJkCJ+iCL38xKPC8u2xNBw30DGI=;
        b=l5VdTXojdG541K26zwg9FJbwWjrOCcKljH8BX3/HcSZzsUqHW/V/ItAKPunx89+qnl
         fM0tdx0+bp6xClGNgbexsN9rlyg3xsTQKb9gxoy3nX2w8rarQUF+aA+f8Kf3x2uUIiVW
         KlyPYVSylAFI5BtWSOgVkFYN9WrpOZ6U5s76PP7040Hfr6zJIdpz0EFYcs03J4MybcMl
         1xQHS+nnSBKek+D/9sY+tHhj/vw2qexznPNzaMzv+wWTh30ovW2/ij4hdv9AkUDzNOib
         9lx87OSAmTog1ankltRGoMNM2WaNsTyNw5PbZX5w5VJABNotqk9kxxv1ROh0Dkjk4TR7
         fIdQ==
X-Gm-Message-State: AOJu0Yy6+XUecof6CFJyXkj4XtwtSCr65mllvlie0ABVTDKuaMGJqby2
	11/KQB5bMGyHZykV4/Sp14HGPQ==
X-Google-Smtp-Source: AGHT+IEwXMs51EeZF9IX22o6sl11L9KxmNjzlGnL8883eDT+U1ZjMdU5LdOCDfssHg7g38EHbxJtHg==
X-Received: by 2002:adf:ea84:0:b0:332:eb80:874a with SMTP id s4-20020adfea84000000b00332eb80874amr16055939wrm.1.1701335594169;
        Thu, 30 Nov 2023 01:13:14 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:41c9:3acd:a6e2:5242? ([2a01:e0a:982:cbb0:41c9:3acd:a6e2:5242])
        by smtp.gmail.com with ESMTPSA id r13-20020adfe68d000000b00333040a4752sm954872wrm.114.2023.11.30.01.13.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 01:13:13 -0800 (PST)
Message-ID: <f572c729-d007-46b4-b7ac-442f96b23969@linaro.org>
Date: Thu, 30 Nov 2023 10:13:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 2/4] dt-bindings: pwm: amlogic: add new compatible for
 meson8 pwm type
Content-Language: en-US, fr
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>
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
 <11f8d986-3e97-4191-b46c-ad3166ee6dc7@linaro.org>
 <e127dcef-3149-443a-9a8c-d24ef4054f09@linaro.org>
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
In-Reply-To: <e127dcef-3149-443a-9a8c-d24ef4054f09@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_011318_162262_F59EB820 
X-CRM114-Status: GOOD (  16.78  )
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

On 30/11/2023 09:36, Krzysztof Kozlowski wrote:
> On 29/11/2023 17:41, neil.armstrong@linaro.org wrote:
>>>>>     .../devicetree/bindings/pwm/pwm-amlogic.yaml  | 52 ++++++++++++++++---
>>>>>     1 file changed, 46 insertions(+), 6 deletions(-)
>>>>> diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>>>>> b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>>>>> index 387976ed36d5..eece390114a3 100644
>>>>> --- a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>>>>> +++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>>>>> @@ -21,23 +21,35 @@ properties:
>>>>>               - amlogic,meson-g12a-ee-pwm
>>>>>               - amlogic,meson-g12a-ao-pwm-ab
>>>>>               - amlogic,meson-g12a-ao-pwm-cd
>>>>> -          - amlogic,meson-s4-pwm
>>>>> +        deprecated: true
>>>>>           - items:
>>>>>               - const: amlogic,meson-gx-pwm
>>>>>               - const: amlogic,meson-gxbb-pwm
>>>>> +        deprecated: true
>>>>>           - items:
>>>>>               - const: amlogic,meson-gx-ao-pwm
>>>>>               - const: amlogic,meson-gxbb-ao-pwm
>>>>> +        deprecated: true
>>>>>           - items:
>>>>>               - const: amlogic,meson8-pwm
>>>>>               - const: amlogic,meson8b-pwm
>>>>> +        deprecated: true
>>>>
>>>> I think deprecated should be moved in a third patch
>>>
>>> The complain on v2 was that it was not clear the new binding was making
>>> the old one obsolete. It looked to me that the deprecation old bindings
>>> needed to go together with the introduction of the new.
>>>
>>> I don't mind one way or the other
>>>
>>> Is there a rule somewhere about this ?
>>
>> Not sure about that, I don't think it's a problem to have both valid
>> at the same time, setting them deprecated afterwards looks cleaner
>> to avoid mixing too much changes at the same time.
> 
> For me current order is correct and intuitive: you add new binding,
> because old binding was wrong, so the old binding should be deprecated.
> Otherwise you have a state with both new and old binding and one could
> question - why did we need new binding? For dtschema it does not matter,
> but it matters how we read the code.

Ack thx for the clarification

> 
> Best regards,
> Krzysztof
> 

Thanks,
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
