Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A8EC3DA59
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Jul 2024 09:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gqQmnFUYTxKRI+zolg7erXbP4WFBx/eFY49MllquYMM=; b=IfglIE/4qPaukTgOHHL9Mu4U8H
	mNfeuwyKZUDeWSadSqvCl+0exALtMvZlepiCRJZoyKW2byRwQuaG3zZTKO47NjWO3wc4GVN47Ls/r
	5SY4HC/iS9oV3p5ohWdwfG3x9mJSDdJ2otHWnMpH8ImbX4w3lhx7ivGdAjS7Q3ddRIxi6JFeNwijy
	0FX12HzLWzmtQZoPDAFFU6WkLNkOJxCpPSTVZap2Y5H716Qvy5PqAgbnttmW1C+E33iWWPaPr4VBT
	ysujyosH1hpnQqrX5tb/398Jsjgva8t3GVxaUpOFIoS1TMxD9XEs7uHmvY6/q+GGzUMdB0tvkZYTd
	a7QKKKFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUkOW-00000002Ktj-24o7;
	Fri, 19 Jul 2024 09:59:20 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUkOT-00000002Ksw-1y8m
	for linux-amlogic@lists.infradead.org;
	Fri, 19 Jul 2024 09:59:18 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4279c10a40eso11071425e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 19 Jul 2024 02:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721383155; x=1721987955; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u0FPyw9xImHOOOT0F77KVGeWOAXsYnfRWXpu1Qn9tx4=;
        b=E3y11FqAoqne2AqvUXlB/LynO5n6At0BOFYliGZdwiZwHwjSylxa4fDNzX9Y9P3kda
         3zXmRsTUwAvKp2jzCigluCveDme9Wfc9Q3fqJaecjkadqlOT9Ur/DHV2cGfu5uGzcVUB
         5l3tKaItZBBka0Rr9pEAyWOuWD6iXGDYDw+lD/VRAooRAG5Nyv0lzX8OLfGuEBe6LHle
         gQMhrSmRJguGiTqCmWVV7T25PssMJ4o2ZN5sq1/+WQTM/RfXIwOt1lKcvoQ7w+G3Keb4
         598QGaU0Sn70taqs2JL6E8e2tUfwKhiMwhlSEvlX/qWmHYEv0tukhnxkGSpRIPSlq7cU
         wS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721383155; x=1721987955;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=u0FPyw9xImHOOOT0F77KVGeWOAXsYnfRWXpu1Qn9tx4=;
        b=AnVexCofxaYGqat1rTQtYQldixHnDx92+hE5AkuLoS6r9pDWz6doFF8SvdwXjPDtak
         crcGKDeSlZy2BqAhx2e51crXr68u11onBA15sQx3lAGxQYADix+BwE9D9jEjKZys6RAL
         LC63M1/fTqd/aV2tGLCv2mMhgvf3eg/Xcp+rLMDSlJ1QJlWdLo3a3jiF90sXHZ34uMl8
         s4OX66Bku4OxCoOP+ZymIPlrw2c3Ye79m9MtCezEDyJM6dxUFh+yubVwm0xRZQzHpgeL
         jm090dwRra8gz6qxUyFgeiFu7tsIQnaaU5EuU5bOWKAGUKlvS8IsGR2trVQQs+WdmpGk
         5W2g==
X-Forwarded-Encrypted: i=1; AJvYcCUMqqPjDAfp2G5aToeVdJ1cEWxC4dAZasFZ8LRpVQqC31KQjGOUleLxaVB22VQAVeK4d17+KB5B6ZgxVhiMbIft3wmBAH3oO/KQpt6VRVOiWsA=
X-Gm-Message-State: AOJu0Yw5mbZEiwYzi+yJL1uynYtnJCxHlcSfqVgvTHmR6CdQ0Gf8OVqg
	D/CG/LDI4cbH4z32m5LylPG3/CvTii4lAH76grgNr1oAZ8DDive6zgWB+eGeF+4=
X-Google-Smtp-Source: AGHT+IEW/vrpFybzO18z+EE1eYgzPxmvGwr4RswHCKyvMGlhoo9a2CzS1t/KunO7TkXV0sieu5vNJQ==
X-Received: by 2002:a05:6000:186:b0:368:3717:10c7 with SMTP id ffacd0b85a97d-36837171221mr4656534f8f.4.1721383155186;
        Fri, 19 Jul 2024 02:59:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ec82:adbe:8be7:588d? ([2a01:e0a:982:cbb0:ec82:adbe:8be7:588d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3687869447dsm1151425f8f.53.2024.07.19.02.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jul 2024 02:59:14 -0700 (PDT)
Message-ID: <5c57fbc8-d911-46ee-b421-ec31a00e0f91@linaro.org>
Date: Fri, 19 Jul 2024 11:59:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/3] clk: meson: axg-audio: setup regmap max_register
 based on the SoC
To: Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240719093934.3985139-1-jbrunet@baylibre.com>
 <20240719093934.3985139-3-jbrunet@baylibre.com>
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
In-Reply-To: <20240719093934.3985139-3-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_025917_550693_9D1FF67B 
X-CRM114-Status: GOOD (  18.97  )
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

On 19/07/2024 11:39, Jerome Brunet wrote:
> The register region of axg-audio tends to grow with the addition of
> new supported SoC. Mapping slightly more has not been causing problem
> so far but it is not viable to continue like this long term.
> 
> Setup the max register based on what is necessary on the related SoC.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/clk/meson/axg-audio.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
> index e03a5bf899c0..2426f3dbb7a2 100644
> --- a/drivers/clk/meson/axg-audio.c
> +++ b/drivers/clk/meson/axg-audio.c
> @@ -1726,11 +1726,10 @@ static const struct reset_control_ops axg_audio_rstc_ops = {
>   	.status = axg_audio_reset_status,
>   };
>   
> -static const struct regmap_config axg_audio_regmap_cfg = {
> +static struct regmap_config axg_audio_regmap_cfg = {
>   	.reg_bits	= 32,
>   	.val_bits	= 32,
>   	.reg_stride	= 4,
> -	.max_register	= AUDIO_CLK_SPDIFOUT_B_CTRL,
>   };
>   
>   struct audioclk_data {
> @@ -1739,6 +1738,7 @@ struct audioclk_data {
>   	struct meson_clk_hw_data hw_clks;
>   	unsigned int reset_offset;
>   	unsigned int reset_num;
> +	unsigned int max_register;
>   };
>   
>   static int axg_audio_clkc_probe(struct platform_device *pdev)
> @@ -1760,6 +1760,7 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
>   	if (IS_ERR(regs))
>   		return PTR_ERR(regs);
>   
> +	axg_audio_regmap_cfg.max_register = data->max_register;
>   	map = devm_regmap_init_mmio(dev, regs, &axg_audio_regmap_cfg);
>   	if (IS_ERR(map)) {
>   		dev_err(dev, "failed to init regmap: %ld\n", PTR_ERR(map));
> @@ -1828,6 +1829,7 @@ static const struct audioclk_data axg_audioclk_data = {
>   		.hws = axg_audio_hw_clks,
>   		.num = ARRAY_SIZE(axg_audio_hw_clks),
>   	},
> +	.max_register = AUDIO_CLK_PDMIN_CTRL1,
>   };
>   
>   static const struct audioclk_data g12a_audioclk_data = {
> @@ -1839,6 +1841,7 @@ static const struct audioclk_data g12a_audioclk_data = {
>   	},
>   	.reset_offset = AUDIO_SW_RESET,
>   	.reset_num = 26,
> +	.max_register = AUDIO_CLK_SPDIFOUT_B_CTRL,
>   };
>   
>   static const struct audioclk_data sm1_audioclk_data = {
> @@ -1850,6 +1853,7 @@ static const struct audioclk_data sm1_audioclk_data = {
>   	},
>   	.reset_offset = AUDIO_SM1_SW_RESET0,
>   	.reset_num = 39,
> +	.max_register = AUDIO_CLK_SPDIFOUT_B_CTRL,
>   };
>   
>   static const struct of_device_id clkc_match_table[] = {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
