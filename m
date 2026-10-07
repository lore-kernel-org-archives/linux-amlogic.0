Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FEA4CA5FF1
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2026 12:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CB/Y0/Ao7yp3RSdm8yDLgpUunsJFi5a0vg92ky60yqs=; b=xO6WdOOg/uXMF4iCzqyl157AGE
	XqIkPxEVNyQJintQ47WpOrIAGfBSn98vvUY1ILC87Y+OJKp62mcspUlnOsivvdILKnlF0PhsFfwit
	io9Ug0Qfk4WJnoYfxSeoTTPY6kBNjWqCE3ZlR479moZ+R0nBnhrj3DYpjgrNMCkoyk8NN6n7+O/4U
	SPEn207rbSW3hiZJwvs1uJW2g/bRMTKLn2VVvgSv6U1HatSUDuu7/KvPaOAbPE7wLEhG2BWP7j173
	KcUM9ejBW9UB/QG3bK0kDnbicW52KJFTqMamNbfXjVhqV6DMRicNj8mvyZjSmSp+vPU4z9anOWKk5
	4bFzL8YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQpu-00000002S8p-3uCK;
	Wed, 07 Oct 2026 12:33:30 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQpr-00000002S7X-3yIJ
	for linux-amlogic@lists.infradead.org;
	Wed, 07 Oct 2026 12:33:29 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48b0d19cf7eso1284171f8f.1
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Oct 2026 05:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791376405; x=1791981205; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sto7ylfghKrxF0yVdAjf8Y/DDquUXT6FEKrppsRxI2o=;
        b=k9gfs2srXeu8WGkgvk2Z1gD8NhBrgeDrMW7nr3sKRJZ5LDwo+DgHcI/C1XQBjPVlXq
         98kRjfG8CbkIVxW4GUgoruCK1VmHczsWcpVBfkbIrf2EENlkovPJuWT9isNfVuwa2cKh
         43tndhC8dVZHnRMywmnkJ9bHlv5c3BaD1EZRZe8dOA79BeJK59Ao7x4R3QRJtUgTTKqg
         3FLG0/ytS7KWDq2PjiS+4fCZi+dRWPGpgGtTgYsy7qowmapP73uThRRN6igW7OCaG5ad
         flSfZrZFqgfA93rp9A6M9EPQwFZrNDUQlWqsKIPBO6oR1/QpN/Q5rIOhqllJszITQu/S
         iNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791376405; x=1791981205;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sto7ylfghKrxF0yVdAjf8Y/DDquUXT6FEKrppsRxI2o=;
        b=zowbaIKr87Jza2Y+0wS0EtBS2e6ncJAghVIPT5tRI4rhyh3WSoVjgl7oQBbFZMo5XS
         frsm259LFSedlhBIZFID+2d2X6tlso8yFD3EjUZ+mA8ARIbtD+R1nNIzclm79Ju3TsXG
         hYLaMrJOGlmJjNLw7vVCdjeyp/fb5Y9VvewKN3/rs9QumVNFGVvIJhiyxvRwKM2TYj4b
         mpvMMLxl3x2Ix5zDe578yviPE0lW4H85S7SFKK1LHUSH7NM4P/EhmBlwZuq3yx+jPR/d
         qhmiK31UIkmqdc41HWFeRyIICVtlpwduwPR6BmWugP/ajYHyZKXoccCEH+3Yd8tWIcAh
         ZdOg==
X-Forwarded-Encrypted: i=1; AKwUvBwmxK+X0qHy07bvDkbXyYofJfvmf9WC5gROBglbrZWgK90Kp3nfcHBdmLbj2C6O5ITEXOFIDTKTfNQFIlRQ@lists.infradead.org
X-Gm-Message-State: AFq9FYI6mYDJzLgmeHLcBVzbdP9a/+QJ4IREukSIvztYJxfI23id9dsC
	Ya6omuZhgBScD01/xDZHjhn9kPbqEm7LnjxusgojqvZEzQ+JasVcZtpjgl1HZVSZxdP1+qcdgA3
	oijvYRho=
X-Gm-Gg: AYBFou3srhhVWscf1BEzg2P+vT7A3sn7lHOWtjn+bxA5EtRPhFxVeZX7LJcQMocf/A8
	150mqWqpX3CBa+TC9BC9m2svnn3bPq2kyxDm2z612GNIdLNOS4wGrZkO/z4V65PiEbHCRJOrRqu
	CPBoNeeFTeNU3ZDe+m1+w3aCjlYt4ozrEaxwmdU9NUwyeU0CtTrbekZYzWjx++WjnT1kgtJrQCj
	c+fhboiWNw7EM1N/Wi9hh8xWkMrCiCD9qxNlpXowMcFwoA/O18RmhXwpjs1dW6BzZZF9u9yBPcp
	uJCAk+ojOBq/FbfrpojW11eeiWTBHPpaHH0CG2qEL5J4LzdObvK/OhFKpcBC7BEP7SwQoEMKINv
	oQEZj0depsBgqmIs0Yt7DA3UOGt1Pc1j2f2JvG8ZIehpTRkArcQ2GR1ukzBfiLwPSER20DvQ9DB
	wqAy3fFtLTnsL1kHuFO6L/GHhBjkhGtoNbJwfuhDMmDt96pQecCIE7O9kLY1kWfNNLpZM176rQE
	M7UvjRNA8nODqga8rwIQ4/kQ2VQBpRH
X-Received: by 2002:a5d:6184:0:b0:48c:54ec:ea3 with SMTP id ffacd0b85a97d-48c688c031amr8414035f8f.13.1791376405104;
        Wed, 07 Oct 2026 05:33:25 -0700 (PDT)
Received: from [192.168.151.46] (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3d3eesm5973138f8f.53.2026.10.07.05.33.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 05:33:24 -0700 (PDT)
Message-ID: <15a6f5d5-fdf2-43e2-94bc-3e87c4eea122@linaro.org>
Date: Wed, 7 Oct 2026 14:33:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: amlogic: meson-sm1-odroid-hc4: add the fan
 tachometer
To: iav@iav.lv, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20261006-hc4-fan-tach-v2-1-e27ad96e92a2@iav.lv>
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
In-Reply-To: <20261006-hc4-fan-tach-v2-1-e27ad96e92a2@iav.lv>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_053328_203004_89E81460 
X-CRM114-Status: GOOD (  15.72  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 10/6/26 18:36, Igor Velkov via B4 Relay wrote:
> From: Igor Velkov <iav@iav.lv>
> 
> The fan connector routes the fan's tachometer output to GPIOX_7, but
> the fan node does not describe it. pwm-fan therefore registers no
> fan1_input, and the fan speed cannot be read.
> 
> Describe the line as the fan's interrupt, and mux the pin as a GPIO
> input without bias: R109 on the board pulls the line up to VDDAO_3V3
> (schematic rev1.0, sheet 31).
> 
> Tested on ODROID-HC4: fan1_input reads 0 with the fan stopped and
> rises with the duty cycle, to about 4200 rpm at full speed.
> 
> Assisted-by: LLM
> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
> Changes in v2:
> - Mux GPIOX_7 as a GPIO input without bias (Neil).
> - Link to v1: https://lore.kernel.org/r/20261006-hc4-fan-tach-v1-1-4e7cecf0b45b@iav.lv
> ---
>   arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> index 5f15c2299509..64602aff1d81 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> @@ -21,6 +21,10 @@ fan0: pwm-fan {
>   		#cooling-cells = <2>;
>   		cooling-levels = <0 120 170 220>;
>   		pwms = <&pwm_cd 1 40000 0>;
> +		interrupt-parent = <&gpio_intc>;
> +		interrupts = <IRQID_GPIOX_7 IRQ_TYPE_EDGE_FALLING>;
> +		pinctrl-0 = <&fan_tach_pins>;
> +		pinctrl-names = "default";
>   	};
>   
>   	leds {
> @@ -114,6 +118,17 @@ &pcie {
>   	reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
>   };
>   
> +&periphs_pinctrl {
> +	fan_tach_pins: fan-tach {
> +		mux {
> +			groups = "GPIOX_7";
> +			function = "gpio_periphs";
> +			bias-disable;
> +			output-disable;
> +		};
> +	};
> +};
> +
>   &pwm_cd {
>   	status = "okay";
>   	pinctrl-names = "default";
> 
> ---
> base-commit: b44e2be772f866985cafdf90355285069ea68495
> change-id: 20261006-hc4-fan-tach-440c1b874a04
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
