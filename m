Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF2EC5478C
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Feb 2024 08:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HG/Roqm3U81buKhHMcGE9CmRctqQXNoZJErb6VIAQbo=; b=XeOTTAGblq+u0fvaxgnfY+C8X0
	y6+inKr7IKvQMY5os84dajaKxBRNkRKyJUyBFfpy/ZI6eiIcSTHkGi0nTy20Nb/C4OGyOGDr/RwGf
	lvWjM0tN5r4bS2KBySxAba1nA1PnQsvp/ERvYHQtWxcRkyQpBFx9Jrrimkw165Q0RDj5wItI6bXA2
	kHkyyREoz1DErPWCa0//YUc8lyQMepDh/h2LPNd59tMoyqJpQO3iF6Guc11XsJS7N+8wUH2mNs8CK
	5HsARLde7VRE9g8NhdMJrIz+lYDpIFSt7e2Qk+RKY6aaa1Ygv+R+e0wzehN4PW+W+gxaK5/VMrK5s
	vdVCOgLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reWES-0000000Gxwf-3H7d;
	Mon, 26 Feb 2024 08:21:04 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reWEP-0000000GxvD-35m6
	for linux-amlogic@lists.infradead.org;
	Mon, 26 Feb 2024 08:21:03 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-412a4055897so6271005e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 26 Feb 2024 00:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708935660; x=1709540460; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XZY9bAr8HLq1HeXJYbRKkm16dfDwRF3U/KMWeM9nOeg=;
        b=OceVy4x8txNjRVtwAwGgTeFWVUlF7w0Tf1UtWTrHwKg+S6mV5GSBXNhlcMVSE+rpbd
         1LC5btcCF7vk2rUPJHGk6x1swwJKWen4ewUpNaLqYWeOzyDRYSTaFnuKoFoX5gLKOcpm
         mcsHNh56LoeQufwBjhvttUf+5v2pJ/mTGW2gwV+31zuAnxHUXHZFTrBX1pPbJcD6BZdb
         T7lu29R6gBIM2ZgfZDdh6HqWmcUq727+bIb7jcVPWAn9n5IM/kxIU+ffzhDt/lDOnlZI
         ptTRrP+X1m5Kh2+h4gr0gK4zoh7OMJMUQZMD65PAWKS9EhF+nu6sjtErtMCUKiR1WrMd
         F9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708935660; x=1709540460;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XZY9bAr8HLq1HeXJYbRKkm16dfDwRF3U/KMWeM9nOeg=;
        b=bKZgHZM5sh0v+xqDysge7zmEFFn72k+Ry+KtKljETxWSZGSMI5Zr8c6t4ZavwO7Sdc
         yzKwvPghHuJ2YEbborSodX+8n3UnGzgWI8Bic4TUjKVyzXSpVtXdFbsz38HNNxzR47ou
         zh1/tNdpqpeIN5INm279D7veefGagoEpugcjLnj3cETsHl/239+vujfWeJJjB6cwzH7b
         NW7O673JbIcdLsIrxDsjZo55U862+2873wX7ytF8hvfz3wY2JDz9SyiDBpMmDtK620Z5
         ukBhlV7weOBTBzbVv2aK3zd7YDDEeSjaDwJs/PFSUf6uBPDl8nyMAhBFNR1p44a3L57N
         Armw==
X-Forwarded-Encrypted: i=1; AJvYcCUAUSWINAf8xtidC3B/wntUHUdyM2kRenXAK1v7f/I+gFZqt7p6qmqv9pNRu4lVZgceIHetQrHte+L7U68/ydjIwOtq9vxMOJt/gBNsHish4Bc=
X-Gm-Message-State: AOJu0YyKMWK7wctge/di/b/o6DIc4nQd11u224dHC+3hmAuOiixtNSwh
	PE0GMkNmY4g+5+EH0dqCUb/HNjZz/KhyYG8xSwEKicIjp9Rz70GECOz7uwrlpr4=
X-Google-Smtp-Source: AGHT+IFrIdlWNBqo+0PZyg0mwzmMd+bi9doX/IBE3ts5JFCZZOl7ZsXqTrK1QOz/u1os6aSj3joEwg==
X-Received: by 2002:a05:600c:474a:b0:411:f418:375f with SMTP id w10-20020a05600c474a00b00411f418375fmr4033817wmo.19.1708935659916;
        Mon, 26 Feb 2024 00:20:59 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:6109:4c61:11d9:ed64? ([2a01:e0a:982:cbb0:6109:4c61:11d9:ed64])
        by smtp.gmail.com with ESMTPSA id 19-20020a05600c249300b00411e1574f7fsm10999475wms.44.2024.02.26.00.20.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 00:20:59 -0800 (PST)
Message-ID: <e2cda8f8-4250-4ac5-b7ba-6069f37c1b98@linaro.org>
Date: Mon, 26 Feb 2024 09:20:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] dt-bindings: arm: amlogic: add Neil, Martin and
 Jerome as maintainers
Content-Language: en-US, fr
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
References: <20240224084030.5867-1-krzysztof.kozlowski@linaro.org>
 <20240224084030.5867-2-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20240224084030.5867-2-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_002101_808772_10C8D29E 
X-CRM114-Status: UNSURE (   9.83  )
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

+ linux-amlogic@lists.infradead.org

On 24/02/2024 09:40, Krzysztof Kozlowski wrote:
> Add rest of Linux Amlogic Meson SoC maintainers and reviewers to the
> Amlogic board/SoC binding maintainers.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Entries ordered by lastname.
> ---
>   Documentation/devicetree/bindings/arm/amlogic.yaml | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
> index edbc21159588..949537cea6be 100644
> --- a/Documentation/devicetree/bindings/arm/amlogic.yaml
> +++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
> @@ -7,6 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>   title: Amlogic SoC based Platforms
>   
>   maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +  - Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> +  - Jerome Brunet <jbrunet@baylibre.com>
>     - Kevin Hilman <khilman@baylibre.com>
>   
>   properties:

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
