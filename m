Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D85D4106F305
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2026 08:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UGGOyZ7prlXVh9pHu9GCA7jlbWh6d1rxbVDop2nLFFc=; b=WStczmm8ps8DMuEdtQvlSB+xPW
	Aefr1pJJndiAq0pP38psnHkwtdf/QI1pvT9276daMXRKLnLzMZ4rywlGqRuuJtmAf0DtL9c3gKXXE
	xL4a0LbEcP1bHoig50lFxwQ9di8Q8YhSWcFFY/skgyBXYPLo3Z5Z3PVMdMPBVfGVU503bGzs7pFNg
	QPF9wYkTgMoSEUKziwxdOk1NlMq6BznvkrxXwyFd9qKvYrP8aC4rcxovn7HpLV5+RLozqoYblRxxA
	1OyxbjljL8LQzOvm0NXu0mikY1pu/4yz1hfNpPcOaGXTN9xj3K0HnpDFBkHBeesQ+2b8VUaqDMv6v
	JVZ2ruYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gSm-0000000546Q-32Kx;
	Thu, 26 Mar 2026 08:53:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gSl-0000000545d-3BR3
	for linux-amlogic@bombadil.infradead.org;
	Thu, 26 Mar 2026 08:53:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:Reply-To:From:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=gDXG9M4VD8sbt4ubZpnvKniIhpg/LpwkxR7DgYK7GD0=; b=Byeap1uvPeESxxPbzLJ7yvOA30
	cacCuHMhpoXlkJWBCTTQcILQRPztegujuKWYSvFF3xl2oPCOPx3pQ2DE8KftALdkmehYsyrT9ko8n
	ZOUNI6XfcZprzNI1P8+Xse8nIz/0LtGFcCPv7TQ38NH6Hy0jjLlq5Dp3misPPjoCerT5fRbt0Kk6z
	XRKe5V9Ngsyiyj466XJgNC14HkohxQ4nhvZxt5ml5qmYeOT7V4m7j7qWzSSo5TSx4TnXVLFoCnSeQ
	mna2Se2kE2LtCKkTEmhUqbjPIazWYlqZgyN6xk9AYRB0/MzUgJ3kV1NTgFHvC/wGZSGNF2j2EjXMB
	UwS1maWQ==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gSh-00000007nfp-0CgU
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Mar 2026 08:53:10 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso6159075e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Mar 2026 01:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774515186; x=1775119986; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gDXG9M4VD8sbt4ubZpnvKniIhpg/LpwkxR7DgYK7GD0=;
        b=mlZ+E0QiQaXxBBc23fkcNISXWjV7I6izhAUUYAMK4O2XT7I3NjZpcoV6u9GE3GUlT0
         45wBVgpwgwh1oA8yxI8QpH9x8e7EDPljUWyouEamA6V0i9XLbV/SDB2hZ1b7NhexZjnm
         46T5BzoDZ2s2MwumzXsnPDlLc+FvPCzNKgnIC9ZIpOQxG8p5nGjp41z8poLF7ArtfY89
         ZgxR8rpESnUzTCrC3f6thx4buCmlW+TWVr/OA1X4UjlczJ61VWJI5+lyYATXELoiGXoF
         L7FANTrKurXMkbzQZTnRRjDggV3s4rhN4I27e1bx3bTHtcMirehp3wvaM+0OqapHwsw2
         sU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515186; x=1775119986;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDXG9M4VD8sbt4ubZpnvKniIhpg/LpwkxR7DgYK7GD0=;
        b=NI700e5x3kpHIcC6UZYYzBBbYCsZ90qpDDGak/XsjPFcr70pu6qrZAWQesq1pmGnjj
         T6oX6Xono1YIEM61VUBX7tri4LoCQ6KYg1x/uYDE/9yRpBNGtAj08XU3BhXL0rCivkk5
         p3P9FvhHQo/I2vwIu2GZUmivbtH/Skzzgu5Bm7MhYRuvu0nw62AKDE5/7Jqx/Au0un15
         TBjQMY589WoEL0WDTnN3fDlbxBdOZuUJK1s1Vlkyx0KCSAkqwE5/c6bjJtXGuqBIcKdu
         WhkE9i9ocKMnNuFoSYb6SXp+9Ik8gvqn2PZ9nwXMv2YbZEObb6h0jUt3MuS5eg1U9qZF
         6GTQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/y5Ge78GvGur653sizOjk2HyvN8JUW1BVOcltJgepk0+4aKc6TrjAhlCY01YijcctIIYrbTpCg61XLj+r@lists.infradead.org
X-Gm-Message-State: AOJu0YzKNC2mTKHEmCBA4DsPTTIAB2NJEr6RXbWLe4T2Hosf3a63iSqQ
	7UYa+7oz3xvYwIxAF2gVx1CJsxpUbg9gOHr4pwrAhkgm5Uhz/sVaH2uJk/jYhOtwxs0=
X-Gm-Gg: ATEYQzykFmvrKAqMppNS8hKBb/2nFv3hS6z+yajnfVGQN6Mi8YQGZYYkxq6GZFkIC44
	PRl+55CR6eusazH331EvTxhFvG064K7hWyfTKCwwhyJx12ayEwCnS8wfZt8LOlJAivmPof3ppWP
	5FT1LaHsZAofJ9MgXIrraYIJ3Ec2o9V5YL1gg/dMnYkb6aa96p3wZJqQr9HbA4GTLPCXj9bRNUP
	KsScTsFDlooVse7qBH98ilth1+L6rDeQ1qZLFpsQ4OCbRO/gBFQKwN2EC5XRHUEOQHZUwEV+PIa
	/K0PfHHyOzIzY5n48ij9neLitp1b4xjok6sufi1lc5Wo+l+YtjKzdAh4T5gTPK+DZNiS7mBLjHw
	iJe1mE4okAJsOE1c7/OP4TVf6yn6L2F+bm4QKavI6PLX3ndZ3m4VISfax/BoZLYJrxWEU0e7Ef4
	L8Nnn1wyqrQfriNk3XaNmzHn+lVP/iA1vjJ0aq/iq+G3b8X6cebCQhf8cjd942udfMd7NKxRwOp
	oMRZOo=
X-Received: by 2002:a05:600c:c490:b0:485:3ff1:d5ed with SMTP id 5b1f17b1804b1-48715fc7437mr97262695e9.1.1774515185800;
        Thu, 26 Mar 2026 01:53:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:8431:f88b:714d:f78d? ([2a01:e0a:106d:1080:8431:f88b:714d:f78d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919e708asm5819184f8f.36.2026.03.26.01.53.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 01:53:05 -0700 (PDT)
Message-ID: <d39c0e43-8c62-4a41-895a-5384dc365c2a@linaro.org>
Date: Thu, 26 Mar 2026 09:53:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 5/9] arm64: dts: amlogic: t7: Add PWM controller nodes
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org,
 Nick Xie <nick@khadas.com>
References: <20260325-add-emmc-t7-vim4-v4-0-44c7b4a5e459@aliel.fr>
 <20260325-add-emmc-t7-vim4-v4-5-44c7b4a5e459@aliel.fr>
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
In-Reply-To: <20260325-add-emmc-t7-vim4-v4-5-44c7b4a5e459@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_085309_079011_E90E7C9F 
X-CRM114-Status: GOOD (  12.56  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 3/25/26 10:15, Ronald Claveau wrote:
> Add device tree nodes for the seven PWM controllers available
> on the Amlogic T7 SoC, using amlogic,meson-s4-pwm as fallback compatible.
> All nodes are disabled by default and should be
> enabled in the board-specific DTS file.
> 
> Co-developed-by: Nick Xie <nick@khadas.com>
> Signed-off-by: Nick Xie <nick@khadas.com>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 63 +++++++++++++++++++++++++++++
>   1 file changed, 63 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index eb09a26bcd0e0..581cdaebfe637 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -511,6 +511,69 @@ sec_ao: ao-secure@10220 {
>   				amlogic,has-chip-id;
>   			};
>   
> +			pwm_ao_ef: pwm@30000 {
> +				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
> +				reg = <0x0 0x30000 0x0 0x24>;
> +				clocks = <&clkc_periphs CLKID_PWM_AO_E>,
> +					 <&clkc_periphs CLKID_PWM_AO_F>;
> +				#pwm-cells = <3>;
> +				status = "disabled";
> +			};
> +
> +			pwm_ao_gh: pwm@32000 {
> +				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
> +				reg = <0x0 0x32000 0x0 0x24>;
> +				clocks = <&clkc_periphs CLKID_PWM_AO_G>,
> +					 <&clkc_periphs CLKID_PWM_AO_H>;
> +				#pwm-cells = <3>;
> +				status = "disabled";
> +			};
> +
> +			pwm_ab: pwm@58000 {
> +				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
> +				reg = <0x0 0x58000 0x0 0x24>;
> +				clocks = <&clkc_periphs CLKID_PWM_A>,
> +					 <&clkc_periphs CLKID_PWM_B>;
> +				#pwm-cells = <3>;
> +				status = "disabled";
> +			};
> +
> +			pwm_cd: pwm@5a000 {
> +				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
> +				reg = <0x0 0x5a000 0x0 0x24>;
> +				clocks = <&clkc_periphs CLKID_PWM_C>,
> +					 <&clkc_periphs CLKID_PWM_D>;
> +				#pwm-cells = <3>;
> +				status = "disabled";
> +			};
> +
> +			pwm_ef: pwm@5c000 {
> +				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
> +				reg = <0x0 0x5c000 0x0 0x24>;
> +				clocks = <&clkc_periphs CLKID_PWM_E>,
> +					 <&clkc_periphs CLKID_PWM_F>;
> +				#pwm-cells = <3>;
> +				status = "disabled";
> +			};
> +
> +			pwm_ao_ab: pwm@5e000 {
> +				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
> +				reg = <0x0 0x5e000 0x0 0x24>;
> +				clocks = <&clkc_periphs CLKID_PWM_AO_A>,
> +					 <&clkc_periphs CLKID_PWM_AO_B>;
> +				#pwm-cells = <3>;
> +				status = "disabled";
> +			};
> +
> +			pwm_ao_cd: pwm@60000 {
> +				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
> +				reg = <0x0 0x60000 0x0 0x24>;
> +				clocks = <&clkc_periphs CLKID_PWM_AO_C>,
> +					 <&clkc_periphs CLKID_PWM_AO_D>;
> +				#pwm-cells = <3>;
> +				status = "disabled";
> +			};
> +
>   			sd_emmc_a: mmc@88000 {
>   				compatible = "amlogic,t7-mmc", "amlogic,meson-axg-mmc";
>   				reg = <0x0 0x88000 0x0 0x800>;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
