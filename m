Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE08BC52D6F
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Aug 2024 16:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nugCct6jPMeGZ+DipcazCCzIRT43Cl9J4TrcBEg2VlA=; b=2zjOgVH593gA3UcMovhn113TLA
	Gu+zXMkCl941Lu2AGFRxpn3u7r5cLRl6B7H5/DW6Dnf2DkSd7/IWTLM+O0U3jXcANMtvAa4AhES2R
	R7XeLX40S9xt6uxQg89KMvS57r0yg8XsoFQrQtSzXBPBgMZr0fCygojy8oZo0GFUExXhzsJ+RAene
	tCXhtUbz75TCxckqU1DjiNZCjXd93V6vKImLUYfXqLZTOeUxOKpmGDR7VtkI5rQCEGAmLWhdTuU2c
	dcnNwl3GkzpSl1O/mpXE07mSKfhW9Ds4nj2mfqzAXlfhs11Z/wFVyIFX6gtDFKOUiwJwtx2LuHRdU
	Gskm7gWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg5GU-00000002Aq6-3OON;
	Mon, 19 Aug 2024 16:29:54 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg5G1-00000002Ae5-3WvK
	for linux-amlogic@lists.infradead.org;
	Mon, 19 Aug 2024 16:29:27 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-371b97cfd6fso1036837f8f.2
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Aug 2024 09:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724084964; x=1724689764; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5US2fLlCk1Qa8yNz6skTiBfI5hTwUtCqnfiUSm9ZmH8=;
        b=MW1NoG79M3KV5LNCvjLRRxjmkYNU0PG9ajh9pG+t+Ugn4wztGHVka4ynd6skXZ/p5B
         gNnnAxcvY904WCwFEK+sTJ29kkEkifSQGFIdSqXdhhvIoUMX0VPXKZAZ3/sPxQpItMmQ
         6d8wWRrv5iGdEvOSkSzwQe4vnuHvH84SszhawnVtgUeQ6470+dBM0H/4wvAVxNecdDz+
         fseQmWw/ccvz79WWMi6U9+/v/1G6I2NgfwQTDUKP6GD3NPhL+Cr6fdWQistQXSrohZ9a
         OgYIDsk7cW1VZH59dbxLKTvzBju8SVkxRe00XBUMxUpmDfQCVeCR3T8mxaBknbV2gouh
         DGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724084964; x=1724689764;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5US2fLlCk1Qa8yNz6skTiBfI5hTwUtCqnfiUSm9ZmH8=;
        b=xQdmaVyO4hTo1K4NtAmmil5F//B4V1cjc9Un0/zmSbrQn/x6k5UjrI8/gTR9ffGpL8
         Et7fOr7lW/luNuz3OKBC6hv/6Y/iaiils463/QYiUVZ9Qh0weVgaaKAVkgZPsIsvzfgE
         WdDuNraYbVa7lFByeLFWu9aC2ljfev0YJxUqLbYJYJEcKtVjg6ukEnJFmJeQjy26JHoG
         tg1C9rQuOhcvytxO6O4yWn7P9Olyf6t1UxCtXpItIQJLplkBPe9Mx2BpIdGj6/goJDUX
         S82GeejeeWkwuuzmGMIL/W7XgtzX8JJbwi85e79hxdmx9ayJs88tj6+UX/Aeoj2qgbgu
         UagA==
X-Forwarded-Encrypted: i=1; AJvYcCWQZsIhiTbQcsR7T3Ts5MB3pM3nvvhkNedIbcboFe02/b524S4C1Cr5lZionYNTsmJtlkmX9P+VbA4o2FwrODXd8SCMa7OFc/VSdtgzGcHBh2E=
X-Gm-Message-State: AOJu0Yx8RfXMtj7dDZWbr+JFcSV3Z1A2n//oveST58vPWZhMdMkXlPsf
	ME5SZDeW2i0vuESnYzFLrqfyL6983yC5NNpw9zhCDWB3vW6yTsL8XycpVk/suxE=
X-Google-Smtp-Source: AGHT+IHxfQlj6hZ6qabi9dNFuwSGuRU8pknTTNNcDBW8nTSoVe9O85P9qnLwExtrqcC3QNJEn9lkLA==
X-Received: by 2002:a5d:4cc8:0:b0:371:82e7:6ec0 with SMTP id ffacd0b85a97d-371946d29b5mr7731949f8f.59.1724084963165;
        Mon, 19 Aug 2024 09:29:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f54e:4b0a:5175:5727? ([2a01:e0a:982:cbb0:f54e:4b0a:5175:5727])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898bb588sm10912541f8f.115.2024.08.19.09.29.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 09:29:22 -0700 (PDT)
Message-ID: <8cae4536-52ff-4e54-ba15-6376dd9129ca@linaro.org>
Date: Mon, 19 Aug 2024 18:29:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 2/9] reset: amlogic: use generic data matching function
To: Jerome Brunet <jbrunet@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20240808102742.4095904-1-jbrunet@baylibre.com>
 <20240808102742.4095904-3-jbrunet@baylibre.com>
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
In-Reply-To: <20240808102742.4095904-3-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_092925_923380_0B74E314 
X-CRM114-Status: GOOD (  14.02  )
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

On 08/08/2024 12:27, Jerome Brunet wrote:
> There is no need to use the DT specific function to get
> matching data, use the generic one instead
> 
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/reset/reset-meson.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
> index b47431a21b86..820905779acd 100644
> --- a/drivers/reset/reset-meson.c
> +++ b/drivers/reset/reset-meson.c
> @@ -128,7 +128,7 @@ static int meson_reset_probe(struct platform_device *pdev)
>   	if (IS_ERR(base))
>   		return PTR_ERR(base);
>   
> -	data->param = of_device_get_match_data(dev);
> +	data->param = device_get_match_data(dev);
>   	if (!data->param)
>   		return -ENODEV;
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
