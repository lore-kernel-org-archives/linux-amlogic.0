Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58423CE7B03
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2024 12:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+J42jfWvKu2XqCdIYo+rLyIHI1LYSFtpV9CGm/hTCMw=; b=kS9NXB9AphvsyR
	+dxL47JsQC2Yqx8enVWGaUJmOcUqpeFWhAdpqBDtHpH6sYGMQ/oTDp5gTtnNyKLkUdQsr56DsNEWQ
	86bIOTnr9I6+kVTHKwUzcQ+C74TNEZ8W1IuhDOmxJf/ImiQwLVwpncSbf6OanC/s/jkz6qjEI/nE+
	LCrWxSz9aF4f79Co8T9EKLa69NrJ9T8RVTSVxAbaplt0t6wfgnP+lZPFb/bEpyWpnNEM4NlJz2IGH
	5GUa2ufZE988RmFkQJEJcW7xyhN6YCFU4nx3hw/h8t8NVnyb/G7yjOi6IBz76lihg0ZFmMc2r9zkD
	HvIwmgukilQOH1K7KzuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smYOH-0000000CDp1-1KGv;
	Fri, 06 Sep 2024 12:48:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smYM9-0000000CD5d-2U4n;
	Fri, 06 Sep 2024 12:46:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C77005C5BA1;
	Fri,  6 Sep 2024 12:46:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2E78C4CEC9;
	Fri,  6 Sep 2024 12:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725626787;
	bh=gjxdgzOTbuK1t3oNsNGH+aVaLHi2i5JqWnGkD0BaPas=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oarpxpdkg5HCKPf1vI10txQ83U17NiHv1u25+mZcxeelk5FX5Pw8WhfXIf/URRk99
	 ftLzwMXxFHJIiot/VXuq+zTKHQIZbo7KQhAChvIzMLNdGRL3/FWTB6X7rX5OzQW+eU
	 wUXtBOa8L8X+Qjlr2jXSJwcA0Zo5Flt4VKMI6Acs7cPFRMLQbJyIkVEPD/z5cbphfW
	 FBDtO65wdE3rn6i4w1yOWVBd4+A9qomHq92NNb3zuL2MelTyYna9lEnyuslYlMh5nv
	 NYr9GHYKMjPGcFA8tYz5DyLSTV5wsVjTrc1xUh0jClYICJARr8Y8iOD6PHyR1xL3vg
	 LCNvIDUXBAazw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C122ECE7B0A;
	Fri,  6 Sep 2024 12:46:27 +0000 (UTC)
From: Kelvin Zhang via B4 Relay <devnull+kelvin.zhang.amlogic.com@kernel.org>
Date: Fri, 06 Sep 2024 20:46:13 +0800
Subject: [PATCH 2/2] arm64: dts: amlogic: Add Amlogic C3 PWM
MIME-Version: 1.0
Message-Id: <20240906-c3-pwm-v1-2-acaf17fad247@amlogic.com>
References: <20240906-c3-pwm-v1-0-acaf17fad247@amlogic.com>
In-Reply-To: <20240906-c3-pwm-v1-0-acaf17fad247@amlogic.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Kelvin Zhang <kelvin.zhang@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725626786; l=8236;
 i=kelvin.zhang@amlogic.com; s=20240329; h=from:subject:message-id;
 bh=zpCPu/y3GMnpSwM1eRSKg3vp+x4qEdbYa0rlZLB2lXQ=;
 b=Ze2QZNgsOWg9QqrGTnnOT3i2QdfB8bDCNHBtv2Tv1DtMJgxQuvZHS9DznJulTeD8GIP1bphAr
 tA+j2CNI8+tAleJtwKhxp6TMGi8xs/lKXrwGC4Qh20+6Th2M/Ort5rR
X-Developer-Key: i=kelvin.zhang@amlogic.com; a=ed25519;
 pk=pgnle7HTNvnNTcOoGejvtTC7BJT30HUNXfMHRRXSylI=
X-Endpoint-Received: by B4 Relay for kelvin.zhang@amlogic.com/20240329 with
 auth_id=148
X-Original-From: Kelvin Zhang <kelvin.zhang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_054630_145416_F19651DE 
X-CRM114-Status: UNSURE (   8.88  )
X-CRM114-Notice: Please train this message.
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
Reply-To: kelvin.zhang@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Kelvin Zhang <kelvin.zhang@amlogic.com>

Add device nodes for PWM_AB, PWM_CD, PWM_EF, PWM_GH, PWM_IJ, PWM_KL
and PWM_MN, along with the GPIO pin configurations for each channel.

Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 364 ++++++++++++++++++++++++++++
 1 file changed, 364 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
index d0cda759c25d..fd0e557eba06 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
@@ -410,6 +410,300 @@ mux {
 						drive-strength-microamp = <4000>;
 					};
 				};
+
+				pwm_a_pins1: pwm-a-pins1 {
+					mux {
+						groups = "pwm_a";
+						function = "pwm_a";
+					};
+				};
+
+				pwm_b_pins1: pwm-b-pins1 {
+					mux {
+						groups = "pwm_b";
+						function = "pwm_b";
+					};
+				};
+
+				pwm_c_pins1: pwm-c-pins1 {
+					mux {
+						groups = "pwm_c";
+						function = "pwm_c";
+					};
+				};
+
+				pwm_d_pins1: pwm-d-pins1 {
+					mux {
+						groups = "pwm_d";
+						function = "pwm_d";
+					};
+				};
+
+				pwm_e_pins1: pwm-e-pins1 {
+					mux {
+						groups = "pwm_e";
+						function = "pwm_e";
+					};
+				};
+
+				pwm_f_pins1: pwm-f-pins1 {
+					mux {
+						groups = "pwm_f";
+						function = "pwm_f";
+					};
+				};
+
+				pwm_g_pins1: pwm-g-pins1 {
+					mux {
+						groups = "pwm_g_b";
+						function = "pwm_g";
+					};
+				};
+
+				pwm_g_pins2: pwm-g-pins2 {
+					mux {
+						groups = "pwm_g_c";
+						function = "pwm_g";
+					};
+				};
+
+				pwm_g_pins3: pwm-g-pins3 {
+					mux {
+						groups = "pwm_g_d";
+						function = "pwm_g";
+					};
+				};
+
+				pwm_g_pins4: pwm-g-pins4 {
+					mux {
+						groups = "pwm_g_x0";
+						function = "pwm_g";
+					};
+				};
+
+				pwm_g_pins5: pwm-g-pins5 {
+					mux {
+						groups = "pwm_g_x8";
+						function = "pwm_g";
+					};
+				};
+
+				pwm_h_pins1: pwm-h-pins1 {
+					mux {
+						groups = "pwm_h_b";
+						function = "pwm_h";
+					};
+				};
+
+				pwm_h_pins2: pwm-h-pins2 {
+					mux {
+						groups = "pwm_h_c";
+						function = "pwm_h";
+					};
+				};
+
+				pwm_h_pins3: pwm-h-pins3 {
+					mux {
+						groups = "pwm_h_d";
+						function = "pwm_h";
+					};
+				};
+
+				pwm_h_pins4: pwm-h-pins4 {
+					mux {
+						groups = "pwm_h_x1";
+						function = "pwm_h";
+					};
+				};
+
+				pwm_h_pins5: pwm-h-pins5 {
+					mux {
+						groups = "pwm_h_x9";
+						function = "pwm_h";
+					};
+				};
+
+				pwm_i_pins1: pwm-i-pins1 {
+					mux {
+						groups = "pwm_i_b";
+						function = "pwm_i";
+					};
+				};
+
+				pwm_i_pins2: pwm-i-pins2 {
+					mux {
+						groups = "pwm_i_c";
+						function = "pwm_i";
+					};
+				};
+
+				pwm_i_pins3: pwm-i-pins3 {
+					mux {
+						groups = "pwm_i_d";
+						function = "pwm_i";
+					};
+				};
+
+				pwm_i_pins4: pwm-i-pins4 {
+					mux {
+						groups = "pwm_i_x2";
+						function = "pwm_i";
+					};
+				};
+
+				pwm_i_pins5: pwm-i-pins5 {
+					mux {
+						groups = "pwm_i_x10";
+						function = "pwm_i";
+					};
+				};
+
+				pwm_j_pins1: pwm-j-pins1 {
+					mux {
+						groups = "pwm_j_c";
+						function = "pwm_j";
+					};
+				};
+
+				pwm_j_pins2: pwm-j-pins2 {
+					mux {
+						groups = "pwm_j_d";
+						function = "pwm_j";
+					};
+				};
+
+				pwm_j_pins3: pwm-j-pins3 {
+					mux {
+						groups = "pwm_j_b";
+						function = "pwm_j";
+					};
+				};
+
+				pwm_j_pins4: pwm-j-pins4 {
+					mux {
+						groups = "pwm_j_x3";
+						function = "pwm_j";
+					};
+				};
+
+				pwm_j_pins5: pwm-j-pins5 {
+					mux {
+						groups = "pwm_j_x12";
+						function = "pwm_j";
+					};
+				};
+
+				pwm_k_pins1: pwm-k-pins1 {
+					mux {
+						groups = "pwm_k_c";
+						function = "pwm_k";
+					};
+				};
+
+				pwm_k_pins2: pwm-k-pins2 {
+					mux {
+						groups = "pwm_k_d";
+						function = "pwm_k";
+					};
+				};
+
+				pwm_k_pins3: pwm-k-pins3 {
+					mux {
+						groups = "pwm_k_b";
+						function = "pwm_k";
+					};
+				};
+
+				pwm_k_pins4: pwm-k-pins4 {
+					mux {
+						groups = "pwm_k_x4";
+						function = "pwm_k";
+					};
+				};
+
+				pwm_k_pins5: pwm-k-pins5 {
+					mux {
+						groups = "pwm_k_x13";
+						function = "pwm_k";
+					};
+				};
+
+				pwm_l_pins1: pwm-l-pins1 {
+					mux {
+						groups = "pwm_l_c";
+						function = "pwm_l";
+					};
+				};
+
+				pwm_l_pins2: pwm-l-pins2 {
+					mux {
+						groups = "pwm_l_x";
+						function = "pwm_l";
+					};
+				};
+
+				pwm_l_pins3: pwm-l-pins3 {
+					mux {
+						groups = "pwm_l_b";
+						function = "pwm_l";
+					};
+				};
+
+				pwm_l_pins4: pwm-l-pins4 {
+					mux {
+						groups = "pwm_l_a";
+						function = "pwm_l";
+					};
+				};
+
+				pwm_m_pins1: pwm-m-pins1 {
+					mux {
+						groups = "pwm_m_c";
+						function = "pwm_m";
+					};
+				};
+
+				pwm_m_pins2: pwm-m-pins2 {
+					mux {
+						groups = "pwm_m_x";
+						function = "pwm_m";
+					};
+				};
+
+				pwm_m_pins3: pwm-m-pins3 {
+					mux {
+						groups = "pwm_m_a";
+						function = "pwm_m";
+					};
+				};
+
+				pwm_m_pins4: pwm-m-pins4 {
+					mux {
+						groups = "pwm_m_b";
+						function = "pwm_m";
+					};
+				};
+
+				pwm_n_pins1: pwm-n-pins1 {
+					mux {
+						groups = "pwm_n_x";
+						function = "pwm_n";
+					};
+				};
+
+				pwm_n_pins2: pwm-n-pins2 {
+					mux {
+						groups = "pwm_n_a";
+						function = "pwm_n";
+					};
+				};
+
+				pwm_n_pins3: pwm-n-pins3 {
+					mux {
+						groups = "pwm_n_b";
+						function = "pwm_n";
+					};
+				};
 			};
 
 			gpio_intc: interrupt-controller@4080 {
@@ -490,6 +784,16 @@ spicc1: spi@52000 {
 				status = "disabled";
 			};
 
+			pwm_mn: pwm@54000 {
+				compatible = "amlogic,c3-pwm",
+					     "amlogic,meson-s4-pwm";
+				reg = <0x0 54000 0x0 0x24>;
+				clocks = <&clkc_periphs CLKID_PWM_M>,
+					 <&clkc_periphs CLKID_PWM_N>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
 			spifc: spi@56000 {
 				compatible = "amlogic,a1-spifc";
 				reg = <0x0 0x56000 0x0 0x290>;
@@ -499,6 +803,66 @@ spifc: spi@56000 {
 				status = "disabled";
 			};
 
+			pwm_ab: pwm@58000 {
+				compatible = "amlogic,c3-pwm",
+					     "amlogic,meson-s4-pwm";
+				reg = <0x0 0x58000 0x0 0x24>;
+				clocks = <&clkc_periphs CLKID_PWM_A>,
+					 <&clkc_periphs CLKID_PWM_B>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			pwm_cd: pwm@5a000 {
+				compatible = "amlogic,c3-pwm",
+					     "amlogic,meson-s4-pwm";
+				reg = <0x0 0x5a000 0x0 0x24>;
+				clocks = <&clkc_periphs CLKID_PWM_C>,
+					 <&clkc_periphs CLKID_PWM_D>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			pwm_ef: pwm@5c000 {
+				compatible = "amlogic,c3-pwm",
+					     "amlogic,meson-s4-pwm";
+				reg = <0x0 0x5c000 0x0 0x24>;
+				clocks = <&clkc_periphs CLKID_PWM_E>,
+					 <&clkc_periphs CLKID_PWM_F>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			pwm_gh: pwm@5e000 {
+				compatible = "amlogic,c3-pwm",
+					     "amlogic,meson-s4-pwm";
+				reg = <0x0 0x5e000 0x0 0x24>;
+				clocks = <&clkc_periphs CLKID_PWM_G>,
+					 <&clkc_periphs CLKID_PWM_H>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			pwm_ij: pwm@60000 {
+				compatible = "amlogic,c3-pwm",
+					     "amlogic,meson-s4-pwm";
+				reg = <0x0 0x60000 0x0 0x24>;
+				clocks = <&clkc_periphs CLKID_PWM_I>,
+					 <&clkc_periphs CLKID_PWM_J>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			pwm_kl: pwm@62000 {
+				compatible = "amlogic,c3-pwm",
+					     "amlogic,meson-s4-pwm";
+				reg = <0x0 0x62000 0x0 0x24>;
+				clocks = <&clkc_periphs CLKID_PWM_K>,
+					 <&clkc_periphs CLKID_PWM_L>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
 			i2c0: i2c@66000 {
 				compatible = "amlogic,meson-axg-i2c";
 				reg = <0x0 0x66000 0x0 0x24>;

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
