Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A0BE77188
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jan 2025 09:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mFEcxzXeeWhKxWPVx3IUlUlEe8kIOlYyjE+Wb65bG04=; b=QWss+72DFzngVnzQOwTkzLjgus
	Hgx4ZJaR7lWVJ6PCbZTKOgl1VZhQ2SnY5T+IJjve84e7i1TrB//XgNKGIBP3/e9Fewq9OLtFt2pNT
	xlnnoDA/2pyUCCiioD87x29KUlf1ySO0wXoZEzVKh6Rc3HR1olk6yrEqoTV2t/NXUXCeuWpSgehAO
	W6F80gJRIsBLHc9jESn6jLbnqWOGsQS17DhKJbdpZIzxUquO2+f56ecMSPlXSka8DyreDs4gbPqMk
	ZiDncpgoSqjeibBaLPQYLZ98tXuxbH/1R7AClF4AmEKOqsusi0URBTwAfaqJ9ZJDyAG/aIuulQm25
	ysq+yAsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTHiG-0000000A4Sh-2g4f;
	Thu, 02 Jan 2025 09:41:56 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTHh4-0000000A4Cc-2PIP
	for linux-amlogic@lists.infradead.org;
	Thu, 02 Jan 2025 09:40:44 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-385de9f789cso8378038f8f.2
        for <linux-amlogic@lists.infradead.org>; Thu, 02 Jan 2025 01:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735810840; x=1736415640; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vBrc7EuOMXY8yTx/TbXVRV+IK2Cs6RWnPvid7BqXfWc=;
        b=wnIdNAcxZXJ+ofVHS+DFsl/daz8DwtT3w0ROJYVqqk8mH23vDgLPhxZYsRMSNS9hBK
         4XgTfBbTiCqj0jSnTC/ga7YBr53h5+iwZ02YJC95ammnL6DR24cnnBQqVozeiHp3uWx6
         hZz2jofcGaGOtDC7vSe2MF01SbuLNpeV51JGYb6a8utrCWSlVmn9U3tefYhvTOVtJIBA
         HwOl1OBBaUuJWQ3wBfAKXV2/0Cym9tLLfFfc6oc0FUoAg96J0ilyLUwKQADeTqmGSP+E
         PEkLDx7qmXapNuWHE1C95NNDDOKo5m7fqfiM/MpynCIdnPhwPJTwguFxymBqFVBUw0Oj
         qzdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735810840; x=1736415640;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vBrc7EuOMXY8yTx/TbXVRV+IK2Cs6RWnPvid7BqXfWc=;
        b=w04HAteeCRz3x8ErS89bJdsY84GdUcEeYjqRPME1dwnNDyGbsohJItDt+DJeRC/p0B
         vK6mpU9TTc/0rF0oEkPR36G27Yerm3OOV5lAtsUr7EXjvbVaknAweNRGhWWPjnppK0s+
         I2+7jK36tGCb4tIffbu0A4F5TJfsk2sN2EOYl+G2CXs/wXFJJRpEyu9zcP2MxeGjm43c
         4AEcmwCs0SuHHKHBJvnyccSFvbI1UQ7Cuhd2eKCEBR3dyqzEkZzXXm/xQX1HNfPsNzRT
         eBaq99gw7jMJDfcaMxm6Bm9Ku5sWICtKdAX3YzMCCli/+5wkVLFSNIxc3pD8mF87ouDC
         NBNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtpww1ooklPVUJ0zJkRV/Ss1AJ5tmziO/PCLuMqodekMzytTVMMj2YamS46RL9BZFHqfadbTdYjYVWuBHs@lists.infradead.org
X-Gm-Message-State: AOJu0YyDoTNHF+xtIpwUV6sl82VQYKfyeH/pCpiO/0PfrRPDOZ0osbI/
	PoYdrGhMuhk8pi9jzVQQp2VjEhNW/DzZVAyzAvQwhSDc7Robwn1i3aXY7iS2ikU=
X-Gm-Gg: ASbGnctNp/fbexaUiO1IqwiOTRS4nTpBqzigY/8wKORR5AWoSEKJmxgAC6Q6DS+15Fs
	5YGVjf9xVQt70XSHugb36BpIBxIXUaGX4YHOMKHFB9Kr4IoKUwdSTbr8Jque523EOT7dTQ1rjuh
	Y+qNVtY1UWcoiV8qcpbolpv43kPuC65nX5rlUYPbGlnWvnxXAKUaXzNh2F1VIYK3wPwT/Owvp4K
	7e5l+eEmnLMTqjEsFI8bLGgFIwsyG3DIDf8wnr6YoMNk4K2z/hxrh47l0N6XEpzVaptpDLybJBj
	zp3B9fMqo01ZvTn5KHqRkIhK68kPwWReFg==
X-Google-Smtp-Source: AGHT+IFyQxq7+SLmgC3lEOJrijlLY/blJUqn/3ChXyKJbxUPuO43SDrq1oyRFY0OkutfbUe85tJpHQ==
X-Received: by 2002:a05:6000:2ae:b0:385:ed16:c97 with SMTP id ffacd0b85a97d-38a224088aemr34478674f8f.49.1735810837548;
        Thu, 02 Jan 2025 01:40:37 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:1cfa:329a:aa2e:f0be? ([2a01:e0a:982:cbb0:1cfa:329a:aa2e:f0be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c828bd3sm37151921f8f.10.2025.01.02.01.40.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 01:40:37 -0800 (PST)
Message-ID: <f888d948-d79e-41a0-8844-b3a9659498c2@linaro.org>
Date: Thu, 2 Jan 2025 10:40:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [RFC PATCH v1 0/2] iio: adc: meson: add MPLL clock workaround for
 GXLX
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-iio@vger.kernel.org
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, lars@metafoo.de,
 robh@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, gnstark@salutedevices.com,
 krzk+dt@kernel.org, jic23@kernel.org
References: <20241231194207.2772750-1-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20241231194207.2772750-1-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_014042_613075_492C53D9 
X-CRM114-Status: GOOD (  15.30  )
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

On 31/12/2024 20:42, Martin Blumenstingl wrote:
> Hello,
> 
> Amlogic GXLX SoCs seem to be mostly the same silicon as GXL. The only
> known differences are:
> - one less Mali-450 GPU core
> - no VP9 codec
> - and an odd one: the three MPLL clocks need a bit toggled in the SAR
>    ADC register space
> 
> This series attempt to fix audio output (which relies on the MPLL
> clocks) on the GXLX boards. Unfortunately all we have is a downstream
> commit [0] without any further explanation (or anyone who wants to
> provide details on this). Since it's not clear if this is a gate, a
> reset or some other hardware fix: the driver side includes a warning
> for users to update their .dtb along with kernel images in case we
> ever figure out what these bits do and how to model them properly.
> 
> 
> [0] https://github.com/khadas/linux/commit/d1d98f2ed8c83eb42af8880ed8e206aa402dd70a#diff-c5aaf54323ef93777c5083de37f933058ea8d0af79a1941e0b5a0667dc0f89b3
> 
> 
> Martin Blumenstingl (2):
>    dt-bindings: iio: adc: amlogic,meson-saradc: Add GXLX SoC compatible
>    iio: adc: meson: add support for the GXLX SoC
> 
>   .../iio/adc/amlogic,meson-saradc.yaml         |  1 +
>   drivers/iio/adc/meson_saradc.c                | 34 +++++++++++++++++++
>   2 files changed, 35 insertions(+)
> 

LGTM

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
