Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E29DF36C58
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Apr 2026 12:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pg8NNL8oOm2hCLl3nLzqn0+cD+Rp2WnDtAkiRFQVIBQ=; b=CPiviVRAI4fQX2xJ0ojUuB+jlx
	k9Rg39GcuadxjiBJvypcAc59Lghyl9AQTw7vv2fDqiYhzRwVKQwge39lXtE1W9u/H4Qs3J7Kwtdh9
	jz9HHPr3TYOEoUNqplSMukf4Hw/XOq7zTRW/pLtpzcmE0Np3G7AL+uM2ii6/Y3XT63Ojj9nNSaZAS
	HndVOw4C81POpzKq1QOQ5iKjVjDCvDez85YP8R0+WbrxqYZn5BMA6sJAIp56s+elDO3f2d2jNapFn
	YuYSdyVeoN9GYkoSVHKz/xbI8/VikAj4+Ol/QLJrGqEeSEWroRwcq0Ynr1S7hm3vrCeKNdX0XZwko
	xqmkvfhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEnLO-00000006qur-25kM;
	Mon, 20 Apr 2026 12:03:14 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEnLL-00000006qsi-0MNj
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Apr 2026 12:03:12 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso9480965e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Apr 2026 05:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776686589; x=1777291389; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U8fwzwhILo+1C84/3tm8ThN3xB60ifomb9gC9Rp9WVc=;
        b=aa9CJR3Itif7loV/79n1gSmwGZm7MSwwgkLojJI1xPMtGxwWeNA25koL7NxiaWm4CU
         MX6d9zvV8lC/QU7ARTxpUsbsVM0L3ogYgvB4rhQXJmmYiHg+wJez84lx3+S7AiLq9VK2
         AbxnSyv5NBv82HxfCZziy3QyoYnZNq+8mWCdnUjGOQUZrFM+nIkFoWLy3hzFJkQdUKtx
         O9+4ESbUZfLoyOZ5roUlAJAZI+FUYyIUMbdKOS3monAtpl9HkbE6h2izEi/nQLrZJJjG
         y+Z3JdADUx8CvaGbIjXCMB/+HI4YbfPWNKthuWd5a7OjmL43RjlGORGNHdxtCswDf/yb
         KGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776686589; x=1777291389;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U8fwzwhILo+1C84/3tm8ThN3xB60ifomb9gC9Rp9WVc=;
        b=HGnLW6vfz71vCV1tAf78a4DsxnzJbVRmJeK3Vwva/Y9Oc4g1/KtJCj0sXiqBspBBS+
         DBNqZ77Pbcm9UvIv+K1P7WwHZ9aWcINt+5LXGxrrElkCxzw7XmMXk7ZrmOuQ1osLYTcC
         DSGNMrHdlyobXqjHV7fU/RLR/T96MhtqOlRgeJgUYRURf3GHQuiCoe3ghRcyoMA9/0VJ
         SueNyH0tNrWT/GGQNleABPjiXJXwk1S1sM7et3BEimYZATZAFcPYOjUHoJHxMJVKBmbs
         qfL+sVBKzYl37C0ngT0jeQyQBBNX0+CjH0JnMMO0GEeEfCs7KxXhWSslp0EiFU3RT/zn
         RtMg==
X-Forwarded-Encrypted: i=1; AFNElJ8lFsKVn/zhXcyPnpZAlYGJzHptMm6Crfgr3pl/6ydoUg6e8TcKIgFe+jwWuWzexdi+7J+6ddBgFoIiv8dV@lists.infradead.org
X-Gm-Message-State: AOJu0YyBKSICYHAXAN/y3DHbwDovM03gHyNd5CD1eb4XllUyOAFCIO9w
	NDUza+m2S8xdmqsw9Ze7T0nLU/ZTAMEBEkW6ekoD10ZNtb8huJ0tH4JYbKDgcWz0Nyw=
X-Gm-Gg: AeBDievGwxFVo7y9d/a0UfuSOQcut/rGyQq+EnPWNpxfHiWXX0JFAPmdDaFSZ0Tz7SV
	YlY/rtaq6h1WZmU2sbZ6F4lCLWe/cBfnOBOaP7abhX8PW6GwznenK8cPBB+ioto1QV52uyUg/Ob
	oY2PL+/nQ+idHiR2lhrWwxEPLpHK75DsMWhQj5FNULU30g8mszfVXdfttZgB63T+QLJmdzC66NA
	A2LMKtT6k1mxMGmIUe5RELxv0jcpwhe4ZIt1xwGrGUqEcejSBB+3IRJz2KVhr3WB/cmhhjMVlUZ
	dNiVds0gWHn/JyzCn3VSXN7W9UV3JV6P6SH3XCKka6rDdFKuIjCAGzLSFEblBPIHJZrLBmNhIlL
	KUjqvA3AsvIPjSqVsXiuJL5ppkxPPNL/FjiCHrSVdHhmn3ZS4VdBawOx4/HSaEDmpO7X8pCDljv
	JlmhI7ckXlmvueg5Iq/x53Dn+o8Pqw441j0+4ZuWueKpmZ/yjpDJVaruduT17qNvhqACrAvxYRj
	LNPq4+/QFFvdQkKxQ==
X-Received: by 2002:a05:600c:620c:b0:488:ae6c:42c6 with SMTP id 5b1f17b1804b1-488fb7786c2mr199792815e9.14.1776686588896;
        Mon, 20 Apr 2026 05:03:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:851d:cf13:ef26:f254? ([2a01:e0a:106d:1080:851d:cf13:ef26:f254])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7aa593sm89632355e9.24.2026.04.20.05.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 05:03:08 -0700 (PDT)
Message-ID: <11812932-d985-4e4e-ad6f-28e1badee216@linaro.org>
Date: Mon, 20 Apr 2026 14:03:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 2/4] arm64: dts: amlogic: t7: Add UART controllers
 nodes
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260420-add-bluetooth-t7-vim4-v3-0-669cd2530ae5@aliel.fr>
 <20260420-add-bluetooth-t7-vim4-v3-2-669cd2530ae5@aliel.fr>
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
In-Reply-To: <20260420-add-bluetooth-t7-vim4-v3-2-669cd2530ae5@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_050311_327566_60E34C3B 
X-CRM114-Status: GOOD (  13.31  )
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

On 4/20/26 13:58, Ronald Claveau wrote:
> Add device tree nodes for UART B through F (serial@7a000 to
> serial@82000), completing the UART controller description for the T7
> SoC. Each node includes the peripheral clock.
> 
> While at it, move the uart_a node to its correct position in the
> bus address order (0x78000) to comply with the DT requirement that
> nodes be sorted by their reg address. Complete the
> uart_a node with its peripheral clock (CLKID_SYS_UART_A) and the
> associated clock-names, matching the vendor default clock assignment,
> consistent with the other UART nodes.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 61 +++++++++++++++++++++++++----
>   1 file changed, 54 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index 4a55d9641bc9b..81c26b1e3e7a4 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -577,13 +577,6 @@ gpio_intc: interrupt-controller@4080 {
>   					<10 11 12 13 14 15 16 17 18 19 20 21>;
>   			};
>   
> -			uart_a: serial@78000 {
> -				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
> -				reg = <0x0 0x78000 0x0 0x18>;
> -				interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
> -				status = "disabled";
> -			};
> -
>   			gp0: clock-controller@8080 {
>   				compatible = "amlogic,t7-gp0-pll";
>   				reg = <0x0 0x8080 0x0 0x20>;
> @@ -713,6 +706,60 @@ pwm_ao_cd: pwm@60000 {
>   				status = "disabled";
>   			};
>   
> +			uart_a: serial@78000 {
> +				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
> +				reg = <0x0 0x78000 0x0 0x18>;
> +				interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
> +				clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_A>, <&xtal>;
> +				clock-names = "xtal", "pclk", "baud";
> +				status = "disabled";
> +			};
> +
> +			uart_b: serial@7a000 {
> +				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
> +				reg = <0x0 0x7a000 0x0 0x18>;
> +				interrupts = <GIC_SPI 169 IRQ_TYPE_EDGE_RISING>;
> +				clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_B>, <&xtal>;
> +				clock-names = "xtal", "pclk", "baud";
> +				status = "disabled";
> +			};
> +
> +			uart_c: serial@7c000 {
> +				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
> +				reg = <0x0 0x7c000 0x0 0x18>;
> +				interrupts = <GIC_SPI 170 IRQ_TYPE_EDGE_RISING>;
> +				clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_C>, <&xtal>;
> +				clock-names = "xtal", "pclk", "baud";
> +				status = "disabled";
> +			};
> +
> +			uart_d: serial@7e000 {
> +				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
> +				reg = <0x0 0x7e000 0x0 0x18>;
> +				interrupts = <GIC_SPI 171 IRQ_TYPE_EDGE_RISING>;
> +				clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_D>, <&xtal>;
> +				clock-names = "xtal", "pclk", "baud";
> +				status = "disabled";
> +			};
> +
> +			uart_e: serial@80000 {
> +				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
> +				reg = <0x0 0x80000 0x0 0x18>;
> +				interrupts = <GIC_SPI 172 IRQ_TYPE_EDGE_RISING>;
> +				clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_E>, <&xtal>;
> +				clock-names = "xtal", "pclk", "baud";
> +				status = "disabled";
> +			};
> +
> +			uart_f: serial@82000 {
> +				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
> +				reg = <0x0 0x82000 0x0 0x18>;
> +				interrupts = <GIC_SPI 173 IRQ_TYPE_EDGE_RISING>;
> +				clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_F>, <&xtal>;
> +				clock-names = "xtal", "pclk", "baud";
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
