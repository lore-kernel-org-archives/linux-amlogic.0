Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42CF5C07E97
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Nov 2023 09:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9pd4yeE1GfuwYqVgT4J7eGduDih1k+Xi3eW337gkrgc=; b=vrIli5BJN45v8y0BGxYWB00TEB
	Yd7XLJKOzCgq3S+KxRjAxKFNV1FircuPgih2tanbOtkZLB0GHLJq5O2/gGJtqDM2iLIKBtvuJh7lS
	UrlHk0h62+WeAD3Ymz4YPSpSsSHQr8U5lkZUY0FmYMb1Og+gcnlK8/MHFyQ/u2v6B7kOzsOdKPyg3
	kq/O5MwaTeRUvQnIx42/reSaw+uu1XtpC0rA8k3ilX5BmpPQu7jpI0L2SZPN7f0cLClY0MoYDfd+5
	zRgI15b+026eJkR3Md36eJwJ8hO0TChKu1Du5c1XopVmqrbsjELiaxUWvcNbjeL5bfvXtmhJzcerQ
	WLLX0ECQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Gql-007dNb-34;
	Wed, 29 Nov 2023 09:27:19 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Gqi-007dKz-2N
	for linux-amlogic@lists.infradead.org;
	Wed, 29 Nov 2023 09:27:18 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-333030a6537so1901331f8f.1
        for <linux-amlogic@lists.infradead.org>; Wed, 29 Nov 2023 01:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701250034; x=1701854834; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wSWOGihLbvWd/HkTOnjJVlcVTUALnSb3Os9ZzOpVteY=;
        b=nV2GPc7y1kwVZDxEdEhUnnLAwyDQq154cW6C/dt/gDVTqo5DoiDENj59Jh0R2Frmzg
         BCNsOILVZrXlBTFGR765KZqTd51ZVDHiJpHPBM5FcdIJVWSagln4kPIjkvqxvHfYJUcb
         ++KcUR5Re3SSoj4YrdqBMlRH/A2Vgu1gvKVJ3qK/x4VE1tGG/m3+LsZkI2/YyisLX6yk
         KVmt3gvBx59JNaScAO4ge6+3egxzro8N6q+BTQYPGLDDLOmAaQaFji/IO8/sSAawUmG0
         DDebrYomcdIyhG9rFMJmgF/11UbfQDFU95atUzUcaKLlnUNXXKO27a6Fzk+f3XI7uTJM
         ZOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701250034; x=1701854834;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wSWOGihLbvWd/HkTOnjJVlcVTUALnSb3Os9ZzOpVteY=;
        b=XiSZyLtYygZMgyNvWPsl2ZeGvfHqZRtZweuYRTHYN0Hm5P3eUyjRs2QC6MPoRtWj8+
         oY+SN6oOriP4xEUVkFys9r4Z9HocFvlDl+BAw4O3Eg5A+P/lu5q7YscQmL5/7Qbnakwh
         DApoVTKCvzKae4qaxR1R50aruzzbfNev2CGzxR5akS+Ziu3Ndbrc1kdlt3eBUZSNnox4
         MhxoT0pfapFOzlvN6xQfJwiYXzE2EJMiKzxdeI2tR7mS+oSVit+IXsAFEJ6e9Y3tno0Y
         tiWri+WJ55wmRI059pe+j2HvP/0ru0t+xv/WpoR+pCBBcP2KQjbrLkfCVjHCte6LScYF
         gawA==
X-Gm-Message-State: AOJu0Yy3rKiko8Hr3Eia/SX//LZhSgKLX5SoPb8tqMv2XWcvAYbJ+GFc
	GEx2Xp/DragKrHOHB6+GGKe7mg==
X-Google-Smtp-Source: AGHT+IEvFDFRW8z6E5TlMnajfmGUr1GR7ySAnhV1pJPndQQNOYzuf0vOlVDE22biyX9j9hGxRzwgvQ==
X-Received: by 2002:a5d:6309:0:b0:333:85e:a11c with SMTP id i9-20020a5d6309000000b00333085ea11cmr4770557wru.16.1701250033770;
        Wed, 29 Nov 2023 01:27:13 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:31d3:eea3:8f97:6a2c? ([2a01:e0a:982:cbb0:31d3:eea3:8f97:6a2c])
        by smtp.gmail.com with ESMTPSA id l12-20020a5d4bcc000000b00332fbc183ebsm9798399wrt.76.2023.11.29.01.27.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 01:27:13 -0800 (PST)
Message-ID: <e7a2db20-4d6c-4fd0-ba0e-d8a2057cfbfc@linaro.org>
Date: Wed, 29 Nov 2023 10:27:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] [drm/meson] meson_plane: Add error handling
Content-Language: en-US, fr
To: Haoran Liu <liuhaoran14@163.com>, maarten.lankhorst@linux.intel.com
Cc: mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20231129092113.32630-1-liuhaoran14@163.com>
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
In-Reply-To: <20231129092113.32630-1-liuhaoran14@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_012716_773943_032E839A 
X-CRM114-Status: GOOD (  15.18  )
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

Thanks for your patch!

On 29/11/2023 10:21, Haoran Liu wrote:
> This patch adds robust error handling to the meson_plane_create
> function in drivers/gpu/drm/meson/meson_plane.c. The function
> previously lacked proper handling for potential failure scenarios
> of the drm_universal_plane_init call.
> 
> Signed-off-by: Haoran Liu <liuhaoran14@163.com>
> ---
>   drivers/gpu/drm/meson/meson_plane.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
> index 815dfe30492b..67b36398f146 100644
> --- a/drivers/gpu/drm/meson/meson_plane.c
> +++ b/drivers/gpu/drm/meson/meson_plane.c
> @@ -534,6 +534,7 @@ int meson_plane_create(struct meson_drm *priv)
>   	struct meson_plane *meson_plane;
>   	struct drm_plane *plane;
>   	const uint64_t *format_modifiers = format_modifiers_default;
> +	int ret;
>   
>   	meson_plane = devm_kzalloc(priv->drm->dev, sizeof(*meson_plane),
>   				   GFP_KERNEL);
> @@ -548,12 +549,16 @@ int meson_plane_create(struct meson_drm *priv)
>   	else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A))
>   		format_modifiers = format_modifiers_afbc_g12a;
>   
> -	drm_universal_plane_init(priv->drm, plane, 0xFF,
> +	ret = drm_universal_plane_init(priv->drm, plane, 0xFF,
>   				 &meson_plane_funcs,
>   				 supported_drm_formats,
>   				 ARRAY_SIZE(supported_drm_formats),
>   				 format_modifiers,
>   				 DRM_PLANE_TYPE_PRIMARY, "meson_primary_plane");

Could you re-align those lines aswell ?

> +	if (ret) {
> +		devm_kfree(priv->drm->dev, meson_plane);
> +		return ret;
> +	}
>   
>   	drm_plane_helper_add(plane, &meson_plane_helper_funcs);
>   

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
