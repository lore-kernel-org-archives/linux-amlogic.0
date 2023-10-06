Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CAF0E81E03
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Oct 2023 14:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TAQXPPrlAxB7jU3b95UIf9XLLJWXm5Pza7m94J/vht0=; b=DLLI68NgVuHxg7pyzmjN5iFwXT
	DPPSNjCtL14NRURwSI5SbsCIrYdYkP7GKYPwbQ6Nbh7BaRz9jqiE6YhmEgqNuLtWylf3ivHZuDqye
	8Y1CcPqtL2EpQTA/hoENG98bfJTJPu84v6FGRgPwvci0Yh8O0f4CWGSxxQxcTyOqlFsTH0ukE0KPc
	WrxFtbwhfo4HqWCt8z8lZUrmXwX/4+EEs8uOwqqqs0SRAScK2m5N9Z6Du8IqmT+lEo3kNMq2v5cbP
	VuLOxZkhB+k1ehwQ0PmMAB2y4lbTkqCA2B0pQ6eyXgKJpWmXp6RMJLao1xmLWDAYXMxtilE9HElkW
	731D7oFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qom6R-0060hK-2E;
	Fri, 06 Oct 2023 14:46:55 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qom6N-0060gV-1Z
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Oct 2023 14:46:54 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4054f790190so21189455e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 06 Oct 2023 07:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696603610; x=1697208410; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zMY6Oywu9+xD9eu/3FX3tlRBq0A2AjLLPkWOIrzo07w=;
        b=xI99P4CIobAl0Sy30mS5fEY+RQN79VrYjVY7hv9L87StGJwVl0GYKGaFSaojUzdWbm
         wG0IZwAN317QAbc4BzLe56lpyY4PmchOnRaoBDjxbolHROXK2bI5OXTWR8wABqW1d1OZ
         lsJQ3NGAq6oDvi/OviL0E3yjEdErJr5b6JIeK6bItaoNJQPk5JweSJcMIUyFQBRl/5MJ
         C3vBrnvo4ys8xAMF9QiwYsrhBXEi+Rr25kMsNYvImb+Lp1r4RDJDHYlaO0VWuCtlBp5A
         XkzVARjHIRvi00pnTDPfdFU9Da+49QIdu9ewUKGuJnuwUDI15c7OxthAkYWa6ZMEpaBJ
         b/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696603610; x=1697208410;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zMY6Oywu9+xD9eu/3FX3tlRBq0A2AjLLPkWOIrzo07w=;
        b=LorEI57bULsAIFsOD4BgnAryR6lua2n1arXG77i2UXaWSOlf21TTzoTPmeNWwWagfp
         xA2dKD2NgnO+EE1oHzobOHYX7X0iO8autcfODWeiyqOrHnTSa9dUr4PfMx0VOQItzOhg
         hBHYeeBpPwmcuOrGIqnhD0Jkykk6rso6jBb6Y532kjHBOAC/M4SkRgFmxXH7iSaNqyJq
         EZWt//XIxjr//tOuFR1AjGHAeD2Gx3m9/m3uCESrS/VuSwAPTFSmZJS+zoe7cDbiGAjY
         7unjt6yzM1163RgFm4bB7N52RixEY4ArFap4rN0/1kQCoAH9pCqsMM7bpiHdYsSZyJPu
         mBGQ==
X-Gm-Message-State: AOJu0YyDcsD9KJrQ72UPkhAwbDj+YU44JlLrWuiczfQ08pcVNVAnS9d7
	U6AWNEtLGmRk9UNK3Xuhe7pB8Q==
X-Google-Smtp-Source: AGHT+IEs8p5YrMMkbRPAukUwPzYqqFBywIqnknUGZ1/mKgg5n7mfYi2FPs0LeWV2gUT14L7JIx8BSg==
X-Received: by 2002:a05:600c:22d5:b0:406:52e4:cd23 with SMTP id 21-20020a05600c22d500b0040652e4cd23mr7724633wmg.0.1696603610039;
        Fri, 06 Oct 2023 07:46:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c8f7:4bc7:2e11:c133? ([2a01:e0a:982:cbb0:c8f7:4bc7:2e11:c133])
        by smtp.gmail.com with ESMTPSA id m7-20020a7bce07000000b003fc16ee2864sm3896804wmc.48.2023.10.06.07.46.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Oct 2023 07:46:49 -0700 (PDT)
Message-ID: <00bb552d-be6f-464f-9ca9-03a6d4ea26b7@linaro.org>
Date: Fri, 6 Oct 2023 16:46:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1] arm64: dts: amlogic: a1: support all i2c masters and
 their muxes
Content-Language: en-US, fr
To: Dmitry Rokosov <ddrokosov@salutedevices.com>, jbrunet@baylibre.com,
 mturquette@baylibre.com, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: kernel@sberdevices.ru, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 George Stark <gnstark@salutedevices.com>
References: <20231006114145.18718-1-ddrokosov@salutedevices.com>
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
In-Reply-To: <20231006114145.18718-1-ddrokosov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_074651_523896_FEE4AB79 
X-CRM114-Status: GOOD (  11.12  )
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

On 06/10/2023 13:41, Dmitry Rokosov wrote:
> A1 SoC family has four i2c masters: i2c0 (I2CM_A), i2c1 (I2CM_B), i2c2
> (I2CM_C) and i2c3 (I2CM_D).
> 
> Signed-off-by: George Stark <gnstark@salutedevices.com>
> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 144 ++++++++++++++++++++++
>   1 file changed, 144 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> index 823714bcb7a0..f53000a5d0cc 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> @@ -126,6 +126,106 @@ gpio: bank@400 {
>   					gpio-ranges = <&periphs_pinctrl 0 0 62>;
>   				};
>   
> +				i2c0_f11_pins: i2c0-f11 {
> +					mux {
> +						groups = "i2c0_sck_f11",
> +							 "i2c0_sda_f12";
> +						function = "i2c0";
> +						bias-pull-up;
> +						drive-strength-microamp = <3000>;
> +					};
> +				};
> +
> +				i2c0_f9_pins: i2c0-f9 {
> +					mux {
> +						groups = "i2c0_sck_f9",
> +							 "i2c0_sda_f10";
> +						function = "i2c0";
> +						bias-pull-up;
> +						drive-strength-microamp = <3000>;
> +					};
> +				};
> +
> +				i2c1_x_pins: i2c1-x {
> +					mux {
> +						groups = "i2c1_sck_x",
> +							 "i2c1_sda_x";
> +						function = "i2c1";
> +						bias-pull-up;
> +						drive-strength-microamp = <3000>;
> +					};
> +				};
> +
> +				i2c1_a_pins: i2c1-a {
> +					mux {
> +						groups = "i2c1_sck_a",
> +							 "i2c1_sda_a";
> +						function = "i2c1";
> +						bias-pull-up;
> +						drive-strength-microamp = <3000>;
> +					};
> +				};
> +
> +				i2c2_x0_pins: i2c2-x0 {
> +					mux {
> +						groups = "i2c2_sck_x0",
> +							 "i2c2_sda_x1";
> +						function = "i2c2";
> +						bias-pull-up;
> +						drive-strength-microamp = <3000>;
> +					};
> +				};
> +
> +				i2c2_x15_pins: i2c2-x15 {
> +					mux {
> +						groups = "i2c2_sck_x15",
> +							 "i2c2_sda_x16";
> +						function = "i2c2";
> +						bias-pull-up;
> +						drive-strength-microamp = <3000>;
> +					};
> +				};
> +
> +				i2c2_a4_pins: i2c2-a4 {
> +					mux {
> +						groups = "i2c2_sck_a4",
> +							 "i2c2_sda_a5";
> +						function = "i2c2";
> +						bias-pull-up;
> +						drive-strength-microamp = <3000>;
> +					};
> +				};
> +
> +				i2c2_a8_pins: i2c2-a8 {
> +					mux {
> +						groups = "i2c2_sck_a8",
> +							 "i2c2_sda_a9";
> +						function = "i2c2";
> +						bias-pull-up;
> +						drive-strength-microamp = <3000>;
> +					};
> +				};
> +
> +				i2c3_x_pins: i2c3-x {
> +					mux {
> +						groups = "i2c3_sck_x",
> +							 "i2c3_sda_x";
> +						function = "i2c3";
> +						bias-pull-up;
> +						drive-strength-microamp = <3000>;
> +					};
> +				};
> +
> +				i2c3_f_pins: i2c3-f {
> +					mux {
> +						groups = "i2c3_sck_f",
> +							 "i2c3_sda_f";
> +						function = "i2c3";
> +						bias-pull-up;
> +						drive-strength-microamp = <3000>;
> +					};
> +				};
> +
>   				uart_a_pins: uart-a {
>   					mux {
>   						groups = "uart_a_tx",
> @@ -377,6 +477,17 @@ clkc_periphs: clock-controller@800 {
>   					      "hifi_pll", "xtal";
>   			};
>   
> +			i2c0: i2c@1400 {
> +				compatible = "amlogic,meson-axg-i2c";
> +				status = "disabled";
> +				reg = <0x0 0x1400 0x0 0x20>;
> +				interrupts = <GIC_SPI 32 IRQ_TYPE_EDGE_RISING>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				clocks = <&clkc_periphs CLKID_I2C_M_A>;
> +				power-domains = <&pwrc PWRC_I2C_ID>;
> +			};
> +
>   			uart_AO: serial@1c00 {
>   				compatible = "amlogic,meson-a1-uart",
>   					     "amlogic,meson-ao-uart";
> @@ -437,6 +548,39 @@ saradc: adc@2c00 {
>   				status = "disabled";
>   			};
>   
> +			i2c1: i2c@5c00 {
> +				compatible = "amlogic,meson-axg-i2c";
> +				status = "disabled";
> +				reg = <0x0 0x5c00 0x0 0x20>;
> +				interrupts = <GIC_SPI 68 IRQ_TYPE_EDGE_RISING>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				clocks = <&clkc_periphs CLKID_I2C_M_B>;
> +				power-domains = <&pwrc PWRC_I2C_ID>;
> +			};
> +
> +			i2c2: i2c@6800 {
> +				compatible = "amlogic,meson-axg-i2c";
> +				status = "disabled";
> +				reg = <0x0 0x6800 0x0 0x20>;
> +				interrupts = <GIC_SPI 76 IRQ_TYPE_EDGE_RISING>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				clocks = <&clkc_periphs CLKID_I2C_M_C>;
> +				power-domains = <&pwrc PWRC_I2C_ID>;
> +			};
> +
> +			i2c3: i2c@6c00 {
> +				compatible = "amlogic,meson-axg-i2c";
> +				status = "disabled";
> +				reg = <0x0 0x6c00 0x0 0x20>;
> +				interrupts = <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				clocks = <&clkc_periphs CLKID_I2C_M_D>;
> +				power-domains = <&pwrc PWRC_I2C_ID>;
> +			};
> +
>   			usb2_phy1: phy@4000 {
>   				compatible = "amlogic,a1-usb2-phy";
>   				clocks = <&clkc_periphs CLKID_USB_PHY_IN>;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
