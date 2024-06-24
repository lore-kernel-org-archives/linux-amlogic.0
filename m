Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A138C2BD09
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Jun 2024 09:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KrA+Zhu+E6JYI5iBCSEZ/4xfLGid6wh6hEzvDl1iu60=; b=yYSujXHVbJNWDEK1Ssfhi11pNL
	ZKoud762rv2o85fBudFhF0MUckhG27dPKsAgHoM+GxmR0pvmEMOhxdXaWMT0lTS1fpheIDfKqhhN3
	Ax3bzrS8sH0TDX6DfE7Ognw5omjuTs+IVtFr4zFQE+aX+q0fY1uxKu1doB4c9jrn2FK8AYhOOpuS5
	GWXKJmrEsru/HLt09vsiW9TanjgbprfNul6RSJpvlMV7pBAW6og1yatWnBB8YR7P57H0WzvBd23X5
	/9rKgSeMX1wA9W0P0gyu8arM9WAXpy6ER6HEi/Y3o53tF7hy4Dm6VQdXseqQaJDjfA/xQ9041s8ko
	uOni5nVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLgH0-0000000GIhE-0Umc;
	Mon, 24 Jun 2024 09:46:06 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLgGo-0000000GIbu-3K0V
	for linux-amlogic@lists.infradead.org;
	Mon, 24 Jun 2024 09:45:57 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4217d808034so34144565e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 24 Jun 2024 02:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719222353; x=1719827153; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xSpYP2Iym3bwarcuBRBNMRWDCe6BmBEhKzjcWG+ymbg=;
        b=bRvZjuzb/j+jsatHnpdCarEh3xv5tccLsbqZtgq+KI7W5deL4O157iohHMZfJMhQx0
         R3qVxbcRqr+XuN5isuykYzKNL6sbZS7CrBEgG/L1UB6d1O5tJws9aXyfXWv3wkJgPeHq
         tesb8JPmvoDlSRf9WDFZnIwBobCjTxHjhk/3uP8zJbUNogg4bezxU2GnrveEiHbCnf3j
         ERQgrPs3d6dqE5z50YHmn3Eb54anS7b8wlo1TX24sd7Q/xE6YTiXRVsBxqYvFh7KbZpR
         9QTSKnyAonSQ4i3ZCYAy3+B0uFa4X8k4oa/OF+WcO5319sXU0BNBSXHuYtlF4+/he3TB
         rCMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719222353; x=1719827153;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xSpYP2Iym3bwarcuBRBNMRWDCe6BmBEhKzjcWG+ymbg=;
        b=QmvOhgUKqeIO8AqrLPua3eMk6/s0u+XLz+E5BQZcmcsjglXPS8bIqnCfy3b+0o/MV6
         JXtIMKW/6CJc5ikitqC3iFHKH0Y+6kgtFANhV4LKsmTQjOK8LhRh1GNE6yFbq8kJhj6j
         7RbO8jLJHsz6pUoM4GwNYAPee9kU01OM05hUZUoLVvAr6rWKO9jQj6+RjejNiRUUElZp
         B1EfcwJJi57JAVKzPLxqvv7bSQf5ssADgRZpavyIJgtUcXw990fsTfQm47S1SrqMe2W/
         sq/19hqh3J3HFLBFFNXbxcO9+DuRHc41XB8wG6mglFxYueg0MitNOSr34WNGjl9eSw2J
         Ay3A==
X-Forwarded-Encrypted: i=1; AJvYcCW55qmy0yBloS5/FAKw40tjYZvw6IybUKoO0nQNvfvwnIGMy3V/omo6BchnaGmzV3pWD0Lc5wdZha8r8THs2a0IzHsDVC4iGMyOCUxKHx1+5E4=
X-Gm-Message-State: AOJu0YxwLnrl+dpU7y9HpHMbELyTablYRbd/PMc7Ef+n4CEmRmcV/g6U
	zS/YPi0r27DsuuXgpG7t6eJymFfoV5Y8+m6IrDPOUFUtSkBeoRa1fNi93LShKFo=
X-Google-Smtp-Source: AGHT+IHwmyNB9aKoz1MIv6/1l04rb0OspYjduoAUVUkNgENHzl/1WE4d0EqJCub9g86nEDKLZz6Q6Q==
X-Received: by 2002:a05:600c:2256:b0:424:9582:abf with SMTP id 5b1f17b1804b1-42495820dabmr8860815e9.26.1719222352479;
        Mon, 24 Jun 2024 02:45:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:cf01:774b:55fd:ab74? ([2a01:e0a:982:cbb0:cf01:774b:55fd:ab74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0bea05sm167078615e9.18.2024.06.24.02.45.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 02:45:52 -0700 (PDT)
Message-ID: <4c4c7840-917e-4d00-b8a4-b97a01ca2e6a@linaro.org>
Date: Mon, 24 Jun 2024 11:45:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: ad402: fix thermal zone node name
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240624-topic-amlogic-upstream-bindings-fixes-dts-round-2-v1-1-0a21f456eb8d@linaro.org>
 <1ad3429c-0bad-4662-bc9d-b912f88e7b3a@kernel.org>
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
In-Reply-To: <1ad3429c-0bad-4662-bc9d-b912f88e7b3a@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_024555_058459_169D600A 
X-CRM114-Status: GOOD (  13.54  )
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

On 24/06/2024 11:28, Krzysztof Kozlowski wrote:
> On 24/06/2024 10:59, Neil Armstrong wrote:
>> Fixes the following:
>> thermal-zones: 'soc_thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
>>          from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>>
>> Fixes: 593ab951232b ("arm64: dts: amlogic: ad402: setup thermal-zones")
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   arch/arm64/boot/dts/amlogic/meson-a1-ad402.dts | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-a1-ad402.dts b/arch/arm64/boot/dts/amlogic/meson-a1-ad402.dts
>> index 6883471a93b4..0d92f5253b64 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-a1-ad402.dts
>> +++ b/arch/arm64/boot/dts/amlogic/meson-a1-ad402.dts
>> @@ -86,7 +86,7 @@ vddio_1v8: regulator-vddio-1v8 {
>>   	};
>>   
>>   	thermal-zones {
>> -		soc_thermal: soc_thermal {
>> +		soc_thermal: soc-thermal {
> 
> I was fixing all underscores... but then mentioned above commit
> re-introduced them.

Sorry about that, I'm removing all dtbs check errors, so I'll be able to spot
this before merging anything now !

> 
> Some fixes need to be done more than once to stick. :)
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> >
> Best regards,
> Krzysztof
> 

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
