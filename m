Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DE9C47077
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Jan 2024 08:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3aR/+01fe44DjYmFw9gO7fJG7CWxPtNTPyJF1VQ+AEY=; b=vFf+t5BT71ljDklF3/EpM47rMA
	ZOW9jl/HqF+8nU00AlW3BSCZ5Yo8b0OxCA0SMNmBNeFgbQzE5hgtwc0YRHN7205DCXe0SKMeJTzPR
	6wwhiGMLTylr+LroU15aJMl/rEhr98MuUYixhlaDpy5I+iATWe01rIVzcOQdbA5Kg1mN1zjIk4DS1
	RYymA76O6s47Y4HedRptThjZrgo5IUUyVMykTMCLPkUqRuzN1ZtM66hvjVv22uXkme5Gio+coui1b
	kKdyaxJm26Njrkx4MBEmJ57rUqsToR1l/mT6r8GkAq2hK8OC3FDWUmbbpHz03C1plQfV2NU4lx9mj
	1KbZS2pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNqDq-00GRde-1H;
	Thu, 11 Jan 2024 08:15:30 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNqDn-00GRaU-2O
	for linux-amlogic@lists.infradead.org;
	Thu, 11 Jan 2024 08:15:29 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40e5a5b0fb5so10662805e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 11 Jan 2024 00:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704960923; x=1705565723; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lhNg/hT61OVz92mVen6SG0PHl8H7M3f4I/Xw2MdU3wk=;
        b=rK31iikOksyQ5w7JIiNNrMkcPaCZXipWHhrPUu8apqtEConlFCpmJFu5IP0tPCEHuL
         risBBWbUqDmZP7rPy5P067uFFl0v17aEB0624OkoQuBNKxk13Z4QAFkdta5cnm3pw4lm
         ukuGaLaUPoVAB9UjzJUCKLXKJ/eC7sTXMlYx3Y3a8t4MOen10FAhNQtFTm87EcCf07GX
         pjqbyKI1N1csklWajwQObQryaF4yIMLHWPdd1xZ6GBHs7XraYwIInQ762gXs06Tl4Jwk
         bqOqVv6mLoq/fTFBCn+nCjMOjosmiJa9jbWwAtx9dMgtvKbIovSS90qxH1h8dFpjJfTh
         3aTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704960923; x=1705565723;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lhNg/hT61OVz92mVen6SG0PHl8H7M3f4I/Xw2MdU3wk=;
        b=frKm+2p5tvyYbLA4WFOfJ/9YXtTRo50bCzYCOcdmdhAM7/02ljpvag70xidzm3gF2O
         PBUVGzpaGMXjjb+tFnDM7U6le5xn9R7jll8jJ7Mk0JDwsF0QRI5xhYVeqGBpCQaZ4p6h
         bp7CJ195bDOAB0kkrir6hQ4wwqSgHrgL42+RVdM/RXCl2cSf6a2z4XpJ9X1yyLSrDytm
         4zVE41zrl2GTojLMI4wivVCIAr6F6Y3H1Fazg3R70wSJthsuLeCS77WR4djkZP6sVVL3
         LhaVsLFNiopOe2+cZsMhLI4OHEPU6pQ89J63YWQ+hsiRzi6JiHet6S/lUp11MKYo741c
         3acg==
X-Gm-Message-State: AOJu0Yyr1vlYOLgMY4emvJ8pjOxN3Kxv5oEQq08PI8j3jFaOTnIqpq2Q
	fwoY+E0963W0qRqfyJDeOQHE4g/9/2FYRg==
X-Google-Smtp-Source: AGHT+IF/f7owkasdyC/MXgmBm/N1vKiUhNkP2gxMz9Hc0+6VjlV1rdgRGysxvD1ZUx8/gqCrux8hLQ==
X-Received: by 2002:a05:600c:1547:b0:40e:40b3:99e9 with SMTP id f7-20020a05600c154700b0040e40b399e9mr149158wmg.108.1704960923479;
        Thu, 11 Jan 2024 00:15:23 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:a5aa:e466:ae57:5a26? ([2a01:e0a:982:cbb0:a5aa:e466:ae57:5a26])
        by smtp.gmail.com with ESMTPSA id o21-20020a05600c4fd500b0040e34ca648bsm955660wmq.0.2024.01.11.00.15.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jan 2024 00:15:22 -0800 (PST)
Message-ID: <60cfb114-aa36-4588-91a5-7353791cb0ae@linaro.org>
Date: Thu, 11 Jan 2024 09:15:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 16/24] dt-bindings: crypto: meson: add new compatibles
Content-Language: en-US, fr
To: Alexey Romanov <avromanov@salutedevices.com>, narmstrong@baylibre.com,
 clabbe@baylibre.com, herbert@gondor.apana.org.au, davem@davemloft.net,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 khilman@baylibre.com, jbrunet@baylibre.com, artin.blumenstingl@googlemail.com
Cc: linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@salutedevices.com
References: <20240110201216.18016-1-avromanov@salutedevices.com>
 <20240110201216.18016-17-avromanov@salutedevices.com>
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
In-Reply-To: <20240110201216.18016-17-avromanov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_001527_785394_D18394B4 
X-CRM114-Status: UNSURE (   9.75  )
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

Hi,

On 10/01/2024 21:11, Alexey Romanov wrote:
> Now we can use crypto driver at G12A/G12B/S4/A1/SM1/AXG.
> 
> Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> ---
>   .../devicetree/bindings/crypto/amlogic,gxl-crypto.yaml          | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
> index 948e11ebe4ee..317003505510 100644
> --- a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
> +++ b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
> @@ -13,6 +13,8 @@ properties:
>     compatible:
>       items:
>         - const: amlogic,gxl-crypto
> +      - const: amlogic,g12a-crypto
> +      - const: amlogic,axg-crypto

Please add amlogic,s4-crypto and amlogic,a1-crypto using amlogic,g12a-crypto as fallback,
it's a requirement for dt bindings to have per-soc compatibles now.

Thanks,
Neil

>   
>     reg:
>       maxItems: 1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
