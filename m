Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D109CF31B4
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Oct 2024 11:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eeXntvEts7Kh+cDqCXLcvjUXgdSGItG5UX/j0qGm8/c=; b=2rlQjjBqlAM3QhyxYIWXFprqu6
	NNC8tNdNTB8J+Bovs/edCnHCCbkxqPb6hXdWoNrQ1M5RHUEj8OpI0GAzy/b0/PzIDjyomawkqp+kp
	xWtgHDgzT15StHH/iPwQ5kAjAwhm+Ld2/M02xA9VjkPYcWdRg6xdiPR3+FzcpDFKX9P9vzezjbWpT
	6w70/KNXhHqygd863AvIEnnz85Cw/Fd7lJI2Ea6NsRfv0FkX1MNIoVeS0Km62RDMmhxENx0wJm3hy
	cfGNikbvBCCYhCjgxyOVZqRrfzzUaMGE3fszizBRmUt4tTkGus07kI1xljTs+kp6DVhRLFTsOZS8T
	t4gP5kuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svxPN-00000005dBP-3NcP;
	Wed, 02 Oct 2024 11:20:41 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svxO7-00000005cyK-2B12
	for linux-amlogic@lists.infradead.org;
	Wed, 02 Oct 2024 11:19:24 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-42cb806623eso51729995e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 02 Oct 2024 04:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727867962; x=1728472762; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3i54V2W+uXkFgB9Ou9jQMsgfLBOlkoO/smYJXTkkpl4=;
        b=m7NeGu30nAd1hDuUcsnDeAWWfRpDkbP0X0JMcUEpH70uSxUCSIVchgPBMPalRUTeKF
         UhWDF2OSEynwnYSWb66BRO4l7cn0ChxlCn9FYL+VjN4e+UBTBTndItLWCM9YEIIlyvtm
         VIZhFx+dcvkfJDrtKAfhJU43NFarrz+CfDSLZnC2JMIVRoCKzgSuMjlxeRoGh2wOYDMs
         kogyAx9X9EAF1bj3wFiwp+oamSpMT325wmIZpMWUnSxPl/AD52SFC63tmS+92282Qc4q
         ZCto/uua0L4sgDXlDE3aQX5/2hzd6NPsAVnadBisMxOOoHqOacVpeL2wn1LMrdQmTQHD
         V/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727867962; x=1728472762;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3i54V2W+uXkFgB9Ou9jQMsgfLBOlkoO/smYJXTkkpl4=;
        b=hepVyVJT/TReAAL0kBKLsn3XG3GPzxAdMy0H6AH3+eed9DhpI7QKPPM0844Daf2fOh
         QpN9kq5AJ92yVRG5HRRzzp3ioavl0aSudAjan82KQPMgIiwoS2hmPO33QEAFo7O/Ggxb
         /F3ppL1GdIxExIMchHCXbZkYZp6Wh6HGxexxH25rnGbKZm6E0LJUW4SoGOP1vqmtg4s7
         Q5qfYb9OZHKuzw52MluEjEFXx/VPQEKnON1sgtra0p5o7yoNKrFCoi2YtCGVDkZA2pxF
         74JQ298sLDIfBzCNBI5BgSavW0a9k29rbO2rN01FBoRzhOmxkV2xZsPKFWzaWxWPT1zV
         C9xA==
X-Forwarded-Encrypted: i=1; AJvYcCUs9XF/3Lucel5Xd47sOqjZTQSlx6wlkIqJkpDRaw/8+nBRKqThAYbPUkEdwFptDBchJfk71l3TQHUZlVGX@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2Or8SPLn2TXzKv5JldWqVHT6Xu/N5Y4GPnfcU7hR35iu9/LVF
	M9TDiOhhL5coB9pJ1Sgfgqt6F71xY4MBAIahv3Dy0TpxU8mDR6PIniGTCtqGmhk=
X-Google-Smtp-Source: AGHT+IFwLX5vDjib7l0jy9dr5jnloJXwSQLCI8cwlDoF7zBepF5qscW8k9L2WjCUqPM3IGJNEoAqmg==
X-Received: by 2002:a05:600c:5123:b0:42c:b22e:fc23 with SMTP id 5b1f17b1804b1-42f777c1a4emr17884125e9.15.1727867961754;
        Wed, 02 Oct 2024 04:19:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ce64:813c:ca8:36b5? ([2a01:e0a:982:cbb0:ce64:813c:ca8:36b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cfe30a3b4sm1134982f8f.13.2024.10.02.04.19.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2024 04:19:21 -0700 (PDT)
Message-ID: <7a12280a-a7a8-4b5a-b085-90b7fe1728fe@linaro.org>
Date: Wed, 2 Oct 2024 13:19:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [RFC PATCH 1/1] drm/meson: Support drm_panic
To: Maxime Ripard <mripard@kernel.org>, Jocelyn Falempe <jfalempe@redhat.com>
Cc: Yao Zi <ziyao@disroot.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241001210403.43535-2-ziyao@disroot.org>
 <20241001210403.43535-3-ziyao@disroot.org>
 <28bd30a6-127d-48f0-8e32-703ebd8f69b6@linaro.org>
 <20241002-vengeful-vivacious-salamander-cdc9f7@houat>
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
In-Reply-To: <20241002-vengeful-vivacious-salamander-cdc9f7@houat>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_041923_607431_372A7E7F 
X-CRM114-Status: GOOD (  18.19  )
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

On 02/10/2024 13:02, Maxime Ripard wrote:
> + Jocelyn
> 
> On Wed, Oct 02, 2024 at 09:59:57AM GMT, Neil Armstrong wrote:
>>> diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
>>> index b43ac61201f3..b2def784c00d 100644
>>> --- a/drivers/gpu/drm/meson/meson_plane.c
>>> +++ b/drivers/gpu/drm/meson/meson_plane.c
>>> @@ -20,6 +20,8 @@
>>>    #include <drm/drm_framebuffer.h>
>>>    #include <drm/drm_gem_atomic_helper.h>
>>>    #include <drm/drm_gem_dma_helper.h>
>>> +#include <drm/drm_gem_framebuffer_helper.h>
>>> +#include <drm/drm_panic.h>
>>>    #include "meson_plane.h"
>>>    #include "meson_registers.h"
>>> @@ -419,10 +421,49 @@ static void meson_plane_atomic_disable(struct drm_plane *plane,
>>>    	priv->viu.osd1_enabled = false;
>>>    }
>>> +static int meson_plane_get_scanout_buffer(struct drm_plane *plane,
>>> +					  struct drm_scanout_buffer *sb)
>>> +{
>>> +	struct meson_plane *meson_plane = to_meson_plane(plane);
>>> +	struct meson_drm *priv = meson_plane->priv;
>>> +	struct drm_framebuffer *fb;
>>> +
>>> +	if (!meson_plane->enabled)
>>> +		return -ENODEV;
>>> +
>>> +	if (priv->viu.osd1_afbcd) {
>>> +		if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXM)) {
>>
>> This should be meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)
>>
>> You should call:
>>
>> 			if (priv->afbcd.ops) {
>> 				priv->afbcd.ops->reset(priv);
>> 				priv->afbcd.ops->disable(priv);
>> 			}
> 
> I'm not sure it's a good idea. This code is run in the panic path, and
> it comes with strict requirements that these functions don't have.
> 
> It'll be incredibly easy to add a sleeping call or a lock in there.
> 
> On a more fundamental level, I'm not sure we should be disableing AFBC
> at all. Do we even have the guarantee that the buffer is large enough to
> hold XRGB8888 pixels?

Yes it does, "compressed" is in he way pixels are ordered in memory, meaning
it will be faster to scanout when the image is simple, but with a fully random
image the buffer will be larger.

But per my comment, AFBC is really only used on Android producst since it requires
DRM_FORMAT_XBGR8888, so the best is to bail out when AFBC is enabled.

Neil

> 
> Maxime


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
