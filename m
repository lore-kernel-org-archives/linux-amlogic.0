Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356F1CD4F3C
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 May 2026 07:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nrhksvkvcZQfRIorkH7w8aPOjiNd+VjGMBRbTMA3eRQ=; b=hr6Y5UIyEHSPTcwsafWL+kfBZT
	04mH3iQ4oT3WnjKPI+XdPUy4WmkluJjBrCBEV+gwEg6EmIvXJBc5KWHXQtRQedgXnDLuvE603EupF
	JiJ43MfI39LlWmsyNynF7ovY22FDqwu1qYDsgx3k3I+jWqzgR5buYhGuU/8wBXO3iXyjGUIAsCRZW
	indWBFmWK+7L2NFKidlJJloLQgg0XfMjvLNoURimp82iyp0kv1AoWSM8MIEJRoZwOgQmlEOlw9ZTA
	/3Qodv3rjp5JV1okfSQjQD9xU7R4/OZQgafxAV3Hqno4J/TvekjW2cW/SFJqoWxJ7w3RG7uwR1/d0
	GJXCobaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPEon-00000000UCj-36Aa;
	Tue, 19 May 2026 07:24:45 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPEok-00000000UB4-1Dt6
	for linux-amlogic@lists.infradead.org;
	Tue, 19 May 2026 07:24:44 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso38936585e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 19 May 2026 00:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779175480; x=1779780280; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T1JwviSU788ImildKu5V2g5LdkhxoNhqBKf1BksYwwI=;
        b=hvBcKhsfsK2NApB6V1lIBosNEwYqrIDqGija0iuneEvxaRP6JSW923THnxq79e2ZzA
         Sx5O6dEleCYuhnAmlE3cpTO654AzhhYwCv2j1P0kd2ny9EkPyhmFe5Prbd+Wrp/j0SX5
         s0YrJvh8Jo4BBIDH5v+Gx/LmBrf8mZGNEJBvkqdv32rGp2AOvDYmV3crbIPFiZ95ShbM
         eBbR1LGx5lZ2pFupj5JaCabOJt7xlvzpBr56I0irXFo32sA8Gyw8moyLOtyB0dG0lOMK
         KaFhmoeEe6vJQ8IvtuyZ0Jwcwypjcbx6LpEa5c0WWltnmaImtbndXhYewfUtpbTIGW3H
         uWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779175480; x=1779780280;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T1JwviSU788ImildKu5V2g5LdkhxoNhqBKf1BksYwwI=;
        b=a58yWzDkjHfVtS6zFKICL9VuxcDKNNABXFI4TsE75q8ubPG8fnIGL+WkDjiQJ9q3eB
         otbAml8rxDNevjB/FM9iWJMtGiYzAVNzkXmShxXpQ4U2ZBRRC89VjcHfb/Yug2NELGxQ
         tL+kha72uWM1zZ/gH/aHab7AdYKWEIs/FBFvSGVR4gupsAKwbmZgM860rT4fqUF1oR/B
         8L8IM592dFSrEJxCOC9jsqwkTvvm92X4OKL20Ycxgz3jRrnL+dndWWHro1tqkUobBzz6
         YIRbxbFH4jvQLb7f/i/TQ82QAly9M2XRk9gwFWxT3eicI1IQREEN4aNxl4bUIzDUOUZZ
         c2Bg==
X-Forwarded-Encrypted: i=1; AFNElJ9OgeJOK37sbvzctQWVf/sZHJLvaZloCW9QJVicV2g0QGI/Lz3uTXo/d6VVQjP78XFwLKcJ82f/AYjAfVb3@lists.infradead.org
X-Gm-Message-State: AOJu0Yymvqh5VqpiPlnmX460yUP+tebMm1HqlL9cDmPv863FEXy7NDjN
	bD3peSJJ5FtR/e9TTgC7yXBRJ7qDUruJFIT8yLWKzItU/ikkrxv3INiuTtLimkDw5Gk=
X-Gm-Gg: Acq92OEF7baP6TxEKw7LKfjM2eJcuDqx551wCmXW/2DEOT6zqv7pU3T0cYEB6keJIyG
	LGiNSWmv+bJzZ5NXKBHA+XIGWCv7qIR8tms5ore/1BI5NIQM2iOay6GNejklu857PiegccWdgpK
	H8DCkWxRFLTs+AWjIb7+4sE7Xhuh5FqD+V4PBuFgPNSmm7ub/tS0FMo4aX5b+Uz85rp/PbMEOl8
	HDcjY8SXHVroH1giSJ+qFmcC8YNhqC38m9/nUqXtesTD/YdbAhgtauANfwngADeXcJZS3S96Ma1
	wfb17ADYBkqMCQ+OVCS9VB4n+OZCpmqH7XFssgNLMSDjOVeqw2QFqinbpxYYoLLZnVfFxA8WRqh
	FB46qKSzbTdB3rCQp6/8e6iRca1H5ZSg0+fmoBjpkFzHkmibBBZD4JxmjZqwoLGJV4guuE5eaRZ
	NZFZb05HvzFeSUVxYAwBQWO7GYTMOSomxcxKfBFybyeOhVa7a81aoLwNjr6VtIq53LvGF8ZQZsn
	VmO
X-Received: by 2002:a05:600c:c086:b0:48a:563c:c8c5 with SMTP id 5b1f17b1804b1-48fe60eabddmr207018885e9.8.1779175480245;
        Tue, 19 May 2026 00:24:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:1d4b:274c:94d:a69f? ([2a01:e0a:106d:1080:1d4b:274c:94d:a69f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feaa2c96csm102486505e9.2.2026.05.19.00.24.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 00:24:39 -0700 (PDT)
Message-ID: <b135ff44-16d5-4a9d-9c7f-478c070efbb0@linaro.org>
Date: Tue, 19 May 2026 09:24:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 03/13] drm/meson: dw-hdmi: Call dw_hdmi_remove()
 consistently
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
 <20260518194744.2483580-4-jonas@kwiboo.se>
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
In-Reply-To: <20260518194744.2483580-4-jonas@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_002442_371116_F57FB8BE 
X-CRM114-Status: GOOD (  18.44  )
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
> dw-hdmi export two similar pair of functions to probe()/remove() and
> bind()/unbind(), update to use dw_hdmi_remove() for consistency.
> 
> dw_hdmi_probe() will drm_bridge_add() the dw-hdmi bridge, so it is
> expected that of_drm_find_and_get_bridge() always return the dw-hdmi
> bridge. Regardless, validate that the dw-hdmi can be found for
> consistent error handling.
> 
> Also always ensure the IRQ handler and bridge is released before
> dw_hdmi_remove() is called.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
>   drivers/gpu/drm/meson/meson_dw_hdmi.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index eafe7daf6ff1..9aafdc768f2b 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -775,10 +775,17 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>   	platform_set_drvdata(pdev, meson_dw_hdmi);
>   
>   	meson_dw_hdmi->hdmi = dw_hdmi_probe(pdev, &meson_dw_hdmi->dw_plat_data);
> -	if (IS_ERR(meson_dw_hdmi->hdmi))
> +	if (IS_ERR(meson_dw_hdmi->hdmi)) {
> +		devm_free_irq(dev, irq, meson_dw_hdmi);
>   		return PTR_ERR(meson_dw_hdmi->hdmi);
> +	}
>   
>   	meson_dw_hdmi->bridge = of_drm_find_and_get_bridge(pdev->dev.of_node);
> +	if (!meson_dw_hdmi->bridge) {
> +		devm_free_irq(dev, irq, meson_dw_hdmi);
> +		dw_hdmi_remove(meson_dw_hdmi->hdmi);
> +		return -ENODEV;
> +	}
>   
>   	DRM_DEBUG_DRIVER("HDMI controller initialized\n");
>   
> @@ -793,8 +800,8 @@ static void meson_dw_hdmi_unbind(struct device *dev, struct device *master,
>   	int irq = platform_get_irq(pdev, 0);
>   
>   	devm_free_irq(dev, irq, meson_dw_hdmi);
> -	dw_hdmi_unbind(meson_dw_hdmi->hdmi);
>   	drm_bridge_put(meson_dw_hdmi->bridge);
> +	dw_hdmi_remove(meson_dw_hdmi->hdmi);
>   }
>   
>   static const struct component_ops meson_dw_hdmi_ops = {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
