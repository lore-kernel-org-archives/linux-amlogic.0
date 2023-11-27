Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D91BC4167B
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Nov 2023 08:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yubuC8AzzZ+96Uz5kqOSIaYj+Aq4tVqFq1rXk4tzIMk=; b=itPvwT1rhQsDFqyGeA05Sz7FCk
	yFMPuJoohMtdurOo7JCGUzDWAOdCfF8bZGzYI6qwGjUK/D1RLWncigtmMQ6NGoO0Uq++Vm259MAY6
	9Sjl/MfLjZ6tFzGk153rhJ4sEUe/qbyxaa9VN6fYbaiW5Txifw2IDCNf+n9PuVNdKKYDQGGUMbzop
	9ymr1TQ9wBPSyUOGfVWb5FxXxXZBbZsy7JmMrN5rLu+x9jAKh0q0JNtS8majf4yMFl49SiMVGvnhe
	Q7EHFf+ZNsCVYSwRvMGBCzdc6vV+3TwbBCYweS2ocAWFFHeCQi4Foqvl4F2FYql6yefrAZLlOdBmY
	pazqqatg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Wce-001maU-2i;
	Mon, 27 Nov 2023 08:05:40 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Wca-001mYg-1i
	for linux-amlogic@lists.infradead.org;
	Mon, 27 Nov 2023 08:05:39 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5094cb3a036so5289921e87.2
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Nov 2023 00:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701072334; x=1701677134; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i0DQAQJOHK+3bLecRM4vP3aZdjFFClzdARCL+RSt+yY=;
        b=l4Qz49zwIus/qftOmlUhO50Zs/B7Ne7hOm7Wz2SytWwsDX07WHwMJi2R/7W1A/ILZU
         IwmooVrkfSC65JRqbpccXHjXJwIv/AZsdiNosWhuaX2yH1LB/mdy81/4xnOo08H7sHI4
         tRZtl819f+IpCcXcJvOWkxHOmhS+yWC3hHv8PXBXkZ80rC55fuYbms63gpfR38JAWBmE
         BNI14QfR46nhC5mMTIOLpf3Hdei+XFgIZ8T4CBuhoc7W4nfxmCiKT1gyCX2zDjO7JMLQ
         4Ils/fId3dZURQ7Ua2/1kd6M6LaxhFs8EAQ9KDGSMapxDQA8ArY1pTiejpdS5Rxhfvd3
         r4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701072334; x=1701677134;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i0DQAQJOHK+3bLecRM4vP3aZdjFFClzdARCL+RSt+yY=;
        b=agCLqKKr7bkaJi/eb0cdedhchnG2BOZQ2ml0gmMSpr9FLGet/ykPShhRQM5XxaHeDy
         PFtcybmrKLBkbOISV2BInfGbJebKNcreQ9v+hyP0f1LlmKM8edbXm3Hg3GMq93d2bwxZ
         H34zNRhXKL2FzHe/3lSWOskvZJjecE93S7Es9M1DfR2VCV3qjQKcZvuzGrYOJ0QIg9mt
         ugaiAxoWf+mla2MCoQk8UPcFM0oK+1tgLi/hFEcuIsq1Xj5Vq46f1wnIxjo4HLnhfFkQ
         eFTklVKq/cLV9gQfSLtLFRq3yhScDjH2JzSidpXZTYq+lh8fxUXWGlRDcHzb0NShLLy3
         fvxg==
X-Gm-Message-State: AOJu0YzFXAx4QOl4wPXISnGDyIajFtw6ABOMGHb57wzU67mJfxBQ1nLX
	c4ccbAA8xke3Ma57EieZMkEPEw==
X-Google-Smtp-Source: AGHT+IFkdw6Gl3b465RRwdllGajS2LeTjfmKWlo/ZzirKLeykVN8prF08yfXFLM/2fXpl6fa8KzO3A==
X-Received: by 2002:a05:6512:31c3:b0:509:377a:26d9 with SMTP id j3-20020a05651231c300b00509377a26d9mr8908687lfe.8.1701072334462;
        Mon, 27 Nov 2023 00:05:34 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5a15:ac68:b4a4:85ff? ([2a01:e0a:982:cbb0:5a15:ac68:b4a4:85ff])
        by smtp.gmail.com with ESMTPSA id r7-20020a05600c35c700b0040b30be6244sm12939987wmq.24.2023.11.27.00.05.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 00:05:34 -0800 (PST)
Message-ID: <bcf1cc27-cdba-40c2-b578-b4514f92df7c@linaro.org>
Date: Mon, 27 Nov 2023 09:05:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: meson-axg: jethub-jxx add support for EEPROM
Content-Language: en-US, fr
To: Viacheslav Bocharov <adeep@lexina.in>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20231102061233.3113249-1-adeep@lexina.in>
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
In-Reply-To: <20231102061233.3113249-1-adeep@lexina.in>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_000536_608350_952AC678 
X-CRM114-Status: GOOD (  11.57  )
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

On 02/11/2023 07:12, Viacheslav Bocharov wrote:
> Add dts node for EEPROM placed on baseboard in JetHub D1+ devices.
> 
> Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>
> ---
>   .../amlogic/meson-axg-jethome-jethub-j110-rev-2.dts  | 12 ++++++++++++
>   .../amlogic/meson-axg-jethome-jethub-j110-rev-3.dts  | 12 ++++++++++++
>   2 files changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-2.dts b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-2.dts
> index 0062667c4f65..2c684f0ca99a 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-2.dts
> @@ -35,3 +35,15 @@ bluetooth {
>   		device-wake-gpios = <&gpio GPIOZ_6 GPIO_ACTIVE_HIGH>;
>   	};
>   };
> +
> +&i2c_AO {
> +	/* EEPROM on base board */
> +	eeprompd: eeprom@56 {
> +		compatible = "atmel,24c64";
> +		reg = <0x56>;
> +		pagesize = <0x20>;
> +		label = "eeprompd";
> +		address-width = <0x10>;
> +		vcc-supply = <&vddao_3v3>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-3.dts b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-3.dts
> index c2d22b00c1cd..c356bd2cc63a 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-3.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-3.dts
> @@ -25,3 +25,15 @@ memory@0 {
>   &sd_emmc_b {
>   	broken-cd;/* cd-gpios = <&gpio_ao GPIOAO_3 GPIO_ACTIVE_LOW>;*/
>   };
> +
> +&i2c_AO {
> +	/* EEPROM on base board */
> +	eeprompd: eeprom@56 {
> +		compatible = "atmel,24c64";
> +		reg = <0x56>;
> +		pagesize = <0x20>;
> +		label = "eeprompd";
> +		address-width = <0x10>;
> +		vcc-supply = <&vddao_3v3>;
> +	};
> +};

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
