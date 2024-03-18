Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 937D4C54E58
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2024 08:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k6l3Tjtm2oiXRvmITJSgixEVvvEa/AFuRZRyBQL1P9s=; b=LcKj8U7Kkj37wTdV6qQypVo5mC
	0qQ55JgaWMWROkXn6/8INJgWCTl7itdixNJ8NFP5UxczNWZyR6wQa/8J+XUuvWW5Izg9dFrYrtAXp
	gBNuYlJBkkC818eZIIenIP9PudzgKfL5nZKa+flh55mBYglfBXMSB1vuiJoJLI+HkwtkcAQDM48c9
	Amf09P6NDsbkdQdWkFGlI1zaB+61c197RJ8Tbzo3Q7gJvtAVZBbjkDUBDP32t3HqS1/uH0BzDwADV
	2dZhlYYjr/ynIZ4/hqeyqa6AoYqeMfidU2hbAM7YTYFw6ji4A3qTsgd/5fx9HDSN9GDtfoe9RsEbK
	n15eErdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm8bM-00000007n4b-2JBD;
	Mon, 18 Mar 2024 08:44:12 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm8bJ-00000007n2m-0u15
	for linux-amlogic@lists.infradead.org;
	Mon, 18 Mar 2024 08:44:10 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4140edd58c9so6255515e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 18 Mar 2024 01:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710751446; x=1711356246; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I/oeSBGpWO0iH1Zkmp9crshj4uyKP6/bIYBT+8Lwu1M=;
        b=OnEkcdOcMlKjWRBEJdtlC6zvFKAZaoTqcoABJtD3DQE5uoFXSL3KmAnIrhmVlWa7TN
         byNLJVomwq9A2Zfp3b43/AzJXak6kkM4AvRRlWKDYQ83ZI5ey0JF/TQwAqyB1ed24rKc
         G53WFzrz5MWuXDsOcf4jBPJBAfXxFtAWlEM483AGrAVtehZLCgZUcIT5tUDjaDvQis9p
         jXkoh247BlRh1xOwbyo/M+m3jgRO2Tph91ioTMbbpJtw/rRllUkMi7us9ETTIyIDlfNr
         LdqS+nwkc/kUxS29mlR1K5XgqTq+FyG5qJyfSpsrmS06epVULKgLfKZnPGzJEI05TVuU
         z/dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710751446; x=1711356246;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I/oeSBGpWO0iH1Zkmp9crshj4uyKP6/bIYBT+8Lwu1M=;
        b=IzHx7N8nOUH2k3Hk5p4D4MLDxscbv5JyUWLOA34PXClEvFddN7jIRpSIaNP3mRTe+6
         hGCMDCoP8ZbcgJtS+qIMKpRtH/zWGWiGFPQUOaJrTVBiea/pqp5ad3qqQ5PM0DDlwbBJ
         FDwba2+RHEL0TRH0l+E6C8OgBrFN0tUhUZWktZGFZPAKPhvArAunRqbz+aCakwUhVgkk
         YWkRysfQEbUYZSGCmgiFF9nZ4LolW1ZsPdMSqfs+X/ZR14odPIdHEq6daA73RtNDBZ95
         0cy0iJ+QBqi2vE9TglkJl4A8/+jKbXKEzP/zU+oZ7hTWJPFHXtu5G5g1upmaOFS/reqt
         jGqA==
X-Forwarded-Encrypted: i=1; AJvYcCV9yuz7YmWzOuqZ34v8sjQodwGklejDFspoBeHU10XUC20FJFj55M2I2qNsSo7PBHxt+bSJM44p9wvu+ipkaPiQEH5FcqgN+GReF1ESXBu+c94=
X-Gm-Message-State: AOJu0YxfmSKuhHUJ4gSSIh1zIDK50n4p92bTZD5wSNBbANPxwl+JCaK3
	jJMcTkj7AIvAMEpnClyZO2mK1NSRXUjKYaWO1qS+koAzUAHqbg/CWbrOlJGFVQc=
X-Google-Smtp-Source: AGHT+IFG3I15pv8EdDTE22vM5b12wD+p6ePn0LduKYe7zAW8noH4dNrWWnLC8fVlMdJMd2pOIMKivQ==
X-Received: by 2002:a05:600c:3509:b0:414:102f:27c2 with SMTP id h9-20020a05600c350900b00414102f27c2mr1328181wmq.1.1710751445796;
        Mon, 18 Mar 2024 01:44:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ad2b:a316:59d9:3dbc? ([2a01:e0a:982:cbb0:ad2b:a316:59d9:3dbc])
        by smtp.gmail.com with ESMTPSA id l19-20020a05600c4f1300b004130378fb77sm17529771wmq.6.2024.03.18.01.44.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 01:44:05 -0700 (PDT)
Message-ID: <19d5d996-71ce-40e6-874f-70f9f1b6c66b@linaro.org>
Date: Mon, 18 Mar 2024 09:44:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/3] ARM: dts: fix Ethernet on WeTek Hub/Play2
Content-Language: en-US, fr
To: u-boot-amlogic@groups.io, christianshewitt@gmail.com,
 u-boot@lists.denx.de, linux-amlogic@lists.infradead.org
References: <20240316135430.826898-1-christianshewitt@gmail.com>
 <20240316135430.826898-2-christianshewitt@gmail.com>
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
In-Reply-To: <20240316135430.826898-2-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_014409_293282_D622A403 
X-CRM114-Status: GOOD (  14.06  )
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

On 16/03/2024 14:54, Christian Hewitt wrote:
> Placing the snps,reset content needed for Ethernet to probe in a common
> uboot.dtsi results in the content not being used and broken Ethernet. Fix
> this by creating two board specific dtsi files with the right content.
> 
> Fixes: 67d5128df950 ("ARM: dts: add support for WeTek Hub and WeTek Play2")
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>   ...u-boot.dtsi => meson-gxbb-wetek-hub-u-boot.dtsi} |  0
>   arch/arm/dts/meson-gxbb-wetek-play2-u-boot.dtsi     | 13 +++++++++++++
>   2 files changed, 13 insertions(+)
>   rename arch/arm/dts/{meson-gxbb-wetek-u-boot.dtsi => meson-gxbb-wetek-hub-u-boot.dtsi} (100%)
>   create mode 100644 arch/arm/dts/meson-gxbb-wetek-play2-u-boot.dtsi
> 
> diff --git a/arch/arm/dts/meson-gxbb-wetek-u-boot.dtsi b/arch/arm/dts/meson-gxbb-wetek-hub-u-boot.dtsi
> similarity index 100%
> rename from arch/arm/dts/meson-gxbb-wetek-u-boot.dtsi
> rename to arch/arm/dts/meson-gxbb-wetek-hub-u-boot.dtsi
> diff --git a/arch/arm/dts/meson-gxbb-wetek-play2-u-boot.dtsi b/arch/arm/dts/meson-gxbb-wetek-play2-u-boot.dtsi
> new file mode 100644
> index 00000000000..3743053eb9c
> --- /dev/null
> +++ b/arch/arm/dts/meson-gxbb-wetek-play2-u-boot.dtsi
> @@ -0,0 +1,13 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2019 BayLibre, SAS.
> + * Author: Neil Armstrong <narmstrong@baylibre.com>
> + */
> +
> +#include "meson-gx-u-boot.dtsi"
> +
> +&ethmac {
> +	snps,reset-gpio = <&gpio GPIOZ_14 0>;
> +	snps,reset-delays-us = <0 10000 1000000>;
> +	snps,reset-active-low;
> +};

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
