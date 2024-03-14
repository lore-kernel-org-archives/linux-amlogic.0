Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3577C54E60
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Mar 2024 23:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dl+yKdJp7ZAju+S6SyGllyBiPbYHSD3oH32ULtTCZQE=; b=fRHQO9GUS4PhKC
	eOY7bNXl0LCg4+p2DsoDQtafNTKqzA47eMq+0YAtwv09ylIEMoJO/nEr5YH3sRySYLHxVko82P5w+
	ISZt8Ys3uH9kgqd9z4BKSWLdKp7/SmHCbEHdniTKF4b1EzHQdu3Bd8+IEbvPeYcPxBr2vg7vrmn2J
	Epk9t60erErQVGuyliT5lCZ2ypJTO3obemyaixEXi0+4ICi6rLP4aIurGxLYjlzsb/BYU3i1b9TU6
	I5a3TX3orHPz4ZOcBSL9AQYcSWcEHMLQBpF+LS1Jgtiytlfo2MqmY5axMtz+GATEZQlzjbS62RGS7
	XJ7iYRYYG1HheZVrKdaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuTE-0000000Fzt0-2ZmE;
	Thu, 14 Mar 2024 23:26:44 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuQ2-0000000Fxpm-2wgA;
	Thu, 14 Mar 2024 23:23:33 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 4AA63120018;
	Fri, 15 Mar 2024 02:23:10 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 4AA63120018
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1710458590;
	bh=EsZkg7PsNgeBq/F6pkLPHW4XZGjF5/748MlZOP2PBl4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=G26JHzXCwUXkf5+fNL9hrJJaEQdjxSF00tPbOiMwxhkEobOtNk9MZUPOD+IoWeBzE
	 n+3h7+SpGvrawGKENtFgplBVU8Gwmc33+ZoA3n+uCbAsKCmH0Ge4fewlzWCaGpAwgY
	 T6D2P1vcTjRM4sOeobxCNMrX8IkX63wPXu3ZzV5vzZ3DEmX2RNUuJYEZyabyaR56rs
	 X3Ft1UZjeVaxnu03F3HH9kEb2a21OrJ1+pzGpRTxkiTJDJKnhVIxuupmqMhbi8FhMH
	 x/0enhqmF/rkEsHjvDcuYjp5IMpZ+fLlS2JrLEd3xGfA+qreSVH8k+yziStOokW0q+
	 e/aWVeXJ685Jw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 15 Mar 2024 02:23:10 +0300 (MSK)
Received: from CAB-WSD-0003115.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 15 Mar 2024 02:23:09 +0300
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, <linux-amlogic@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>
CC: <kernel@salutedevices.com>, Dmitry Rokosov <ddrokosov@salutedevices.com>
Subject: [PATCH 25/25] arm64: dts: ad402: enable audio
Date: Fri, 15 Mar 2024 02:22:01 +0300
Message-ID: <20240314232201.2102178-26-jan.dakinevich@salutedevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183875 [Feb 29 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_smtp_not_equal_from}, FromAlignment: n, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_sender_alignment_int}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/02/29 19:21:00 #23899999
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_162327_450052_7E36CAFE 
X-CRM114-Status: GOOD (  11.79  )
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

 * playback to speaker

   - setup:
     $ amixer set "FRDDR_A SINK 1 SEL" "OUT 0"
     $ amixer set "FRDDR_A SRC 1 EN" "on"
     $ amixer set "TDMOUT_A SRC SEL" "IN 0"
     $ amixer set "TOACODEC Source" "I2S A"
     $ amixer set "TOACODEC Lane Select" "0"
     $ amixer set "TOACODEC EN" "on"
     $ amixer set "ACODEC" "70%"
     $ amixer set "ACODEC Playback Channel Mode" "Mono"
     $ amixer set "ACODEC Right+ Driver Sel" "Right DAC"
     $ amixer set "ACODEC Left+ Driver Sel" "Right DAC Inverted"

   - usage:
     $ aplay -D hw:0,0 -f S16_LE -r 48000 /path/to/sample.wav

 * capture from digital mics

   - setup:
     $ amixer set "TODDR_A SRC SEL" "IN 4"

   - usage:
     $ arecord -D hw:0,1 -f S32_LE -r 48000 -c 2 -t wav /path/to/sample.wav

 * capture from analog mics

   - setup:
     $ amixer set "TDMIN_A SRC SEL" "IN 3"
     $ amixer set "TODDR_B SRC SEL" "IN 0"
     $ amixer set "TOACODEC Source" "I2S A"
     $ amixer set "TOACODEC Lane Select" "0"
     $ amixer set "TOACODEC EN" "on"
     $ amixer set "ACODEC ADC" "70%"
     $ amixer set "ACODEC ADC Filter" "on"
     $ amixer set "ACODEC ADC Filter Mode" "HiFi"
     $ amixer set "ACODEC ADC Mic Bias" "on"
     $ amixer set "ACODEC ADC Mic Bias Level" "2.5V"
     $ amixer set "ACODEC ADC PGA" "50%"
     $ amixer set "ACODEC ADC PGA Right Sel" "Differential"
     $ amixer set "ACODEC ADC PGA Left Sel" "Differential"

   - usage:
     $ arecord -D hw:0,2 -f S16_LE -r 48000 -c 2 -t wav /path/to/sample.wav

 * capture from TDM loopback

   - setup:
     $ amixer set "TDMIN_LB SRC SEL" "IN 0"
     $ amixer set "TODDR_A SRC SEL" "IN 6"

   - usage:
     $ arecord -D hw:0,1 -f S16_LE -r 48000 -c 2 -t wav /path/to/sample.wav

   or

   - setup:
     $ amixer set "TDMIN_LB SRC SEL" "IN 0"
     $ amixer set "TODDR_B SRC SEL" "IN 6"

   - usage:
     $ arecord -D hw:0,2 -f S16_LE -r 48000 -c 2 -t wav /path/to/sample.wav

Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
---
 .../arm64/boot/dts/amlogic/meson-a1-ad402.dts | 126 ++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1-ad402.dts b/arch/arm64/boot/dts/amlogic/meson-a1-ad402.dts
index 4bc30af05848..4e0865a4b44e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1-ad402.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-a1-ad402.dts
@@ -8,6 +8,8 @@
 
 #include "meson-a1.dtsi"
 
+#include <dt-bindings/gpio/gpio.h>
+
 / {
 	compatible = "amlogic,ad402", "amlogic,a1";
 	model = "Amlogic Meson A1 AD402 Development Board";
@@ -83,6 +85,100 @@ vddio_1v8: regulator-vddio-1v8 {
 		vin-supply = <&vddao_3v3>;
 		regulator-always-on;
 	};
+
+	amplifier: amplifier {
+		compatible = "simple-audio-amplifier";
+		sound-name-prefix = "AMPLIFIER";
+		enable-gpios = <&gpio GPIOF_4 GPIO_ACTIVE_HIGH>;
+		VCC-supply = <&battery_4v2>;
+	};
+
+	dmics: dmics {
+		compatible = "dmic-codec";
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "MIC";
+		num-channels = <4>;
+		wakeup-delay-ms = <50>;
+	};
+
+	sound {
+		compatible = "amlogic,a1-sound-card",
+			     "amlogic,axg-sound-card";
+		model = "AD402";
+		audio-aux-devs = <&tdmout_a>,
+				 <&amplifier>,
+				 <&tdmin_lb>,
+				 <&tdmin_a>;
+		audio-routing = "TDMOUT_A IN 0", "FRDDR_A OUT 0",
+				"TDM_A Playback", "TDMOUT_A OUT",
+				"AMPLIFIER INL", "ACODEC LOLP",
+				"AMPLIFIER INR", "ACODEC LORP",
+
+				"TODDR_A IN 4", "PDM Capture",
+
+				"TDMIN_A IN 3", "TDM_A Capture",
+				"TODDR_B IN 0", "TDMIN_A OUT",
+
+				"TDMIN_LB IN 0", "TDM_A Loopback",
+				"TODDR_A IN 6", "TDMIN_LB OUT",
+				"TDMIN_LB IN 0", "TDM_A Loopback",
+				"TODDR_B IN 6", "TDMIN_LB OUT";
+
+		dai-link-0 {
+			link-name = "speaker";
+			sound-dai = <&frddr_a>;
+		};
+
+		dai-link-1 {
+			link-name = "dmics";
+			sound-dai = <&toddr_a>;
+		};
+
+		dai-link-2 {
+			link-name = "amics";
+			sound-dai = <&toddr_b>;
+		};
+
+		dai-link-3 {
+			sound-dai = <&tdmif_a>;
+			dai-format = "i2s";
+			dai-tdm-slot-tx-mask-0 = <1 1>;
+			dai-tdm-slot-rx-mask-0 = <1 1>;
+			mclk-fs = <256>;
+
+			codec-0 {
+				sound-dai = <&toacodec TOACODEC_IN_A>;
+			};
+
+			codec-1 {
+				sound-dai = <&toacodec TOACODEC_CAPTURE_OUT_A>;
+			};
+		};
+
+		dai-link-4 {
+			sound-dai = <&toacodec TOACODEC_OUT>;
+
+			codec {
+				sound-dai = <&acodec>;
+			};
+		};
+
+		dai-link-5 {
+			sound-dai = <&toacodec TOACODEC_CAPTURE_IN>;
+
+			codec {
+				sound-dai = <&acodec>;
+			};
+		};
+
+		dai-link-6 {
+			sound-dai = <&pdm>;
+
+			codec {
+				sound-dai = <&dmics>;
+			};
+		};
+	};
 };
 
 /* Bluetooth HCI H4 */
@@ -145,3 +241,33 @@ &sd_emmc {
 	vmmc-supply = <&vddao_3v3>;
 	vqmmc-supply = <&vddio_1v8>;
 };
+
+&clkc_audio {
+	assigned-clocks = <&clkc_pll CLKID_HIFI_PLL>,
+			  <&clkc_audio AUD_CLKID_MST_A_MCLK_SEL>,
+			  <&clkc_audio AUD_CLKID_MST_A_MCLK>,
+			  <&clkc_audio AUD2_CLKID_PDM_SYSCLK_SEL>,
+			  <&clkc_audio AUD2_CLKID_PDM_DCLK_SEL>;
+	assigned-clock-parents = <0>,
+				 <&clkc_pll CLKID_HIFI_PLL>,
+				 <0>,
+				 <&clkc_pll CLKID_FCLK_DIV3>,
+				 <&clkc_pll CLKID_FCLK_DIV2>;
+	assigned-clock-rates = <614400000>,
+			       <0>,
+			       <12288000>,
+			       <512000000>,
+			       <768000000>;
+};
+
+&acodec {
+	AVDD-supply = <&vddio_1v8>;
+};
+
+&pdm {
+	sysrate = <256000000>;
+	pinctrl-0 = <&pdm_din0_a_pins>,
+		    <&pdm_din1_a_pins>,
+		    <&pdm_dclk_a_pins>;
+	pinctrl-names = "default";
+};
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
