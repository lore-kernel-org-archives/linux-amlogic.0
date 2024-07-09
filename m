Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE3BEC3DA41
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Jul 2024 08:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ygGKEf/hcGXiszPpNwfef/yeAUdC9WqAyqoD/XJqJLk=; b=1QFF6vtGw0ab5RLL4AhhDh+0zU
	hxtIR0hE87v/p+QhHYXkC5WxDtMJxzihdZzMbpJ3JNiLwwQTrAzL7+bF371Y/8sF/GsSnMIEQfTjE
	N0SuPxSB/kMsCUwnHxqqAPmGQokh4J1LV89DJL+npZVnfF+TQqrDexZAV7kcNhFImP8e+8ZppOWRZ
	vefWbmqy9qT/GAXEL+bOcTL/RjLrCMsprr9egr/apEAkcENcNL/DuN0VWeSbDCKDWCuLayvKTcy11
	JnmugDdIwP795cb4VVOClgNEyQBb0LOg4MXURKTzBphdwqhFJK9fjx0VnbMPMq0ORi+h4Yk2mfljl
	3wIib9OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR6eZ-00000006V4u-1Xpo;
	Tue, 09 Jul 2024 08:56:51 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR6eS-00000006V05-1Fgo
	for linux-amlogic@lists.infradead.org;
	Tue, 09 Jul 2024 08:56:45 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4266eda81c5so9640745e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 09 Jul 2024 01:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720515402; x=1721120202; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N6JCs78VemHVLXAEu6lpNSjjhDkuEB/scHH4X5narOY=;
        b=Zeyx/cm2SvZt6VUxB8Tl3mHDCpsjpqxxNpA7LBTKxsCNDys98dH1kbYDPdC489P3M9
         GNH3oyJrIoKj9iEBiu71UnyV0buu3vqoT/JZZLX0nkyouBPMw6fedFiLdjROTqd342ya
         gNukmZzlpwVFuW/xRlpOX+uSwv+3xfRGR5QcTBSjDUj6M8DgLS3OQEn2tY1ZScC+7Jav
         aosiajotfxmQR3mfnBW9j1dvKSIJbHUKH7vTs2J4e4hZnv/sMgq7ScTP2QHrDXRiQWil
         1CeGsxKWP8mwqNDo/Ctp6K3rPGbkluOjbBRTxOcFbqbFZyimXi09VkK9M0H9VN1ZFb34
         70Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720515402; x=1721120202;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=N6JCs78VemHVLXAEu6lpNSjjhDkuEB/scHH4X5narOY=;
        b=VLwLe1CRHiNg1SkLYFySxteUJ9mia+QQnCZGvR+srUf/XFYsWHZI04I42cUYhcSzXg
         7j0Zm2jHmw2erSd0FL7EfkspzOl6l9ncTtmCC3lf9cjFFlR4t+TCjdTHu/r1F8S0K754
         VWYk3SLiik7BMInV9ud2wsGiVtGokIe5TKYkYLFpGxCRGjSL/10ZyOv80hpYK8TrlwCm
         1xYZJyjFcEE0lkoCufnoTBlXz52lk3CqSb8IO5OPU1l07CUgaogjrzCe2nSuC7N4Jl93
         jWBTduvt4GIZW5yw4aQ/35Aiqe4qAs60sPHpMZe/BbSeavH3LK3Fz3261ZftD2PaUbtV
         oqSQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5B+ES3TVkINQJLBSQmq8PZu/+kB1+ZbygPaTea65sTz7g4qj2oD+cVmonlmVR38lhLZg7hHdG4Q8GHnClsnebK9+XO2Y8D6vrVMsX35tsGiY=
X-Gm-Message-State: AOJu0YzeaTxrrEDkvJwrAnus7NrAGfTYFh/l57IBjSyH0svDTXVIbIxu
	9dtcHA0M+CBR4RbWDrjlqLM1xMUKR03EYGDxAVCfOLHZK+pKkjiFf7RpYVblSjc=
X-Google-Smtp-Source: AGHT+IGl0QCPQ3RtBPhEJx9xP2Qga0g9dxUHEMpPlS8Y3PEVe0Ejn3U5/SxbK1zEVuMX9qiiIAaEow==
X-Received: by 2002:a05:600c:2057:b0:426:52a5:1ca4 with SMTP id 5b1f17b1804b1-426707db724mr15635825e9.21.1720515402453;
        Tue, 09 Jul 2024 01:56:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:b12a:8461:5e2a:dfe? ([2a01:e0a:cad:2140:b12a:8461:5e2a:dfe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f6f1138sm30698455e9.19.2024.07.09.01.56.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 01:56:42 -0700 (PDT)
Message-ID: <9bb13c8a-1452-4a83-b4fa-04c17c8a0819@linaro.org>
Date: Tue, 9 Jul 2024 10:56:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/4] dt-bindings: i2c: amlogic,meson6-i2c: add optional
 power-domains
To: George Stark <gnstark@salutedevices.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 hkallweit1@gmail.com, broonie@kernel.org, glaroque@baylibre.com,
 rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com,
 lukasz.luba@arm.com, b.galvani@gmail.com, mmkurbanov@sberdevices.ru
Cc: linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@salutedevices.com
References: <20240708194808.1819185-1-gnstark@salutedevices.com>
 <20240708194808.1819185-3-gnstark@salutedevices.com>
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
In-Reply-To: <20240708194808.1819185-3-gnstark@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_015644_392452_EC596F3C 
X-CRM114-Status: GOOD (  10.81  )
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

On 08/07/2024 21:48, George Stark wrote:
> On newer SoCs, the I2C hardware can require a power domain to operate.
> Since the same compatible is used for older and newer SoCs make
> power-domains property optional.
> 
> Signed-off-by: George Stark <gnstark@salutedevices.com>
> ---
>   Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml b/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
> index 26bed558c6b8..c4cc8af18280 100644
> --- a/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
> @@ -30,6 +30,9 @@ properties:
>     clocks:
>       minItems: 1
>   
> +  power-domains:
> +    maxItems: 1
> +
>   required:
>     - compatible
>     - reg

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
