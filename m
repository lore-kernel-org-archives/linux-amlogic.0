Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C972AC25B74
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 May 2024 08:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=poMm0dn2eRhahz+BO78h809lremd58Rf/bJ8w8OPvHg=; b=maMLxAJE6S3qvi
	+vZjPotuaGenrcgpmPvgOdCdS89KDx2cpD5nrAMaCsPQ/0o5rFIZAYS4ahwC94pYmwVU70SmxCYa3
	FLnMZSD+j6hTqDCxafhN1f0pDTAzFrIcvxrpf3gNep/sdbYZmENUIL3fAV2lk7BJ/2ecmVowMQ3KZ
	868kQOLNwIXFtennBJwzOu+oxKzx8olQkN/0i3Haa/D5z87S+oiE8JUD6dciaZBD67LFAISLb4Qya
	6PwG0514yQnaAsDqaN8E801Y072Xk+b4OfpveNQpXTXCVHBGuBSkOfvQbhaHMppzm5qUUHVPl7s1o
	to2Qbn3pnNGvTPwkHq0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Kul-0000000Glja-1Zt9;
	Tue, 21 May 2024 08:32:07 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Kuh-0000000Glgo-03HH;
	Tue, 21 May 2024 08:32:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A50F5CE0EBF;
	Tue, 21 May 2024 08:31:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7CFC8C32782;
	Tue, 21 May 2024 08:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716280318;
	bh=yjaY+ZWB/r8AWrG1fpHU57xxaI1jWMEra2VrDdLZwM4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GwYluKuL+2IUlfcQ7Bky6JoT5VuXWvi5ncILmD81WxU5bA5Ez1o1GZy2NWifu8c6w
	 AEyx6KIkjJBernEA+VLDU5VUMNi9EktlCqxmMP9sY5EOHO6YvLgLVkQzMoRGtiVJtW
	 anJMsqCLe1UZGPCnqHVBs6kOXqxefQ3/4yeOKPCu547D9kA/MACvti1KERhKWMmD6r
	 CvmQOWgOTjGJqFNQnhnv9+Ehx2EmLxoz7YGWBxdIMrurW6coEg9u+9Zv0mmsgyTmf7
	 ee/qxufCy5mQD1m3w9+8yARxeZxFKBo2rYPHoNzLUlYChbQGYH/KR5qoPDGgztCc1u
	 pRpBn7yRjL0dw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A275C25B74;
	Tue, 21 May 2024 08:31:58 +0000 (UTC)
From: Kelvin Zhang via B4 Relay <devnull+kelvin.zhang.amlogic.com@kernel.org>
Date: Tue, 21 May 2024 16:31:35 +0800
Subject: [PATCH v5 2/2] arm64: dts: amlogic: Add Amlogic S4 PWM
MIME-Version: 1.0
Message-Id: <20240521-s4-pwm-v5-2-0c91f5fa32cd@amlogic.com>
References: <20240521-s4-pwm-v5-0-0c91f5fa32cd@amlogic.com>
In-Reply-To: <20240521-s4-pwm-v5-0-0c91f5fa32cd@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716280316; l=5107;
 i=kelvin.zhang@amlogic.com; s=20240329; h=from:subject:message-id;
 bh=5U3ZfvXqlCsNqXvPvEl3sOq8j8Habn9zsVZgLm81vao=;
 b=VuJ8JSN53fe4qCKxBNROGp19H9cncXyicg5TF2ALwOQDBZbI61YplGZmPAelAyY3UapyoJl34
 qvsE3DCst64A6f5T8xhAcMgBG475Ik8W/F8XE5lVN4Rjc11NNL7nisH
X-Developer-Key: i=kelvin.zhang@amlogic.com; a=ed25519;
 pk=pgnle7HTNvnNTcOoGejvtTC7BJT30HUNXfMHRRXSylI=
X-Endpoint-Received: by B4 Relay for kelvin.zhang@amlogic.com/20240329 with
 auth_id=148
X-Original-From: Kelvin Zhang <kelvin.zhang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_013204_547083_038378BD 
X-CRM114-Status: UNSURE (   8.76  )
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
index 10896f9df682..d0c170368892 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -292,6 +292,168 @@ mux {
 					};
 				};
 
+				pwm_a_pins1: pwm-a-pins1 {
+					mux {
+						groups = "pwm_a_d";
+						function = "pwm_a";
+					};
+				};
+
+				pwm_a_pins2: pwm-a-pins2 {
+					mux {
+						groups = "pwm_a_x";
+						function = "pwm_a";
+					};
+				};
+
+				pwm_a_pins: pwm-a-pins {
+					mux {
+						groups = "pwm_a_d";
+						function = "pwm_a";
+					};
+				};
+
+				pwm_b_pins1: pwm-b-pins1 {
+					mux {
+						groups = "pwm_b_d";
+						function = "pwm_b";
+					};
+				};
+
+				pwm_b_pins2: pwm-b-pins2 {
+					mux {
+						groups = "pwm_b_x";
+						function = "pwm_b";
+					};
+				};
+
+				pwm_c_pins1: pwm-c-pins1 {
+					mux {
+						groups = "pwm_c_d";
+						function = "pwm_c";
+					};
+				};
+
+				pwm_c_pins2: pwm-c-pins2 {
+					mux {
+						groups = "pwm_c_x";
+						function = "pwm_c";
+					};
+				};
+
+				pwm_d_pins1: pwm-d-pins1 {
+					mux {
+						groups = "pwm_d_d";
+						function = "pwm_d";
+					};
+				};
+
+				pwm_d_pins2: pwm-d-pins2 {
+					mux {
+						groups = "pwm_d_h";
+						function = "pwm_d";
+					};
+				};
+
+				pwm_e_pins1: pwm-e-pins1 {
+					mux {
+						groups = "pwm_e_x";
+						function = "pwm_e";
+						drive-strength-microamp = <500>;
+					};
+				};
+
+				pwm_e_pins2: pwm-e-pins2 {
+					mux {
+						groups = "pwm_e_z";
+						function = "pwm_e";
+					};
+				};
+
+				pwm_f_pins1: pwm-f-pins1 {
+					mux {
+						groups = "pwm_f_x";
+						function = "pwm_f";
+					};
+				};
+
+				pwm_f_pins2: pwm-f-pins2 {
+					mux {
+						groups = "pwm_f_z";
+						function = "pwm_f";
+					};
+				};
+
+				pwm_g_pins1: pwm-g-pins1 {
+					mux {
+						groups = "pwm_g_d";
+						function = "pwm_g";
+					};
+				};
+
+				pwm_g_pins2: pwm-g-pins2 {
+					mux {
+						groups = "pwm_g_z";
+						function = "pwm_g";
+					};
+				};
+
+				pwm_h_pins: pwm-h-pins {
+					mux {
+						groups = "pwm_h";
+						function = "pwm_h";
+					};
+				};
+
+				pwm_i_pins1: pwm-i-pins1 {
+					mux {
+						groups = "pwm_i_d";
+						function = "pwm_i";
+					};
+				};
+
+				pwm_i_pins2: pwm-i-pins2 {
+					mux {
+						groups = "pwm_i_h";
+						function = "pwm_i";
+					};
+				};
+
+				pwm_j_pins: pwm-j-pins {
+					mux {
+						groups = "pwm_j";
+						function = "pwm_j";
+					};
+				};
+
+				pwm_a_hiz_pins: pwm-a-hiz-pins {
+					mux {
+						groups = "pwm_a_hiz";
+						function = "pwm_a_hiz";
+					};
+				};
+
+				pwm_b_hiz_pins: pwm-b-hiz-pins {
+					mux {
+						groups = "pwm_b_hiz";
+						function = "pwm_b_hiz";
+					};
+				};
+
+				pwm_c_hiz_pins: pwm-c-hiz-pins {
+					mux {
+						groups = "pwm_c_hiz";
+						function = "pwm_b_hiz";
+					};
+				};
+
+				pwm_g_hiz_pins: pwm-g-hiz-pins {
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
