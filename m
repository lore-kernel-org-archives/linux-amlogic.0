Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 238CDCDB474
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Oct 2023 13:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9An+m3w7EqLUsE1/z9lsUU/PROx+CGT3PG02DfGMuY4=; b=BG+GMPYTPNKWZNA+5J++/vp05v
	C2zWD6ZuHNuTu9xZo8m/n2QQa/teHpFUtaiBckxZkxiTKoKXBdvbQqU7yks5N1VFk44JVcwcgjRn+
	0qMcjt4WvTTc8bArHG+b/WjPX3lfi/7IDriU7cSAr3avRYt3WVVdyu4HukYep7SljnOBSeeX/rz83
	mvouI0+V9W5hgqQwO4nf0YmyK+bf5JKRvKcHx757yc+n6dkgckY9aWQ07LG/OqYKmH0O4xt1dYhBT
	6dOIuoho1bR/+gGLxosxMZusoHE5A/6xfCTBlde2X6HfFlvb4JawHm/mPSEZ3gwXOV8JsNgZjyoPj
	USdmqFvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtpYH-002NB9-0O;
	Fri, 20 Oct 2023 13:28:33 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtpYE-002NAU-2Z
	for linux-amlogic@lists.infradead.org;
	Fri, 20 Oct 2023 13:28:32 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4064876e8b8so7029185e9.0
        for <linux-amlogic@lists.infradead.org>; Fri, 20 Oct 2023 06:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697808508; x=1698413308; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vdxhh///vZzvQ7oX8XKOSjxlMEfs7Z/9qxCOsLOqTwQ=;
        b=AkDP15ZR7IGZniP7XKYfTwaAHSuI/VmEOh03qk7bN5rvmmQnCtYOOni8TqWFs6/K3h
         HvI4dpHp9txkjNSbjGC0BaD6m7ZQegLCCDUaNQt2Og9vGoAhR7cvIeBmKGDw0ohQLsOI
         Tw71fsaczt4AWwnBw/Bh60/xwVejxJjtNn+8gCOYHWEBzhXwwewWApXMoHgzr/w+cvhw
         cgQuVWPxdsexiW1AGARmcCgwhxttJ1tlwSrN83nwf+2a9DiTaAOa/H9J3JWKbA7jp10S
         OwNW3eqHSmlKnhTmp+nBJkF+/XDjtiqRcmTcv2KZVOPVKaUmEsgz+i/tmqPvdC4YnqL1
         GYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697808508; x=1698413308;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Vdxhh///vZzvQ7oX8XKOSjxlMEfs7Z/9qxCOsLOqTwQ=;
        b=VrMgzEnh4VeHi50PdB/u1mcE4WAaFyBlpQvXLpzRvRHqCLmeghomlQxH2xn68IOfY5
         yMBG2jbDIwTeD57Wzcyv8Nr4isymBV6tUls/WDRlVRa1NVUqd3H5CtBFlAZa2e8CWSjr
         KuKPJ/kuJdA1Wso4bbfJjDjTnIiSA9C1mYH7JPMyahhw/WZt9+fvo3L0dPC2hTTCTFhg
         JtUGnFytp7Q1u2fFA6ms0MWdxSf0PIRCjFrfPu5fY8YM8er4kNZbxIG0RguR+it5DQiP
         /j8izAxx6zUpJR4Nsg7ghtuZBw9N8l9Dw54pSBDtZCIdVazbKG1fa/gc+hX+BfbT1nqq
         vorw==
X-Gm-Message-State: AOJu0YzWI1raKmuVGCD1H2GoG++VYDPGj95o/g3kOuIq/gXkz3FkUEeJ
	77JPfWQcgl/ZKQIl5tSWZ74xiQ==
X-Google-Smtp-Source: AGHT+IG2lmzg3p5eY5UA9sd2Vm4+ihEmK8b1XLm9hykg8suODFazMVrcxgq/0m+UdGZAZqLuoC+ZpA==
X-Received: by 2002:a05:600c:1d08:b0:407:8317:ad81 with SMTP id l8-20020a05600c1d0800b004078317ad81mr1514191wms.1.1697808507673;
        Fri, 20 Oct 2023 06:28:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:e74c:7be5:76b9:cb31? ([2a01:e0a:982:cbb0:e74c:7be5:76b9:cb31])
        by smtp.gmail.com with ESMTPSA id b13-20020a05600c11cd00b0040770ec2c19sm6963057wmi.10.2023.10.20.06.28.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Oct 2023 06:28:27 -0700 (PDT)
Message-ID: <938e1b53-8b5a-441e-ab8b-a40cebee926b@linaro.org>
Date: Fri, 20 Oct 2023 15:28:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] clk: meson: S4: select CONFIG_COMMON_CLK_MESON_CLKC_UTILS
Content-Language: en-US, fr
To: Arnd Bergmann <arnd@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Yu Tu <yu.tu@amlogic.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>, Jian Hu <jian.hu@amlogic.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231020132036.1181762-1-arnd@kernel.org>
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
In-Reply-To: <20231020132036.1181762-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_062830_851804_A2C6B85C 
X-CRM114-Status: GOOD (  11.83  )
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

On 20/10/2023 15:19, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Without this, the newly added driver fails to link:
> 
> aarch64-linux-ld: drivers/clk/meson/s4-pll.o: in function `meson_s4_pll_probe':
> s4-pll.c:(.text+0x13c): undefined reference to `meson_clk_hw_get'
> 
> Fixes: e787c9c55edad ("clk: meson: S4: add support for Amlogic S4 SoC PLL clock driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/clk/meson/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> index c5303e4c16043..3c28560b0faba 100644
> --- a/drivers/clk/meson/Kconfig
> +++ b/drivers/clk/meson/Kconfig
> @@ -149,6 +149,7 @@ config COMMON_CLK_S4_PLL
>   	tristate "S4 SoC PLL clock controllers support"
>   	depends on ARM64
>   	default y
> +	select COMMON_CLK_MESON_CLKC_UTILS
>   	select COMMON_CLK_MESON_MPLL
>   	select COMMON_CLK_MESON_PLL
>   	select COMMON_CLK_MESON_REGMAP

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
