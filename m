Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B454FC4829C
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Feb 2024 17:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pENlyzFVt0aQ+cssT4fVw7eFwJvfzgMDewmWiWilEAY=; b=1uxiWjiKDxCItIToCyIKGGwcLT
	OScOBXor00BbFVM+9iT/J8xUvFNqsRAM+9qvBlLS5W1kWbXer0Fser0Q17NgDlO7r/6LzFp3KgKv9
	vK0aCvyhnt3EV+BJn4KNArZSSEgWeoQ3BkaGnB6j1xRpAeLn3vMDJap8VoG9jqMBJP1iEyixYGMGC
	0h36QzMB9apWkH3tPoGNTlUPP32ExjvZPocOZ7LbDAD8KzuX7Owl0infhEh+9CU7SX1WW6B5G93VZ
	YIjlABZJgzTBXXfblPf0aP9HnXak5b/OOr1LtGvVfjImkIi5PFoFvKmAHC+NjahQtJOaMIHoQL3tw
	jbGLJNMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZZja-00000006KIB-0WvJ;
	Mon, 12 Feb 2024 17:04:46 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZZjX-00000006KGB-3O9J
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Feb 2024 17:04:45 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-33b2960ff60so2549141f8f.1
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Feb 2024 09:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707757482; x=1708362282; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bY+FezK6qfZor6Fgr7NiCYHO1vkYOiYYWeDX1ETBgvU=;
        b=w4A6H5tyLpbeJlDnGX80jUBVcaJ8hDnQj9mk6u53nqJMFEVgO79mWtGkttRqN8tW0v
         pxE+og/SHvd227QbJyJR4QvkAIn5Bb0LFIk66pQoQUcbJsAq98GefXo+TKq+X+qbgRVA
         MTMIWEDrgP9JQqnBrZ+V3uN2I/nJorC9Zi6/rqYUV0Ts4uttFaL8F7n59GOdiLKyhkuy
         IGqcTw4dSSRxUaOGuZFz+f84950wMshHqNJ+KgxJPP8lARSdGa4w9LtOSCH8gWZ+ZqPz
         BGvSQVTJVHzty+BZPDzSYTHLkN+2tMWH/QDCldXKl/7KdnCD7V5Pgwps9org4cv/kl0s
         k+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707757482; x=1708362282;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bY+FezK6qfZor6Fgr7NiCYHO1vkYOiYYWeDX1ETBgvU=;
        b=ly4M3GouE76KObAKXnriBm89xSbV8hy88Q+laxaOTNeF/sb8diIKZzezk66IqmZ03C
         hJlN/uYQ8yEWgJS3oBijwOvaNn6qAGU8f48IkcxJyZZlKS72Uq7s3/GO8YxVpZQoa+sX
         /YCFeR4B6juVtwAlNe2U0a7OglBP58ymlQlbEHx0C/CJkP3eG40ZisArcsNVMew0uk/J
         mPS1cGBmig+uou4LslryRFZfwzmI8ozyRiXQzbzz2z8jImYU+nlAneA7dDX+8+8vjMvo
         9nxtosxkUc8ru3OzGl6gBzXesOY8lU4oCD0eMLNaQ9dLiVQWMcrWy1cmjsaF80IMSunQ
         LKMA==
X-Gm-Message-State: AOJu0YyJUc5cGMoIjnGZyF+UAMl4306k8cnRkXJfEkIXnLtuar7J8b4y
	+yQKP24lBvzzFiYpc76OY2kXD1bvThmceN/82k0dSLdA4ijmabiRV1e/SGAEjU4=
X-Google-Smtp-Source: AGHT+IH917SO5FmEX3J35E6xRhi+8kOsae4nQDGp7E5RuPWECrPya44xdXwKllEUNrt5OEkqyOkvuw==
X-Received: by 2002:a5d:4683:0:b0:33b:5979:8fd5 with SMTP id u3-20020a5d4683000000b0033b59798fd5mr94653wrq.15.1707757481779;
        Mon, 12 Feb 2024 09:04:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUrJEP0LYpi7JlYkopZBWm45VVZPsm7mXjm0XbJQIm3CiOLr6k8PXLU6cxtWR1X6GfR3oFWsS42pF9Uoea/WSI6Vm6jqZiH4YRhstN72JTpi61GS7Tsw2fyi3iqiU4DGYr1PuxWXnjvlyFUh847D07ydpbGA+3MXTntQQbeazOrOLNVtR4LENSJ1X18Krfnakm1a+50Icv3P06ZI3+o2CrsCJ5TniXBU/Dp8m83u0PKYnntfv+UEBzP/fNgeKHsTFKlWU0V6r9mqHzW5qxFmj7RAm02G5eHuEXMq8qlpUW0OiuzTiz26cywDzkBsh44STfame2HLIWuceTGOphLkRRMLR91CosMksbfPZZmPpGV13CQm9Zuv8qDe7eVGfYoTD+yWh86dSN9Yxg4UgMIXn6sM5c9sj5BNf9OjH2S0CS+FmZKI0gC5U/9Zzl85c/AFqWjYGm1P0AdUU7lO86kce3/LI0+YkEDldUXBfYtE7ieSmBjEmcnds00YiitwUIoP6GqP11UIgtn2w4/IqPIMF0lv83ntnIGUwJ6lwZu6jX3kKhOzSMxSU6kQNdri2khZn+1IBBEShNaFLw5ObiHU47eyLFt6SvW9nGh
Received: from ?IPV6:2a01:e0a:982:cbb0:fcee:f026:296d:135f? ([2a01:e0a:982:cbb0:fcee:f026:296d:135f])
        by smtp.gmail.com with ESMTPSA id h16-20020a05600c351000b00410e6a6403esm2462229wmq.34.2024.02.12.09.04.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 09:04:41 -0800 (PST)
Message-ID: <e490c717-338e-4b43-a9b2-17d5358c4dd1@linaro.org>
Date: Mon, 12 Feb 2024 18:04:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 18/20] arch: arm64: dts: meson: s4: add crypto node
Content-Language: en-US, fr
To: Alexey Romanov <avromanov@salutedevices.com>, clabbe@baylibre.com,
 herbert@gondor.apana.org.au, davem@davemloft.net, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, vadim.fedorenko@linux.dev
Cc: linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@salutedevices.com
References: <20240212135108.549755-1-avromanov@salutedevices.com>
 <20240212135108.549755-19-avromanov@salutedevices.com>
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
In-Reply-To: <20240212135108.549755-19-avromanov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_090443_930487_93AFE01B 
X-CRM114-Status: GOOD (  12.16  )
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

On 12/02/2024 14:51, Alexey Romanov wrote:
> This patch adds a crypto node declaration for Amlogic S4-series.
> With the Amlogic crypto driver we can use HW implementation
> of SHA1/224/256 and AES algo.
> 
> Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index ce90b35686a2..dc05e2c5da3b 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -339,6 +339,12 @@ mux {
>   
>   			};
>   
> +			crypto: crypto@440400 {
> +				compatible = "amlogic,s4-crypto", "amlogic,g12a-crypto";
> +				reg = <0x0 0x440400 0x0 0x48>;
> +				interrupts = <GIC_SPI 24 IRQ_TYPE_EDGE_RISING>;
> +			};
> +
>   			gpio_intc: interrupt-controller@4080 {
>   				compatible = "amlogic,meson-s4-gpio-intc",
>   					     "amlogic,meson-gpio-intc";

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
