Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06DA106F303
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2026 08:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b7Ap3XZgMIjWpHQOyjwSr+QGthenoWDEVgJHmM25R8M=; b=bWJfEkggR02vjG449Ho2CujZNg
	6oCo0ztup/2SzEOXa1Mw/4xhfCxYzYeT4VPTI8GFfdTggA9w214mfFWeBSkuzzJjVNauJ4po0eAYA
	uW6iy98Yoo2ygIgjlgekC+vXBDCQeowQ5MnoqzlKAX4CZK4R7U1xXlssQLziuEJKPo50yXEPNHEGa
	TF7a7rltm/EPd8Hyp1PhPBL4PRFT6UhIkIFBj8hqPZbVGFeOz3oCzpAeKe2z3PTeipwgSfztAEcSV
	iyDlLK95NQPLlMJMCaxfRj90q1bU7746JVF7wxV+3ZkkUCgsc63rhkkwlKpKawQweZeZ+VU+SFVYi
	PRNBTeow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gUa-000000054ht-0KPk;
	Thu, 26 Mar 2026 08:55:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gUW-000000054g3-3skv
	for linux-amlogic@bombadil.infradead.org;
	Thu, 26 Mar 2026 08:55:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:Reply-To:From:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=NPOq+t0BPIjTXIy85z0pLZNyx1Sqnvxn5kHxjGZM2Uw=; b=MIc6EmNxG0VMPv4ht0Vb47416I
	f6q3n0ysiigi+OQkkqHwzpCqY2xvfHSAiXvEUwDzzQcym5+en9gzpvkfDcw45fJg5moH6mRUfnPjW
	SB+2ou7oF7kAoL//xbeC/zZVqoCKP1j3LnbiVx81hnLu1qYkJ4ubxroxSNhfKLuEoLScS27fpkxKb
	/2nvQKPzaI9kRQkSP2IozzA4fdnN3NuTx1H/GcQHrwXCTHxWZOWuRksJo7EyYG2D0d0MpFFfyMpXI
	xEsG72HsOyQmbySTYggO7oaDRymLl0zJdAyiA7MZOD5LMjpFhNyQ4/U/cMJcDsKZZmyElrLpg7e5L
	QecU2JJA==;
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gUT-00000007o1R-105N
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Mar 2026 08:54:59 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-487035181a7so4237455e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Mar 2026 01:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774515295; x=1775120095; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NPOq+t0BPIjTXIy85z0pLZNyx1Sqnvxn5kHxjGZM2Uw=;
        b=rIZ1sjzpyf5VI9VoGMSYPI4ofxxgn/+hnOze0HOr7arzriateeiNxIQKgLIKzJZver
         /yqRm5eRSNoN4+KW9Fs/lKrQxMH5onBJaONDEZxpdP+ImPYDrPrTOJTY3UPHzSyc62s1
         ZSMZuhLTsKp3iy5hScXK5t335/vBJh45BG4myb66uzuTeDnAlDwDJ9Q8y5M0Kzm66TAD
         VvHZgCk0xSGx8PsIbnBxBYIbGWpJ4HI813iTCb7UkzaT/ZhFiehjsM/PxJhSLE33frCT
         R/rXtwkYtd0TSgpYJ0SFHUEt4rtHP/zJNj4Pp6evWp8Gl+rz3oXdBMpe1UHXMsPBJzY6
         JlhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515295; x=1775120095;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NPOq+t0BPIjTXIy85z0pLZNyx1Sqnvxn5kHxjGZM2Uw=;
        b=CLzSpbpKPkeXKkRWYg3+P+JN0QvmJ1dMxQhoiTjpOPw1+hiYdfRc5QrAMggUHDO2AT
         HWar0/UHyz8J5IR9g33goc/meJDzKA23DkH9zn0yWQiWih5cXjRFlg0tMudCuatnmpgr
         lO8ooRIK9rnbaP+I0Dxwc9Vb3O2pLpZ5YVdjReIgdOx582k5KKdLEc8jigYm/BqXCzZr
         iZQd8LwzKWeRNh3QQxXlKvcR+yqOhVDBT06ZBk7Ywd1DH8EgCed7pfmSQdVk1SfbSKqS
         5Wyi66kN6hzAW84now/oHcRyX86ep9CAkJniQCFDqn20YQKC/o9a35VsyO5dxscvvSRR
         H2NA==
X-Forwarded-Encrypted: i=1; AJvYcCUa2Zq7mZ1F6Ko0/oK5DhjYauLZ7lPk4ja1Uga+hxENaO6aua7jCx4ehL1sx/e4g8RNBDOTYPsdNJUD1pa4@lists.infradead.org
X-Gm-Message-State: AOJu0YxPVbHf967B90ppugI486swNeTJp2z2ifEHhwlHlFGLSqJt6msB
	CYjwzMN7eU6FHrQd4z8fcDcfp+Tf6O6XimYLjXYE7KPunmHzPU1+JFiMNufKFEOCMKM=
X-Gm-Gg: ATEYQzz2sZaOZ8cZdMeOIgehvzwFQgknC80jZWrrzvVdobmELYLsTq6A/5UcqEBX7Pg
	dKG+1+5IkRnZ/yJWGo0pnvZOAPzEh7Ech5gXSE55DiSz38X1RMJatSidjkjGy6KhL8yAbNe5W98
	oSo1jnnEyHv3yWiqhWXYqYOmIN47Nc07w1daHBiIeAIAaXHcovwZvo3dpS7CAw/W/i2Afo4hnQM
	qRFhlwCVblmoz7smyvW7DPc5ai5cTpDeZC+4vXx2gIskOQdMswNjzotWlL+EdHXvL/lvyolNOSV
	QqAi29d7tlYzbb6dbBEEg81724fS9JHZnWwe1gOmvtoGbhgs/80TNNrjG6NOcNEAeo9J+DSVefo
	ukf4eFS/5/2YBfAyEybGpX0XW6wPL46eqh/1Ti9ZWH9rHjCgknD1J2lwNMnD48vqeqNALLZXXtL
	FNQ9VtPJ1Vb9r7FeqWLN7QLXe998j+zqGF6nlacOhCKVQLcfjxgk3EkaAm2MpiH+ptnzEZZ10mD
	0OIdfo=
X-Received: by 2002:a05:600c:3e1a:b0:486:af22:4a2a with SMTP id 5b1f17b1804b1-48715fbabedmr88067005e9.7.1774515295443;
        Thu, 26 Mar 2026 01:54:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:8431:f88b:714d:f78d? ([2a01:e0a:106d:1080:8431:f88b:714d:f78d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48720901b90sm10376515e9.17.2026.03.26.01.54.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 01:54:55 -0700 (PDT)
Message-ID: <512d95b5-5348-4c7c-961c-b6ca1431cee4@linaro.org>
Date: Thu, 26 Mar 2026 09:54:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 9/9] arm64: dts: amlogic: t7: khadas-vim4: Add MMC
 nodes
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
 <20260325-add-emmc-t7-vim4-v4-9-44c7b4a5e459@aliel.fr>
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
In-Reply-To: <20260325-add-emmc-t7-vim4-v4-9-44c7b4a5e459@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_085457_453358_97B880F3 
X-CRM114-Status: GOOD (  13.77  )
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
> Enable and configure the three MMC controllers for the Khadas VIM4 board:
> - sd_emmc_a: SDIO interface for the BCM43752 Wi-Fi module
> - sd_emmc_b: SD card slot
> - sd_emmc_c: eMMC storage
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 90 +++++++++++++++++++++-
>   1 file changed, 89 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> index 770f06b0b16c7..5a73ae081036c 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> @@ -14,7 +14,10 @@ / {
>   	compatible = "khadas,vim4", "amlogic,a311d2", "amlogic,t7";
>   
>   	aliases {
> -		serial0 = &uart_a;
> +		serial0	= &uart_a;

Spurious change

> +		mmc0	= &sd_emmc_c;
> +		mmc1	= &sd_emmc_b;
> +		mmc2	= &sd_emmc_a;
>   	};
>   
>   	memory@0 {
> @@ -159,6 +162,91 @@ &pwm_ab {
>   	pinctrl-names = "default";
>   };
>   
> +/* SDIO */
> +&sd_emmc_a {
> +	status = "okay";
> +	pinctrl-0 = <&sdio_pins>;
> +	pinctrl-1 = <&sdio_clk_gate_pins>;
> +	pinctrl-names = "default", "clk-gate";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	bus-width = <4>;
> +	cap-sd-highspeed;
> +	sd-uhs-sdr12;
> +	sd-uhs-sdr25;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;
> +	cap-sdio-irq;
> +	max-frequency = <200000000>;
> +	non-removable;
> +	disable-wp;
> +	no-mmc;
> +	no-sd;
> +
> +	power-domains = <&pwrc PWRC_T7_SDIO_A_ID>;
> +
> +	keep-power-in-suspend;
> +
> +	mmc-pwrseq = <&sdio_pwrseq>;
> +
> +	vmmc-supply = <&vddao_3v3>;
> +	vqmmc-supply = <&vddao_1v8>;
> +
> +	brcmf: wifi@1 {
> +		reg = <1>;
> +		compatible = "brcm,bcm43752-fmac", "brcm,bcm4329-fmac";
> +	};
> +};
> +
> +/* SD card */
> +&sd_emmc_b {
> +	status = "okay";
> +	pinctrl-0 = <&sdcard_pins>;
> +	pinctrl-1 = <&sdcard_clk_gate_pins>;
> +	pinctrl-names = "default", "clk-gate";
> +
> +	bus-width = <4>;
> +	cap-sd-highspeed;
> +	sd-uhs-sdr12;
> +	sd-uhs-sdr25;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;
> +	max-frequency = <200000000>;
> +	disable-wp;
> +	no-sdio;
> +	no-mmc;
> +
> +	power-domains = <&pwrc PWRC_T7_SDIO_B_ID>;
> +
> +	cd-gpios = <&gpio GPIOC_6 GPIO_ACTIVE_LOW>;
> +	vmmc-supply = <&sd_3v3>;
> +	vqmmc-supply = <&vddio_c>;
> +};
> +
> +/* eMMC */
> +&sd_emmc_c {
> +	status = "okay";
> +	pinctrl-0 = <&emmc_ctrl_pins>, <&emmc_data_8b_pins>, <&emmc_ds_pins>;
> +	pinctrl-1 = <&emmc_clk_gate_pins>;
> +	pinctrl-names = "default", "clk-gate";
> +
> +	bus-width = <8>;
> +	cap-mmc-highspeed;
> +	mmc-ddr-1_8v;
> +	mmc-hs200-1_8v;
> +	max-frequency = <200000000>;
> +	disable-wp;
> +	non-removable;
> +	no-sdio;
> +	no-sd;
> +
> +	power-domains = <&pwrc PWRC_T7_EMMC_ID>;
> +
> +	vmmc-supply = <&vddio_3v3>;
> +	vqmmc-supply = <&vddio_1v8>;
> +};
> +
>   &uart_a {
>   	status = "okay";
>   	clocks = <&xtal>, <&xtal>, <&xtal>;
> 

With that:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
