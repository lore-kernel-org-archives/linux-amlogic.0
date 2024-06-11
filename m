Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F764C25B76
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jun 2024 13:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IB1/48kSgN/GcfgtGT6r2l9L30YQA2wuBCjoiesW4MI=; b=nzlccT3J4s6qZmDQ9TnF1hlL9/
	hl9kYaoZpBFNdbt0ofj4HQKTJbqK9tSuZxr08D4SxZzC4LP7LjT+F6alKtYJZ/gYbrYhkd8zjOFxF
	4CF+hJ59CtoZWsgUqVrxorwTSeGiIRerJ3IOyb3jRul7S4FABvnM3h5FI1kfrQOVpm1v4WaOvsg1e
	IPeqPMLqI2vlzQ244ePsrwCA+t/WzXuiVxAbYF8Z/M3Auw0MfyRISu574dhSgQ+cf/GKAiaSHo75i
	BSeEUOWj8G+Q1MHVexAK3G8RONUvi5X3Xilpl8xRY0C33BFwOwhzBY+YzxVHsbRM7u66SK59Vxu0D
	lyjj/eeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH1pt-000000092yg-40Bb;
	Tue, 11 Jun 2024 13:46:53 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH1pn-000000092wi-3RgJ
	for linux-amlogic@lists.infradead.org;
	Tue, 11 Jun 2024 13:46:52 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-52bc121fb1eso4426310e87.1
        for <linux-amlogic@lists.infradead.org>; Tue, 11 Jun 2024 06:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718113602; x=1718718402; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J7v2ngqRjLCLnSvq47G8mmQOiGT4N5EdjUgV3sg8v9E=;
        b=Zcc8TbZX5mSwtEUPPUU4ffEoOA163RThwV/DXG6/4C7DeJvkQ65Vgz0G/PFW5mANbR
         Kxd7fos8Wj9qly04GATA0XI48O/083Z5sQ1ripDMZ6apt5ExDj/5J705s8YbHw7VRCNT
         d86zR6b3pWRxVlaADj9KC5YRPS8zajfZcNfV4q8aY5B1IjfS98BM5od2Z+GKiLQWKQOX
         2LCeTxE0PRQcUx+d17yG8WJF2ldg1OGOHsCWRytLDkAlIYaChypcyaV/auXEcsUBkye1
         oHc7f3QLY8EuIPwtab6LF0Z7djisuxsSczgxXEfrowJYqzSum/dA8NB/F/GY8qH/uP8Z
         2fmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718113602; x=1718718402;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=J7v2ngqRjLCLnSvq47G8mmQOiGT4N5EdjUgV3sg8v9E=;
        b=OOwpR+ZkSWZAdeV8mlbfhx0d64fPaD5gn3A6a3Fk3SVud2K9UVHr4x4SM8GUaZFzy3
         FSHAsFreEwYGoanr5+zDJvD9kgXN+VTAhZqW70hF/CJOfIS6PB/Qv75Yj8PgfudU7z4N
         PV0NxUB2RF4BjcUz7tcY2claidUrOMf1snva03bFaDafQuHD6BdDI39NDcZ0/wSbd+lc
         NeuuKoMtYLsK2janVFXlLFFixaiS332JIpn/yEAkJjLnk0By1NiOW9RS6ZNeCXbeL9uQ
         WY4UPPg9cZdCtcTqtSfsRpBcRPJUCz+sBDvw/k3h6RxoEBBRR6yWN6UW9lku3u4Hu9pS
         45Kw==
X-Forwarded-Encrypted: i=1; AJvYcCWQS7uDRgP/NYFUXoUX4HEw2k237QJXansJjFoj5DnZXlA0FOPkZ4UpOe8q962tzJjmtBFkuf8AfuzBh8IKRk1ZW0ScNfTCKh3cZ4ZGfmSa3K8=
X-Gm-Message-State: AOJu0YxSY1GtKWbTQL197BdcKnShCFk1XIdKa1NJle4eEeH7LAxEiMGR
	9r6/mEajfZwmiqCcxcjmKISKUjH8/Fn0IZF8ey22amjGiuCryZdpsELjVhq7SDc=
X-Google-Smtp-Source: AGHT+IHlOQv1KyvvMTWmxfewIEq2QaPMgej9qFQuYFwZjJclbqB6ZEjUnfyC5RvP4R/RGoGZgkwn9w==
X-Received: by 2002:a05:6512:15a1:b0:52c:84a2:6e0f with SMTP id 2adb3069b0e04-52c84a26f1dmr6357682e87.15.1718113602243;
        Tue, 11 Jun 2024 06:46:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5a4:3b2:c750:ef5c? ([2a01:e0a:982:cbb0:5a4:3b2:c750:ef5c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f254fb3c2sm5217241f8f.49.2024.06.11.06.46.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jun 2024 06:46:41 -0700 (PDT)
Message-ID: <4262a31b-0457-43b2-9773-b724e741b3e8@linaro.org>
Date: Tue, 11 Jun 2024 15:46:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] clk: meson: add missing MODULE_DESCRIPTION() macros
To: Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 Jeff Johnson <quic_jjohnson@quicinc.com>
References: <20240611133512.341817-1-jbrunet@baylibre.com>
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
In-Reply-To: <20240611133512.341817-1-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_064651_041927_1C721B59 
X-CRM114-Status: GOOD (  12.99  )
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

On 11/06/2024 15:35, Jerome Brunet wrote:
> Add the missing MODULE_DESCRIPTION() in the Amlogic clock modules missing
> it.
> 
> Reported-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Closes: https://lore.kernel.org/linux-clk/964210f1-671f-4ecc-bdb7-3cf53089c327@quicinc.com
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/clk/meson/a1-peripherals.c   | 3 ++-
>   drivers/clk/meson/a1-pll.c           | 3 ++-
>   drivers/clk/meson/axg-aoclk.c        | 3 ++-
>   drivers/clk/meson/axg.c              | 3 ++-
>   drivers/clk/meson/c3-peripherals.c   | 3 ++-
>   drivers/clk/meson/c3-pll.c           | 3 ++-
>   drivers/clk/meson/g12a-aoclk.c       | 3 ++-
>   drivers/clk/meson/g12a.c             | 3 ++-
>   drivers/clk/meson/gxbb-aoclk.c       | 2 ++
>   drivers/clk/meson/gxbb.c             | 3 ++-
>   drivers/clk/meson/meson-aoclk.c      | 2 ++
>   drivers/clk/meson/meson-clkc-utils.c | 1 +
>   drivers/clk/meson/meson-eeclk.c      | 2 ++
>   drivers/clk/meson/s4-peripherals.c   | 3 ++-
>   drivers/clk/meson/s4-pll.c           | 3 ++-
>   15 files changed, 29 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/clk/meson/a1-peripherals.c b/drivers/clk/meson/a1-peripherals.c
> index 621af1e6e4b2..99b5bc450446 100644
> --- a/drivers/clk/meson/a1-peripherals.c
> +++ b/drivers/clk/meson/a1-peripherals.c
> @@ -2240,8 +2240,9 @@ static struct platform_driver a1_periphs_clkc_driver = {
>   		.of_match_table = a1_periphs_clkc_match_table,
>   	},
>   };
> -
>   module_platform_driver(a1_periphs_clkc_driver);
> +
> +MODULE_DESCRIPTION("Amlogic A1 Peripherals Clock Controller driver");
>   MODULE_AUTHOR("Jian Hu <jian.hu@amlogic.com>");
>   MODULE_AUTHOR("Dmitry Rokosov <ddrokosov@sberdevices.ru>");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
> index 90b0aeeb049c..a16e537d139a 100644
> --- a/drivers/clk/meson/a1-pll.c
> +++ b/drivers/clk/meson/a1-pll.c
> @@ -354,8 +354,9 @@ static struct platform_driver a1_pll_clkc_driver = {
>   		.of_match_table = a1_pll_clkc_match_table,
>   	},
>   };
> -
>   module_platform_driver(a1_pll_clkc_driver);
> +
> +MODULE_DESCRIPTION("Amlogic S4 PLL Clock Controller driver");
>   MODULE_AUTHOR("Jian Hu <jian.hu@amlogic.com>");
>   MODULE_AUTHOR("Dmitry Rokosov <ddrokosov@sberdevices.ru>");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/meson/axg-aoclk.c b/drivers/clk/meson/axg-aoclk.c
> index e4d0f46f47f5..fa1dcb7f91e4 100644
> --- a/drivers/clk/meson/axg-aoclk.c
> +++ b/drivers/clk/meson/axg-aoclk.c
> @@ -338,6 +338,7 @@ static struct platform_driver axg_aoclkc_driver = {
>   		.of_match_table = axg_aoclkc_match_table,
>   	},
>   };
> -
>   module_platform_driver(axg_aoclkc_driver);
> +
> +MODULE_DESCRIPTION("Amlogic AXG Always-ON Clock Controller driver");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
> index 52d610110e44..065b5f198297 100644
> --- a/drivers/clk/meson/axg.c
> +++ b/drivers/clk/meson/axg.c
> @@ -2183,6 +2183,7 @@ static struct platform_driver axg_driver = {
>   		.of_match_table = clkc_match_table,
>   	},
>   };
> -
>   module_platform_driver(axg_driver);
> +
> +MODULE_DESCRIPTION("Amlogic AXG Main Clock Controller driver");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/meson/c3-peripherals.c b/drivers/clk/meson/c3-peripherals.c
> index ff17abe6a999..56b33d23c317 100644
> --- a/drivers/clk/meson/c3-peripherals.c
> +++ b/drivers/clk/meson/c3-peripherals.c
> @@ -2359,7 +2359,8 @@ static struct platform_driver c3_peripherals_driver = {
>   		.of_match_table = c3_peripherals_clkc_match_table,
>   	},
>   };
> -
>   module_platform_driver(c3_peripherals_driver);
> +
> +MODULE_DESCRIPTION("Amlogic C3 Peripherals Clock Controller driver");
>   MODULE_AUTHOR("Chuan Liu <chuan.liu@amlogic.com>");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/meson/c3-pll.c b/drivers/clk/meson/c3-pll.c
> index 44b20bf4deac..6d5271c61d14 100644
> --- a/drivers/clk/meson/c3-pll.c
> +++ b/drivers/clk/meson/c3-pll.c
> @@ -740,7 +740,8 @@ static struct platform_driver c3_pll_driver = {
>   		.of_match_table = c3_pll_clkc_match_table,
>   	},
>   };
> -
>   module_platform_driver(c3_pll_driver);
> +
> +MODULE_DESCRIPTION("Amlogic C3 PLL Clock Controller driver");
>   MODULE_AUTHOR("Chuan Liu <chuan.liu@amlogic.com>");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/meson/g12a-aoclk.c b/drivers/clk/meson/g12a-aoclk.c
> index 58976ed8b92a..a5f4d15d8396 100644
> --- a/drivers/clk/meson/g12a-aoclk.c
> +++ b/drivers/clk/meson/g12a-aoclk.c
> @@ -473,6 +473,7 @@ static struct platform_driver g12a_aoclkc_driver = {
>   		.of_match_table = g12a_aoclkc_match_table,
>   	},
>   };
> -
>   module_platform_driver(g12a_aoclkc_driver);
> +
> +MODULE_DESCRIPTION("Amlogic G12A Always-ON Clock Controller driver");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index 56e66ecc306e..4647e84d2502 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -5612,6 +5612,7 @@ static struct platform_driver g12a_driver = {
>   		.of_match_table = clkc_match_table,
>   	},
>   };
> -
>   module_platform_driver(g12a_driver);
> +
> +MODULE_DESCRIPTION("Amlogic G12/SM1 Main Clock Controller driver");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/meson/gxbb-aoclk.c b/drivers/clk/meson/gxbb-aoclk.c
> index dbda563729db..33fafbdf65c4 100644
> --- a/drivers/clk/meson/gxbb-aoclk.c
> +++ b/drivers/clk/meson/gxbb-aoclk.c
> @@ -300,4 +300,6 @@ static struct platform_driver gxbb_aoclkc_driver = {
>   	},
>   };
>   module_platform_driver(gxbb_aoclkc_driver);
> +
> +MODULE_DESCRIPTION("Amlogic GXBB Always-ON Clock Controller driver");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
> index 29507b8c4304..d3175e4335bb 100644
> --- a/drivers/clk/meson/gxbb.c
> +++ b/drivers/clk/meson/gxbb.c
> @@ -3567,6 +3567,7 @@ static struct platform_driver gxbb_driver = {
>   		.of_match_table = clkc_match_table,
>   	},
>   };
> -
>   module_platform_driver(gxbb_driver);
> +
> +MODULE_DESCRIPTION("Amlogic GXBB Main Clock Controller driver");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/meson/meson-aoclk.c b/drivers/clk/meson/meson-aoclk.c
> index b8a9d59e6726..2dd064201fae 100644
> --- a/drivers/clk/meson/meson-aoclk.c
> +++ b/drivers/clk/meson/meson-aoclk.c
> @@ -89,4 +89,6 @@ int meson_aoclkc_probe(struct platform_device *pdev)
>   	return devm_of_clk_add_hw_provider(dev, meson_clk_hw_get, (void *)&data->hw_clks);
>   }
>   EXPORT_SYMBOL_GPL(meson_aoclkc_probe);
> +
> +MODULE_DESCRIPTION("Amlogic Always-ON Clock Controller helpers");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/meson/meson-clkc-utils.c b/drivers/clk/meson/meson-clkc-utils.c
> index 7370644e8092..4dd5948b7ae4 100644
> --- a/drivers/clk/meson/meson-clkc-utils.c
> +++ b/drivers/clk/meson/meson-clkc-utils.c
> @@ -22,4 +22,5 @@ struct clk_hw *meson_clk_hw_get(struct of_phandle_args *clkspec, void *clk_hw_da
>   }
>   EXPORT_SYMBOL_GPL(meson_clk_hw_get);
>   
> +MODULE_DESCRIPTION("Amlogic Clock Controller Utilities");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/meson/meson-eeclk.c b/drivers/clk/meson/meson-eeclk.c
> index 3cbc7f233bba..570992eece86 100644
> --- a/drivers/clk/meson/meson-eeclk.c
> +++ b/drivers/clk/meson/meson-eeclk.c
> @@ -58,4 +58,6 @@ int meson_eeclkc_probe(struct platform_device *pdev)
>   	return devm_of_clk_add_hw_provider(dev, meson_clk_hw_get, (void *)&data->hw_clks);
>   }
>   EXPORT_SYMBOL_GPL(meson_eeclkc_probe);
> +
> +MODULE_DESCRIPTION("Amlogic Main Clock Controller Helpers");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
> index 73340c7e815e..130c50554290 100644
> --- a/drivers/clk/meson/s4-peripherals.c
> +++ b/drivers/clk/meson/s4-peripherals.c
> @@ -3809,7 +3809,8 @@ static struct platform_driver s4_driver = {
>   		.of_match_table = clkc_match_table,
>   	},
>   };
> -
>   module_platform_driver(s4_driver);
> +
> +MODULE_DESCRIPTION("Amlogic S4 Peripherals Clock Controller driver");
>   MODULE_AUTHOR("Yu Tu <yu.tu@amlogic.com>");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/meson/s4-pll.c b/drivers/clk/meson/s4-pll.c
> index 707c107a5291..c2afade24f9f 100644
> --- a/drivers/clk/meson/s4-pll.c
> +++ b/drivers/clk/meson/s4-pll.c
> @@ -868,7 +868,8 @@ static struct platform_driver s4_driver = {
>   		.of_match_table = clkc_match_table,
>   	},
>   };
> -
>   module_platform_driver(s4_driver);
> +
> +MODULE_DESCRIPTION("Amlogic S4 PLL Clock Controller driver");
>   MODULE_AUTHOR("Yu Tu <yu.tu@amlogic.com>");
>   MODULE_LICENSE("GPL");

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
