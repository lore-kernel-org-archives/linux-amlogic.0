Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B8EC4345F
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 May 2024 08:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M2VVkLvByvnvgk5TTDHGpgQwBMUGzczq5dpoA8VwNXM=; b=42/UzuVvDtMmynOd9vmQaqRlJZ
	TK/LvO2+Yyx//R+2N62CeDsa/Mgw6apD2UhqHzS83xzs13VlKyVBmqYv+oa7FnBNoNk9ld1EuTC6s
	90XX+hi3mCamqV59cWBw2vhqOkhukbCfSlDzkoH4zClArNdAbEkVjPlzZp4DhjDsKqwhrevIwGa+y
	SpiPC3FEv08VkDN94jbNtr4pA95OdjbZtogL2AVPWByyVz+NddbsO+igg1o5p99IP7Xw6QUI1zItk
	dJw7FF+anQ1TPSHnulha6f4QijfMIbfCSTaZaWKYM4tT8IxHBd4nwJApgC0UYVBMt++vznmhmyUPJ
	dJXq/4IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2oVD-0000000Fi1V-311o;
	Fri, 03 May 2024 08:42:47 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2oV9-0000000Fhzn-20Pb
	for linux-amlogic@lists.infradead.org;
	Fri, 03 May 2024 08:42:44 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-51ab4ee9df8so10939694e87.1
        for <linux-amlogic@lists.infradead.org>; Fri, 03 May 2024 01:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714725760; x=1715330560; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mYoRu527Djh8ZG1yR7a+brPHoHQwejy0Kxn14NxRy3M=;
        b=oZPTGBTlPmVdclVsdvr2DabnmM35FtcBgQXUDsPbDo/9OlfqIaJSMM8OZ8AXRLKb6J
         x7Vn5zsBlysN+b1/ktDESkx/zX7Ye4hgkMo6TczjPDibDpmatn3a0+ExVs8hqkwl66uf
         Rdpw4C53U64PiN3r8vgxeUuilcGZN0Op+u67RV6m4BwvE9phZZnxj1uUnlb8uNC9EByh
         ogu/AwAE0ySyV8sQFSWOppDetTtGNxPgPM4/d5Z8JzqI46XGvVQBKvS2fKXj+xrl/JaU
         jdNKGSmzqsCxScUX3+MNUtfNGPVKVEpFyL+DnfG/uHX32jWPihBnemzI8clkIil2RiUp
         VL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714725760; x=1715330560;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mYoRu527Djh8ZG1yR7a+brPHoHQwejy0Kxn14NxRy3M=;
        b=LoNEKks8psVHDXhTNOe6IPObnr0vaStfZGsUb0uunx9PVyhcHGef14okQvTWYw2/B/
         gyE51rQejsEdGDq1YQj62qLqdvPqVHq/FWDZv5Kb5FZ33EZJVA5dIvCX0Xpb6jBsn1La
         nachGwKpPsbOyq38Vob1ROjLydEuGgxu+c/hkZmXiCi4QPHa9q0FDE5GKor8petRMGKv
         9ov2nvUFbJiofyHBiSIFxDU8bT6muQGKzkvEzIX1/Sw2YgGRct4RP1ouS7AHQ/S7yaRC
         PK29X6hdn+bRIhVS84hhmxkFIUYlamzJ05FCxbYuP2UqWleoIDIXOPg/qKtHkceHYuJ4
         d+ew==
X-Forwarded-Encrypted: i=1; AJvYcCXjHPiib3siEMVL/aF2DbdElhuienbajvUG1xgznqwuomBesB88Ug2z3Zs3D6pbg4P5jhR2io7dIDLaW4YQgpwwd50eWqdR3dIaDcht4NtkFQM=
X-Gm-Message-State: AOJu0YxwxFgNNQtBGvoqm02H1/rw6AseCYqqEabXWHEn7yGaw8HRWoe9
	GcyWFrQ5ik1+zABnq+5lbptkK6G+PDiAzbq9s+eSEZfuI7rnkSAccFPDZGEyCBI=
X-Google-Smtp-Source: AGHT+IFjj2VXVI4GYTa+9MVFooqDbutk3qTYh1g2xyD+WgAXrK00lZRLsFkT67EwWybHsADpYViXGg==
X-Received: by 2002:ac2:5e29:0:b0:51e:15d1:b2d6 with SMTP id o9-20020ac25e29000000b0051e15d1b2d6mr1100584lfg.50.1714725760440;
        Fri, 03 May 2024 01:42:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:e481:a79a:a1d8:3ad2? ([2a01:e0a:cad:2140:e481:a79a:a1d8:3ad2])
        by smtp.gmail.com with ESMTPSA id s3-20020adfe003000000b0034e8a10039esm177867wrh.10.2024.05.03.01.42.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 May 2024 01:42:40 -0700 (PDT)
Message-ID: <bc8523bb-8d51-46c6-a011-7c46bb62acfa@linaro.org>
Date: Fri, 3 May 2024 10:42:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] drm/meson: dw-hdmi: power up phy on device init
To: Jerome Brunet <jbrunet@baylibre.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240426160256.3089978-1-jbrunet@baylibre.com>
 <20240426160256.3089978-2-jbrunet@baylibre.com>
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
In-Reply-To: <20240426160256.3089978-2-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_014243_582439_C61B4209 
X-CRM114-Status: GOOD (  21.29  )
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

On 26/04/2024 18:02, Jerome Brunet wrote:
> The phy is not in a useful state right after init. It will become useful,
> including for auxiliary function such as CEC or ARC, after the first mode
> is set. This is a problem on systems where the display is using another
> interface like DSI or CVBS.
> 
> This change refactor the init and mode change callback to power up the PHY
> on init and leave only what is necessary for mode changes in the related
> function. This is enough to fix CEC operation when HDMI display is not
> enabled.
> 
> Fixes: 3f68be7d8e96 ("drm/meson: Add support for HDMI encoder and DW-HDMI bridge + PHY")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/gpu/drm/meson/meson_dw_hdmi.c | 51 +++++++++------------------
>   1 file changed, 17 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 5a9538bc0e26..a83d93078537 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -384,26 +384,6 @@ static int dw_hdmi_phy_init(struct dw_hdmi *hdmi, void *data,
>   	    dw_hdmi_bus_fmt_is_420(hdmi))
>   		mode_is_420 = true;
>   
> -	/* Enable clocks */
> -	regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL, 0xffff, 0x100);
> -
> -	/* Bring HDMITX MEM output of power down */
> -	regmap_update_bits(priv->hhi, HHI_MEM_PD_REG0, 0xff << 8, 0);
> -
> -	/* Bring out of reset */
> -	dw_hdmi->data->top_write(dw_hdmi, HDMITX_TOP_SW_RESET,  0);
> -
> -	/* Enable internal pixclk, tmds_clk, spdif_clk, i2s_clk, cecclk */
> -	dw_hdmi_top_write_bits(dw_hdmi, HDMITX_TOP_CLK_CNTL,
> -			       0x3, 0x3);
> -
> -	/* Enable cec_clk and hdcp22_tmdsclk_en */
> -	dw_hdmi_top_write_bits(dw_hdmi, HDMITX_TOP_CLK_CNTL,
> -			       0x3 << 4, 0x3 << 4);
> -
> -	/* Enable normal output to PHY */
> -	dw_hdmi->data->top_write(dw_hdmi, HDMITX_TOP_BIST_CNTL, BIT(12));
> -
>   	/* TMDS pattern setup */
>   	if (mode->clock > 340000 && !mode_is_420) {
>   		dw_hdmi->data->top_write(dw_hdmi, HDMITX_TOP_TMDS_CLK_PTTN_01,
> @@ -425,20 +405,6 @@ static int dw_hdmi_phy_init(struct dw_hdmi *hdmi, void *data,
>   	/* Setup PHY parameters */
>   	meson_hdmi_phy_setup_mode(dw_hdmi, mode, mode_is_420);
>   
> -	/* Setup PHY */
> -	regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1,
> -			   0xffff << 16, 0x0390 << 16);
> -
> -	/* BIT_INVERT */
> -	if (dw_hdmi_is_compatible(dw_hdmi, "amlogic,meson-gxl-dw-hdmi") ||
> -	    dw_hdmi_is_compatible(dw_hdmi, "amlogic,meson-gxm-dw-hdmi") ||
> -	    dw_hdmi_is_compatible(dw_hdmi, "amlogic,meson-g12a-dw-hdmi"))
> -		regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1,
> -				   BIT(17), 0);
> -	else
> -		regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1,
> -				   BIT(17), BIT(17));
> -
>   	/* Disable clock, fifo, fifo_wr */
>   	regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1, 0xf, 0);
>   
> @@ -656,6 +622,23 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
>   	meson_dw_hdmi->data->top_write(meson_dw_hdmi,
>   				       HDMITX_TOP_CLK_CNTL, 0xff);
>   
> +	/* Enable normal output to PHY */
> +	meson_dw_hdmi->data->top_write(meson_dw_hdmi, HDMITX_TOP_BIST_CNTL, BIT(12));
> +
> +	/* Setup PHY */
> +	regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1,
> +			   0xffff << 16, 0x0390 << 16);
> +
> +	/* BIT_INVERT */
> +	if (dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-gxl-dw-hdmi") ||
> +	    dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-gxm-dw-hdmi") ||
> +	    dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-g12a-dw-hdmi"))
> +		regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1,
> +				   BIT(17), 0);
> +	else
> +		regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1,
> +				   BIT(17), BIT(17));
> +
>   	/* Enable HDMI-TX Interrupt */
>   	meson_dw_hdmi->data->top_write(meson_dw_hdmi, HDMITX_TOP_INTR_STAT_CLR,
>   				       HDMITX_TOP_INTR_CORE);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
