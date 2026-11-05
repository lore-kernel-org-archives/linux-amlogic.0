Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60A2606D832
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Nov 2026 15:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qzIjdOYh;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=y9zUq+Fm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Vl7EjAN7YBIgT0m9/h3KuKNGxE7R5BJPvCmQ5qR9jjo=; b=qzIjdOYhugBKqZDK7YMAg6aLE9
	PzIWU+JfAQiUXogbJmpRXIvIJYLuOl91pcOxdfBZMPp8NPXIhfr9IjHlfs1Eo21Aw9yRORrEe72Bh
	hAvBn1nMAS3Ls8V76HMJ/T172OzqkZ1tnMmhmVoQBZozt52LkEYeq/Sahb9b5dizGwuEukBo1pa4V
	DC2M9qN7QC++tNC6shaHIzfGhc0z8ozYgaguWZ63/njSqxZxRuRlIpqk5OWxiA0NUZuKLboRyl4Sr
	j8tHRAkQ5Z0woqQTShn1tVn+5bANLtbPhfwqF8vU1kSw3w+NDhUAyR6jKHl6XuaSn5L+dKVo2ex3n
	yAcojxEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzgU-00000009RUc-3f07;
	Thu, 05 Nov 2026 15:47:27 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzgQ-00000009RRW-2Km1
	for linux-amlogic@lists.infradead.org;
	Thu, 05 Nov 2026 15:47:25 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso580970f8f.1
        for <linux-amlogic@lists.infradead.org>; Thu, 05 Nov 2026 07:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793893639; x=1794498439; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jEFthDeOw857Vl1Txv+y9bOC3ebCcB7q3/QmLSqJflg=;
        b=y9zUq+FmL/IL0xdUPKTj9cbeyuurQxfGMFYaKgkF5y0aTLprn53l3aFRF/n/GU3HFX
         YolSz7G0pRKeH8uzhYdHPynI8m5RNARByMznyJzqy+NfegvgMlvv8RFlg2WciMij2DaD
         FzCqtQ/QzcCPR1SlW2tG4Uk1WhDq0kLB957GEECzyxiU2ln0/hgHi6t6r2H73IndDjxi
         uA3N9H30gkV5RNcCzkv4nFM9W209oFI0vwzR965bFX8QTA+K5e3evspNcm3WPRNIkJgk
         4+AzRKb5Wj5dPDX3OEYK4amDDf/j/Z12YPpLk0lSq6vAIlfvzreQkQz8rGzdYs+0gkN5
         Tb/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793893639; x=1794498439;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jEFthDeOw857Vl1Txv+y9bOC3ebCcB7q3/QmLSqJflg=;
        b=j/RuJ456F3dLBBlHTjDJypg7MtoTNAPPob4E6rS0DD4DqPTKjfGz0m62bcVYte+OjA
         MtWk3qcpkadOUcDoA9mCnPWAcILGtNegimB7VCj0qNcAF1KYc2WSpYgxUClR/5zgwJRs
         y4iEDLNRqf5Zff5S9/P8ctq2Nvuj7XEfrsTGcNSGv94FnNjlSGQsYuLqYt179KPSb2kU
         ZO2XpygE0moJsPDkEaF4XBrY4agzRbmGbCbpTCv6buOCNxtJrgadxtuposQxClGde+Ac
         uGPWjV5BsUVPewZZsmmMVnzS07HuOXBtSfDkxrgU+ETX2te+ql3A45b9syymMVyU2R6C
         kbhg==
X-Forwarded-Encrypted: i=1; AKwUvBzYMrjp65kyj9eVpkdd+rqeakTBMOSpyKR8JTLAfKNJTJBTktuKKYw3Kp10KYzyx3iMEFL2bYFITDRMivzp@lists.infradead.org
X-Gm-Message-State: APuU4Z9wBz60EkMtbDi1959VothReLGZ16C9eBTNFYwLiTWl1fStyZiA
	Jr6zab9SJd4rlx5nwTS/vT7+4GQWc5LsCX3W7VwwFZlQNgJIPkIB+nxEGp/o776TTis=
X-Gm-Gg: AYBFou27o5Qymz9aGfFCwR6ZZKgeEKULL5uYEwe5dXeYm+2sdUJ4CaFPiRskGFRQBfw
	YttE3EJr00r2APltQ2yyDs4niCqDKIWzHCD405RP7PKrlW/weYlyBBnUpXQV7lRw5h0QXqodT3p
	HbyM/dh0wnJhyndpqKe/TZMXlc1xxH456pPsU1DTpN41RKq9eXexr6qomdcf3cQ+1KUM23dh4D3
	jHfoy0UADXCnrk3JMOwqhgH98o3g6ngWkGuZKbz4wMj73XLQQ2tSVe4c0pahT+QxFVUuJU8a234
	5iPLlDQGGQ0VlOdl8WhPaSVQnXNwqfAmAo23EWMtE6BDO9wKAT6PhDF9B5jAPCOOF1pWsoHZD4s
	9DgfnbcVd4LWpEfzB2i8YW+Bd3lLCJAsYaqJSQcQ1KBgR1t5N9+6kEQCv6lZMhSckwdGE/agtIQ
	2V/4JME1PUWxpi8g4ziPWe3/LOkgNNrpw0A1r5LZFdZ5zKC81GThz9fHxZo0AqtzQsLquxaOael
	5VF6ArgpDyYMhbHJzZmqNAla32jIiltZwyO1i0UmqO3B10wlpLj8oy5Mc50urPdMeXPrFBL4nox
	paRcEbdvq1pEGj2/kdLvpt71FbmK7sQzTIucQhgL5jbWZUd5ykPhH0dLMSoIpSqugXyd1OgcmTG
	tci5Y8sJI
X-Received: by 2002:a05:6000:41d1:b0:48d:f4ea:49c9 with SMTP id ffacd0b85a97d-48e6e5196ffmr44933021f8f.54.1793893638733;
        Thu, 05 Nov 2026 07:47:18 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9899:e54b:a2f2:3695? ([2a01:e0a:106d:1080:9899:e54b:a2f2:3695])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea181085sm10757871f8f.1.2026.11.05.07.47.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 07:47:18 -0800 (PST)
Message-ID: <62271e1c-7a4d-4fe2-a68e-41066e7849af@linaro.org>
Date: Thu, 5 Nov 2026 16:47:17 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/meson: plane: add pixel blend mode property
To: Jose Nieto <jnieto.alaber@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261104155119.284708-1-jnieto.alaber@gmail.com>
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
In-Reply-To: <20261104155119.284708-1-jnieto.alaber@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_074722_702679_72928C30 
X-CRM114-Status: GOOD (  17.12  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/4/26 16:51, Jose Nieto wrote:
> The primary plane exposes ARGB8888, a format with alpha, but never set up
> the pixel blend mode property. This makes the DRM core warn at boot:
> 
>    [PLANE:...:meson_primary_plane] pixel format with alpha exposed but
>    blend mode not setup. Please fix.
> 
> Advertise PIXEL_NONE and COVERAGE and derive OSD_REPLACE_EN from the
> requested blend mode. Formats without alpha (e.g. XRGB8888) keep the
> previous opaque behaviour.
> 
> Signed-off-by: Jose Nieto <jnieto.alaber@gmail.com>
> ---
>   drivers/gpu/drm/meson/meson_plane.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
> index cf8c90158fcf..115849a0b0c8 100644
> --- a/drivers/gpu/drm/meson/meson_plane.c
> +++ b/drivers/gpu/drm/meson/meson_plane.c
> @@ -233,18 +233,13 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
>   		}
>   	}
>   
> -	switch (fb->format->format) {
> -	case DRM_FORMAT_XRGB8888:
> -	case DRM_FORMAT_XBGR8888:
> -		/* For XRGB, replace the pixel's alpha by 0xFF */
> +	if (!fb->format->has_alpha ||
> +	    new_state->pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE)
> +		/* Ignore the pixel's alpha */
>   		priv->viu.osd1_ctrl_stat2 |= OSD_REPLACE_EN;
> -		break;
> -	case DRM_FORMAT_ARGB8888:
> -	case DRM_FORMAT_ABGR8888:
> -		/* For ARGB, use the pixel's alpha */
> +	else
> +		/* Use the pixel's alpha */
>   		priv->viu.osd1_ctrl_stat2 &= ~OSD_REPLACE_EN;
> -		break;
> -	}
>   
>   	/* Default scaler parameters */
>   	vsc_bot_rcv_num = 0;
> @@ -536,6 +531,7 @@ int meson_plane_create(struct meson_drm *priv)
>   	struct drm_plane *plane;
>   	const uint64_t *format_modifiers = format_modifiers_default;
>   	int ret;
> +	unsigned int blend_modes = BIT(DRM_MODE_BLEND_PIXEL_NONE) | BIT(DRM_MODE_BLEND_COVERAGE);
>   
>   	meson_plane = devm_kzalloc(priv->drm->dev, sizeof(*meson_plane),
>   				   GFP_KERNEL);
> @@ -566,6 +562,10 @@ int meson_plane_create(struct meson_drm *priv)
>   	/* For now, OSD Primary plane is always on the front */
>   	drm_plane_create_zpos_immutable_property(plane, 1);
>   
> +	ret = drm_plane_create_blend_mode_property(plane, blend_modes);
> +	if (ret)
> +		return ret;
> +
>   	priv->primary_plane = plane;
>   
>   	return 0;

Sounds good, thanks !


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
