Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 548F5F557E6
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Apr 2026 08:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WGM1Xnzj6FHw5AR+bAa0ZNiF0c4wJE0EFZxzBp5FtbY=; b=2Rwb82RapUa0QtWdcgZh5p5cNJ
	DtKfSvi5qIh6cpLHrVaavkw/ANGiuKoMC0lNsPtd2dRJ+kIAxAVq3cXxImJihnMvYl7xeWGJ8u+1m
	Ebw0SWJ8sx28QS9oQNPX6G7ZrTnvTOsgnRjZ+4C2w/cnsyEJneLJnsCQdB2CZT7uyNod4oCu/zcmT
	BLdCDSZxY9y6zC8Y6BKRSXpwLitsgVDlnL7XF4T2OMvAMM74ZBXYT/2cRQ1o2Tox8l15zmITWlyF9
	VoV1yOxtBLMhNBi95c5FnNS++dckVEAzSz6QJJCZAnnv6BbERZwPyOHzexHgRFNWbq4DCE/vIDbZA
	zFeLhqYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkIP-00000006coe-3q2L;
	Mon, 20 Apr 2026 08:47:57 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkIM-00000006clm-1yxj
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Apr 2026 08:47:56 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so42603185e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Apr 2026 01:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776674872; x=1777279672; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NaJMjyFqsRA9dHCRFFX9QB7tuTN0E26/VMHzuIS3hEg=;
        b=xuXwn2i+gNeJG2+2EGoktDPZfnTIOTFtFvYX/7wlo6cfPFw/TyPRFvDGWRYHnvHQLK
         gCu6prpiKANKtYwPmh3ZzqdMJcaP15PF3Nq0w9z0ao+nErycwHte3vWGRq4z7l74c+QF
         JVveEu3HzciU7SXHV89NdHvKKqsyPSrskFXXkv/Yo+0ZsjGU6S9JjaEBo9SK8/bbJA2X
         s72ISDCODtZwuuQh0lxPSjcG0diDbuhBZuxc5wyvUkJ1qRCM5eqhVanhajrYeU7Vqj6x
         6lP+ywsPTZrXyLDYYhLOiKvG4tFboWSMDs2zr7rvFHBa6AcN28SyfytdS810uaFXrX/+
         1myA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776674872; x=1777279672;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NaJMjyFqsRA9dHCRFFX9QB7tuTN0E26/VMHzuIS3hEg=;
        b=r6do5Ml641FZHnAc/LAwC0y4wAwsWygjVLO3gqy1HlN/eQW/zb8xylVTdCVSYniLoa
         MBO78DlRP6jIG+9B65PaSRTgUgLf8RmZ5x2FJ03KxZcShom5AsrwLyHfApDTaZ6eKdu4
         VXD9kLaCibBBixIsBz2LMSvzvDT6TrG/mnRrWPuiORq95b/+T1DZH/XtLUXLpHh8GZef
         7Lf+TWSPARQJybZ5UWgGFv15eiisGzIwLQHshCHwXTreR4o+vQaayveJTJDLrVJy9mC4
         4oBYUktbXvTNyJAzJQbxdESzmtYO3WdhxyXunRF+Ym7XK+gJJPuiLcp4p3BRbJMWTNuE
         LxyA==
X-Forwarded-Encrypted: i=1; AFNElJ/8LvpdnAU2wK9JMueq2ZjKb9GGVUYDuieDu3HQT0TRGqdQgRDeFIiFWdAXXUx9rgj+gPhpTCtlbly4X8U3@lists.infradead.org
X-Gm-Message-State: AOJu0YzxrSLfdBiQl2u3g50NvqHlR90K8aXz/YKDHHncPmDE3GsIC6Hm
	cDW0WZc30F6tsQM03DwZBB9YcK7vI3dRUziAQ8pwUjmmVx/hgUqsJRNxZ7PBbHYkJ6gYZsa7fQv
	GfJx1i2Q=
X-Gm-Gg: AeBDieulg8XfQtlWBF5DO3j1G6w0cW1OwUYd0hwWsYRXYR5N5L6/LarellQVTrJszEG
	7fk2m2b1gxc+oczlE0JO/rFIlaiXNy+bp5HWA7UyHMK6Ggk1d0g6S4KnYWBpnKncfuAYwo2QjM7
	fBYjrCfxsZc+vtzSSQ0j8sQZ3R7Bf0imUNMyNYxMbdW4lUCY5AUQ2fnJHhYJDm1kGHeQ+xbxr7q
	lxn1+9IhNeuXb+iWNHbiVrXFhWX2YznXf508fFa3afwX0ZkZtMZ1NZn6MoOOf372KUCj/rlKny+
	vC80T8DXxof13Kr9uRlCF1cycHm2doLcuQEQywztfluXVb0Pj6c11nTz3vwDJUzZ+DWrAFVfbOm
	hDsf5IhWJcPqej0GrLMHrpqSIXN8MzY722A2/6vC6Js2PCJZYF+q9LMzznr+f74ln2ety4ZsuGQ
	8XY/Dc7LgjFuVcpJa1PyH+maoN9771mmTlwVOgS4WseIEEopGgrogJ4ElPJ8hNNbjRNK7Kub9hi
	UHm2bCHCgGKoD8tqg==
X-Received: by 2002:a05:600c:c05a:b0:488:80b6:873a with SMTP id 5b1f17b1804b1-488fb771be4mr138962075e9.21.1776674872448;
        Mon, 20 Apr 2026 01:47:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:8290:9fd8:8af0:67dc? ([2a01:e0a:106d:1080:8290:9fd8:8af0:67dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc17f642sm246815005e9.5.2026.04.20.01.47.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 01:47:52 -0700 (PDT)
Message-ID: <b6c2615f-74c7-4a08-88e7-0cf0842687df@linaro.org>
Date: Mon, 20 Apr 2026 10:47:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/3] arm64: dts: amlogic: t7: Add uart_c pinctrl pins
 group
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260416-add-bluetooth-t7-vim4-v2-0-9a57098fd055@aliel.fr>
 <20260416-add-bluetooth-t7-vim4-v2-1-9a57098fd055@aliel.fr>
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
In-Reply-To: <20260416-add-bluetooth-t7-vim4-v2-1-9a57098fd055@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_014754_595609_26D70F91 
X-CRM114-Status: GOOD (  11.29  )
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

On 4/16/26 10:54, Ronald Claveau wrote:
> Add the pin multiplexing configuration for UART C (TX, RX, CTS, RTS)
> in the T7 SoC pinctrl node, required to route the UART C signals
> through the correct pads before enabling the controller.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index 7fe72c94ed623..4a55d9641bc9b 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -553,6 +553,18 @@ mux {
>   						bias-pull-up;
>   					};
>   				};
> +
> +				uart_c_pins: uart-c {
> +					mux {
> +						groups = "uart_c_tx",
> +							 "uart_c_rx",
> +							 "uart_c_cts",
> +							 "uart_c_rts";
> +						bias-pull-up;
> +						output-high;
> +						function = "uart_c";
> +					};
> +				};
>   			};
>   
>   			gpio_intc: interrupt-controller@4080 {
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
