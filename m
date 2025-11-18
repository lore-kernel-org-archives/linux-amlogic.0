Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561F7CCD19A
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Nov 2025 07:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yBmteP6BTMz8ibzTuG56JrLYGezEey2qFZEbK1F4QeU=; b=T7JG68vo6y8RJ262bGHqTTGowi
	LkFsHJh/a7cE3ziEhj6R5pSeMFOPbdhX7UXCBWSDRbQx0CkkulkOu+1mKKFof68oIDh0pI+Qd7Iaf
	k3ec/u/MF2rgF1ifm6v1GioGdC01FJdA9ouU4XJ1Q1QeKL1KIEtRUwOOC0fIXu9Nwc8V6DT0BJx6N
	CR2DL/KuNMjJRiQUGE7bUxXTjGTVyRBiBkVjmyfcxpCEx36dNM/SazgJrJXBKFGBZw8WwC1fXzum9
	YkPCUx1X8t9bwryUEBvXbpe/bT05Y7mkMnHvXF9Ak9/jqVL4VeDWoYuFw+kk57ToJKC1qb6Jl160l
	MrqRAOvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLGbs-000000000iz-1tVE;
	Tue, 18 Nov 2025 07:58:44 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLGbn-000000000gw-2Cgs
	for linux-amlogic@lists.infradead.org;
	Tue, 18 Nov 2025 07:58:40 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso18818115e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Nov 2025 23:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763452718; x=1764057518; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bX/rwpSeSV2xaHQKCSrS8dfq2AEp8R4hePQzRfPkN5c=;
        b=mnWnnwWYX8/MqZhCe8zNn0cYnjt+IXldboMvzpgTdc/GRIeaRggx13/s1s1GBXybuk
         UToa1iSn3IZ+mEFeP3JWLzOt/RinJ06U7PAjZQywmpESQsq5eydJPi8Z1s78r6zHK2gY
         F6s6M0jprAb94fkdhV7X/mioplIEmIBz2DUw+z/pLdpvR1MEwB51ERIyjI0tT7DOGfOy
         noDivBpruAkQHodOsE60G6X1/+GWz9BxC3kV8spCh0Xr9PwHSrBWVv/oF1KoFFWh8hO3
         o8sdQXBQ6rSmv6XUoAogFmkseM5bOs7CHvAXpgT/BC5eA6LuHWwEWSkqJmABcJnMYAIK
         Odxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763452718; x=1764057518;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bX/rwpSeSV2xaHQKCSrS8dfq2AEp8R4hePQzRfPkN5c=;
        b=gLu+1ou5z+o0LOV6ayoqe4Vuuz+i3sgdT3uj5V0IKfpaf5EcdH3vxJrbttqGbf0OZf
         QEUsqlnxxnR7nxJrrlsVbCzVK02EBssWykqW8ww6AdvTFaRTWN4I5zMkgfCF0rNhVJHA
         KhwILRdI5pYlT7lzvNTiUXTRIjCcAMwQkc5OQqpX/vnCLazCpTLKOB0JQ51ovuVr0oRF
         6zQLoXAiiNxeE61isQihj5afCnW4+HkUErgRSaB/vcKj7vfrEP+Ovj134hIe9gGPHoib
         GkqgwtQdAYdEVUn7yaWHyP9orOupBBDeOEhce8SVfLaT4RfgEGH2c1mC/ZWBCI1TRtYL
         t4Yg==
X-Forwarded-Encrypted: i=1; AJvYcCVcjuNo79cBRYL1E6XEngNnze1Lhu5cFD8094Cyw1PxJmwXGI/bSekbOgI9DsHMQYnkSbrWAvqVJ/kaOQ2w@lists.infradead.org
X-Gm-Message-State: AOJu0YyzAVIlEyqcPJCI5dFjuTL5yWVFgyFBahArTeQuYEFlcEZufZed
	bBeV/GyWlNmvVGABXT/8x8JxKHlmmes0ZnNVfOYpWR/Z0/1uHb0vBFlSvh5OEEb/pDE=
X-Gm-Gg: ASbGncvNV7EAoyndComdbFj1N2C7Ak0p++F0H9zMICjGhkSUDabbzliMoGhSVY4Zmhf
	SY2IFLet0/3xqqp1OSYdF5BQFvsyzEQTXYJWBoT3ItScPzLsra1tf3YHW8hQ8zReXX+EU6nWrpa
	k8VJhwdFuIf5BVAV4mbL9C3miQ+U6Aj2Hg3VBbj87FVquwzeUWxB1Kj3Ju6EqrrWQJnRHSlx8W1
	dK/NWFOWjfPrU7b8PjQWUAwWVMvyWaD9Wh+o6QHmqoEsN5cVb5joDJK4kkN/h0BiZK4heD7tO9P
	6DUqv2JhCcFVeJZjB7ty56J2+8UcB9+6RJIFthrKjHdorbMiSxHwe1EwEu0txJExZL2CXq95dm9
	NGkWQZxr35emkLab9zESG4syJk8CrJ6YOG/f9viCEEAhRa+5Ks5Dw7B91ZcZO4Epi6knYd6kvoM
	1y9Yf3a1BFSAK1DXF+0QiGsPaFt9VOdFzg6dtnx9WC1jjrwfs6BvROI9mubAJatzfgX/72HIPvW
	w==
X-Google-Smtp-Source: AGHT+IGGMGuWR5iFvUAotvIf2624yfKAl5P4i/kOrg7Ysa5w1iKe5V5T2MxUIaMHspzvFrmXKuRKxQ==
X-Received: by 2002:a05:600c:3550:b0:477:76fb:ef18 with SMTP id 5b1f17b1804b1-4778fe9a5demr136227835e9.25.1763452717637;
        Mon, 17 Nov 2025 23:58:37 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:366e:5264:fffe:1c49? ([2a01:e0a:3d9:2080:366e:5264:fffe:1c49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787daab3fsm377307365e9.0.2025.11.17.23.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 23:58:37 -0800 (PST)
Message-ID: <d3f0e883-b580-4c75-8eb7-70a019fb5062@linaro.org>
Date: Tue, 18 Nov 2025 08:58:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/5] arm64: dts: amlogic: s6: add ao secure node
To: xianwei.zhao@amlogic.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251118-soc-info-s6-s7-s7d-v2-0-38e2b31a88d1@amlogic.com>
 <20251118-soc-info-s6-s7-s7d-v2-3-38e2b31a88d1@amlogic.com>
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
In-Reply-To: <20251118-soc-info-s6-s7-s7d-v2-3-38e2b31a88d1@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_235839_739682_FC552D1D 
X-CRM114-Status: GOOD (  12.16  )
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

On 11/18/25 06:59, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Add node for board info registers, which allows getting SoC family and
> board revision.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
> index 0dca64a2ef9e..da3e607aea85 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
> @@ -199,6 +199,14 @@ gpiocc: gpio@300 {
>   					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_CC<<8) 2>;
>   				};
>   			};
> +
> +			ao-secure@10220 {
> +				compatible = "amlogic,s6-ao-secure",
> +					     "amlogic,meson-gx-ao-secure",
> +					     "syscon";
> +				reg = <0x0 0x10220 0x0 0x140>;
> +				amlogic,has-chip-id;
> +			};
>   		};
>   	};
>   };
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
