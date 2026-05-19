Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40407CD4F5B
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 May 2026 07:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5rnmLEbLjoeFYVsxi/lZ57ENFhl4IldfySfzYcbM0s8=; b=SLi+evYnRspmpibkgIl3pseWDJ
	EABekYMvDnDm/qSwtWYwIkRHcpgnQSNc7TwRxn4mmfq6crjbgB/acZRVC1zkq8kfPhkNFBF9Maq1c
	niyxvpZdt0f7EbJut9oQLz86gT8VH94Jk23GPI5FwnL+QyIifjGQvXSS/w0MY44vurSujso/0ASXe
	lU2z/9oXtxp8SMsnvdqeYNye8RRRnVZ5zZ0zVqSAX5+LCIccRjT3EiO5cbrUy1vqrM0ICVcbjfZUR
	vCcPu8fapVefhCiJcUWeXAY/yK0aDyItV8pypZcYfBx7oDquDG8MKVzp7cx2DwxnlKzXYtfGtWsAM
	pG3Nukzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPEnR-00000000ToB-3WZg;
	Tue, 19 May 2026 07:23:21 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPEnP-00000000TmL-0KiJ
	for linux-amlogic@lists.infradead.org;
	Tue, 19 May 2026 07:23:21 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso38918275e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 19 May 2026 00:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779175397; x=1779780197; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sfKsH9xwm+tQ3snlH8Sxro/uZ5qaHdIhEycOMeeCONk=;
        b=BdvnapbeLp0KU3On21Sj56eP3leMpN2hL7tc6pdk4XGpCc8tIHyjxXZC+Od/yEafC3
         DF5n0gfE4HI1/P1keL4tn8yAMZy3jG10bgo2My70nKNfxJiUDMn6zutFJAdJyzaNGpGJ
         CSrboVvg2je0p2mZI1aPG4k5qudmqvKt16FmK7zjNvM3DKxQBVnIiaN+mjTFqSQzllin
         k03/wSvGeSI7/DcyNSca3W2xzvyn87LBrpmkiyT1M+YN83QsWGDMTOdeHNiWCEx39Zg9
         5eBlgzS3u30A9651kUpztYghZNAE4Fxj+ExARchorqfUkVjVzlO1gY/CZTjwsTaYFL75
         GGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779175397; x=1779780197;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sfKsH9xwm+tQ3snlH8Sxro/uZ5qaHdIhEycOMeeCONk=;
        b=dgD3d+kiMzkIFdyH5sBGJ955EaUN5jE9o+IVoxTu005IMSQvo6nEx2fOj6E0tvM1zU
         gUsIagKUCfwWQYFv/cjlsmxl/SkJpOx/Xr98EIo/Mtt9BjLjNNTC3vJVOS6sQ2dEIN8X
         BJmqRLjwYKt2appUdCPitQ15sfQAgUzTZ110VelhPTAY2NGxewl75hYQll1epw222wCS
         RXtl1+fidRUxb8siB9EJ95NWb+oYxcgAFhVOCe9mLJafYZdz/pZzC26ihejV8+9iNf9P
         bZ5VzSa8gAwRUpBPlFLhYKLiV2oeQeMb+HqRoKsSnI1HtwgtXxuEFHtP+p+YeVjqipwa
         M0fA==
X-Forwarded-Encrypted: i=1; AFNElJ+r9Jv6KCFNaTHojU3NPvmW0jo3rF7zfXvDr4LadJe4IysIIAEEKJ8WmAavVBycNz8C+DfzV/pduRdxXbCJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw83OnTJiDmzCw5ZpiQCrMy13aR08JhjuRQULy07LyMQmLQHnKF
	2mL8QQT40RrFn+kNtQp6SuewAKFY1DjDtgzzGRH20v1RJNPLbmHRNIPjuMRKUCbj0cM=
X-Gm-Gg: Acq92OF6oC0/Dvb4l4bElFA/w2/qbYsj4wTKArc2EWi5vH0NVlmJCANljbf4B9aE4qo
	/mcvWj6gF6v3u1R2Zy31W7Uw7vxbqWdHbMgo/nBj2b4YnGkTnOPxk+FnzSSFN/3RyBpZVj5UyfA
	IeLZLNdAl0Jg8lTg246S4QspQZwVSp4274d8Au0BjIZqw7pfS5IfsSi8a7whZNMhwbMPNmC2Goo
	59r43m6lvC5yDKph5TT39OXDFhHxFTHnt1jqU6UCuUgbJV+skX3EwUqg8c0eyDjVaac2xkct1i7
	naKRtbBK4N4dWOJ4kym8wvPUftsLK7vWhruzpjgsfJLgrMrgV/6vCJYP/ntpgQo/tRt5VhrnXjT
	B90XepRXF01+M0hSIYG2AIUl2VjwpE9fHJk2JjtG4+6EeN/Rx9XuxGWKdhyaAyD0zF7T+i+1Jn7
	E9NDhyTXzWL/fJCRlnxQJmZ+9xZZlpDlp9b1gW6Dwvn5pl+9nhdaintl8Ypx25lmz2y4obpg8Zb
	UARKvuhplK5LYcpm6DFvxNI3Q==
X-Received: by 2002:a05:600c:4fc9:b0:48f:d612:3c40 with SMTP id 5b1f17b1804b1-48fe60e47bfmr256329325e9.7.1779175396985;
        Tue, 19 May 2026 00:23:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:1d4b:274c:94d:a69f? ([2a01:e0a:106d:1080:1d4b:274c:94d:a69f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6449sm43240799f8f.37.2026.05.19.00.23.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 00:23:16 -0700 (PDT)
Message-ID: <77cff8e2-11a6-4fd0-ac02-7468441f7476@linaro.org>
Date: Tue, 19 May 2026 09:23:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 01/13] drm/meson: dw-hdmi: Report connector status based
 on HPD bit
To: Jonas Karlman <jonas@kwiboo.se>, Kevin Hilman <khilman@baylibre.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20260518194744.2483580-1-jonas@kwiboo.se>
 <20260518194744.2483580-2-jonas@kwiboo.se>
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
In-Reply-To: <20260518194744.2483580-2-jonas@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_002319_159869_3519015E 
X-CRM114-Status: GOOD (  17.32  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 5/18/26 21:47, Jonas Karlman wrote:
> G12A added support for RX-SENSE, status for both HPD and RX-SENSE is
> reported in the TOP_STAT0 register.
> 
> Limit read_hpd() phy ops to only report connected status based on the
> HPD status bit in TOP_STAT0, to help ensure that EDID can be read from
> the sink in the connector detect() func.
> 
> Fixes: 3b7c1237a72a ("drm/meson: Add G12A support for the DW-HDMI Glue")
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
>   drivers/gpu/drm/meson/meson_dw_hdmi.c | 6 ++++--
>   drivers/gpu/drm/meson/meson_dw_hdmi.h | 3 +++
>   2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 2a8756da569b..993f6d5d4b29 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -457,9 +457,11 @@ static enum drm_connector_status dw_hdmi_read_hpd(struct dw_hdmi *hdmi,
>   			     void *data)
>   {
>   	struct meson_dw_hdmi *dw_hdmi = (struct meson_dw_hdmi *)data;
> +	unsigned int stat;
>   
> -	return !!dw_hdmi->data->top_read(dw_hdmi, HDMITX_TOP_STAT0) ?
> -		connector_status_connected : connector_status_disconnected;
> +	stat = dw_hdmi->data->top_read(dw_hdmi, HDMITX_TOP_STAT0);
> +	return stat & HDMITX_TOP_STAT0_HPD ? connector_status_connected :
> +					     connector_status_disconnected;
>   }
>   
>   static void dw_hdmi_setup_hpd(struct dw_hdmi *hdmi,
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.h b/drivers/gpu/drm/meson/meson_dw_hdmi.h
> index 08e1c14e4ea0..cb4616daf667 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.h
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.h
> @@ -157,4 +157,7 @@
>    */
>   #define HDMITX_TOP_STAT0                        (0x00E)
>   
> +#define HDMITX_TOP_STAT0_HPD		BIT(0)
> +#define HDMITX_TOP_STAT0_RXSENSE	BIT(1)
> +
>   #endif /* __MESON_DW_HDMI_H */

Thanks, pretty sure the RXSENSE needs some setup in the PHY to work
and Amlogic never enabled it, but this version is clearly better.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
