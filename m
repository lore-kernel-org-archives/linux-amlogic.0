Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB547EE57DF
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Sep 2023 10:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3nXTLkqxiGFZG7Nog1IgxWUYMLLYQb1TI+XykQVayX8=; b=XWIYe+R8R0HGBwChLdxKzsyV6t
	HpvekhjhCVblhmxYkxm892kB/LMi9nJ557reKGd5AE7q9ezBMDBHh2S4U5q3iHf7GvCoVK3XWpE89
	WDPD0BzKyTZ0XrmYo31eXjqFDawJusotrMWPEdhBVVF0H6OQDeCKUtlHDIaoRF3sMxTvl0m60AdDX
	23FIIAHr4H+wgpLDqFnumVu/f5AJSyY/39hNe5eNUyupcFTPxPWqPMltozzyfSmtJHiuoDXYfqBdX
	xNHwq21rlZGPVegE9jCznDIUvIIn4zo1pCyEy0y95Ob/7Syen4u6Fw/YmIi4/b8m1H9ykutQnTcI/
	1XjYhzgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfeGv-000GAg-1x;
	Mon, 11 Sep 2023 10:36:01 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfeGs-000G3Z-25
	for linux-amlogic@lists.infradead.org;
	Mon, 11 Sep 2023 10:36:00 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-31c4d5bd69cso4413085f8f.3
        for <linux-amlogic@lists.infradead.org>; Mon, 11 Sep 2023 03:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694428551; x=1695033351; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JICgtmzSx3A3sw4lszmURcgW45ozMuUqwQZUr0okJA8=;
        b=rZVhxfmXzkhH4jywR7tg09HqDzsPeQ+mNJvA+a6C5P4s38zVZIf9Sq2o5z3TuYvI7x
         3HeIVgzvqw23DQuEhelafWo08IYElQKi07NIXed9bsg2H3xh4WoQ6Rchww7RUmrtOu6T
         9JrrQu/z5ODxoHOm9O6pKC/t6Rtb46+/EZ3ZKWc1kgVQm19YRJIccXrp3nJncHqGBqCT
         PFPW+ZRO1lrlY8SD9E+tHaWKF2TqwBewcuzpCTMBNDVLGtjnaawGkutlGZTmgiD63IjJ
         4kIPW4rjL/NqK5PChNDbEhDuqkHoXDNfG4Q9m7HsXCqFuZB83q++1RSW062jcVYks64z
         d4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694428551; x=1695033351;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JICgtmzSx3A3sw4lszmURcgW45ozMuUqwQZUr0okJA8=;
        b=FJkIVYrCVG3mP8X5MfSTtmL5epr2M0Ac8z+ucHE+HOQeF+ytxO5R6RY3oxpg7V7t9U
         KvbC6fy9j/Po6eE/NRyCIran/U2YVzz+mTxduCryf884w0LAkLXxym3d7WFSIStMITFz
         4DednLK7PpgtjJJUmb8mlDjlJoqOTZyZkitKj7MzjPHWJj6gHT+ZcEMVN3U2Xa2Xwvco
         ybuSFIjT9wCE1OOiFJ+M9oNrlcVhuKMkpNrHxN1ygg1KrfCl7xZjzScAgtFsZRgRPYWX
         qVtrxBxGzqWzYWYq9rmvxXiUEbvM+5JIGSMa35g1FZCZ1zqz8LqKMivsFP25azdr2I2G
         MTYw==
X-Gm-Message-State: AOJu0YyQ5hNZRUEQe9MIuwljsE96gzKEwrXQTZHAyRJpfi5315mHN6dH
	GsJ3VqtiGLVoYDCQ5LTdD/3kQA==
X-Google-Smtp-Source: AGHT+IGff+YWwMOAgjM4jE/gO9Kp635uN5sQ2rd7db+HH+so6nO/c2Endv8ktQ7dGp2lnz+UJs5kWQ==
X-Received: by 2002:a5d:64a1:0:b0:31f:a7dc:40fe with SMTP id m1-20020a5d64a1000000b0031fa7dc40femr2288749wrp.20.1694428550754;
        Mon, 11 Sep 2023 03:35:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:daaa:8bc3:eeb7:ce8? ([2a01:e0a:982:cbb0:daaa:8bc3:eeb7:ce8])
        by smtp.gmail.com with ESMTPSA id t3-20020a05600001c300b0031f07d1edbcsm9742911wrx.77.2023.09.11.03.35.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 03:35:50 -0700 (PDT)
Message-ID: <13456f9f-3e3c-4cad-baab-1f7d094a5712@linaro.org>
Date: Mon, 11 Sep 2023 12:35:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: (subset) [PATCH 0/3] This patchset adds IR controller driver
 support for
Content-Language: en-US, fr
To: Sean Young <sean@mess.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 zelong dong <zelong.dong@amlogic.com>, linux-media@vger.kernel.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Qianggui.Song@amlogic.com,
 Yonghui.Yu@amlogic.com, kelvin.zhang@amlogic.com
References: <20230825115310.39993-1-zelong.dong@amlogic.com>
 <169442559302.3235506.15361466537260729684.b4-ty@linaro.org>
 <ZP7sKdvAWQQSrTmX@gofer.mess.org>
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
In-Reply-To: <ZP7sKdvAWQQSrTmX@gofer.mess.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_033558_685742_1057A735 
X-CRM114-Status: GOOD (  13.07  )
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

On 11/09/2023 12:30, Sean Young wrote:
> On Mon, Sep 11, 2023 at 11:46:33AM +0200, Neil Armstrong wrote:
>> On Fri, 25 Aug 2023 19:53:07 +0800, zelong dong wrote:
>>> From: Zelong Dong <zelong.dong@amlogic.com>
>>>
>>> Meson IR Controller supports hardware decoder in Meson-S4 and later
>>> SoC. So far, protocol NEC could be decoded by hardware decoder.
>>>
>>> Zelong Dong (3):
>>>    media: rc: meson-ir: support rc driver type RC_DRIVER_SCANCODE
>>>    dt-bindings: media: Add compatible for Meson-S4 IR Controller
>>>    arm64: dts: meson: add IR controller for Meson-S4 SoC
>>>
>>> [...]
>>
>> Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.7/arm64-dt)
>>
>> [3/3] arm64: dts: meson: add IR controller for Meson-S4 SoC
>>        https://git.kernel.org/amlogic/c/dc8bc779feb5e855421215384f23de90a4fcd622
> 
> Would make more sense to have all three patches go in together through a single
> tree? I was about to apply all three of these patches to the media_stage
> tree.

There's a lot of changes in the S4 dtsi, it would create some merge conflicts
if it went into the media tree, if you can take the 2 first patches it would be perfect.

It won't break anything to have the DT merged separately anyway

Neil

> 
> 
> Sean


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
