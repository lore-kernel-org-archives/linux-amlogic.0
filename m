Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B6DC54EAA
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Jan 2023 13:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M20+XuXgWIEWVauCGdF5EZz/P2X5gT6kIEg5kX/Gkp0=; b=CnBmMY9xUsFW08
	NKBa/PQb+Soud+G8Vi+hI9kBTf/yNrW57/Rs0cuv2XHZQ/0InsGhwJVwt22IPDJI/ihEZveD8wcub
	v3WysE2it96zrptFc0Leje6FzEejED4pyaP07ihLkdNzyMxXb7ssapkv5H9QaGDGe15KaAsVFqEBZ
	jFFc9uNkR7ntoDIlvVe+QdP31IFA8S0XP+E4YKXXJYXiZ1jfnluektxPXrJIzjcEqx2heDAMVheDm
	4cdhfiV55KJjezNLfrVdUzotK7onX6o/NNSundrJD/nI8jAXN0NQLkeRVFqj6e8qVzYOzHNmXeL0f
	SWFCK7qVrERE4d0RX9OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLOcH-00Evr6-1P; Fri, 27 Jan 2023 13:18:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLNvx-00EaVg-9w
	for linux-amlogic@bombadil.infradead.org; Fri, 27 Jan 2023 12:34:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=k1URz68eQuw6BvmlarR/Wy9VoAKxS4hcNfkdqGMFD4Q=; b=GQA7DQzQDdzpx177KUkJiDNDgc
	LEmmLtZyPVYxfh+LxRZBocJfXOvQSQNyAoHQY0mthyWwutRFQMbsjh6imMP1zeH8sUTcLdOLP7uDX
	y5UQAFyul5WYQzcu2J9nZZqOZLnXePICwbIT5/wKAwuDkCANFL8ZK1zaoUGCsqCcugxssujcgUeie
	/3NvZsePyRSf2pBiIVRs/OhaTYEDjDc/wXbMHZoaEPKS90jlvDF9XCB6ZpxOhM8Av13ZFSNiuhuTV
	ALM6HTBzzCn69W87YxU2HPUuPI2jeTnSidTcslIloIAcRBgarstx3JqWCcVXJslOLGVOqcDLW1VBW
	PaulaYqw==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pLNvK-002mU9-2b
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Jan 2023 12:33:47 +0000
Received: by mail-wr1-x42c.google.com with SMTP id d14so4827429wrr.9
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Jan 2023 04:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k1URz68eQuw6BvmlarR/Wy9VoAKxS4hcNfkdqGMFD4Q=;
        b=BKEvzzjzFtYLakq/1Og7eAdhh/6Cv97E6U/SDTwq9dj7uYd7S7w4ExU1xiS+jjrzqj
         A74v3iVq5sMmSIG6v4Kp062GsuvAQszxw/YSEvTuLBkY4dnzNVv+D2nHfaYoyx5dRkSN
         yJKbF8xTdj1ECvVPMfydvYtD7OecpobHNQD69wcm0eQ7JlYUcm+M3j9ZcrddaWct0uEx
         3OqnGukN17UG23WOO/udoWL5va9psrPJLGK3KylVLV117nyEOJHRpLG/2lKJ82tfpDHj
         s11bRhGPv4GvAm0q4+ZJT7YcapQ7lU9CP3WLMSrC4jjj4H2Wwswgqeq7gtNPyIHnMUkT
         8MGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k1URz68eQuw6BvmlarR/Wy9VoAKxS4hcNfkdqGMFD4Q=;
        b=i9yrk1pHBhnpdSlD2lPQOFEWeYtL0ujubilG09BswpkevGIt2nxPm+MAP2v18Oj5m6
         s6Itz4WVoZDnheifZDoTo/Yz2LjTXfrVgP2whECBJibjoTBvU4LI0Xp0Wps7KRygsDsK
         Wxot7Z80LmpWQ1StyQ9vxc67dWADEufd8WZpVdU5+tczXxBCeymbhCEuF/6EP3RAzBG4
         p6Nthwd6HXZx8i3X2C4otyRMr+mfsM4WgGL+bCykmIFp4XJf7h2eNXuNSH0uu5tqlqLW
         W7ltH1u2cohRPzKEVJHpYNYsfGxNfVeZffLZPq8SvNYd2NnOiVwzaa1LoW3PKxH6kyeS
         oxSQ==
X-Gm-Message-State: AO0yUKWoi/hWhLDOBCqJGZXp66Pgeohr504VSS5qr81KQvPyNmoOVVc9
	kfjmA62Z//o0qUqNV6V2mYHrqO2k9xSmoxNO
X-Google-Smtp-Source: AK7set9BVInh49TL8/zidYl7KCLe745idGmKH325ZWj+lF9TbSqwqh/zxObUIJRA0kgHeH00a0aoNw==
X-Received: by 2002:adf:df85:0:b0:2bf:bfc1:f622 with SMTP id z5-20020adfdf85000000b002bfbfc1f622mr7243610wrl.64.1674822847593;
        Fri, 27 Jan 2023 04:34:07 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id y17-20020adffa51000000b002238ea5750csm4817765wrr.72.2023.01.27.04.34.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 04:34:07 -0800 (PST)
Message-ID: <c2d0d2e8-f7af-b780-07a3-37189ee16388@linaro.org>
Date: Fri, 27 Jan 2023 13:34:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] arm64: dts: meson: add support for Radxa Zero2
Content-Language: en-US
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Yuntian Zhang <yt@radxa.com>
References: <20230127110928.3387654-1-christianshewitt@gmail.com>
 <20230127110928.3387654-2-christianshewitt@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230127110928.3387654-2-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_123345_135608_7BD895C6 
X-CRM114-Status: GOOD (  11.30  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 27/01/2023 12:09, Christian Hewitt wrote:
> From: Yuntian Zhang <yt@radxa.com>
> 
> Radxa Zero2 is a small form factor SBC based on the Amlogic A311D
> chipset that ships in a number of eMMC configurations:
> 

Thank you for your patch. There is something to discuss/improve.

> +	sdio_pwrseq: sdio-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		reset-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
> +		clocks = <&wifi32k>;
> +		clock-names = "ext_clock";
> +	};
> +
> +	ao_5v: regulator-ao_5v {


No underscores in node names.

> +		compatible = "regulator-fixed";
> +		regulator-name = "AO_5V";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +	};
> +
> +	vcc_1v8: regulator-vcc_1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VCC_1V8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		vin-supply = <&vcc_3v3>;
> +		regulator-always-on;
> +	};
> +
> +	vcc_3v3: regulator-vcc_3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VCC_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vddao_3v3>;
> +		regulator-always-on;
> +		/* FIXME: actually controlled by VDDCPU_B_EN */
> +	};
> +
> +	vddao_1v8: regulator-vddao_1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDDIO_AO1V8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		vin-supply = <&vddao_3v3>;
> +		regulator-always-on;
> +	};
> +
> +	vddao_3v3: regulator-vddao_3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDDAO_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&ao_5v>;
> +		regulator-always-on;
> +	};
> +
> +	vddcpu_a: regulator-vddcpu-a {
> +		/*
> +		 * MP8756GD Regulator.
> +		 */
> +		compatible = "pwm-regulator";
> +
> +		regulator-name = "VDDCPU_A";
> +		regulator-min-microvolt = <730000>;
> +		regulator-max-microvolt = <1022000>;
> +
> +		pwm-supply = <&ao_5v>;
> +
> +		pwms = <&pwm_ab 0 1250 0>;
> +		pwm-dutycycle-range = <100 0>;
> +
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	vddcpu_b: regulator-vddcpu-b {
> +		/*
> +		 * Silergy SY8120B1ABC Regulator.
> +		 */
> +		compatible = "pwm-regulator";
> +
> +		regulator-name = "VDDCPU_B";
> +		regulator-min-microvolt = <730000>;
> +		regulator-max-microvolt = <1022000>;
> +
> +		pwm-supply = <&ao_5v>;
> +
> +		pwms = <&pwm_AO_cd 1 1250 0>;
> +		pwm-dutycycle-range = <100 0>;
> +
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	sound {
> +		compatible = "amlogic,axg-sound-card";
> +		model = "RADXA-ZERO2";
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
> +
> +	wifi32k: wifi32k {

Generic node names, so clock-0 or clock-xyz



Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
