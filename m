Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C99AC25B79
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 May 2024 07:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u+TIq84UB67LVd91g8f4tdSFI224xvzZVQgygTfyHzs=; b=uae/osDctQHpqrW/xmVj7ZdTXk
	L5PuTrfYovBdTIG0yDIaqUFoJyf8+crwVuCTjtvt0c8LM9jYvOSORbEJgGY+eC49XsVehRI9VbuXQ
	os7y19VEIsv/xGcKKQSo6Q1CKiVjCU8MVLCx1PMX6RxdhghYFOf4JABcDGCGDKMoUCjOdfD2Pvakm
	Wqo82L4ImJMiGpXSSiuVj24eH+/qA30XxqqnmxElImfv8w6H1YTbC+e0EmjrE8e9Tq0ctBK8yPtsM
	PmVxry6mQBoT/sW9Waok6i/SYaaG9PAe0rfeXk8k9x4271EZaIrvcLPTIwfwutJ6cj1lpvX4X1xup
	fuPX+tOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA30Y-00000005Lpt-2jVM;
	Thu, 23 May 2024 07:37:02 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA30V-00000005Lns-2cfd
	for linux-amlogic@lists.infradead.org;
	Thu, 23 May 2024 07:37:01 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a59a352bbd9so300625266b.1
        for <linux-amlogic@lists.infradead.org>; Thu, 23 May 2024 00:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716449818; x=1717054618; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=517qvSXdAeDLW4FIicTVkU3rF1O2o6mhYuS9ir4DWD0=;
        b=ZTSg60rJTydNjVWEMh92cKMjqQvkTSIP+7t7gRJeAyBm5PyXAvSAo6eSDmt+zxEkyt
         aJRW2wyXcWbjGeGG8Iu16INhOGdNraL18Ry4QBkbpoFCAetjNHYlyDJiIkuYdM+1qA50
         K261d6CEJGqCW1PGA8Za4kiyuleYKYFCFrM4BmsLAAQDXLRZEL/nucKX8/uNKyhc7Wuz
         pKjyFFmH7DSEh/OLWt+YA6S4nGoKBNrXhgSAG1rr/kchJ245tPYo12Tmx3VP34ZQemYz
         WYraL+gGoPggEIw/FL/TC4M+6SGOpbuQwp74f9auDZlFFZb+fouuwPFVYI9RzhL3XmPJ
         EJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716449818; x=1717054618;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=517qvSXdAeDLW4FIicTVkU3rF1O2o6mhYuS9ir4DWD0=;
        b=VG3329kXrx87vVRXzYxe/o3rArP98WGNbSne+i2nlUJZPdR+afPcv4eRsFMwTUeM85
         jcCriJr53xbSWPxHF/WrYb8gXHDfjShD5BXPHyOaokCmtjp3Yl8uuMEANNYGN/jIIrd7
         Wqu2c6+RJ5zOlZkKluV/o5R9xPZcsbv3iEpWkR5pzpj0vxW7ttWfDf8+EIG1zSqiugqU
         7HhFDMDwrhzrhKH/WChJmQ8Q86wUZsZGno1GQi+wD451C/kXIMUWkXx/UOx6oAXlzuvf
         PGqemLY/cwofWMUNrCbomVEsPjRnbjiAqE+MHRnW3USCc4OuKiNmJMMlXyBO5EPuG76Z
         nh6w==
X-Forwarded-Encrypted: i=1; AJvYcCVSrLMvoT5Ef4TIOLZ0e5hpz3vQHwg1uhVZoh2x/pmS8ggAdLo0MzK4HOaN/v4C8BPv1sxL6uXpVr9NRtxiRQvtHVpyThWtB93YSNtTcDbOzBs=
X-Gm-Message-State: AOJu0Yy3QzZfqEXhrSHT0xGXJc10vOL/0cDGzJdZnZII1JedMN7J9D+h
	2jmdc9ZAXzPboALAVLlF9GeIyjte02Tb7NF1xASd6JJ1VWxiotEJoTABdsezk3s=
X-Google-Smtp-Source: AGHT+IG6yRYPHTkx4UP7bS+LPdO9N+uw3wcdJBXPD3HhxXbrQbG8b4XZKSEQl+RR/iDDrB5sc9xmaA==
X-Received: by 2002:a17:906:26d4:b0:a58:7172:1ab0 with SMTP id a640c23a62f3a-a623e91d1bfmr113098366b.16.1716449817236;
        Thu, 23 May 2024 00:36:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:825d:600a:c16:a973? ([2a01:e0a:982:cbb0:825d:600a:c16:a973])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6209f64ba8sm461839466b.210.2024.05.23.00.36.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 May 2024 00:36:56 -0700 (PDT)
Message-ID: <447ed20b-a505-4758-9351-522fd12049f6@linaro.org>
Date: Thu, 23 May 2024 09:36:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/3] arch/arm64: dts: ac2xx: make common the sound card
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Lucas Tanure <tanure@linux.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
References: <20240521222155.28094-1-jan.dakinevich@salutedevices.com>
 <20240521222155.28094-2-jan.dakinevich@salutedevices.com>
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
In-Reply-To: <20240521222155.28094-2-jan.dakinevich@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_003659_811184_5BC6AFF1 
X-CRM114-Status: GOOD (  13.97  )
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

On 22/05/2024 00:21, Jan Dakinevich wrote:
> The declaration of sound card and its dependencies is identical in all
> consumers of 'meson-sm1-ac2xx.dtsi'.
> 
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> ---
>   .../dts/amlogic/meson-sm1-a95xf3-air-gbit.dts | 87 -------------------
>   .../boot/dts/amlogic/meson-sm1-a95xf3-air.dts | 87 -------------------
>   .../boot/dts/amlogic/meson-sm1-ac2xx.dtsi     | 87 +++++++++++++++++++
>   .../boot/dts/amlogic/meson-sm1-h96-max.dts    | 87 -------------------
>   .../dts/amlogic/meson-sm1-x96-air-gbit.dts    | 87 -------------------
>   .../boot/dts/amlogic/meson-sm1-x96-air.dts    | 87 -------------------
>   6 files changed, 87 insertions(+), 435 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts
> index 9b2eb6e42651..90ae38c30592 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts
> @@ -7,73 +7,10 @@
>   /dts-v1/;
>   
>   #include "meson-sm1-ac2xx.dtsi"
> -#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
>   
>   / {
>   	compatible = "cyx,a95xf3-air-gbit", "amlogic,sm1";
>   	model = "Shenzhen CYX Industrial Co., Ltd A95XF3-AIR";
> -
> -	sound {
> -		compatible = "amlogic,axg-sound-card";
> -		model = "A95XF3-AIR";

model should be board-specific, as for sound node because dev board
variants can be different, so I don't thing moving sound to a common
dtsi is a good thing.

> -		audio-aux-devs = <&tdmout_b>;
> -		audio-routing = "TDMOUT_B IN 0", "FRDDR_A OUT 1",
> -				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
> -				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
> -				"TDM_B Playback", "TDMOUT_B OUT";
> -
> -		assigned-clocks = <&clkc CLKID_MPLL2>,
> -				  <&clkc CLKID_MPLL0>,
> -				  <&clkc CLKID_MPLL1>;
> -		assigned-clock-parents = <0>, <0>, <0>;
> -		assigned-clock-rates = <294912000>,
> -				       <270950400>,
> -				       <393216000>;
> -
> -		dai-link-0 {
> -			sound-dai = <&frddr_a>;
> -		};
> -
> -		dai-link-1 {
> -			sound-dai = <&frddr_b>;
> -		};
> -
> -		dai-link-2 {
> -			sound-dai = <&frddr_c>;
> -		};
> -
> -		/* 8ch hdmi interface */
> -		dai-link-3 {
> -			sound-dai = <&tdmif_b>;
> -			dai-format = "i2s";
> -			dai-tdm-slot-tx-mask-0 = <1 1>;
> -			dai-tdm-slot-tx-mask-1 = <1 1>;
> -			dai-tdm-slot-tx-mask-2 = <1 1>;
> -			dai-tdm-slot-tx-mask-3 = <1 1>;
> -			mclk-fs = <256>;
> -
> -			codec {
> -				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_B>;
> -			};
> -		};
> -
> -		/* hdmi glue */
> -		dai-link-4 {
> -			sound-dai = <&tohdmitx TOHDMITX_I2S_OUT>;
> -
> -			codec {
> -				sound-dai = <&hdmi_tx>;
> -			};
> -		};
> -	};
> -};
> -
> -&arb {
> -	status = "okay";
> -};
> -
> -&clkc_audio {
> -	status = "okay";
>   };
>   
>   &ethmac {
> @@ -102,27 +39,3 @@ external_phy: ethernet-phy@0 {
>   		interrupts = <IRQID_GPIOZ_14 IRQ_TYPE_LEVEL_LOW>;
>   	};
>   };
> -
> -&frddr_a {
> -	status = "okay";
> -};
> -
> -&frddr_b {
> -	status = "okay";
> -};
> -
> -&frddr_c {
> -	status = "okay";
> -};
> -
> -&tdmif_b {
> -	status = "okay";
> -};
> -
> -&tdmout_b {
> -	status = "okay";
> -};
> -
> -&tohdmitx {
> -	status = "okay";
> -};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dts
> index 6e34fd80ed71..c74ce9c246fa 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dts
> @@ -7,73 +7,10 @@
>   /dts-v1/;
>   
>   #include "meson-sm1-ac2xx.dtsi"
> -#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
>   
>   / {
>   	compatible = "cyx,a95xf3-air", "amlogic,sm1";
>   	model = "Shenzhen CYX Industrial Co., Ltd A95XF3-AIR";
> -
> -	sound {
> -		compatible = "amlogic,axg-sound-card";
> -		model = "A95XF3-AIR";
> -		audio-aux-devs = <&tdmout_b>;
> -		audio-routing = "TDMOUT_B IN 0", "FRDDR_A OUT 1",
> -				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
> -				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
> -				"TDM_B Playback", "TDMOUT_B OUT";
> -
> -		assigned-clocks = <&clkc CLKID_MPLL2>,
> -				  <&clkc CLKID_MPLL0>,
> -				  <&clkc CLKID_MPLL1>;
> -		assigned-clock-parents = <0>, <0>, <0>;
> -		assigned-clock-rates = <294912000>,
> -				       <270950400>,
> -				       <393216000>;
> -
> -		dai-link-0 {
> -			sound-dai = <&frddr_a>;
> -		};
> -
> -		dai-link-1 {
> -			sound-dai = <&frddr_b>;
> -		};
> -
> -		dai-link-2 {
> -			sound-dai = <&frddr_c>;
> -		};
> -
> -		/* 8ch hdmi interface */
> -		dai-link-3 {
> -			sound-dai = <&tdmif_b>;
> -			dai-format = "i2s";
> -			dai-tdm-slot-tx-mask-0 = <1 1>;
> -			dai-tdm-slot-tx-mask-1 = <1 1>;
> -			dai-tdm-slot-tx-mask-2 = <1 1>;
> -			dai-tdm-slot-tx-mask-3 = <1 1>;
> -			mclk-fs = <256>;
> -
> -			codec {
> -				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_B>;
> -			};
> -		};
> -
> -		/* hdmi glue */
> -		dai-link-4 {
> -			sound-dai = <&tohdmitx TOHDMITX_I2S_OUT>;
> -
> -			codec {
> -				sound-dai = <&hdmi_tx>;
> -			};
> -		};
> -	};
> -};
> -
> -&arb {
> -	status = "okay";
> -};
> -
> -&clkc_audio {
> -	status = "okay";
>   };
>   
>   &ethmac {
> @@ -81,27 +18,3 @@ &ethmac {
>   	phy-handle = <&internal_ephy>;
>   	phy-mode = "rmii";
>   };
> -
> -&frddr_a {
> -	status = "okay";
> -};
> -
> -&frddr_b {
> -	status = "okay";
> -};
> -
> -&frddr_c {
> -	status = "okay";
> -};
> -
> -&tdmif_b {
> -	status = "okay";
> -};
> -
> -&tdmout_b {
> -	status = "okay";
> -};
> -
> -&tohdmitx {
> -	status = "okay";
> -};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi
> index d1fa8b8bf795..7b20a8ff3dfb 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi
> @@ -12,6 +12,7 @@
>   #include <dt-bindings/gpio/gpio.h>
>   #include <dt-bindings/gpio/meson-g12a-gpio.h>
>   #include <dt-bindings/input/input.h>
> +#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
>   
>   / {
>   	aliases {
> @@ -127,6 +128,60 @@ wifi32k: wifi32k {
>   		clock-frequency = <32768>;
>   		pwms = <&pwm_ef 0 30518 0>; /* PWM_E at 32.768KHz */
>   	};
> +
> +	sound {
> +		compatible = "amlogic,axg-sound-card";
> +		model = "AC2XX";
> +		audio-aux-devs = <&tdmout_b>;
> +		audio-routing = "TDMOUT_B IN 0", "FRDDR_A OUT 1",
> +				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
> +				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
> +				"TDM_B Playback", "TDMOUT_B OUT";
> +
> +		assigned-clocks = <&clkc CLKID_MPLL2>,
> +				  <&clkc CLKID_MPLL0>,
> +				  <&clkc CLKID_MPLL1>;
> +		assigned-clock-parents = <0>, <0>, <0>;
> +		assigned-clock-rates = <294912000>,
> +				       <270950400>,
> +				       <393216000>;
> +
> +		dai-link-0 {
> +			sound-dai = <&frddr_a>;
> +		};
> +
> +		dai-link-1 {
> +			sound-dai = <&frddr_b>;
> +		};
> +
> +		dai-link-2 {
> +			sound-dai = <&frddr_c>;
> +		};
> +
> +		/* 8ch hdmi interface */
> +		dai-link-3 {
> +			sound-dai = <&tdmif_b>;
> +			dai-format = "i2s";
> +			dai-tdm-slot-tx-mask-0 = <1 1>;
> +			dai-tdm-slot-tx-mask-1 = <1 1>;
> +			dai-tdm-slot-tx-mask-2 = <1 1>;
> +			dai-tdm-slot-tx-mask-3 = <1 1>;
> +			mclk-fs = <256>;
> +
> +			codec {
> +				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_B>;
> +			};
> +		};
> +
> +		/* hdmi glue */
> +		dai-link-4 {
> +			sound-dai = <&tohdmitx TOHDMITX_I2S_OUT>;
> +
> +			codec {
> +				sound-dai = <&hdmi_tx>;
> +			};
> +		};
> +	};
>   };
>   
>   &cec_AO {
> @@ -298,3 +353,35 @@ &usb {
>   	status = "okay";
>   	dr_mode = "otg";
>   };
> +
> +&clkc_audio {
> +	status = "okay";
> +};
> +
> +&arb {
> +	status = "okay";
> +};
> +
> +&frddr_a {
> +	status = "okay";
> +};
> +
> +&frddr_b {
> +	status = "okay";
> +};
> +
> +&frddr_c {
> +	status = "okay";
> +};
> +
> +&tdmif_b {
> +	status = "okay";
> +};
> +
> +&tdmout_b {
> +	status = "okay";
> +};
> +
> +&tohdmitx {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts
> index e6e9410d40cb..a4800488b161 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts
> @@ -7,73 +7,10 @@
>   /dts-v1/;
>   
>   #include "meson-sm1-ac2xx.dtsi"
> -#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
>   
>   / {
>   	compatible = "haochuangyi,h96-max", "amlogic,sm1";
>   	model = "Shenzhen Haochuangyi Technology Co., Ltd H96 Max";
> -
> -	sound {
> -		compatible = "amlogic,axg-sound-card";
> -		model = "H96-MAX";
> -		audio-aux-devs = <&tdmout_b>;
> -		audio-routing = "TDMOUT_B IN 0", "FRDDR_A OUT 1",
> -				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
> -				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
> -				"TDM_B Playback", "TDMOUT_B OUT";
> -
> -		assigned-clocks = <&clkc CLKID_MPLL2>,
> -				  <&clkc CLKID_MPLL0>,
> -				  <&clkc CLKID_MPLL1>;
> -		assigned-clock-parents = <0>, <0>, <0>;
> -		assigned-clock-rates = <294912000>,
> -				       <270950400>,
> -				       <393216000>;
> -
> -		dai-link-0 {
> -			sound-dai = <&frddr_a>;
> -		};
> -
> -		dai-link-1 {
> -			sound-dai = <&frddr_b>;
> -		};
> -
> -		dai-link-2 {
> -			sound-dai = <&frddr_c>;
> -		};
> -
> -		/* 8ch hdmi interface */
> -		dai-link-3 {
> -			sound-dai = <&tdmif_b>;
> -			dai-format = "i2s";
> -			dai-tdm-slot-tx-mask-0 = <1 1>;
> -			dai-tdm-slot-tx-mask-1 = <1 1>;
> -			dai-tdm-slot-tx-mask-2 = <1 1>;
> -			dai-tdm-slot-tx-mask-3 = <1 1>;
> -			mclk-fs = <256>;
> -
> -			codec {
> -				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_B>;
> -			};
> -		};
> -
> -		/* hdmi glue */
> -		dai-link-4 {
> -			sound-dai = <&tohdmitx TOHDMITX_I2S_OUT>;
> -
> -			codec {
> -				sound-dai = <&hdmi_tx>;
> -			};
> -		};
> -	};
> -};
> -
> -&arb {
> -	status = "okay";
> -};
> -
> -&clkc_audio {
> -	status = "okay";
>   };
>   
>   &ethmac {
> @@ -103,30 +40,6 @@ external_phy: ethernet-phy@0 {
>   	};
>   };
>   
> -&frddr_a {
> -	status = "okay";
> -};
> -
> -&frddr_b {
> -	status = "okay";
> -};
> -
> -&frddr_c {
> -	status = "okay";
> -};
> -
> -&tdmif_b {
> -	status = "okay";
> -};
> -
> -&tdmout_b {
> -	status = "okay";
> -};
> -
> -&tohdmitx {
> -	status = "okay";
> -};
> -
>   &uart_A {
>   	status = "okay";
>   
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dts
> index fc9b961133cd..dbd8625285b6 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dts
> @@ -7,73 +7,10 @@
>   /dts-v1/;
>   
>   #include "meson-sm1-ac2xx.dtsi"
> -#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
>   
>   / {
>   	compatible = "amediatech,x96-air-gbit", "amlogic,sm1";
>   	model = "Shenzhen Amediatech Technology Co., Ltd X96 Air";
> -
> -	sound {
> -		compatible = "amlogic,axg-sound-card";
> -		model = "X96-AIR";
> -		audio-aux-devs = <&tdmout_b>;
> -		audio-routing = "TDMOUT_B IN 0", "FRDDR_A OUT 1",
> -				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
> -				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
> -				"TDM_B Playback", "TDMOUT_B OUT";
> -
> -		assigned-clocks = <&clkc CLKID_MPLL2>,
> -				  <&clkc CLKID_MPLL0>,
> -				  <&clkc CLKID_MPLL1>;
> -		assigned-clock-parents = <0>, <0>, <0>;
> -		assigned-clock-rates = <294912000>,
> -				       <270950400>,
> -				       <393216000>;
> -
> -		dai-link-0 {
> -			sound-dai = <&frddr_a>;
> -		};
> -
> -		dai-link-1 {
> -			sound-dai = <&frddr_b>;
> -		};
> -
> -		dai-link-2 {
> -			sound-dai = <&frddr_c>;
> -		};
> -
> -		/* 8ch hdmi interface */
> -		dai-link-3 {
> -			sound-dai = <&tdmif_b>;
> -			dai-format = "i2s";
> -			dai-tdm-slot-tx-mask-0 = <1 1>;
> -			dai-tdm-slot-tx-mask-1 = <1 1>;
> -			dai-tdm-slot-tx-mask-2 = <1 1>;
> -			dai-tdm-slot-tx-mask-3 = <1 1>;
> -			mclk-fs = <256>;
> -
> -			codec {
> -				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_B>;
> -			};
> -		};
> -
> -		/* hdmi glue */
> -		dai-link-4 {
> -			sound-dai = <&tohdmitx TOHDMITX_I2S_OUT>;
> -
> -			codec {
> -				sound-dai = <&hdmi_tx>;
> -			};
> -		};
> -	};
> -};
> -
> -&arb {
> -	status = "okay";
> -};
> -
> -&clkc_audio {
> -	status = "okay";
>   };
>   
>   &ethmac {
> @@ -103,30 +40,6 @@ external_phy: ethernet-phy@0 {
>   	};
>   };
>   
> -&frddr_a {
> -	status = "okay";
> -};
> -
> -&frddr_b {
> -	status = "okay";
> -};
> -
> -&frddr_c {
> -	status = "okay";
> -};
> -
>   &ir {
>   	linux,rc-map-name = "rc-x96max";
>   };
> -
> -&tdmif_b {
> -	status = "okay";
> -};
> -
> -&tdmout_b {
> -	status = "okay";
> -};
> -
> -&tohdmitx {
> -	status = "okay";
> -};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dts
> index 9ea969255b4f..3b2df25ca630 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dts
> @@ -7,73 +7,10 @@
>   /dts-v1/;
>   
>   #include "meson-sm1-ac2xx.dtsi"
> -#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
>   
>   / {
>   	compatible = "amediatech,x96-air", "amlogic,sm1";
>   	model = "Shenzhen Amediatech Technology Co., Ltd X96 Air";
> -
> -	sound {
> -		compatible = "amlogic,axg-sound-card";
> -		model = "X96-AIR";
> -		audio-aux-devs = <&tdmout_b>;
> -		audio-routing = "TDMOUT_B IN 0", "FRDDR_A OUT 1",
> -				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
> -				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
> -				"TDM_B Playback", "TDMOUT_B OUT";
> -
> -		assigned-clocks = <&clkc CLKID_MPLL2>,
> -				  <&clkc CLKID_MPLL0>,
> -				  <&clkc CLKID_MPLL1>;
> -		assigned-clock-parents = <0>, <0>, <0>;
> -		assigned-clock-rates = <294912000>,
> -				       <270950400>,
> -				       <393216000>;
> -
> -		dai-link-0 {
> -			sound-dai = <&frddr_a>;
> -		};
> -
> -		dai-link-1 {
> -			sound-dai = <&frddr_b>;
> -		};
> -
> -		dai-link-2 {
> -			sound-dai = <&frddr_c>;
> -		};
> -
> -		/* 8ch hdmi interface */
> -		dai-link-3 {
> -			sound-dai = <&tdmif_b>;
> -			dai-format = "i2s";
> -			dai-tdm-slot-tx-mask-0 = <1 1>;
> -			dai-tdm-slot-tx-mask-1 = <1 1>;
> -			dai-tdm-slot-tx-mask-2 = <1 1>;
> -			dai-tdm-slot-tx-mask-3 = <1 1>;
> -			mclk-fs = <256>;
> -
> -			codec {
> -				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_B>;
> -			};
> -		};
> -
> -		/* hdmi glue */
> -		dai-link-4 {
> -			sound-dai = <&tohdmitx TOHDMITX_I2S_OUT>;
> -
> -			codec {
> -				sound-dai = <&hdmi_tx>;
> -			};
> -		};
> -	};
> -};
> -
> -&arb {
> -	status = "okay";
> -};
> -
> -&clkc_audio {
> -	status = "okay";
>   };
>   
>   &ethmac {
> @@ -81,31 +18,7 @@ &ethmac {
>   	phy-handle = <&internal_ephy>;
>   	phy-mode = "rmii";
>   };
> -
> -&frddr_a {
> -	status = "okay";
> -};
> -
> -&frddr_b {
> -	status = "okay";
> -};
> -
> -&frddr_c {
> -	status = "okay";
> -};
> -
>   &ir {
>   	linux,rc-map-name = "rc-beelink-gs1";
>   };
>   
> -&tdmif_b {
> -	status = "okay";
> -};
> -
> -&tdmout_b {
> -	status = "okay";
> -};
> -
> -&tohdmitx {
> -	status = "okay";
> -};


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
