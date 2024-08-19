Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1EFC52D6F
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Aug 2024 16:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PqIhUdAhHQSNO2MugShKlhsNQyJWO46Vp5hpTm5ticg=; b=oRnYlT1UHQq1BX9axOI7MFV6bj
	lH5S8KHurDbWTNlZ3ilBemLe6LzlBCj6iNNpCQ6GiFrcTpr/4asFa1q6Lqvzhak3hJDEPVHBnN+Pd
	2XECN00mtqFB8Wo2tsjRmw/UfKsuxSTE/lfFR31+NM8ke50tV2RXEco2PUsTaEC0YdAyyYNEQLhf2
	eAScdc6QlbvKqOFXmkKcP2RulOo0iObxhpfvXu8cXsva5zsoQabpPMVge0uponPTpyBgbnmkkgP7h
	Nnb4xgdl4Ik0DMe76fHqjfvG6YKdEMJYY4ChhoHR/o1OmwLuhPrdMfgR+lNRQgD/xJpmrIAyyLgXs
	D+iFIeDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg5Fq-00000002Aah-1rDj;
	Mon, 19 Aug 2024 16:29:14 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg5E7-000000029u3-49Xb
	for linux-amlogic@lists.infradead.org;
	Mon, 19 Aug 2024 16:27:29 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4280ca0791bso37013945e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Aug 2024 09:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724084846; x=1724689646; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s26y2YASDAdGxsHZ7d56abaHHsBVOs2ZG5NV1yhnbpQ=;
        b=snMwQmpFN2FwQSY/vbXWbhhpsopvxboY86krM8SMU26nRvOAFBZ17EYWNhnx3oZaW4
         wrtekEPJhMC023PqGcPZ10OIotaUcrOdryL6/qmHZj8UXI8HVr8aTxCu6CF7irxf3dPf
         q9ICU2QqrCSQPFvqSecrKvGfzSi16MDkqCvcJkV66JzMsFnuPm3H5AI6kiM9vWUprA1S
         BMo0zJagCu0K1JTti8VZVMQpKNb7E4GY+5CcghqasaPFw+CzhCvujRq13eQdqmFy2wur
         dHKj0cOsfQzH59a8YMfJ5S9txO/pUrOkoUXzqE89R+RnJM4+kU60kK33ZGJ9x3AGTgWZ
         XNzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724084846; x=1724689646;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s26y2YASDAdGxsHZ7d56abaHHsBVOs2ZG5NV1yhnbpQ=;
        b=T1Mve0ACm6+Igce9Q2x83jYFcai1O876r+Ogi3mu89el14ZnYPKJvnPfAHEHRZjIBh
         Jc3/wky6ytjuDw/+UkyNPalPF+PojmgasngWPcaPzQco+3rqnR+aoPlQNI9AJwsQZ/7b
         yNd7FauVE1Y9GstMyqcu2KVWjJoKHT+/H2Y2NTs88ZkNtXA6iJi5oUraJ8hwmhy6XnpZ
         62uphD1lUkAJ5aqK2jtP/eEt3XKhF+mtj+1QwyxJTtkVwWPlrYa6oTFETWyBkGB6IN9Y
         3NKLdb/VdMNFSGpAv4GFLd91W8eOdYBpQ+Hhkr3qGe6mhAto1tOncNVfLibNNNtmZ64H
         gqvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMVHw/2Y640dtcldnjlUfubBUikFRnTOHDQUsXxFBqinDZL9+uTLjBd/S1acYIlLh3MjYMGZoiyoghwXJaC1ruw8r96OC8/zYREpa7wjZEYL0=
X-Gm-Message-State: AOJu0Yy9B2FhjBhScAVQdn3gnezMbl+c61xq6unRm1fO4BCebD+MEZAf
	Rbyfo6tcviCj3kgNVrs2APKokGmcwYN2+Fb6pFNOJH8NoYPnYhN+zo4y1UnNqBg=
X-Google-Smtp-Source: AGHT+IGyaOFKm6KH67C+5hH2/5G0422FDAPK6JZLNWUTv4Npjeh6t5xLFubuidWWYm7P8IzFY6X6Bg==
X-Received: by 2002:a05:600c:444b:b0:426:6320:7ddf with SMTP id 5b1f17b1804b1-429ed7f944bmr68331525e9.35.1724084845997;
        Mon, 19 Aug 2024 09:27:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f54e:4b0a:5175:5727? ([2a01:e0a:982:cbb0:f54e:4b0a:5175:5727])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded7d5bfsm171663065e9.46.2024.08.19.09.27.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 09:27:25 -0700 (PDT)
Message-ID: <e8c91a84-bfef-42c0-9e20-91676bb3843d@linaro.org>
Date: Mon, 19 Aug 2024 18:27:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH LATER 8/9] drm/meson: dw-hdmi: don't write power
 controller registers
To: Jerome Brunet <jbrunet@baylibre.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240730125023.710237-1-jbrunet@baylibre.com>
 <20240730125023.710237-9-jbrunet@baylibre.com>
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
In-Reply-To: <20240730125023.710237-9-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_092728_150037_2257668F 
X-CRM114-Status: GOOD (  19.21  )
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
> The HDMI phy has a power domain properly set in DT.
> 
> Writing the power controller register directly from the hdmi driver is
> incorrect. The power domain framework should be used for that.
> 
> HHI is a collection of Amlogic devices, such as clocks, reset,
> power domains and phys.
> 
> This is another step to get rid of HHI access in Amlogic display drivers
> and possibly stop using the component API.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
> 
>   This change depends on:
>   * f1ab099d6591 ("arm64: dts: amlogic: add power domain to hdmitx")
> 
> Time is needed for these changes to sink in u-boot and distros,
> making this change safe to apply.


Well no, we will basically need to wait until none of the stable and long-stable kernel stops
shipping a kernel without this change, but you can check if a power-domain have been associated
with the device and do the same.

> 
>   drivers/gpu/drm/meson/meson_dw_hdmi.c | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index ef059c5ef520..6c18d97b8b16 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -111,7 +111,6 @@
>   #define HDMITX_TOP_G12A_OFFSET	0x8000
>   
>   /* HHI Registers */
> -#define HHI_MEM_PD_REG0		0x100 /* 0x40 */
>   #define HHI_HDMI_CLK_CNTL	0x1cc /* 0x73 */
>   #define HHI_HDMI_PHY_CNTL0	0x3a0 /* 0xe8 */
>   #define HHI_HDMI_PHY_CNTL1	0x3a4 /* 0xe9 */
> @@ -423,9 +422,6 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
>   	/* Enable clocks */
>   	regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL, 0xffff, 0x100);
>   
> -	/* Bring HDMITX MEM output of power down */
> -	regmap_update_bits(priv->hhi, HHI_MEM_PD_REG0, 0xff << 8, 0);
> -
>   	/* Bring out of reset */
>   	regmap_write(meson_dw_hdmi->top, HDMITX_TOP_SW_RESET, 0);
>   	msleep(20);


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
