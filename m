Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 412D4CD5BD1
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 May 2026 07:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NkVUsvK5mKvysq7+vu2b0D3TZF/CODXVFiIaSNrkpYs=; b=d2xpkHwFjZclv+f0NtQoyxqHjS
	sa7Nie6m3nwz+8FQMQERBA9lxG8IqkYTRObob6IvVLYFKnVmAaC5au0YIH2oSbRaOsmiB0/Ynoc6F
	E1Sy8w5X1cM+akXjdiUVzyIyoXGkSBGAoT5yoLszuAUKwN0i7KTgeFOyaA9kKUJxfkd0o7BEu9dUn
	feNTq9SOBm8ifDEc+jLxo0PLdhDnzhLjzMgNTgQHqmxg7VyQDeyNVWb+kdUkKpfCE9GGKaq1EDmTn
	gVVXraPSWKWLVX4IUZQhlvFPAoZAIeEXD8dF02o2ZuhRL1eNlC/XfOwNZMqbghC4BqKlyEjqzp/cB
	aqKMBEBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRm1l-00000001FGb-3vFJ;
	Tue, 26 May 2026 07:16:37 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRm1i-00000001FFN-46Yi
	for linux-amlogic@lists.infradead.org;
	Tue, 26 May 2026 07:16:36 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4903974854dso40387905e9.3
        for <linux-amlogic@lists.infradead.org>; Tue, 26 May 2026 00:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779779793; x=1780384593; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6qT/bMdEBMK/k6bRtXEjwywoU6w4KQoZt190nLYNxOs=;
        b=fVUj+TxNL58AxV8TgP3u/+3o0Kj3WqjV8Vt1DK2OpkR4+ZqHKxRp8j2+c2vqEb0HHn
         GtO/Q5qXrq8hrEfPNYH8gJZ0AwU9jg44J7FFbOGthb8eSbSiqxXSnzIKXxRij/RuW71g
         at6sKN5EFJufaZy4niK35UiAGYDjcuFFvS89+AgvPHgjv3iKuggUWCiY4PgSvKQiLDy+
         GNeEBB6JFO/DkatopTdKnVfu7a9bw4XEvwY4RqlhD/RfWtw8BAyoEkrxSWp/tBF7SuYB
         9bLnwFYJ06ikdIqJvpJOmB/VHz9QhwGtf5XcRjXpZNvmyA7XvnLn28M0l3f1UnKFq1fr
         33ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779779793; x=1780384593;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6qT/bMdEBMK/k6bRtXEjwywoU6w4KQoZt190nLYNxOs=;
        b=QHb8cYWM14PL01Vzbdt/Psnx1at9W+lafdVWq93PUYfvGgrxbCwjwBQ32c4ptFTXyC
         TKyYNDvU4iaZZtAm939WodLYWyKIfadqN4URi16VvrDZSqvTeIfRwIeMCQjAe10L6BFw
         XOYsu9uqmFjnWJv+Fe58lwr9sDEDjy14QBu5czoDvjqA3wxGdW0S/actfsFqJ5XSBiN+
         B9hCqyUT3zpVcTw2VCLmX2wVlBwGkeUKnvgT8lYZ54PJvIAoU21rq/+0TrJJFmZ6ck00
         7vhtjKk5COKQvvlPmP3Q9Sx/Gcant7VjNt9W71FSCPhsr801tZS2ZkKUgNF7NF9GEmr1
         wVqA==
X-Forwarded-Encrypted: i=1; AFNElJ8qK1xTwQilsT2mITPel4IGe3XdGyWB0R4PazfTnmEO2hwjnr2lwFO/s4g5jakrmLpfLcSh5Qr0dyZ7DGEj@lists.infradead.org
X-Gm-Message-State: AOJu0YzbY/YJTG7biCybMQ6TZpjfzsgNtHPnqpJ8fQTruQH6cZ/+a/dv
	ME8aNzxmn3vbve1QWnm5Q8JkQSpkDALJElT2hN3uK3pgaEZ2HUl0RfwHIrKwJe0P6As=
X-Gm-Gg: Acq92OEf54kz6ejPaWlH3aY8tBaOlIYSyzR3I1Yri2FU1LSzfWY0upYMhsUYYjg4xwP
	4YObPv1gwieKzsFjPHRHzll/mn6jwRrjJwPI/bslLmo8pujzQg1t5St20lvtK4kZo36eZI8i2Ts
	SlU13r2fX7KWbnAIk9bHQVKuspG5Yfi4KzzK5Ejshd2gXCdOC/zTX8Y9N0L5YIkdU9DMcyrzTwm
	E2UvXGl++piIssOxcG+qMFSzvZLOdkLJOik7UcDgAfCFQufopvKSKXOvzBSFKqNTqb8hjJSKITR
	lYCNJ7FNVeI1VQ61rWfXilcKdHuIkT80i/7RE9W+qImH17yXaqDTat0hhGA9Sm6j7UaRJwrX6c+
	l2TEZFB4Jc2K8neJOHZK9jiHIlMh03Ea0wlW/Dbp4tUZjwb+TxQw1XEHlninGp/HYeno8D/TPDC
	C3ZDw7uIu7tPkIJFM8eb4O4oIXgqwHEY3gk3EBaffPqxKmO//g9YSOJ5y5Rfgz3jK9P0dkeVP+G
	EuspCokCKP7XHpbOw==
X-Received: by 2002:a05:600c:4591:b0:490:6869:46c6 with SMTP id 5b1f17b1804b1-490686947a8mr90737495e9.31.1779779792774;
        Tue, 26 May 2026 00:16:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:aba9:2be3:1465:636a? ([2a01:e0a:106d:1080:aba9:2be3:1465:636a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904526ca21sm299610585e9.3.2026.05.26.00.16.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 00:16:32 -0700 (PDT)
Message-ID: <147bb128-a77c-49e4-897d-ba6ee1b1449d@linaro.org>
Date: Tue, 26 May 2026 09:16:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/meson: clean up KMS polling on register failure
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
References: <20260524160657.17802-1-mhun512@gmail.com>
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
In-Reply-To: <20260524160657.17802-1-mhun512@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_001635_134108_61B04FCD 
X-CRM114-Status: GOOD (  14.99  )
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

On 5/24/26 18:01, Myeonghun Pak wrote:
> meson_drv_bind_master() starts the KMS polling helper before registering
> the DRM device. If drm_dev_register() fails, probe unwinds the IRQ and
> DRM device without stopping the polling helper.
> 
> Call drm_kms_helper_poll_fini() on that failure path before freeing the
> IRQ.
> 
> This issue was identified during our ongoing static-analysis research while
> reviewing kernel code.
> 
> Fixes: bbbe775ec5b5 ("drm: Add support for Amlogic Meson Graphic Controller")
> Cc: stable@vger.kernel.org
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
>   drivers/gpu/drm/meson/meson_drv.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index 49ff9f1f16..e49de5df73 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -352,12 +352,14 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>   
>   	ret = drm_dev_register(drm, 0);
>   	if (ret)
> -		goto uninstall_irq;
> +		goto uninstall_poll;
>   
>   	drm_client_setup(drm, NULL);
>   
>   	return 0;
>   
> +uninstall_poll:
> +	drm_kms_helper_poll_fini(drm);
>   uninstall_irq:
>   	free_irq(priv->vsync_irq, drm);
>   exit_afbcd:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
