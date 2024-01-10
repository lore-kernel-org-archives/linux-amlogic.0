Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1EB6C3DA6E
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jan 2024 09:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LpPgorqTtUadYZPDWgs9jlcUev+qG+ifRnMmeY9Wkkw=; b=OSni0tAI+XS124UtPJOtgPQbo2
	8aya4+r+gurtBFhMJ4twoJEo6C5jB9ifQRuSTi/Rb5AFxw2BAAkBgGgilTpWfQHHVOUu8plqhHNji
	Dm6in6cR+V53nSODeOJ31J3Jlncn9QNASbxJUY6XSWI7tmvmn6263EAJNwha+3JTJSIbbs6GQtVD1
	afY7gHGFKbgreaF9IQ+Z2frLfmE8jV1x3Q63DeQ4Mk0Z+bvcH07z/c6KzAzM8IwxMkuD5HJHuVBo/
	L2oKzQSLjnhCNZornUPErR1AN6WM81knJ+fE05G2Hf9FBWVYunyE/ZyTcZCcc3Lfb5GpZ3izz3H0F
	VgCnFKBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNUVY-00Ap0q-3B;
	Wed, 10 Jan 2024 09:04:20 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNUVV-00AoyJ-0S
	for linux-amlogic@lists.infradead.org;
	Wed, 10 Jan 2024 09:04:19 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40e47dc8b0eso26305335e9.3
        for <linux-amlogic@lists.infradead.org>; Wed, 10 Jan 2024 01:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704877453; x=1705482253; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ewYn7f0d3PcxamoIHYwDqj88LMKkPdQZDxLnZfqffDU=;
        b=g4hXie8NO+XZaHmHuMOri8lf/OC8F3WVsqnPKr480/D8SCepi4SiUlCOQXTsndl8A6
         O8A4xBwg1j7yDnnM+3Cn0ifJKYBXRv1IcuUNPf3t6cEApXqmHjq519+SlOBTAwngPIsB
         UwRwTQF34Lc0vr+WUsQxhSDMGJ03fXaPJdkr7gFKALOmMVsnRIocSxLXmLCa4ylSf3dO
         Ent2K7UV/zVMWf5FbpmrwbdWYOvMvzau5vHtenL/2xq5YSnPAD5ZlT2bSWGLvw0QaSKM
         xUDT0Hs1YbCw8EeRzT4amu5VWoKR5IP3CcefjbPBDeZI/i6Zx6c7lhS8yP2I8gOSRK0Y
         chjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704877453; x=1705482253;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ewYn7f0d3PcxamoIHYwDqj88LMKkPdQZDxLnZfqffDU=;
        b=Rw0aX8WvxXEVdfeIGSO62wFxqVWviZ5Hh/rmdLHJ6e+H7wmlLecsnPsyYH9LJF/PBM
         z0MVwpMpd6zHodYUieC9fKQpvGBA+nBR1XHZVDmLnPe5iRKk/fqKqjcoWJgocRzw+jm/
         PfZgDMerV8G5FjNCHLyq8QH9G8cfOIlriyWOzBjgNJ1M6DoKrh5P2USE3bQRqiuTS3aG
         wU+tz/cGbJv3f9ox2gaV77Hs/Wks4y6yBR3/jOGdpJw2kKXEAtoAM9nCxRvxpjRLLJkW
         y1xsJqB+P4zLUPg/6MyNbQgocIDXuACZEI1JqBBozD4HoGZ1LuIeVR8qqzpPfhw3yixN
         EVhg==
X-Gm-Message-State: AOJu0Yy2TV523QPpnhCnfE05PcQKGi37ptAiGR7rlH095/Ewu+M6ScgD
	bBv3yccZX6b8coxyQRmMpzcuHry1J0qw5w==
X-Google-Smtp-Source: AGHT+IGtpk3bqFAf9BZxYumgYQwobLps1a0xjGJENuHKikAJwJ/eUFXLaf1OoUrDKocOV9XGh8IReA==
X-Received: by 2002:a05:600c:4b8a:b0:40e:4cc6:b4b4 with SMTP id e10-20020a05600c4b8a00b0040e4cc6b4b4mr423424wmp.36.1704877453299;
        Wed, 10 Jan 2024 01:04:13 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5dee:51de:9349:2adf? ([2a01:e0a:982:cbb0:5dee:51de:9349:2adf])
        by smtp.gmail.com with ESMTPSA id v4-20020a05600c470400b0040e45799541sm1419415wmo.15.2024.01.10.01.04.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jan 2024 01:04:12 -0800 (PST)
Message-ID: <2a8d2a76-5779-4c12-93b1-d06508c3cf0f@linaro.org>
Date: Wed, 10 Jan 2024 10:04:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/meson: vclk: fix calculation of 59.94 fractional
 rates
Content-Language: en-US, fr
To: Christian Hewitt <christianshewitt@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240109230704.4120561-1-christianshewitt@gmail.com>
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
In-Reply-To: <20240109230704.4120561-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_010417_180000_6BE16CA2 
X-CRM114-Status: GOOD (  22.44  )
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

Hi,

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

Thanks for the patch, it may need to closely look what's would be the consequence
here, since /1000)*1000 would reduce comparison to less digits, but why ?

A good thing would be to find the offending commit of when this broke, or redo
the entire math because it looks super fishy a few years later...

What puzzles me is that the same calculation is done on both side:
- meson_vclk_vic_supported_freq() called from meson_encoder_hdmi_mode_valid()
- meson_vclk_setup() called from meson_encoder_hdmi_set_vclk() and meson_encoder_hdmi_atomic_enable()

so when a mode freq is selected from meson_encoder_hdmi_mode_valid(), it should match the
mode freq in meson_vclk_setup(), but no.
So why reducing precision makes this work ???

Neil

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


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
