Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D8CEE4993
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Aug 2023 09:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l/5FhunaVsngmF8lMoLQuCeYGP25JEht1JMorNkoEpo=; b=MvnyWSpAqDA+1hIHtisnGa6VlS
	ILcD+KiFSHa9ZSLxaBYHcwAwLUJLTA5F418wCSS5dc6F/9hb9LDHk566ZMQyTsi5LHpYmsE78OOeO
	6L0TXka60qhO2h+tZhlcOCAOyiPgXh0+y4LQvfN4yWRIQCnXpMuIE1EuVOesOPWJiEuHCKGBw9aQB
	MZGaaUwpvLEV1TM7EpcBr8s/yv37bNmKjzoEe1SSBa1Sa2V4A6blg3C7i1EY+7FU1IbQu8G12fcMe
	LyqvhEv4B64652HWWfPvbxxkyNBkUcx7U4EfDM1ZldPSoAtIAOfNqLA5V7TThkogGAmggY9Jtj4cQ
	0492XqFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYjlN-0001cW-0u;
	Wed, 23 Aug 2023 09:02:53 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYjlK-0001bn-2B
	for linux-amlogic@lists.infradead.org;
	Wed, 23 Aug 2023 09:02:52 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4ff882397ecso8199237e87.3
        for <linux-amlogic@lists.infradead.org>; Wed, 23 Aug 2023 02:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692781367; x=1693386167;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gJn+iG54+upG/BrA2pwerIc9Iqy0OFFbmq2lKLUTge0=;
        b=JbDrdPl/i9v/xWBiwwKbEMXfLsCZYFB2P0RhOmfjUNc6Sry/ltjkJC/aBv1Xr6ejNq
         to22ZfIqzCNZJcLVPWqG3HLrr67HbPfzfHOELTwLeHYmnw6CnF6K0tJOufG0NYZwVWl1
         zNgVqs2lSdGeXR+QF1hWSF3+KKJKItJUFaFtCDhGaF/5Zl7RCuA0uhWoiZYDGEdRDIUA
         mm0N7GchRablAObABKbtFpuTpOqzgXgkWjtH2lkMdiIHy4o8/35ehEr7Z5gjxQOGl/vG
         CJUr2b+jqkjpOT99r8nAx2UmbSwp3vTqaozJWNG/6WNC7ZeoWLsqwHW/HFMEAuUtItJX
         dz9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692781367; x=1693386167;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gJn+iG54+upG/BrA2pwerIc9Iqy0OFFbmq2lKLUTge0=;
        b=lZBh81OlJHE7AwA9mEdxPHNlj8/W637hq687dhSwszFMpoZ6cxAAXdX8hjtlCE1FUB
         JGb6MJ+Wk/c2yV4WAyCKaYtWWuh0WS0+3ypXgG5Kv0uUTy/vvKD+grW8VfOqu1OBN6SS
         hsl+Cb4QK7y4ZlRJ8GuamILtkzxzNgEo5g2O/1APx6hw7ae4gYOc/cW/sYD3DUXZHCW2
         6GH0sjZt5eph3HKfXfpXSbyQRa4qfNdfwvfGx6g3eMkjxMazvTg4DsjSLofh2gaSEBGV
         xfHck7Rb4AEtb2m629B4QhHm3YtFi7+a/tuZVuUoc2VbBkG/aVrqE2gg4tYxHsVn9NQf
         EPRA==
X-Gm-Message-State: AOJu0YwUt3l3tvN8xjI/81xNgeucS+B9pNNY1FD3XMfmuzcUZqGQwgnr
	5CojA8Ojucu2lD0wv1Zeunz4Rw==
X-Google-Smtp-Source: AGHT+IEVrpCmN9V7+rVRVrUNs6LVKFbMoB1A/70skQiHS6k4fZyeZl89MWB5PcNxLAI4JIVAWrcTTQ==
X-Received: by 2002:a2e:9007:0:b0:2b9:e701:ac48 with SMTP id h7-20020a2e9007000000b002b9e701ac48mr10068777ljg.32.1692781366667;
        Wed, 23 Aug 2023 02:02:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:c457:5132:4849:b9d9? ([2a01:e0a:cad:2140:c457:5132:4849:b9d9])
        by smtp.gmail.com with ESMTPSA id s3-20020a1cf203000000b003fe17901fcdsm21460162wmc.32.2023.08.23.02.02.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Aug 2023 02:02:46 -0700 (PDT)
Message-ID: <c18d607e-e33e-43fd-9a67-c701f92cc004@linaro.org>
Date: Wed, 23 Aug 2023 11:02:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] pinctrl: use capital "OR" for multiple licenses in SPDX
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230823085546.116494-1-krzysztof.kozlowski@linaro.org>
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
Organization: Linaro Developer Services
In-Reply-To: <20230823085546.116494-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_020250_721828_5804BD35 
X-CRM114-Status: GOOD (  14.66  )
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

On 23/08/2023 10:55, Krzysztof Kozlowski wrote:
> Documentation/process/license-rules.rst and checkpatch expect the SPDX
> identifier syntax for multiple licenses to use capital "OR".  Correct it
> to keep consistent format and avoid copy-paste issues.
> 
> Correct also the placement of SPDX identifier in pinctrl-meson-axg
> files:
> 
>    WARNING: Misplaced SPDX-License-Identifier tag - use line 1 instead
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c | 3 +--
>   drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h | 2 +-
>   drivers/pinctrl/meson/pinctrl-meson-axg.c     | 3 +--
>   drivers/pinctrl/meson/pinctrl-meson-g12a.c    | 2 +-
>   drivers/pinctrl/pinctrl-mlxbf3.c              | 2 +-
>   5 files changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c b/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c
> index 80c43683c789..ae3f8d0da05f 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>   /*
>    * Second generation of pinmux driver for Amlogic Meson-AXG SoC.
>    *
> @@ -6,8 +7,6 @@
>    *
>    * Copyright (c) 2017 Amlogic, Inc. All rights reserved.
>    * Author: Xingyu Chen <xingyu.chen@amlogic.com>
> - *
> - * SPDX-License-Identifier: (GPL-2.0+ or MIT)
>    */
>   
>   /*
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h b/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h
> index aa79d7ecee00..67147ebaef1b 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h
> +++ b/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: (GPL-2.0+ or MIT) */
> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
>   /*
>    * Copyright (c) 2017 Baylibre SAS.
>    * Author:  Jerome Brunet  <jbrunet@baylibre.com>
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-axg.c b/drivers/pinctrl/meson/pinctrl-meson-axg.c
> index d249a035c2b9..6667c9d0238f 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-axg.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-axg.c
> @@ -1,10 +1,9 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>   /*
>    * Pin controller and GPIO driver for Amlogic Meson AXG SoC.
>    *
>    * Copyright (c) 2017 Amlogic, Inc. All rights reserved.
>    * Author: Xingyu Chen <xingyu.chen@amlogic.com>
> - *
> - * SPDX-License-Identifier: (GPL-2.0+ or MIT)
>    */
>   
>   #include <dt-bindings/gpio/meson-axg-gpio.h>
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-g12a.c b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
> index 3cd86d6a0a60..2c17891ba6a9 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-g12a.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>   /*
>    * Pin controller and GPIO driver for Amlogic Meson G12A SoC.
>    *

For meson pinctrl drivers:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

<snip>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
