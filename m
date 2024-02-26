Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC4F2C5478C
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Feb 2024 08:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P4cdBDABr4+BqAkK6J9LnXwrCfTG1LF7bi7h47MpfUw=; b=0x323Yx/gad/QaZxkCkKoZB8oC
	JsaDLgjzZ7F1Gr9e0xn69gDghiVSrkL7YM227/bWQ+OK9B8Bed5ty7Ns2uUHWLHRUctuO1OTq5GtV
	eAMaUVBajWju4t0X3bqw/zHoR4zpbrjhPrskiS6hS6PjZgi5CK9X+W5LwhrO8vPIhm6nxLyZxddW7
	09xN234uHWoc6l7J2u9Wbd584R3ymX/D0YXEph3Ux0H9Y/n+bYW3v9dlsgiamCSCAPW4YpuN22qf9
	RE2av505M2G9ps17Vr+NO9DiJAta6Sr2ciKMTrCws15QpX6ELQLIPf9ufnssp78AeLR1ufkPmDNqH
	bUJIDpRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reWDx-0000000GxnT-29zb;
	Mon, 26 Feb 2024 08:20:33 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reWDu-0000000Gxm5-2P0r
	for linux-amlogic@lists.infradead.org;
	Mon, 26 Feb 2024 08:20:31 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2d24a727f78so39861131fa.0
        for <linux-amlogic@lists.infradead.org>; Mon, 26 Feb 2024 00:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708935628; x=1709540428; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7X/qTLWbPKPd/JiUEePzNNSXCZV2RpnxgxvQjOuEvCY=;
        b=ny36cK0vP6X/7b2/xj88eQwDoMHonBjl8ENyNAog9nLLr5kF1aYs3TeRMWyNZuLiFV
         JTslJIdHpfWPjdLJP7IGACdtxE/+iHPuYaHdbvk4Ao3Y0sB0W62NvFF75jC67w7yYyvq
         m+gumWp1FOyFoVJdHGxnipM1CBqPD5qNMzx3Emedzl9kUFEy0IU6/ImDLxZZe/PyNNcX
         zZAfxITiiaU/Og8gCHoq/TvfI6NhGaY+ZiILhSFZh/Z9h5GL+B7NOoG1OPObvl5bs5LX
         AU2z6NI5jRd4Kyv+RHhXd7DQf/NGKKGi+91cTBAT0DO3FI+wo1HiKH9fAI4SRoLIRm6W
         3xfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708935628; x=1709540428;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7X/qTLWbPKPd/JiUEePzNNSXCZV2RpnxgxvQjOuEvCY=;
        b=pyMeWxZo1Lax3qTWfIZrRgtwB1S5Gt6P564BWEsg0te469iMdhqlAJyUYkR7nZjuZE
         k4jAyTZMHlefjoAGqkWZVj+kUNZPAyLDlLJed57uLid1oBlXWxVXdaLLlqc2+0gGneK7
         9K3gVr0fAx0RMI4VUY/zGycf4SJZEm3PV0HGf5eWfJ7D3osIxXY+lQvWAq7Efm0gQI2I
         ZBDCeesFeotzwlmL3QcX9fivS4wqJgzDuq6DEUmCzTnP8/4xZuZsVOWF2b9Rtu8aLocY
         GKlRd7nZ/worKA9JY7Kh6xi1DnCD8VwQKoA63sOADn7fAjD8TmBCtSkTWEwwcKJkk4fS
         nVNQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9fzys7YHY+DJxa/tCGaeOkNXZg99Us9rynk8L3NxxhgaZ3JD7BvfCe5t/buoTBT2rUnIYiDJFIt+8erzB5P3PR9aMAeWDVKZPmmX7n0RIDi8=
X-Gm-Message-State: AOJu0YyEAGKiel4BN658H7OSBxFLcxgERsGpEXhhRILNqkKnY5iWGtpd
	+4sgu+YbF5R3aFqiHQXWvMQA0DB25rrgY60M9uvF66oc/Z+WfMDwTgqwHCR2+xU=
X-Google-Smtp-Source: AGHT+IG9QcEM3HJrnvTNIfRhHpLmlDOTNhe4OLoEc9FT9CEH84AmgKuofVTjDOdF9TjKJLwzZybwbw==
X-Received: by 2002:a05:6512:928:b0:512:a980:719f with SMTP id f8-20020a056512092800b00512a980719fmr3375500lft.69.1708935627817;
        Mon, 26 Feb 2024 00:20:27 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:6109:4c61:11d9:ed64? ([2a01:e0a:982:cbb0:6109:4c61:11d9:ed64])
        by smtp.gmail.com with ESMTPSA id 19-20020a05600c249300b00411e1574f7fsm10999475wms.44.2024.02.26.00.20.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 00:20:27 -0800 (PST)
Message-ID: <7d9221e0-8165-422b-abbb-e1566a7a733e@linaro.org>
Date: Mon, 26 Feb 2024 09:20:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm: amlogic: remove unstable remark
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
In-Reply-To: <20240224084030.5867-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_002030_650835_A834219F 
X-CRM114-Status: GOOD (  13.53  )
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
> Amlogic bindings were marked as work-in-progress / unstable in 2017 in
> commit 7e8634e821e1 ("dt-bindings: amlogic: add unstable statement").
> Almost seven years is enough, so drop the "unstable" remark and expect
> usual ABI rules.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   Documentation/devicetree/bindings/arm/amlogic.yaml | 11 -----------
>   1 file changed, 11 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
> index ce0ea36de0c0..edbc21159588 100644
> --- a/Documentation/devicetree/bindings/arm/amlogic.yaml
> +++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
> @@ -9,17 +9,6 @@ title: Amlogic SoC based Platforms
>   maintainers:
>     - Kevin Hilman <khilman@baylibre.com>
>   
> -description: |+
> -  Work in progress statement:
> -
> -  Device tree files and bindings applying to Amlogic SoCs and boards are
> -  considered "unstable". Any Amlogic device tree binding may change at
> -  any time. Be sure to use a device tree binary and a kernel image
> -  generated from the same source tree.
> -
> -  Please refer to Documentation/devicetree/bindings/ABI.rst for a definition of a
> -  stable binding/ABI.
> -
>   properties:
>     $nodename:
>       const: '/'

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
