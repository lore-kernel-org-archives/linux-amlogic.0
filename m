Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5671CCA470
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Oct 2025 18:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IoIGKLzyfLVUYHpMZe5Fgj04mUWnBWgse8wa9Api3eI=; b=OzY33DLowtR8y/qcSfh/2EbPfs
	ZmE2lYkp8H7mx9vjjeIxzHWDvjtBAkRLpGx3WJo+2y+WYtEhv2zPacz3rIdkTLkN5AbH+A2Cv5y8d
	dxwmfrbizlKrkjSLi67iKntNnPZOvYrn28SmVeLnHIYODUY38ejICp4yxCs3BG2w1ggbaa7FmyTmm
	UAYJ3tRly8pOSxxuZJOxNA3p21JI2QwvImsLdCjBqxaywteQmImUWafZpAg/qfDeCrVJ7VP3zha1V
	EcR8Hf29QlsmQS+wM9qlwlJ0i1L2PWTD229/M2dNs0WvhzSF+RI3KVm5ioJ5a4HaK6D5c5pKeU1MY
	/29t4Dhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6YfC-00000004SZC-2mZu;
	Wed, 08 Oct 2025 18:13:22 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6YfA-00000004SY5-19lh
	for linux-amlogic@lists.infradead.org;
	Wed, 08 Oct 2025 18:13:21 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-46e2c3b6d4cso1029455e9.3
        for <linux-amlogic@lists.infradead.org>; Wed, 08 Oct 2025 11:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759947198; x=1760551998; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fZaXt+gShwcST4niGAvItceQr0XW4MXQVlljb1xZ9gY=;
        b=fbRK9YLOCxXTUzGxScTyibKYACuTmik7splNwrRKBHI4zvucmGJEJY+fiGEuOJ2LrV
         0o/eRAq4BWdNWbekohzZ/W1hHNGFXTvX3q7GceB7bhp3gJlBHMC3kpj8Fa4EMg6gPGgc
         TS9vQcHGXvzm5+0qqvjC4WJ6gqjHtpxZJ3v97b/ewfOPpSZiOq4/dFS0aJ9IguoGRi2F
         NYNIy3iaM9O3N3DcmhvDx0eoWppghZIp6D+Cw0rFnL6vTLcUSPLjusVWu6r3IIcvNDif
         F/ioP5ANYHyYTlaNs8bGia3uQ4MfJigV246Ocq1ztQ7NXaaSPsN77xuIL3SSLcrknyui
         CxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759947198; x=1760551998;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fZaXt+gShwcST4niGAvItceQr0XW4MXQVlljb1xZ9gY=;
        b=apDCdqGRsPKouQergxv9kNx/x5DQwnJMTJaAMNl2iahXLaIoVJZFzfPo0KoiebYul8
         N4os+SlAmCBtRBZQ79KUwKFXZab9SOVM7/aF5aM4vqA1ziEROJCXErhzMCSvvCfL9ugi
         HiLcBfnb0bM0Vh4KIbwayTklNd6u+VYx3a2MUgN1X65tmg7YhGo2pxMdkYbifdlM42kP
         xtXG6ZWeXFJeBw9W9Bg+cLZQJsoD1lpgktRofK0wH+FfXG0zdxt1nzZNI/+WWiDgloiB
         Ck3WtRTf7k5L35Cw6vlRSV+47Y7bRRaPjrqYEm8brZZfFBfQ8EVZwhO/OtDTHXSxrQ28
         Pdzw==
X-Forwarded-Encrypted: i=1; AJvYcCUHic3hzqY0j79e2vy9OpcqiBdTdwDiFCcS6oosp1wu07ZNEPgHqZarjti7D9UVM0mh16e3OcXjcS+JTHwS@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe18HjSohE+ciWBqzNci0jy+QWDfC1VgHmK0V36jLucOawbboC
	3tzk38ph10TvROqQhN+0+3A/shLTYqZfJJpzqfQXWW6V5FSGBwOQjXiBaN64yobMVsg=
X-Gm-Gg: ASbGnct/uzlN02CK92feDrOfplxWIwNzinzuHYM1oLhtfVgF4GjY9rcO9zrvgMt81ME
	syjwuG++SqML/JJMljtEf/6gO+ghgYuD20cE8v+fh1e7DgnYwN/hGy0o/AgpPxtXjdHzh/jVKde
	duWN+JbpJak5fs6nUbcDL2JRtExXt1SN9ZrmARVQWkQ7BwFX2U749wb0xH0PZresLoR8Lz5x8CP
	DFp4bzmGt571qmHNGzH4UWVFl8w6oj/xeNeMN3XMCGa+xyEOEHzp9cYGq6lDQNjx1ow/5LtijW+
	XEkGV8u90nvlq2xCw5lmSsFece3IQN9PAh5BcUgUWwC4+gwC45H0OvQf840rpldw0smTbYWE8+E
	sXVwGFhxfxCwgDCe9Wm8L6xDmcrlpe7z6Ucq5Im6NP9UZtIGf4eTM0L4b87Wj3pJ11C3Vszsu4E
	4sColZNYCZ8dUCXM5tSw8=
X-Google-Smtp-Source: AGHT+IH66uhKvXnvTehKe3lInuC7qmM/YcfilA/g+9CQ8oNy3NiDtUo8BeUgAB3WyYNGUPEby1HO9Q==
X-Received: by 2002:a05:600c:8b16:b0:46e:4004:a296 with SMTP id 5b1f17b1804b1-46fa9a965a9mr35155715e9.9.1759947197837;
        Wed, 08 Oct 2025 11:13:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b264:afbc:dee:3d? ([2a01:e0a:3d9:2080:b264:afbc:dee:3d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8f0853sm31405791f8f.50.2025.10.08.11.13.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 11:13:17 -0700 (PDT)
Message-ID: <45f68b22-4514-4ddf-95e7-e00f45561307@linaro.org>
Date: Wed, 8 Oct 2025 20:13:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 03/25] media: meson-g2d: Drop unneeded v4l2_m2m_get_vq()
 NULL check
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
 <20251008175052.19925-4-laurent.pinchart@ideasonboard.com>
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
In-Reply-To: <20251008175052.19925-4-laurent.pinchart@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_111320_511683_92B1E32F 
X-CRM114-Status: GOOD (  14.29  )
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

On 10/8/25 19:50, Laurent Pinchart wrote:
> The v4l2_m2m_get_vq() function never returns NULL. The check was
> probably intended to catch invalid format types, but that's not needed
> as the V4L2 core picks the appropriate VIDIOC_G_FMT ioctl handler based
> on the format type, so the type can't be incorrect. Drop the unneeded
> return value check and, as the return value is not used for other
> purposes and the function has no side effect, the function call as well.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   drivers/media/platform/amlogic/meson-ge2d/ge2d.c | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/media/platform/amlogic/meson-ge2d/ge2d.c b/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
> index 0c004bb8ba05..a9323b383547 100644
> --- a/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
> +++ b/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
> @@ -627,13 +627,8 @@ static int vidioc_s_fmt_cap(struct file *file, void *priv, struct v4l2_format *f
>   static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
>   {
>   	struct ge2d_ctx *ctx = priv;
> -	struct vb2_queue *vq;
>   	struct ge2d_frame *frm;
>   
> -	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> -	if (!vq)
> -		return -EINVAL;
> -
>   	frm = get_frame(ctx, f->type);
>   
>   	f->fmt.pix = frm->pix_fmt;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
