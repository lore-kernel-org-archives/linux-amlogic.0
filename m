Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CE4C61DD9
	for <linux-amlogic@archiver.kernel.org>; Sun, 30 Aug 2026 13:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tudt43YmfcKRPn4rKAe1TjrZGlIsUA1QvLH7Z6XHYjE=; b=IuQVLvr2HvJfxh3//mnW047S1A
	jQUJaLkzdtYfGK8RM/z5DZWwUzPLI6QeBeXQebVGatgEGBcJOMcoKkzb3rDw79EEWuTodeCizrOlC
	adrNqSonHRj9uww740EolRaLJuLFDXs/1zcK9GoGcsGIKwTeYamuonjwU47jhEUAKcCAHmrm11SA3
	qW3zrTXMxcyjkNI+10v6nElqyNx/TipRGFP/eWSyy8SlqR94nXApqW7uh61PumESbhviF2zdlOnhw
	cq/Ae8xJT/o+hZIh24ClUlSh6N/9zfqJ06eoJq5XBoqJjr9/puJW6Se+CBve1ZFDC2fZ5h+LJl45m
	LfXhSo1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0fAe-00000007j1K-2D6b;
	Sun, 30 Aug 2026 13:02:00 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0fAb-00000007izh-140z
	for linux-amlogic@lists.infradead.org;
	Sun, 30 Aug 2026 13:01:59 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-49b0dd3c9a0so18435875e9.1
        for <linux-amlogic@lists.infradead.org>; Sun, 30 Aug 2026 06:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788094915; x=1788699715; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rqekcWJTKXTHZtsMCquuZKmqeOHHO1OiGd6uuu0JU74=;
        b=o3G0v7oeXjdbRsNi6KUhBKk+O/DCsVa7fGlW8GvzXVpZWLRQP0IA2HEPhEE5gXjd0J
         iZVdy/OXPOf6UjezlH+MObnqOXvPXseuCn0voXGbqid+4pUwJCmgiqfcY+BdmIlZw5uU
         4kO6aAUcFcY2i4HP00NpY+uquOnlo2cjFlC5JSAUhagpkNfztGH619pPG6N/3EJHfu2W
         2QA8yCgaDKrtJvjhvjQhJrlOygtWTWzVxTIEL127jFrzz9pL4Wpr2r7uGYw0IVnJX8qE
         EMTFyCnYC2scc00cgGJ6tHuMCqIvuCyILaHWhnn/TTkZSQDVmj2LpYHhO9amNBhD+RJ+
         Qfcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788094915; x=1788699715;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rqekcWJTKXTHZtsMCquuZKmqeOHHO1OiGd6uuu0JU74=;
        b=Op/x3Bs0gp4BQ/va8m97m2dMyiq3dAl5z2OBW1rFwdElppZX5CymlbWHwetesXKtqW
         hB21IaJKZwSXusRfEi08xOls1+bU5/HyqOa8Ioxi5MB+tHCgMFv1ckrfRRl8kbzQqUNc
         DNAjLWg/2wsTUSMlsQ9QXrkpd9IQF3lfpL/2JaElmOtgII+bCUIKe+mFQQrPKjWWPmAb
         1Q/XSGeQgsWOoTXgLDIJMkOc+SUcucdWPx+Ha5CxuRq0JPTeo9zLsxaodMpK/M/ue/sr
         SWEArkmV0ChSlBPuIhwRNoTbxiWzFsFMf+T7pThwNcwzE/2cob358C2EeDqnCTvRdcGd
         uNJw==
X-Forwarded-Encrypted: i=1; AHgh+RpB2x8NwNehPzOHY+9cIFqbZydcPrI7SRyLHHV5VxnQZl9S6+WCRVhLGTkNwxp5jTkosyaH7PcAbEkW3JX9@lists.infradead.org
X-Gm-Message-State: AFuF++nRhjL1Iv7TI8P5NmWamTOTNEtNotF3eL3MT2m35FCEjKCkSapR
	N2xk6/dVJNMDU0MJzibJQ3hQlHkOudETk3wQu/nEMJ6QiR7UcNfcGE0sV30gEKf4/bE=
X-Gm-Gg: AR+sD12SdA2iVQ0xqMnJ55blI7fdqSa/WIu/2PcKNHI5qnEnPa+RYHvmBzFZRU7xz6T
	+iX1CUTdgUqFQievRwRaia1VlhLPLqzg8RtlDajmyT0cV4IDfKAbTibQcn71UTs9woYUG7T9wfZ
	BvuSEX2u7TKLB0oFU8q/1z+DXJyi198F+41T/SGU7RZ8O9LWHN8e/An1dhosJ73yj4j4Ssu+lDG
	6thNfHoRRJH0ev1RQdr0ugwVh+SP13+CHZt5717RbSYljfdEpNBu5GlM83qttW7WweoOYBLGx4J
	AEN4EeaEh4Tz1rWb5EMMamfRujYHQDYVTMxuL0Pc9iyYQ/PgDWPiivhkA0Ln+A+ms2YoI8Mk9mb
	HM3pKy2WJ8sdxgWSxYvMd7UNMmpai7LQVBEjAYdqM+U5TFH+czk7ZOaWuM0OTTlUVvUDza1n2Qd
	KG9EbP+Q+4OxfbxpXNmJLuFKhFfKlEmNJgLQt2+C23NKRVLLnFQMKNzUgh7UAKnlbcjfK6UjY=
X-Received: by 2002:a05:600c:524e:b0:49b:9438:7785 with SMTP id 5b1f17b1804b1-49b94387aaemr213444345e9.4.1788094915126;
        Sun, 30 Aug 2026 06:01:55 -0700 (PDT)
Received: from [192.168.1.36] ([83.214.235.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9266be71sm449355905e9.2.2026.08.30.06.01.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 06:01:54 -0700 (PDT)
Message-ID: <2bbff6c2-7308-4152-b7fa-f24e95541aa5@linaro.org>
Date: Sun, 30 Aug 2026 15:01:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/4] arm64: dts: amlogic: t7: khadas-vim4: add the
 PWM-driven supplies
To: Lucas Tanure <tanure@linux.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Jian Hu <jian.hu@amlogic.com>, Ronald Claveau
 <linux-kernel-dev@aliel.fr>, Brian Masney <bmasney@redhat.com>,
 Chuan Liu <chuan.liu@amlogic.com>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260829094758.23248-1-tanure@linux.com>
 <20260829094758.23248-4-tanure@linux.com>
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
In-Reply-To: <20260829094758.23248-4-tanure@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_060157_329890_FB5E1688 
X-CRM114-Status: GOOD (  16.91  )
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

On 8/29/26 11:47, Lucas Tanure wrote:
> The board powers its two CPU clusters, the GPU, the NPU, the memory and
> the always-on domain from regulators steered by PWM outputs. None of
> them were described, so Linux treated those outputs as unused and
> switched them off part way through boot. The supplies then drifted away
> from the levels the bootloader had set, which showed up as random hangs
> and memory corruption.
> 
> Describe each supply so it has an owner and is left alone.
> 
> The voltage ranges are read off the feedback networks on the board
> schematic. VDDNPU is deliberately not the range in Amlogic's own
> device tree: this board fits a different feedback resistor, which
> puts it about 40mV higher at both ends.
> 
> Fixes: 8c45bf9ae4ef ("arm64: dts: amlogic: t7: khadas-vim4: Add power regulators")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>   .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 110 +++++++++++++++++-
>   1 file changed, 109 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> index c94afaaf8826..77abfd555ec5 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> @@ -104,6 +104,66 @@ vcc5v0_usb: regulator-vcc-usb {
>   		enable-active-high;
>   	};
>   
> +	vdd_ddr: regulator-vddddr {
> +		/*
> +		 * SY8003ADFC Regulator.
> +		 */
> +		compatible = "pwm-regulator";
> +		regulator-name = "VDDDDR";
> +		regulator-min-microvolt = <690000>;
> +		regulator-max-microvolt = <890000>;
> +		pwm-supply = <&dc_in>;
> +		pwms = <&pwm_ao_gh 0 1500 0>;
> +		pwm-dutycycle-range = <100 0>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	vdd_ee: regulator-vddee {
> +		/*
> +		 * MP8756GD Regulator.
> +		 */
> +		compatible = "pwm-regulator";
> +		regulator-name = "VDDEE";
> +		regulator-min-microvolt = <700000>;
> +		regulator-max-microvolt = <922000>;
> +		pwm-supply = <&dc_in>;
> +		pwms = <&pwm_ao_ab 0 1500 0>;
> +		pwm-dutycycle-range = <100 0>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	vdd_gpu: regulator-vddgpu {
> +		/*
> +		 * SY8003ADFC Regulator.
> +		 */
> +		compatible = "pwm-regulator";
> +		regulator-name = "VDDGPU";
> +		regulator-min-microvolt = <700000>;
> +		regulator-max-microvolt = <922000>;
> +		pwm-supply = <&dc_in>;
> +		pwms = <&pwm_ao_ef 0 1500 0>;
> +		pwm-dutycycle-range = <100 0>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	vdd_npu: regulator-vddnpu {
> +		/*
> +		 * SY8003ADFC Regulator.
> +		 */
> +		compatible = "pwm-regulator";
> +		regulator-name = "VDDNPU";
> +		regulator-min-microvolt = <733000>;
> +		regulator-max-microvolt = <933000>;
> +		pwm-supply = <&dc_in>;
> +		pwms = <&pwm_ao_ef 1 1500 0>;
> +		pwm-dutycycle-range = <100 0>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
>   	vddao_1v8: regulator-vddao-1v8 {
>   		compatible = "regulator-fixed";
>   		regulator-name = "VDDAO_1V8";
> @@ -122,6 +182,36 @@ vddao_3v3: regulator-vddao-3v3 {
>   		regulator-always-on;
>   	};
>   
> +	vddcpu_a: regulator-vddcpu-a {
> +		/*
> +		 * MP8756GD Regulator.
> +		 */
> +		compatible = "pwm-regulator";
> +		regulator-name = "VDDCPU_A";
> +		regulator-min-microvolt = <689000>;
> +		regulator-max-microvolt = <1049000>;
> +		pwm-supply = <&dc_in>;
> +		pwms = <&pwm_ao_cd 1 1500 0>;
> +		pwm-dutycycle-range = <100 0>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	vddcpu_b: regulator-vddcpu-b {
> +		/*
> +		 * MP8756GD Regulator.
> +		 */
> +		compatible = "pwm-regulator";
> +		regulator-name = "VDDCPU_B";
> +		regulator-min-microvolt = <689000>;
> +		regulator-max-microvolt = <1049000>;
> +		pwm-supply = <&dc_in>;
> +		pwms = <&pwm_ao_ab 1 1500 0>;
> +		pwm-dutycycle-range = <100 0>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
>   	vddio_1v8: regulator-vddio-1v8 {
>   		compatible = "regulator-fixed";
>   		regulator-name = "VDDIO_1V8";
> @@ -172,9 +262,27 @@ &pwm_ab {
>   	pinctrl-names = "default";
>   };
>   
> +&pwm_ao_ab {
> +	status = "okay";
> +	pinctrl-0 = <&pwm_ao_a_pins>, <&pwm_ao_b_pins>;
> +	pinctrl-names = "default";
> +};
> +
>   &pwm_ao_cd {
>   	status = "okay";
> -	pinctrl-0 = <&pwm_ao_c_d_pins>;
> +	pinctrl-0 = <&pwm_ao_c_d_pins>, <&pwm_ao_d_pins>;
> +	pinctrl-names = "default";
> +};
> +
> +&pwm_ao_ef {
> +	status = "okay";
> +	pinctrl-0 = <&pwm_ao_e_pins>, <&pwm_ao_f_pins>;
> +	pinctrl-names = "default";
> +};
> +
> +&pwm_ao_gh {
> +	status = "okay";
> +	pinctrl-0 = <&pwm_ao_g_e_pins>;
>   	pinctrl-names = "default";
>   };
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
