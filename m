Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CEAC27C53
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Jun 2024 14:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gmNb1pfXJuiXIgjnihnFC05b5PtjXkEFmf9QHoT+Uro=; b=1FksIPXBaaY01iHnX8vG4DoGCW
	x0RT1XzOjx8i0wdrkIY1dcn4F0D9fG8mdt1yXZ8gtVWGxnccBof5CHMc3wXARhNB8GHkoIvzWnlTy
	mjXnmHimdAQvqGFb96CXpS6gP3sAm/rJkaf2jLL2+BpfqtE2pNgF43vTE+pk4TQdVi+TS6NOYLmPT
	pR1PLR5+HKddcZh2zHKkrld8P+fbZsvC1cDvjgxJJ9gsxBoWwzE1zkS+J8/2wY4o850K0lB/RK6LA
	oAt9afRxGYyp2c5IYjrz8yAYoa0ZZn199powlNLwYKtey1XWjJ+49Y7hxTfsKHjFSBg9WcqTDYuDe
	sGk/411g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJvyd-00000001QbP-35GO;
	Wed, 19 Jun 2024 14:07:55 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJvyZ-00000001QYu-0UpZ
	for linux-amlogic@lists.infradead.org;
	Wed, 19 Jun 2024 14:07:52 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-35f1c490c13so7146433f8f.3
        for <linux-amlogic@lists.infradead.org>; Wed, 19 Jun 2024 07:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718806069; x=1719410869; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oaHpZkhtsCD0QOvH/vKXjwNRlG0Co1gFy4lGKzP41Tg=;
        b=DWObjDKLWe0EWwcShQLwV/VQQYtXH2uqaqmrGxmq9iONK47IvEYzgp0epde0sIoES+
         83wYPavKKoq1GFko3GaGMwO2GMa0Wr43Nc5jKdcamRk2AN3gOpnFtEMcbJB3O60bXINj
         6H5kCw+bMq10rgb4JNiAVT+3XLA3jnQjwAuhb8lKTxzpqMt0+HUtE00oiF9xO3rQHXKL
         6CFnMR9K1n836yaC6PKTjBz6eKhGF1QH4TKnk5FyF+R5aCe52I+zL4oqmFGV2BWjDzWa
         69cshk1JdypNxWaq4s9sMMHvN6QScXM7+LXs028cfW4iyCs1NvFp4gb3nhA8RaQYQwyR
         bmig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718806069; x=1719410869;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oaHpZkhtsCD0QOvH/vKXjwNRlG0Co1gFy4lGKzP41Tg=;
        b=SwR3S6R7/xasFnaYNCqS7UXh71rWljlxsTgSKwCHjkuSEI2OWtP1bVvPaK2ZHwGY5Q
         JWjp+oXseGw76U+bP8yxbbgyMqCW100geAkvz8ctTEvR7ikedtTLRuGIrc9V4Gaiz9GJ
         HYvtAWO7jQURahJje3mfqzI1Nyzp1h9Rk5/q68N/BBOYgUyyAg/FvXJTbaqOPxNNavQ/
         lo9Rv959oq1LE2KKJQo1l4wz7sQxExAyMGvW04N3kdU//asNC5CdVpk7TpehixF9UNoj
         PzoD/lu3OaEYIrZKYYqkt6b4o+DJ6UGHafxP1ouIPTad77qZzNQezgkoF7uMHIjHOsed
         5EDw==
X-Forwarded-Encrypted: i=1; AJvYcCW+QOBq5kh2OrpRGp5k9ideJHPfK8NMMNsZwWZG94Ol+/vcgObYlWMflWbaRXG137SVibNuiLh83fsnMSjGftvk1wM7PrFFB7u4gxqbp7zqskU=
X-Gm-Message-State: AOJu0YxUKD/XP/1jOF2iiANW11TAFey8IvhWdaMRF/fGyN/GLWHSWY96
	jhgGcVKaLFLiO47x2xXY1U4I4ZWGxju8m6eNWo9uFrxG60bdyIRd1GCXtGlc7LM=
X-Google-Smtp-Source: AGHT+IHo7ROd9VC2MG/pYYKawjby+gSyr7EL3WZrsbdKydWpIAWwCr6OO3qBZgIZLwY28lFn/p0CKA==
X-Received: by 2002:adf:fe0b:0:b0:362:4f55:6c43 with SMTP id ffacd0b85a97d-36313fd3a75mr2331475f8f.0.1718806069080;
        Wed, 19 Jun 2024 07:07:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ed45:cb25:b4fd:b1fa? ([2a01:e0a:982:cbb0:ed45:cb25:b4fd:b1fa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36075104a8fsm17190307f8f.110.2024.06.19.07.07.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jun 2024 07:07:48 -0700 (PDT)
Message-ID: <78724eab-9dbf-4231-821f-3bf47c92124e@linaro.org>
Date: Wed, 19 Jun 2024 16:07:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] dt-bindings: nvmem: amlogic,meson-gx-efuse: add optional
 power-domains
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240605-topic-amlogic-upstream-bindings-fixes-power-domains-nvmem-v1-1-ef6f10c86a63@linaro.org>
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
In-Reply-To: <20240605-topic-amlogic-upstream-bindings-fixes-power-domains-nvmem-v1-1-ef6f10c86a63@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_070751_367707_EDCF685D 
X-CRM114-Status: GOOD (  12.35  )
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

Hi Srini,

On 05/06/2024 11:35, Neil Armstrong wrote:
> On newer SoCs, the eFuse hardware can require a power-domain to operate,
> add it as optional.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   Documentation/devicetree/bindings/nvmem/amlogic,meson-gxbb-efuse.yaml | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/amlogic,meson-gxbb-efuse.yaml b/Documentation/devicetree/bindings/nvmem/amlogic,meson-gxbb-efuse.yaml
> index 9801fe6f91b5..99ddc9a4af05 100644
> --- a/Documentation/devicetree/bindings/nvmem/amlogic,meson-gxbb-efuse.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/amlogic,meson-gxbb-efuse.yaml
> @@ -28,6 +28,9 @@ properties:
>       description: phandle to the secure-monitor node
>       $ref: /schemas/types.yaml#/definitions/phandle
>   
> +  power-domains:
> +    maxItems: 1
> +
>   required:
>     - compatible
>     - clocks
> 
> ---
> base-commit: c3f38fa61af77b49866b006939479069cd451173
> change-id: 20240605-topic-amlogic-upstream-bindings-fixes-power-domains-nvmem-7df0dd48b1a3
> 
> Best regards,


Gentle ping!

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
