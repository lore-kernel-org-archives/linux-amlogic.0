Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3895606D807
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Nov 2026 15:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qQ6zgAp7;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZCyfhVTz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FqLaPJAshnITFTqdzfzTBV5jtcuMHRgqq7aoVoa7d8M=; b=qQ6zgAp7iGW0UKRXje4K5ucXhT
	3ZhEqlv5xupd9vzwWKrnWYWkyVoQUCtCcgMkxdIG5jRXIWj+WTEtqAMWjMDClrk1Elr4sSxXCLra8
	M6j/J0rG7ycR6FcO/j0NBEZL5p3VsnNgV3EEv9zyOqB3gHWq99KqRr5sU4ppAsPLr0bMe8OSImEMY
	ZTN5DIZrW+m/MhMZ0yQZTich2Dz+UhwznLCCy9P1dcHqebpC6UhRrdIPVmXwqCnQjiUgMC5Q/pL6V
	ci9voADyFvEiPH8MUsb6Tq13sRMl7RZVQJbKg/FkXlOVms5SLLciEmrPk8y20lDYQjL5UYKEXust2
	pP2adKSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzlZ-00000009Smr-0Md1;
	Thu, 05 Nov 2026 15:52:41 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzlQ-00000009Sip-3ycX
	for linux-amlogic@lists.infradead.org;
	Thu, 05 Nov 2026 15:52:39 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so9067005e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 05 Nov 2026 07:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793893951; x=1794498751; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GWCoEkBHP605pI0Qmm4NU4T3DG8OFJsvFq5xEzMuhw4=;
        b=ZCyfhVTzsXAV9lxaZIvow+PcVSQ6jThP2rriRFW/ZIhixofLhp7U0usN4FwojhfNB5
         XAWwgws8IXWtGL9++Bugx9nGsn3vwxpvUhR+GovvrvWnTg9oNOjAlr69FQI5gerySxBP
         LrPtv/sU3FVmEyAi8qWv00n9fY2o266nofBiNc3ryJDOXal8+Ty7QUASDFT2Eke0KjQ6
         iH1HUlwktkCt3y7uYnfSNXl1zqGu9zgMmcLY5FykAEwHIpkb6j0wj0La3SCVigDTFr2f
         y+hipVQ5YiTNxP3c/60KRIqeTaUGmylNgSz2tfCITjp71bwusmfPI8G+AfbrGnQGW05Z
         cOsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793893951; x=1794498751;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GWCoEkBHP605pI0Qmm4NU4T3DG8OFJsvFq5xEzMuhw4=;
        b=X0sTcd/4lXqYtaIzxUhgm2VfCV6PrHsFuIumoB2dem+kJCGL80ljAcdqVoXEGlj49r
         EKUcZFzjlFmddNWydYIt7dtKKYGyj2edqcnFXYG79MFVIY8ag4/tG8VkwF0M0ShEQfvf
         Sy9QKpzSTXGvhMLHrep8WWuqmNZT1eivpEt86ud6gDUoXLEMOlODSpaRikpuVxPkVprQ
         hVdSHiv0J6tYfRs8Yvlhxmtl4hpjIjR8thL93pQoiDmNMkHonCCFhEAglsZMCaZQDe/J
         ZRifyx7CW2VRy4Zn7VVPfxSjxRMbHHDZ9lian9DWUQfZsQpp0FvSSWPoceQx430cGFdA
         65yA==
X-Forwarded-Encrypted: i=1; AKwUvBwbglIJRQpI8JBDs5BB/72fytXpmxqsjoy72MG7BlCQro7xiYKUBAlHISZS3PQXzbSJWP01gw4gy1DaRSbN@lists.infradead.org
X-Gm-Message-State: APuU4Z95QitXZPUJ/DSjguEyh0QS9oeGpxiHT5nT4wGCj3bbG9j5B+Su
	+KHnUQ9OwEljsaD+UVYJCsp5DDKkwQ4ZE1fpjJjBZWNb+feGNFZnvUOiHrjgI7v0ml4=
X-Gm-Gg: AYBFou3h34483ueqrejV41c9G+59Kvhuz1qOUyR+cBPAH3wSkOR/Mt+3jVrlPKY11iw
	HauZmwgqzWoJ2Yf9RTJkZE7wyowR5wGlBhTZLjDfVq1z+zO4D9vjbNSOnqaKWm8PnclCI0oYI1C
	TdsUZCNipJzNJQrBx3XC1j35aOK8xQRD0B9z5bl+CUwxh2dxbzsUM7u4V/U34lCEpAiNHIKSqGW
	hOTrpiHnS+zQT04lDqm2sA+H150s/rkq/XVmJ/b73BBdSN8GzQFDvt10Ra3Q0ZQVURC8v4I00V0
	fhBF3Z/R2JhD9MxK4X5CNy3xAQC29o+0JTseEuUvqqKfFcIisS7mJkLFeU1cUZDQ+7p6PUguiWT
	ViWiVD2DKAzRvqJoVvBwkgzOj0JpMEsaNS+o3cjFT2U8UQ4iXH3w/0WqI4+TjXTy4tPiv/cMCeu
	fQKgyfInEqMvh1uwLXofVEPC3Ev/+nbkGO0IPmPVcvXhNWA7CDREItlaB835/njNLvsrjHhN1Gc
	c4n/g07iwMY/pJSKp2ZWo4aYYf0Ff+SdKwlZMamC6pbrM7deHGKJfOafi/7CvuRaTw8pSX4UgJI
	rbb8JylTQ3Mnc6QZt33kqhY1gsENs1Vel3Q0Wfp5gga84Rr1j2OxCUejYUnkL+o/CPhHwHcqcF6
	cnPudPL5h7iUqkca2Fh4pnRfATKzk
X-Received: by 2002:a05:600c:46cf:b0:4b0:b9ff:1e7c with SMTP id 5b1f17b1804b1-4b55e07e569mr58728955e9.15.1793893950764;
        Thu, 05 Nov 2026 07:52:30 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9899:e54b:a2f2:3695? ([2a01:e0a:106d:1080:9899:e54b:a2f2:3695])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56fca22e1sm87441305e9.14.2026.11.05.07.52.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 07:52:30 -0800 (PST)
Message-ID: <bfbb4d7d-49a0-412d-b3a6-1ea226748b16@linaro.org>
Date: Thu, 5 Nov 2026 16:52:29 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH RESEND 26/83] drm/meson: Switch to
 drm_mode_config_create_initial_state
To: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
References: <20261105-drm-no-more-config-reset-v1-0-1f58d1e33380@kernel.org>
 <20261105-drm-no-more-config-reset-v1-26-1f58d1e33380@kernel.org>
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
In-Reply-To: <20261105-drm-no-more-config-reset-v1-26-1f58d1e33380@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_075234_831549_750DAD0C 
X-CRM114-Status: GOOD (  14.69  )
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

On 11/5/26 16:29, Maxime Ripard wrote:
> drm_mode_config_reset() has a dual role: it creates the initial KMS
> state at probe time, and resets hardware and software state during
> suspend/resume cycles.
> 
> Since the two roles need different behaviors (notably for objects like
> drm_private_obj that must persist across suspend/resume),
> drm_mode_config_create_initial_state() was introduced to handle only
> the initial state creation at probe time.
> 
> Switch to drm_mode_config_create_initial_state().
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: linux-amlogic@lists.infradead.org
> ---
>   drivers/gpu/drm/meson/meson_drv.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index 49ff9f1f16d3..dda2dc2d5b00 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -345,5 +345,7 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>   		goto exit_afbcd;
>   
> -	drm_mode_config_reset(drm);
> +	ret = drm_mode_config_create_initial_state(drm);
> +	if (ret)
> +		goto uninstall_irq;
>   
>   	drm_kms_helper_poll_init(drm);
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
