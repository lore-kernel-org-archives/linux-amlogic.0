Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B2BC4707B
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Jan 2024 08:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WfPR8T3h+GNt/iyvKNUvH/CZicHMQrPdnwJt0uSOBCE=; b=yR2vdpYECcRTZy7Sp5Ejcg7YHJ
	ipb0OMlu040fS8rrzCnSxdfES7EeUjYX/lfgpkgdzvmEHI6b+NawMEoCeEgFF/IkK2jmhL8MvKBJp
	zpGT5+aMHRfbNywNON+9cR6tsYIRFfukJ3Bkzt9ZQf8MS1945UeloBUQJCJiRxfm1Fja3i+ddhPEA
	6HEo9guzXouck5UdhJfgkvm/QQRdLxMgLZ5G8Bf/SMCxNKxb9JRJOC7pQXgpHAkZoCFfQjNvZAGvd
	Xf833+uU2BHPyCiL6AkI87MEO/Wj1UxT7Qvfie11sXW2lpC60QLH98INhh73G28mD7TudamvcKCt5
	Ts54MYdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNqHY-00GSvE-1v;
	Thu, 11 Jan 2024 08:19:20 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNqHV-00GSt2-0A
	for linux-amlogic@lists.infradead.org;
	Thu, 11 Jan 2024 08:19:18 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3368b9bbeb4so4771591f8f.2
        for <linux-amlogic@lists.infradead.org>; Thu, 11 Jan 2024 00:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704961153; x=1705565953; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+4qHeI/z66hlwEDi1tGbM9yP5c2kAe5foIFfSXCRpNE=;
        b=GbCC3WeZjcfOdG+4UQ3yklp43qtGBmmdZBz1GoKPmKs6/sDcamBzltFhOetpopwL6+
         JUag2GtO4hE/ZQVM/LUo7Qb0SQHHb/PcWktENlfnwtBMmzrtZtcFVGccoJvDxyQQdzdQ
         3tAsxkVMJC6Mgql9mmvfkdAcWgLw/UqBWiU10Qz/5aR65//30z8GogG9acm4yVf/7S6Y
         2mTYwbNLg0kyRxP0xNsmFxL6ZHQ+n7yHOg5DORTaDVE+ZXlosH0nCaYNjNsaC5+Xhyrl
         /XBZ9sQqSgg9w3uuKJ04WfiVn9xYjcxEq8x3ibb14lZx/boNStl+lV6JEv0brUe/1zae
         5gug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704961153; x=1705565953;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+4qHeI/z66hlwEDi1tGbM9yP5c2kAe5foIFfSXCRpNE=;
        b=nifbLr+UEp6aIIyz0qEU+DfZ+Ei9Hrgpvza8lLjIjOiSx7GJguqkBJdEpg1Y2wBOpO
         ElwBbou5yU+Acr9j+rZp9naXRQyqRW4TOyGuB+bQ/LGTRDihQZ78xpW72DPCL6AD28KE
         uvQyTMNVK+E3+bCQHYYtHBWpgdwV/7kNhYFWDkaQA4IbCBiZhmaCf4kkzhwnnSXZh3Eu
         3NWp1Jq86yCT/9VhesPeBGTMOPYjes2B0BZvMVgnvjb9U11rsZrw+CdBR95SFNvgwYI4
         FD4US56BsZCRs4KrLmK+/66CZnRqzz1PNTZcIYDA932q3x82Kst+Sox2QYhVM+6f2iby
         U+mg==
X-Gm-Message-State: AOJu0YxoL30DF4z5b//vuaA5dcMXfBWglh/oWPMmvCymBnwcnglIcNr7
	VAPDY/eX6SEqGOPrfqlFcBq9r5KKjp1ypA==
X-Google-Smtp-Source: AGHT+IG1MXGBZm+5oHqUHBJdJ1Gjre9hhkiIT+3tfrKpHjQyQgK7AuNU3ufYjUEJBIcpbc9DMxgMRg==
X-Received: by 2002:adf:ed4e:0:b0:336:4bbc:72e4 with SMTP id u14-20020adfed4e000000b003364bbc72e4mr189239wro.81.1704961153283;
        Thu, 11 Jan 2024 00:19:13 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:a5aa:e466:ae57:5a26? ([2a01:e0a:982:cbb0:a5aa:e466:ae57:5a26])
        by smtp.gmail.com with ESMTPSA id x18-20020adfffd2000000b003377680c55bsm555821wrs.16.2024.01.11.00.19.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jan 2024 00:19:12 -0800 (PST)
Message-ID: <b2caf65d-4bc8-4e16-b4db-b24006e3dce6@linaro.org>
Date: Thu, 11 Jan 2024 09:19:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 00/24] Support more Amlogic SoC families in crypto
 driver
Content-Language: en-US, fr
To: Alexey Romanov <avromanov@salutedevices.com>, narmstrong@baylibre.com,
 clabbe@baylibre.com, herbert@gondor.apana.org.au, davem@davemloft.net,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 khilman@baylibre.com, jbrunet@baylibre.com, artin.blumenstingl@googlemail.com
Cc: linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@salutedevices.com
References: <20240110201216.18016-1-avromanov@salutedevices.com>
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
In-Reply-To: <20240110201216.18016-1-avromanov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_001917_110349_6564FA39 
X-CRM114-Status: GOOD (  13.01  )
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

On 10/01/2024 21:11, Alexey Romanov wrote:
> Hello!
> 
> This patchset expand the funcionality of the Amlogic
> crypto driver by adding support for more SoC families:
> AXG, G12A, G12B, SM1, A1, S4.
> 
> Also specify and enable crypto node in device tree
> for reference Amlogic devices.
> 
> Tested on AXG, G12A/B, SM1, A1 and S4 devices via
> custom tests and trcypt module.

Thanks a lot for the patchset, it's very welcome!

Could you provide some procedure used to test and test dumps for all the platforms, like `cryptsetup benchmark` or a summary of tcrypt tests output ?

Thanks,
Neil

> 
> Alexey Romanov (17):
>    drivers: crypto: meson: don't hardcode IRQ count
>    drivers: crypto: meson: make CLK controller optional
>    drviers: crypto: meson: add platform data
>    drivers: crypto: meson: add MMIO helpers
>    drivers: crypto: meson: move get_engine_number()
>    drivers: crypto: meson: use fallback for 192-bit keys
>    drivers: crypto: meson: add support for G12-series
>    drivers: crypto: meson: add support for AXG-series
>    dt-bindings: crypto: meson: add new compatibles
>    arch: arm64: dts: meson: a1: add crypto node
>    arch: arm64: dts: meson: s4: add crypto node
>    arch: arm64: dts: meson: g12: add crypto node
>    arch: arm64: dts: meson: axg: add crypto node
>    arch: arm64: dts: meson: s4-s805x2-aq222: enable crypto node
>    arch: arm64: dts: meson: a1-ad401: enable crypto node
>    arch: arm64: dts: meson: axg-s400: enable crypto node
>    arch: arm64: dts: meson: g12a-u200: enable crypto node
> 
> Jan Dakinevich (7):
>    drivers: crypto: meson: drop status field from meson_flow
>    drivers: crypto: meson: move algs definition and cipher API to
>      cipher.c
>    drivers: crypto: meson: cleanup defines
>    drivers: crypto: meson: process more than MAXDESCS descriptors
>    drivers: crypto: meson: avoid kzalloc in engine thread
>    drivers: crypto: meson: introduce hasher
>    drivers: crypto: meson: add support for AES-CTR
> 
>   .../bindings/crypto/amlogic,gxl-crypto.yaml   |   2 +
>   .../arm64/boot/dts/amlogic/meson-a1-ad401.dts |   4 +
>   arch/arm64/boot/dts/amlogic/meson-a1.dtsi     |   8 +
>   .../arm64/boot/dts/amlogic/meson-axg-s400.dts |   4 +
>   arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |   7 +
>   .../boot/dts/amlogic/meson-g12-common.dtsi    |   7 +
>   .../boot/dts/amlogic/meson-g12a-u200.dts      |   4 +
>   .../dts/amlogic/meson-s4-s805x2-aq222.dts     |   4 +
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi     |   7 +
>   drivers/crypto/amlogic/Makefile               |   2 +-
>   drivers/crypto/amlogic/amlogic-gxl-cipher.c   | 591 ++++++++++++------
>   drivers/crypto/amlogic/amlogic-gxl-core.c     | 260 ++++----
>   drivers/crypto/amlogic/amlogic-gxl-hasher.c   | 448 +++++++++++++
>   drivers/crypto/amlogic/amlogic-gxl.h          | 116 +++-
>   14 files changed, 1135 insertions(+), 329 deletions(-)
>   create mode 100644 drivers/crypto/amlogic/amlogic-gxl-hasher.c
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
