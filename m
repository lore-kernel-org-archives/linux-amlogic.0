Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF3A1C6FD1F
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2024 16:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6awrevHXa6li+rzpw7hi0GshoGEruJ8lrCbWD6ge7Q0=; b=jGD8AfwsZDp6WZuh/AC0fTf1XC
	AOb4zpi2Fwa/4vw8mIkZuk5nV9JkfN33cadouDaDZZDL4d9xLZg+nFrwmKo32Ry1fORQIqp5x/l2v
	YY6T6xbbKda5EscdVsYPsTsvfKNQ5QEO2YSWCty0REasEVzIPbeG24tmu6vyPDWjGlBrpyMmCZkks
	DuRggV/sW2iHjZ8qQ9oDyXWrCwxjbKj1mPzaePqLv/PPr1ojDDb5R296KBsFVxhnIrmab8YSSPQIH
	OAnsi+xJ21SgxQttyg8COzRdpJMcl/qgdTKgwKhZytorVqkyvzlpmSARfzLujICYsAjimeKJVmaTn
	de3n747g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqEe7-00000001ERq-2f6e;
	Fri, 29 Mar 2024 15:59:59 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqEe4-00000001EQj-48IU
	for linux-amlogic@lists.infradead.org;
	Fri, 29 Mar 2024 15:59:58 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-41543b772e6so17588345e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 29 Mar 2024 08:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711727992; x=1712332792; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GGsD0hCZS0RGyO3uN5UGL0orhZAJeWGJYHahHUXwehI=;
        b=bZfdHbKkgTTSeEs9/nYjSjSu77jGZsfJqgdiJRDXoBJLGniHNIliuN0hF5wYuJgyN1
         1FJyy0g7xlSzdb/IaGsjjfybOb+Y2YahpOHB912quMtFF7Kjcy5DEtjekeWeNV9U7hSU
         tQrNT7jNlifu+WXsyB6LKfJkS/HE0PwxB1s7Q9kd8zrL0QfVZLyxvvcJyqIRzWGYw2UQ
         c2L1oyffqHu0nZQ69Bg/2MU7u4V12BZhVhru4ZTyyaxvEGgBbQ9LRFKj9wEgOtwDuR4n
         PKJv2lknWpMJTTi4OLs24rkge9TNJJu5/4H5XY5aQlY9U2PM6jL6XOxv21GS7O3bhAUz
         UUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711727992; x=1712332792;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GGsD0hCZS0RGyO3uN5UGL0orhZAJeWGJYHahHUXwehI=;
        b=DM000ADa1y3ZAACkinSyuObD0HKb4bFrE0fS4diNr3qzGJqLV6NEbBtC+AjcCtrRCw
         mCf8bMrByyZjoxx4t/3zW2O/JVI9LoKtnezaGO6sExaopCSYSRUwt49+LnDCTENa8ugr
         c0F2ZGthkjE1eV3eDyBMB+au3ltlqAqBRCunQnYTjXR3um4yqQXNTv+x9iYjcHu2tx+/
         zfVhWiPlywHuNE5BSs5wN0UUdnmekHc7jM1rC6qXlJBZ2HKT7OXk8vUEou6jyIQKQSVe
         d6f2yO7AJ8yFHt781TfezKYiqWU8h1vvp68VV1TY1IGDmZgA3e/ZmpnmY3qf/6T/ETf4
         fVbw==
X-Forwarded-Encrypted: i=1; AJvYcCVex1DlwDddaYhn+VBP6SQcrtEEU0xWKp2WhPaQBT3Xxorzk8odTvDD8P9wtBfcgcJPh0roNweOkCK+04m5m4Hf124j1tcbw8bk30lRKWJL1Go=
X-Gm-Message-State: AOJu0YyjsbnuR05afpVWd1Khs94wAzvh0RZmK36XVqoiZg9inakelBAb
	BMNsACqUUQfVphMKMQ3aIvbwATsh5iOkncdd/dMCE6DLZfrUMUsL1EjoUuun5+0=
X-Google-Smtp-Source: AGHT+IHe6XeEQuR3I0AFMivdopvZfiDF+TwSwHOYyhqm4U6929+iEoj0HbGpgG496qoYCKqwv8vuxQ==
X-Received: by 2002:a05:600c:3550:b0:414:227:fc66 with SMTP id i16-20020a05600c355000b004140227fc66mr2446342wmq.2.1711727992106;
        Fri, 29 Mar 2024 08:59:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:3cd8:c97b:1468:c232? ([2a01:e0a:982:cbb0:3cd8:c97b:1468:c232])
        by smtp.gmail.com with ESMTPSA id t14-20020a05600c450e00b004148b9272a7sm5919058wmo.0.2024.03.29.08.59.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Mar 2024 08:59:51 -0700 (PDT)
Message-ID: <bef2bda3-c2c1-46b3-b6ae-af09941e298f@linaro.org>
Date: Fri, 29 Mar 2024 16:59:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/meson: vclk: fix calculation of 59.94 fractional
 rates
To: Christian Hewitt <christianshewitt@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240109230704.4120561-1-christianshewitt@gmail.com>
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
In-Reply-To: <20240109230704.4120561-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_085957_108092_FE9603AB 
X-CRM114-Status: GOOD (  18.30  )
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

On 10/01/2024 00:07, Christian Hewitt wrote:
> Playing 4K media with 59.94 fractional rate (typically VP9) causes the screen to lose
> sync with the following error reported in the system log:
> 
> [   89.610280] Fatal Error, invalid HDMI vclk freq 593406
> 
> Modetest shows the following:
> 
> 3840x2160 59.94 3840 4016 4104 4400 2160 2168 2178 2250 593407 flags: xxxx, xxxx,
> drm calculated value -------------------------------------^
> 
> Change the fractional rate calculation to stop DIV_ROUND_CLOSEST rounding down which
> results in vclk freq failing to match correctly.
> 
> Fixes: e5fab2ec9ca4 ("drm/meson: vclk: add support for YUV420 setup")
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
> I'm unable to give a better mathematical description of the fix as I can barely read
> code. The change was inspired by [0] which I chanced upon while looking at how other
> dw-hdmi drivers handle fractional rates.
> 
> [0] https://github.com/torvalds/linux/commit/4f510aa10468954b1da4e94689c38ac6ea8d3627
> 
>   drivers/gpu/drm/meson/meson_vclk.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
> index 2a82119eb58e..2a942dc6a6dc 100644
> --- a/drivers/gpu/drm/meson/meson_vclk.c
> +++ b/drivers/gpu/drm/meson/meson_vclk.c
> @@ -790,13 +790,13 @@ meson_vclk_vic_supported_freq(struct meson_drm *priv, unsigned int phy_freq,
>   				 FREQ_1000_1001(params[i].pixel_freq));
>   		DRM_DEBUG_DRIVER("i = %d phy_freq = %d alt = %d\n",
>   				 i, params[i].phy_freq,
> -				 FREQ_1000_1001(params[i].phy_freq/10)*10);
> +				 FREQ_1000_1001(params[i].phy_freq/1000)*1000);
>   		/* Match strict frequency */
>   		if (phy_freq == params[i].phy_freq &&
>   		    vclk_freq == params[i].vclk_freq)
>   			return MODE_OK;
>   		/* Match 1000/1001 variant */
> -		if (phy_freq == (FREQ_1000_1001(params[i].phy_freq/10)*10) &&
> +		if (phy_freq == (FREQ_1000_1001(params[i].phy_freq/1000)*1000) &&
>   		    vclk_freq == FREQ_1000_1001(params[i].vclk_freq))
>   			return MODE_OK;
>   	}
> @@ -1070,7 +1070,7 @@ void meson_vclk_setup(struct meson_drm *priv, unsigned int target,
>   
>   	for (freq = 0 ; params[freq].pixel_freq ; ++freq) {
>   		if ((phy_freq == params[freq].phy_freq ||
> -		     phy_freq == FREQ_1000_1001(params[freq].phy_freq/10)*10) &&
> +		     phy_freq == FREQ_1000_1001(params[freq].phy_freq/1000)*1000) &&
>   		    (vclk_freq == params[freq].vclk_freq ||
>   		     vclk_freq == FREQ_1000_1001(params[freq].vclk_freq))) {
>   			if (vclk_freq != params[freq].vclk_freq)

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
