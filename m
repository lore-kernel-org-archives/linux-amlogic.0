Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA47CED628
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Oct 2024 09:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f/8aWL7RPdLI/vKNoeLKeIBUWDefl+B7LF9qbO3jGm4=; b=hASUhORhJSTjQs6arctOsDO1/6
	kLUFNSt5lmQ1OInCZ7bz9Ayjpi8WUZyWr501U6TwS4NBXpVfvyex2efAvF24E5jhbGZKvvXsRQUfh
	AIHKCVKsg/zzNQmVR70W9EKvHvXnWtEeDbKaYHZXZbHsSxtLLHF/P5ULfzIXSQh+1nrfAorUYetKz
	QEVXc3td/BCPiJkTFXcT7lwkwUJjYsFNBxsCnaa/r8/nQluhemCmXmEYToDQCIdzYK4HtZb8tc7/6
	seC70HVYUAot2GQKLSc5ilp109G0C6hWHRd1G/CrkSYbnefEJ2s6rMtDRpyyXzOsHXn/E3yaTkprv
	jrQNg9yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sySYo-00000008ae6-3CDd;
	Wed, 09 Oct 2024 09:00:46 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syRZ9-00000008KmX-3vJd
	for linux-amlogic@lists.infradead.org;
	Wed, 09 Oct 2024 07:57:06 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-42cbb08a1a5so66667765e9.3
        for <linux-amlogic@lists.infradead.org>; Wed, 09 Oct 2024 00:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728460622; x=1729065422; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GGCjdCOE+DgON7Dek53nCoPWGTqEcDS/VtSCG/nHJoc=;
        b=FcSmYJXf0N+RYW9uuLaXvfjyp9cKD0OcBxjroVJNVvXEK7jbpofc/7ABWJ/NmqWH7F
         p4Xs3Czsy2J2eH8RUtk/Q87eMq1Z8nQjaSmCUaBYdp4CjJ3QBMpRHgeJJLaKVM+e/cL+
         1ztzoEoYeV6GGOtBvfqo3Y4xF4WJfUNAYylBUrkjNHHfnuJbR79Qj7z5VD/KyhhYTFH9
         5gSBZ5rvGPWy70GbKsRA0emc0CUs/YWxQpSUuyehLkgf9s8r6etBQAOSBgX5hKkKG0Ik
         is0+VYl88xRvHK3zgrXtuSt/pByTzkSYE1XxsX2qCxbanNwfFQFeOgdxIg8kN1Ekg3SU
         Reqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728460622; x=1729065422;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GGCjdCOE+DgON7Dek53nCoPWGTqEcDS/VtSCG/nHJoc=;
        b=vS3LPIEy3qSlP1/qUkBsnKSjiVAxsa6QXXQI/hPqfeq9NkKmaCAjIdAMN1+eefjeo5
         UEG3KViTFD1k4IEIGxzEhbQ7ht7v5Ywsdfx1hmMwNsp/2IVH8/FodaH115WV1ZGBDoyU
         bUGRp4DPGtccTHgtalVpY26ET+uQibwNDCzcMTQxGGiWwsQMOOPMYZjfYvVp23OVFRRU
         49ui+hWJNVJHrpfT00/CNNy6waRK0innGgpWQQ12Rg7RL64LAxfYj+HJIkdXhySK7dXJ
         NybmKkJcmLbreIlOo+RHWBbMy1upvOH4QqWquMhasQqf5pjrMdw0II/vTTrvSCcyaxxO
         YWUw==
X-Forwarded-Encrypted: i=1; AJvYcCWtW5HPC8fkNfMdWJ6zA9PUmDz/oRGv4q+SgmLngz1y/g30pKJHDmUeIOotnHSCkofyH94teZc19oBrWX3S@lists.infradead.org
X-Gm-Message-State: AOJu0YxbwRwYN+ZjJim5N/3sm9zzEru4GWuhfwXeYqacPuanTvL3ozaA
	kEiYegcFrWi8xjcj5toFUjKySOcEKQrDcRG9TSUJk9IDvMQagcuxIhg4+rxKdAA=
X-Google-Smtp-Source: AGHT+IGmPwpherqH/DdT+xX8ctQy/Srcs3o67MuWIxKms+nvaHX8za08GDDV5cF7VIC0W1zxUi8CeA==
X-Received: by 2002:a05:600c:4fc6:b0:42c:b52b:4335 with SMTP id 5b1f17b1804b1-430ccf28421mr9993205e9.10.1728460621696;
        Wed, 09 Oct 2024 00:57:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:767b:a30:4bcb:fcaf? ([2a01:e0a:982:cbb0:767b:a30:4bcb:fcaf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430ccf31b8dsm11995255e9.5.2024.10.09.00.57.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2024 00:57:01 -0700 (PDT)
Message-ID: <cd286689-4c0f-4fe2-835b-d8c12b3bcd1c@linaro.org>
Date: Wed, 9 Oct 2024 09:57:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: amlogic: Add Amlogic C3 PWM
To: kelvin.zhang@amlogic.com, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20240914-c3-pwm-v2-0-ac1f34c68ac2@amlogic.com>
 <20240914-c3-pwm-v2-2-ac1f34c68ac2@amlogic.com>
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
In-Reply-To: <20240914-c3-pwm-v2-2-ac1f34c68ac2@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_005704_064973_5FF42A6E 
X-CRM114-Status: GOOD (  13.11  )
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

On 14/09/2024 07:48, Kelvin Zhang via B4 Relay wrote:
> From: Kelvin Zhang <kelvin.zhang@amlogic.com>
> 
> Add device nodes for PWM_AB, PWM_CD, PWM_EF, PWM_GH, PWM_IJ, PWM_KL
> and PWM_MN, along with the GPIO pin configurations for each channel.
> 
> Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 364 ++++++++++++++++++++++++++++
>   1 file changed, 364 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> index d0cda759c25d..fd0e557eba06 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> @@ -410,6 +410,300 @@ mux {
>   						drive-strength-microamp = <4000>;
>   					};
>   				};
> +
> +				pwm_a_pins1: pwm-a-pins1 {
> +					mux {
> +						groups = "pwm_a";
> +						function = "pwm_a";
> +					};
> +				};
> +
> +				pwm_b_pins1: pwm-b-pins1 {
> +					mux {
> +						groups = "pwm_b";
> +						function = "pwm_b";
> +					};
> +				};
> +
> +				pwm_c_pins1: pwm-c-pins1 {
> +					mux {
> +						groups = "pwm_c";
> +						function = "pwm_c";
> +					};
> +				};
> +
> +				pwm_d_pins1: pwm-d-pins1 {
> +					mux {
> +						groups = "pwm_d";
> +						function = "pwm_d";
> +					};
> +				};
> +
> +				pwm_e_pins1: pwm-e-pins1 {
> +					mux {
> +						groups = "pwm_e";
> +						function = "pwm_e";
> +					};
> +				};
> +
> +				pwm_f_pins1: pwm-f-pins1 {
> +					mux {
> +						groups = "pwm_f";
> +						function = "pwm_f";
> +					};
> +				};
> +
> +				pwm_g_pins1: pwm-g-pins1 {
> +					mux {
> +						groups = "pwm_g_b";
> +						function = "pwm_g";
> +					};
> +				};
> +
> +				pwm_g_pins2: pwm-g-pins2 {
> +					mux {
> +						groups = "pwm_g_c";
> +						function = "pwm_g";
> +					};
> +				};
> +
> +				pwm_g_pins3: pwm-g-pins3 {
> +					mux {
> +						groups = "pwm_g_d";
> +						function = "pwm_g";
> +					};
> +				};
> +
> +				pwm_g_pins4: pwm-g-pins4 {
> +					mux {
> +						groups = "pwm_g_x0";
> +						function = "pwm_g";
> +					};
> +				};
> +
> +				pwm_g_pins5: pwm-g-pins5 {
> +					mux {
> +						groups = "pwm_g_x8";
> +						function = "pwm_g";
> +					};
> +				};
> +
> +				pwm_h_pins1: pwm-h-pins1 {
> +					mux {
> +						groups = "pwm_h_b";
> +						function = "pwm_h";
> +					};
> +				};
> +
> +				pwm_h_pins2: pwm-h-pins2 {
> +					mux {
> +						groups = "pwm_h_c";
> +						function = "pwm_h";
> +					};
> +				};
> +
> +				pwm_h_pins3: pwm-h-pins3 {
> +					mux {
> +						groups = "pwm_h_d";
> +						function = "pwm_h";
> +					};
> +				};
> +
> +				pwm_h_pins4: pwm-h-pins4 {
> +					mux {
> +						groups = "pwm_h_x1";
> +						function = "pwm_h";
> +					};
> +				};
> +
> +				pwm_h_pins5: pwm-h-pins5 {
> +					mux {
> +						groups = "pwm_h_x9";
> +						function = "pwm_h";
> +					};
> +				};
> +
> +				pwm_i_pins1: pwm-i-pins1 {
> +					mux {
> +						groups = "pwm_i_b";
> +						function = "pwm_i";
> +					};
> +				};
> +
> +				pwm_i_pins2: pwm-i-pins2 {
> +					mux {
> +						groups = "pwm_i_c";
> +						function = "pwm_i";
> +					};
> +				};
> +
> +				pwm_i_pins3: pwm-i-pins3 {
> +					mux {
> +						groups = "pwm_i_d";
> +						function = "pwm_i";
> +					};
> +				};
> +
> +				pwm_i_pins4: pwm-i-pins4 {
> +					mux {
> +						groups = "pwm_i_x2";
> +						function = "pwm_i";
> +					};
> +				};
> +
> +				pwm_i_pins5: pwm-i-pins5 {
> +					mux {
> +						groups = "pwm_i_x10";
> +						function = "pwm_i";
> +					};
> +				};
> +
> +				pwm_j_pins1: pwm-j-pins1 {
> +					mux {
> +						groups = "pwm_j_c";
> +						function = "pwm_j";
> +					};
> +				};
> +
> +				pwm_j_pins2: pwm-j-pins2 {
> +					mux {
> +						groups = "pwm_j_d";
> +						function = "pwm_j";
> +					};
> +				};
> +
> +				pwm_j_pins3: pwm-j-pins3 {
> +					mux {
> +						groups = "pwm_j_b";
> +						function = "pwm_j";
> +					};
> +				};
> +
> +				pwm_j_pins4: pwm-j-pins4 {
> +					mux {
> +						groups = "pwm_j_x3";
> +						function = "pwm_j";
> +					};
> +				};
> +
> +				pwm_j_pins5: pwm-j-pins5 {
> +					mux {
> +						groups = "pwm_j_x12";
> +						function = "pwm_j";
> +					};
> +				};
> +
> +				pwm_k_pins1: pwm-k-pins1 {
> +					mux {
> +						groups = "pwm_k_c";
> +						function = "pwm_k";
> +					};
> +				};
> +
> +				pwm_k_pins2: pwm-k-pins2 {
> +					mux {
> +						groups = "pwm_k_d";
> +						function = "pwm_k";
> +					};
> +				};
> +
> +				pwm_k_pins3: pwm-k-pins3 {
> +					mux {
> +						groups = "pwm_k_b";
> +						function = "pwm_k";
> +					};
> +				};
> +
> +				pwm_k_pins4: pwm-k-pins4 {
> +					mux {
> +						groups = "pwm_k_x4";
> +						function = "pwm_k";
> +					};
> +				};
> +
> +				pwm_k_pins5: pwm-k-pins5 {
> +					mux {
> +						groups = "pwm_k_x13";
> +						function = "pwm_k";
> +					};
> +				};
> +
> +				pwm_l_pins1: pwm-l-pins1 {
> +					mux {
> +						groups = "pwm_l_c";
> +						function = "pwm_l";
> +					};
> +				};
> +
> +				pwm_l_pins2: pwm-l-pins2 {
> +					mux {
> +						groups = "pwm_l_x";
> +						function = "pwm_l";
> +					};
> +				};
> +
> +				pwm_l_pins3: pwm-l-pins3 {
> +					mux {
> +						groups = "pwm_l_b";
> +						function = "pwm_l";
> +					};
> +				};
> +
> +				pwm_l_pins4: pwm-l-pins4 {
> +					mux {
> +						groups = "pwm_l_a";
> +						function = "pwm_l";
> +					};
> +				};
> +
> +				pwm_m_pins1: pwm-m-pins1 {
> +					mux {
> +						groups = "pwm_m_c";
> +						function = "pwm_m";
> +					};
> +				};
> +
> +				pwm_m_pins2: pwm-m-pins2 {
> +					mux {
> +						groups = "pwm_m_x";
> +						function = "pwm_m";
> +					};
> +				};
> +
> +				pwm_m_pins3: pwm-m-pins3 {
> +					mux {
> +						groups = "pwm_m_a";
> +						function = "pwm_m";
> +					};
> +				};
> +
> +				pwm_m_pins4: pwm-m-pins4 {
> +					mux {
> +						groups = "pwm_m_b";
> +						function = "pwm_m";
> +					};
> +				};
> +
> +				pwm_n_pins1: pwm-n-pins1 {
> +					mux {
> +						groups = "pwm_n_x";
> +						function = "pwm_n";
> +					};
> +				};
> +
> +				pwm_n_pins2: pwm-n-pins2 {
> +					mux {
> +						groups = "pwm_n_a";
> +						function = "pwm_n";
> +					};
> +				};
> +
> +				pwm_n_pins3: pwm-n-pins3 {
> +					mux {
> +						groups = "pwm_n_b";
> +						function = "pwm_n";
> +					};
> +				};
>   			};
>   
>   			gpio_intc: interrupt-controller@4080 {
> @@ -490,6 +784,16 @@ spicc1: spi@52000 {
>   				status = "disabled";
>   			};
>   
> +			pwm_mn: pwm@54000 {
> +				compatible = "amlogic,c3-pwm",
> +					     "amlogic,meson-s4-pwm";
> +				reg = <0x0 54000 0x0 0x24>;
> +				clocks = <&clkc_periphs CLKID_PWM_M>,
> +					 <&clkc_periphs CLKID_PWM_N>;
> +				#pwm-cells = <3>;
> +				status = "disabled";
> +			};
> +
>   			spifc: spi@56000 {
>   				compatible = "amlogic,a1-spifc";
>   				reg = <0x0 0x56000 0x0 0x290>;
> @@ -499,6 +803,66 @@ spifc: spi@56000 {
>   				status = "disabled";
>   			};
>   
> +			pwm_ab: pwm@58000 {
> +				compatible = "amlogic,c3-pwm",
> +					     "amlogic,meson-s4-pwm";
> +				reg = <0x0 0x58000 0x0 0x24>;
> +				clocks = <&clkc_periphs CLKID_PWM_A>,
> +					 <&clkc_periphs CLKID_PWM_B>;
> +				#pwm-cells = <3>;
> +				status = "disabled";
> +			};
> +
> +			pwm_cd: pwm@5a000 {
> +				compatible = "amlogic,c3-pwm",
> +					     "amlogic,meson-s4-pwm";
> +				reg = <0x0 0x5a000 0x0 0x24>;
> +				clocks = <&clkc_periphs CLKID_PWM_C>,
> +					 <&clkc_periphs CLKID_PWM_D>;
> +				#pwm-cells = <3>;
> +				status = "disabled";
> +			};
> +
> +			pwm_ef: pwm@5c000 {
> +				compatible = "amlogic,c3-pwm",
> +					     "amlogic,meson-s4-pwm";
> +				reg = <0x0 0x5c000 0x0 0x24>;
> +				clocks = <&clkc_periphs CLKID_PWM_E>,
> +					 <&clkc_periphs CLKID_PWM_F>;
> +				#pwm-cells = <3>;
> +				status = "disabled";
> +			};
> +
> +			pwm_gh: pwm@5e000 {
> +				compatible = "amlogic,c3-pwm",
> +					     "amlogic,meson-s4-pwm";
> +				reg = <0x0 0x5e000 0x0 0x24>;
> +				clocks = <&clkc_periphs CLKID_PWM_G>,
> +					 <&clkc_periphs CLKID_PWM_H>;
> +				#pwm-cells = <3>;
> +				status = "disabled";
> +			};
> +
> +			pwm_ij: pwm@60000 {
> +				compatible = "amlogic,c3-pwm",
> +					     "amlogic,meson-s4-pwm";
> +				reg = <0x0 0x60000 0x0 0x24>;
> +				clocks = <&clkc_periphs CLKID_PWM_I>,
> +					 <&clkc_periphs CLKID_PWM_J>;
> +				#pwm-cells = <3>;
> +				status = "disabled";
> +			};
> +
> +			pwm_kl: pwm@62000 {
> +				compatible = "amlogic,c3-pwm",
> +					     "amlogic,meson-s4-pwm";
> +				reg = <0x0 0x62000 0x0 0x24>;
> +				clocks = <&clkc_periphs CLKID_PWM_K>,
> +					 <&clkc_periphs CLKID_PWM_L>;
> +				#pwm-cells = <3>;
> +				status = "disabled";
> +			};
> +
>   			i2c0: i2c@66000 {
>   				compatible = "amlogic,meson-axg-i2c";
>   				reg = <0x0 0x66000 0x0 0x24>;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
