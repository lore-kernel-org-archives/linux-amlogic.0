Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FABFE51F3
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Apr 2026 09:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/JAL/qMftDEDvkeGzuyKVGAuzfndI3cJ1XzoPhSwjrU=; b=GqXmjlVBR6xuSUH4mDmCrnBp4T
	Yg1caOPoHSjkBtYbiAi1EEw3mKDb62Ch3LqRr4Tylq16KTK7gYThk4f3/OLL5UyvPgwjfZomMep1n
	yoqnHGAyvBVhkvqDoO6KKI+XHuLLRTJvfqJM2AkgyDV4x25ixlJGD4+Jta1hg5IuTg2Oj+qDXXUrE
	VTLK0j2YhpcwIv6eiwdAMj3RlARNLLSNmanAFngJBpvyDVOgQce8kVpSuPvxkDVX/8LwJtFvR1tcl
	1wWKCoi19/v+1VTPeUQWpNEWfnuTKhMMUOt8FhotEmfFQ9YBmZwtoqiGEczR9JKmOsnJsQHgcEWam
	uuKFHayQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDDO-0000000CxpT-0t8R;
	Fri, 24 Apr 2026 09:52:50 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDDK-0000000Cxnc-21iH
	for linux-amlogic@lists.infradead.org;
	Fri, 24 Apr 2026 09:52:48 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso79013145e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 24 Apr 2026 02:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777024365; x=1777629165; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EsX8mB8kXzV2ktDRmOdWBbgr/FAAsBVBHTUYMUDzRZI=;
        b=iYXtPIGesYdqlTs6bqLCDdPTFr6MV7fNTelXwqd/8X3kONhcUtNiY8a9uaTZklCQD/
         7rrRZf3GXFZp6W7xJUZGS5H9x9cHze+0QgV5ZwvuXw2d4VOl7Y1J5qEqnW51nnTDaKcE
         2iGLSwtK2mgC9CPr/X6knIH4D/IkDQdlRqihspWSQfpY0JplLjpd6KyHYuA8csw+OWWb
         AiYPuFlFzvqynrPu8LU5qL0vXVsKd5DWauS7GIdXQYpiYXnvreyAaL/Tv1Gilh5ZPyF6
         /t8rjdDoI+iYsm+EYNSGnyrz32iYVhIkofwfPxXa31h9ES/YbrnHaQzazvxlBcnB8ahA
         NZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777024365; x=1777629165;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EsX8mB8kXzV2ktDRmOdWBbgr/FAAsBVBHTUYMUDzRZI=;
        b=L2vcfjb7xcd8k5kcU2KE2dC4x6UNFNBDocqpExo3k2sQYMA9eZDjBB6VdH1gmKkw/q
         kNkPFhmyTCf5lBt4Wc0n3NNZ8TsXIfyiwvgCzTwUXbf/bUefrjyJ9B200+yp47Us9UWt
         e15DonYGBfKMEYbjyF08i9fW2zoNHwhqV/nH7t8tM6DCne7Na4WCf+3bTzZ3uWLzi7Gm
         1WnfFIn+2tgHBEWHjxC7fmWQOywoTLR/78dv+3q9FL+dJtIQXGqo8TG83oinATRrgG0s
         UDmGhjbGt9SDNLk4g6JL+vdHDQH2GuR0j6hDMAMHBAvWQ7ZSFt7zMrOFre3UWjySEgNC
         j1LA==
X-Forwarded-Encrypted: i=1; AFNElJ8SP07btA9ZPEyJfgKQT5+1E5o5MKDt1dJDDwzHJT1PTO+argFsuwJIQZOdqkrnZtpeFAC1Zg8h3Aac/5pi@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5BOsD+0s2khGZMHp6X+U5z5MdDS/tresZuauo2mDBDzyW44uX
	KA7OO/58vay/jHaJcagJQYNyMi7Z4/Bw7PPkeegN6dBaqFDlKgBrM+7nreA+Bhu9oeY=
X-Gm-Gg: AeBDiesSgKEyk2+wSrGvOGsoNfi5+Pz/N0yt0B1CszkaNhE91VF120p1aspIkJfy3i4
	MATUyg5JrAQdcsXiJQlo7sCTbv989vRnZmt8eIx7DXm0Ci56ybHZ7eUtT8rp6TZ4tsGpS5lje2B
	rwyzPZm7cGSFZ20e2aL0GqCQTuBaBz/3o1DOCkjYS9bqKYyuIls47qKljfeBtrxp4bYayMWvCxs
	XnxOdSYn0Lan2smQVAl3gEQipV/G+mHbOIHDfwDSWD3O+tD/sUrHdRHh43MC2ACc6BQmFXD4Y8V
	Ur4/PI55mam2m6WMyJrScCoiW3FjK4D0X2KjNhxM+TxZPcb8qS9ALPrJiPmhU3OnS0AFS+G3PNJ
	ybGFBM0rHH2lVi06x4PlRbyyC97rSX4pcf9r5L/NiwnD0dKV329OYBPCWUVmsnZld4XQehTqn33
	Gm6pjtvx4CYY8p/gEUjea1M5zfPJWaGHQquKIW7jzVaR3feuXCidvoHdECtM0WKhrQ9pzwobJeV
	GK/9CPx3Oz+jrkTng==
X-Received: by 2002:a05:600c:a108:b0:480:69b6:dfed with SMTP id 5b1f17b1804b1-488fb78ba6fmr374022025e9.24.1777024364611;
        Fri, 24 Apr 2026 02:52:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:79e1:f56b:445c:ca9c? ([2a01:e0a:106d:1080:79e1:f56b:445c:ca9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cc84a1bsm141108575e9.0.2026.04.24.02.52.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 02:52:44 -0700 (PDT)
Message-ID: <80f93779-17fd-4fab-a887-b5f88e82b2d7@linaro.org>
Date: Fri, 24 Apr 2026 11:52:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 6/8] arm64: dts: amlogic: t7: Add thermal sensor nodes
To: linux-kernel-dev@aliel.fr, Guillaume La Roque <glaroque@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260423-add-thermal-t7-vim4-v4-0-d4c1528d5044@aliel.fr>
 <20260423-add-thermal-t7-vim4-v4-6-d4c1528d5044@aliel.fr>
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
In-Reply-To: <20260423-add-thermal-t7-vim4-v4-6-d4c1528d5044@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_025246_546140_F694EC22 
X-CRM114-Status: GOOD (  10.59  )
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

On 4/23/26 18:07, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> Add six temperature sensor nodes using the amlogic,t7-thermal compatible:
> a73, a53, gpu, nna, vpu, and hevc. Each sensor retrieves its calibration
> data from the secure monitor via the amlogic,secure-monitor phandle with
> the corresponding tsensor_id argument.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 58 +++++++++++++++++++++++++++++
>   1 file changed, 58 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index 7aec65f036a9c..62f259b2b17d2 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -656,6 +656,24 @@ sec_ao: ao-secure@10220 {
>   				amlogic,has-chip-id;
>   			};
>   
> +			a73_tsensor: temperature-sensor@20000 {
> +				compatible = "amlogic,t7-thermal";
> +				reg = <0x0 0x20000 0x0 0x50>;
> +				interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clkc_periphs CLKID_TS>;
> +				#thermal-sensor-cells = <0>;
> +				amlogic,secure-monitor = <&sm 1>;
> +			};
> +
> +			a53_tsensor: temperature-sensor@22000 {
> +				compatible = "amlogic,t7-thermal";
> +				reg = <0x0 0x22000 0x0 0x50>;
> +				interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clkc_periphs CLKID_TS>;
> +				#thermal-sensor-cells = <0>;
> +				amlogic,secure-monitor = <&sm 2>;
> +			};
> +
>   			pwm_ao_ef: pwm@30000 {
>   				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
>   				reg = <0x0 0x30000 0x0 0x24>;
> @@ -770,6 +788,46 @@ sd_emmc_c: mmc@8c000 {
>   				assigned-clock-parents = <&xtal>;
>   				status = "disabled";
>   			};
> +
> +			gpu_tsensor: temperature-sensor@94000 {
> +				compatible = "amlogic,t7-thermal";
> +				reg = <0x0 0x94000 0x0 0x50>;
> +				interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clkc_periphs CLKID_TS>;
> +				power-domains = <&pwrc PWRC_T7_MALI_TOP_ID>;
> +				#thermal-sensor-cells = <0>;
> +				amlogic,secure-monitor = <&sm 3>;
> +			};
> +
> +			nna_tsensor: temperature-sensor@96000 {
> +				compatible = "amlogic,t7-thermal";
> +				reg = <0x0 0x96000 0x0 0x50>;
> +				interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clkc_periphs CLKID_TS>;
> +				power-domains = <&pwrc PWRC_T7_NNA_TOP_ID>;
> +				#thermal-sensor-cells = <0>;
> +				amlogic,secure-monitor = <&sm 4>;
> +			};
> +
> +			vpu_tsensor: temperature-sensor@98000 {
> +				compatible = "amlogic,t7-thermal";
> +				reg = <0x0 0x98000 0x0 0x50>;
> +				interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clkc_periphs CLKID_TS>;
> +				power-domains = <&pwrc PWRC_T7_VPU_HDMI_ID>;
> +				#thermal-sensor-cells = <0>;
> +				amlogic,secure-monitor = <&sm 6>;
> +			};
> +
> +			hevc_tsensor: temperature-sensor@9a000 {
> +				compatible = "amlogic,t7-thermal";
> +				reg = <0x0 0x9a000 0x0 0x50>;
> +				interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clkc_periphs CLKID_TS>;
> +				power-domains = <&pwrc PWRC_T7_DOS_HEVC_ID>;
> +				#thermal-sensor-cells = <0>;
> +				amlogic,secure-monitor = <&sm 5>;
> +			};
>   		};
>   
>   	};
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
