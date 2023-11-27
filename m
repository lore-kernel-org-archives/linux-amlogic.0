Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCCAAC4167B
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Nov 2023 08:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k1+J479bW8CvaUYkPnAT9OIA8laTdC/YE8GkSM8D4zQ=; b=TGZiX1DCMBNxi608Ks6YgdSPM2
	XIm3o1rOpGGJ37+670C+hFDW24pPqPZ8HfRCwAVqqiR4yAbcjdsW1LoQ0PigU7K/mREG/ZQ90ziC0
	TLzUj87motkDOcVii1/xkpGeumHlS4I/oW0MJngix+dB4ZzonLKv9Ez3CJ/r+TpN6Ll/kgFhCi96L
	7lqNP8ZDX7tIbJ2x0zZKnDNYn6MPMu8A+CaC0RIFjjeEoednjUaFZSBs1aSybQNy7DL5af4ogkRdT
	GW1CXerWtsSjVcJhl3ZLj68M64v6tJ2YpSc44YF0d5vA18yKJa2nHOoV/25TahbT2wttTQ3vkgzh/
	VE2zOQsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Ws8-001pJf-2Y;
	Mon, 27 Nov 2023 08:21:40 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Ws6-001pHr-2I
	for linux-amlogic@lists.infradead.org;
	Mon, 27 Nov 2023 08:21:40 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-332e40322f0so2352790f8f.3
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Nov 2023 00:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701073296; x=1701678096; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a7viWszIcXFoOpqHRSaRGzVaaNqOyV/oWHsy7smbtVg=;
        b=SrffdSH0RMXMXdGkruoKgl1ecdDCJJa21nwdgW5oQN0ES2/UoX+IZ/3/5Nk4mcTXoO
         iZCb3Y83MMLChlkXIeXKiq0oNLlx+z0DFv0xTXFEgs3BjJdowSa0FbL+/37P5tAgyXG9
         pmPSFQYwQW182QxPwfz+Qwtq9jOVKgVaYkuDFQdBmiO7/Rv5dyKyIri7XdWuk1R/64Lg
         QEcxTC0EEW/kfVV8GWVCKtb7zHhBCFeHUzPUALhOO2R2CSrrkSiPv6nO/ZrFU5wc0qQF
         fnpPZtDJaEXY8BlSw4Zzt3a57NxDRsoMh6zxk4bj22FOjbBsuNfpNYAosEODI56fmXC/
         7suw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701073296; x=1701678096;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a7viWszIcXFoOpqHRSaRGzVaaNqOyV/oWHsy7smbtVg=;
        b=ctUwWclUy7NDSqfxT6D7gsAQkLnK45rrRgq2QJ5Vm45iuEpi3W5By5bFoTSs9KSMQl
         qRsf+a24l1etoUzShLFDqaLOlhWMY7ZXGaoj2M0jjnEnJt8dQ50JD4PK8Yt7qEjTLQYd
         3nO5bZKaVXhQiFhfi4lpZNEy0RkMOGM/02E7a7aIuwnSnFX/Aq0L08k4lafhAdX62VhC
         TNH8O1smkd6NURb1SJE3SrC+aW/FqO1viK0oI9qh03C8kBac+LUn9KoZ3+VEEqeKQHGc
         t9tjtXLoc3sP0k/YBKh4fvZBDw3Y1Iux8wDhLW9e7c4nuEdFOYHsk0ZZA/YA9SZ5Q3kG
         HOTA==
X-Gm-Message-State: AOJu0YxC2U3SPyNOEdFAwXbZIE7ZxRRGK0Ut0XdGhmaFLHOBGMp+lpaT
	c1S99CS7Wh1AeHi7srGTHA/XlA==
X-Google-Smtp-Source: AGHT+IFkDZ/Tc9TFzjuDbFecp8bY9iP6OY/2ge/yDGEVed9tVj/eRKiYrarEioRc6Be7l6syA6eQog==
X-Received: by 2002:adf:f388:0:b0:332:d152:5e9b with SMTP id m8-20020adff388000000b00332d1525e9bmr7418994wro.57.1701073296160;
        Mon, 27 Nov 2023 00:21:36 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5a15:ac68:b4a4:85ff? ([2a01:e0a:982:cbb0:5a15:ac68:b4a4:85ff])
        by smtp.gmail.com with ESMTPSA id w27-20020adf8bdb000000b00332e5624a31sm10650138wra.84.2023.11.27.00.21.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 00:21:35 -0800 (PST)
Message-ID: <39219cc4-e10a-4cee-9f14-fde061317e37@linaro.org>
Date: Mon, 27 Nov 2023 09:21:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v9 00/12] drm/meson: add support for MIPI DSI Display
Content-Language: en-US, fr
To: Vinod Koul <vkoul@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jagan Teki <jagan@amarulasolutions.com>, Nicolas Belin
 <nbelin@baylibre.com>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Remi Pommarel <repk@triplefau.lt>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-phy@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 "Lukas F. Hartmann" <lukas@mntre.com>
References: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
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
In-Reply-To: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_002138_777713_9B73934A 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
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

Hi Vinod,

On 24/11/2023 09:41, Neil Armstrong wrote:

<snip>

> 
> ---
> Neil Armstrong (12):
>        dt-bindings: clk: g12a-clkc: add CTS_ENCL clock ids
>        dt-bindings: soc: amlogic,meson-gx-hhi-sysctrl: add example covering meson-axg-hhi-sysctrl
>        dt-bindings: phy: amlogic,meson-axg-mipi-pcie-analog: drop text about parent syscon and drop example
>        dt-bindings: phy: amlogic,g12a-mipi-dphy-analog: drop unneeded reg property and example

Could you pick patches 3 and 4 ? they are both reviewed.

Thanks,
Neil

>        dt-bindings: arm: amlogic: Document the MNT Reform 2 CM4 adapter with a BPI-CM4 Module
>        clk: meson: g12a: add CTS_ENCL & CTS_ENCL_SEL clocks
>        clk: meson: add vclk driver
>        clk: meson: g12a: make VCLK2 and ENCL clock path configurable by CCF
>        drm/meson: gate px_clk when setting rate
>        arm64: meson: g12-common: add the MIPI DSI nodes
>        DONOTMERGE: arm64: meson: khadas-vim3l: add DSI panel
>        arm64: dts: amlogic: meson-g12b-bananapi-cm4: add support for MNT Reform2 with CM4 adaper
> 
>   Documentation/devicetree/bindings/arm/amlogic.yaml |   1 +
>   .../phy/amlogic,g12a-mipi-dphy-analog.yaml         |  12 -
>   .../phy/amlogic,meson-axg-mipi-pcie-analog.yaml    |  17 -
>   .../soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml  |  33 ++
>   arch/arm64/boot/dts/amlogic/Makefile               |   1 +
>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |  70 ++++
>   .../meson-g12b-bananapi-cm4-mnt-reform2.dts        | 384 +++++++++++++++++++++
>   .../boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi   |   2 +-
>   arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi |  74 ++++
>   .../boot/dts/amlogic/meson-sm1-khadas-vim3l.dts    |   2 +-
>   drivers/clk/meson/Kconfig                          |   5 +
>   drivers/clk/meson/Makefile                         |   1 +
>   drivers/clk/meson/g12a.c                           | 106 ++++--
>   drivers/clk/meson/vclk.c                           | 141 ++++++++
>   drivers/clk/meson/vclk.h                           |  51 +++
>   drivers/gpu/drm/meson/meson_dw_mipi_dsi.c          |   7 +
>   include/dt-bindings/clock/g12a-clkc.h              |   2 +
>   17 files changed, 858 insertions(+), 51 deletions(-)
> ---
> base-commit: b0b93834348aaf1a6e14693b4f1d17d3ec024257
> change-id: 20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-b8e5217e1f4a
> 
> Best regards,


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
