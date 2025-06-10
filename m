Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E5E3C5B552
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Jun 2025 12:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6FZM+zMXZAXE0hWVtCF06iiKROvdCLIdSI6POBSm/3k=; b=ruC48GcNlJZUUDbtM2VWrWa7tB
	9d2HYw1a3GfzFwyQC5H2DMz3Wjx30355ympoKhmg8gTGOiQ0KYxKnbvzssa5PsmLmi+UqK/g1Bo9t
	H3tKuAp/CffcYCUgdRZ31oec5LU6rM4af/5bgvnOTxmC5ADm82LWUm40TnQ9akSOgmpkQV7R95bhk
	Oi+fSOSVcIa7FU8WTllcrP7zv5l1tz7dJm72UOw3mlw2caTwvrwao1vjkbNUA9ycEdSl24KeVoSc2
	RtlhwbJhmcdNqAwusGc7kt1gkJXKnAOWZA/EtXAvYn7nUkzo7aJCRr0QRD5NOxHOCwfqUHrRSi9om
	rUotkAxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyYV-00000006rgU-2Ezw;
	Tue, 10 Jun 2025 12:58:19 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxs5-00000006k5L-17Kg
	for linux-amlogic@lists.infradead.org;
	Tue, 10 Jun 2025 12:14:30 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so64323065e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 10 Jun 2025 05:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749557668; x=1750162468; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/DPVdSZMDklf6mtDF12nzBZep9SyWTS1DC6wAFg2MeE=;
        b=Zwp2L9Peuxfz0ONzwE1j96P/HXG1eZZfMVexIQZmIpPYY7pZR5jHuRsUtmZHJ4ZHMl
         7HDSshRbTyym2lk+OpVkrcYzaQGI8ceGjLLQSZiEvrFOfPXytsAuBNXSeaYyQXSqBRKk
         jLVHDVk7VvRjXAOiX13PDzLwF2qnDfsExk9uSGzor4PrYz6ZfMZbPgphgGLtP5zEFldX
         xcvwG+Yd+UPYeuvGOeBa8ktfskf9ruInyhcHayCm5klvFbMFsrwKkCPtxhrHlCcYlqBP
         E4EPLoacUU0DGQfm7g85o3nF5CAyiAijMnowMcswEPzRj0cC+bZWx3t7fWzragw1kjDO
         DvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749557668; x=1750162468;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/DPVdSZMDklf6mtDF12nzBZep9SyWTS1DC6wAFg2MeE=;
        b=cZQpw4tb69Gtufmv9fdtkXtbjbWqTFdivNsQDYno5TtO+Dy+fO/AVG62ImCE5ERhtW
         O52FiCIBvXv0WexjfTClCzDyUvoADllqi3QeXxaOEepjcVuS/FttYmjOI68RbdCZyLC0
         lNybhBnQ2brl2OhRumsWytogZpK/prNSlewO7mXw4coHZCIep90ddaWrMQsin0UGIV81
         DTBJWZOo/09e1tFBFoDSBT6EPbRkr9D4VApxGfMXlX34XgiiNPvUDFKF4v0zLpk1woON
         pB70HipJ6qJrk++G8/Z4tPJMZysjZVbO9hfYKt59Tcsp6iMprdFA0rZ3IL8RKW8fmc8c
         X5DA==
X-Forwarded-Encrypted: i=1; AJvYcCUvEI2a70zscRnKqlCbcCcUwZcQBc7rIifqBqz1Tm0Cd/CM6mgUHwV3EuaNSQJYFz2Shu6b5MhhYbX88QIs@lists.infradead.org
X-Gm-Message-State: AOJu0YyCHu9Ljs0BB3l6ohRsbnoHqBDD0obhUa2FGMOfJaBu5OZllXGc
	3SwSg/WtB9+IwkvhLBIZwebBUvzrHHnEomnsE9G0lF2g763/oJ+p9MQ2nVjRBrwjO/E=
X-Gm-Gg: ASbGncv00rj+kkxNkAJQPpbUI+JJAA20oBaHg3p4RUqqmGwTCl8j06PUWv1KlXeWLKf
	0YznejqRZpiHZWbgVkMyPwOZsaXkoitYBfIq2DE4t13rBZ4To2dXWG/kW+D7tAYh1Qa6aNqjv69
	DT14+gMkh3stcL/7j4CaECi9uyye2AGQkOLFatnCYl2V+Oc0EHE8SyjM52Dl0WGTYAEHT2o3Ive
	EseuX2xQcXcA83T0u2nfmxs9lrB7eLRHp9pP2mtCRZ5lAlNoyR4g2hIgZwzFmSkaARx+OgRu6EC
	OisOLI7OmifmlJetnG9NC+dMYIFsSeoANKE5gYY1ZwvN2NGyQETPOFeASKl8ZwQLjbU8DCBFFJN
	rV6YtHbIuzA3auS80B6mti0FFBNzVdlLoXM066XeesBmk3bg=
X-Google-Smtp-Source: AGHT+IFrXuEadreb3Ra0ecFZUmb9l900iFMIt+FWoBtiuGQI7QU2cCtR641w8MO4Bqrq58Be6Fu0vw==
X-Received: by 2002:a05:600c:3848:b0:43c:eeee:b713 with SMTP id 5b1f17b1804b1-452013d7cc8mr141430515e9.20.1749557667674;
        Tue, 10 Jun 2025 05:14:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f0b:a9b6:d508:9d14? ([2a01:e0a:3d9:2080:f0b:a9b6:d508:9d14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452669ada25sm141140855e9.0.2025.06.10.05.14.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 05:14:27 -0700 (PDT)
Message-ID: <ec36d5e5-5aef-4d0f-8596-96ef3e674ad7@linaro.org>
Date: Tue, 10 Jun 2025 14:14:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1] drm/meson: fix more rounding issues with 59.94Hz modes
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20250609202751.962208-1-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20250609202751.962208-1-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_051429_314871_51CDC61F 
X-CRM114-Status: GOOD (  28.58  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 09/06/2025 22:27, Martin Blumenstingl wrote:
> Commit 1017560164b6 ("drm/meson: use unsigned long long / Hz for
> frequency types") attempts to resolve video playback using 59.94Hz.
>   using YUV420 by changing the clock calculation to use
> Hz instead of kHz (thus yielding more precision).
> 
> The basic calculation itself is correct, however the comparisions in
> meson_vclk_vic_supported_freq() and meson_vclk_setup() don't work
> anymore for 59.94Hz modes (using the freq * 1000 / 1001 logic). For
> example, drm/edid specifies a 593407kHz clock for 3840x2160@59.94Hz.
> With the mentioend commit we convert this to Hz. Then meson_vclk
> tries to find a matchig "params" entry (as the clock setup code
> currently only supports specific frequencies) by taking the venc_freq
> from the params and calculating the "alt frequency" (used for the
> 59.94Hz modes) from it, which is:
>    (594000000Hz * 1000) / 1001 = 593406593Hz
> 
> Similar calculation is applied to the phy_freq (TMDS clock), which is 10
> times the pixel clock.
> 
> Implement a new meson_vclk_freqs_are_matching_param() function whose
> purpose is to compare if the requested and calculated frequencies. They
> may not match exactly (for the reasons mentioned above). Allow the
> clocks to deviate slightly to make the 59.94Hz modes again.
> 
> Fixes: 1017560164b6 ("drm/meson: use unsigned long long / Hz for frequency types")
> Reported-by: Christian Hewitt <christianshewitt@gmail.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> Special thanks to Christian for testing (off-list) and managing so I
> can do better testing myself in the future!
> 
> This is meant to be applied on top of "drm/meson: use vclk_freq instead
> of pixel_freq in debug print" from [0]
> 
> 
> [0] https://lore.kernel.org/dri-devel/20250606221031.3419353-1-martin.blumenstingl@googlemail.com/
> 
> 
>   drivers/gpu/drm/meson/meson_vclk.c | 55 ++++++++++++++++++------------
>   1 file changed, 34 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
> index c4123bb958e4..dfe0c28a0f05 100644
> --- a/drivers/gpu/drm/meson/meson_vclk.c
> +++ b/drivers/gpu/drm/meson/meson_vclk.c
> @@ -110,10 +110,7 @@
>   #define HDMI_PLL_LOCK		BIT(31)
>   #define HDMI_PLL_LOCK_G12A	(3 << 30)
>   
> -#define PIXEL_FREQ_1000_1001(_freq)	\
> -	DIV_ROUND_CLOSEST_ULL((_freq) * 1000ULL, 1001ULL)
> -#define PHY_FREQ_1000_1001(_freq)	\
> -	(PIXEL_FREQ_1000_1001(DIV_ROUND_DOWN_ULL(_freq, 10ULL)) * 10)
> +#define FREQ_1000_1001(_freq)	DIV_ROUND_CLOSEST_ULL((_freq) * 1000ULL, 1001ULL)
>   
>   /* VID PLL Dividers */
>   enum {
> @@ -772,6 +769,36 @@ static void meson_hdmi_pll_generic_set(struct meson_drm *priv,
>   		  pll_freq);
>   }
>   
> +static bool meson_vclk_freqs_are_matching_param(unsigned int idx,
> +						unsigned long long phy_freq,
> +						unsigned long long vclk_freq)
> +{
> +	DRM_DEBUG_DRIVER("i = %d vclk_freq = %lluHz alt = %lluHz\n",
> +			 idx, params[idx].vclk_freq,
> +			 FREQ_1000_1001(params[idx].vclk_freq));
> +	DRM_DEBUG_DRIVER("i = %d phy_freq = %lluHz alt = %lluHz\n",
> +			 idx, params[idx].phy_freq,
> +			 FREQ_1000_1001(params[idx].phy_freq));
> +
> +	/* Match strict frequency */
> +	if (phy_freq == params[idx].phy_freq &&
> +	    vclk_freq == params[idx].vclk_freq)
> +		return true;
> +
> +	/* Match 1000/1001 variant: vclk deviation has to be less than 1kHz
> +	 * (drm EDID is defined in 1kHz steps, so everything smaller must be
> +	 * rounding error) and the PHY freq deviation has to be less than
> +	 * 10kHz (as the TMDS clock is 10 times the pixel clock, so anything
> +	 * smaller must be rounding error as well).
> +	 */
> +	if (abs(vclk_freq - FREQ_1000_1001(params[idx].vclk_freq)) < 1000 &&
> +	    abs(phy_freq - FREQ_1000_1001(params[idx].phy_freq)) < 10000)
> +		return true;
> +
> +	/* no match */
> +	return false;
> +}
> +
>   enum drm_mode_status
>   meson_vclk_vic_supported_freq(struct meson_drm *priv,
>   			      unsigned long long phy_freq,
> @@ -790,19 +817,7 @@ meson_vclk_vic_supported_freq(struct meson_drm *priv,
>   	}
>   
>   	for (i = 0 ; params[i].pixel_freq ; ++i) {
> -		DRM_DEBUG_DRIVER("i = %d vclk_freq = %lluHz alt = %lluHz\n",
> -				 i, params[i].vclk_freq,
> -				 PIXEL_FREQ_1000_1001(params[i].vclk_freq));
> -		DRM_DEBUG_DRIVER("i = %d phy_freq = %lluHz alt = %lluHz\n",
> -				 i, params[i].phy_freq,
> -				 PHY_FREQ_1000_1001(params[i].phy_freq));
> -		/* Match strict frequency */
> -		if (phy_freq == params[i].phy_freq &&
> -		    vclk_freq == params[i].vclk_freq)
> -			return MODE_OK;
> -		/* Match 1000/1001 variant */
> -		if (phy_freq == PHY_FREQ_1000_1001(params[i].phy_freq) &&
> -		    vclk_freq == PIXEL_FREQ_1000_1001(params[i].vclk_freq))
> +		if (meson_vclk_freqs_are_matching_param(i, phy_freq, vclk_freq))
>   			return MODE_OK;
>   	}
>   
> @@ -1075,10 +1090,8 @@ void meson_vclk_setup(struct meson_drm *priv, unsigned int target,
>   	}
>   
>   	for (freq = 0 ; params[freq].pixel_freq ; ++freq) {
> -		if ((phy_freq == params[freq].phy_freq ||
> -		     phy_freq == PHY_FREQ_1000_1001(params[freq].phy_freq)) &&
> -		    (vclk_freq == params[freq].vclk_freq ||
> -		     vclk_freq == PIXEL_FREQ_1000_1001(params[freq].vclk_freq))) {
> +		if (meson_vclk_freqs_are_matching_param(freq, phy_freq,
> +							vclk_freq)) {
>   			if (vclk_freq != params[freq].vclk_freq)
>   				vic_alternate_clock = true;
>   			else

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
