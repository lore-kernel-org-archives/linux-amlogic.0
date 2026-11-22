Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA75606A320
	for <linux-amlogic@archiver.kernel.org>; Sun, 22 Nov 2026 15:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FCvhrAAT;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=lJJ7z/47
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cGezvYqg7u1EF+91Fk8V6i8rZOh9P7/DeIP2Y195DDY=; b=FCvhrAAT88kVlTOat+vXZcjNGP
	GazNZHqwgWsau4qEAKUf+eujAhY7F8QsGM6hFxfdQBoLv42Xz4AhDqHEK1e/nD4iZIuluYpw2Yvjq
	SUYUVEhOMNokee2h9NL/tFqucnOCkisSDBsXsT6TCAHPSHhgo96FWsEUX9mBM2HLo7B2W6g3kFfcf
	Cu7OEensaEASukQCfbwYYLvWY5mMc4jEzEvAaEmBZzImQ7lv0WnnY98zA8fj4DYiJwXZORtib6X1x
	sw4zNm6yN2WrO6q3z53jxxOv9i2szsjQp6CGfNMwNw/jrYyr1+qSE2gqKPYwx3OVu/fL93iUDP/1r
	tJadmRkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV9Rc-00000001G2q-2uY1;
	Sun, 22 Nov 2026 15:25:33 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV9RT-00000001G1c-1Zw3
	for linux-amlogic@lists.infradead.org;
	Sun, 22 Nov 2026 15:25:29 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so20865315e9.0
        for <linux-amlogic@lists.infradead.org>; Sun, 22 Nov 2026 07:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795361121; x=1795965921; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GNHxpl/UQde3/iMNVri3Fkhz/8Z7fKwj6N11BqGjFJg=;
        b=lJJ7z/47+t3uGhjH5L9AKq1XMxgHQUJIWPxnYA9HYBJwYIeLXW+dDeXbnNgEY1arg2
         KEUlMDop6a58eru98kJPzXf9w3rFGn5wdr7RJsAd249gexsFGEadhHAMkU7TKYAhcWb8
         dPJHrUioUthScDjPT0C3TJYRKdBODc4zMSxWD5aRz6hfbyMvybWW2WHqVLgjCuvNJNEb
         oCdG2x0R64ip2QrVmWRls5kSOa7BU/EBkRG90nXB/Lb8s0/P8KVcqqL7nS3bkPNKa0zV
         cwt+0h+j98KlzN0uu0gj06GBajtKuO8LsUMoh6yKdZhPWfEpDmW3iwUZ2DbBgJTnRgYn
         6PpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795361121; x=1795965921;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GNHxpl/UQde3/iMNVri3Fkhz/8Z7fKwj6N11BqGjFJg=;
        b=NUrphnMQclQEIRjBfxTzpuZ2rkpudQttLg1NHaVjuHUQ4CRFE8k37GqAt2Slxdeu5m
         hQdxfwBjL7jBJFb1tKKK9fAsS5gPTMEJBXklGxUcorMxIJ2WCDwaGpdKWWxgstWkpoB6
         vstU8RQ1/VmM+wmiLDwAEmGOFJHGUu3ARBegeFnWxRmro/g1R7rnIaKXvTvmqebJF2VT
         ntC317ROKBTEt5gvLbGW0DfryFHNbUbMECCmeHWnW+LD61AKAuYEeeE4LTHE9BzWgz+u
         mrpmHYDAb9GW/XgF2rRtLfFtNEHcHeDRSqxq0GWqhzS8BG2bzCNrMMeMkxMc77zffO9H
         p+3A==
X-Forwarded-Encrypted: i=1; AL+hErFiFvL1k7rLfIQiEGc1orplvSUZbZoZJ+hIPVj9ATVuJJvAWPdxj0Tt8EmM2RLsrzW0iLIcL7hva/SWm5df@lists.infradead.org
X-Gm-Message-State: APuU4Z94mc0a9dgC1vKqoWpJlr3UuNsqfzOg7cF1wYZm85BDodj++Aoa
	EZ2pBDHXytA6EEU1Lq6cD14dIUMs25L/0ywmjpNWiw9/3IRC5jMdm547iGQe2Wt9kxg=
X-Gm-Gg: AZFdTZdq/9jV0JLD1u8yfbVIJnbGoSnp3WYzYCD8tb5Z5hfjSCZmDad4zryKFf6kPkz
	5WNTkiTLVWWfAsUkPPhv08/bmPPgXPCyP1L/9XUUGYoejUfNzs7kBKDv77zhbjeSl47k4PiQMl+
	Ex5U1MS986lXtWw+1JfymvR05sb0W+OLMyHGhAz4KPeVzzn18MAVjlwT9c4gyTF3nYd7NhFX1eH
	m6kFa/0RZEVdbxPQDUMOgJZsWfLguOLYI5gMq2eKpnkVudXCb1rsiBsgW3418r+X4Ge3jG5DzV/
	8JFeBlHBmI1bsu0DpXki/7fs0L6o7+/xRJKatPz3upZh9QJ9i1eyj5950zA1/qyG5pxXovrZuX7
	C0RgS5ksW3k6Qpe7s/bl2aV9FuYtmN3781fQ7/EQnE7ZuzXskqbbez7ZXmR4pKIgW2XvLqQDJWO
	yMXXrcNmBvoH4GQm5rvO81VXXBotMXfSIoHTCAgzhttMkhdI+EM8l5PL/EJF0w1xu5zCPNyophY
	XAuvPDRUn4kSHaHeQbBuFxFEi5EkSocTVsB/BHy+7y5FkPpvx5I07M/gkJv5+jFFDn4sA+uuPC7
	+M77E5M3lXlPRnIHs1UiqsgLCFEKOdSbA4KPCjg/8xGCTS9K
X-Received: by 2002:a05:600c:46d3:b0:4bb:5c92:ce12 with SMTP id 5b1f17b1804b1-4bb88812200mr202639425e9.17.1795361121451;
        Sun, 22 Nov 2026 07:25:21 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm313799095e9.10.2026.11.22.07.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:25:20 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v8 5/5] arm64: dts: amlogic: Add Amlogic S4 Audio
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jiebing Chen <jiebing.chen@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, jian.xu@amlogic.com, shuai.li@amlogic.com, 
 zhe.wang@amlogic.com
In-Reply-To: <20261110-audio_drvier-v8-5-1489241e4c83@amlogic.com>
References: <20261110-audio_drvier-v8-0-1489241e4c83@amlogic.com>
 <20261110-audio_drvier-v8-5-1489241e4c83@amlogic.com>
Date: Sun, 22 Nov 2026 16:25:15 +0100
Message-Id: <179536111581.2728475.9919460533427781841.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=7779; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=pV/1UXNxA/LpQP+cFIdmAq4U0LBxmofpDDOb6Try3Jk=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNnMnPFPjy9z2xljcWfG5SXGe9i5r+8W9JhgmxZ8YcO8N
 NYJCt/DOkpZGMS4GGTFFFlquKvF30lqfZk1Xec2zBxWJpAhDFycAjCRk9MYGU6HMU6PO7XnVt/l
 NTJXfj985xqYztH0uLfJ5WXb7nUK1coMf7gOcW6rrOlnORf6dFrkmQ7RA0F3Lr1WXTlHsy1eToz
 flB8A
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_072525_406751_B22FF13A 
X-CRM114-Status: GOOD (  13.98  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Add basic audio driver support for the Amlogic S4 based
> Amlogic AQ222 board.
> 
> Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
> ---
>  .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     | 311 ++++++++++++++++
>  arch/arm64/boot/dts/amlogic/meson-s4.dtsi          | 396 +++++++++++++++++++++
>  2 files changed, 707 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> index 0a3f81ea0fb0..334b57bde4de 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> @@ -75,6 +75,17 @@ vddio_ao1v8: regulator-vddio-ao1v8 {
>  	       regulator-always-on;
>  	};
>  
> +	vcc5v_reg: regulator-vcc-5v {
> +		compatible = "regulator-fixed";
> +		vin-supply = <&main_12v>;
> +		regulator-name = "VCC5V";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&gpio GPIOH_7 GPIO_ACTIVE_HIGH>;
> +		startup-delay-us = <7000>;
> +		enable-active-high;
> +	};
> +
>  	/* SY8120B1ABC DC/DC Regulator. */
>  	vddcpu: regulator-vddcpu {
>  		compatible = "pwm-regulator";
> @@ -129,6 +140,207 @@ vddcpu: regulator-vddcpu {
>  				<699000 98>,
>  				<689000 100>;
>  	};
> +
> +	dioo2133: audio-amplifier-0 {
> +		compatible = "simple-audio-amplifier";
> +		enable-gpios = <&gpio GPIOH_8 GPIO_ACTIVE_HIGH>;
> +		VCC-supply = <&vcc5v_reg>;
> +		sound-name-prefix = "Analog_PA";
> +	};
> +
> +	spdif_dir: audio-spdif-in {
> +		compatible = "linux,spdif-dir";
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "DIR";
> +	};
> +
> +	spdif_dit: audio-spdif-out {
> +		compatible = "linux,spdif-dit";
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "DIT";
> +	};
> +
> +	sound {
> +		compatible = "amlogic,axg-sound-card";
> +		model = "aq222";
> +		audio-widgets = "Line", "Lineout";
> +		audio-aux-devs = <&tdmout_a>, <&tdmout_b>, <&tdmout_c>,
> +				 <&tdmin_a>, <&tdmin_b>, <&tdmin_c>,
> +				 <&tdmin_lb>, <&dioo2133>;
> +		audio-routing = "TDMOUT_A IN 0", "FRDDR_A OUT 0",
> +				"TDMOUT_A IN 1", "FRDDR_B OUT 0",
> +				"TDMOUT_A IN 2", "FRDDR_C OUT 0",
> +				"TDM_A Playback", "TDMOUT_A OUT",
> +				"TDMOUT_B IN 0", "FRDDR_A OUT 1",
> +				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
> +				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
> +				"TDM_B Playback", "TDMOUT_B OUT",
> +				"TDMOUT_C IN 0", "FRDDR_A OUT 2",
> +				"TDMOUT_C IN 1", "FRDDR_B OUT 2",
> +				"TDMOUT_C IN 2", "FRDDR_C OUT 2",
> +				"TDM_C Playback", "TDMOUT_C OUT",
> +				"SPDIFOUT_A IN 0", "FRDDR_A OUT 3",
> +				"SPDIFOUT_A IN 1", "FRDDR_B OUT 3",
> +				"SPDIFOUT_A IN 2", "FRDDR_C OUT 3",
> +				"SPDIFOUT_B IN 0", "FRDDR_A OUT 4",
> +				"SPDIFOUT_B IN 1", "FRDDR_B OUT 4",
> +				"SPDIFOUT_B IN 2", "FRDDR_C OUT 4",
> +				"TDMIN_A IN 0", "TDM_A Capture",
> +				"TDMIN_A IN 1", "TDM_B Capture",
> +				"TDMIN_A IN 2", "TDM_C Capture",
> +				"TDMIN_A IN 3", "TDM_A Loopback",
> +				"TDMIN_A IN 4", "TDM_B Loopback",
> +				"TDMIN_A IN 5", "TDM_C Loopback",
> +				"TDMIN_B IN 0", "TDM_A Capture",
> +				"TDMIN_B IN 1", "TDM_B Capture",
> +				"TDMIN_B IN 2", "TDM_C Capture",
> +				"TDMIN_B IN 3", "TDM_A Loopback",
> +				"TDMIN_B IN 4", "TDM_B Loopback",
> +				"TDMIN_B IN 5", "TDM_C Loopback",
> +				"TDMIN_C IN 0", "TDM_A Capture",
> +				"TDMIN_C IN 1", "TDM_B Capture",
> +				"TDMIN_C IN 2", "TDM_C Capture",
> +				"TDMIN_C IN 3", "TDM_A Loopback",
> +				"TDMIN_C IN 4", "TDM_B Loopback",
> +				"TDMIN_C IN 5", "TDM_C Loopback",
> +				"TDMIN_LB IN 3", "TDM_A Capture",
> +				"TDMIN_LB IN 4", "TDM_B Capture",
> +				"TDMIN_LB IN 5", "TDM_C Capture",
> +				"TDMIN_LB IN 0", "TDM_A Loopback",
> +				"TDMIN_LB IN 1", "TDM_B Loopback",
> +				"TDMIN_LB IN 2", "TDM_C Loopback",
> +				"TODDR_A IN 0", "TDMIN_A OUT",
> +				"TODDR_B IN 0", "TDMIN_A OUT",
> +				"TODDR_C IN 0", "TDMIN_A OUT",
> +				"TODDR_A IN 1", "TDMIN_B OUT",
> +				"TODDR_B IN 1", "TDMIN_B OUT",
> +				"TODDR_C IN 1", "TDMIN_B OUT",
> +				"TODDR_A IN 2", "TDMIN_C OUT",
> +				"TODDR_B IN 2", "TDMIN_C OUT",
> +				"TODDR_C IN 2", "TDMIN_C OUT",
> +				"TODDR_A IN 3", "SPDIFIN Capture",
> +				"TODDR_B IN 3", "SPDIFIN Capture",
> +				"TODDR_C IN 3", "SPDIFIN Capture",
> +				"TODDR_A IN 6", "TDMIN_LB OUT",
> +				"TODDR_B IN 6", "TDMIN_LB OUT",
> +				"TODDR_C IN 6", "TDMIN_LB OUT",
> +				"Analog_PA INL", "ACODEC LOLP",
> +				"Analog_PA INR", "ACODEC LORP",
> +				"Lineout", "Analog_PA OUTL",
> +				"Lineout", "Analog_PA OUTR";
> +		clocks = <&clkc_pll CLKID_HIFI_PLL>,
> +			 <&clkc_pll CLKID_MPLL0>,
> +			 <&clkc_pll CLKID_MPLL1>;
> +		assigned-clocks = <&clkc_pll CLKID_HIFI_PLL>,
> +				  <&clkc_pll CLKID_MPLL0>,
> +				  <&clkc_pll CLKID_MPLL1>;
> +		assigned-clock-rates = <1179648000>,
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
> +		dai-link-3 {
> +			sound-dai = <&toddr_a>;
> +		};
> +
> +		dai-link-4 {
> +			sound-dai = <&toddr_b>;
> +		};
> +
> +		dai-link-5 {
> +			sound-dai = <&toddr_c>;
> +		};
> +
> +		dai-link-6 {
> +			sound-dai = <&tdmif_a>;
> +			dai-format = "i2s";
> +			dai-tdm-slot-tx-mask-0 = <1 1>;
> +			mclk-fs = <256>;
> +			codec-0 {
> +				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_A>;
> +			};
> +			codec-1 {
> +				sound-dai = <&toacodec TOACODEC_IN_A>;
> +			};
> +		};
> +
> +		dai-link-7 {
> +			sound-dai = <&tdmif_b>;
> +			dai-format = "i2s";
> +			dai-tdm-slot-tx-mask-0 = <1 1>;
> +			mclk-fs = <256>;
> +			codec-0 {
> +				sound-dai = <&toacodec TOACODEC_IN_B>;
> +			};
> +			codec-1 {
> +				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_B>;
> +			};
> +		};
> +
> +		/* 8ch HDMI interface */
> +		dai-link-8 {
> +			sound-dai = <&tdmif_c>;
> +			dai-format = "i2s";
> +			dai-tdm-slot-tx-mask-0 = <1 1>;
> +			dai-tdm-slot-tx-mask-1 = <1 1>;
> +			dai-tdm-slot-tx-mask-2 = <1 1>;
> +			dai-tdm-slot-tx-mask-3 = <1 1>;
> +			mclk-fs = <256>;
> +			codec-0 {
> +				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_C>;
> +			};
> +		};
> +
> +		/* spdif hdmi and coax output */
> +		dai-link-9 {
> +			sound-dai = <&spdifout_a>;
> +
> +			codec-0 {
> +				sound-dai = <&spdif_dit>;
> +			};
> +
> +			codec-1 {
> +				sound-dai = <&tohdmitx TOHDMITX_SPDIF_IN_A>;
> +			};
> +		};
> +
> +		/* spdif hdmi interface */
> +		dai-link-10 {
> +			sound-dai = <&spdifout_b>;
> +
> +			codec {
> +				sound-dai = <&tohdmitx TOHDMITX_SPDIF_IN_B>;
> +			};
> +		};
> +
> +		/* spdif coax input */
> +		dai-link-11 {
> +			sound-dai = <&spdifin>;
> +
> +			codec {
> +				sound-dai = <&spdif_dir>;
> +			};

Was this tested ? ...

> +		};
> +
> +		dai-link-12 {
> +			sound-dai = <&toacodec TOACODEC_OUT>;
> +
> +			codec {
> +				sound-dai = <&acodec>;
> +			};
> +		};
> +	};
>  };
>  
>  &pwm_ef {
> @@ -235,3 +447,102 @@ &ethmac {
>  	phy-handle = <&internal_ephy>;
>  	phy-mode = "rmii";
>  };
> +
> +&acodec {
> +	AVDD-supply = <&vddio_ao1v8>;
> +	status = "okay";
> +};
> +
> +&arb {
> +	status = "okay";
> +};
> +
> +&clkc_audio {
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
> +&spdifin {
> +	status = "okay";

... as sashiko pointed out, you are indeed missing a pinctrl for it.

With sashiko remarks handled

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
