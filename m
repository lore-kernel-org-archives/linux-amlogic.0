Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0871C02192
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Feb 2025 09:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0s2F5qakl3XCESlqHZTuhkP4VPZCqB8YN7FReZkjW74=; b=izGNZ7QqsLNENTss5iJSqwXAxe
	0UBhSN2+EnvYP69nmyaHZHIVdHwPecCM5HapJ/jtBYWQjHSrzsTQSKIVmIbrX1EHpPkofbRHFldIt
	7nf9+Pel0g6lGB4Jirlzs2B4AVwT45azNSsHtNv0cri0us3g30u4uCRjrPyAeCAXaNtWdGqZolCWT
	QD4faZ2MD4beHyCr3uxb/0+NbH/eTezzakzL7V/AR84Ut7A3/KBWyGnfdBi0L1WC8aeocOgk+ghYh
	6WQZDcAxaXYTTiLXBYETAEf/V2Bi95JVe5oyNtnERuGB1lLDWyDJv7MtiqrX+AiQTEFBGC2kR5xUv
	gzeOASNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKIL-00000008w9a-25PX;
	Fri, 07 Feb 2025 09:05:05 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgK8d-00000008tfY-2XO5
	for linux-amlogic@lists.infradead.org;
	Fri, 07 Feb 2025 08:55:05 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-38dcab4b0e1so317531f8f.0
        for <linux-amlogic@lists.infradead.org>; Fri, 07 Feb 2025 00:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738918501; x=1739523301; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4NA/X6pVv6MhxU2rOACQGZ3o3qUufdc5q7/UZzaZAT4=;
        b=Pc+6tnviEnlwGdKXBQ+eqER4c5K80qxbxHbUHKGhUNxvKU/tnCAuw9K/fWVTULzucy
         5279el/WDQc839MEhoDD42CdTJbsdJtddVd//0u1puJlcTFC4A1aNOg0qqNWcPEmJaIC
         HEwjrFW4LzwgGZMMM6jmRCgfc41GS44LmeQSaLi+zDFp9GZxBKX7zlkOK9ATJs3yrGiP
         wIyyQMado1Buh3zBpaWTA4DHSCg7+SJOg8Y/BHkDu4HX8mT5UebOz3eFdtcqCyKJuO6k
         r+aSECXU+KLW/mCe8V+m6Eyddxcvex8MgAU0sTfavr6md2kvSMdhc6llmmDyx517NaLj
         TAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738918501; x=1739523301;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4NA/X6pVv6MhxU2rOACQGZ3o3qUufdc5q7/UZzaZAT4=;
        b=n850rmgJlYTxXJOBNiF6ujl+C0NxkfTcBoLRTHv1b0GuEWQDfRpWpA8SMW2iSXV2Eg
         MwOwl447r/r0eOCkuLnKVOhd46Fo8DaO0wD5+b8KsEpzXOZIl7WertJ2BHUOjgE63can
         cdMzdm08wCwbIbJogCnumcj6PH5tP7SEzcSau7RT8C11QLGKuavZqe0wYn2Zhchf8v8i
         f8j24ZGIWqIHSFeBg2vzS6F2/hi8YcFMla8O7ALZ/h/j/P4AnAWJQEune2lRb/ELMlgl
         1KeaMsMb8p52v1OLFh3mA4jI51RJNeAhK4Mm9RQ4XnTEkM/B90IljUqJmwGtsnwGI9KC
         qAag==
X-Forwarded-Encrypted: i=1; AJvYcCUuyfruu3QljjqL3ufoWu2jAQ5RVo89LnS+6UaAWgibyB7F5fWGG6GLrAhLH7RY19O6XqyvJV8V52lmsCjZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzsOUe01nXSG+cVgr6bdb2R693hrdNe/uyNSFy/lbcf/R/zEb70
	3BNsezJEwl5unzEIyXbDcNvHoCmN174kXWvKVTmrzPdkqCEqOnT4HXz5lZ+40ro=
X-Gm-Gg: ASbGncuDRrjx9l6nOp6zdP4nmoYKTDzNfcs/PiPEU52eFe5YTYWIPwAYP048Su7HVxs
	U8xkQZR19E45/i8XnUEhC65QyyKMd065t/EaogvB30cgqii8PqtJP992GZ9ePnv0sdR/wQJ5gYM
	9+56Ov9abZSomlQVDG54BdscdEGL7mUnGkrIVR9mfcSB8ftoBKYEcdaaJzAGDA47QGkiLDdZ00B
	YEQDuDrb3u1pEbG+iR8YKG1Tyg8Aqm9vaIYc4QB8WhTc09jQlOfWSUNnjN8KwRAk8L8mYzsYCVM
	i9fcaDp4Lqxwl9b+F/AO/tB5CD8HPObjBKIu50WvPVUgLW2kKtkpGMz0LORdVYMkz79K
X-Google-Smtp-Source: AGHT+IH/4XDsyicpqDQ9Y3WcFD83TXmZ51RuwSfEt0UMQTshRCiwBSTUAjS4DsFc8GU0SU2TumjluQ==
X-Received: by 2002:a05:6000:dd0:b0:386:37f5:99e7 with SMTP id ffacd0b85a97d-38dc91133aamr1353355f8f.33.1738918501273;
        Fri, 07 Feb 2025 00:55:01 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5b26:96be:712e:30cd? ([2a01:e0a:982:cbb0:5b26:96be:712e:30cd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94db77sm82525305e9.15.2025.02.07.00.55.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 00:55:00 -0800 (PST)
Message-ID: <f6d7ffa0-6c08-45fb-9153-5e4aad1ca86a@linaro.org>
Date: Fri, 7 Feb 2025 09:55:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC v2] dt-bindings: mmc: mmc-slot: make compatible
 property optional
To: Dharma Balasubiramani <dharma.b@microchip.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250205-mmc-slot-v2-1-da3c5f30e2d9@microchip.com>
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
In-Reply-To: <20250205-mmc-slot-v2-1-da3c5f30e2d9@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_005503_661472_32F35CC7 
X-CRM114-Status: GOOD (  13.80  )
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

On 05/02/2025 04:48, Dharma Balasubiramani wrote:
> Remove the compatible property from the list of required properties and
> mark it as optional.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> ---
> Changes in v2:
> - Instead of moving the compatible string to the other binding, just make it
>    optional (remove from required list).
> - Link to v1: https://lore.kernel.org/r/20241219-mmc-slot-v1-1-dfc747a3d3fb@microchip.com
> ---
>   Documentation/devicetree/bindings/mmc/mmc-slot.yaml | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mmc-slot.yaml b/Documentation/devicetree/bindings/mmc/mmc-slot.yaml
> index 1f0667828063..ca3d0114bfc6 100644
> --- a/Documentation/devicetree/bindings/mmc/mmc-slot.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mmc-slot.yaml
> @@ -29,7 +29,6 @@ properties:
>       maxItems: 1
>   
>   required:
> -  - compatible
>     - reg

If you remove it from here then it's still required in Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.yaml
so please add it.

Thanks,
Neil

>   
>   unevaluatedProperties: false
> 
> ---
> base-commit: 40b8e93e17bff4a4e0cc129e04f9fdf5daa5397e
> change-id: 20241219-mmc-slot-0574889daea3
> 
> Best regards,


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
