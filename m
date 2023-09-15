Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0F2EE6423
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Sep 2023 06:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AW4rOmXj5f13WdIElrgwNNrJJofpqS25D6AsEucj2wM=; b=HKPK4ziWB6k8ljYpQ/a5lhVByJ
	eUbA6+X+vKSzrJtCwwXNhQKLMvN8Ks/Ce/QcZn19AHv31+65qZDsExB0/ek08o8z72IrAVLBEl9Ti
	QiDPthKdvp7s76wjYLLK0iLdpWFPtqCC+v3mkAEZnbMimlwTwHhOob/PsTFAWj9AWM1h+cuczlNIm
	rpHfzy9LQGndujU/mZL9+o0AmUkONMJM2cbaSmFbwS+IoNhfnMd2fYR17Z3DuY+v7kqJkz6JOT/tv
	RgElhbprk6N+fp7RZYHbaV3mtCUtvPysPaeSZvL6UNe8pD2n1Fl4cdQrPT16oMiFXtxDq6IPE2Ye8
	zX+j6THA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh2nE-009xh0-25;
	Fri, 15 Sep 2023 06:59:08 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh2nB-009xfR-2T
	for linux-amlogic@lists.infradead.org;
	Fri, 15 Sep 2023 06:59:07 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3ff7d73a6feso20328855e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 14 Sep 2023 23:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694761143; x=1695365943; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mt0/vU7tS/I4WdeJ1B6LJJREbXiomv2o0TbUICA5gLw=;
        b=Y3pjyympOfIblkJbt6Da1XW7SVN9FcMVoRsZfoSp/nu2WmjIQTMlbSr6TmhVD+jVeN
         IzqsTg/OPRa7sHJKoF6G7K1iKYBMZalrMYxcQUck3kUH40AZJEzrkfzXZ/vlICZTxvao
         JHjDoxZNybe6RbT8Ti4Fabxofa/drvasxKL4QMCP7V2lJ49Rs62QUYRUmXB9pKkUZ5QM
         14w8KiM4a4J0cAHnePVFFZqUHIeATidHlk0SILWxIeg6OjiNosoOr8ONp6I3NXp+MD3c
         qIH85u7DFt2jH1xOC/vgy5L3eVFaCymwBuOEoBN7RvlNyKiv2P3dZBkaQBO6fjxX7AyA
         WheQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694761143; x=1695365943;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mt0/vU7tS/I4WdeJ1B6LJJREbXiomv2o0TbUICA5gLw=;
        b=KLMknY+gwGvB7ialpDDxC6Hq9gv7zOOcFfd1YJPWRupCWKUy4x2Mjhr1nS73JNrOdp
         KByhgc5zxZnw3Z0qeYtnsHr/b93yfgFMiVcS8Jmyf7TllbzAytN0DYzKXBPzaQHXKvhq
         tYdVAqguoYPKrLUYyuzDu0rDWitHZegHOI7sQowlaf5vn/LkzS5dOLKjQO/0T0u9H+CF
         RR+lF38a//QHjofpu21LgboW5uzWwuZsKOw+0KMAASqgx5hWf5nnO7/x0nvm1TUBjtkI
         u4csb3/dGx2Mq0KjU6He1N5abiVPL73HJYeIfAmdsmXJsbRkMTtWJrGqR2xp8Cj3oQN4
         zG2A==
X-Gm-Message-State: AOJu0YwBX4jUAg395/OqSO8fPA32ymKcwMu9V/ZJwDMSxLddmuubvkID
	GG0BQZX1OtzUK0/JQHnRztTF+w==
X-Google-Smtp-Source: AGHT+IE4jAQc/f0JC4LzXetxAe50ENFFr3PqEcIIEvx8Zg3C7YQLWDUFz7j8SYv1FN1qOLzLY1IAQQ==
X-Received: by 2002:a7b:c8d0:0:b0:3fe:173e:4a34 with SMTP id f16-20020a7bc8d0000000b003fe173e4a34mr674179wml.40.1694761143262;
        Thu, 14 Sep 2023 23:59:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:990a:74e6:266e:2294? ([2a01:e0a:982:cbb0:990a:74e6:266e:2294])
        by smtp.gmail.com with ESMTPSA id x13-20020a05600c21cd00b00402ff8d6086sm3779272wmj.18.2023.09.14.23.59.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Sep 2023 23:59:02 -0700 (PDT)
Message-ID: <a4b4432b-fdde-4922-8d95-3697807eefdb@linaro.org>
Date: Fri, 15 Sep 2023 08:59:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/meson: fix memory leak on ->hpd_notify callback
Content-Language: en-US, fr
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, Sam Ravnborg
 <sam@ravnborg.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
References: <20230914131015.2472029-1-jani.nikula@intel.com>
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
In-Reply-To: <20230914131015.2472029-1-jani.nikula@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_235905_805485_E407CD31 
X-CRM114-Status: GOOD (  11.82  )
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

On 14/09/2023 15:10, Jani Nikula wrote:
> The EDID returned by drm_bridge_get_edid() needs to be freed.
> 
> Fixes: 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR")
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: <stable@vger.kernel.org> # v5.17+
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> ---
> 
> UNTESTED
> ---
>   drivers/gpu/drm/meson/meson_encoder_hdmi.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> index 9913971fa5d2..25ea76558690 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> @@ -334,6 +334,8 @@ static void meson_encoder_hdmi_hpd_notify(struct drm_bridge *bridge,
>   			return;
>   
>   		cec_notifier_set_phys_addr_from_edid(encoder_hdmi->cec_notifier, edid);
> +
> +		kfree(edid);
>   	} else
>   		cec_notifier_phys_addr_invalidate(encoder_hdmi->cec_notifier);
>   }

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
