Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC0BC2BD09
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Jul 2024 10:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WG5ozjsnukwPL6cJLUUctVsLgrHBaKtsfmlZWaNyuGY=; b=qzTaB0tdjgWBarokypb5G0hk5v
	QRlic9KBlYHXyrfkEUlENrdlfNGycJJAyXVZJVFwX4jyPw1P1wsaVsbLNEvpm5KDszsCUvpI10mck
	Tx7kyNpynzRhuc0RttvTPEAEGGY8ANu6KCZ/9o/ZBbnPW1E6lIg60x2uHZ5NGIbdmvzBLHwC5foSj
	holycNDOmyI5EBYA/TugxgRDgRZprT2cATRm/0CkOKKNuRfFivfBSsZnExSWVD335C/BpIQs7p6Jg
	9TNv1PgXDUXwaHFGFo7/VUsxvYm0WGjCZzIVdhLRY8Y0KtCp3RqIXD+wgLtAexLfVrABX4ud4Bezk
	+RNnTi5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSDIO-0000000HFUe-1z8C;
	Fri, 12 Jul 2024 10:14:32 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSDIK-0000000HFSf-3NxG
	for linux-amlogic@lists.infradead.org;
	Fri, 12 Jul 2024 10:14:30 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-52e9f863c46so1993834e87.1
        for <linux-amlogic@lists.infradead.org>; Fri, 12 Jul 2024 03:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720779267; x=1721384067; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gZZHFNTR4N+F29cbze+baP7bA+J9HR0bjS9r0Ha7Mhg=;
        b=OTvtoT9nlser0KUjcdQqmpaqjj8qMOqUUzmIG97SSPeo+MPrm+etR0tpFiTXei+uER
         CGaX3UfyxQqrPv/O2P9XlMVC6Uwoy7JrkyXMNiyR/gC8TR3p1iT2B7G3HET5m51nS7XU
         I2ppFMQcR6Dz7Y47nLZYUhiybAkPS/XiMuvVcDETYM+6sY6bN/nE3YczkXU3TZXNM1vU
         q+QahbhOIW16mnstQsgyuf02zmFzQ2xaKrd+XhebGS7XtQBxzL/MkO65+4UXFEgd0lDT
         LkFtlJquZvlUpdyFiOjlKxc6zlXmgobgq7VyEOGCoQIPx8lbZvH0PrxioEIAIqT94F5u
         bFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720779267; x=1721384067;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gZZHFNTR4N+F29cbze+baP7bA+J9HR0bjS9r0Ha7Mhg=;
        b=An+v6APZTrDLGi5o3nJzYspdpzAn7fTQR2TprvCGE53lZyFYZzgQDG8kuz2fYe0LCO
         qq5m7YhxWFDuOuE2Xu6lfH7xoU/GkZ87G35vj60Hr+KaInJVd+hp+IRWhLAvbrL4MxGs
         +LFpKNOoPbybsYQ5IhWb6QPqHw4ZF25ofuDtrhbIO5U9y2r6zJ1mtFr3olpik43xn3Co
         dLHN5k8lAzNHjooivub5/pcRT/Ti51wm3BYdqRhyFg2z7HylBLaaOp3hrUsf3RWzA3+t
         W0V8hyqXeaS+3wiPyPhT7GXXPQCVeJx4RX+SFhA+SmANH0e8lTRDC4c8kR8GeD5K6SaO
         JAgw==
X-Gm-Message-State: AOJu0YyD4niUtPqaPMRJW7MsqcsW5JovMIIokRFPFnYN0e+96I64lAJP
	fV/YBaQK9JdcW5QdHHQG2tVzrM3aFq/kZjhDTCpshvVFBxLduYv6QSHhjDfWumT/d0ZnRTIrKRm
	X
X-Google-Smtp-Source: AGHT+IEd1V/qpx0GHVK/dHhd4GiBwKYKplsjOQ6QvwHbeEIzX/H/g8JE6f5R0HtcwVoAZ3CcTVPgxQ==
X-Received: by 2002:a05:6512:3190:b0:52c:8a39:83d7 with SMTP id 2adb3069b0e04-52eb99d15c2mr8494993e87.52.1720779266487;
        Fri, 12 Jul 2024 03:14:26 -0700 (PDT)
Received: from ?IPV6:2a0d:e487:123f:f92c:dc0b:c36a:f16e:7964? ([2a0d:e487:123f:f92c:dc0b:c36a:f16e:7964])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f244934sm18701545e9.8.2024.07.12.03.14.25
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jul 2024 03:14:26 -0700 (PDT)
Message-ID: <ab5e3ccd-55f9-40b5-accf-87c58343fb7d@linaro.org>
Date: Fri, 12 Jul 2024 12:14:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v7 4/5] drm/ci: meson: add tests for meson display driver
To: linux-amlogic@lists.infradead.org
References: <20240712091549.56635-1-vignesh.raman@collabora.com>
 <20240712091549.56635-5-vignesh.raman@collabora.com>
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
In-Reply-To: <20240712091549.56635-5-vignesh.raman@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_031428_894582_C9DD0D83 
X-CRM114-Status: GOOD (  21.76  )
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

On 12/07/2024 11:15, Vignesh Raman wrote:
> For Amlogic Meson G12B (A311D) SOC the display driver is meson and
> gpu driver is panfrost. Currently, in drm-ci for Meson G12B (A311D),
> only the gpu driver is tested. Refactor the existing meson jobs
> and add support in drm-ci to test both display and gpu driver for
> Amlogic Meson G12B (A311D) and update xfails.
> 
> Since the correct driver name is passed from the job to test gpu
> and display driver, remove the check to set IGT_FORCE_DRIVER
> based on driver name for meson jobs.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v2:
>    - Refactor the patch to rename job to indicate display driver testing,
>      rename the existing xfail files.
> 
> v3:
>    - Add the job name in GPU_VERSION and use it for xfail file names instead
>      of using DRIVER_NAME.
> 
> v4:
>    - Remove the display suffix in job and rename xfails accordingly.
>      Remove the change adding job name in GPU_VERSION.
> 
> v5:
>    - Add meson-display job.
> 
> v6:
>    - Squash commits for display and gpu driver testing. Reword the commit message.
> 
> v7:
>    - Rebase with recent drm-ci fixes and retest with latest IGT.
> 
> ---
>   drivers/gpu/drm/ci/igt_runner.sh              |  2 +-
>   drivers/gpu/drm/ci/test.yml                   | 23 +++++++++++++++----
>   .../gpu/drm/ci/xfails/meson-g12b-fails.txt    | 18 ++++++++++-----
>   .../gpu/drm/ci/xfails/meson-g12b-skips.txt    |  4 +---
>   .../gpu/drm/ci/xfails/panfrost-g12b-fails.txt |  8 +++++++
>   .../gpu/drm/ci/xfails/panfrost-g12b-skips.txt | 18 +++++++++++++++
>   6 files changed, 58 insertions(+), 15 deletions(-)
>   create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt
> 
> diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
> index 6193865f23a3..1578a2a47a54 100755
> --- a/drivers/gpu/drm/ci/igt_runner.sh
> +++ b/drivers/gpu/drm/ci/igt_runner.sh
> @@ -20,7 +20,7 @@ cat /sys/kernel/debug/dri/*/state
>   set -e
>   
>   case "$DRIVER_NAME" in
> -    rockchip|meson)
> +    rockchip)
>           export IGT_FORCE_DRIVER="panfrost"
>           ;;
>       amdgpu|vkms)
> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
> index 86875fb96eb5..5ccf57b3bf91 100644
> --- a/drivers/gpu/drm/ci/test.yml
> +++ b/drivers/gpu/drm/ci/test.yml
> @@ -356,25 +356,38 @@ panfrost:mt8183:
>       GPU_VERSION: mt8192
>       RUNNER_TAG: mesa-ci-x86-64-lava-mt8192-asurada-spherion-r0
>   
> -.meson:
> +.meson-device:
>     extends:
>       - .lava-igt:arm64
> -  stage: meson
>     variables:
> -    DRIVER_NAME: meson
>       DTB: ${DEVICE_TYPE}
>       BOOT_METHOD: u-boot
>       KERNEL_IMAGE_TYPE: "image"
>   
> -meson:g12b:
> +.meson-display:
> +  stage: meson
> +  variables:
> +    DRIVER_NAME: meson
> +
> +.g12b:
>     extends:
> -    - .meson
> +    - .meson-device
>     parallel: 3
>     variables:
>       DEVICE_TYPE: meson-g12b-a311d-khadas-vim3
>       GPU_VERSION: g12b
>       RUNNER_TAG: mesa-ci-x86-64-lava-meson-g12b-a311d-khadas-vim3
>   
> +meson:g12b:
> +  extends:
> +    - .g12b
> +    - .meson-display
> +
> +panfrost:g12b:
> +  extends:
> +    - .g12b
> +    - .panfrost-gpu
> +
>   virtio_gpu:none:
>     stage: software-driver
>     variables:
> diff --git a/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt b/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
> index 5b7d623f404b..53c5c91db5bb 100644
> --- a/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
> @@ -1,8 +1,14 @@
> -dumb_buffer@create-clear,Fail
> -dumb_buffer@create-valid-dumb,Fail
>   dumb_buffer@invalid-bpp,Fail
> -dumb_buffer@map-invalid-size,Fail
> -dumb_buffer@map-uaf,Fail
> -dumb_buffer@map-valid,Fail
> -panfrost/panfrost_prime@gem-prime-import,Fail
> +kms_3d,Fail
> +kms_cursor_legacy@forked-bo,Fail
> +kms_cursor_legacy@forked-move,Fail
> +kms_cursor_legacy@single-bo,Fail
> +kms_cursor_legacy@single-move,Fail
> +kms_cursor_legacy@torture-bo,Fail
> +kms_cursor_legacy@torture-move,Fail
> +kms_lease@lease-uevent,Fail
> +kms_properties@connector-properties-atomic,Fail
> +kms_properties@connector-properties-legacy,Fail
> +kms_properties@get_properties-sanity-atomic,Fail
> +kms_properties@get_properties-sanity-non-atomic,Fail
>   tools_test@tools_test,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt b/drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
> index 03eefa518afa..562662eff802 100644
> --- a/drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
> @@ -2,6 +2,7 @@
>   ^amdgpu.*
>   ^msm.*
>   nouveau_.*
> +^panfrost.*
>   ^v3d.*
>   ^vc4.*
>   ^vmwgfx*
> @@ -10,9 +11,6 @@ nouveau_.*
>   gem_.*
>   i915_.*
>   
> -# Panfrost is not a KMS driver, so skip the KMS tests
> -kms_.*
> -
>   # Currently fails and causes coverage loss for other tests
>   # since core_getversion also fails.
>   core_hotunplug.*
> diff --git a/drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt b/drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt
> new file mode 100644
> index 000000000000..5b7d623f404b
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt
> @@ -0,0 +1,8 @@
> +dumb_buffer@create-clear,Fail
> +dumb_buffer@create-valid-dumb,Fail
> +dumb_buffer@invalid-bpp,Fail
> +dumb_buffer@map-invalid-size,Fail
> +dumb_buffer@map-uaf,Fail
> +dumb_buffer@map-valid,Fail
> +panfrost/panfrost_prime@gem-prime-import,Fail
> +tools_test@tools_test,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt b/drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt
> new file mode 100644
> index 000000000000..03eefa518afa
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt
> @@ -0,0 +1,18 @@
> +# Skip driver specific tests
> +^amdgpu.*
> +^msm.*
> +nouveau_.*
> +^v3d.*
> +^vc4.*
> +^vmwgfx*
> +
> +# Skip intel specific tests
> +gem_.*
> +i915_.*
> +
> +# Panfrost is not a KMS driver, so skip the KMS tests
> +kms_.*
> +
> +# Currently fails and causes coverage loss for other tests
> +# since core_getversion also fails.
> +core_hotunplug.*

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
