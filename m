Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F19F7CD4F57
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 May 2026 07:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4+PrfAkKlm1t6RN3U5mR1029LTvDgZeWOZE1lWSCYbY=; b=MuW08RWw3xUbIweFOa+5ZZ3JZv
	b9CVjAbbkrY4PWq75fDkwReZJfvVWj6SgDDY7kHa9yFLS0cB+ukDeCOTocFAXtCla8il6Xe1+VAQS
	mUOcdRcOxlYBRDRMbYPZAX6jAr9R1awq0dRU5qOqhJKZCsEKpeg84ghyiYqwbUdNcjYkseNlKXArI
	G6pZLxmZUQ6t5GGNeDm/9EYGDxoOd2Zd7QRV1LDShjqFgube0yEJb2GMd2nnlkYSNnboo3ps3cI/1
	+akAnDSC0o4ZF7fPDOwqbs395qYFD62ftrmtOSZadhgq3v7sqaEmd0a0+munn5ml0H5B73ePx+3/J
	J96vcxFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPEx1-00000000VtO-3JwA;
	Tue, 19 May 2026 07:33:15 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPEwx-00000000VrI-2J11
	for linux-amlogic@lists.infradead.org;
	Tue, 19 May 2026 07:33:13 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso17722105e9.3
        for <linux-amlogic@lists.infradead.org>; Tue, 19 May 2026 00:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779175990; x=1779780790; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WT2XihSgFDy/lOv8L6CXXNwwAVk4RQea7wu+1npHTP8=;
        b=XVcsT5k/vsdFpkPE3o6X0mNezq2ofxJ9C92/3hEQxULToZQha49BV6K2sKGcP7iAEV
         XtIpyGbjFhvVfiYJXh5KCgeu3Go9W161+jgsozxyjchZV8ACb2Kfn4AT5G07TjSlDy7T
         Vy7ooKqQzhScq56aglztUk11tmvOWh8mRq8OXvXAGUybXQ1Ccq6ZpVfXWeI8eYpcECCq
         8qvo66/mQQW8kj9mztOq1NIvkHOgdb/4swrwB+ZEvb5bxh7i0GLggfrMzSRGkAbzm478
         2w2RJXyB/J2vRqBO7suGBncRKZvEzmlDhRN3lG1OrXqF8OfYZCu2EjLm1EPB9XFLUseL
         foxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779175990; x=1779780790;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WT2XihSgFDy/lOv8L6CXXNwwAVk4RQea7wu+1npHTP8=;
        b=k45AhnICEfVVchsZmGC2WjBLTgOWbkpncOXEvTo5SnkTuXLFt3uRdckcEGb+oLPTub
         g8L+ALJszxJngcTaM+R5AxRsaBzFN9ZpLEl2rT6/Op49kuVmCsaF9Ynm9pfTM5wAoQab
         e4v+Bh3pbK4OQ9DntlayG9iZmjwbPpmCRChBXuz6qGKZLKSbWLJL1ygBFAYiNzSdzTw8
         5rrKWaiuPWMEKup4Rk8z2Yw1hHHG+USQVdKe6CrLNmSXuD6EQ3Ntf+t4yaSnpf//OF7+
         f7KTSew6yKzU5fOOliWSNZqlrSNclbyn0gEFzzTtaMACpDNBDQoRnZ/ya/wE7X5dr3XD
         B7Kw==
X-Forwarded-Encrypted: i=1; AFNElJ+jo8h5ud7dFGUCHums5hDgz++JJDxKvQBkJw2V9zaEUN2OEyAfmhLe4L/nu/KixKAmoY8ieVXYeSq9USJl@lists.infradead.org
X-Gm-Message-State: AOJu0YyAm0NrmNBFeOxrdvljJa+OhuODYUCnuPrENn1St1tySoudA6y9
	vzBCTvZqKR53bP3J8liiprKm437XocwhvZsM4UtaHCpmohyWW9QEJ8Y9xGkvfJS+SrE=
X-Gm-Gg: Acq92OHbh2Gxj9smxFFbTPBG37emzeKKukdxjB3dhi2h40j3eLoFDA26bNdMCK6T9kK
	DG/EHtaEfpzSGBIMFmTlfaNXo7MZas1lHQvlkz7Q09QCRf/2HvwK+b4LCprn56B3Kq+5w7lc4CI
	hUucuyBIqyc0Xu7id5HCOoPF949R8GwlVl22e2KfwRoYuK05LggH0vyxW6i7Rs5rtP1T5z9u/P1
	Z7Du+GSzsbCLaqoaA58NGB0YQg/FXgjbqi0u+eu+vb//o/moI36VQTncgMnWE/wC34X6lYyhtXl
	8SDzQSUlaq+vV5sWTIwB4i+ufrjrUIxJ0qwLSE7IJb0C/wzj0xCUPZcPT4/Eo++cYQkYd7TAw4c
	slguCpocHanzXg7KskZWQjeNKlgzgOYA6F4hN2+q+2ZpfgC3uPl8/LetjoTD+hCZve3AYCHCPlE
	Z7WPaUOZgvqcr9kvteJBTpJtDMnOi+Y3iQaaaRYblneDrv88QJ3pcpzmZyMUSFIEKLH8dVbkLmR
	zzRxo34IxLLQlY=
X-Received: by 2002:a05:600c:858d:b0:48e:82b4:b54 with SMTP id 5b1f17b1804b1-48fe6514873mr222865245e9.23.1779175989618;
        Tue, 19 May 2026 00:33:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:1d4b:274c:94d:a69f? ([2a01:e0a:106d:1080:1d4b:274c:94d:a69f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48ff43f213esm136408795e9.1.2026.05.19.00.33.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 00:33:09 -0700 (PDT)
Message-ID: <4ed0c9c4-6a48-4c25-9caa-16914587e580@linaro.org>
Date: Tue, 19 May 2026 09:33:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 08/13] drm/meson: dw-hdmi: Use local dev variable
 consistently in bind()
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
 <20260518194744.2483580-9-jonas@kwiboo.se>
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
In-Reply-To: <20260518194744.2483580-9-jonas@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_003311_609146_31ADDF2D 
X-CRM114-Status: GOOD (  14.27  )
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
> Replace indirect struct device accesses via pdev->dev with the local dev
> parameter already available in meson_dw_hdmi_bind(), for consistency and
> readability.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
>   drivers/gpu/drm/meson/meson_dw_hdmi.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 30099bf71aad..fcd2426af9fc 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -671,9 +671,9 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>   
>   	DRM_DEBUG_DRIVER("\n");
>   
> -	match = of_device_get_match_data(&pdev->dev);
> +	match = of_device_get_match_data(dev);
>   	if (!match) {
> -		dev_err(&pdev->dev, "failed to get match data\n");
> +		dev_err(dev, "failed to get match data\n");
>   		return -ENODEV;
>   	}
>   
> @@ -771,7 +771,7 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>   		return PTR_ERR(meson_dw_hdmi->hdmi);
>   	}
>   
> -	meson_dw_hdmi->bridge = of_drm_find_and_get_bridge(pdev->dev.of_node);
> +	meson_dw_hdmi->bridge = of_drm_find_and_get_bridge(dev->of_node);
>   	if (!meson_dw_hdmi->bridge) {
>   		devm_free_irq(dev, irq, meson_dw_hdmi);
>   		dw_hdmi_remove(meson_dw_hdmi->hdmi);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
