Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0293CC54E64
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2024 14:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FENjVuB4/y8GtyhyTCfxCFvibx85SVXqJI/94qn5aHA=; b=GgCuhfimTAHVSQEHvIkzxCpRQ/
	h5lV/Hku9ULltmClOYOIsadvqf5x3+Ce0d+PsJ0789OhrpHzy8YCi4Jz9GYZPC5KBw7bJWlHPddPi
	GWbjcHWp69mCBPV5LliDBJvWZAIamSTdUimr4kW57CmLEioQDqcuEXv6b6LwEv8GxTjt/DfB8RNMA
	VudkurRE9vWn1aYamL8dWXqGf7TAyLMgzuBDaxNb7XKywgGE6G34RlLpeykWoGE2yPsb78o/WAB0D
	TCMoLru8yK8NTzV+Jx+yTCKlvCw0lsbdk6kJumHHX9Ng4Er1GATyOfCSl+hnZ8FvqzOJeiqUpSeie
	i31PVglw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rokrN-000000006Zx-3T5N;
	Mon, 25 Mar 2024 13:59:55 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rokrI-000000006V2-1Ps8
	for linux-amlogic@lists.infradead.org;
	Mon, 25 Mar 2024 13:59:30 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-229661f57cbso2606514fac.1
        for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2024 06:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711375154; x=1711979954; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o2nH4XziCYvGEfh77M5FceKvirEwgjnZOT2AT2yGomg=;
        b=iD96oJ/mUJ0oxsnDs0/UDcIMecNi0WDuZPBWhXY+APt2Uvx6ka6T7JxPdSt7P9Io1f
         RgF9NCaazBlpGAu3Npnth9jOtF/0/GlxhWHc9s+bItaq6pyEyO7sF92+joRytY0bD9Iv
         bwDXLBieXJ3PhGrHEZBdpoiSefTICk8LrZvHkJFuXie3RQ9iYyiXsUGcbyeLYay2v/qz
         FNkB0LjRq8Q0xD2LOnZvr2bfONUvIPPMc1QBgJxBePoVFN4cvfuEXyZAG46f2kZcSUMk
         S77LIhJBoU+yde3HEPUPWnpUhEcYNAXAoMsi8tZXTPafXdAZojlfqNUnd5TEK3OZk0sO
         Qazg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711375154; x=1711979954;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o2nH4XziCYvGEfh77M5FceKvirEwgjnZOT2AT2yGomg=;
        b=P69KuNtb+vxfehIbhntE2pT3NB7131QEkzUs9IfXPotPFVt/NqDKX/rtz1xNlkMSHo
         0XI8QoQly/J5AnEXDk7JaIBUCaztaRMtwtTI5FeKoMfwolliZ1y4l1q7DVZVZeRzyk4g
         NlnHTtf7soXwAWUOGd3GR+efYqBpD6bg+e8JzZ/wXai/XyF8AINz1EPkHJX9XHqeIOEd
         GJPNutq7zEkTyqOeWiFpZgYQUkMan0ksB1EoT2E8HCvyF8G6etT7w+OoXzOy0RxrYbMP
         MgsmrNtxRnwOjVnWGZjcwJ0bK//Fl8SVMQncE7g4c/T4D01iHMCBS7isaLqciswpRKtF
         j83w==
X-Forwarded-Encrypted: i=1; AJvYcCXDFcRyJsDLyDU7I0WFC8FCYXZzy8a+l4kqkZJ2OGUT2tZ/69eeHWt7GElNYsGo4Miy55qjy3kYyeFpf3kyVq1353ttUrZz5ey5XDVwvQR3i5E=
X-Gm-Message-State: AOJu0Yx11ncBsgeLHf6KhR7rroy5hUj/U8hD0H/8BUUeitqC5biVD/9+
	EV/AdphDVer/bznzkS1TN34mMEtXeW4GZGyBNbuPc4hPemduLbPLbONiWxcXNK4=
X-Google-Smtp-Source: AGHT+IE2VDeedGd/lWEvKcxCaB+MJdMhfHfLWl5rj7Bz4qfMhTELtOe0PG8xP2LlKdqWw+EAGM3gLg==
X-Received: by 2002:a05:6870:4205:b0:229:8236:ae9 with SMTP id u5-20020a056870420500b0022982360ae9mr7453175oac.59.1711375154177;
        Mon, 25 Mar 2024 06:59:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5176:2c0a:cfc0:1ada? ([2a01:e0a:982:cbb0:5176:2c0a:cfc0:1ada])
        by smtp.gmail.com with ESMTPSA id c20-20020a63d514000000b005dc4da2121fsm5969750pgg.6.2024.03.25.06.59.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 06:59:13 -0700 (PDT)
Message-ID: <82e09104-8006-4074-9700-2dec08194ac4@linaro.org>
Date: Mon, 25 Mar 2024 14:59:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] pinctrl/meson: fix typo in PDM's pin name
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>,
 Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240325113058.248022-1-jan.dakinevich@salutedevices.com>
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
In-Reply-To: <20240325113058.248022-1-jan.dakinevich@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_065928_598819_B9CCBB04 
X-CRM114-Status: GOOD (  14.41  )
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

On 25/03/2024 12:30, Jan Dakinevich wrote:
> Other pins have _a or _x suffix, but this one doesn't have any. Most
> likely this is a typo.
> 
> Fixes: dabad1ff8561 ("pinctrl: meson: add pinctrl driver support for Meson-A1 SoC")
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> ---
> Links:
> 
>   [1] https://lore.kernel.org/lkml/20240314232201.2102178-1-jan.dakinevich@salutedevices.com/
> 
> Changes:
>    v1 -> v2: Detached from v1's series (patch 15)
> 
>   drivers/pinctrl/meson/pinctrl-meson-a1.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-a1.c b/drivers/pinctrl/meson/pinctrl-meson-a1.c
> index 79f5d753d7e1..50a87d9618a8 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-a1.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-a1.c
> @@ -250,7 +250,7 @@ static const unsigned int pdm_dclk_x_pins[]		= { GPIOX_10 };
>   static const unsigned int pdm_din2_a_pins[]		= { GPIOA_6 };
>   static const unsigned int pdm_din1_a_pins[]		= { GPIOA_7 };
>   static const unsigned int pdm_din0_a_pins[]		= { GPIOA_8 };
> -static const unsigned int pdm_dclk_pins[]		= { GPIOA_9 };
> +static const unsigned int pdm_dclk_a_pins[]		= { GPIOA_9 };
>   
>   /* gen_clk */
>   static const unsigned int gen_clk_x_pins[]		= { GPIOX_7 };
> @@ -591,7 +591,7 @@ static struct meson_pmx_group meson_a1_periphs_groups[] = {
>   	GROUP(pdm_din2_a,		3),
>   	GROUP(pdm_din1_a,		3),
>   	GROUP(pdm_din0_a,		3),
> -	GROUP(pdm_dclk,			3),
> +	GROUP(pdm_dclk_a,		3),
>   	GROUP(pwm_c_a,			3),
>   	GROUP(pwm_b_a,			3),
>   
> @@ -755,7 +755,7 @@ static const char * const spi_a_groups[] = {
>   
>   static const char * const pdm_groups[] = {
>   	"pdm_din0_x", "pdm_din1_x", "pdm_din2_x", "pdm_dclk_x", "pdm_din2_a",
> -	"pdm_din1_a", "pdm_din0_a", "pdm_dclk",
> +	"pdm_din1_a", "pdm_din0_a", "pdm_dclk_a",
>   };
>   
>   static const char * const gen_clk_groups[] = {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
