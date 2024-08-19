Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2848DC3DA4A
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Aug 2024 16:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f7X7G3CUzgvZSNcEhsLxBQ2Barc72YpE7pTXBBlc7/k=; b=4Tpl0arDCn3var6uaEuu6ZUv6T
	/46WgLUz8krg32mQMWolvwdDGQetlM9F/r2D68FHIiqkugHqS5SAOpUVlMg0lYUFe300D62kJsFCa
	T3ibtNn4Bat+AP3ZHT5i2XU/w73lX1XpcImzGehphk3YQ8d2EnS4Ti2YWEZwPg2NnWbqvJDCrK/XO
	aFubtN08mvlmaUEzKuCLcCQlcUd6uhIR1VTAA+0OwHJm/n8j4aywu+9G8WbEY+8raRFgzQapI1enO
	X1Sf6Kkt+PTDBPi3kE1eJ8MSgSmixz079wbBWBQavRKlDzm16keGX6f5MC6uIbjY+u8Eh5r/9Nqtr
	+/4pOG5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg5CR-000000029G7-21t2;
	Mon, 19 Aug 2024 16:25:43 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg5CD-000000029BX-2pv7
	for linux-amlogic@lists.infradead.org;
	Mon, 19 Aug 2024 16:25:31 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4280bbdad3dso35278355e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Aug 2024 09:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724084727; x=1724689527; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zAfOoil+xSJAR5q6nqnB5mON1LAsc+BRD3hYB0z83rk=;
        b=rh4hMF4wrUhNfkSjJS687B16PT8WphTYE3oXPvyRvxp+sanjQgoGL5J7xyhbkWdJu2
         JZAq/UvCs2v4Pth4IyOTvpKlbvxTaWwA8X5dHDUDNLeNfIww4w10duKL98WuCoXKxO7H
         V4BcZpJAIV+3nDqCe62W0Q9Tkr8qj4FxZq87Vq8aRF5PTx0rrMLPgs0pTDPF6iGzyOId
         SDT103tS7jt6OzF5Asq44XXMcLk+jEYjt1OWNRq3cqy/T8EPknKWcTmz5fDp42O/zDCK
         Wmo2GmQ0vrEYzrNGiX1ZVtcFgmwB8Vv6BWxFewBnWavoQRs07vlvaiTXHhro5+QU+mFU
         dKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724084727; x=1724689527;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zAfOoil+xSJAR5q6nqnB5mON1LAsc+BRD3hYB0z83rk=;
        b=nZzg8iQ/xNATXjajIrG4KiaiHis6ylF/Pah4Yxhxk6UrAtDpj6H12FvIA4jv7V9fAJ
         pCejH3DsJ8Ul6/CXN/I+oBKyn294CIE4QKicfWQd5qMaFYgjURM322GKa1bylNbXjYn4
         YAGE6rtW8j1kIp6q/XkhBefpJwuy8BkroH+LtAch3M3Q5GF89iLrC9ZCWO4Kuz9q+s5E
         HDkn60b1Z/fFyH/1WaO2oWM8g6ki0ObhYo4QLaoA4wgMs6nS0mtknfCoerDkIrSmpwzN
         6LHvOQUXfuYogYUZVSi/t/7+8iEkHL+U4WSJIJRfzrqoarx5PksnrNeyqbQmDh4oau68
         6yZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWY69zpUk2ByF3NFkMt7iEgydfNIFoYGsyl0CiUyqJOImS1MHjo1P+vlG3yGWgLBm2SBoTvysHNDl/3EjwRp8bUIdEmluAH8VSg7nP3+qnMlUc=
X-Gm-Message-State: AOJu0YwSVx8r+BTleuENROBtiRWH56jNjAxT+D0VVqKxBZPYssOjGgMo
	kMV5I6Q+Hi1WR+/bBWm5q0DFQyRj9IsAJoMuloBfAMmZP05H6icWpdxktUr4FFE=
X-Google-Smtp-Source: AGHT+IF9jZI0YvkqOqKNcUIzh3MIcJmPZrFWhWk6bQhrpuZ7zBxPQ+ACZHBt4NdBuWl0n7DZDvHV2g==
X-Received: by 2002:a05:600c:4ecb:b0:426:6379:3b4f with SMTP id 5b1f17b1804b1-429ed7dba98mr80500315e9.31.1724084725718;
        Mon, 19 Aug 2024 09:25:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f54e:4b0a:5175:5727? ([2a01:e0a:982:cbb0:f54e:4b0a:5175:5727])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed6585d1sm114210995e9.22.2024.08.19.09.25.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 09:25:25 -0700 (PDT)
Message-ID: <0e6afba4-4312-49b4-bd92-23f12faf449a@linaro.org>
Date: Mon, 19 Aug 2024 18:25:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 7/9] drm/meson: dw-hdmi: use matched data
To: Jerome Brunet <jbrunet@baylibre.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240730125023.710237-1-jbrunet@baylibre.com>
 <20240730125023.710237-8-jbrunet@baylibre.com>
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
In-Reply-To: <20240730125023.710237-8-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_092529_768951_BB9F6218 
X-CRM114-Status: GOOD (  24.93  )
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

On 30/07/2024 14:50, Jerome Brunet wrote:
> Using several string comparisons with if/else if/else clauses
> is fairly inefficient and does not scale well.

Inefficient in which way ? speed ? code size ?

It doesn't scale, but AFAIK Amlogic stopped using the Synopsys DWC controller after the G12B SoCs....

> 
> Use matched data to tweak the driver depending on the matched
> SoC instead.

This leads to a very overcomplicated code I'll need some time to review and understand

> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/gpu/drm/meson/meson_dw_hdmi.c | 209 +++++++++++++++++---------
>   1 file changed, 139 insertions(+), 70 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 7c39e5c99043..ef059c5ef520 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -125,8 +125,17 @@
>   #define HHI_HDMI_PHY_CNTL4	0x3b0 /* 0xec */
>   #define HHI_HDMI_PHY_CNTL5	0x3b4 /* 0xed */
>   
> +struct meson_dw_hdmi_speed {
> +	const struct reg_sequence *regs;
> +	unsigned int reg_num;
> +	unsigned int limit;
> +};
> +
>   struct meson_dw_hdmi_data {
>   	int (*reg_init)(struct device *dev);
> +	const struct meson_dw_hdmi_speed *speeds;
> +	unsigned int speed_num;
> +	bool use_drm_infoframe;
>   	u32 cntl0_init;
>   	u32 cntl1_init;
>   };
> @@ -185,78 +194,33 @@ struct meson_dw_hdmi {
>   	struct regmap *top;
>   };
>   
> -static inline int dw_hdmi_is_compatible(struct meson_dw_hdmi *dw_hdmi,
> -					const char *compat)
> -{
> -	return of_device_is_compatible(dw_hdmi->dev->of_node, compat);
> -}
> -
> -/* Bridge */
> -
>   /* Setup PHY bandwidth modes */
> -static void meson_hdmi_phy_setup_mode(struct meson_dw_hdmi *dw_hdmi,
> +static int meson_hdmi_phy_setup_mode(struct meson_dw_hdmi *dw_hdmi,
>   				      const struct drm_display_mode *mode,
>   				      bool mode_is_420)
>   {
>   	struct meson_drm *priv = dw_hdmi->priv;
>   	unsigned int pixel_clock = mode->clock;
> +	int i;
>   
>   	/* For 420, pixel clock is half unlike venc clock */
> -	if (mode_is_420) pixel_clock /= 2;
> -
> -	if (dw_hdmi_is_compatible(dw_hdmi, "amlogic,meson-gxl-dw-hdmi") ||
> -	    dw_hdmi_is_compatible(dw_hdmi, "amlogic,meson-gxm-dw-hdmi")) {
> -		if (pixel_clock >= 371250) {
> -			/* 5.94Gbps, 3.7125Gbps */
> -			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, 0x333d3282);
> -			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL3, 0x2136315b);
> -		} else if (pixel_clock >= 297000) {
> -			/* 2.97Gbps */
> -			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, 0x33303382);
> -			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL3, 0x2036315b);
> -		} else if (pixel_clock >= 148500) {
> -			/* 1.485Gbps */
> -			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, 0x33303362);
> -			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL3, 0x2016315b);
> -		} else {
> -			/* 742.5Mbps, and below */
> -			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, 0x33604142);
> -			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL3, 0x0016315b);
> -		}
> -	} else if (dw_hdmi_is_compatible(dw_hdmi,
> -					 "amlogic,meson-gxbb-dw-hdmi")) {
> -		if (pixel_clock >= 371250) {
> -			/* 5.94Gbps, 3.7125Gbps */
> -			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, 0x33353245);
> -			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL3, 0x2100115b);
> -		} else if (pixel_clock >= 297000) {
> -			/* 2.97Gbps */
> -			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, 0x33634283);
> -			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL3, 0xb000115b);
> -		} else {
> -			/* 1.485Gbps, and below */
> -			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, 0x33632122);
> -			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL3, 0x2000115b);
> -		}
> -	} else if (dw_hdmi_is_compatible(dw_hdmi,
> -					 "amlogic,meson-g12a-dw-hdmi")) {
> -		if (pixel_clock >= 371250) {
> -			/* 5.94Gbps, 3.7125Gbps */
> -			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, 0x37eb65c4);
> -			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL3, 0x2ab0ff3b);
> -			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL5, 0x0000080b);
> -		} else if (pixel_clock >= 297000) {
> -			/* 2.97Gbps */
> -			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, 0x33eb6262);
> -			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL3, 0x2ab0ff3b);
> -			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL5, 0x00000003);
> -		} else {
> -			/* 1.485Gbps, and below */
> -			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, 0x33eb4242);
> -			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL3, 0x2ab0ff3b);
> -			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL5, 0x00000003);
> -		}
> +	if (mode_is_420)
> +		pixel_clock /= 2;
> +
> +	for (i = 0; i < dw_hdmi->data->speed_num; i++) {
> +		if (pixel_clock >= dw_hdmi->data->speeds[i].limit)
> +			break;
>   	}
> +
> +	/* No match found - Last entry should have a 0 limit */
> +	if (WARN_ON(i == dw_hdmi->data->speed_num))
> +		return -EINVAL;
> +
> +	regmap_multi_reg_write(priv->hhi,
> +			       dw_hdmi->data->speeds[i].regs,
> +			       dw_hdmi->data->speeds[i].reg_num);
> +
> +	return 0;
>   }
>   
>   static inline void meson_dw_hdmi_phy_reset(struct meson_dw_hdmi *dw_hdmi)
> @@ -543,22 +507,133 @@ static int meson_dw_init_regmap_g12(struct device *dev)
>   	return 0;
>   }
>   
> +static const struct reg_sequence gxbb_3g7_regs[] = {
> +	{ .reg = HHI_HDMI_PHY_CNTL0, .def = 0x33353245 },
> +	{ .reg = HHI_HDMI_PHY_CNTL3, .def = 0x2100115b },
> +};
> +
> +static const struct reg_sequence gxbb_3g_regs[] = {
> +	{ .reg = HHI_HDMI_PHY_CNTL0, .def = 0x33634283 },
> +	{ .reg = HHI_HDMI_PHY_CNTL3, .def = 0xb000115b },
> +};
> +
> +static const struct reg_sequence gxbb_def_regs[] = {
> +	{ .reg = HHI_HDMI_PHY_CNTL0, .def = 0x33632122 },
> +	{ .reg = HHI_HDMI_PHY_CNTL3, .def = 0x2000115b },
> +};
> +
> +static const struct meson_dw_hdmi_speed gxbb_speeds[] = {
> +	{
> +		.limit = 371250,
> +		.regs = gxbb_3g7_regs,
> +		.reg_num = ARRAY_SIZE(gxbb_3g7_regs)
> +	}, {
> +		.limit = 297000,
> +		.regs = gxbb_3g_regs,
> +		.reg_num = ARRAY_SIZE(gxbb_3g_regs)
> +	}, {
> +		.regs = gxbb_def_regs,
> +		.reg_num = ARRAY_SIZE(gxbb_def_regs)
> +	}
> +};
> +
>   static const struct meson_dw_hdmi_data meson_dw_hdmi_gxbb_data = {
>   	.reg_init = meson_dw_init_regmap_gx,
>   	.cntl0_init = 0x0,
>   	.cntl1_init = PHY_CNTL1_INIT | PHY_INVERT,
> +	.use_drm_infoframe = false,
> +	.speeds = gxbb_speeds,
> +	.speed_num = ARRAY_SIZE(gxbb_speeds),
> +};
> +
> +static const struct reg_sequence gxl_3g7_regs[] = {
> +	{ .reg = HHI_HDMI_PHY_CNTL0, .def = 0x333d3282 },
> +	{ .reg = HHI_HDMI_PHY_CNTL3, .def = 0x2136315b },
> +};
> +
> +static const struct reg_sequence gxl_3g_regs[] = {
> +	{ .reg = HHI_HDMI_PHY_CNTL0, .def = 0x33303382 },
> +	{ .reg = HHI_HDMI_PHY_CNTL3, .def = 0x2036315b },
> +};
> +
> +static const struct reg_sequence gxl_def_regs[] = {
> +	{ .reg = HHI_HDMI_PHY_CNTL0, .def = 0x33303362 },
> +	{ .reg = HHI_HDMI_PHY_CNTL3, .def = 0x2016315b },
> +};
> +
> +static const struct reg_sequence gxl_270m_regs[] = {
> +	{ .reg = HHI_HDMI_PHY_CNTL0, .def = 0x33604142 },
> +	{ .reg = HHI_HDMI_PHY_CNTL3, .def = 0x0016315b },
> +};
> +
> +static const struct meson_dw_hdmi_speed gxl_speeds[] = {
> +	{
> +		.limit = 371250,
> +		.regs = gxl_3g7_regs,
> +		.reg_num = ARRAY_SIZE(gxl_3g7_regs)
> +	}, {
> +		.limit = 297000,
> +		.regs = gxl_3g_regs,
> +		.reg_num = ARRAY_SIZE(gxl_3g_regs)
> +	}, {
> +		.limit = 148500,
> +		.regs = gxl_def_regs,
> +		.reg_num = ARRAY_SIZE(gxl_def_regs)
> +	}, {
> +		.regs = gxl_270m_regs,
> +		.reg_num = ARRAY_SIZE(gxl_270m_regs)
> +	}
>   };
>   
>   static const struct meson_dw_hdmi_data meson_dw_hdmi_gxl_data = {
>   	.reg_init = meson_dw_init_regmap_gx,
>   	.cntl0_init = 0x0,
>   	.cntl1_init = PHY_CNTL1_INIT,
> +	.use_drm_infoframe = true,
> +	.speeds = gxl_speeds,
> +	.speed_num = ARRAY_SIZE(gxl_speeds),
> +};
> +
> +static const struct reg_sequence g12a_3g7_regs[] = {
> +	{ .reg = HHI_HDMI_PHY_CNTL0, .def = 0x37eb65c4 },
> +	{ .reg = HHI_HDMI_PHY_CNTL3, .def = 0x2ab0ff3b },
> +	{ .reg = HHI_HDMI_PHY_CNTL5, .def = 0x0000080b },
> +};
> +
> +static const struct reg_sequence g12a_3g_regs[] = {
> +	{ .reg = HHI_HDMI_PHY_CNTL0, .def = 0x33eb6262 },
> +	{ .reg = HHI_HDMI_PHY_CNTL3, .def = 0x2ab0ff3b },
> +	{ .reg = HHI_HDMI_PHY_CNTL5, .def = 0x00000003 },
> +};
> +
> +static const struct reg_sequence g12a_def_regs[] = {
> +	{ .reg = HHI_HDMI_PHY_CNTL0, .def = 0x33eb4242 },
> +	{ .reg = HHI_HDMI_PHY_CNTL3, .def = 0x2ab0ff3b },
> +	{ .reg = HHI_HDMI_PHY_CNTL5, .def = 0x00000003 },
> +};
> +
> +static const struct meson_dw_hdmi_speed g12a_speeds[] = {
> +	{
> +		.limit = 371250,
> +		.regs = g12a_3g7_regs,
> +		.reg_num = ARRAY_SIZE(g12a_3g7_regs)
> +	}, {
> +		.limit = 297000,
> +		.regs = g12a_3g_regs,
> +		.reg_num = ARRAY_SIZE(g12a_3g_regs)
> +	}, {
> +		.regs = g12a_def_regs,
> +		.reg_num = ARRAY_SIZE(g12a_def_regs)
> +	}
>   };
>   
>   static const struct meson_dw_hdmi_data meson_dw_hdmi_g12a_data = {
>   	.reg_init = meson_dw_init_regmap_g12,
>   	.cntl0_init = 0x000b4242, /* Bandgap */
>   	.cntl1_init = PHY_CNTL1_INIT,
> +	.use_drm_infoframe = true,
> +	.speeds = g12a_speeds,
> +	.speed_num = ARRAY_SIZE(g12a_speeds),
>   };
>   
>   static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
> @@ -590,7 +665,6 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>   	platform_set_drvdata(pdev, meson_dw_hdmi);
>   
>   	meson_dw_hdmi->priv = priv;
> -	meson_dw_hdmi->dev = dev;

Unrelated change

>   	meson_dw_hdmi->data = match;
>   	dw_plat_data = &meson_dw_hdmi->dw_plat_data;
>   
> @@ -650,7 +724,6 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>   	meson_dw_hdmi_init(meson_dw_hdmi);
>   
>   	/* Bridge / Connector */
> -

Unrelated change

>   	dw_plat_data->priv_data = meson_dw_hdmi;
>   	dw_plat_data->phy_ops = &meson_dw_hdmi_phy_ops;
>   	dw_plat_data->phy_name = "meson_dw_hdmi_phy";
> @@ -659,11 +732,7 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>   	dw_plat_data->ycbcr_420_allowed = true;
>   	dw_plat_data->disable_cec = true;
>   	dw_plat_data->output_port = 1;
> -
> -	if (dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-gxl-dw-hdmi") ||
> -	    dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-gxm-dw-hdmi") ||
> -	    dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-g12a-dw-hdmi"))
> -		dw_plat_data->use_drm_infoframe = true;
> +	dw_plat_data->use_drm_infoframe = meson_dw_hdmi->data->use_drm_infoframe;

Move this to a separate patch

>   
>   	meson_dw_hdmi->hdmi = dw_hdmi_probe(pdev, &meson_dw_hdmi->dw_plat_data);
>   	if (IS_ERR(meson_dw_hdmi->hdmi))


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
