Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBDEC4345F
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 May 2024 08:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=shIGccCpdbqhkjlUmByJ+zfQ61p05dALMk1/3s7+RUs=; b=njqcLHvtiVP1O0J26FVpUzDOCd
	KcZDsq81kI/MyStJSAZI19SqKL22UkfLipX5/o5gxEuYPEoGtm0L9NOBKYk0gYjY7AbptSi013vVY
	Ov9YUG1hOaN7iapIYuWrfCNRJZ+f1khA5vVcRxkwxmNtwewHCh7i+r4lke+A6DjYx46cAe7idDOxH
	GdLH984a43gZkIZ9wmtAqxrooruw41tPTX85DuqAZrYdecQF6limhO6OFAdWPurhszPAP071iU0bx
	/fw1hT9VTX2KQuDqkR2yiuthPf7V66+OLcuXW4joQUdasHugt7eLz09K93oQxGeLbSKh8IxXc/fAu
	OxrnM6pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2oZG-0000000Fiyi-2iFW;
	Fri, 03 May 2024 08:46:58 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2oZD-0000000FixS-3Ue5
	for linux-amlogic@lists.infradead.org;
	Fri, 03 May 2024 08:46:57 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-41dc9c83e57so9993565e9.0
        for <linux-amlogic@lists.infradead.org>; Fri, 03 May 2024 01:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714726011; x=1715330811; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3s3VD1w8KwFV35p/jSmlc51sDi7d4+Z33wjW3IjI2tw=;
        b=pFa824HyuRL7PgRCwNWk5WtF2oVTPY4POpFF6U62xHdsz9y1DdZCpw7c0Cn3IYEmvb
         ez0duAwDmbKZs0fCaJamMBtk++9HsdK53ch0BLyDhRxjCFtzx4JGqcjUXK760EzrCxxd
         lSaL+pkE252YtZMI8dBSFPbg7dFVS0ylXues05BPHgUP3QmaRdpZ3Z8jdDSbfMgJVzMd
         j3NGFmheG417T9pLVRkHapnqdVgwCYsED8uhxuAA7SmXRto/LNr3PGdkbv/liMOt9l6x
         fPEo5n8Z5wOGZRJKJdLaSZ6LDS3Py06mJAjGfAZPMGAyOme9gS7XCp51vfxJfSvQ7Ovw
         IeTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714726011; x=1715330811;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3s3VD1w8KwFV35p/jSmlc51sDi7d4+Z33wjW3IjI2tw=;
        b=XwpcAOVSp5fCh6E5ALBqhmxDNjrp7bRB/zWWD+cpfcnxIw0iXTTFAKJC8Y1VNM+Wgw
         mjAYWUYzxeyGrwbQsFQ2r6ZBkhzsN2ewsjDMz5TuPLg7YLkXxgLVZkO5XM2z/ZhcOtHV
         HWvilNUbfjZTOekRGHjEbXzW3uSKImDm1b8AakRC1scqa6EfSxBCCkILrD4FucXSzD8s
         fw8asY/3PfuPYpRfdmHr/IrC5I9V4y/k6O+fU4lQHoE6ozk7Ubwd036c0QVk1DvSds9c
         o0FX0OPmmUDMacQ/X4kQvJnyiZafOeaQUJlsj3adDbT2wvqy+6SlCZOtdL6j9QW0K/CG
         a55Q==
X-Forwarded-Encrypted: i=1; AJvYcCUN/xx9lqDSuWpq3ON61axf0ZrWDfRQ4YB8yTZyl+1Y11ZbhHmwOfjujkrpKZ7ztk341/TIH1N7mL5Ruy60uOAUNzWZHPkx0c2s8KRSbUsFm/4=
X-Gm-Message-State: AOJu0Yx3muGxCwjWnGdUfYIyWqCJilrmA/gk3LNS+usX7skrM+wxKxLf
	hPFYQT90wIIOHQRmeN6gQHxYEVyBpg9sUQv4yuX/6l+/ZMFwPtxsSJDQgUES8nk=
X-Google-Smtp-Source: AGHT+IFRrOqPSMjIxFVJ9l01s/bqrj8yU7lizFlG479j+KZ5hLYBZ60jwmCoCEWp/5wMFx6EWVnMJg==
X-Received: by 2002:a05:600c:3b99:b0:418:bdcd:e59b with SMTP id n25-20020a05600c3b9900b00418bdcde59bmr4362402wms.7.1714726010989;
        Fri, 03 May 2024 01:46:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:e481:a79a:a1d8:3ad2? ([2a01:e0a:cad:2140:e481:a79a:a1d8:3ad2])
        by smtp.gmail.com with ESMTPSA id iv16-20020a05600c549000b0041bff91ea43sm4805857wmb.37.2024.05.03.01.46.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 May 2024 01:46:50 -0700 (PDT)
Message-ID: <572e975a-47e1-4098-9254-f90a4bb81836@linaro.org>
Date: Fri, 3 May 2024 10:46:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] drm/meson: dw-hdmi: add bandgap setting for g12
To: Jerome Brunet <jbrunet@baylibre.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240426160256.3089978-1-jbrunet@baylibre.com>
 <20240426160256.3089978-3-jbrunet@baylibre.com>
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
In-Reply-To: <20240426160256.3089978-3-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_014655_882962_ECEEA43B 
X-CRM114-Status: GOOD (  20.59  )
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
> When no mode is set, the utility pin appears to be grounded. No signal
> is getting through.
> 
> This is problematic because ARC and eARC use this line and may do so even
> if no display mode is set.
> 
> This change enable the bandgap setting on g12 chip, which fix the problem
> with the utility pin. This is done by restoring init values on PHY init and
> disable.
> 
> Fixes: 3b7c1237a72a ("drm/meson: Add G12A support for the DW-HDMI Glue")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/gpu/drm/meson/meson_dw_hdmi.c | 43 ++++++++++++++++-----------
>   1 file changed, 26 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index a83d93078537..5565f7777529 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -106,6 +106,8 @@
>   #define HHI_HDMI_CLK_CNTL	0x1cc /* 0x73 */
>   #define HHI_HDMI_PHY_CNTL0	0x3a0 /* 0xe8 */
>   #define HHI_HDMI_PHY_CNTL1	0x3a4 /* 0xe9 */
> +#define  PHY_CNTL1_INIT		0x03900000
> +#define  PHY_INVERT		BIT(17)
>   #define HHI_HDMI_PHY_CNTL2	0x3a8 /* 0xea */
>   #define HHI_HDMI_PHY_CNTL3	0x3ac /* 0xeb */
>   #define HHI_HDMI_PHY_CNTL4	0x3b0 /* 0xec */
> @@ -130,6 +132,8 @@ struct meson_dw_hdmi_data {
>   				    unsigned int addr);
>   	void		(*dwc_write)(struct meson_dw_hdmi *dw_hdmi,
>   				     unsigned int addr, unsigned int data);
> +	u32 cntl0_init;
> +	u32 cntl1_init;
>   };
>   
>   struct meson_dw_hdmi {
> @@ -458,7 +462,9 @@ static void dw_hdmi_phy_disable(struct dw_hdmi *hdmi,
>   
>   	DRM_DEBUG_DRIVER("\n");
>   
> -	regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, 0);
> +	/* Fallback to init mode */
> +	regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL1, dw_hdmi->data->cntl1_init);
> +	regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, dw_hdmi->data->cntl0_init);
>   }
>   
>   static enum drm_connector_status dw_hdmi_read_hpd(struct dw_hdmi *hdmi,
> @@ -576,11 +582,22 @@ static const struct regmap_config meson_dw_hdmi_regmap_config = {
>   	.fast_io = true,
>   };
>   
> -static const struct meson_dw_hdmi_data meson_dw_hdmi_gx_data = {
> +static const struct meson_dw_hdmi_data meson_dw_hdmi_gxbb_data = {
>   	.top_read = dw_hdmi_top_read,
>   	.top_write = dw_hdmi_top_write,
>   	.dwc_read = dw_hdmi_dwc_read,
>   	.dwc_write = dw_hdmi_dwc_write,
> +	.cntl0_init = 0x0,
> +	.cntl1_init = PHY_CNTL1_INIT | PHY_INVERT,
> +};
> +
> +static const struct meson_dw_hdmi_data meson_dw_hdmi_gxl_data = {
> +	.top_read = dw_hdmi_top_read,
> +	.top_write = dw_hdmi_top_write,
> +	.dwc_read = dw_hdmi_dwc_read,
> +	.dwc_write = dw_hdmi_dwc_write,
> +	.cntl0_init = 0x0,
> +	.cntl1_init = PHY_CNTL1_INIT,
>   };
>   
>   static const struct meson_dw_hdmi_data meson_dw_hdmi_g12a_data = {
> @@ -588,6 +605,8 @@ static const struct meson_dw_hdmi_data meson_dw_hdmi_g12a_data = {
>   	.top_write = dw_hdmi_g12a_top_write,
>   	.dwc_read = dw_hdmi_g12a_dwc_read,
>   	.dwc_write = dw_hdmi_g12a_dwc_write,
> +	.cntl0_init = 0x000b4242, /* Bandgap */
> +	.cntl1_init = PHY_CNTL1_INIT,
>   };
>   
>   static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
> @@ -626,18 +645,8 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
>   	meson_dw_hdmi->data->top_write(meson_dw_hdmi, HDMITX_TOP_BIST_CNTL, BIT(12));
>   
>   	/* Setup PHY */
> -	regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1,
> -			   0xffff << 16, 0x0390 << 16);
> -
> -	/* BIT_INVERT */
> -	if (dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-gxl-dw-hdmi") ||
> -	    dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-gxm-dw-hdmi") ||
> -	    dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-g12a-dw-hdmi"))
> -		regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1,
> -				   BIT(17), 0);
> -	else
> -		regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1,
> -				   BIT(17), BIT(17));
> +	regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL1, meson_dw_hdmi->data->cntl1_init);
> +	regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, meson_dw_hdmi->data->cntl0_init);
>   
>   	/* Enable HDMI-TX Interrupt */
>   	meson_dw_hdmi->data->top_write(meson_dw_hdmi, HDMITX_TOP_INTR_STAT_CLR,
> @@ -848,11 +857,11 @@ static const struct dev_pm_ops meson_dw_hdmi_pm_ops = {
>   
>   static const struct of_device_id meson_dw_hdmi_of_table[] = {
>   	{ .compatible = "amlogic,meson-gxbb-dw-hdmi",
> -	  .data = &meson_dw_hdmi_gx_data },
> +	  .data = &meson_dw_hdmi_gxbb_data },
>   	{ .compatible = "amlogic,meson-gxl-dw-hdmi",
> -	  .data = &meson_dw_hdmi_gx_data },
> +	  .data = &meson_dw_hdmi_gxl_data },
>   	{ .compatible = "amlogic,meson-gxm-dw-hdmi",
> -	  .data = &meson_dw_hdmi_gx_data },
> +	  .data = &meson_dw_hdmi_gxl_data },
>   	{ .compatible = "amlogic,meson-g12a-dw-hdmi",
>   	  .data = &meson_dw_hdmi_g12a_data },
>   	{ }

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
