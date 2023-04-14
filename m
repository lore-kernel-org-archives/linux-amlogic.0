Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A753C77B6E
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Apr 2023 15:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OU2UDxEAQABHM1uMtWGe/B3XAqkopp1IpvWy2tJ/B4w=; b=o3Uc1SRcR1O+nI
	noRh57y4Or6qpN+0MqSTF4Am3Taa1l5nlBgGRJqvycwXOW7XDHYkMXffdIdDR/ffXNcWvGe6UZYqz
	Mvv227v7+5NfVewQFtrzrgBSF2JGHPRXuFDoNM/dPwK2unV6qv9/6ozi+WhXNkpfy2xblki2DSFnk
	sfvbuCOOs0bczr2HVO59DBqxNzphOdPkr8AHwN0z8G9ubVri1geLRAZ0FMD+BEh3Nvr/iRRV/BcIJ
	g7/oL9Au7dAvaEinWby4TzNRR+n+ocosDMSvW9yPknUg8QAnZbOER2Bw1nrL8P+v06E+0P1OwXCs9
	JzlL3UWn6psuExdxaHgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnLIK-009wvX-2P;
	Fri, 14 Apr 2023 15:25:00 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnLI2-009wjE-36;
	Fri, 14 Apr 2023 15:24:44 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id C972E5FD28;
	Fri, 14 Apr 2023 18:24:35 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1681485875;
	bh=lYTwixrqbd9SStEuaH+MOse4j7UjK4ooo6t7FaqVmeA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=bF8ixADUwckraKrGckmTlpKLzIPe2taZI4ZDH36oDfoCLnHmMQY+Q6IX6ktbuH9Fj
	 b3PkRnF9hGxtw7tAn5kdAb2tx4+RGui2lvuWv6LCMzF2WzRRA0XV1acTu9Yll2uj3K
	 iSex5JgZ05czVfj3KPq3hNQUPWMNL/knmpGQYQtp1Y5xTKCmrfszqQ9iqAhBAa7ncG
	 WIqmXhWhjbPmxzig7uJFhw8KNl3HycaQgxyCZbrtCY4abqCmAYcaVo7IJ/rDVGC6rL
	 ntgemjifCH6Wypv+RuFyZn2wMTbHzWOY+sxLGz4WsuDB0S8ylOEtwdZIjfa9eg+RNh
	 Ojv7Qq5tMTO7A==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Fri, 14 Apr 2023 18:24:35 +0300 (MSK)
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <mturquette@baylibre.com>,
	<vkoul@kernel.org>, <kishon@kernel.org>, <hminas@synopsys.com>,
	<Thinh.Nguyen@synopsys.com>
CC: <yue.wang@amlogic.com>, <hanjie.lin@amlogic.com>, <kernel@sberdevices.ru>,
	<rockosov@gmail.com>, <linux-usb@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, Dmitry Rokosov <ddrokosov@sberdevices.ru>
Subject: [PATCH v1 5/5] arm64: dts: meson: a1: support USB controller in OTG mode
Date: Fri, 14 Apr 2023 18:24:23 +0300
Message-ID: <20230414152423.19842-6-ddrokosov@sberdevices.ru>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20230414152423.19842-1-ddrokosov@sberdevices.ru>
References: <20230414152423.19842-1-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/04/14 08:08:00 #21104846
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_082443_363137_0D19E520 
X-CRM114-Status: UNSURE (   8.23  )
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

Amlogic A1 SoC family has USB2.0 controller based on dwc2 and dwc3
heads. It supports otg/host/peripheral modes.

Signed-off-by: Yue Wang <yue.wang@amlogic.com>
Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 59 +++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index ae7d39cff07a..02af0aac6780 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -8,6 +8,8 @@
 #include <dt-bindings/gpio/meson-a1-gpio.h>
 #include <dt-bindings/clock/amlogic,a1-pll-clkc.h>
 #include <dt-bindings/clock/amlogic,a1-clkc.h>
+#include <dt-bindings/power/meson-a1-power.h>
+#include <dt-bindings/reset/amlogic,meson-a1-reset.h>
 
 / {
 	compatible = "amlogic,a1";
@@ -169,6 +171,17 @@ gpio_intc: interrupt-controller@0440 {
 				amlogic,channel-interrupts =
 					<49 50 51 52 53 54 55 56>;
 			};
+
+			usb2_phy1: phy@4000 {
+				compatible = "amlogic,a1-usb2-phy";
+				clocks = <&clkc CLKID_USB_PHY_IN>;
+				clock-names = "xtal";
+				reg = <0x0 0x4000 0x0 0x60>;
+				resets = <&reset RESET_USBPHY>;
+				reset-names = "phy";
+				#phy-cells = <0>;
+				power-domains = <&pwrc PWRC_USB_ID>;
+			};
 		};
 
 		gic: interrupt-controller@ff901000 {
@@ -192,6 +205,52 @@ spifc: spi@fd000400 {
 			#size-cells = <0>;
 			status = "disabled";
 		};
+
+		usb: usb@fe004400 {
+			status = "disabled";
+			compatible = "amlogic,meson-a1-usb-ctrl";
+			reg = <0x0 0xfe004400 0x0 0xa0>;
+			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			clocks = <&clkc CLKID_USB_CTRL>,
+				 <&clkc CLKID_USB_BUS>,
+				 <&clkc CLKID_USB_CTRL_IN>;
+			clock-names = "usb_ctrl", "usb_bus", "xtal_usb_ctrl";
+			resets = <&reset RESET_USBCTRL>;
+			reset-name = "usb_ctrl";
+
+			dr_mode = "otg";
+
+			phys = <&usb2_phy1>;
+			phy-names = "usb2-phy1";
+
+			dwc2: usb@ff500000 {
+				compatible = "amlogic,meson-a1-usb", "snps,dwc2";
+				reg = <0x0 0xff500000 0x0 0x40000>;
+				interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usb2_phy1>;
+				phy-names = "usb2_phy";
+				clocks = <&clkc CLKID_USB_PHY>;
+				clock-names = "otg";
+				dr_mode = "peripheral";
+				g-rx-fifo-size = <192>;
+				g-np-tx-fifo-size = <128>;
+				g-tx-fifo-size = <128 128 16 16 16>;
+			};
+
+			dwc3: usb@ff400000 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0xff400000 0x0 0x100000>;
+				interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+				dr_mode = "host";
+				snps,dis_u2_susphy_quirk;
+				snps,quirk-frame-length-adjustment = <0x20>;
+				snps,parkmode-disable-ss-quirk;
+			};
+		};
 	};
 
 	timer {
-- 
2.36.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
