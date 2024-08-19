Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47F5C3DA4A
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Aug 2024 16:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h1ZdbwkPhcJmWDIgei1rbgVqc/C1H/tNKiL+hSg4eXQ=; b=odArwX4Y3DpUESy38lNaRHjC7L
	p6Qf1EWiH/JUzcjnEXw/NQ8GU3K/zg6UV6F9+WH1JWBdEqY2gugljCuE4MrchFZ6H7wS1k6T3WBzd
	5Mcgq5qWTnluSD1d9r4TewnDUPtUt4mSG2UyAQgC9sjOkQ8ZPSGpKR5pSrhvL47PmLjC7bBUbN0jB
	b1PlXSzrnNDmhIDIr/B3fAJWJTNhTJvnG2nstVOG5pFWL417JbsfdiOgK7tfEVJI1OK7fU4Uw114z
	mnZEKYlazOOe0HlYpqsWXC8bp8HMHCXdDTrjDGcQkstKLZEJLYAGHF4bqnsGDO1wKWMxABh9hCzti
	qEA4R3XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg4q3-000000024Kp-1eRA;
	Mon, 19 Aug 2024 16:02:35 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg4pl-000000024Cu-0fdd
	for linux-amlogic@lists.infradead.org;
	Mon, 19 Aug 2024 16:02:22 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-429d2d7be1eso23559905e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Aug 2024 09:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724083336; x=1724688136; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n2H5KgBgMPKBbBbgbQMaqWtynMas0Paslh5q5xHBjrg=;
        b=n47N/MtaQ6gm2C6Y+XSBWI489w3agoVWx1v+qTEj58Pqre7Xyoipa1hl8gm7DmJ6gK
         Ah+iNquKrX6cpieOqQnGgccQFCM9yBD9G6gjb+5sO794m67Jl5W8x+t5Yg4Rb3h5dAMz
         N0A5K6O5zHiTklHGw7O/EPIDpB35oNYqmuRzPpvXNcKlt97Qyl58cTjsQ+ZoVsSZr82Q
         dSlo3Q1kgVczTZ2SIkyMy8zWP7yWlu1heV1NXcXSF925CVJohtAJrDHasOewwK3W3NhJ
         OYag0MJDFzPC13PFGX701ATTBX+IPd3sC1Jp04Rln6H0X1oSs3vUk/GpAz2cDtxn5yvW
         l2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724083336; x=1724688136;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n2H5KgBgMPKBbBbgbQMaqWtynMas0Paslh5q5xHBjrg=;
        b=AZ83gtVb8UUhG73xO0OMA+RAwQe2pLytqoGT6Igy+GCTxKLo2SXUZ9LRcpqW/Aa+yN
         BzEUV8GIt2DofTdb5TzxpKjL+5WPDOCYap+eZTmtxUVyOFC0pwawmgjCYCWucZGMuJYM
         BfK1jZtUyrQ1ptSMOjSAYi966OnmiOokkpDkCWcDRrbm4dd/AME6yGjAaI9zWx/lwN4k
         sNcsAmjFoOeKOnqtBPckCBP4yjTqvYDsjxENXhfJdIcLsMJBS9NA096mDlqohJ9QFXUx
         E3EvUvFYYIqgqsJQKXwaBJ9O4aQerK4JtUQHchibO93k4Tedh95039HxTLonZ8DkLCPb
         ChLg==
X-Forwarded-Encrypted: i=1; AJvYcCXbtBxQor0OXBFNTA9ismVtKzwtkVeN9ojXCkwvRbaWRoT+9cu2YTfBF7D6aOm8B2XOTbmP6PoVu3kJKqmr@lists.infradead.org
X-Gm-Message-State: AOJu0YwYmsbTRLPp8AdngwC+cjtgWyZBgjVS8wZwdPEbwyb0Ox7noTv7
	KpPt1goQn3UkKLCc0R7lbiG8YHKOqBU0OModKGTfKe8zZ18MrpnEkUEAlP/wcjQ=
X-Google-Smtp-Source: AGHT+IEGipZBzPGNFeIKPltBTWern8DK1f4USLWgrkfk2l8Nz1MjsA6Et4venFozTHGa3oZSR1IomQ==
X-Received: by 2002:a05:600c:4fc1:b0:424:8be4:f2c with SMTP id 5b1f17b1804b1-42ab56b7c40mr601885e9.2.1724083335320;
        Mon, 19 Aug 2024 09:02:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f54e:4b0a:5175:5727? ([2a01:e0a:982:cbb0:f54e:4b0a:5175:5727])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed79d9a7sm114346915e9.39.2024.08.19.09.02.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 09:02:14 -0700 (PDT)
Message-ID: <4ecb4d18-026c-41f9-b5ab-ae9dafc20887@linaro.org>
Date: Mon, 19 Aug 2024 18:02:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/9] drm/meson: dw-hdmi: use generic clock helpers
To: Jerome Brunet <jbrunet@baylibre.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240730125023.710237-1-jbrunet@baylibre.com>
 <20240730125023.710237-4-jbrunet@baylibre.com>
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
In-Reply-To: <20240730125023.710237-4-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_090217_241939_AC914856 
X-CRM114-Status: GOOD (  16.99  )
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
> The Amlogic HDMI phy driver is not doing anything with the clocks
> besides enabling on probe. CCF provides generic helpers to do that.
> 
> Use the generic clock helpers rather than using a custom one to get and
> enable clocks.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/gpu/drm/meson/meson_dw_hdmi.c | 36 +++------------------------
>   1 file changed, 3 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index bcf4f83582f2..2890796f9d49 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -619,29 +619,6 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
>   
>   }
>   
> -static void meson_disable_clk(void *data)
> -{
> -	clk_disable_unprepare(data);
> -}
> -
> -static int meson_enable_clk(struct device *dev, char *name)
> -{
> -	struct clk *clk;
> -	int ret;
> -
> -	clk = devm_clk_get(dev, name);
> -	if (IS_ERR(clk)) {
> -		dev_err(dev, "Unable to get %s pclk\n", name);
> -		return PTR_ERR(clk);
> -	}
> -
> -	ret = clk_prepare_enable(clk);
> -	if (!ret)
> -		ret = devm_add_action_or_reset(dev, meson_disable_clk, clk);
> -
> -	return ret;
> -}
> -
>   static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>   				void *data)
>   {
> @@ -651,6 +628,7 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>   	struct drm_device *drm = data;
>   	struct meson_drm *priv = drm->dev_private;
>   	struct dw_hdmi_plat_data *dw_plat_data;
> +	struct clk_bulk_data *clks;
>   	int irq;
>   	int ret;
>   
> @@ -701,17 +679,9 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>   	if (IS_ERR(meson_dw_hdmi->hdmitx))
>   		return PTR_ERR(meson_dw_hdmi->hdmitx);
>   
> -	ret = meson_enable_clk(dev, "isfr");
> -	if (ret)
> -		return ret;
> -
> -	ret = meson_enable_clk(dev, "iahb");
> +	ret = devm_clk_bulk_get_all_enable(dev, &clks);
>   	if (ret)
> -		return ret;
> -
> -	ret = meson_enable_clk(dev, "venci");
> -	if (ret)
> -		return ret;
> +		return dev_err_probe(dev, ret, "Failed to enable all clocks\n");
>   
>   	dw_plat_data->regm = devm_regmap_init(dev, NULL, meson_dw_hdmi,
>   					      &meson_dw_hdmi_regmap_config);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
