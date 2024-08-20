Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54F9C3DA4A
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2024 15:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vp1o7SsdFFQ5WAYptQ/HfMcGMKFR6Gq0xo3e4pGGYr8=; b=IGySlP9fY8Zm+YOwZDXD6Lsdv/
	PCpSIXo6r8hQdWkBoqH7g2Fpy8FeQHvugZEmRfnFHj9ZhCN8doTR6tE9LgY+OpBCTyX54kGu0AvRT
	FpRjd5on66H0EAySf5hC+yhDgSCl6tsFMLjJvNyJ/tziteyzQlIbzrVvw2CALHnP0wCDaVr6h7YF8
	kXG+mm9Y7dinLQcs7W6DvfX/TAQd6RRdkPi9iL4IwIznxPHwvRu6rfA34xFD6ma0pda/+eQQ/dZWt
	AK09+Eav+FfFV6bJBokEiWBymQXaWeIzq4P1VJ3voB+8IYc7aOLIk1wkK6zbefOK8XFdlfkmSeOYf
	+ygbcjLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgQkq-00000005oMQ-2PsW;
	Tue, 20 Aug 2024 15:26:40 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgQdv-00000005lfZ-1Tld
	for linux-amlogic@lists.infradead.org;
	Tue, 20 Aug 2024 15:19:33 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-42817bee9e8so44514015e9.3
        for <linux-amlogic@lists.infradead.org>; Tue, 20 Aug 2024 08:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724167169; x=1724771969; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CO8k7gPS3ah2eo5Hppz8CJu9bMQrSC7MJe+A3wiVe2c=;
        b=JhdFIopsrjuuv4drXNaX/tcsewVB7rr40Tpehg6pOjsqImSyCHyQFiPESA4UglaayI
         fvsZeQEoPRXGDs/S3zjYmwXYu9Rw5grTYQluLkUx/GWcp+J7nonZUjtP47rFmtz/rfzR
         zIzHkn5t7Fr/h/hhSshbKtGV+eHuOsfmDFm4BJr1KAKn6YB2I4vBl7PBlx8UwAnk/u2H
         SqSiC0Fw2NcjvMCDnYydMyQv/kvKZ86p62oqZbhx0OWpjzyjgQbK3ZzwE5/FLPcbFGDP
         jKDc8IRIIL5Jsv5Mr+6lOyKzUsnGRe/phU3xsnjQBwkk5U2pkKyg+km69dMCNfpej8ts
         klww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724167169; x=1724771969;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CO8k7gPS3ah2eo5Hppz8CJu9bMQrSC7MJe+A3wiVe2c=;
        b=SgvH+99Ls19ex7syBS0kxCV7BmmJWCIsM3ijIyHa/YgruUtC9qBiZMODuQM9CioW5y
         QqhNrZolH9z0YRkEhcejwYeRuyLHOS88tDIBM9sTPF1zYNnHS/dwC0hRr97u1Jk2Fua9
         rHc7tlG1H3jsJyy2XZyNDduizH+GbQ4T2Uv1QcZrthbqX3u2jd9cA7Y/0S7NPYG5I84j
         31Vo3Cimw4LEb4EybMcFn/2E/PyQpGe4K3NXQDgV0IAGmZN4WThxCg4OJvNmFAJjStn8
         Gdf7tRQCVNj424Yg+DOMjkEJf4TUZe4wiDh5xY79fAXR+2Z0nUDU5jWiWJAc/+UQUVKn
         GuTw==
X-Forwarded-Encrypted: i=1; AJvYcCWiIGFVyN2eLBbCdqazp9pN4w2wbHbQ3sPUZcO6dJ2rs/Pf0Kp9Ale8J7WxoTR+tA0rJWK13AU5hgY7Yhzj@lists.infradead.org
X-Gm-Message-State: AOJu0Yz44TykMJnMi6jp+8X+fWQr2/ua6GKgir5tbY8pxHGpie81B0rC
	sSqn4FsEHWyqp6zVWMTzeXNVMoD/VT7oAft1Dbpw7NO0vT0d2AfF/FkMgeIPKwPCv1h185KGCZl
	s
X-Google-Smtp-Source: AGHT+IFZv8g2osJqh6CIrgVGdxVcFJ776Ad1FAr/yJHw+toA0eOs6k0PzTFvoLjLqRM1QHuSjRpBag==
X-Received: by 2002:adf:a39a:0:b0:368:c6ff:dc94 with SMTP id ffacd0b85a97d-3719465a9fdmr8495859f8f.32.1724167168984;
        Tue, 20 Aug 2024 08:19:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ebdf:8de4:37af:6aad? ([2a01:e0a:982:cbb0:ebdf:8de4:37af:6aad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed785708sm145468595e9.37.2024.08.20.08.19.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 08:19:28 -0700 (PDT)
Message-ID: <6e535895-6a06-42f8-abf3-e3b7472c97e0@linaro.org>
Date: Tue, 20 Aug 2024 17:19:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v9 00/23] Support more Amlogic SoC families in crypto
 driver
To: Alexey Romanov <avromanov@salutedevices.com>, clabbe@baylibre.com,
 herbert@gondor.apana.org.au, davem@davemloft.net, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, vadim.fedorenko@linux.dev
Cc: linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@salutedevices.com
References: <20240820145623.3500864-1-avromanov@salutedevices.com>
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
In-Reply-To: <20240820145623.3500864-1-avromanov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_081931_455102_639E1F08 
X-CRM114-Status: GOOD (  22.00  )
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

On 20/08/2024 16:56, Alexey Romanov wrote:
> Hello!
> 
> This patchset expand the funcionality of the Amlogic
> crypto driver by adding support for more SoC families:
> AXG, G12A, G12B, SM1, A1, S4.
> 
> Also specify and enable crypto node in device tree
> for reference Amlogic devices.
> 
> Tested on GXL, AXG, G12A/B, SM1, A1 and S4 devices via
> custom tests [1] and tcrypt module.

On which tree did you base yourself ? It fails to apply patch 20 on next-20240820 and 6.11-rc4

Neil

> 
> ---
> 
> Changes V1 -> V2 [2]:
> 
> - Rebased over linux-next.
> - Adjusted device tree bindings description.
> - A1 and S4 dts use their own compatible, which is a G12 fallback.
> 
> Changes V2 -> V3 [3]:
> 
> - Fix errors in dt-bindings and device tree.
> - Add new field in platform data, which determines
> whether clock controller should be used for crypto IP.
> - Place back MODULE_DEVICE_TABLE.
> - Correct commit messages.
> 
> Changes V3 -> V4 [4]:
> 
> - Update dt-bindings as per Krzysztof Kozlowski comments.
> - Fix bisection: get rid of compiler errors in some patches.
> 
> Changes V4 -> V5 [5]:
> 
> - Tested on GXL board:
>    1. Fix panic detected by Corentin Labbe [6].
>    2. Disable hasher backend for GXL: in its current realization
>       is doesn't work. And there are no examples or docs in the
>       vendor SDK.
> - Fix AES-CTR realization: legacy boards (gxl, g12, axg) requires
>    inversion of the keyiv at keys setup stage.
> - A1 now uses its own compatible string.
> - S4 uses A1 compatible as fallback.
> - Code fixes based on comments Neil Atrmstrong and Rob Herring.
> - Style fixes (set correct indentations)
> 
> Changes V5 -> V6 [7]:
> 
> - Fix DMA sync warning reported by Corentin Labbe [8].
> - Remove CLK input from driver. Remove clk definition
>    and second interrput line from crypto node inside GXL dtsi.
> 
> Changes V6 -> V7 [9]:
> 
> - Fix dt-schema: power domain now required only for A1.
> - Use crypto_skcipher_ctx_dma() helper for cipher instead of
>    ____cacheline_aligned.
> - Add import/export functions for hasher.
> - Fix commit message for patch 17, acorrding to discussion [10].
> 
> Changes V7 -> V8 [11]:
> 
> - Test patchset with CONFIG_CRYPTO_MANAGER_EXTRA_TESTS: fix some bugs
>    in hasher logic.
> - Use crypto crypto_ahash_ctx_dma in hasher code.
> - Correct clock definition: clk81 is required for all SoC's.
> - Add fixed-clock (clk81) definition for A1/S4.
> - Add information (in commit messages) why different compatibles are used.
> 
> Changes V8 -> V9 [12]:
> 
> - Remove required field clk-names from dt-schema according to Rob Herring
> recommendation [13].
> - Fix commit order: all dt-bindings schema commits now located earlier
> than any changes in device tree.
> - Fix typos and add more clarifications in dt-schema patches.
> 
> Links:
>    - [1] https://gist.github.com/mRrvz/3fb8943a7487ab7b943ec140706995e7
>    - [2] https://lore.kernel.org/all/20240110201216.18016-1-avromanov@salutedevices.com/
>    - [3] https://lore.kernel.org/all/20240123165831.970023-1-avromanov@salutedevices.com/
>    - [4] https://lore.kernel.org/all/20240205155521.1795552-1-avromanov@salutedevices.com/
>    - [5] https://lore.kernel.org/all/20240212135108.549755-1-avromanov@salutedevices.com/
>    - [6] https://lore.kernel.org/all/ZcsYaPIUrBSg8iXu@Red/
>    - [7] https://lore.kernel.org/all/20240301132936.621238-1-avromanov@salutedevices.com/
>    - [8] https://lore.kernel.org/all/Zf1BAlYtiwPOG-Os@Red/
>    - [9] https://lore.kernel.org/all/20240326153219.2915080-1-avromanov@salutedevices.com/
>    - [10] https://lore.kernel.org/all/20240329-dotted-illusive-9f0593805a05@wendy/
>    - [11] https://lore.kernel.org/all/20240411133832.2896463-1-avromanov@salutedevices.com/
>    - [12] https://lore.kernel.org/all/20240607141242.2616580-1-avromanov@salutedevices.com/
>    - [13] https://lore.kernel.org/all/20240610222827.GA3166929-robh@kernel.org/
> 
> Alexey Romanov (23):
>    drivers: crypto: meson: don't hardcode IRQ count
>    drviers: crypto: meson: add platform data
>    drivers: crypto: meson: remove clock input
>    drivers: crypto: meson: add MMIO helpers
>    drivers: crypto: meson: move get_engine_number()
>    drivers: crypto: meson: drop status field from meson_flow
>    drivers: crypto: meson: move algs definition and cipher API to
>      cipher.c
>    drivers: crypto: meson: cleanup defines
>    drivers: crypto: meson: process more than MAXDESCS descriptors
>    drivers: crypto: meson: avoid kzalloc in engine thread
>    drivers: crypto: meson: introduce hasher
>    drivers: crypto: meson: add support for AES-CTR
>    drivers: crypto: meson: use fallback for 192-bit keys
>    drivers: crypto: meson: add support for G12-series
>    drivers: crypto: meson: add support for AXG-series
>    drivers: crypto: meson: add support for A1-series
>    dt-bindings: crypto: meson: correct clk and remove second interrupt
>      line
>    dt-bindings: crypto: meson: support new SoC's
>    arch: arm64: dts: meson: gxl: correct crypto node definition
>    arch: arm64: dts: meson: a1: add crypto node
>    arch: arm64: dts: meson: s4: add crypto node
>    arch: arm64: dts: meson: g12: add crypto node
>    arch: arm64: dts: meson: axg: add crypto node
> 
>   .../bindings/crypto/amlogic,gxl-crypto.yaml   |  32 +-
>   arch/arm64/boot/dts/amlogic/meson-a1.dtsi     |  14 +
>   arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |   7 +
>   .../boot/dts/amlogic/meson-g12-common.dtsi    |   7 +
>   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi    |   6 +-
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi     |  13 +
>   drivers/crypto/amlogic/Makefile               |   2 +-
>   drivers/crypto/amlogic/amlogic-gxl-cipher.c   | 632 ++++++++++++------
>   drivers/crypto/amlogic/amlogic-gxl-core.c     | 292 ++++----
>   drivers/crypto/amlogic/amlogic-gxl-hasher.c   | 507 ++++++++++++++
>   drivers/crypto/amlogic/amlogic-gxl.h          | 118 +++-
>   11 files changed, 1269 insertions(+), 361 deletions(-)
>   create mode 100644 drivers/crypto/amlogic/amlogic-gxl-hasher.c
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
