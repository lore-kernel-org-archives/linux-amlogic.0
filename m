Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 987ECC79FB9
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Sep 2026 07:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qqAjC7uWOLOKRVm3hXOsSaXocLcAcb7vDr1DaIXKMh0=; b=gIIMc/OpRbq1fBP9LjjKGNTeTJ
	UGAc+U9F2M/ivN/tzKsxwyH3u5OHQd5LDTauaRkcPmLSmCmPyq+b9aeSvoZoFwIeoIUKpsiadCQ2t
	8SBLidMglifaavVe1N5iiBJEUWCWgrArfVVETALBUEuTaJsnYLC0e1gUmpYW/TtNzbKVA0guPBeC9
	4jezIH0vnmLgLNglnw/kTWFm2pPX3PGZdIonxvYrIwTjqpn/dMrfsNo6UBVisDdC9iC3sDA2VEjUQ
	mo5cER60IM2uv7H3DJ9+QySHzV9KdDptQuPpn/2IKGBnwscX6P9ealM6AUnJgqEdnIlY8p5Xo6K/E
	cjedmnlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Yya-0000000DbCd-0612;
	Thu, 10 Sep 2026 07:13:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YyY-0000000DbBK-1hwN
	for linux-amlogic@bombadil.infradead.org;
	Thu, 10 Sep 2026 07:13:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:Reply-To:From:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=Z8Ga3BtRui77Q8Bka8GkpeTdclh0OZRER9FqEReJlpA=; b=aVfueZyKlspaCQuEKe4Vu2ZSuO
	plN9TnKJ9HMhQEByOPdxkmJN9WffWeKmu07E0XDpSza4tWVRfDRKcWIjeua/Xh7o31F8bgoU84XWk
	pHrK10LI77qLdVatzU2PyO1I808EL3UD8NQ5OUi81v7wnoT8dzMb7Es5dW3cCkXO1qbNYTA0/+gfV
	vqzFATo2ENgpfElM2keHvgesJzlhv5EJ90cWjZJzX+dHKPVfSOWXzqxi+5e7GqqVjnreqoXHpxHq7
	RyvBK/r65bLBfNMB9s9WyEHA5ipNXf7hFaPHDUvBg198Wogw+gNHN1J/G6GGQBH0PJhWiWoBLisAC
	70ktAmmg==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4YyV-000000027OJ-0DDc
	for linux-amlogic@lists.infradead.org;
	Thu, 10 Sep 2026 07:13:37 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso12355985e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 10 Sep 2026 00:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789024410; x=1789629210; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z8Ga3BtRui77Q8Bka8GkpeTdclh0OZRER9FqEReJlpA=;
        b=eAnZmnGV+1CVbTvgElJp7T/QwBS+T3oYIaA4OPaSe31crhwwE+EzAw4TRnII/NyclK
         DNpkIx/I+YagRA6d+V7bNE/YqIZz0wPYwoTl75l+ClsaKJigflhdG1LGwg+/Sta1TqOT
         21jHeR0tpjhfjfpmLbbv9fHTTMKrVjSuyC+oelWXDRD33rzPxOccWS5uyXebZWCPPORR
         +4Hl4lZPGesolPo39oo+i6eUiDsin0GkYa84q3kFpSDapWHtWDEF89QfbFB4jSOB0j8U
         TQ3Zg2HlNQofa8QE9WlcEyN5Q4gV2ThD7I9oodCld0RdI2lxwL+4FEo1PryhadBrqsAc
         uTgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789024410; x=1789629210;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z8Ga3BtRui77Q8Bka8GkpeTdclh0OZRER9FqEReJlpA=;
        b=Z+s48YfWgJV7nqZ9tZc9qCv4aI9gKdSE+epjTkJFrKNaJGl3BfJmXWavu2nfit9qFq
         detmWqFkvQoPFNJxzSmUxh8xJAeRY9fRROwS8JUCAD8/4+pT0p8bSu8hlOBMvIJ5RvQA
         AswD2ibCiEsCUToHAhGX5oLtX9qhy0Kq2ofFFFTyi76zOxjUQWoc4e31eaTNzwJbs1jv
         F6Jp81vQLDRgFoqty2FdvjQmVx2v0afGXracE4FFHtFRhaSnUzn4NtUAu/eveWkbinjr
         R8jipzN4STAdOWV75LU1y/C2yBJyzZsj3hFhgp9ME/q6qICdwUi9dy9gLFsQB9cGQekn
         ohwg==
X-Forwarded-Encrypted: i=1; AKwUvBzF3bkwB9hpnw7dh/7fQWtu1TjN94x9M1akVxphS4DDnfFYcDENr+02QdiRIBRegLYgk2uAZBGpBJ7o24G+@lists.infradead.org
X-Gm-Message-State: AFuF++k+GDJEY+dtn8fxkEzwyLJR2iqVxqbVHSZPsku6OqYBc8xzpAwn
	eZ0ILodwWgw6O6b6f4ay7swFcpmY7YXnF6tnbf/g4gxu6YIqPez+wpfHC21ZtSZS9cM=
X-Gm-Gg: AYBFou1OKq8aXnGcmMaEYllZIccW//HWAsuFbMakv6sLoaFie9tMRiU+8MmEAMo5uPP
	I+EfeGVt7W9v/zHNGE8RoEA4Ehu6J+X+G34oFd1/evOEwt8Fjq/N+3kD82zll45UozJ+TjalN7s
	Laz0BzLYqeY9HgfmdsgO2voBRV1Ovb/cShi3MqUPipPbIJuSawiAaVTw3QEieEMwdtn9YdyMsF6
	D62z6YqnaCrSwn4Gg4azDEcnZWErFBSJEe6RIvIhlrt3zpQ28vdJz9czdLZvZwUG5w+oDpc+fYi
	0K3bJY+NOuevK1nJ2CZDp96jjoSUxGuCGaS2br71vsesrAG+MRJq5luz5EWKk93qIOZtTuIU2IM
	O5SZooaordnt4T3qizBXcUQAltU3D/+UvlB26sq9aa46EnxRF7Dfuh+msgZjf9Eg6vm03CQYFof
	igsgI1ngbPw5bisq0pw5ULLutkYQB+I8VkbgUOzCmy1iPegOvke+LiaSSOjiWKSn5dXpmnmpfCB
	6rnrhud9xRH/DWsa8V8NFqjTYLccV1TITTXhRPztr3qZkqANpwGz330BZf6nwXp
X-Received: by 2002:a05:600c:a315:b0:499:a277:e8b5 with SMTP id 5b1f17b1804b1-49d258cefc8mr86177985e9.3.1789024410283;
        Thu, 10 Sep 2026 00:13:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:3caf:d840:c911:29a9? ([2a01:e0a:106d:1080:3caf:d840:c911:29a9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fc23fcsm99287025e9.3.2026.09.10.00.13.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 00:13:28 -0700 (PDT)
Message-ID: <22576e60-df08-4994-a7ce-130d5bae80d9@linaro.org>
Date: Thu, 10 Sep 2026 09:13:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/4] arm64: dts: amlogic: t7: add the pipeline clock to
 the MMC controllers
To: Lucas Tanure <tanure@linux.com>, Ulf Hansson <ulfh@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>, Chuan Liu <chuan.liu@amlogic.com>,
 Jian Hu <jian.hu@amlogic.com>, Ronald Claveau <linux-kernel-dev@aliel.fr>,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260905153234.133217-1-tanure@linux.com>
 <20260905153234.133217-4-tanure@linux.com>
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
In-Reply-To: <20260905153234.133217-4-tanure@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_081335_861588_C31C1DD7 
X-CRM114-Status: GOOD (  14.87  )
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

On 9/5/26 17:32, Lucas Tanure wrote:
> The SD/eMMC controllers reach the DRAM through a pipeline stage that
> the hardware design inserts in the bus path to the NIC_MATRIX fabric,
> clocked by CLKID_SYS_AMPIPE_NAND. When that clock is disabled, a
> controller that starts a DMA transfer can never complete it.
> 
> Reference the clock from the three MMC controller nodes so the driver
> keeps it running, instead of relying on the clock being marked critical
> in the clock controller.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index c3dc479b137d..dbb4a95652c6 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -730,8 +730,9 @@ sd_emmc_a: mmc@88000 {
>   				interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
>   				clocks = <&clkc_periphs CLKID_SYS_SD_EMMC_A>,
>   					 <&clkc_periphs CLKID_SD_EMMC_A>,
> -					 <&scmi_clk CLKID_FCLK_DIV2>;
> -				clock-names = "core", "clkin0", "clkin1";
> +					 <&scmi_clk CLKID_FCLK_DIV2>,
> +					 <&clkc_periphs CLKID_SYS_AMPIPE_NAND>;
> +				clock-names = "core", "clkin0", "clkin1", "pipeline";
>   				resets = <&reset RESET_SD_EMMC_A>;
>   				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_A_SEL>;
>   				assigned-clock-parents = <&xtal>;
> @@ -744,8 +745,9 @@ sd_emmc_b: mmc@8a000 {
>   				interrupts = <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>;
>   				clocks = <&clkc_periphs CLKID_SYS_SD_EMMC_B>,
>   					 <&clkc_periphs CLKID_SD_EMMC_B>,
> -					 <&scmi_clk CLKID_FCLK_DIV2>;
> -				clock-names = "core", "clkin0", "clkin1";
> +					 <&scmi_clk CLKID_FCLK_DIV2>,
> +					 <&clkc_periphs CLKID_SYS_AMPIPE_NAND>;
> +				clock-names = "core", "clkin0", "clkin1", "pipeline";
>   				resets = <&reset RESET_SD_EMMC_B>;
>   				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_B_SEL>;
>   				assigned-clock-parents = <&xtal>;
> @@ -758,8 +760,9 @@ sd_emmc_c: mmc@8c000 {
>   				interrupts = <GIC_SPI 178 IRQ_TYPE_EDGE_RISING>;
>   				clocks = <&clkc_periphs CLKID_SYS_SD_EMMC_C>,
>   					 <&clkc_periphs CLKID_SD_EMMC_C>,
> -					 <&scmi_clk CLKID_FCLK_DIV2>;
> -				clock-names = "core", "clkin0", "clkin1";
> +					 <&scmi_clk CLKID_FCLK_DIV2>,
> +					 <&clkc_periphs CLKID_SYS_AMPIPE_NAND>;
> +				clock-names = "core", "clkin0", "clkin1", "pipeline";
>   				resets = <&reset RESET_SD_EMMC_C>;
>   				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_C_SEL>;
>   				assigned-clock-parents = <&xtal>;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
