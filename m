Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF59C3ABA2
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Sep 2024 13:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HcR2dvsxwv4msxPjUtXtE18JUP0uGhQIN7Z0iXs+h1A=; b=KZ+g6AMKERi6EbkJezS0dCAtWq
	+QgkN/ZaRuAqx1QBviT7WqDS+vGNr/3GHS7+zDo6WR619gxL2XF67eS0dymI3PoWzBgdZWJY8velF
	BGoL1tPsnIxfIjgrDP2kvhPaar+dFAJcvKQ44/fs0YpTvyfqeceelM5IgGD22RdSdV0v20BilmzNz
	ylNOqrcoBb5hLy45UdXkftK7MNn7YubpsKldTl4xSn1bkHDx8LWxopjVBpJFdByy5hsBQt7yU6kct
	NGJXwZknVf5RZC5dRiwz5fDPmpl2SompY6ocBXSvNDGWBB5n4p565fY1eXRjQ9ZXMOiPioSArDYF3
	5/0qDuSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqBbw-000000043gL-0HR8;
	Mon, 16 Sep 2024 13:17:48 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqBbt-000000043fu-0stw
	for linux-amlogic@lists.infradead.org;
	Mon, 16 Sep 2024 13:17:46 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3787ddbd5a2so2658085f8f.0
        for <linux-amlogic@lists.infradead.org>; Mon, 16 Sep 2024 06:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726492663; x=1727097463; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k8/0dZhKd2VoBzHph8M6WG+RzXmhF2Sg0F+1YjPXOUg=;
        b=pChrHKYoA9X3j/k7El+fNdrGjdoYZ7Ynr1u8NGXhD5SnaEh+viN8d7mcrEi88JMovD
         zJmY1kHEuw4wKKtTqkxvpWybvzUKoIzJVd8WdaGCfhdNO8xGXlgRBb9tAlMnHlcpyl+2
         El8TSrN2Vb1ujwDKNnQA0+T1s2fyuY6Jm2XQyvtUanjUF+leR5HuyLDAnSGqv/LYA9Xq
         zAHyA6LWOzOnoRjVLTkrCuLhKGqKi/he0hTHJxL/EWGOS6ZfS/BWSOX219hbvva+QaRz
         VVXMO8ttkF5LKMtHuZsmpbHZePKfqB/T+HUkUFveLbMDCIZtwUSfx/gX0FOw8B9YCbzd
         83Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726492663; x=1727097463;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=k8/0dZhKd2VoBzHph8M6WG+RzXmhF2Sg0F+1YjPXOUg=;
        b=oQYjTlqlC36UfgtCdo6mDo3+xeicim8tHT8J6yWhs4C3XEfr+SA/LYHq6zxf6TtOWK
         D3XmGfPEXSrUU+jrv8PDB3pT9pOvJo3Z1eHd3m94O7t1knMa5F6Qwi2NDAkfCQzDtrwY
         F7KdAOMD82eFXnuwtrfpER6W0qKdFYk23gMm4mYsoPQnFY0Fw2WyuzUaz/2XKHXszth7
         EiAnvkA1foXX16mhBNpUWEazYQC+8oLdCdZckoV+O4UAynFrtCoLyB2UDWCsJkRqdMsq
         jYliimhjWmky7z+tYls5iCAarIjd3gQUYUbs0J9WCLQEe0+ahz7ATrwhuawEcv61Bu4I
         2O3A==
X-Forwarded-Encrypted: i=1; AJvYcCWwtVWpzr6xdMsgVNGefK0TpRPKQitNAQT9H/Vua8lPXr2CVGaup4+OtT+GRRxFzPvndHNkVDJgmhbDgj57@lists.infradead.org
X-Gm-Message-State: AOJu0YxhyB70Gd88tGX3tG4mU15RzspjjanGzadHf6CNLSYhXLUerRAL
	xkWKzsd/NMftDKxjoOKYK58tJ/OqfXJLSHXZn/kj/3AQjywscVXaHFqhx3xrlUU9ZCuNb9Iv39z
	+
X-Google-Smtp-Source: AGHT+IFEDMf+kr0lETK/6W9D+xI2GYEHCY0wFvjC7CdHVQi2z6pbuBPNU5Ngl3ScrI29tT+8A1KkzQ==
X-Received: by 2002:a5d:670c:0:b0:374:c50e:377b with SMTP id ffacd0b85a97d-378c2d61a99mr7246058f8f.57.1726492663318;
        Mon, 16 Sep 2024 06:17:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:46e0:9b1e:8680:c41c? ([2a01:e0a:982:cbb0:46e0:9b1e:8680:c41c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e780551esm7332627f8f.101.2024.09.16.06.17.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Sep 2024 06:17:42 -0700 (PDT)
Message-ID: <7960e102-eb5f-4fb3-bfb3-1e631e2851f9@linaro.org>
Date: Mon, 16 Sep 2024 15:17:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/meson: disable line encoder before programming the
 gamma table
To: Theo Debrouwere <theo.debrouwere@gmail.com>,
 linux-amlogic@lists.infradead.org
Cc: Theo Debrouwere <theo.debrouwere@faytech.de>
References: <20240916131400.23261-1-theo.debrouwere@faytech.de>
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
In-Reply-To: <20240916131400.23261-1-theo.debrouwere@faytech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_061745_291406_A56F863A 
X-CRM114-Status: GOOD (  16.41  )
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

On 16/09/2024 15:14, Theo Debrouwere wrote:
> There is a very rare bug, where the gamma table can't be written correctly.
> It is possible to write some entries into the gamma data port, after which
> the WR_RDY bit isn't set anymore. This causes a timeout in the code, and more
> entries will be written into the table. (each having their own timeout)
> There will be an image produced, but the colors will be completely off.
> The number of entries that can be written seems random.
> 
> The issue seems to be solved if the line encoder is disabled before the table
> is programmed.
> 
> Signed-off-by: Theo Debrouwere <theo.debrouwere@faytech.de>
> ---
>   drivers/gpu/drm/meson/meson_encoder_dsi.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
> index 7816902f59075..15fd9df58ae4e 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_dsi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
> @@ -66,10 +66,11 @@ static void meson_encoder_dsi_atomic_enable(struct drm_bridge *bridge,
>   	/* ENCL clock setup is handled by CCF */
>   
>   	meson_venc_mipi_dsi_mode_set(priv, &crtc_state->adjusted_mode);
> -	meson_encl_load_gamma(priv);
>   
>   	writel_relaxed(0, priv->io_base + _REG(ENCL_VIDEO_EN));
>   
> +	meson_encl_load_gamma(priv);
> +
>   	writel_bits_relaxed(ENCL_VIDEO_MODE_ADV_VFIFO_EN, ENCL_VIDEO_MODE_ADV_VFIFO_EN,
>   			    priv->io_base + _REG(ENCL_VIDEO_MODE_ADV));
>   	writel_relaxed(0, priv->io_base + _REG(ENCL_TST_EN));

Good catch!

Could you add the appropriate Fixes tag ?

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
