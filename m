Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A85FE51FB
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Apr 2026 10:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P+MfQXjvOn7EzCWtt3p0+H4Ldxllo+YG/+jxLD0afHU=; b=Gcu3q9J/PUxrPcFJKuB5ShPPvu
	oiiBDPB4LDan7eUumO7eJsIfdet27qe6WDVl3S4eHR1itjKutKqEt9E9tZxBZFdVcRCk/wD7XXNzs
	xozJvvegSaA6gylJFIQogOLVEz99d9/Etvytmb3fLTxYThSJCK6ebnxm9uExSFje2sYB4OyhVLRNs
	WkzkP6CHA8k8JY0f+ZmlB9ZnhTO2jW5dPfj1nAid8+eEpsbNkoGWAqDEFR32D6Gq2sYwbjtLOiBA0
	OlgFwTIhGdy7Aw5E0y6y/AIY88ApWMlK3p1uqmyaL5QX3Hyv0T/xBEcTwGjPaXQUt01czB3n/Sx/g
	x011QfrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDLX-0000000Cz0N-1zEt;
	Fri, 24 Apr 2026 10:01:15 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDLL-0000000Cytr-1qAP
	for linux-amlogic@lists.infradead.org;
	Fri, 24 Apr 2026 10:01:14 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso51750015e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 24 Apr 2026 03:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777024861; x=1777629661; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vPAdPOUXw3pVX3oaN35XRvBMX9UHe+5wDadCAJqegTM=;
        b=H1iBXKwYj3Cu19NHD/XawP5OzW2j787o4+xHq1gPafdNcVi8cTk73ZXbVGExSXDjgv
         fFCgfA71jA+kptB6/HkmFxEw4cK64FbwkMhHHefOIaYy/cW4eizkAXFw8zqFMk4G92f3
         mt8x0yH7X6ltqW6LwPSwzoZjdvpV1cJEabsZxKnE36za9T/e0Izk2QjjsCn/CmispPA4
         Jq9lUcv8vvfZq8XeQYGAxBuqEl2MSV9F7kZVUBe6ZaFwEyaa2WQuPlaLSEYlOM2/x8An
         e3WLI6UGK76YrGgP5WpD6vCMb+hdy6t/Zta4Ekvh+8pSpvRm2wn3eZSKxsx43pO7RkTN
         RNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777024861; x=1777629661;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vPAdPOUXw3pVX3oaN35XRvBMX9UHe+5wDadCAJqegTM=;
        b=RE6CuU69cV1x6j1zwH2EcCRfpkcccQgztsxQ3mIXNKzGI+ahNpKLF8nMClf1y+FRzu
         VZhgXwiJM7Sk81k51/YvBQ9adaDjHIR89PB8C8YXJlr1dDHl+11gDEsFsfv0/URl5mOK
         4Bb6eWHJ/uWIqYECHJYP8rLcC6hz2fvf7WUN6vyBTdCEAQma3ecxcdJwijsOVre8yntu
         dPvX0rUMwtygOnok1+PQA7H3qxbBFXTyqw8aA61QblU9MeIpODRUlvD2Og6SUoO9yelt
         IadQzZhOSqQnK4aEDFXm+1K899XhzfxKYA8yDyYNq+Ug2uffLcupDd1RrxzTzw21VuQ1
         NU6Q==
X-Gm-Message-State: AOJu0YzMXMY8bOzphBbmF92ceIjw9K35kVoN5+0gxWgpngosU/IFuNiM
	iGzCz6nmmBr6MMLgnw4JTDxDCXZzyLCmSWp4a77yjGSvHEQzt6RAD74iQWfPpagq4P4=
X-Gm-Gg: AeBDieugxZzONNJSmXJQDGEV2E8WtFdYbvFiT240iKjMxUO723/elFtfoaqnWRDadVO
	/xJA7jt+bMNtcgBwVryMXhPd3N/8bqRhxal9yMT6hTdIvolK7gnnzwRrF+VXIyB8E8qUhWUwvMU
	oE4j7/anZeE06ldNhEvYMiTud9hcw+N3kGjtBpmjtXEgTEQFIWiITRJpo64UN29E5ugPHVldqZl
	BbGhH5ddDSRrSPWBshYOykqm2DuyyPaQsd2uGMaKF2fD5EwsSKfLQmRfZfXY4SoG12JpSYuB1Te
	nT6W1vz3Q52+HwqGXOXCOJIc8e5jXC3KtsuRli6g9CgPuKSHkzSup7CJ/BgyzInz/2tZGmxT0gL
	AtxRzFQHGzoVFQiiZSCy/M3+uaASoI+CXdwRR7o+EK3CjQbRYO1YNoVxAE9s0H4ZxumD29LLEnC
	5T13tI/Vp4bGohk/sMadLKV1aQmMQLTKKQTuMomUxUktfAV7IWUCpTeACgTnF7oN5TQ1J/6God+
	J6MnruDlvXQCp2HjPHcoNr3UsDs
X-Received: by 2002:a05:600c:8115:b0:488:904b:f31 with SMTP id 5b1f17b1804b1-488fb77e27cmr387870105e9.22.1777024861411;
        Fri, 24 Apr 2026 03:01:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:79e1:f56b:445c:ca9c? ([2a01:e0a:106d:1080:79e1:f56b:445c:ca9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7aa593sm182225895e9.24.2026.04.24.03.00.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 03:01:01 -0700 (PDT)
Message-ID: <12e4c15f-0782-465d-9f90-d9d4f8018306@linaro.org>
Date: Fri, 24 Apr 2026 12:00:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 7/8] arm64: dts: amlogic: t7: Add i2c controller node
To: linux-kernel-dev@aliel.fr, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
References: <20260421-add-mcu-fan-khadas-vim4-v4-0-447114a28f2d@aliel.fr>
 <20260421-add-mcu-fan-khadas-vim4-v4-7-447114a28f2d@aliel.fr>
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
In-Reply-To: <20260421-add-mcu-fan-khadas-vim4-v4-7-447114a28f2d@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_030106_546031_BEB413DB 
X-CRM114-Status: GOOD (  12.04  )
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

On 4/21/26 13:49, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> Add the T7 i2c controller node used by the Khadas VIM4
> for MCU communication.
> 
> Use amlogic,meson-axg-i2c as fallback compatible.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index e96fe10b251a0..560c9dce35266 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -711,6 +711,16 @@ pwm_ao_cd: pwm@60000 {
>   				status = "disabled";
>   			};
>   
> +			i2c_m_ao_a: i2c@76000 {
> +				compatible = "amlogic,t7-i2c", "amlogic,meson-axg-i2c";
> +				reg = <0x0 0x76000 0x0 0x48>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				interrupts = <GIC_SPI 330 IRQ_TYPE_EDGE_RISING>;
> +				clocks = <&clkc_periphs CLKID_SYS_I2C_AO_A>;
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
