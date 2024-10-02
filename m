Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA2FCF31A1
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Oct 2024 08:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KFCw6MnMCELCT7nZprBwtnWMoNG7wO6fGHoEn0D6LZc=; b=hLdVjCHSwZZgfJAAj+wgpLn4tD
	tkyXoVU+Yh8lDH3KQmvbqCn/7XwV4iXHVuY0foS+6N2qvQ9BA2mI7nybZYWs/5vMDIrCZXf3a2lgX
	0iEZjf5ZQfoTmdIsJd8Yh8yMbVPmJOKbQZw2l0+6nUyXaY8OZrGZ9NW5CVsD8u+MOrFLZ3nbU4man
	R/2eM7WzF7+GNy0a8qbGOLzsIeHbb+UKE7EZZRzqQzT/8bnd33n/CHdRVUEoYbE/7l0nZZLLZ3OtS
	2i+AdBmVz7qJ+cNftZPL1nzc0u4PN0LxfeQDkSMEQDi0N5ierEYbGAD2Kb8W45fRoMSmW35a7aeuI
	GgUDc5Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svuJX-000000056Wc-0XTk;
	Wed, 02 Oct 2024 08:02:27 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svuHB-0000000568f-1caf
	for linux-amlogic@lists.infradead.org;
	Wed, 02 Oct 2024 08:00:03 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-42e7b7bef42so52227095e9.3
        for <linux-amlogic@lists.infradead.org>; Wed, 02 Oct 2024 01:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727855999; x=1728460799; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xk36fzw0YT52nfRYTy2hTk/tDp/muE/KVbNF37jTxxU=;
        b=GVaoYMjrwhV3vkps1Uq95OCxmVKOrlL/3YKSeKSIh17vktAHKooPgC9mP0Qo7MgEWg
         +K7tCEmVcccASLaJRb7z1WsbizjBCIFUBo0pbXBpGnfyHRHXP/sssB6iSqr7djKgTju1
         TAQegWU3rpXDVpqtwFrSxX/AtPyjOfTP9rgfu2N2OOWAar+kP8hIERLOIs4emtSKUgFm
         uEO2Wkd4EWCgf3ovoTsDmSWdnkiMSHmiSr6w4JwamJB3flaaD4A+d1i9c9ro1vyCNSaC
         HrKoWfa9y5HLQqlta6X8qeMUW3dC2gR7Chaj+XPzY6BPstHvnmtzxZoOKgpXm22W2yZb
         rC9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727855999; x=1728460799;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xk36fzw0YT52nfRYTy2hTk/tDp/muE/KVbNF37jTxxU=;
        b=WzenXVOEhZkDJiZTtQY/a0hk8JK8cj/QhJ3g9/XaslJflqUpneciQg70eVGEUeyzF7
         0R3t/6f+GiMGJXoEnm/idEURHuimkGY4/yS/buU/BbTxJeRLtxXZvi6LcXopiBE+kISs
         cTdYl1GGYt7eWW/eJuFZOda+AdQiIoJe+6QK+xKbouWcGZogO3dkaywjIpWV456N3nwS
         e3QKU3VIGMvNScw7bL3dNlyUe39QRwFXvL96dT2d/5Z7yFuza7JQ77UXwjOUuXAz9m2N
         L3HgVCDkxfHuWj8OiNOiaU7zaTWIAiw3T38dn44rXZbNU4S3/MuVKJO74nT5o9E4pUzt
         g7Ww==
X-Forwarded-Encrypted: i=1; AJvYcCX54FqyPrGr3Mz2tk9tEDzhNYCeuA+79hKZUUVOlsLM6d7ZUOMK130dRcsRegzQGO9SS3lmJptTzGQRZ3g3@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/WFK//sfAiL1AYvAExWYvm3aPGUXadnZaTjiUdan69QDeoRJ2
	nBp7MGCJ/PoRSYvle1z1ic/szF0jVg5qHrXionVcOgwh9rpGgVmN3ID85VwrO8E=
X-Google-Smtp-Source: AGHT+IGKDKFtK+6fH5XIgbOvtCDoASExF6yro64LLD9/n6AiA+9+PdHbwnZGFcD5lVYNEj7sJ1M04Q==
X-Received: by 2002:a05:600c:1c04:b0:42b:a88f:f872 with SMTP id 5b1f17b1804b1-42f778f13d3mr16004595e9.32.1727855999245;
        Wed, 02 Oct 2024 00:59:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ce64:813c:ca8:36b5? ([2a01:e0a:982:cbb0:ce64:813c:ca8:36b5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f79db1de9sm11469325e9.5.2024.10.02.00.59.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2024 00:59:58 -0700 (PDT)
Message-ID: <28bd30a6-127d-48f0-8e32-703ebd8f69b6@linaro.org>
Date: Wed, 2 Oct 2024 09:59:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [RFC PATCH 1/1] drm/meson: Support drm_panic
To: Yao Zi <ziyao@disroot.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241001210403.43535-2-ziyao@disroot.org>
 <20241001210403.43535-3-ziyao@disroot.org>
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
In-Reply-To: <20241001210403.43535-3-ziyao@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_010001_477619_CFCB9F86 
X-CRM114-Status: GOOD (  24.42  )
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

Hi !

On 01/10/2024 23:04, Yao Zi wrote:
> This patch implements drm_plane_helper_funcs.get_scanout_buffer for
> primary plane, enabling meson-drm to work with drm_panic.
> 
> This implementation tries to use current framebuffer as scanout buffer.
> In case of AFBC enabled, we disable the decoder path and adjust OSD1
> parameters in get_scanout_buffer to make the buffer linear.
> 
> Tested on TTY and Wayland session (Sway).

Thanks for enabling this!

> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>   drivers/gpu/drm/meson/meson_plane.c | 47 +++++++++++++++++++++++++++--
>   1 file changed, 44 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
> index b43ac61201f3..b2def784c00d 100644
> --- a/drivers/gpu/drm/meson/meson_plane.c
> +++ b/drivers/gpu/drm/meson/meson_plane.c
> @@ -20,6 +20,8 @@
>   #include <drm/drm_framebuffer.h>
>   #include <drm/drm_gem_atomic_helper.h>
>   #include <drm/drm_gem_dma_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_panic.h>
>   
>   #include "meson_plane.h"
>   #include "meson_registers.h"
> @@ -419,10 +421,49 @@ static void meson_plane_atomic_disable(struct drm_plane *plane,
>   	priv->viu.osd1_enabled = false;
>   }
>   
> +static int meson_plane_get_scanout_buffer(struct drm_plane *plane,
> +					  struct drm_scanout_buffer *sb)
> +{
> +	struct meson_plane *meson_plane = to_meson_plane(plane);
> +	struct meson_drm *priv = meson_plane->priv;
> +	struct drm_framebuffer *fb;
> +
> +	if (!meson_plane->enabled)
> +		return -ENODEV;
> +
> +	if (priv->viu.osd1_afbcd) {
> +		if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXM)) {

This should be meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)

You should call:

			if (priv->afbcd.ops) {
				priv->afbcd.ops->reset(priv);
				priv->afbcd.ops->disable(priv);
			}

> +			writel_relaxed(0, priv->io_base +
> +					  _REG(VIU_OSD1_BLK1_CFG_W4));
> +			writel_relaxed(0, priv->io_base +
> +					  _REG(VIU_OSD1_BLK2_CFG_W4));
> +			writel_bits_relaxed(OSD_ENDIANNESS_LE, OSD_ENDIANNESS_LE,
> +					    priv->io_base +
> +					    _REG(VIU_OSD1_BLK0_CFG_W0));

This won't work, drop it, the canvas isn't correctly configured, you should instead call:
			meson_canvas_config(priv->canvas, priv->canvas_id_osd1,
					    priv->viu.osd1_addr,
					    priv->viu.osd1_stride,
					    priv->viu.osd1_height,
					    MESON_CANVAS_WRAP_NONE,
					    MESON_CANVAS_BLKMODE_LINEAR, 0);

> +			meson_viu_g12a_disable_osd1_afbc(priv);
> +		} else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {

And here meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXM)

> +			writel_bits_relaxed(OSD_DPATH_MALI_AFBCD, 0,
> +					    priv->io_base +
> +					    _REG(VIU_OSD1_CTRL_STAT2));

Ok, you should also call meson_canvas_config()

You should call:

			if (priv->afbcd.ops) {
				priv->afbcd.ops->reset(priv);
				priv->afbcd.ops->disable(priv);
			}

> +			meson_viu_gxm_disable_osd1_afbc(priv);
> +		}
> +	}

I thing the code should look like:

if (priv->viu.osd1_afbcd) {
	meson_canvas_config(priv->canvas, priv->canvas_id_osd1,
			    priv->viu.osd1_addr,
			    priv->viu.osd1_stride,
			    priv->viu.osd1_height,
			    MESON_CANVAS_WRAP_NONE,
			    MESON_CANVAS_BLKMODE_LINEAR, 0);

	if (priv->afbcd.ops) {
		priv->afbcd.ops->reset(priv);
		priv->afbcd.ops->disable(priv);
	}

	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
		writel_bits_relaxed(OSD_ENDIANNESS_LE, OSD_ENDIANNESS_LE,
				    priv->io_base +
				    _REG(VIU_OSD1_BLK0_CFG_W0));
		meson_viu_g12a_disable_osd1_afbc(priv);
	} else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXM)) {
		writel_bits_relaxed(OSD_DPATH_MALI_AFBCD, 0,
				    priv->io_base +
				    _REG(VIU_OSD1_CTRL_STAT2));
		meson_viu_gxm_disable_osd1_afbc(priv);
	}
}

AFBC is quite hard to test since it requires DRM_FORMAT_XBGR8888, but
I think sway should perhaps support it, Mesa should also support AFBC.

At some point I made some memory dumps of AFBC buffers, perhaps they could
be useful here.

Another way would be to simply ignore the AFBC case, and bail out since
it would be a very rare case.

> +
> +	fb = plane->state->fb;
> +	sb->format	= fb->format;
> +	sb->width	= fb->width;
> +	sb->height	= fb->height;
> +	sb->pitch[0]	= fb->pitches[0];
> +	drm_gem_fb_vmap(fb, sb->map, NULL);
> +
> +	return 0;
> +}
> +
>   static const struct drm_plane_helper_funcs meson_plane_helper_funcs = {
> -	.atomic_check	= meson_plane_atomic_check,
> -	.atomic_disable	= meson_plane_atomic_disable,
> -	.atomic_update	= meson_plane_atomic_update,
> +	.atomic_check		= meson_plane_atomic_check,
> +	.atomic_disable		= meson_plane_atomic_disable,
> +	.atomic_update		= meson_plane_atomic_update,
> +	.get_scanout_buffer	= meson_plane_get_scanout_buffer,
>   };
>   
>   static bool meson_plane_format_mod_supported(struct drm_plane *plane,

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
