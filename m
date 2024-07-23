Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B667AC3DA64
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Jul 2024 07:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vOqETByMxmyiFlZeH5JSlVNu1xzi9WrCvhfcAGdmUzk=; b=bOMYcGtsFAMlZsR7Ja2XrQa/0J
	QEMjpHWlsXllC9aBROSj9kvuDqs0rB9KcMOYs4e/0otVtdQAAy2raG72I/p7f13UOSbeEIOu+J910
	AY9F+wcRGkFQF8DD8bZFu3LlQBczLDpBGw37MHHIQqY22cury558joBbw+Sfe2Sl3TOQzayeBgmRl
	zoPGxMeDRd4aChAi+svTj47XrFJJJl2JrZsKDItKJpdC/Uearq9zdTL1u7pifyAxoT9pdVQjjUoVe
	ToEqlPwOXc3Y6vf5M5s2sW+0Ku3EqRePe9yet2J6L1PZ5wcW02SBuw+4EnkZEXD+288eMfpfK565x
	T1Ym+kig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW9nF-0000000Bh0x-40w3;
	Tue, 23 Jul 2024 07:18:41 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW9mf-0000000BgmJ-1a2U
	for linux-amlogic@lists.infradead.org;
	Tue, 23 Jul 2024 07:18:06 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4267300145eso44492085e9.3
        for <linux-amlogic@lists.infradead.org>; Tue, 23 Jul 2024 00:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721719083; x=1722323883; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mcxIzNk1NcysMQw3Lkhzk9zPofUtDz/QMRqmXV8AkAM=;
        b=c3lH3+2W8PdBteszYWGVY0PNnL72f0i+gQ6nRv/1HkaNA4y3F7F8lux8KdbgjVfeV5
         3NHvWPmkXyHgiz4ymu4ZIinGNrwvepRvl6GIbE9vBGxKZEnDfb6Bp1w3yUa3cXB/XWK+
         EvU5IOn4HTh1XzOstNfpw11Qw2fk7dh+85j4cqY5Ebmy3MC/PP57olPdM2rJpRzxVSpL
         ayIOQr8xPMwpoGk9WE1WGnmAYdNGlYH72gf2nD/5WZVi2k7u7ZM3Z2WQ8cDmLwRIaLam
         hyZsV3trgjUBLR8q0M963moljpTIY6Zu6FSriTCcc3rYDWelCAFKLySxsivLfDJDmD/Z
         LJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721719083; x=1722323883;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mcxIzNk1NcysMQw3Lkhzk9zPofUtDz/QMRqmXV8AkAM=;
        b=cYDI+Ragz1FpJ8HMFGUg2fdNPJQUUWxaCSUljpHj1hPOvug5ehoIA/VR1e0lIoZxPT
         AzM+/7oGU3zdO5LJs0lKBysUQpYAjy2i+ohFcS1A4g1XCGK8idnIL80NN+i+AyAXN8Gm
         m1o4k4kizMeo1WkvZ1UL4xlOM7+Hqm9WiCEwz7jJ3SvPzH83w3id/PdriI07owCuDLMY
         LpOJKSuLhGSJKX2/uvo3vaOObksJGvHNiGjAQqYObn7e6Eu1QzrkjOA6EGRTJsxLHvIB
         H+Ali8t4oSNwC83htNSpPC1kT4iLPngCq5fm5RYuJRk5FoPmmfsNIgZvmfawdaVBPnB/
         Agzw==
X-Forwarded-Encrypted: i=1; AJvYcCW4Yfnx2tsJeX6hS9LLBKpEtiLcFr7u1nsNxibdk8HaTPqzbvY9hCT1UaxMoSG75D0iK6l8yu+dYRKcFKSyujQgJpR/OSIoMtcI94LMGFBqtGo=
X-Gm-Message-State: AOJu0YwnednguwDzBonbZ1Kj1Q487EQPd9+EgBBQfTUwIneTAUSyERSZ
	k/JIxAmIDVlLt/CBletOcLHyp/iohQNPJ2c/lVdt2obaZuiQIFjamg5JKfmwtyBNXmYMz7zE+z1
	Y
X-Google-Smtp-Source: AGHT+IFFdTHuWg+LUsVr7z6qMgnlrrvqaYVs4iJtYB5jKxSr1QnXFxYn2sbe1HLkfWcOBQKhAJQEVg==
X-Received: by 2002:a05:600c:4509:b0:426:6e9a:7a1e with SMTP id 5b1f17b1804b1-427dc56b84fmr68985125e9.35.1721719083049;
        Tue, 23 Jul 2024 00:18:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f9d3:b429:5f14:dc9c? ([2a01:e0a:982:cbb0:f9d3:b429:5f14:dc9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d6936e1esm158776455e9.44.2024.07.23.00.18.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jul 2024 00:18:02 -0700 (PDT)
Message-ID: <615b5cbf-48bd-464b-9d75-a3d9c5566819@linaro.org>
Date: Tue, 23 Jul 2024 09:18:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 5/6] arm64: dts: amlogic: t7: add ao secure node
To: xianwei.zhao@amlogic.com, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20240719-soc_info-v3-0-020a3b687c0c@amlogic.com>
 <20240719-soc_info-v3-5-020a3b687c0c@amlogic.com>
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
In-Reply-To: <20240719-soc_info-v3-5-020a3b687c0c@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_001805_454357_30D4B6ED 
X-CRM114-Status: GOOD (  12.80  )
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

On 19/07/2024 10:08, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Add node for board info registers, which allows getting SoC family and
> board revision.
> 
> For example, with MESON_GX_SOCINFO config enabled we can get the
> following information for board with Amlogic T7 SoC:
> soc soc0: Amlogic T7 (A311D2) Revision 36:c (1:1) Detected.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index c23efc6c7ac0..ec743cad57db 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -194,6 +194,14 @@ uart_a: serial@78000 {
>   				interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
>   				status = "disabled";
>   			};
> +
> +			sec_ao: ao-secure@10220 {
> +				compatible = "amlogic,t7-ao-secure",
> +					     "amlogic,meson-gx-ao-secure",
> +					     "syscon";
> +				reg = <0x0 0x10220 0x0 0x140>;
> +				amlogic,has-chip-id;
> +			};
>   		};
>   
>   	};
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
