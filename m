Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE4C4C433FE
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Nov 2022 02:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EFZP9ie15PnA0eBNiGFjiHkLrVAdgZQ1VQeWkZIBoH8=; b=vKo9SZDGOcggK4
	CzCNolu2o0d9sbcsaKUJZ608ZsiF6dwonVhJP665oL5BnqQzieWYAf8W8e3Q0GS8DttzSUGVwhoQk
	9A58Oz6UvNQGrt4eT3tvVdihoU/kTrLB/oWGUGcVTdhmjCc7uk7jg7oBcxeuNLwzNOchyjNsX4Dxn
	FKbm99IOAsh8TdDoXzSmXsHphtKvz3kt3bOnk2CfX0S9s30RLPJ1fxjzfLl+7ZbWU0s/JbGcv4KSX
	imOW94A48guvDxe4kvDzD0xljPpG6awOk0z60CQSq6DUeKvK6fP68Sk4aSMnXR8SG7VVbM2Bze9o4
	utgK9PtkYNzbVXvefu+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxfKF-00CxzF-7G; Wed, 23 Nov 2022 02:17:23 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxfJD-00CxL5-4j; Wed, 23 Nov 2022 02:16:20 +0000
Received: from droid06.amlogic.com (10.18.11.248) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Wed, 23 Nov 2022
 10:16:03 +0800
From: Yu Tu <yu.tu@amlogic.com>
To: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Neil
 Armstrong <narmstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
CC: <kelvin.zhang@amlogic.com>, Yu Tu <yu.tu@amlogic.com>
Subject: [PATCH V5 4/4] arm64: dts: meson: add S4 Soc Peripheral clock controller in DT
Date: Wed, 23 Nov 2022 10:13:46 +0800
Message-ID: <20221123021346.18136-5-yu.tu@amlogic.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20221123021346.18136-1-yu.tu@amlogic.com>
References: <20221123021346.18136-1-yu.tu@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.18.11.248]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_181619_214952_C4FCA264 
X-CRM114-Status: UNSURE (   7.01  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Added information about the S4 SOC Peripheral Clock controller in DT.

Signed-off-by: Yu Tu <yu.tu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 26 +++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index bd9c2ef83314..e7fab6e400be 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -6,6 +6,8 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/clock/amlogic,s4-pll-clkc.h>
+#include <dt-bindings/clock/amlogic,s4-peripherals-clkc.h>
 
 / {
 	cpus {
@@ -100,6 +102,30 @@ clkc_pll: clock-controller@8000 {
 				#clock-cells = <1>;
 			};
 
+			clkc_periphs: clock-controller {
+				compatible = "amlogic,s4-peripherals-clkc";
+				reg = <0x0 0x0 0x0 0x49c>;
+				clocks = <&clkc_pll CLKID_FCLK_DIV2>,
+					<&clkc_pll CLKID_FCLK_DIV2P5>,
+					<&clkc_pll CLKID_FCLK_DIV3>,
+					<&clkc_pll CLKID_FCLK_DIV4>,
+					<&clkc_pll CLKID_FCLK_DIV5>,
+					<&clkc_pll CLKID_FCLK_DIV7>,
+					<&clkc_pll CLKID_HIFI_PLL>,
+					<&clkc_pll CLKID_GP0_PLL>,
+					<&clkc_pll CLKID_MPLL0>,
+					<&clkc_pll CLKID_MPLL1>,
+					<&clkc_pll CLKID_MPLL2>,
+					<&clkc_pll CLKID_MPLL3>,
+					<&clkc_pll CLKID_HDMI_PLL>,
+					<&xtal>;
+				clock-names = "fclk_div2", "fclk_div2p5", "fclk_div3",
+						"fclk_div4", "fclk_div5", "fclk_div7",
+						"hifi_pll", "gp0_pll", "mpll0", "mpll1",
+						"mpll2", "mpll3", "hdmi_pll", "xtal";
+				#clock-cells = <1>;
+			};
+
 			periphs_pinctrl: pinctrl@4000 {
 				compatible = "amlogic,meson-s4-periphs-pinctrl";
 				#address-cells = <2>;
-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
