Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA868C79FB9
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Sep 2026 07:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JCwpz0GRih3kAbPMaDTRMFB+ZP1OXWKPHH4LK3qiuX8=; b=WhBqGDKuF9OiMga6GgDv59+bGU
	Q8w5AqEf6Z9C3OWzQzeuhvxnd4auM5u9vdXKhCTsbxO76TvS7BieODP8KYSZAK95aUlWNIUOQ/Cmb
	ll3Q3vmoWpYuKt8dimg5emNjMH+/7GP4wosRf+CTvklErplGXe9bFkUKTsV3lLpuliEqJpVo66TIX
	Y/QkJVrfS+xx3ISIkp238Ggxb4YAQmP98GTdUjrSpVmO7L238K0uPBQoVDx+9+y36ZyirhY2cTFmV
	Q1iOTMAYcrs0GkpBlc8qBy8haaI3q5sdEJtTrHjbFNKDyLeiVPiok+VG2+yLFW8/yOOK0knJxjQYu
	Mua0W9sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YzK-0000000DbU8-1tDy;
	Thu, 10 Sep 2026 07:14:26 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YzI-0000000DbTH-0NLu
	for linux-amlogic@lists.infradead.org;
	Thu, 10 Sep 2026 07:14:25 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-4843e9c5960so6340677f8f.0
        for <linux-amlogic@lists.infradead.org>; Thu, 10 Sep 2026 00:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789024462; x=1789629262; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JcyMbgDgyo89MWk1toywy6KeNj1X5yjPwiq8FggZGfQ=;
        b=b1I0qHtr2qPsk/CocS+cmdj0Spr2Al8vgl0aJGXfNKSEIS7taZSMVIZe38k+zt9E2q
         AqRPgLm/XAqC9SSWlXB3nW2jtxJcHcZUMmZBC4aY+oUfmju3yRUiqZmGCUG1Os64O5g3
         Zkc55iE6m0FDF4Va49tOP2WNgXsJrvAYY6L21NztY99F2yw5d7eDhL6RN+1BM+P35qlZ
         cpwfQd4IkljNWq38g0d2iR2P0HqzyQVUpszHjvqBhS9iRlefLShXtxmkQqxdQjiSIHK7
         0LtVtwnxfNB+40GIIRQj41DR0tUqmQ5TV1048BbltwrWuLLaobsGiXpU1baWNbbGI+nR
         UW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789024462; x=1789629262;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JcyMbgDgyo89MWk1toywy6KeNj1X5yjPwiq8FggZGfQ=;
        b=UvB9WmylZrMsXxU1j2pbviZX0EtX+b7XmlR1L5YsaMvnQBmQxG6Hv14KgK/QfjMMfl
         G73HjCBH709V/Ppkdl4xtuK7FKcf2/4g3kkGkzMHIwpbdEYQftX52KhW3pIaoLiL8QUX
         35bFE5rEBoGnbLvAXJG5te8NnuVr8b8KIUM952FQDn0UljvQK+wBiqwqZMNgZYT6ozca
         6y508GyqG0xm1Q+mUSlSNCGoQA4a1+auYNS+E9EDcvryRvxgtM/+qjulSYgiEVViheWm
         2oAbgGp8UPCSu0Y8PBcdrA6MQ463B8pB4IYS4vbWl021ewY79fgOJGgMXAzzkmZiws6o
         eBhg==
X-Forwarded-Encrypted: i=1; AKwUvByZcfumrqzO49MxLMpTEGUikl5CzlFLYLM99OiMlGR77+Beua39v95OkayJr2G9AmTzb3aZSlIW2Q5SggZx@lists.infradead.org
X-Gm-Message-State: AFuF++k4upxInzpP1MSeFr5Sq9FJpb2N75HTTe+XwSyIsDAit0ZIbox9
	TqE2fz6AJnqLwaeUVLc+BWNBXV3i756PrKelEJpQY7Y9hh/bDBg0PjSstYp4TykCI4I=
X-Gm-Gg: AYBFou0KnEwtlPaF8qda+UumNZYc2B9JItbcmaQT6JPWhk85YnzgK6P9X62sOarK4FB
	9Lea/NwbIhxlaSaYZ54MWakNbDz/JyDvpsDWJF/LebUMDJoj3t6ad3J6/fMoTTRsRqkOq4y/dTY
	CY8wwNvWEaIuRSuJQ2ywItV047ybqQMt7AWHR7L6ksypGnSM2gR1c1dPx42qxFc7dhXT8km5fDx
	VwdYTDKKvILrT9rpJ4/oyKmLQdVDpFLr2GolUzr7cCkBWS0ny/uH6FDltzDHmDipdx6gPIetOZI
	R3Clduo0HfE7mEO9AO/RgJE3rp9IBc0bx9L1bopocH67Vmxk/IEPIeMM4YHsh5tdnsX8i9QVRuf
	c8vyuSHfIz30O4g1YYJCgVtW8AMgAOKvDcfiYeAnO7tLZQyVHXWlVTfvBb2uX/rgdgwbwbT5Aci
	2xAeJffzDC9JUjDhi4tnZ9jvQBRATutISTyVx8SxaoZC4J+ShJcigPExEGfx1bHbWMwSXXcfH6M
	kPitXo4GUEpIcWzt/17l+XVtA73CcD1sexpaEecdQOBrsxjIlRBlw==
X-Received: by 2002:a05:6000:25c9:b0:485:ac96:7264 with SMTP id ffacd0b85a97d-485ac967432mr8582029f8f.5.1789024462022;
        Thu, 10 Sep 2026 00:14:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:3caf:d840:c911:29a9? ([2a01:e0a:106d:1080:3caf:d840:c911:29a9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883a9b49sm41176221f8f.17.2026.09.10.00.14.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 00:14:21 -0700 (PDT)
Message-ID: <e51d62c0-7d02-4516-8f03-9d1be8c5c64b@linaro.org>
Date: Thu, 10 Sep 2026 09:14:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 2/2] arm64: dts: amlogic: a9: Add IR controller support
To: xianwei.zhao@amlogic.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260903-a9-ir-v3-0-cd471c667c15@amlogic.com>
 <20260903-a9-ir-v3-2-cd471c667c15@amlogic.com>
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
In-Reply-To: <20260903-a9-ir-v3-2-cd471c667c15@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_001424_158173_5361477C 
X-CRM114-Status: GOOD (  12.90  )
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

On 9/3/26 07:22, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Add the IR controller node for the Amlogic A9 SoC and describe the
> corresponding remote input pin configuration.
> 
> Enable the IR controller on the Amlogic A9 A311Y3 BY401 board with the
> proper pinctrl setting.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts |  6 ++++++
>   arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi             | 14 ++++++++++++++
>   2 files changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts b/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts
> index a6b380ca47a5..389c9de3dc3c 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts
> @@ -38,3 +38,9 @@ secmon_reserved: secmon@5000000 {
>   &uart_b {
>   	status = "okay";
>   };
> +
> +&ir {
> +	status = "okay";
> +	pinctrl-0 = <&remote_input_ao_pins>;
> +	pinctrl-names = "default";
> +};
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
> index b0e0fadeed82..790109aa7c9c 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
> @@ -241,6 +241,13 @@ test_n: gpio@c0 {
>   					#gpio-cells = <2>;
>   					gpio-ranges = <&aobus_pinctrl 0 (AMLOGIC_GPIO_TEST_N<<8) 1>;
>   				};
> +
> +				func-ir-in {
> +					remote_input_ao_pins: group-remote-input-ao-pins {
> +						pinmux = <AML_PINMUX(AMLOGIC_GPIO_D, 5, 1)>;
> +						bias-disable;
> +					};
> +				};
>   			};
>   
>   			gpio_ao_intc: interrupt-controller@4080 {
> @@ -254,6 +261,13 @@ gpio_ao_intc: interrupt-controller@4080 {
>   					394 395 396 397 398 399 400 401 402 403>;
>   			};
>   
> +			ir: ir@14080 {
> +				compatible = "amlogic,a9-ir", "amlogic,meson-s4-ir";
> +				reg = <0x0 0x14080 0x0 0x30>;
> +				interrupts = <GIC_SPI 413 IRQ_TYPE_EDGE_RISING>;
> +				status = "disabled";
> +			};
> +
>   			uart_b: serial@1e000 {
>   				compatible = "amlogic,a9-uart",
>   					     "amlogic,meson-s4-uart";
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
