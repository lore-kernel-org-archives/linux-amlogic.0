Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402A6CED274
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Oct 2024 07:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=80DH34R+kSwETg3w9xjmiUhy5ivleio4ahc0xwy93zo=; b=CL7XL9Q/ZYgDeynteYipx5thn0
	VzQVt7MCIjIZTDKnb5Fx2bRACBBleV873arNJETcNsE1USFQ5TtABWcMLWTeZK4tAus3JnPJT2NDM
	z2TCH/BmNrpXWVPudlmtbAuvVyFCpSVnDP4nBHYJmiBbD5u+6tJDuohKySU9eOvvEF1vV1G7U7AIQ
	2NmD1j+XI37JQU3LZZ/TB5gigUb6hDXr6eYOt8/GJF5TiCqYecw1rIcfb99QpUEx07iv+NzSHMWDV
	THNmVorVHcdcTj7vTosaJQ3Pp/Xx4cnLn9l+epdFhxmK/vBr6vkca+unVI+tl5K74A0UCdYyeSzcu
	hwzXFodg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4hR-00000004nax-35qL;
	Tue, 08 Oct 2024 07:32:05 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4gP-00000004nNs-0Xjn
	for linux-amlogic@lists.infradead.org;
	Tue, 08 Oct 2024 07:31:02 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-42cae6bb895so54450785e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 08 Oct 2024 00:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728372660; x=1728977460; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pIsj7vFU+ti15juRCV95G7yXqGY4cixULIvln2kgDKs=;
        b=JZ69x9ULibeo4C0iQNn+B2lOt7kvjnv+NkNa1BXKZeQcVEE+YqGDaT+JdgW7J6B18x
         e/WJSnSy0KH6VR3wg40DpFgs1HPbW4bTrMwWvGJb0VyXMLNol7NcxEgZ0uSb2JpVeVs0
         LvyfW+1diA0kVYMgYCtk+2S4wM7SlQusq5vdRpclhZKFOOaqWM2vXPfASlzEnsFuew1T
         T/oFo0XGCzws0HO8ZFN/2f1D7PbeHW3Bt/A/LfjCzfypHYm8rrPuWU7tKOXjEFJtyYh1
         ECMqlFASORzvY7H+FydpGQu/d3waASG4wMK0Inx8rR58Pf4+zGF8QLuiXS4AM5jXBLxZ
         4/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728372660; x=1728977460;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pIsj7vFU+ti15juRCV95G7yXqGY4cixULIvln2kgDKs=;
        b=koEsFmcK1lI6y4NzVsd5KqP5SaN568BELeTFMilBgfrLgqxb40OuIEYXDaMSmcVCN9
         mAQ54TdzWbA88nHuaYQC7DJVz3IKBusKVzpSy9OxHztoh4leAPjh7b10Osx6/TvSOjJ3
         loGTWk/TidcCPHlLHbl0tL5PhUdR1Ap7QudR8d0RnLxqsw1D5szb6hHxn9OtDnvo8mv9
         X3umAi9R8EMnaQXUMZipc8mcC8oSREdiM2VqMoIomRI1tCLOin1QFH9W21LRzFhpEc7e
         ltja8L7zYFzP5CS041I8R90rGz9pfHQtx+COmQReKy8ewvWUV5Tsbr7c3oWmCKlkRxhq
         1iYw==
X-Forwarded-Encrypted: i=1; AJvYcCXVZQ+1eAB6p7wMS/fmEHwf50qXHAvj6kZwGH8dLzSODPU3fYj9f3yxjQWvtm4Pw6/UaQcJiBekvbM+QHcP@lists.infradead.org
X-Gm-Message-State: AOJu0YzeDDy3C3e7GbhzgYy9tGqXrVaRhhSERgNg512z7MhZyGqQedxM
	97AejNTyP0pCJGDQykqkG7n4tScPJ4+JWWtEKGfEG7sF2ieQCLQlSkXqlw6arWc=
X-Google-Smtp-Source: AGHT+IEEye3Mpw5XNsLq4JeONQXCqWUOttfon77FTqlVClT66bGon9wfQEoByrAQNFgWjFDOyEuoaw==
X-Received: by 2002:a05:600c:1c19:b0:42c:bae0:f057 with SMTP id 5b1f17b1804b1-42f85aa7f6emr113500445e9.8.1728372659623;
        Tue, 08 Oct 2024 00:30:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:4595:23ef:4ba2:2d19? ([2a01:e0a:982:cbb0:4595:23ef:4ba2:2d19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f86b444f1sm117030575e9.38.2024.10.08.00.30.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 00:30:59 -0700 (PDT)
Message-ID: <7240d7c7-fc7a-4866-b8f2-bf0180525bce@linaro.org>
Date: Tue, 8 Oct 2024 09:30:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/3] pwm: meson: Use separate chip data struct for
 g12a-ee-pwm
To: George Stark <gnstark@salutedevices.com>, u.kleine-koenig@pengutronix.de,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: linux-pwm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@salutedevices.com
References: <20241007193203.1753326-1-gnstark@salutedevices.com>
 <20241007193203.1753326-3-gnstark@salutedevices.com>
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
In-Reply-To: <20241007193203.1753326-3-gnstark@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_003101_206122_CC12AAED 
X-CRM114-Status: GOOD (  13.82  )
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

On 07/10/2024 21:32, George Stark wrote:
> PWM module of g12a SoC family has different set of features than meson8
> so use separate chip data struct for it.
> 
> Signed-off-by: George Stark <gnstark@salutedevices.com>
> ---
>   drivers/pwm/pwm-meson.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
> index 5d51404bdce3..6701738c55e3 100644
> --- a/drivers/pwm/pwm-meson.c
> +++ b/drivers/pwm/pwm-meson.c
> @@ -578,6 +578,11 @@ static const struct meson_pwm_data pwm_axg_ao_data = {
>   	.channels_init = meson_pwm_init_channels_meson8b_legacy,
>   };
>   
> +static const struct meson_pwm_data pwm_g12a_ee_data = {
> +	.parent_names = { "xtal", NULL, "fclk_div4", "fclk_div3" },
> +	.channels_init = meson_pwm_init_channels_meson8b_legacy,
> +};
> +
>   static const struct meson_pwm_data pwm_g12a_ao_ab_data = {
>   	.parent_names = { "xtal", "g12a_ao_clk81", "fclk_div4", "fclk_div5" },
>   	.channels_init = meson_pwm_init_channels_meson8b_legacy,
> @@ -624,7 +629,7 @@ static const struct of_device_id meson_pwm_matches[] = {
>   	},
>   	{
>   		.compatible = "amlogic,meson-g12a-ee-pwm",
> -		.data = &pwm_meson8b_data
> +		.data = &pwm_g12a_ee_data
>   	},
>   	{
>   		.compatible = "amlogic,meson-g12a-ao-pwm-ab",

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
