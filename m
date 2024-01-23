Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B1EC47258
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Jan 2024 08:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZc3+9lGAUIYzoD4dYSoiZ6LW1YJLP58Apz2a0VtxK0=; b=kbQjqeg5hgYZHZV3sMFH5EX9Mw
	tGvDWdyB5m3qxMbILdTDwbeumnUizod+qbynbGXvsar6c29IRL/aTGqWCfic8iXUZBH9RS81NiidA
	Vh53sJwhmD8BYXz8XZB53wCmOxKVZwIHnh2FiYVgPH7uw/dh3HHgK7+7MgRLavI+z2iG9PjWyZdD3
	DWMqHwjVH278yKJc9izw3CmASwkmLqvTH1PnmofkK53WR/fu3URnKIVDYbaAawAvNEXhEk9l5CFP0
	DyqVx9I+VME/y7OZYwhOJbMratCH+looDU5aZorxxtNYVMUPYsg3BDrbKlf4l0zTWCzOTjijUzCZr
	a5gDPEDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSCI5-00Faeu-0v;
	Tue, 23 Jan 2024 08:37:53 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSCI3-00Fad0-0J
	for linux-amlogic@lists.infradead.org;
	Tue, 23 Jan 2024 08:37:52 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-338aca547d9so3183131f8f.0
        for <linux-amlogic@lists.infradead.org>; Tue, 23 Jan 2024 00:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705999069; x=1706603869; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lBsEPkL9C1nc9BB56ipg4dcCdJMuHydCT/0qtNDKizo=;
        b=wrDOqQJ+onQTeZLW74ZCYUd/rU8fUN/bwjqDwH16d9+A+yCDtUOQCGEzMzL5jgGZZX
         5Kt1vHyblIbqqH0hbqXy3Sd2ACNDP/FhP/sYrOWngSm0Q5MYSDkFOHRYZRHdnmIHhFF0
         1iRePJXnaUYLxIkGs+nzzfB8pOEyTbkOiUlltCpMSDablheFFCDTaPtak4d+2M203D2m
         exGVwvYxB5GQwj0VNKGSt3tPGDNraa1PaKScyQsKdDbXlAIhkJ3G3+jE0+/Jwf5v8B0z
         j0qZtVxLwFJ3AuE8cz9ZqnRXHPnbobwJaDVHCurw1aFRiz3k/m+mOp8niEeCvaTMtPoy
         /WBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705999069; x=1706603869;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lBsEPkL9C1nc9BB56ipg4dcCdJMuHydCT/0qtNDKizo=;
        b=At62Y1XARLQ7QH9JvRfRiJDoRhgo8eO7W+zK0jHWXKBBHpvZrHeYZbzl4KSUdDdlgb
         0HzwKvnpS0wb8L6S+uUHH6B6NMh8Lh6UerjDiZqFbPPLFu/8kZjsFV4ggHmvELLkdFGw
         YnSlFaHEcBS1H9erlaxsyheOwKWCpNAQnRjF5gK7qK7PzNjW9jjy5/VIHer2y6k46qzV
         MSBD/jEGNZQSQDEBCXiFQODEiz/I+nOBVO6RUNj/hJt4wbQm/VJpZMSIoCqQ75acY08J
         1RYNanloZBo5c7Yd7lOe3Pyx8zES82EHOwZgtrJrRcDYu6A0OgTqEfEV+ZbXRCMWiGIn
         LZ2w==
X-Gm-Message-State: AOJu0YwcUszHnchpFkZkDasOxSjYwL+iqHsP71ChlvOOMD+ED/5qofUc
	J6WltUmKb2YkKXO5rrGQYyXNnha1qJbYHZB50CfSrrsBEoDxMrqbI2pPi/5w0W8=
X-Google-Smtp-Source: AGHT+IHSMZJ0bwQErms6IhPKh2wJm0ffRn+UXIJEQKtYhy4afZa6O/xFK0SayBgF0P3Iy+Oel9EjhQ==
X-Received: by 2002:a05:6000:100a:b0:337:bef1:5091 with SMTP id a10-20020a056000100a00b00337bef15091mr1675562wrx.279.1705999069190;
        Tue, 23 Jan 2024 00:37:49 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:e70d:72be:6c73:25c2? ([2a01:e0a:982:cbb0:e70d:72be:6c73:25c2])
        by smtp.gmail.com with ESMTPSA id v16-20020a5d4b10000000b00337d4eed87asm12750162wrq.115.2024.01.23.00.37.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 00:37:48 -0800 (PST)
Message-ID: <d20dfc44-43b0-40b7-ae04-4559942e5210@linaro.org>
Date: Tue, 23 Jan 2024 09:37:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] dt-bindings: pinctrl: amlogic: narrow regex for unit
 address to hex numbers
Content-Language: en-US, fr
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240123083511.21063-1-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20240123083511.21063-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_003751_133065_9C4F82CE 
X-CRM114-Status: UNSURE (   7.87  )
X-CRM114-Notice: Please train this message.
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

On 23/01/2024 09:35, Krzysztof Kozlowski wrote:
> Regular expression used to match the unit address part should not allow
> non-hex numbers.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml   | 2 +-
>   .../bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml      | 2 +-
>   .../bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml    | 2 +-
>   .../bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml          | 2 +-
>   .../bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml           | 2 +-
>   5 files changed, 5 insertions(+), 5 deletions(-)
> 

<snip>


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
