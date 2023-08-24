Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B614CC3DA6F
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Aug 2023 08:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iAFwgNAFBXozxEIirPxC1kSogKPBEQdO07TDb1lS7hs=; b=aqdMHPdWL3C4x9xYBdB1PjCqQ0
	CSPZ6fO//qPIFqDchU3B7NTJhmJrcCAdqKctj664zd+cipZPyYF7bwlVaSSUoSr3pT/YeyG/0AvU2
	BS0dPxsDHHTdfqtIr9onktfRRuXuwyH80Noij4I5sigQ7n2Hk08LUSP86t4DOMNDDLO4CsdDCRu4T
	fZud52GAP9yBtDLuvMHXZnttVgFETrji6o+yFuG1dxvAoyJYucJDdUXAP5Zv3Re6uUp5mP0HEOn/X
	t/jq6sloEB7UHHHcmt8V86NoK8k5zTHO3BO+/aEI5A7buBxZlFhFjxfu9wEuDDLyM1ZiWg1X2tiMP
	XOlhAibA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5lQ-002Zgw-29;
	Thu, 24 Aug 2023 08:32:24 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5lO-002Zfd-0I
	for linux-amlogic@lists.infradead.org;
	Thu, 24 Aug 2023 08:32:23 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fef56f7248so30274295e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 24 Aug 2023 01:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692865938; x=1693470738;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0r8DEwY1PL1OuTOZ7tvgpDOHdne9h/bxPfKsrxbUUJk=;
        b=eAVRbdqdZrdGb6bDiWW4/F9weqyJ0Nz65cNPzoubXk4rdR0qVe1c42q4ZrTtf3OcjI
         oMdKSJZrvyKvcFEZa/TXATUVjvErhuDR//+w6bteukoJgGRFP3zKPviDVaXO4rxcUlVV
         QReqllyGSX2iXm2ZFWeWO1Ms6VOF1l5rrb6RQHoK/PJBfKg/C96sIo2kcTV9RCIwdZCq
         J2LTeWh6dKONxrPdXuUbEgMCtGgEbpkalIbT8R1KrDefOikk4crQ3+fXn4la4mZoDIAJ
         CbYJdJ4Xl9kE6iG8dz6/nr1seHKKuGrsjC5AvDohpRmOqpEev47uCuXHCbuZ710GOpPL
         Z3WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692865938; x=1693470738;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0r8DEwY1PL1OuTOZ7tvgpDOHdne9h/bxPfKsrxbUUJk=;
        b=VTDSidlYMiRVGhlY78VSJK37vI9m0rZWyLtz3zOpKpTpjCmqBFNGsf6A3iNZd15RDc
         NtJ9g8DzSsrtnD+LxhFn0347Kdowy7o1yJwsPYD6+yUI8yVWj3Ei0WBO+OHPTU2amwL8
         KyGY9PTiePsUQpwtuy0VyGm6pqoZzOE0t93of38etD4Z4XY7hs1koFbRwOlQv6IdKG54
         4yvW0AwZEf1lvwlUWkAQJa5XSqVjW3zbwlsjUFm00lhaK6uQfcGJF1WYWS77wiPb8c5g
         VnOcVoB60n/poQXbqmNMMNEmU1cyJavnSqx75/Iybb1d5/9nNtdrLMZ77HAGB71fpXmc
         d24A==
X-Gm-Message-State: AOJu0Yy6GA0OB0VbenCG5Em5z7gg4EdhCUMInHadnO/M5IYj6mrimjSQ
	ijPaJWca0y12gaYUUMxz4p9lRQ==
X-Google-Smtp-Source: AGHT+IH1VcA2QnzPPWLkTP9JwJh+JjblnSC6qFKnGsaiLGfaw8iIz/QaQELIAMpS5KBRBEwImagIgg==
X-Received: by 2002:a1c:770f:0:b0:3fa:96ad:5d2e with SMTP id t15-20020a1c770f000000b003fa96ad5d2emr11438461wmi.19.1692865938371;
        Thu, 24 Aug 2023 01:32:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:e6d5:d4d4:f3a1:e44b? ([2a01:e0a:982:cbb0:e6d5:d4d4:f3a1:e44b])
        by smtp.gmail.com with ESMTPSA id 22-20020a05600c22d600b003fbd9e390e1sm1907393wmg.47.2023.08.24.01.32.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 01:32:17 -0700 (PDT)
Message-ID: <27e55b16-065b-4a16-ab05-dded04f2c705@linaro.org>
Date: Thu, 24 Aug 2023 10:32:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH V2 6/6] arm64: dts: add support for T7 power domain
 controller
Content-Language: en-US, fr
To: Xianwei Zhao <xianwei.zhao@amlogic.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>
References: <20230824055930.2576849-1-xianwei.zhao@amlogic.com>
 <20230824055930.2576849-7-xianwei.zhao@amlogic.com>
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
In-Reply-To: <20230824055930.2576849-7-xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_013222_126499_3236D4D5 
X-CRM114-Status: GOOD (  12.18  )
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

On 24/08/2023 07:59, Xianwei Zhao wrote:
> From: "xianwei.zhao" <xianwei.zhao@amlogic.com>
> 
> Enable power domain controller for Amlogic T7 SoC
> 
> Signed-off-by: xianwei.zhao <xianwei.zhao@amlogic.com>
> ---
> V1 -> V2: None
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index 1423d4a79156..23cdad1b425b 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -4,6 +4,7 @@
>    */
>   
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/power/amlogic,t7-pwrc.h>
>   
>   / {
>   	interrupt-parent = <&gic>;
> @@ -118,6 +119,11 @@ psci {
>   
>   	sm: secure-monitor {
>   		compatible = "amlogic,meson-gxbb-sm";
> +
> +		pwrc: power-controller {
> +			compatible = "amlogic,t7-pwrc";
> +			#power-domain-cells = <1>;
> +		};
>   	};
>   
>   	soc {

Please change the subject to:
arm64: dts: amlogic: t7: add power domain controller node

With that:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
