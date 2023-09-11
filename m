Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB77EE57DF
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Sep 2023 09:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lBZ5XUUK5dnVHGN9d1iteF3/huSG1qxOYI9B5OTnnWU=; b=ZbeyuMRTEV/HoIfOmT80+v+Htg
	qiMz0kJD/ZBmgFZKq/Elaa08rGDsaLei2rz90aey3mIXjISB0rCOVoHG8NqEjTFdCaDNJnzxcpuUp
	KLMMHXGGelpDjgYs6BK+pReEyDiB++gD97+KDG4qQE9mVU+DnjgvjRMAEMHH5A01CAE6zDdWQ8Ng8
	XDSmZb4yQioOdlkv8YkPrXXDoIVrXK6WrH1aaB1L+PQBRVYC6PAh44DaXswqFeBrEhYXuLGP9YXgM
	5hHbgGHQfuCCwT0mHCahfWI1dUuYUrC+Zuyym604n5GrtQRCeENMhwXpgZYDoEnhL+ZZe32q6qgUI
	kL6UySaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfdYj-0004S0-35;
	Mon, 11 Sep 2023 09:50:21 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfdYh-0004Qp-19
	for linux-amlogic@lists.infradead.org;
	Mon, 11 Sep 2023 09:50:20 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-401b393ddd2so48457415e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 11 Sep 2023 02:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694425818; x=1695030618; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cWlkPQI1Yw2OHhpnK3b6UUH+RFe3hIOhoTtTQ2y5gKM=;
        b=xk1ZAsy8ftKJm0grITwdDH0dHAeqp6C5afm8PjBz520zhJCw6wYjurz5Pg1+T3Uxpy
         YdWjbU+Gzc0/8Ps7mkFGKolapgkeFrYpeKyOHWSjyC4MOC/r1+jUGajgOIbHdtLQppWt
         GUIqjFrIVg/rUjkxX51DAJNXY2UMe33nr4mxlYGjywzNRMW5MxVpSkn/q7x7KjYpeRm2
         qdg7oYkDTwFaK1wwY9+YSG6vljlF6FgInF6nDAdoRDVoc8DXq4PsESBkpuzVEmfHvmc1
         eENXpNGf7s/Rg5xjQ9pyan/XTID16QUUJqbQ6c6DjRl5B/ZD0JFGNnr4taLmRV3o0U8y
         OdAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694425818; x=1695030618;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cWlkPQI1Yw2OHhpnK3b6UUH+RFe3hIOhoTtTQ2y5gKM=;
        b=iCrLwEC/CnV05AP3jzQNJTiOpTm43rAfF5hMixikDHokTO98xgui+0xbd80kdgg13h
         x0xdKES4aKkpqwK5+k0bQjSUUy92StZ00Y95Dmpw3JfQnIAbeHlO1yfoZJaDXIQjK/gS
         IjfNwkUfs2wAMYvY/YVIJrO1om6FsH7cBNMS99TzkoiqYolGkaL87whw/JpzYfVKVqcI
         WO95fc7sOkL4mk/mbwwnIFwkgPNXgPQaE0VH/oG8OjljkDZAjIpVyz8YNbqisfrhRBWF
         CBMqfark7DLJ8J9ukzC2fyxaQPsFZBx1dum+mFZGtd5XfPQ4RrfmKbGxLd1etf44JQ6u
         eVLQ==
X-Gm-Message-State: AOJu0YzCdXuTIvST1E5kkj+/bycPPkHs/bGRGUFC5WdU53Qa4ZSOsafR
	O7dUPT//USiE/ybQXaazvwKF+g==
X-Google-Smtp-Source: AGHT+IHI4A4EOkbJF57yZhPXziUj9HK5tk+YTi+LsfYa3ihobo23dDVK8lc8xP8GO52BwhM5r5OH4Q==
X-Received: by 2002:a05:600c:2207:b0:401:b6f6:d90c with SMTP id z7-20020a05600c220700b00401b6f6d90cmr8256405wml.35.1694425817657;
        Mon, 11 Sep 2023 02:50:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:daaa:8bc3:eeb7:ce8? ([2a01:e0a:982:cbb0:daaa:8bc3:eeb7:ce8])
        by smtp.gmail.com with ESMTPSA id h13-20020a05600c260d00b003fe4ca8decdsm12797392wma.31.2023.09.11.02.50.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 02:50:17 -0700 (PDT)
Message-ID: <fc85d3e4-1266-4173-a21e-b97cc51622ce@linaro.org>
Date: Mon, 11 Sep 2023 11:50:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 00/15] arm64: dts: meson: a1: introduce several
 peripheral IPs
Content-Language: en-US, fr
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>, jbrunet@baylibre.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, conor+dt@kernel.org
Cc: kernel@sberdevices.ru, sdfw_system_team@sberdevices.ru,
 rockosov@gmail.com, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230823213630.12936-1-ddrokosov@sberdevices.ru>
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
In-Reply-To: <20230823213630.12936-1-ddrokosov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_025019_396394_5E1EFD02 
X-CRM114-Status: GOOD (  16.29  )
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

On 23/08/2023 23:36, Dmitry Rokosov wrote:
> This patch series introduces device tree declarations for various
> peripheral IPs of the A1 SoC family, including clock controllers, EFUSE,
> USB, SPI Flash Controller, SDIO, and UART_AO:
>      - CLK: A1 SoC has four types on the board, namely PLL, Peripherals,
>        CPU, and Audio, but only Amlogic A1 PLL and Peripherals clock
>        controllers are currently supported.
>      - EFUSE: consists of a 4k bit One Time Programmable (OTP) memory
>        divided into 32 128-bit blocks, and data is accessed using the APB
>        bus through software or the Key-ladder integrated with the EFUSE
>        block.
>      - USB: only one USB 2.0 high-speed port is available in the A1 SoC,
>        supporting both HOST and DEVICE modes for OTG.
>      - SPI Flash Controller: 4-bit QPI/SPI NOR Flash or NAND FLASH
>        controller.
>      - SDIO: for WiFi/IEEE802.11 connection.
>      - UART_AO: for Bluetooth connection.
>      - HWRNG: hardware random generator integrated into SoC.
>      - AO SECURE: board info registers.
> 
> The above peripherals are integrated to new AD402 board device tree.
> 
> Changes v2 since v1 at [1]:
>      - reorder meson-a1 dtsi includes to keep them sorted
>      - remove extra empty lines
>      - purge the unnecessary 'okay' status
>      - reorder all device tree nodes (existing and new) sorted by 'reg'
>        values
>      - introduce new saradc definition
>      - add hwrng dts node
>      - provide ao secure dts node with board info registers
>      - include all changes to new AD402 board device tree
>      - add AD402 board to bindings
> 
> Links:
>      [1] https://lore.kernel.org/all/20230607201641.20982-1-ddrokosov@sberdevices.ru/
> 
> Alexey Romanov (3):
>    arm64: dts: meson: a1: enable efuse controller and setup its clk
>    arm64: dts: meson: a1: add hw rng node
>    arm64: dts: meson: a1: add ao secure node
> 
> Dmitry Rokosov (8):
>    arm64: dts: meson: a1: reorder includes to keep them sorted
>    arm64: dts: meson: a1: remove extra empty line before reset node
>    arm64: dts: meson: a1: remove the unnecessary 'okay' status pwrc value
>    arm64: dts: meson: a1: reorder gpio_intc node definition
>    arm64: dts: meson: a1: introduce PLL and Peripherals clk controllers
>    arm64: dts: meson: a1: support USB controller in OTG mode
>    arm64: dts: introduce Amlogic AD402 reference board based on A113L SoC
>    dt-bindings: arm: amlogic: add Amlogic AD402 bindings
> 
> George Stark (1):
>    arm64: dts: meson: a1: add saradc definition
> 
> Jan Dakinevich (1):
>    arm64: dts: meson: a1: add eMMC controller and its pins
> 
> Martin Kurbanov (1):
>    arm64: dts: meson: a1: introduce SPI Flash Controller
> 
> Oleg Lyovin (1):
>    arm64: dts: meson: a1: introduce UART_AO mux definitions
> 
>   .../devicetree/bindings/arm/amlogic.yaml      |   1 +
>   arch/arm64/boot/dts/amlogic/Makefile          |   1 +
>   .../arm64/boot/dts/amlogic/meson-a1-ad402.dts | 145 ++++++++++++
>   arch/arm64/boot/dts/amlogic/meson-a1.dtsi     | 213 +++++++++++++++++-
>   4 files changed, 348 insertions(+), 12 deletions(-)
>   create mode 100644 arch/arm64/boot/dts/amlogic/meson-a1-ad402.dts
> 

B4 missed it but I applied this patchset into v6.7/arm64-dt.

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
