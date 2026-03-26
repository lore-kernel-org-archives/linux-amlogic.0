Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CCB4106F304
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2026 08:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ofQjq2VxLcAMo9wdvFImCogq1owpwFxNXnFSDCPzDGU=; b=VRhAfdtOv7SbslLa1dOuBTOlT/
	1EaFr7I/F9+XwYkSCaVeCiYHjONQG3MJxDTsJk4sGligbCroLFjh+M1whZrMb4YsTfdUnIVZ30yhu
	NsgLnz5um5Wtgrrm/zIl/ZTjx57h8uK9c+9doWuf+E5nFQUQ1Kn5o5lIpVF44HSi/Rw5+YbCpATnM
	LcLhrCZubbfuSNAtYYJIUlN3iCgioyUYFwkCoWPjFi/oKxHRU1OTwsJRlzm/YX3if/xQdyxSI2Pch
	bQN0VWIUq5dIZB8Rz6leKlmWGNiK3hxBmn0Ew+JlTHsGxtx6E4ZomiLipuR9k7tZ/agH4CkSQbJPQ
	jphb6+Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gSO-000000053uz-20uY;
	Thu, 26 Mar 2026 08:52:48 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gSM-000000053tb-1ou0
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Mar 2026 08:52:47 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-48538c5956bso5794985e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Mar 2026 01:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774515164; x=1775119964; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VmPvkIy3tf1J6J+2oDH92ejHRFaN+YHsg5wdlsi6hv4=;
        b=S2SWPtT/M/syRcrKZkmf7cTIlGoNSAoFBqXcGHzsBXBwksOB/jdBHjM+B4kCUFe7xW
         HMaseIsYv3BLqm0ISWVC4ufjBRBt3vamTWmVwTTjiYapxQUBzxbO2bVnET7FReThMne/
         lZTWjY/tYpkfyymfnK1S2cxTcQTuTHccGTKV+v6ROxxVQvKBeZWRbEaplV7HMNjJ6YCp
         W+WQ53v3Tw5hHJ+I8KETie4FKYdy513nwVm3TfD8D6FQwq3J0zhbex5a0EOenzPBUxSc
         Qy5OMqqF3IdF1CWNBHhnQvlzkjMDFkfX3Oo0T/8ekAjtoa32A/5UXEe+oTfwMvXUV9U1
         5aPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515164; x=1775119964;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VmPvkIy3tf1J6J+2oDH92ejHRFaN+YHsg5wdlsi6hv4=;
        b=OqEsu5jD2q4+gJ2FGJVsV2/44dyUm+h3x2c8X+I36Bcux8umzeUTe2jUeEF0TcI4Mc
         u9CUgonnFaPW7rZlvtyVyWgLiyAyv3aJAEkyudHTViJcT+JJpFyUphee1pdPQKGjgWFR
         WDcfTQju3Ibn7ojoRBbmanm/1GU9o5zA0lq/KNvGj2cHqVHl4VrwJMWsydrnP2Bal+m2
         WBad5X6IUq5OljwLUJYASEE/V2/q/vRIPtBQLlHXi29NRvu22Uea3eFqi+mojbhDT120
         tt4FAMSMKVjCwaZ0Oke/r4RQ6RWAJ0fW97036lG4b+rD1pEKOq4yPvClGRVos307Mk/R
         q+fw==
X-Forwarded-Encrypted: i=1; AJvYcCUi1E5vAhrJEQgvt1UN9/o2vbTktwmPi0SnT+Egn88UQVChKycuDmLQlVXm2BYb7qtklATBeK4ZQtH3Eoa9@lists.infradead.org
X-Gm-Message-State: AOJu0YytlTz7Vgt0x40fAiz7UquRi9Ht9SLsMVNfRVjjHKLJkgSr40Sm
	z4SPGCP7mQ1FHtOPgEx+g73eG5KtczP09EZs8iMBL7DLPnuCoMrC5pxX2bE1xzk/vOU=
X-Gm-Gg: ATEYQzzqrWFak0J3dfH+046uP3REcDg/N2m1UBXkMAHkAT3MLoPHjjf5AN/Y43tMn7d
	0wU00wBj+eqy74zPebCGIcp+9c8AxN8OabL+LMnr/y5WStVcgJ8ZagsUT5BMGfMWbVnuOGY7FV+
	pMEz7Pro8jvYTHB4XgabtdeIPGX7a4kORyZW8l13ZmmURnmt4BUP5XAKZHPR8DePXhHJLLfhu1C
	v39o5Bj+QZ967NWr+32yLAFfxOz47PkXPeFRdG6ylscvMpJ7215E6y2gZeF/a5ewUln76aCU1TV
	m04RieUz7yxRRSX7Rlo8ebHuU6L0ckYfSYunvJksRmO16ae7bmdSMzl495yRP9pRVaWXT9NEiqQ
	g/g2vjZy+hQgE2BCt7rSkUW3sEBi8yyZbg8nL/7HoIRP+4Q67614YxXUitDc8Bh+3N9a2G8xRb3
	3UY513cLq64be6MwkiLfXrQhBx+Azs2Zb2cv4e/clkFHolVZ1XRqSqGte02aAJlqvmnqXGTsnBo
	8Z+uq8=
X-Received: by 2002:a05:600c:4e93:b0:486:f893:56c6 with SMTP id 5b1f17b1804b1-48722bd529fmr12331585e9.10.1774515164267;
        Thu, 26 Mar 2026 01:52:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:8431:f88b:714d:f78d? ([2a01:e0a:106d:1080:8431:f88b:714d:f78d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722d236a9sm36907265e9.11.2026.03.26.01.52.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 01:52:43 -0700 (PDT)
Message-ID: <4b2ba22d-7d0b-4c71-ad83-46d198718fec@linaro.org>
Date: Thu, 26 Mar 2026 09:52:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 3/9] arm64: dts: amlogic: t7: Add MMC controller nodes
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org
References: <20260325-add-emmc-t7-vim4-v4-0-44c7b4a5e459@aliel.fr>
 <20260325-add-emmc-t7-vim4-v4-3-44c7b4a5e459@aliel.fr>
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
In-Reply-To: <20260325-add-emmc-t7-vim4-v4-3-44c7b4a5e459@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_015246_509184_0231B08F 
X-CRM114-Status: GOOD (  13.64  )
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

On 3/25/26 10:15, Ronald Claveau wrote:
> Add device tree nodes for the three MMC controllers available
> on the Amlogic T7 SoC, using amlogic,meson-axg-mmc as fallback compatible.
> All nodes are disabled by default and should be
> enabled in the board-specific DTS file.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 39 +++++++++++++++++++++++++++++
>   1 file changed, 39 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index 016b5429c8d1b..62c87d0ef7065 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -374,6 +374,45 @@ sec_ao: ao-secure@10220 {
>   				reg = <0x0 0x10220 0x0 0x140>;
>   				amlogic,has-chip-id;
>   			};
> +
> +			sd_emmc_a: mmc@88000 {
> +				compatible = "amlogic,t7-mmc", "amlogic,meson-axg-mmc";
> +				reg = <0x0 0x88000 0x0 0x800>;
> +				interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
> +				status = "disabled";

move disabled at the end of the properties

> +				clocks = <&clkc_periphs CLKID_SYS_SD_EMMC_A>,
> +					 <&clkc_periphs CLKID_SD_EMMC_A>,
> +					 <&scmi_clk CLKID_FCLK_DIV2>;
> +				clock-names = "core", "clkin0", "clkin1";
> +				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_A_SEL>;
> +				assigned-clock-parents = <&xtal>;
> +			};
> +
> +			sd_emmc_b: mmc@8a000 {
> +				compatible = "amlogic,t7-mmc", "amlogic,meson-axg-mmc";
> +				reg = <0x0 0x8a000 0x0 0x800>;
> +				interrupts = <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>;
> +				status = "disabled";
Ditto

> +				clocks = <&clkc_periphs CLKID_SYS_SD_EMMC_B>,
> +					 <&clkc_periphs CLKID_SD_EMMC_B>,
> +					 <&scmi_clk CLKID_FCLK_DIV2>;
> +				clock-names = "core", "clkin0", "clkin1";
> +				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_B_SEL>;
> +				assigned-clock-parents = <&xtal>;
> +			};
> +
> +			sd_emmc_c: mmc@8c000 {
> +				compatible = "amlogic,t7-mmc", "amlogic,meson-axg-mmc";
> +				reg = <0x0 0x8c000 0x0 0x800>;
> +				interrupts = <GIC_SPI 178 IRQ_TYPE_EDGE_RISING>;
> +				status = "disabled";
Ditto
> +				clocks = <&clkc_periphs CLKID_SYS_SD_EMMC_C>,
> +					 <&clkc_periphs CLKID_SD_EMMC_C>,
> +					 <&scmi_clk CLKID_FCLK_DIV2>;
> +				clock-names = "core", "clkin0", "clkin1";
> +				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_C_SEL>;
> +				assigned-clock-parents = <&xtal>;
> +			};
>   		};
>   
>   	};
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
