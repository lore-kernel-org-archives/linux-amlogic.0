Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1847C021B5
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Feb 2025 08:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aaNvhGOJRVKbW6cVyfC8z49/0zpuWovzel2SrrmTiSc=; b=xJYeJGORPOI2mM91FSu9nq+DmE
	GCAOGQgG6iz2TBUpEkxBv5kF/O7StjJUElSfr639EpEUDAk4eLGJnwId6UM4GTsXsc//MvH7RzUlE
	9EwQGhAAbScFWN6ijrznYTzEKLFyEUM5U/NdsSaxWUNPcX+M+U4N6ibQ3Xu58noiaUg/lPTneQzKZ
	UHf7I+Y0R7jxm7yYRgCdXiqZFLD/PbZ8m6IHHKEcvPh9CPiRp2UqLQGSQAbpLGipKy9yO4bLNAIuI
	exdzQzp94OVdQKbGHK+Quqgyx0Mztq6L7ekHkqXCMf8AoOhct7IYdIweCW4cjKnCGLmXKN+LXcYJk
	4mKFxnhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUAG-0000000ClXp-1jO3;
	Mon, 24 Feb 2025 08:50:12 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmTzW-0000000CjDw-157R
	for linux-amlogic@lists.infradead.org;
	Mon, 24 Feb 2025 08:39:08 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4399ee18a57so23588875e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 24 Feb 2025 00:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740386344; x=1740991144; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sK3C+y9SW9Coh39Uk8y+GEOLM7p3ebzwSbAot9WE95s=;
        b=lPp0hkFikX2Ve+Y2RK68AkhTc+38kwNWek0WRO9cW4mI6RzWTTo0nzE7boocRtqjdb
         YUUyeMleB8fngY804Dnso0uGSHVvvgg2J7IZOjKaQQk0/YuVUGnaGWoCYbWrrM8FYkrX
         g0ZoXhZmbEOc4uQg9yK6tCHLKXTZpOqSZ8HZXqaVxQWtBY5PmT2k6tvozI6AxZil+nlf
         +29Iby4xqJzKcgziCuXplJC5j1jhIARBbzOFuebzuPE2bWDRA9JvjI6ISux1wiaXfJmE
         39zbo4YJOhYwBAPoBms9owJCuY8NWXIX04OhVs3+Ghzkq+TxhCGWwl9M5rcboV0UXQBN
         C4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740386344; x=1740991144;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sK3C+y9SW9Coh39Uk8y+GEOLM7p3ebzwSbAot9WE95s=;
        b=MaFZ0pGlLYKxNs2gZ0D7MVYHh1ePxZy6BD4nrmF/QE2jzIqJLD5aUUtVeZtSQiyhWW
         S5gFWaPlJYICX3yt3uwnFa50ICpi27+pKPiwCTLWrm7iwMvTukbXbaG4C+9VjqK4kF+W
         WYrNvIhWHbxCJfeLkoBOF9uD/cX3K78ArLGW8F+ieDv4Swe0O7oUrEc1dPeyeo50TMcE
         J43m+EwRQbsVOqjW1xVESMHSaJIcKjM0scNnoKRpEO3D/+15vvGCieFU9J5lS7vlvAh8
         RzuK7Ld2ix8g1eKCRonq4FxDYXFLYDehUwhEjyf1lT7NVLNzDIjOw95LLvT99Bxsh6rr
         lGXw==
X-Forwarded-Encrypted: i=1; AJvYcCWE+x1ildSaGrufonk5ESRf8jYcglctGzYfZzwHO1bScItzplFZPqRdNr2AQ+IYr34RLp1cfUpxbBhqIQK/@lists.infradead.org
X-Gm-Message-State: AOJu0YzvKTmbiBPsI2RFjVbLoQXNJ/hBwSHMbExNNezi3MDeoVCTsM5A
	K3VJzqL1GSIYG4zlFltv3nMg5AcOzGJJvcg5wYLXB1xiktUEnr8b6SzLiag4Jys=
X-Gm-Gg: ASbGncvcltPPdd/QxB1vUd4o4A0Ae0rjQGP4Q1Bh4pNOkow8gU8p8PNh4WWSiNI9VHx
	njdFFWq7eEDSVhGh1F2NhhuEpClH6BWW6er20dVp8Dsw/iKzPRo3k0SnxKZQ7AoJrGWiNy0G6gw
	+LfVR98ZnwqXK567bHb24P9boOsUpUfyqrhOrcyVCMd2wJ7wNU+0Hid1ftSBYg1JN7p5IE/ie22
	cFQXVwPeaUEvsnIfJ+z6Lfwq1FTPOMOM8W3ULcoHcdK5CY3J9wnAkkeoUVLOc95YeVbcykyOzWw
	KsfNuDDUN8leWvpyKd/eIJ4/a0d5G+O8V9W+5Ep00pyBGT49cY8M6PKsTpEyKamPIkH9XeWrxLv
	+xQ8=
X-Google-Smtp-Source: AGHT+IEEJX6T6GgItatrLUOO4eq1TE6WCfNa/DqbWsLOIOCWLzZKyFG0bwOQ4opt5Ug5hrQOAM7F1w==
X-Received: by 2002:a05:600c:54ea:b0:439:871d:d4c0 with SMTP id 5b1f17b1804b1-439a2eb09f6mr130885245e9.3.1740386344324;
        Mon, 24 Feb 2025 00:39:04 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:825b:5392:ef70:cc0b? ([2a01:e0a:982:cbb0:825b:5392:ef70:cc0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b02ce4e9sm100644875e9.4.2025.02.24.00.39.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 00:39:03 -0800 (PST)
Message-ID: <92321fed-28b3-454e-b187-7ecfe4ce27ae@linaro.org>
Date: Mon, 24 Feb 2025 09:39:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/2] drm/meson: vclk: revert and re-fix vclk calculations
To: Christian Hewitt <christianshewitt@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250110074458.3624094-1-christianshewitt@gmail.com>
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
In-Reply-To: <20250110074458.3624094-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_003906_383459_F8E81AC3 
X-CRM114-Status: GOOD (  12.30  )
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

On 10/01/2025 08:44, Christian Hewitt wrote:
> Patch 1 reverts a previous fix for loss of HDMI sync when playing YUV420
> @ 59.94 media. The patch does resolve a calculation issue. It also makes
> all fractional rates invalid which is a bigger problem.
> 
> Patch 2 provides a proper fix after I figured out the actual root cause
> of the original problem. This time the maths checks out.
> 
> Apologies to the stable team as the original patch has been applied to
> a wide range of older and LTS kernels (as far as 5.10). Please let me
> know if combining the two patches into a single 'fix the previous fix'
> patch would be preferred?
> 
> Christian
> 
> Christian Hewitt (2):
>    Revert "drm/meson: vclk: fix calculation of 59.94 fractional rates"
>    drm/meson: vclk: fix precision in vclk calculations
> 
>   drivers/gpu/drm/meson/meson_encoder_hdmi.c | 42 +++++++++++-----------
>   drivers/gpu/drm/meson/meson_vclk.c         |  7 ++--
>   2 files changed, 25 insertions(+), 24 deletions(-)
> 

LGTM

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
