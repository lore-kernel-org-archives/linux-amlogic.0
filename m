Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A22BE95A8E
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Oct 2023 06:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aTh97Vss+oLufcT/8fr6pQi5tL92rZ0BUiGOvs9wr7k=; b=LpHwU9N8aHQHUtUC0y8FpxMyhS
	nHf2YfVONEiUHPf/gLydX/2FX7c9ojZvKIVAdrG6vFWnQ3srWjLQlFZy6OepGdKqe9MXJVGeFT9Ut
	N3TliT6vtXV8yP7h85tPA5J49dKuxELxzUW9W/cqdLLCSz5TYSoX2x+l7A/msoj0d8je7qgCN0hsc
	VX8U+mSl8AR5nW6F8R4aWCRSLYMqi+IttAbd+wXebbc4qOrI87xzoO5majw+3uPcdGz4NtZxnJn80
	K6/6nyucF07ROaE/xGH6ei/9w3vMlhszQdjOfSkP4S02olmsYJWB0hmqA3l1irvssxsqn6MQP4VBF
	7/S4I4qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpjRc-009olU-2U;
	Mon, 09 Oct 2023 06:08:44 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpjRZ-009okP-2M
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Oct 2023 06:08:43 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-313e742a787so2378270f8f.1
        for <linux-amlogic@lists.infradead.org>; Sun, 08 Oct 2023 23:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696831718; x=1697436518; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pwm5h53PM83gAppKIVLM07zDLHrFUDQ+u9fNo7HxCQE=;
        b=bQ2kT3ymdMOzK6XJOfI4P1NJjMvsYJF9OU/DbI3CISkvUe/0ywA7conZs7HkwlGSMk
         BIX65TzqaPXmBzwje+zTFQ/SCb6jUL6+6x3gNr4fSt8dbaOLied7Nws9i9zRrCCmhzbt
         wsV4E2lgaZYhJi4hSh0vEl4W4jHy2qGNsyFzf4QtVdKNuFJKjg25HwS0CYEf/DI1G5x1
         yCwTaEgHoUAXPr4JYCidV8unI7NqEaWjxLEZ0PqXGcMKQ6yBj0P9byPQYt5vWzjnz2UX
         ecJM1IvJL480Eg6YvUJ6SwcY4ueHLDI14OeE7isKEXYUELzELpVcVB4ulABIkye4d5Xj
         FzcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696831718; x=1697436518;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Pwm5h53PM83gAppKIVLM07zDLHrFUDQ+u9fNo7HxCQE=;
        b=lnk3CwjfZLbUMymlOvPbqAvJLoZDIq63th7YEY/rR4XJPy7Mln6BvGIDozkar4MT11
         p6F2MR74Ac+qxhf4PZvAyVeSffl2R/YoIMmQq74GdXgd/5CmAmPXiauIJNzSvmBKreRq
         oDIE9Cb8M5UQ7YH/BkSQX/52rnGPJozKuOb7A98WsGFZqz5cT3xSgrQHRqKFTXAEJBe0
         LWc3SWcZ5RKPzr9I6PqQjTTz/pNtRvUP9aT8PUv4vMS0fSWcJenai9EuSP0pLEAzrVK7
         XfUsah476NUskOONdTwC01e7IsLJmEMW5Ck5NwB0ZNXly1k1MhtJhCAN8oaIQXHEjYNF
         xpsQ==
X-Gm-Message-State: AOJu0YxhcGwrQ7WvD+BjWkK0fYMXtl+z0VspYWKQWbxRTo+jjQ7PACry
	x/q3BWkvbhO36hXgUw8AxFfX6A==
X-Google-Smtp-Source: AGHT+IGrA27+PJEBWnhyTfbkNFa+gb8MthcGvFo0qoJqXqIApd1OsFGfsb/JAvBqww1b7cMdVXFwuw==
X-Received: by 2002:a5d:500d:0:b0:317:dadc:4a63 with SMTP id e13-20020a5d500d000000b00317dadc4a63mr9154801wrt.8.1696831718205;
        Sun, 08 Oct 2023 23:08:38 -0700 (PDT)
Received: from ?IPV6:2a0d:e487:33f:ec75:fd77:4d0b:f779:280a? ([2a0d:e487:33f:ec75:fd77:4d0b:f779:280a])
        by smtp.gmail.com with ESMTPSA id v7-20020adfedc7000000b003197efd1e7bsm8427040wro.114.2023.10.08.23.08.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Oct 2023 23:08:37 -0700 (PDT)
Message-ID: <7428554d-bcdf-4193-98dc-fb618d14844d@linaro.org>
Date: Mon, 9 Oct 2023 08:08:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] firmware: meson: Use device_get_match_data()
Content-Language: en-US, fr
To: Rob Herring <robh@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20231006224644.445295-1-robh@kernel.org>
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
In-Reply-To: <20231006224644.445295-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231008_230841_778695_DF9DDFAE 
X-CRM114-Status: GOOD (  12.85  )
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

On 07/10/2023 00:46, Rob Herring wrote:
> Use preferred device_get_match_data() instead of of_match_device() to
> get the driver match data. With this, adjust the includes to explicitly
> include the correct headers.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   drivers/firmware/meson/meson_sm.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
> index 53bf56e18743..ed60f1103053 100644
> --- a/drivers/firmware/meson/meson_sm.c
> +++ b/drivers/firmware/meson/meson_sm.c
> @@ -13,9 +13,10 @@
>   #include <linux/io.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
> -#include <linux/of_device.h>
> +#include <linux/of_platform.h>
>   #include <linux/platform_device.h>
>   #include <linux/printk.h>
> +#include <linux/property.h>
>   #include <linux/types.h>
>   #include <linux/sizes.h>
>    #include <linux/slab.h>
> @@ -297,7 +298,7 @@ static int __init meson_sm_probe(struct platform_device *pdev)
>   	if (!fw)
>   		return -ENOMEM;
>   
> -	chip = of_match_device(meson_sm_ids, dev)->data;
> +	chip = device_get_match_data(dev);
>   	if (!chip)
>   		return -EINVAL;
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
