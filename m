Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039D3C07E8E
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Apr 2024 10:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jCP+Z5deu2nyYGRJTIOds6XGoJ0sz4CEusHDgiT17kk=; b=cb8W+WFWPEN9DI
	MOLsS2AEkA2gAQqOPmXLyNxrgmGZ5lJHt69AI3W9AUit6EvBriSeI83cpbtI7LZocG19igWnl3EFd
	jxy8yGnnWH9TLYd5yff793z+9r4m52PX6gCTNyBiJ/URr1cV1JH8Bv58tRqdap0bkaJ9bcgTgD06N
	5YoO+Hgp4uatCkPnkr9ft+YBfsybiH++8Gjq65TmHP+mnSXz5W2xuISJBNYcD1b3w5+0hNEekSVFP
	fKYOYaClIAiT2dDPPmnouvm9suLB0fPabj9bM9gtfWvqXRKYnl/D3j+1OPN0Hx4I52AJZttwiQaIJ
	h2JmGTpcX6K0/9aO4ZxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzZsG-00000003hJP-3aoU;
	Wed, 24 Apr 2024 10:29:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzZsC-00000003hF0-031Y;
	Wed, 24 Apr 2024 10:29:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=m1pvHYyf3y5XhVuSDuue5CYVX7YzYseFKwuIgEJIaTY=; b=kCctW7kyR6G1KcD4OAQz5jm/V4
	MuqEJsd2Ef/gBxOaZ4VcI4G5eBcCggiTwDdJ+Im0gwlyMcU55e/0PM+XmvMEhMJDeN2trrj6pj64b
	JuCOPxVQXxa8x6mbL4RKxjlbUgXeDHopDMud9U0XnHbMjbZsaxeAXGcBwLq9KtMBhNZL5xBXuQ0Ng
	nl2+jMCcxgtWwvnBEUdJa3WOToC65oD63+VnPfC2GIj8dls46HuW+mo+sggPNavRE2WEh4TWP6uVQ
	AIO26auz2Emi6m/Gh6kRxtwczcR/+UY39AKW3ANGVNXp7wnmZjUL7U/JOwezFdnDkOd8BiQY18Ucl
	qHtnXTtw==;
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzZs4-0000000EM84-09jU;
	Wed, 24 Apr 2024 10:29:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2EAA9CE13A4;
	Wed, 24 Apr 2024 10:28:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1BEA8C2BD10;
	Wed, 24 Apr 2024 10:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713954525;
	bh=gortqEOsO/yuPJEH7+s0bpeCQjgJMory7BCL8cwxXnI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XT/JUf2zQC0rWC2UIw/MbPlaY/92sOTikY/TERJ5GJ6yHEjJmWolfrGTXq5fniK6g
	 uKnGL0Mvlkr00tHTGYyDQvandQwffSdrOOaE4hJgIZFs9gI+YWsGmk1aGXr1gAyu41
	 c973BIqft6cNf+aLBL08EZKPJudBVDpnobZp/7uRWiw75+OY259W0JF2SkCkzDeYC9
	 pxOBHccUcVllH8wADkM5asCLMV4LQy8+IuDlf0c9nJavnfQwriMlqVojk9ZdBlOWBM
	 hur0WBUhvHkblL5iv7WKxyIMgVOXSvEWuLDBZ8l6X2TGfuLFc5BoGdIfTOibGUufJ2
	 7ioG6/mMfcj9g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0085EC10F16;
	Wed, 24 Apr 2024 10:28:45 +0000 (UTC)
From: Kelvin Zhang via B4 Relay <devnull+kelvin.zhang.amlogic.com@kernel.org>
Date: Wed, 24 Apr 2024 18:28:35 +0800
Subject: [PATCH v4 2/2] arm64: dts: amlogic: Add Amlogic S4 PWM
MIME-Version: 1.0
Message-Id: <20240424-s4-pwm-v4-2-ee22effd40d0@amlogic.com>
References: <20240424-s4-pwm-v4-0-ee22effd40d0@amlogic.com>
In-Reply-To: <20240424-s4-pwm-v4-0-ee22effd40d0@amlogic.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Kelvin Zhang <kelvin.zhang@amlogic.com>, 
 Junyi Zhao <junyi.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713954523; l=5107;
 i=kelvin.zhang@amlogic.com; s=20240329; h=from:subject:message-id;
 bh=Wdbl9C4qxCA5ehEmpbCc7nMHnQDKo3VG8DPUHKZUfJI=;
 b=cU5Y3Hz/+DQ928ZpnIt+3BcjOuX0nYjgRDbCLkkZkeLAWxuSgXophbWkMj4vSDJtYBJn4rF3p
 nl06tnqdjDNC2WgqdZb9DD9UvyljBm7J+NpXbkEOqUySHJBAQsfQ51M
X-Developer-Key: i=kelvin.zhang@amlogic.com; a=ed25519;
 pk=pgnle7HTNvnNTcOoGejvtTC7BJT30HUNXfMHRRXSylI=
X-Endpoint-Received: by B4 Relay for kelvin.zhang@amlogic.com/20240329 with
 auth_id=148
X-Original-From: Kelvin Zhang <kelvin.zhang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_112901_024330_F7F2355F 
X-CRM114-Status: UNSURE (   8.34  )
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

From: Junyi Zhao <junyi.zhao@amlogic.com>

Add device nodes for PWM_AB, PWM_CD, PWM_EF, PWM_GH and PWM_IJ
along with GPIO PIN configs of each channel.

Signed-off-by: Junyi Zhao <junyi.zhao@amlogic.com>
Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 207 ++++++++++++++++++++++++++++++
 1 file changed, 207 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 10896f9df682..8165b263ab92 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -292,6 +292,168 @@ mux {
 					};
 				};
 
+				pwm_a_pins1: pwm_a_pins1 {
+					mux {
+						groups = "pwm_a_d";
+						function = "pwm_a";
+					};
+				};
+
+				pwm_a_pins2: pwm_a_pins2 {
+					mux {
+						groups = "pwm_a_x";
+						function = "pwm_a";
+					};
+				};
+
+				pwm_a_pins: pwm_a_pins {
+					mux {
+						groups = "pwm_a_d";
+						function = "pwm_a";
+					};
+				};
+
+				pwm_b_pins1: pwm_b_pins1 {
+					mux {
+						groups = "pwm_b_d";
+						function = "pwm_b";
+					};
+				};
+
+				pwm_b_pins2: pwm_b_pins2 {
+					mux {
+						groups = "pwm_b_x";
+						function = "pwm_b";
+					};
+				};
+
+				pwm_c_pins1: pwm_c_pins1 {
+					mux {
+						groups = "pwm_c_d";
+						function = "pwm_c";
+					};
+				};
+
+				pwm_c_pins2: pwm_c_pins2 {
+					mux {
+						groups = "pwm_c_x";
+						function = "pwm_c";
+					};
+				};
+
+				pwm_d_pins1: pwm_d_pins1 {
+					mux {
+						groups = "pwm_d_d";
+						function = "pwm_d";
+					};
+				};
+
+				pwm_d_pins2: pwm_d_pins2 {
+					mux {
+						groups = "pwm_d_h";
+						function = "pwm_d";
+					};
+				};
+
+				pwm_e_pins1: pwm_e_pins1 {
+					mux {
+						groups = "pwm_e_x";
+						function = "pwm_e";
+						drive-strength-microamp = <500>;
+					};
+				};
+
+				pwm_e_pins2: pwm_e_pins2 {
+					mux {
+						groups = "pwm_e_z";
+						function = "pwm_e";
+					};
+				};
+
+				pwm_f_pins1: pwm_f_pins1 {
+					mux {
+						groups = "pwm_f_x";
+						function = "pwm_f";
+					};
+				};
+
+				pwm_f_pins2: pwm_f_pins2 {
+					mux {
+						groups = "pwm_f_z";
+						function = "pwm_f";
+					};
+				};
+
+				pwm_g_pins1: pwm_g_pins1 {
+					mux {
+						groups = "pwm_g_d";
+						function = "pwm_g";
+					};
+				};
+
+				pwm_g_pins2: pwm_g_pins2 {
+					mux {
+						groups = "pwm_g_z";
+						function = "pwm_g";
+					};
+				};
+
+				pwm_h_pins: pwm_h_pins {
+					mux {
+						groups = "pwm_h";
+						function = "pwm_h";
+					};
+				};
+
+				pwm_i_pins1: pwm_i_pins1 {
+					mux {
+						groups = "pwm_i_d";
+						function = "pwm_i";
+					};
+				};
+
+				pwm_i_pins2: pwm_i_pins2 {
+					mux {
+						groups = "pwm_i_h";
+						function = "pwm_i";
+					};
+				};
+
+				pwm_j_pins: pwm_j_pins {
+					mux {
+						groups = "pwm_j";
+						function = "pwm_j";
+					};
+				};
+
+				pwm_a_hiz_pins: pwm_a_hiz_pins {
+					mux {
+						groups = "pwm_a_hiz";
+						function = "pwm_a_hiz";
+					};
+				};
+
+				pwm_b_hiz_pins: pwm_b_hiz_pins {
+					mux {
+						groups = "pwm_b_hiz";
+						function = "pwm_b_hiz";
+					};
+				};
+
+				pwm_c_hiz_pins: pwm_c_hiz_pins {
+					mux {
+						groups = "pwm_c_hiz";
+						function = "pwm_b_hiz";
+					};
+				};
+
+				pwm_g_hiz_pins: pwm_g_hiz_pins {
+					mux {
+						groups = "pwm_g_hiz";
+						function = "pwm_g_hiz";
+					};
+				};
+
 				nand_pins: nand-pins {
 					mux {
 						groups = "emmc_nand_d0",
@@ -449,6 +611,51 @@ i2c4: i2c@6e000 {
 				status = "disabled";
 			};
 
+			pwm_ab: pwm@58000 {
+				compatible = "amlogic,meson-s4-pwm";
+				reg = <0x0 0x58000 0x0 0x24>;
+				clocks = <&clkc_periphs CLKID_PWM_A>,
+						<&clkc_periphs CLKID_PWM_B>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			pwm_cd: pwm@5a000 {
+				compatible = "amlogic,meson-s4-pwm";
+				reg = <0x0 0x5a000 0x0 0x24>;
+				clocks = <&clkc_periphs CLKID_PWM_C>,
+						<&clkc_periphs CLKID_PWM_D>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			pwm_ef: pwm@5c000 {
+				compatible = "amlogic,meson-s4-pwm";
+				reg = <0x0 0x5c000 0x0 0x24>;
+				clocks = <&clkc_periphs CLKID_PWM_E>,
+						<&clkc_periphs CLKID_PWM_F>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			pwm_gh: pwm@5e000 {
+				compatible = "amlogic,meson-s4-pwm";
+				reg = <0x0 0x5e000 0x0 0x24>;
+				clocks = <&clkc_periphs CLKID_PWM_G>,
+						<&clkc_periphs CLKID_PWM_H>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			pwm_ij: pwm@60000 {
+				compatible = "amlogic,meson-s4-pwm";
+				reg = <0x0 0x60000 0x0 0x24>;
+				clocks = <&clkc_periphs CLKID_PWM_I>,
+						<&clkc_periphs CLKID_PWM_J>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
 			nand: nand-controller@8c800 {
 				compatible = "amlogic,meson-axg-nfc";
 				reg = <0x0 0x8c800 0x0 0x100>, <0x0 0x8c000 0x0 0x4>;

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
