Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07FEC05027
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jan 2023 08:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mk5w4wrHLUa8dJaEc53+41SycFNQ+YQZGrJSILdnzBg=; b=U8c5jn0p9QvQo6MbXSg7gQcxJb
	QFQnhY/p/MdXXkLRayYAFP8zUm9WZhUqBQBmElJHOfZqRu7P8oGGdLV7PZBoGPP3oh3cw942+xUK6
	Bi69lIWqpH6nTPAo4em1p1w9HzoxNHprdX248LUXKWWIMPrFz1faGwplF73qFEz8lNPxyQ7CWQPF1
	8F4OY46Ph/1AamWdZX5g6aGk+CXOZ8CoyFBFCJwsuELEXErNe5YT8L5PXgaNntjeCQJX2TQ4C9AEq
	VjxJ5otMe6/uRw8Rh8xd1NC9nYSQvqVZEQ+WK10JAb3AkRsrW/j8vDISwjci9EvzmEvH91a+Z6G9P
	VPFIJUiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJsXL-00GPRR-7C; Mon, 23 Jan 2023 08:50:43 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJsXI-00GPQJ-Fq
	for linux-amlogic@lists.infradead.org; Mon, 23 Jan 2023 08:50:41 +0000
Received: by mail-wr1-x42d.google.com with SMTP id r2so10042913wrv.7
        for <linux-amlogic@lists.infradead.org>; Mon, 23 Jan 2023 00:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tokXhkBB2O2paiGKKaoP2lzAxO7le6+XsVsC6OhvEps=;
        b=Zs2ENQaN/ddPOAPgdaSsg2/GbLd6ZEFs+pDO2+YLotqVUzSfHKe158EBIXmC8Dmv44
         fpP1XMESSNz+0YuFNbHB/W1r3uRW41i5vWqVXkOmoVnRpD9hzD5QvGWHi0uz+yDVpVpk
         2nL9Qb4/AkPd3fOmVK0PvMJDoYwzsjKZcp5EC8qOhc7Oi5cAwdKRcVKjljg+7vlbhYke
         KXjbAKbzyk6gP6OWdQ5H8N6iRF+cOSCOVO2MFj1L1qMsajnTrNvVLL1jbbVv5dLIniLs
         lYjYrUlUMEaTiwu8EcwJ3Hb/TEOsZQKV/UdGjZMlvxhqWOLUkFcS4OG4kiPtQ4L7AVEH
         h0qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tokXhkBB2O2paiGKKaoP2lzAxO7le6+XsVsC6OhvEps=;
        b=whFL0GHPBTq9jLOL4AFRWQco1g9wwsYc39gZKYZZbHlAsgTbkqODMazs+/YaF904MA
         RiGKE7RobPtuABDQ47Jar13NOxjmExnmL0Uo8sU12K6CLWy5BUZ34MAMCdUqjK3vwWU0
         ZdcLurV2+1Zhl8LLVLSzveeDUPT1uWKe4dtU5jadHo071eMldPx82mC2j1/djeXw9Z9P
         +mrsoniSoPWVKKgGFPgZAgnScHVi6q9xNxu5RRuOUkZ6sSJHrOnNfY93CNflsDHpdVCV
         9E2gqCyJ/07J+nyV2j2JmHy472DU5hHNlByJ32LFzWFBo+bQjkPYvhNCE6LUW94vjBZ7
         OC3w==
X-Gm-Message-State: AFqh2ko05z+FNlyQDtjuMDjMT3ajehfLZk9CAvxgrNQqb0z7x5hjwQJS
	+56cdRCFFHNanGstPoxQRO3DiQ==
X-Google-Smtp-Source: AMrXdXvTUl7kFlmLjtHWLnsL790TrBTdbZup8iSTjctXdffjd74Qq6pz9pm0/YMDSA5Fa3pMRKHX3A==
X-Received: by 2002:a5d:4e4e:0:b0:2bd:ec13:8101 with SMTP id r14-20020a5d4e4e000000b002bdec138101mr20899265wrt.41.1674463837319;
        Mon, 23 Jan 2023 00:50:37 -0800 (PST)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id o2-20020a5d58c2000000b002bdbead763csm31087880wrf.95.2023.01.23.00.50.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 00:50:36 -0800 (PST)
Message-ID: <470ccb46-4d63-2951-0fb9-71edca59b01a@linaro.org>
Date: Mon, 23 Jan 2023 09:50:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: meson: add audio playback to S905X-P212 dts
Content-Language: en-US
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230123065834.2670125-1-christianshewitt@gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <20230123065834.2670125-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_005040_581173_055259A8 
X-CRM114-Status: GOOD (  13.01  )
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

On 23/01/2023 07:58, Christian Hewitt wrote:
> Add initial support for the HDMI and Analogue i2s audio outputs.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>   .../boot/dts/amlogic/meson-gxl-s905x-p212.dts | 70 +++++++++++++++++++
>   1 file changed, 70 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts
> index 2602940c2077..c2bc7cec476d 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts
> @@ -7,11 +7,19 @@
>   /dts-v1/;
>   
>   #include "meson-gxl-s905x-p212.dtsi"
> +#include <dt-bindings/sound/meson-aiu.h>
>   
>   / {
>   	compatible = "amlogic,p212", "amlogic,s905x", "amlogic,meson-gxl";
>   	model = "Amlogic Meson GXL (S905X) P212 Development Board";
>   
> +	dio2133: analog-amplifier {
> +		compatible = "simple-audio-amplifier";
> +		sound-name-prefix = "AU2";
> +		VCC-supply = <&hdmi_5v>;
> +		enable-gpios = <&gpio GPIOH_5 GPIO_ACTIVE_HIGH>;
> +	};
> +
>   	cvbs-connector {
>   		compatible = "composite-video-connector";
>   
> @@ -32,6 +40,68 @@ hdmi_connector_in: endpoint {
>   			};
>   		};
>   	};
> +
> +	sound {
> +		compatible = "amlogic,gx-sound-card";
> +		model = "S905X-P212";
> +		audio-aux-devs = <&dio2133>;
> +		audio-widgets = "Line", "Lineout";
> +		audio-routing = "AU2 INL", "ACODEC LOLN",
> +				"AU2 INR", "ACODEC LORN",
> +				"Lineout", "AU2 OUTL",
> +				"Lineout", "AU2 OUTR";
> +		assigned-clocks = <&clkc CLKID_MPLL0>,
> +				  <&clkc CLKID_MPLL1>,
> +				  <&clkc CLKID_MPLL2>;
> +		assigned-clock-parents = <0>, <0>, <0>;
> +		assigned-clock-rates = <294912000>,
> +				       <270950400>,
> +				       <393216000>;
> +		status = "okay";

You can remove this.

With that removed:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

> +
> +		dai-link-0 {
> +			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
> +		};
> +
> +		dai-link-1 {
> +			sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
> +			dai-format = "i2s";
> +			mclk-fs = <256>;
> +
> +			codec-0 {
> +				sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
> +			};
> +
> +			codec-1 {
> +				sound-dai = <&aiu AIU_ACODEC CTRL_I2S>;
> +			};
> +		};
> +
> +		dai-link-2 {
> +			sound-dai = <&aiu AIU_HDMI CTRL_OUT>;
> +
> +			codec-0 {
> +				sound-dai = <&hdmi_tx>;
> +			};
> +		};
> +
> +		dai-link-3 {
> +			sound-dai = <&aiu AIU_ACODEC CTRL_OUT>;
> +
> +			codec-0 {
> +				sound-dai = <&acodec>;
> +			};
> +		};
> +	};
> +};
> +
> +&acodec {
> +	AVDD-supply = <&vddio_ao18>;
> +	status = "okay";
> +};
> +
> +&aiu {
> +	status = "okay";
>   };
>   
>   &cec_AO {


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
