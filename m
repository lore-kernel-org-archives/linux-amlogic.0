Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6547DC727A0
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Aug 2023 21:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jzijE6AUf5p6NNmV00E+WL3Dcj3LfNflZtqfqk60y7A=; b=XoIXHaT66HnBGO
	yqYm8Zs1ehvrcIBxakJwr4RLoOsqGc1PwAZc9JygsPgyhvJn3zgvqFqsCkN6CVFjuXjrkuP0kfZfh
	Oz41ATxl8Z2wHebbHTX+xm4hTLbzC+jssNoT9sO75GL+e/R1O1g4xc7IF3qAjfWrjvJayxMBvMEb6
	hT3OWxOhZkBC8tT60D2f8P/bo/efqt+3sRx6DNCr3zamOtBhbdJkOIFiv3MvZc5RON528nH5Ev7eR
	4rIgyu3FOGeq3Hd3FZeqFHTbtCPpUMNdGexa0TjGdABcc/kAXoakr/mw0TzEOF4c6SbX1hpd/2ABY
	f0pd2RgSAdTUk2dfBgwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYvXl-001aeC-0C;
	Wed, 23 Aug 2023 21:37:37 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYvWx-001a6l-2O;
	Wed, 23 Aug 2023 21:36:52 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 2E1B510000F;
	Thu, 24 Aug 2023 00:36:46 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 2E1B510000F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1692826606;
	bh=+wyddMx7gA9nub1r8PKRrOQbCaVGHVMPyA0X9m7YUaM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=cUyUKX2yZiUyFxL3gRpvsJikRwC6By32o04M5ycVk6ah4Dmuia+rDKqZOAFfPLIX+
	 sCkMlsTF58I3EyTuAPKFPjkyJ89nW2kgMljw9u5BoJwA7DOtBNR6zgfeHfrVVjvWXV
	 z0A17kecuQ9pUHwb8vvKSmFcZvmTAFJkX4M1BEAe4QczDZx7LvaQm7CZ+hl6rxjKy9
	 L2Gmt+1CQb9bGKLXBXvTALjkJLp3IGyqG0tXfU0RQvf8IRsVxit+PYJ0TGpquDCS6k
	 u+VXeBi01A5bQN2C1MHk6pfhlL+zKR1fD4soR1WvImhTGeC12ouOjUCKxm6ghDtQf+
	 mpe+b7lGYZ7QA==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 24 Aug 2023 00:36:45 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 24 Aug 2023 00:36:42 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <conor+dt@kernel.org>
CC: <kernel@sberdevices.ru>, <sdfw_system_team@sberdevices.ru>,
	<rockosov@gmail.com>, <linux-amlogic@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, Jan
 Dakinevich <yvdakinevich@sberdevices.ru>, Dmitry Rokosov
	<ddrokosov@sberdevices.ru>
Subject: [PATCH v2 10/15] arm64: dts: meson: a1: add eMMC controller and its pins
Date: Thu, 24 Aug 2023 00:36:25 +0300
Message-ID: <20230823213630.12936-11-ddrokosov@sberdevices.ru>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20230823213630.12936-1-ddrokosov@sberdevices.ru>
References: <20230823213630.12936-1-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 179413 [Aug 23 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 527 527 5bb611be2ca2baa31d984ccbf4ef4415504fc308, {Tracking_smtp_not_equal_from}, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;100.64.160.123:7.1.2, FromAlignment: n, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/08/23 18:49:00 #21688451
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_143648_172001_A0373DC5 
X-CRM114-Status: GOOD (  13.30  )
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

From: Jan Dakinevich <yvdakinevich@sberdevices.ru>

The definition is inspired by a similar one for AXG SoC family.
'sdio_pins' and 'sdio_clk_gate_pins' pinctrls are supposed to be used as
"default" and "clk-gate" in board-specific device trees.

During initialization 'meson-gx' driver sets clock to safe low-frequency
value (400kHz). However, both source clocks ("clkin0" and "clkin1") are
high-frequency by default, and using of eMMC's internal divider is not
enough to achieve so low values. To provide low-frequency source,
reparent "sd_emmc_sel2" clock using 'assigned-clocks' property.

Signed-off-by: Jan Dakinevich <yvdakinevich@sberdevices.ru>
Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 43 +++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index 1cc34fe003af..6968fbd33348 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -142,6 +142,32 @@ mux {
 						bias-pull-down;
 					};
 				};
+
+				sdio_pins: sdio {
+					mux0 {
+						groups = "sdcard_d0_x",
+							 "sdcard_d1_x",
+							 "sdcard_d2_x",
+							 "sdcard_d3_x",
+							 "sdcard_cmd_x";
+						function = "sdcard";
+						bias-pull-up;
+					};
+
+					mux1 {
+						groups = "sdcard_clk_x";
+						function = "sdcard";
+						bias-disable;
+					};
+				};
+
+				sdio_clk_gate_pins: sdio-clk-gate {
+					mux {
+						groups = "sdcard_clk_x";
+						function = "sdcard";
+						bias-pull-down;
+					};
+				};
 			};
 
 			gpio_intc: interrupt-controller@440 {
@@ -208,6 +234,23 @@ clkc_pll: pll-clock-controller@7c80 {
 					 <&clkc_periphs CLKID_HIFIPLL_IN>;
 				clock-names = "fixpll_in", "hifipll_in";
 			};
+
+			sd_emmc: sd@10000 {
+				compatible = "amlogic,meson-axg-mmc";
+				reg = <0x0 0x10000 0x0 0x800>;
+				interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clkc_periphs CLKID_SD_EMMC_A>,
+					 <&clkc_periphs CLKID_SD_EMMC>,
+					 <&clkc_pll CLKID_FCLK_DIV2>;
+				clock-names = "core",
+					      "clkin0",
+					      "clkin1";
+				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_SEL2>;
+				assigned-clock-parents = <&xtal>;
+				resets = <&reset RESET_SD_EMMC_A>;
+				power-domains = <&pwrc PWRC_SD_EMMC_ID>;
+				status = "disabled";
+			};
 		};
 
 		usb: usb@fe004400 {
-- 
2.36.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
