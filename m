Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16140C4345F
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2024 16:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MK1iVSLe+bf0Ais8s8o4vgNpQsiSlg2kDerqTa8vmM4=; b=HNzb2T6F1sC65O
	V/DxBhCkMscBs9fP3Cctjs0vub/TcMQjcufgn2lPmfLrh5wE3SVKfXdnTKYnmUHM+YsU8tsPjg2lx
	1QknGYPVsRcR6iZHdq582tsO96sftMLJ6ZvAmICjatVM+nmEBqMFTq7IkoL1vPw0Z4VfCYGTfTDgg
	h6+cqMXAQ68+xgel68ctkRGk+8kIdUw74/wxxAVZKC8OAnJOpKcaBTf+iE/I2B66gNDRgvJ0sOJm1
	+c9yq9jeLPqVzIvoqGalegUIssUoG0suy07tvdVlv5FXnd3c21DrTVW3GIJ7aERupanawnwL/8BaS
	FF7PdhFnczTfvnOaD0xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzIm6-00000000g2s-01Lt;
	Tue, 23 Apr 2024 16:13:42 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzIm2-00000000g2E-3woX;
	Tue, 23 Apr 2024 16:13:40 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 1FF3D12000D;
	Tue, 23 Apr 2024 19:13:36 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 1FF3D12000D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1713888816;
	bh=dsi17VqWU0DeMUqis1oZr0f4adDGLGKd1AbqyPsRJcY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=R9A6em4CGhqPraDGpm0nzOBfUexBQ3LC1cn4OCKDtmf+wTU5tS4xlE9n1vWC8ERtE
	 BNekyOWHj2CpPZUr3E0aiaDDz7fHcfi3d8cTXKXjnQg5Jvdhv5PjZ3bDfkibPVpu/Z
	 0yOLasOkdDxR/Nh+9nlDG+WPBFWI4XjdcrUToT/pnihw0nt6mpHKoEpg4pgj7Zgxcg
	 JyFCJOu33qQfEaGYpTzI3MwbJB6DPis4uSVztJQmNaDMU5lzxEu+nWsiM4Z/snIkWi
	 7M8HpiSjsmve1/aE3qORMRwUN2ik8RX5TFdB04zAnWykrqbV/WnAfg2RkklJjEv0OK
	 /FnEKkR68wwng==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 23 Apr 2024 19:13:35 +0300 (MSK)
Received: from work.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 23 Apr 2024 19:13:35 +0300
From: George Stark <gnstark@salutedevices.com>
To: <u.kleine-koenig@pengutronix.de>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <conor+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <robh+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@salutedevices.com>, George Stark <GNStark@sberdevices.ru>, Dmitry
 Rokosov <ddrokosov@salutedevices.com>
Subject: [PATCH 1/1] arm64: dts: meson: a1: add definitions for meson pwm
Date: Tue, 23 Apr 2024 19:13:27 +0300
Message-ID: <20240423161327.2522556-1-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184882 [Apr 23 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 18 0.3.18 b9d6ada76958f07c6a68617a7ac8df800bc4166c, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;100.64.160.123:7.1.2;smtp.sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2;lore.kernel.org:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/04/23 15:16:00
X-KSMG-LinksScanning: Clean, bases: 2024/04/23 15:16:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/04/23 04:11:00 #24934400
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_091339_492502_9D69F435 
X-CRM114-Status: GOOD (  11.06  )
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

From: George Stark <GNStark@sberdevices.ru>

The chip has 3 dual channel PWM modules AB, CD, EF those can be
connected to various digital I/O pins.

Each of 6 PWM is driven by individually selected clock parent and
8-bit divider. The PWM signal is generated using two 16-bit counters.

Signed-off-by: George Stark <GNStark@sberdevices.ru>
Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
---

This patch depends on [1].

Links:
    [1] https://lore.kernel.org/linux-pwm/20240423161006.2522351-1-gnstark@salutedevices.com/T/#t

 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 212 ++++++++++++++++++++++
 1 file changed, 212 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index 6caeb97d6d3e..641180514bce 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -307,6 +307,188 @@ mux {
 					};
 				};

+				pwm_a_pins1: pwm-a-pins1 {
+					mux {
+						groups = "pwm_a_x6";
+						function = "pwm_a";
+					};
+				};
+
+				pwm_a_pins2: pwm-a-pins2 {
+					mux {
+						groups = "pwm_a_x7";
+						function = "pwm_a";
+					};
+				};
+
+				pwm_a_pins3: pwm-a-pins3 {
+					mux {
+						groups = "pwm_a_f10";
+						function = "pwm_a";
+					};
+				};
+
+				pwm_a_pins4: pwm-a-pins4 {
+					mux {
+						groups = "pwm_a_f6";
+						function = "pwm_a";
+					};
+				};
+
+				pwm_a_pins5: pwm-a-pins5 {
+					mux {
+						groups = "pwm_a_a";
+						function = "pwm_a";
+					};
+				};
+
+				pwm_b_pins1: pwm-b-pins1 {
+					mux {
+						groups = "pwm_b_x";
+						function = "pwm_b";
+					};
+				};
+
+				pwm_b_pins2: pwm-b-pins2 {
+					mux {
+						groups = "pwm_b_f";
+						function = "pwm_b";
+					};
+				};
+
+				pwm_b_pins3: pwm-b-pins3 {
+					mux {
+						groups = "pwm_b_a";
+						function = "pwm_b";
+					};
+				};
+
+				pwm_c_pins1: pwm-c-pins1 {
+					mux {
+						groups = "pwm_c_x";
+						function = "pwm_c";
+					};
+				};
+
+				pwm_c_pins2: pwm-c-pins2 {
+					mux {
+						groups = "pwm_c_f3";
+						function = "pwm_c";
+					};
+				};
+
+				pwm_c_pins3: pwm-c-pins3 {
+					mux {
+						groups = "pwm_c_f8";
+						function = "pwm_c";
+					};
+				};
+
+				pwm_c_pins4: pwm-c-pins4 {
+					mux {
+						groups = "pwm_c_a";
+						function = "pwm_c";
+					};
+				};
+
+				pwm_d_pins1: pwm-d-pins1 {
+					mux {
+						groups = "pwm_d_x15";
+						function = "pwm_d";
+					};
+				};
+
+				pwm_d_pins2: pwm-d-pins2 {
+					mux {
+						groups = "pwm_d_x13";
+						function = "pwm_d";
+					};
+				};
+
+				pwm_d_pins3: pwm-d-pins3 {
+					mux {
+						groups = "pwm_d_x10";
+						function = "pwm_d";
+					};
+				};
+
+				pwm_d_pins4: pwm-d-pins4 {
+					mux {
+						groups = "pwm_d_f";
+						function = "pwm_d";
+					};
+				};
+
+				pwm_e_pins1: pwm-e-pins1 {
+					mux {
+						groups = "pwm_e_p";
+						function = "pwm_e";
+					};
+				};
+
+				pwm_e_pins2: pwm-e-pins2 {
+					mux {
+						groups = "pwm_e_x16";
+						function = "pwm_e";
+					};
+				};
+
+				pwm_e_pins3: pwm-e-pins3 {
+					mux {
+						groups = "pwm_e_x14";
+						function = "pwm_e";
+					};
+				};
+
+				pwm_e_pins4: pwm-e-pins4 {
+					mux {
+						groups = "pwm_e_x2";
+						function = "pwm_e";
+					};
+				};
+
+				pwm_e_pins5: pwm-e-pins5 {
+					mux {
+						groups = "pwm_e_f";
+						function = "pwm_e";
+					};
+				};
+
+				pwm_e_pins6: pwm-e-pins6 {
+					mux {
+						groups = "pwm_e_a";
+						function = "pwm_e";
+					};
+				};
+
+				pwm_f_pins1: pwm-f-pins1 {
+					mux {
+						groups = "pwm_f_b";
+						function = "pwm_f";
+					};
+				};
+
+				pwm_f_pins2: pwm-f-pins2 {
+					mux {
+						groups = "pwm_f_x";
+						function = "pwm_f";
+					};
+				};
+
+				pwm_f_pins3: pwm-f-pins3 {
+					mux {
+						groups = "pwm_f_f4";
+						function = "pwm_f";
+					};
+				};
+
+				pwm_f_pins4: pwm-f-pins4 {
+					mux {
+						groups = "pwm_f_f12";
+						function = "pwm_f";
+					};
+				};
+
 				sdio_pins: sdio {
 					mux0 {
 						groups = "sdcard_d0_x",
@@ -648,6 +830,26 @@ uart_AO_B: serial@2000 {
 				status = "disabled";
 			};

+			pwm_ab: pwm@2400 {
+				compatible = "amlogic,meson-a1-pwm";
+				reg = <0x0 0x2400 0x0 0x20>;
+				#pwm-cells = <3>;
+				clocks = <&clkc_periphs CLKID_PWM_A>,
+					 <&clkc_periphs CLKID_PWM_B>;
+				power-domains = <&pwrc PWRC_I2C_ID>;
+				status = "disabled";
+			};
+
+			pwm_cd: pwm@2800 {
+				compatible = "amlogic,meson-a1-pwm";
+				reg = <0x0 0x2800 0x0 0x20>;
+				#pwm-cells = <3>;
+				clocks = <&clkc_periphs CLKID_PWM_C>,
+					 <&clkc_periphs CLKID_PWM_D>;
+				power-domains = <&pwrc PWRC_I2C_ID>;
+				status = "disabled";
+			};
+
 			saradc: adc@2c00 {
 				compatible = "amlogic,meson-g12a-saradc",
 					"amlogic,meson-saradc";
@@ -732,6 +934,16 @@ sec_AO: ao-secure@5a20 {
 				amlogic,has-chip-id;
 			};

+			pwm_ef: pwm@5400 {
+				compatible = "amlogic,meson-a1-pwm";
+				reg = <0x0 0x5400 0x0 0x20>;
+				#pwm-cells = <3>;
+				clocks = <&clkc_periphs CLKID_PWM_E>,
+					 <&clkc_periphs CLKID_PWM_F>;
+				power-domains = <&pwrc PWRC_I2C_ID>;
+				status = "disabled";
+			};
+
 			clkc_pll: pll-clock-controller@7c80 {
 				compatible = "amlogic,a1-pll-clkc";
 				reg = <0 0x7c80 0 0x18c>;
--
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
