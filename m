Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BFD4C52D6F
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Aug 2024 16:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nXH+epFCAqhDO/7wKA8tGBChk4alyV09UBzXEXUOJhk=; b=eUYE/lJ38avqMoY9/UY3i36Uv1
	JdBzrX+s+aVmlWU6AB2YoeI/rViEpSLtlTFmrYs0Ny9cW6cGKg5Ym6xZXN4MRNz5N2yJw09eL1f/G
	un4lOWXMpKAGj0UKKxKX20zxU8XlcoJxN0ctSd4bpyIcjc7+WpEkqOqRRg/L4AurhsXa1+HqfECey
	9sBBsIRDzWHUS6u/H7GYe54LYls+ebBQM0MiTuHdgh5spAI9jXqV4Ws1/WsgGTbGVJWb/qn2VBGY9
	RRHNW/JS4/4bAlkyfQNfJvFh3uNF0g6AKnbcgTvjabekfMSbJB37T3aTMbTBsgHvSGMwFD+2oBH1P
	xpz0xQbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg4q2-000000024Ka-49RN;
	Mon, 19 Aug 2024 16:02:34 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg4p6-000000023rw-17tJ
	for linux-amlogic@lists.infradead.org;
	Mon, 19 Aug 2024 16:01:37 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-429c4a4c6a8so36798845e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Aug 2024 09:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724083295; x=1724688095; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3inI0ECOW5fOemX4PH/fT5PDp4zYtzMO9ksOGbeSD10=;
        b=vCUdp8nhsg4GzNDjl6tWQ+fV/U1xeQgOXNZpJzA5+iCmant9X2NpMOztjphYDGKCJq
         2qAmqii6sHpITF+eTZb/tGWEMB5BK18M+5Nqc12eKsRpISjt4MbwOEkz0HSm/7zFwP3j
         4sN8D+SbguaCyIM32E3d/Xz5ndyYZ5Qeg3l9mw+ZPmkyeUBP0WRk7K0zzGQMAIJ3GMH6
         ePvuMzt+AqkpE01Cm5q62bcqZUkCwJj/PLd05SrlF+wt+9bUxxN1jMsMujrdMZno4Xyv
         Lk1oimHEDPCLUdJBOQ+Bl3AUF566EC8qRyAHgbPcbmBBX7Y32U7dY6DF7jj+/u15YsTz
         PzMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724083295; x=1724688095;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3inI0ECOW5fOemX4PH/fT5PDp4zYtzMO9ksOGbeSD10=;
        b=usgImLJZPqXUmx2qhBgKPZmgoilSuP1IWXIZ7zF4Luu65Za2XTETto/Pjc7RFFoAm4
         X3Ce9pBiI8WhQkN7olLGXnnQ+p9wHck+PpvtMbZSSec0Isl13SAMyzOCUXGv24h7OvmD
         7DCYjQx42f15tllJMbPr0U+gHQ7H8XoEIK2a6zCay1bHkOxB/k7iyENCEZ9CElYDSPER
         4cYcFRYCiwMWu8DoXez/MlqHY7RGNrI8weTyEYJu7pC+oqDLE162s+3ZUleH+CSdaWFR
         Hf6D/9INUYSz1UeoehSolGWvWjXu+/7vzJqZRO9J9u0O/grQp8Ifa+wlG1SE/GFkvMWL
         RBIw==
X-Forwarded-Encrypted: i=1; AJvYcCVhde0esgOM6wZFP/MICVUF9RPXN/pi+2iC0ETNyEjzCITAyR4qjjt4MixdaZrv6JRR/RB95RYfBccFUBSgLb0TGeZhnmQnGCQFEIYQo8EaxLs=
X-Gm-Message-State: AOJu0Yzvp7GCzYbbss9T4EEVeY4SQhbuX3DDONDeuJ66BVvnPkrdhRlV
	Ll2Xe0K/8H4vlsB9Z/T7SxOM8xtjmcVaTQZpaESRRr5DmQrsrkB8qGT0gybeLG0=
X-Google-Smtp-Source: AGHT+IHqi+ynv7PNIGrSXPrynHUL4/QS/orobgoM3PsUljd0gTqOfknAgwMfnnGvbolV5NilUOhbng==
X-Received: by 2002:a05:600c:4746:b0:426:6a5e:73c5 with SMTP id 5b1f17b1804b1-429ed7f9852mr65754795e9.37.1724083294044;
        Mon, 19 Aug 2024 09:01:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f54e:4b0a:5175:5727? ([2a01:e0a:982:cbb0:f54e:4b0a:5175:5727])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed784726sm114095855e9.35.2024.08.19.09.01.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 09:01:32 -0700 (PDT)
Message-ID: <5c72008c-65b9-4013-bbed-f5462e27b9ac@linaro.org>
Date: Mon, 19 Aug 2024 18:01:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/9] drm/meson: vclk: drop hdmi system clock setup
To: Jerome Brunet <jbrunet@baylibre.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240730125023.710237-1-jbrunet@baylibre.com>
 <20240730125023.710237-3-jbrunet@baylibre.com>
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
In-Reply-To: <20240730125023.710237-3-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_090136_350826_ABD6E0DC 
X-CRM114-Status: GOOD (  15.57  )
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
> Poking the HHI syscon is a way to setup clocks behind CCF's back.
> Also, 2 drm code paths, the encoder and the hdmi-phy, are racing to do the
> same setup of the HDMI system clock.
> 
> This clock is used is used by the HDMI phy and should not be set by the
> encoder, so drop those HHI pokes from vclk.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/gpu/drm/meson/meson_vclk.c | 8 --------
>   1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
> index 2a942dc6a6dc..bf5cc5d92346 100644
> --- a/drivers/gpu/drm/meson/meson_vclk.c
> +++ b/drivers/gpu/drm/meson/meson_vclk.c
> @@ -813,14 +813,6 @@ static void meson_vclk_set(struct meson_drm *priv, unsigned int pll_base_freq,
>   {
>   	unsigned int m = 0, frac = 0;
>   
> -	/* Set HDMI-TX sys clock */
> -	regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL,
> -			   CTS_HDMI_SYS_SEL_MASK, 0);
> -	regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL,
> -			   CTS_HDMI_SYS_DIV_MASK, 0);
> -	regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL,
> -			   CTS_HDMI_SYS_EN, CTS_HDMI_SYS_EN);
> -
>   	/* Set HDMI PLL rate */
>   	if (!od1 && !od2 && !od3) {
>   		meson_hdmi_pll_generic_set(priv, pll_base_freq);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
