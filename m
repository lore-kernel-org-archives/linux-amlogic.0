Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AA5C5B552
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Jun 2025 18:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ErIumg+GiNjj8fSO+/Iiq9uc0FA0fe4kOtM8Mw4/7S0=; b=gGQNA95cdrYv4ZoQ6boLk+UhaQ
	t3W1/F4v1hcCs5q4J3WBwYfiNWBsSM3GICFLF3KnDwqdB+rP3EeI7hqvIKxu0f3cvI2Tqy5sN4qHl
	YNziDHg1YeApSY3RJgegJQptCl/hC8ZDXMStdPBi8FX9VEOQHNeQ8QjctPGOcL/0XHKfemVOEFq0i
	oyzln98tGO/u9+ZUcqC0wAeDrarpGlzWrqYLgAmITCYeA53d3RRDIcq9PYBBo0ufaXP92f079p/cZ
	KcH3mBbpXbRqYu335GAyMOu1DOsvCHWJWe6HcpFPEB1YN+ZHXTSi/hW6RY3o0VR5vNcqBUlXwBtle
	X1ikrngg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOhZJ-00000004wht-3p0o;
	Mon, 09 Jun 2025 18:50:01 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOgNz-00000004obK-3eoo
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Jun 2025 17:34:17 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a4f72cba73so3838739f8f.1
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Jun 2025 10:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749490454; x=1750095254; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9BmRKlj/RMDP5IzXSFzdO4da8XFCR2YzozS+rvgK1WE=;
        b=cqckpUnOXCJpBXbFMnSGoVsYAPLDNd+mqr1JtUvm+wzvx+rnujXIWV7fF0UYWXyUtr
         mQhvvEedtI4ndF/3Z8HI8WvZ2UWnTAPNiaWuyYH4Vq6gzdCU8kYcT4kwyzT7iqyx+ctz
         UHg6JnG1i6xSVte7yF4JHn7VwsxCECzFdkz0QMXw0jRxt98lL9NcXaCzRxOXlOWVSBe0
         QV+CHgMQGiYVbchFiRBWbiBzPRTjXWLD18aBVxq+bfI0nDmsknjcRZbQigkeY7boLiXV
         yJHyZRz/9CRBTgOBYu6PzNxCqVQe648gBgNFKq80UzSDdffoMwlVfRGH6efUdvjrRjJM
         v8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749490454; x=1750095254;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9BmRKlj/RMDP5IzXSFzdO4da8XFCR2YzozS+rvgK1WE=;
        b=p3WrMrfw/uKIMNYXe6Ce1SRGS56/j6jMHBl1rX9Anb3GXTn07Gn0lFhh5Tcz8l89Zn
         omvNBxaf7SoBjRQ+8vxNa4JZDMdAOwCO5+hd80LCI+G9b8RPLRYBwAl+itLXKm8xgpaJ
         g8a+RAatgLUUCqoQbPyuWTfXdgcEj77NgBbFWEisqaNv4Cu/gkMivx2x0ze4Tbu6QFDT
         lSeirGYjzAUJP0iJRFd5mrLhWmOh2EVw/a4WIVmo/m32ajlaVkcxMSZ6a0TMu3OxBi0D
         XpCPmKVlLpmLngxVj89B9SLgRpwuhUkfl6i6QZkSg9eDorT+RQ6B3knJOytDaYq02HPL
         78LQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlyep9b9CzdyvazKGl0G0WUo7/aoHWDC3/ITqYsgcqNTQXRd6EfEBtjKMYE6F+vs/oaCFDBIUxWZt13UBy@lists.infradead.org
X-Gm-Message-State: AOJu0YzeUrt9dqDPZDaUzIgEIn/Gfa6/fXTE09IOiKxGkEDZiE1ja3OM
	BPb6niRYKvx2B67BTb7feGuECjTY3hXoMLDOxN72nI6N+0NwBPGNgRHDMKfJf+yFjflYoJO/31A
	fQbRU
X-Gm-Gg: ASbGncs2u7VHy8cZZYdU8lRy/aS+gP59UJP5FsM9fG6chr/IZRtfOcmdwRQRhjB9rVW
	UcdjQgYscPhUS+PUa4hYHPJR1i/zZlTsioCLgFpqMnYQ1l/FP3MFnWtNk+QxRwzJygMOceOoSe5
	CP8PxK3mgcgAYHhCwhT73ML3n6A0Dl1sSyUngeVVS6YKVJ3tprSir8LeGPP2xoWDClS1fi8Fh0x
	Ybpd/Qpdpjnbbw+v8z54YcXVh6cq0iVkVFBXSukotsV0mgukgQtQ+G3A8BWRSoIc0HkAqQUZZFZ
	ceF2yZjnDc/ojgzlHWAMzoDgOfKiLLfWuvjWpahaSDmHe8ZRv5aLvOBM+NVlgRf1d5Eq94lbfuj
	swVIIL0cKlhdmMJLrbYrS0g5zDoQ2
X-Google-Smtp-Source: AGHT+IGkaYk2ZR7eBVSuTYhU38XKPy8+5RJ/cs78kF616gKs+MS4l8QgLXSnlOu4Zk+j1JmLSxgFAw==
X-Received: by 2002:a5d:64c6:0:b0:3a4:eb7a:2ccb with SMTP id ffacd0b85a97d-3a551417255mr318548f8f.16.1749490454350;
        Mon, 09 Jun 2025 10:34:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:d049:de0c:efef:b94d? ([2a01:e0a:3d9:2080:d049:de0c:efef:b94d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730d162asm113789415e9.39.2025.06.09.10.34.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 10:34:12 -0700 (PDT)
Message-ID: <04556296-bcda-436f-b462-6b1718dafd00@linaro.org>
Date: Mon, 9 Jun 2025 19:34:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/meson: use vclk_freq instead of pixel_freq in debug
 print
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250606221031.3419353-1-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20250606221031.3419353-1-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_103415_930036_7635E9AB 
X-CRM114-Status: GOOD (  14.68  )
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

On 07/06/2025 00:10, Martin Blumenstingl wrote:
> meson_vclk_vic_supported_freq() has a debug print which includes the
> pixel freq. However, within the whole function the pixel freq is
> irrelevant, other than checking the end of the params array. Switch to
> printing the vclk_freq which is being compared / matched against the
> inputs to the function to avoid confusion when analyzing error reports
> from users.
> 
> Fixes: e5fab2ec9ca4 ("drm/meson: vclk: add support for YUV420 setup")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   drivers/gpu/drm/meson/meson_vclk.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
> index 3325580d885d..c4123bb958e4 100644
> --- a/drivers/gpu/drm/meson/meson_vclk.c
> +++ b/drivers/gpu/drm/meson/meson_vclk.c
> @@ -790,9 +790,9 @@ meson_vclk_vic_supported_freq(struct meson_drm *priv,
>   	}
>   
>   	for (i = 0 ; params[i].pixel_freq ; ++i) {
> -		DRM_DEBUG_DRIVER("i = %d pixel_freq = %lluHz alt = %lluHz\n",
> -				 i, params[i].pixel_freq,
> -				 PIXEL_FREQ_1000_1001(params[i].pixel_freq));
> +		DRM_DEBUG_DRIVER("i = %d vclk_freq = %lluHz alt = %lluHz\n",
> +				 i, params[i].vclk_freq,
> +				 PIXEL_FREQ_1000_1001(params[i].vclk_freq));
>   		DRM_DEBUG_DRIVER("i = %d phy_freq = %lluHz alt = %lluHz\n",
>   				 i, params[i].phy_freq,
>   				 PHY_FREQ_1000_1001(params[i].phy_freq));

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
