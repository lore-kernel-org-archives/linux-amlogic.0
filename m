Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5690ECDB46E
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Oct 2023 11:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zM+G8XvnBVkfk8cVpjjxryKKJo/jF5nBHbVxp3KsZfw=; b=KWoS2+HFXIXt7msQ7nNrLHP5tN
	zP46LQ3JmTrzXGPonF3lIXzp3tpU8veUDtq4QLcwwhmruqYA+BND8JbwyGMOeNua98Tdx6plXwDMm
	DiA4DEIxP7fstpAWNMCRAbdwYPzi7gRVLfmUa1lqPurKYfC2H/rBbdUzRDpQdo0nDQAPYBRZXhh0N
	67dLZ3HZ6bR3ELCCHaA5NdnCzROrUex9vP+Kh0F4/tR2X1ZKEC3BAO/vzDEVJJ4Fqmsir3ibvPguv
	bz/Xo2fAAM/bPp9XUKgMnJLyR9dQXXyoycgbmicsTL6RVvEhFvPE8WjqpnOaCqlnUidQzjv3Gsufe
	dGigBRRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qquHp-000ubC-2C;
	Thu, 12 Oct 2023 11:55:29 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qquHl-000uZG-1M
	for linux-amlogic@lists.infradead.org;
	Thu, 12 Oct 2023 11:55:28 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-313e742a787so487045f8f.1
        for <linux-amlogic@lists.infradead.org>; Thu, 12 Oct 2023 04:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697111723; x=1697716523; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JFbVPfHjsB3vzxjqb/xRtojs+Qso4nPkleZZB9zp81k=;
        b=cGGbojP+JaCwRxb+oDDFXOXaLp10zaqK4GLAl8ZffDzqygVAqiCLsY9ey0EdclU0EK
         xTJ1TOFOn59C5CDIR7rsnFd1+QnsOaf4BY6PhHjYSVVJy2t/DXveUTl83WSGyciNpCMM
         bVrcl45jNZyjpq9Vw2sQkfRBzT0eCppetGA5ystp4GdslqyKIF0l36+8r6bf66hj8SpQ
         iZ42JEty1EziDvrCPJ4Y+7XYoI1Z9fzIRJFmUCHunIvErNZ3BeHbx1rmJzgijWK8RzmW
         ksqsfFMv8FOPUhg+3H0Ryxm+4+xYQdpzwM0FW6rBIzrgqw/Hlp3nw5LqtZ0Mr3CyH1Sx
         Pb4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697111723; x=1697716523;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JFbVPfHjsB3vzxjqb/xRtojs+Qso4nPkleZZB9zp81k=;
        b=R8kHKvydRUqmUSS3d9BecFgzxMOYPS0e5O1Ps9VyXuhWx0W6NJBM7PNSMxacZMZS2U
         VPRCw0xA+q2jvxZF5oSE8X4NWie6Fz/g61to4n5YpPXRUo0CKc8yy0k32v900MsgPgkD
         KdXCOe5sU8XAdQsckwE0SW6FXLb5b3OYTlnlkPmfzJydJIA3zoCnK3odJFB+oAXp8htf
         rEVDo7uBDnAi4XOdHmFH73j/naOO3kbJaM84e9/7PfUF9hPumWOqfaEbYjM51jEnTuJ0
         5h+yRjFqE1kRq1w4p5ssOV/EocfssDLJ6zT5PDFoOW1a2hdN+qCLINZWnReHWfwohcuK
         /m5g==
X-Gm-Message-State: AOJu0YwF41s56SbWY9SK3cW2wuvpB+TOrtk6TovY8ghDO3icAo+wurFc
	p0nqaw6zpNEAUMjKruVKxXFqgQ==
X-Google-Smtp-Source: AGHT+IE/7JaYYTpaCa0pzSDfEePxgjUQ8+G7hQLcClFja80Bllm+9gSZbArRRuY3pNZPwr9i0Y1RAQ==
X-Received: by 2002:adf:ab0f:0:b0:32d:8113:eda3 with SMTP id q15-20020adfab0f000000b0032d8113eda3mr5313197wrc.10.1697111723296;
        Thu, 12 Oct 2023 04:55:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:d423:df8b:7f17:7909? ([2a01:e0a:982:cbb0:d423:df8b:7f17:7909])
        by smtp.gmail.com with ESMTPSA id p5-20020a1c7405000000b004064e3b94afsm21802128wmc.4.2023.10.12.04.55.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 04:55:22 -0700 (PDT)
Message-ID: <ec4951ba-abf6-4461-9e54-8ecbf9fc6cf0@linaro.org>
Date: Thu, 12 Oct 2023 13:55:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: defconfig: add various drivers for Amlogic based
 boards
Content-Language: en-US, fr
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
References: <CGME20231012103636eucas1p21eec119a94d1f2adfe8d1c2602bd4012@eucas1p2.samsung.com>
 <20231012103600.3381340-1-m.szyprowski@samsung.com>
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
In-Reply-To: <20231012103600.3381340-1-m.szyprowski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_045525_473429_89571678 
X-CRM114-Status: GOOD (  10.63  )
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

On 12/10/2023 12:36, Marek Szyprowski wrote:
> Enable drivers for the hardware blocks present on the Amlogic Meson SoC
> based boards: Khadas VIM3 and Hardkernel Odroid N2 to increase testing
> coverage.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   arch/arm64/configs/defconfig | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 07011114eef8..d3849aae5925 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -423,6 +423,7 @@ CONFIG_MHI_WWAN_MBIM=m
>   CONFIG_INPUT_EVDEV=y
>   CONFIG_KEYBOARD_ADC=m
>   CONFIG_KEYBOARD_GPIO=y
> +CONFIG_KEYBOARD_GPIO_POLLED=m
>   CONFIG_KEYBOARD_SNVS_PWRKEY=m
>   CONFIG_KEYBOARD_IMX_SC_KEY=m
>   CONFIG_KEYBOARD_CROS_EC=y
> @@ -686,6 +687,7 @@ CONFIG_QCOM_SPMI_ADC_TM5=m
>   CONFIG_QCOM_SPMI_TEMP_ALARM=m
>   CONFIG_QCOM_LMH=m
>   CONFIG_UNIPHIER_THERMAL=y
> +CONFIG_KHADAS_MCU_FAN_THERMAL=m
>   CONFIG_WATCHDOG=y
>   CONFIG_SL28CPLD_WATCHDOG=m
>   CONFIG_ARM_SP805_WATCHDOG=y
> @@ -728,6 +730,7 @@ CONFIG_MFD_TPS65219=y
>   CONFIG_MFD_TI_AM335X_TSCADC=m
>   CONFIG_MFD_ROHM_BD718XX=y
>   CONFIG_MFD_WCD934X=m
> +CONFIG_MFD_KHADAS_MCU=m
>   CONFIG_REGULATOR_FIXED_VOLTAGE=y
>   CONFIG_REGULATOR_AXP20X=y
>   CONFIG_REGULATOR_BD718XX=y
> @@ -765,6 +768,8 @@ CONFIG_RC_DEVICES=y
>   CONFIG_IR_GPIO_CIR=m
>   CONFIG_IR_MESON=m
>   CONFIG_IR_SUNXI=m
> +CONFIG_MEDIA_CEC_SUPPORT=y
> +CONFIG_CEC_MESON_G12A_AO=m
>   CONFIG_MEDIA_SUPPORT=m
>   CONFIG_MEDIA_CAMERA_SUPPORT=y
>   CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
> @@ -1112,6 +1117,7 @@ CONFIG_RTC_DRV_RK808=m
>   CONFIG_RTC_DRV_ISL1208=m
>   CONFIG_RTC_DRV_PCF85063=m
>   CONFIG_RTC_DRV_PCF85363=m
> +CONFIG_RTC_DRV_PCF8563=m
>   CONFIG_RTC_DRV_M41T80=m
>   CONFIG_RTC_DRV_BQ32K=m
>   CONFIG_RTC_DRV_RX8581=m
> @@ -1167,6 +1173,7 @@ CONFIG_XEN_GRANT_DEV_ALLOC=y
>   CONFIG_STAGING=y
>   CONFIG_STAGING_MEDIA=y
>   CONFIG_VIDEO_MAX96712=m
> +CONFIG_VIDEO_MESON_VDEC=m
>   CONFIG_CHROME_PLATFORMS=y
>   CONFIG_CROS_EC=y
>   CONFIG_CROS_EC_I2C=y
> @@ -1460,6 +1467,7 @@ CONFIG_QCOM_L3_PMU=y
>   CONFIG_ARM_SPE_PMU=m
>   CONFIG_ARM_DMC620_PMU=m
>   CONFIG_HISI_PMU=y
> +CONFIG_MESON_DDR_PMU=m
>   CONFIG_NVMEM_LAYOUT_SL28_VPD=m
>   CONFIG_NVMEM_IMX_OCOTP=y
>   CONFIG_NVMEM_IMX_OCOTP_ELE=m

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
