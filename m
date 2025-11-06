Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F3F1CCFA05
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Nov 2025 13:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jeurw0DdDFJPq6cN43gKLl1Yry5a+T7AY9nKe/1oCH8=; b=X8CHP8UscB+TMRoXmuz0hFGmrn
	9Z7dfIure0jNrjtFBo11U8CvEBMCKdUEHyP3cHUsdYzJXAVmCBIkYEsnk06du3cJLIuplHiUDKhM7
	Us2IszAEemW295d3jh9zuEG0FF/I6lYsKPj6DpMR/pSIDiiFbu8Gj8w8I1ditKf91DuAHB4ITs0Rb
	Za18g7rXIVvKtxUq6Gmxjo0j7uaoLkLAI5dWfojdgW/m0Sf+CW5kVPnspIAnQvqXUxZ85Ny6pn703
	hilzUImzw9jVTAanS/W06V63ctOzKVRkbm/aWHMXFZrus6blWz8j3UNH+rsf8l9YKeS4qI8RgzmZl
	wNNkuM4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGziL-0000000FXKZ-1l0S;
	Thu, 06 Nov 2025 13:07:45 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGziI-0000000FXJp-0Rwd
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Nov 2025 13:07:43 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-477563bcbbcso4752095e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Nov 2025 05:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762434460; x=1763039260; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2yLyeCjgls6cM1HvoV4Agizj+GB/rHC0r8rByuRqqxM=;
        b=ByKUlULLxmx4XeDH9HgukvhQ9O63Zt3I0b4wyJeNTCn5Dvf7CBiJpJCKrgKs1CkPrL
         LRoaSs9XAvJ0WeXmAcSrvfQxtXtCQjiNenptnkuyySjt9Z4Odeo3lhd0SSfzOvG4gtX3
         JAMKGCuweTyxsVn7ktT6p6szgcMA9qzc6u8mXPV+MJLwhPLWQZaIfzb9aiUcKMJBVuVi
         HKBPKeQVHMHkeFEUmvUh6cqYrohPAR/yqPJBOcqzEZ0nTtwkCR+EVPsCtwK6hC5F1u4f
         kN9c44YrQGwzkVq9tseIhtZAWP4FvfG+g/qeCZ8H9rzzXo3UqhOfW7jbR8PdiyKEBwwl
         +5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762434460; x=1763039260;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2yLyeCjgls6cM1HvoV4Agizj+GB/rHC0r8rByuRqqxM=;
        b=stDsPjhpEICRhrszoKaZsDt8pv5CHJM7wFzncaW5GN5H5+ZLbyPd41i2F0i5Kwp71A
         XK1JDhI7HNiE1I9LPhk16SkNoLkR6UgKJAXzqMGvte/d7NVT/U2aeLnThrYuxxyu7+Qp
         z5dNaFWn/P4og8PBBxefGD6aB0dRHi2SXGGaFX/NgCDnFj2K5Hm9306t3YZEvlo1cVtn
         htOKG+TGnJjeJO2L8/qTOIuq0oJy6e0+0kd2Vents71vt6fpEHHgWBuPla9GZ/WSEb8N
         RKibq/WMJSMET4MApa1BmTQNJHZC0cIlCZY8ZcGYgoY461dw17pKKkhZ/YFwGX452ZFz
         yv5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUR5WR3wFleWgzwJ2vKS6j6RxVi6srfnmnUXN4zqs6c2S4CFKjxbh8FKigyRp56ZFTDEuPir3XUZK6jbWng@lists.infradead.org
X-Gm-Message-State: AOJu0YzMVcjoFaUqUybUKH/zlAtgKBgx0GuUSfHTFPeNI8E/bGv2dKO7
	Cez9Vp3i75jKF0jONo3+X2NnH179A7RON7zmqgOA0oP4CQzscSYQFK0lwx5XVCo6WMg=
X-Gm-Gg: ASbGnct9OQOnYg1YMdj2vrQsZigNBYwPstR3WM3fddEEwCRAuHofGvUOEUlzneVnxi5
	7TqEANM7nI3eFJDq1uab+21/C1+RfdIPyzhd0iOm/U6FQJuhWhXGJnc7wvWH1VSgLuW7/LLJqZU
	+CT+1HaN9+++mZD+Jzcwtd/xyMv+ZiJnV6qjBJO8CL143dXal+EvJ/pNtJU2ChGBoNdOKlexf9l
	YAitF70f0RpgNPbJ0Iz4SnYSlPVstV/4TMMMJ4kTUEvmOCRTL7eX0DTQlfyHg1evfwW1yG3AF2W
	V6Bwz9RdHp5J20v/GofGDywdIZrIWIv/yxKB+ovZQcJZkcco0fVp3Q0YevjLR1aAxstIEcjuz9p
	3aUzhvOpytHqodqzBG/GIDLBNqKsGEbZFWnkev44RpjUSRS0RTp78Au3B64+vuLM8OI1qvQI+x+
	8kr/PyQFp8zMawYMmvJCdaccKFoyft/fB9lw==
X-Google-Smtp-Source: AGHT+IFAsKArlrU067DkxQxwFDKfyGP6fHe4iUyS/Bdq+iRDMjLgKkS8gLp/s5Zpe2BQhezfS1P8SA==
X-Received: by 2002:a05:600c:1d88:b0:477:54cd:202e with SMTP id 5b1f17b1804b1-4775cdad6aamr62589075e9.2.1762434459994;
        Thu, 06 Nov 2025 05:07:39 -0800 (PST)
Received: from [192.168.27.65] (home.rastines.starnux.net. [82.64.67.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47763e4d7f2sm15640615e9.4.2025.11.06.05.07.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 05:07:39 -0800 (PST)
Message-ID: <f324cafd-c466-4cb8-81ab-fbabac7bbca7@linaro.org>
Date: Thu, 6 Nov 2025 14:07:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/5] irqchip: Add support for Amlogic S6 S7 and S7D SoCs
To: xianwei.zhao@amlogic.com, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20251105-irqchip-gpio-s6-s7-s7d-v1-0-b4d1fe4781c1@amlogic.com>
 <20251105-irqchip-gpio-s6-s7-s7d-v1-2-b4d1fe4781c1@amlogic.com>
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
In-Reply-To: <20251105-irqchip-gpio-s6-s7-s7d-v1-2-b4d1fe4781c1@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_050742_181272_E8CB4D6F 
X-CRM114-Status: GOOD (  15.20  )
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

On 11/5/25 10:45, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> The Amlogic S6/S7/S7D SoCs support 12 GPIO IRQ lines,
> details are as below.
> 
>      S6 IRQ Number:
>      - 99:98    2 pins on bank CC
>      - 97       1 pin  on bank TESTN
>      - 96:81   16 pins on bank A
>      - 80:65   16 pins on bank Z
>      - 64:45   20 pins on bank X
>      - 44:37    8 pins on bank H offs H1
>      - 36:32    5 pins on bank F
>      - 31:25    7 pins on bank D
>      - 24:22    3 pins on bank E
>      - 21:14    8 pins on bank C
>      - 13:0    14 pins on bank B
> 
>      S7 IRQ Number:
>      - 83:82    2 pins on bank CC
>      - 81       1 pin  on bank TESTN
>      - 80:68   13 pins on bank Z
>      - 67:48   20 pins on bank X
>      - 47:36   12 pins on bank H
>      - 35:24   12 pins on bank D
>      - 23:22    2 pins on bank E
>      - 21:14    8 pins on bank C
>      - 13:0    14 pins on bank B
> 
>      S7D IRQ Number:
>      - 83:82    2 pins on bank CC
>      - 81:75    7 pins on bank DV
>      - 74       1 pin  on bank TESTN
>      - 73:61   13 pins on bank Z
>      - 60:41   20 pins on bank X
>      - 40:29   12 pins on bank H
>      - 28:24    5 pins on bank D
>      - 23:22    2 pins on bank E
>      - 21:14    8 pins on bank C
>      - 13:0    14 pins on bank B
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   drivers/irqchip/irq-meson-gpio.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpio.c
> index 7d177626d64b..7e718b07e960 100644
> --- a/drivers/irqchip/irq-meson-gpio.c
> +++ b/drivers/irqchip/irq-meson-gpio.c
> @@ -174,6 +174,14 @@ static const struct meson_gpio_irq_params s4_params = {
>   	INIT_MESON_S4_COMMON_DATA(82)
>   };
>   
> +static const struct meson_gpio_irq_params s6_params = {
> +	INIT_MESON_S4_COMMON_DATA(100)
> +};
> +
> +static const struct meson_gpio_irq_params s7_params = {
> +	INIT_MESON_S4_COMMON_DATA(84)
> +};
> +
>   static const struct meson_gpio_irq_params c3_params = {
>   	INIT_MESON_S4_COMMON_DATA(55)
>   };
> @@ -195,6 +203,9 @@ static const struct of_device_id meson_irq_gpio_matches[] __maybe_unused = {
>   	{ .compatible = "amlogic,a4-gpio-ao-intc", .data = &a4_ao_params },
>   	{ .compatible = "amlogic,a4-gpio-intc", .data = &a4_params },
>   	{ .compatible = "amlogic,a5-gpio-intc", .data = &a5_params },
> +	{ .compatible = "amlogic,s6-gpio-intc", .data = &s6_params },
> +	{ .compatible = "amlogic,s7-gpio-intc", .data = &s7_params },
> +	{ .compatible = "amlogic,s7d-gpio-intc", .data = &s7_params },
>   	{ .compatible = "amlogic,c3-gpio-intc", .data = &c3_params },
>   	{ .compatible = "amlogic,t7-gpio-intc", .data = &t7_params },
>   	{ }
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
