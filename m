Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108C6CCF2D6
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Oct 2026 07:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mPNqp8MV8oBdP0W+4rzzH5U28+FyJkRTBchmeMsGHBE=; b=pObs5CutXd0IH2dNkRCQZWAl32
	tIcF9DTypRsjKAc3VKQJBGkcvKl4N/zm6NSHTz8FD9E7YjF8SSdU5wF6aN37EsjnM+PnaYLN587Tj
	3qPxrISwfJqKJp1cppG5c43cskGbvVwH1uf0HBmbDO/OaVBnciUK5pGHaC+I+j7NKIASPp5WokMl2
	IRionEuBFKNe8z47lkkpqVFByeqFxW0Wsh+l0o8GFSzOxPo+Et+fVNrdbchWhHVJGkQW8VtHCQidh
	ZvSnVRWTuSpvX8So4gXix0h0di38Amy5+Ks70Phuw+b6UnpTAR71EOsH1rIUWcJt8eJr8vXP/n9vf
	NNK6H/PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIhvk-00000006lsY-3YrF;
	Mon, 19 Oct 2026 07:37:12 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIhvh-00000006lrK-3Syg
	for linux-amlogic@lists.infradead.org;
	Mon, 19 Oct 2026 07:37:11 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so17638365e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Oct 2026 00:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792395428; x=1793000228; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8QPld4PDvxchqNmytlS7taNyVAk0cnj+pHWf4Ud33mo=;
        b=NamHHO9rO+BWuop+Jx865cciIO//xii1bNS4dm6RpEDY3VhydfYSHBsEBI20wGALcg
         /KVe+Lxwc42Z/4ItUFkXU1Ipo08kO+pKaUrXBaCBf3d5+sLZooaIL8bMJoWA0mJSPwZF
         WzHQ+Q0rWGZ+EW06shKE1hCD2+jEBlR2WIxGpMjuP4U8fiOHrDQqaODjMPaqon1l7Pw2
         /mgTRDMWT7OQxBJ2f/4LeoSd/BszxuTXs/O52WMGJ2EatqKSwPQGF6FlSC74jyW3g9Po
         Ft5sp2ozR713AATpvI8fkB0iqbGgIwFJI7V6jhI/9wVzGWPjSuuNxJCADgcKvF3Fq3rk
         Vrfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792395428; x=1793000228;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8QPld4PDvxchqNmytlS7taNyVAk0cnj+pHWf4Ud33mo=;
        b=YwcMb5WlkQgKcaaDaByyvJ95r1WjYkS+9zEgPvTOkZ2RbA27aBx3yqYrzdKUeSMutd
         Wp+2+iiCbYuQ7Frx0wB1cgH5xmtDn5YiykmuvM4d3uWOqq3BX6pQpIpzFlNL6Sw3u/5K
         ET5Y3r8Q5QrwdimhxPC+RxDBzN76IQWHCV7qazkO0t6oEgpRYi9YnybeA1ZZRT5Yj9MW
         OeipzFj/pnynDXgjc6GnhiCvG+rh0Z/wgQSFRzL7+Nx8tDgyciMJoKu5UZdf/F1e9c8n
         8zmNXYo3ItnlylUlArhE+rWZWaru19uihmXfxeTS+GKXVTsE/bzBVol71c7liUGYjKpk
         nWfw==
X-Forwarded-Encrypted: i=1; AKwUvByRvXXRY0i6i7hLS2gExzJfBMZ0YwXIbJJGX8wuSsJq0wBAdtqZg5Z4BCklJyWAYGIebizKO+YsdtEqbP0L@lists.infradead.org
X-Gm-Message-State: AFq9FYI9bVQi/+Iy+ogAjsZ50XDg9N1lIBvGu7OO+P12CNyKplUbad/i
	1M6OlIOmHBqo6HVCATdDiCY0ezAWHCAs/Jz1XhH5oQ858tpyAzYQfSglPS0/6OXjlEk=
X-Gm-Gg: AYBFou2NPJLm1XWFc5kSV6SgoXAmzXEZnloN1jxdI1SLNeXZi8G+HxE7wSwwuaYiqPF
	hqooZoqmW3Hay2SS7NYik0US/Q5NJTK0Zqi4eXj48csUCrBYfsQg/fCpJR+b6syuaUpm9kkwNj9
	8zEeGtzv5Ss1DOMdx9GB4UMZvSugd4VLfHWGhg6Bsrh+pjGJNXlFo7tPWNYDB04l2uaxgU0WC2X
	fqJKvRy/NcLedvBl/3mJORPTbgQGlymPpJD5EtmReqXR1k9oPOi8NcqP8zLhbTBRNOsXMERTnD3
	E6TUPcg4zV5j+kdBCCnAaRNFhhvxpwF52FwPbgnubeOYgNRw6BqphuhbJJK9X/TzxXPSIAvvJ6B
	sw5CADRy47NI7fpbTNHFy35w1wyBY7w6ctkvRm3b2XoHTO3sncxtbYKnBfEC1LUm/wxijYr20MO
	O4ClyPYzEPjjyZumUJ4sqUDr6XZjnlHxuNbm6S85I/CfYsMiy4oEcq6LTUphJ6ypufsoyijgzeg
	ScwzMVLpKK5D34MZ9hXU4qJ3ORtgbMejBAxVp6MbnBjATxufBUf7sk=
X-Received: by 2002:a05:600c:1da1:b0:4a1:6425:be69 with SMTP id 5b1f17b1804b1-4a1d7614e61mr143555575e9.17.1792395427243;
        Mon, 19 Oct 2026 00:37:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6674:33bf:38d6:bc10? ([2a01:e0a:106d:1080:6674:33bf:38d6:bc10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471a35sm18346334f8f.7.2026.10.19.00.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 00:37:06 -0700 (PDT)
Message-ID: <f5dc8732-9248-44f1-9337-379991cd5762@linaro.org>
Date: Mon, 19 Oct 2026 09:37:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/2] arm64: dts: amlogic-a9-a311y3-khadas-vim-5: add
 initial device tree
To: Nick Xie <nick@khadas.com>, khilman@baylibre.com
References: <20261017040038.3702428-1-nick@khadas.com>
 <20261017040038.3702428-3-nick@khadas.com>
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
In-Reply-To: <20261017040038.3702428-3-nick@khadas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_003709_910984_D98E6ACD 
X-CRM114-Status: GOOD (  16.85  )
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
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, martin.blumenstingl@googlemail.com, linux-kernel@vger.kernel.org, xianwei.zhao@amlogic.com, linux-amlogic@lists.infradead.org, krzk+dt@kernel.org, xieqinick@gmail.com, linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 10/17/26 06:00, Nick Xie wrote:
> The Khadas VIM 5 uses the Amlogic A311Y3 SoC, based on the Amlogic A9
> SoC family, on a board with the same form factor as the
> VIM/VIM2/VIM3/VIM4/VIM1S models. The serial debug console works with this
> initial device tree.
> 
> It features:
>   - 8GB LPDDR5
>   - 64GB eMMC 5.1 storage
>   - 32MB SPI flash
>   - 10/100/1000 Base-T Ethernet
>   - AP6275P Wireless (802.11 a/b/g/n/ac/ax, BT5.1)
>   - HDMI 2.1 output
>   - HDMI 2.1 input
>   - 1x USB 2.0 + 1x USB 3.0 ports
>   - 1x USB-C with USB 3.0/DP/PD
>   - 2x LEDs (1x red, 1x white)
>   - 3x buttons (power, function, reset)
>   - M2 socket with PCIe, USB, ADC & I2C
>   - 1x 4 lanes MIPI DSI
>   - 1x 4 lanes MIPI CSI
>   - 40pin GPIO Header
>   - 1x micro SD card slot
> 
> Signed-off-by: Nick Xie <nick@khadas.com>
> ---
>   arch/arm64/boot/dts/amlogic/Makefile          |  1 +
>   .../amlogic-a9-a311y3-khadas-vim-5.dts        | 42 +++++++++++++++++++
>   2 files changed, 43 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-khadas-vim-5.dts
> 
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index 57bc440fa55cc..8b4e3212be131 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -2,6 +2,7 @@
>   dtb-$(CONFIG_ARCH_MESON) += amlogic-a4-a113l2-ba400.dtb
>   dtb-$(CONFIG_ARCH_MESON) += amlogic-a5-a113x2-av400.dtb
>   dtb-$(CONFIG_ARCH_MESON) += amlogic-a9-a311y3-by401.dtb
> +dtb-$(CONFIG_ARCH_MESON) += amlogic-a9-a311y3-khadas-vim-5.dtb
>   dtb-$(CONFIG_ARCH_MESON) += amlogic-c3-c302x-aw409.dtb
>   dtb-$(CONFIG_ARCH_MESON) += amlogic-c3-c308l-aw419.dtb
>   dtb-$(CONFIG_ARCH_MESON) += amlogic-s6-s905x5-bl209.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-khadas-vim-5.dts b/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-khadas-vim-5.dts
> new file mode 100644
> index 0000000000000..3989ce7a8aff9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-khadas-vim-5.dts
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2026 Khadas Technology Co., Ltd.
> + */
> +
> +/dts-v1/;
> +
> +#include "amlogic-a9.dtsi"
> +
> +/ {
> +	model = "Khadas VIM 5";
> +	compatible = "khadas,vim-5", "amlogic,a9";
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	aliases {
> +		serial0 = &uart_b;
> +	};
> +
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x0 0x0 0x0 0xe0000000>,
> +		      <0x1 0x0 0x1 0x20000000>; /* 8 GiB */
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		/* 35 MiB reserved for ARM Trusted Firmware */
> +		secmon_reserved: secmon@5000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x0 0x05000000 0x0 0x2300000>;
> +			no-map;
> +		};
> +	};
> +};
> +
> +&uart_b {
> +	status = "okay";
> +};

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
